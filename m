Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C70BAF62E
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D9110E68C;
	Wed,  1 Oct 2025 07:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BmhMYRrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3520F10E2FA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:23:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-46e4f2696bdso46308865e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 00:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759303408; x=1759908208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9KnLYLMgAo6iCMaJHkFXrrPXMlbYFJ8tsuzyv/2Xns=;
 b=BmhMYRrnPMIfD6U9OT7hFktlyJMBSNMYeg8UfAA5e/OjIeY5ghPqycn2iXBpzb95Fn
 U+2UcP51Xa2Be/LNdvixnveF3BWkU4xsSYkyWebeFNWJ5mYoEbjZQBWwt74QH52MwrL5
 JNp+0fHFTkSATpSGcisvi8igYciU8+zsbVIG9pUF5gDAguHwalE0u6+gQH/Gj6t9OOKz
 qMjQDXW6bRo9jXQKVr8BZZBnxwovNPKlQw3TKV0elaOcncGyKqlYJMXBtFofPhNBRFZ9
 Uz2I2ZmvUx2gXmYN6TftA3quWpQyml/hmis/LjE2YNKvkNfWUMEt02JIDT1jNe24l0nu
 cSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759303408; x=1759908208;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/9KnLYLMgAo6iCMaJHkFXrrPXMlbYFJ8tsuzyv/2Xns=;
 b=AM16CYcvH52+dMkwYZhb/04DQCj9i6pAuOwVnO04kfw7zNfVbqRWn2nLgYBTPJTQlc
 Kut75ZOCapxBBJn7qYCSA9dKIfxdCMpfdpsCi5LO18ZTvd2aBTjyDQpbbW8fgVArXaup
 gpfoE4+tCZQMkTxf8a+CA4EQhpVW5WfmiwWIbodOZZsQ/CE+2VhDSu+SnZasWnm4qLqO
 lP9I0t14Gt+aXJ/b9x5aaPVFQKZq5sO5XyK/4WknE1NgFGAD0WhWVGz5u9EuqgqEYvlS
 taggzgYuVht9DPt9c/QYwic1UZIVkgOcs75pSWzrl7ZuQBDhjewXTVqNJTIyUt3ZdlNr
 k4Dg==
X-Gm-Message-State: AOJu0YzCLV/Ed7vV8hJ0s168A2egv2ptBCdShXBj1g+3vsPAYYqSeeKZ
 3JfMwGkmrZKNi4qx3amv7tFxewjdXPCV4EoLQmY/KOFnMxn7r74rFYzrcgKZoUnzZTM=
X-Gm-Gg: ASbGncuEyS+OqJc6SxDXnOkXqMmTQB7KFbAsjo4Mdfk33NBDgAiISK1IitGLlMwoYbJ
 jMU3GP4bquXlyJy4RKJj091JUHMIr+SwKoK/8sKDks2152DP9ydwb+nmsCBRmntbAwscdmpPJji
 mC2V2aUBEwyVE8/KGw3SUEb7VdGsJDEy3qER1+RjtdDTYiPzTCjcQgPclXKkleBBzRT6T+fSW9I
 fSjVY1uZk57CMI/80IdYxWd9QAOVubId3df+9MCCHApc8APuhHaNvrNQHG3bDkN2J06eTKLMcAS
 1LWOjtkLr+6fBSkP0HfA0FBFt3SBAOwPbUl2nRiJZGVEnxxgU04bS2AXP2rTVLMNsPLtAHrDgay
 aJ9ogXDm2kiZMKFqVinpNIZBaR8V7HKAhQu48HRh+l2J5zUvrVcnqf26AVtspusj45MY=
X-Google-Smtp-Source: AGHT+IEzWn4BmhnfZrcJBF3Mp5fHWEl4zVgZAe/Sje2YTE+1fAM2pKPiZRQH0Ot9w4yf2UYbaMO79Q==
X-Received: by 2002:a05:600d:61cb:b0:46e:4b8b:75f2 with SMTP id
 5b1f17b1804b1-46e61228692mr23727735e9.16.1759303407552; 
 Wed, 01 Oct 2025 00:23:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b8507sm25805335e9.3.2025.10.01.00.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 00:23:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>
In-Reply-To: <20250814-topic-x1e80100-t14s-oled-dp-brightness-v7-1-b3d7b4dfe8c5@linaro.org>
References: <20250814-topic-x1e80100-t14s-oled-dp-brightness-v7-1-b3d7b4dfe8c5@linaro.org>
Subject: Re: [PATCH v7] drm/dp: clamp PWM bit count to advertised MIN and
 MAX capabilities
Message-Id: <175930340683.467410.13115461140906052706.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:23:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 14 Aug 2025 16:16:09 +0200, Neil Armstrong wrote:
> According to the eDP specification (VESA Embedded DisplayPort Standard
> v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> the MIN value as the effective PWM bit count.
> 
> This commit updates the logic to clamp the reported
> DP_EDP_PWMGEN_BIT_COUNT to the range defined by _CAP_MIN and _CAP_MAX.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/68a7c52fa9e778bda45ed0b2e83a0bf2ea41b88c

-- 
Neil

