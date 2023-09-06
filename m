Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C941679365A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 09:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39E110E122;
	Wed,  6 Sep 2023 07:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1E910E58B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 07:34:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso2772409f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 00:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693985688; x=1694590488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CMSRLHXlFi+3qNI1oF/iiV7PXrA/nSM0CvaGy0w7SXc=;
 b=NaBkF33vbTET3jc7DGJBjlmhVvLrUHmkjpfoQ9Y/prsRFCQjEQaU1NULjWmT1bOimL
 rg+csFt+B/FyPycukGjsCWHSxY/L1XpLm7CdfF4LpA+XcgbVlsWK32kQbzzJGaWefzQF
 rhnS9eI8PLD2IR4uyPdxDMaoMS6VrXQMdn/BklHx6iKmQ8FtByGbAASw4ybyyrWm9Xn4
 SqH+SS/Uc4ZeDFHa5DQp4gJels1UI13Wrh82IL82CYM/X+8NzwqF28tuhrsOwmptlDJ4
 ze9GVPz5f5mkAwp687SjKdAGEoWlfPXETERDAplk8wl5NHDfky7v63J9Us9mBzkif++h
 CPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693985688; x=1694590488;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CMSRLHXlFi+3qNI1oF/iiV7PXrA/nSM0CvaGy0w7SXc=;
 b=Vqrp1PXvGQNGFNFA4vJ2uD/9sgQNsa/r6w0uK+twh84WQCJSK+xTmkYRBgxwOOSvUO
 RO6ZTVZX14VvWRhxCm2pUVpHWrwwv3V8DuvwV1ll5gp63UgP+CX/BQLPTeu9qbToOGyf
 9iLB5vMCWStL4sp+FvMkPduaW01vVlujVPyWxi2W8LJjR8jX5MYtgdsMTh+gEuLGlNlj
 b7hwlLCQH8p/Hd/NLckAlVQngazpw1sp+opr30XcEC8Nk6Ja2b+QhTWy8DXGLRcwhbhQ
 QnAafDPEy/DN7ptvMlBT1LmDE+4P7HZ+SrutjptBMgxpGOmREJNjEgQP+wlkM3AA97NU
 MGZg==
X-Gm-Message-State: AOJu0YwrTseBLKPZE6fdO30MPPO1Spt3hu/gyIlhvSitQ1A9gL+4SkCI
 BfZD5LZ+XHf1yK9+QtRiJ6I+6Q==
X-Google-Smtp-Source: AGHT+IE3sb3hti0p58bOyqh94e0W5av0EGUu5XQJfY0ge33yXzp+ulTksbLVlMy+IMnfpoe6+6+qqg==
X-Received: by 2002:a5d:4fc8:0:b0:31a:d8be:d6f4 with SMTP id
 h8-20020a5d4fc8000000b0031ad8bed6f4mr1329142wrw.10.1693985688339; 
 Wed, 06 Sep 2023 00:34:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adfe9d0000000b00317e77106dbsm19508192wrn.48.2023.09.06.00.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 00:34:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230831225738.26527-1-quic_jesszhan@quicinc.com>
References: <20230831225738.26527-1-quic_jesszhan@quicinc.com>
Subject: Re: [PATCH] MAINTAINERS: Add Jessica as a reviewer for drm/panel
Message-Id: <169398568750.126904.4693079366206552749.b4-ty@linaro.org>
Date: Wed, 06 Sep 2023 09:34:47 +0200
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
Cc: dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 sam@ravnborg.org, quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 31 Aug 2023 15:57:36 -0700, Jessica Zhang wrote:
> As I participate more actively in the drm/panel subsystem, I would
> like to get notified about new changes in this area.
> 
> Since I have contributed and continue to contribute to drm/panel,
> add myself as a reviewer for the DRM panel drivers to help the review
> process
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] MAINTAINERS: Add Jessica as a reviewer for drm/panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6bd3d8da51ca1ec97c724016466606aec7739b9f

-- 
Neil

