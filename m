Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5BBA4749E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 05:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A917510EA36;
	Thu, 27 Feb 2025 04:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kEkxzLyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A0210EA34
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:54 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-546210287c1so457751e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631073; x=1741235873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jQXAVAgDJ6BKpu5knilW0G0eInEdBbGOYFBZny+389w=;
 b=kEkxzLyqhdOix8fsPle9Jwfu8PbMCLVZaeoVAZ6AU5BZrBewRjpqxaUZw63wb0e4iM
 kYdHEXnpIfFg7MMPM7kpvD9AvE1Nbd7Eiz8JxGT6QFFLX3jjkgDG4c022G+o2vap3WnH
 ZQ9ujelmTvDUeRG87k5h3MO4ll3hVaTlyDg+avJUqpHhbV49EAmMvASOOzayT6R+2kd3
 ZUN4G85T5/7snLP0dIXM5wyYoge2KsK1E/FXB+qiS+gS8wa7vCeOUZ+f8SQ7W9lAJVUC
 6zol/xUX71UmWGffojeYN4dcJLw0sroQb2QU4fW4HvE77OlhAW//fm+b3QfC2U7JuJ1q
 dtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631073; x=1741235873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jQXAVAgDJ6BKpu5knilW0G0eInEdBbGOYFBZny+389w=;
 b=oOtDokhjAiqOP/awOqVLyil7DGs5YhtyVOLS8ne6DgWXW4Zc7AbVOpzileog3/bUB0
 vmAddSMeIyJRaWQq/K2wXgBU4ND1drZ9+O9SQTeV9rNv898lTyJoV5r/de0X+LV0ZfC6
 oY1HSHONzIRDvO9LO8N/S+68S2r3rif0KdoivnADs3LqSrSurRfgLROqspNRkhfOD9oB
 ieU67/VZz1xprONA8WDJIJDD/C3CeOfm+SDosjsOPrBwm+VGOurhnrG5PupHCZ9wevLK
 UszSGTBzrJ4GJ2+6m9amQMeo7/93SLZk4LvPhbTihDlmsobhShQStKEtGGGkVe+y9K3N
 xpKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbfN+MNPt6cXc/BlK4Xt8lcJMcsgfvX/RFz0vGXUkGEdNU7iQYUliEwCgXBiFlt2y4TVXPpU2K01M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw36LlgGUDzQr9MNbIzBgNgU4DBbZ3lH3iriZR6Myqq+GGUFbZT
 cqr1cvzMQMqHVTqjJBb2BBn4lDR5/dek/1c8+wheH3PaRfBcjerJg5a5Z2SGJ8Y=
X-Gm-Gg: ASbGncsg9P3vWolRnTg268dyuJaJGEY4kjEsl2qWVX5DsOrCiUpoUy2u7ewOrOoeubo
 9AhAgCyB+35mZ8pb+qVoALz/Bdo1oPXBUUHpSAfak7OqrWnkW+M2qbv+c//acQYcVuSxsFjGBPy
 Wu2hi8sfemXaGVBGzB0cTJTnJSEXhDTTRVx09Gt5u/p0WbOd2SlPZdyUJf4Q8fmWbgn/RCJMabb
 w4SQbsRAncmXwXgXl6Lgfj2WL3hVDoJYpcdeDUxRVkWB3r78TY8s1FXqx3XgX8HaYg3d+GpkmFM
 fV6wSge4A+sRmQ+2bBJtH14H8FwaV/Av2K91Den5uA==
X-Google-Smtp-Source: AGHT+IE/BaugbmI5byqUClykJvO63QUq6xSxLwwkVKoSd9babs5cKTzcwdFko7WC+SL5Xw2OEWmMdQ==
X-Received: by 2002:a05:6512:31c9:b0:545:981:1bc4 with SMTP id
 2adb3069b0e04-548392598d7mr10071939e87.38.1740631072721; 
 Wed, 26 Feb 2025 20:37:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC] drm/msm/dsi/phy: Program clock inverters in correct
 register
Date: Thu, 27 Feb 2025 06:37:28 +0200
Message-Id: <174063096232.3733075.4572201293177555361.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
References: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 29 Jan 2025 12:55:04 +0100, Krzysztof Kozlowski wrote:
> Since SM8250 all downstream sources program clock inverters in
> PLL_CLOCK_INVERTERS_1 register and leave the PLL_CLOCK_INVERTERS as
> reset value (0x0).  The most recent Hardware Programming Guide for 3 nm,
> 4 nm, 5 nm and 7 nm PHYs also mention PLL_CLOCK_INVERTERS_1.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi/phy: Program clock inverters in correct register
      https://gitlab.freedesktop.org/lumag/msm/-/commit/baf490728777

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
