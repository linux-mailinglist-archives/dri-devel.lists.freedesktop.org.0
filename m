Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01D176E2DB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F9910E0FB;
	Thu,  3 Aug 2023 08:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE9D10E0FB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:23:19 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fe24b794e5so6872815e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691050997; x=1691655797;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJMrHXaDI2jXZZ4fTi2siSIHXafUBuzV5Qg1y6pooWA=;
 b=y+v/u9a7vIxXIW2+GWqMqxQYR1oinKq8Lgt/a4XqTLYX6clqRNeDzKwBT6e7peNEyH
 LqH+n6XD1UBTjbps2wOdvzFSFDpnjJ4dhUxDgYbJtOu+GXL+6X7K14MO10V3BCHRHNgq
 baM5dcDL+xrVgho+xCSJR6iMbS2TvnOYCAkq9gY2i1FoTGnYB4auJy/+NLku08cGj+dA
 ddjxnRCD6A9uci2aiT12WIBl8CubNbkHoFJ9p0nodGL4Wt7lDgUytiSwWLJLkhNRJ6xJ
 qM4kHGsJ4bBOuqF1i0tEA8rgXih1OEXoqeeV3bNSACQcaxWTyFmi3dDG7h2R/K9Ce6fi
 kTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691050997; x=1691655797;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QJMrHXaDI2jXZZ4fTi2siSIHXafUBuzV5Qg1y6pooWA=;
 b=l6wuL2yYS4zK96dM+LbIUuUuI/UGUVwr8qgp6CwlAztzlptHPVgwRoiP3b5IhEekEp
 CcVv7ad39mQBdXTqsB01H4gF3t+UBR9dBhIVqoTm2KP5CMOBSR4WF5Rtr+zQiKi8oYvp
 iazJA65rNv7Y02cGHTJ5msqemioWvkEzd345L+3rx3sRF7HWZFpSxWH9DGYDtVDVKLC2
 IsifuLsQXo3AGWOQXwAidX4CTfp0mcPIE0ry42SsH/Bx0UBRSTa/zaiy1dmnQsSckLMy
 OnJTf9zPqC8l4gU1AdQPLaLiRdKKX77ntIF8vNEixm5I47+1DZheo6Qyu38JXzz7R5zz
 68Jg==
X-Gm-Message-State: ABy/qLbkZaHoOtsGB6jQFrHcHtnEyGP/Og/XtyO5kLOe8G/ZX5JFUuEB
 EqOreKMjtBHvIDyMHbjzsDuVog==
X-Google-Smtp-Source: APBJJlFMwEOpdx47TLNsl1lN03YDYUVk04bqgSbetYihaLvp4UQmnUd9EUCO/APSD+4OITuhnwpEhA==
X-Received: by 2002:a05:600c:40c:b0:3f9:70f:8b99 with SMTP id
 q12-20020a05600c040c00b003f9070f8b99mr6716325wmb.7.1691050997459; 
 Thu, 03 Aug 2023 01:23:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a05600c0b4100b003fe11148055sm3539994wmr.27.2023.08.03.01.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 01:23:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>
In-Reply-To: <20230802074727.1.I4036706ad5e7f45e80d41b777164258e52079cd8@changeid>
References: <20230802074727.1.I4036706ad5e7f45e80d41b777164258e52079cd8@changeid>
Subject: Re: [PATCH 1/2] drm/panel: Fix kernel-doc typo for `follower_lock`
Message-Id: <169105099663.2484653.2634988255195420764.b4-ty@linaro.org>
Date: Thu, 03 Aug 2023 10:23:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 02 Aug 2023 07:47:27 -0700, Douglas Anderson wrote:
> In the kernel doc for the `follower_lock` member of `struct drm_panel`
> there was a typo where it was called `followers_lock`. This resulted
> in a warning when making "htmldocs":
> 
>   ./include/drm/drm_panel.h:270: warning:
>   Function parameter or member 'follower_lock' not described in 'drm_panel'
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/panel: Fix kernel-doc typo for `follower_lock`
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c0571b20fca4acebd4cb5fcfd07ca4654e9d63dd
[2/2] drm/panel: Fix todo indentation for panel prepared/enabled cleanup
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1ab2ddc4afdd84632c24b23dbe67eb4ca423dcc5

-- 
Neil

