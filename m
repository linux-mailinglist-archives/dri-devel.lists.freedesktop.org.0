Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E326732F7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 08:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7C210E8CB;
	Thu, 19 Jan 2023 07:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89B210E8CB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:53:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so2970319wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 23:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u4ql8ny0e2c8GYGlU8E6PPOzsSTTeOJBXhJ/nxBRnBc=;
 b=IVdNG6AuPG+oUvekINNN34sgfLTWpkFnlW9xIJqL8B5BSZgQRbx7v93yGACjrUuayy
 oMnNuqBjfW4UF98foW1WRYsi9wibl7lVnDt9C1HUnCrnGV/b4onxpmVIvI3b3krjtV6z
 cZRgAvQNZDeVSmem2BHqG+DN5an5J/7T9VG4H/iZbXS17Iwol0y1d521wguhgWnLwIKx
 8oR9yFhoUPmlNXKr/WorHrd4rxkduVk0yhhlX6X8sjCI2ddDq+MlH6TMSYw2pD4xBpg4
 QNJu1EzviMEPnAoYxJ7NLXJW665DMvW7VOmB/JMLUZn3X0NVuLMArejIAwkdYjcqXtxO
 DZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u4ql8ny0e2c8GYGlU8E6PPOzsSTTeOJBXhJ/nxBRnBc=;
 b=KUwReCP1AaTvKDecGbqa0SiJhp5nt5x56gwGXcvuDDguwACDb9brIvWyBur7apqFFy
 DmJuhSDq6oIl7k15RfuhjCC1z3ZblSgm7aDtLWqIEZziGBf2+dBgud+eUt8tstBPr7oS
 6MKPxXMGZkYhoSR7hzI/TkupZ3unoh3ah42XaxOjou2D1jA35xGzIyR5i9avj/mIOKTJ
 LJWiSbHTdniPkVsr64m76QDf8q6ccNIHlS+SQqzAosP+KLy3p8ySUlRprmqq0kUxyhEl
 CqPUQD/1pq+sHE53qzV/H78be0U4TL8m4XkUDfzbAE/SBWiTHW4RBf/0/OM4+HAfPFzZ
 qPXA==
X-Gm-Message-State: AFqh2kqf7zDwHUy34HWv7U7uxFJURfrsVqxQBQnuexeR1z6ea10pKHhu
 nGOp26Hilp9jagARvdJtIvKpE5VgxRuiScmE4Yg=
X-Google-Smtp-Source: AMrXdXtRjEasU9FNwO3IFbAkOsnW7j7mnbtyKGP+P+W/rrBVfTqQJH8dIGsvpHTan5uP0civoaNyFQ==
X-Received: by 2002:a05:600c:4347:b0:3da:fc2c:cda8 with SMTP id
 r7-20020a05600c434700b003dafc2ccda8mr9386063wme.6.1674114833138; 
 Wed, 18 Jan 2023 23:53:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c4f4500b003dafa04ecc4sm409539wmq.6.2023.01.18.23.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:53:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20221208065538.1753666-1-alexander.stein@ew.tq-group.com>
References: <20221208065538.1753666-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm: bridge: ldb: Warn if LDB clock does not match
 requested link frequency
Message-Id: <167411483235.281169.3391332239471058242.b4-ty@linaro.org>
Date: Thu, 19 Jan 2023 08:53:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 08 Dec 2022 07:55:38 +0100, Alexander Stein wrote:
> The LDB clock needs to be exactly 7-times the pixel clock used by the
> display.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: bridge: ldb: Warn if LDB clock does not match requested link frequency
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bd43a9844bc6f78e00fdc91db47f6969d10c5ac5

-- 
Neil
