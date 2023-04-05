Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330FA6D7212
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 03:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7AB10E316;
	Wed,  5 Apr 2023 01:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE7310E316
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 01:35:56 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g19so31554609lfr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 18:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680658554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UwyKfYot14ilHFAuMsDSrEnz1jRBc3hhgB3iT23xYhE=;
 b=ONIpd1vjARZP+35nzzjgfUh4PEVlWWC35WPRmcVal4ZdGeEvj9PqWXFJH5xXCyExCI
 qMf0C7IU9UAHRUV0I9sN3QPuebaOsuftGBUzKouXsZQQB/HgkdTB2LmwdGSFZAFk18TC
 7Z0X2Maidg3ZYhOWLfRXsScJyJ+J9KZqpkE9iqiIUEIex5NxKxBls0UOuIv9kAmJLRD9
 H2xybN1ynIak8Ec8VS5zDV3TmXdcyaO56zSaYS3XNTGaBCPluAvYufSRxmyIKCJFeQYl
 nSzAUmZrQdRmpELm4iwubEZC1cKmlu41B7hoJnriKdLcsghZT0dCNgqeYWjBZCNbGI/q
 YUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680658554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UwyKfYot14ilHFAuMsDSrEnz1jRBc3hhgB3iT23xYhE=;
 b=h22nQl4lc97d2GSjl4D6YXq4XIiRcmoePCsaUpckYMHYQyu+tqNf3RRYZ2mHt+00B/
 m+mvYqsXeqx5urJULyFbJIdU3Tcd4jlAEj7Sv5gbwVrgM4jqTYWMoal6Z4JVZ5zV2JoQ
 tudd5WYviG/pjsEO7hzVt0RKRzd2NEApTfRpzj89hYGMxTWBSERYvjlte+Ac7+udBuiu
 5CpCM5doi4VVvDNui2wvZJTpqRn4T+f6zsFozPu2jmZ+ADRsXYxd3al2cMxL6oGaCDus
 zIQCnrRWVhxG6RbseWfrcJtOyJZkFYwyzi+K/LxsHeUSISGSW9GcOhfT0epYjylcn4dg
 CtuQ==
X-Gm-Message-State: AAQBX9e44kLIBLo5PTT9PyrDCA2NwdbZVV+mtjYr/UXAQWxOTsvaxEeC
 kDQygtotjznetwD4DsSpQxmeyQ==
X-Google-Smtp-Source: AKy350boE/H6gPEad6PwVsvSiLw29ItUe8nLR83QFFV6AmP5ydeMXJNTR7nzAlkA1vPgqFHsALYpgg==
X-Received: by 2002:ac2:5a0c:0:b0:4e8:43a4:2baf with SMTP id
 q12-20020ac25a0c000000b004e843a42bafmr1009075lfn.33.1680658554618; 
 Tue, 04 Apr 2023 18:35:54 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v26-20020ac2561a000000b004cb8de497ffsm2572326lfd.154.2023.04.04.18.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 18:35:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/8] drm/msm: Convert fbdev to DRM client
Date: Wed,  5 Apr 2023 04:35:51 +0300
Message-Id: <168065850333.1260361.14774983089161239922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403124538.8497-1-tzimmermann@suse.de>
References: <20230403124538.8497-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 03 Apr 2023 14:45:30 +0200, Thomas Zimmermann wrote:
> Convert msm' fbdev code to struct drm_client. Replaces the current
> ad-hoc integration. The conversion includes a number of cleanups. As
> with most other drivers' fbdev emulation, fbdev in msm is now just
> another DRM client that runs after the DRM device has been registered.
> 
> Once all drivers' fbdev emulation has been converted to struct drm_client,
> we can attempt to add additional in-kernel clients. A DRM-based dmesg
> log or a bootsplash are commonly mentioned. DRM can then switch easily
> among the existing clients if/when required.
> 
> [...]

Applied, thanks!

[1/8] drm/msm: Include <linux/io.h>
      https://gitlab.freedesktop.org/lumag/msm/-/commit/62c58ffe011d
[2/8] drm/msm: Clear aperture ownership outside of fbdev code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4de16da5b40
[3/8] drm/msm: Remove fb from struct msm_fbdev
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a5ddc0f1a7bc
[4/8] drm/msm: Remove struct msm_fbdev
      https://gitlab.freedesktop.org/lumag/msm/-/commit/09cbdbafbe9f
[5/8] drm/msm: Remove fbdev from struct msm_drm_private
      https://gitlab.freedesktop.org/lumag/msm/-/commit/37e8bad3ae5d
[6/8] drm/msm: Move module parameter 'fbdev' to fbdev code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2fa4748b5ad8
[7/8] drm/msm: Initialize fbdev DRM client
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7e563538d210
[8/8] drm/msm: Implement fbdev emulation as in-kernel client
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5ba5b96d3327

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
