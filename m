Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CCC9F2410
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 14:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D7410E1BD;
	Sun, 15 Dec 2024 13:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nViVjC7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BECA10E21F
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 13:10:47 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-3035210e2d1so2706101fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 05:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734268246; x=1734873046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ju05ziYlwbIpCgtx0Bb9FPQKa5IBD6RMSsDPSFRI4ws=;
 b=nViVjC7YpXmrgG4U08r/ojPxjCAr0+Zm/cd8UVhjhY9Q5sVLG53BO25yuCqJhK7cy2
 UTEwsx3XjAVBx0N42U4XaK9pOkR84KU1X7WH69xi7EMOmdKUlAkCfRnbktLVpCfzMAGG
 3g0RViYAvCwSPw6f4kLc6UKY4XVjMg6Yk9PtBZCY1GKvp26PRdX4nfrWkMuP13SyuXG+
 vV44wqNjExm0J6DyinTPB3qcgEh1KXzsCjUUUSOAVzSlcVztVuIUcZto9nfAP5k0r+Fl
 veRaMqlgIV4NYOmB2kMsSC8jcvFKC2v3CmN9N+OjX2wyIY3R040q53wnXYEwbKfSBgtI
 KODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734268246; x=1734873046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ju05ziYlwbIpCgtx0Bb9FPQKa5IBD6RMSsDPSFRI4ws=;
 b=C51IzkTddgBIp6DdFQt76m4SAYoNpgpw3cQzyTs9KIeYo4819EP4Lo84qcaLuKUwLs
 vihh1T6gKH4rUy8P+sayxA10liO6ABdEtVn9YDlpgLxDLUU1fARIecEG3uU8NE4JJVAU
 syFtUSjPAOTn3LFWwSeN8IgVhhz9lPqzCWzpbtJ3hQ8qEs9Lm9n+466WCcc/FvbCtkKs
 vzVl8ElokF02YGb3to9NclVc05vduf7k+VDLtLmArQmUXEQJPmer3PZCuz8elzzllmzi
 FMHDIOGmuIXHtMzi1tn02lzXCq/cILuRAGyfCrZvq/gnE3+0EgBgiOmVPeci65lJP296
 i8kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEheFzT9UUH0xWoKYO8rykHiD0MU/r8pjxYjvlQILcy8K1o4hAfdCW+JEJnUDK2TgcCxQi5wWKcGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxolU7ijjrUg2H9szrhIZgC41x/Ie+joA+xNp3oR/iV7V/a7wfj
 J7T8ULBXX5MghnJhByzLdtF689p9IgoVvn2ytQstl4saAODVDi9IV6a2zRp/J5s=
X-Gm-Gg: ASbGncvezi7wtcmJGOoCHznVaQaD43NIN6toQzYj9pfJc6OQzKqllvj+lpBR5nxqFmn
 GgIIjKUzfNRQu7DcF+Lig71joVqptHdRu0jfSzPK8lDV3W2k/ahEY2M11WiVnjDLRV5HDF+VuiF
 ta4cKWGC8dLxFwzrEX6C8g2LI2M/I+EIb2AgkzdN89vXwEpvgdVBOXCFxBFqxHNTDCV+ZmW7upb
 r59QzwpXw7dbzdcKFhIno9jB1aCBsgv2GKlwS7Co8z1GrwquEUM3oP9W9fgpDChtPjcMvUt
X-Google-Smtp-Source: AGHT+IFk9r/owQGni/IpvIbzf9xRA6qONzpZz70R2mTsMxoKxfWh5BJOntsOsl8hiRXd0joBI6OGdQ==
X-Received: by 2002:a05:6512:1287:b0:540:1ca7:4fe9 with SMTP id
 2adb3069b0e04-5409054e4b0mr2641383e87.22.1734268245751; 
 Sun, 15 Dec 2024 05:10:45 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 05:10:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Connor Abbott <cwabbott0@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 0/3] drm/msm/mdss: rework UBWC registers programming
Date: Sun, 15 Dec 2024 15:10:39 +0200
Message-Id: <173426667308.2196979.1702626124443847535.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
References: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
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


On Wed, 27 Nov 2024 16:04:31 +0200, Dmitry Baryshkov wrote:
> Current way of programming of the UBWC-related registers has been
> inherited from vendor's drivers. The ubwc_static was supposed to contain
> raw data to be programmed to the hardware, but was later repurposed to
> define of the bits. As it can be seen by the commit 3e30296b374a
> ("drm/msm: fix the highest_bank_bit for sc7180") sometimes this data
> gets out of sync.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/mdss: define bitfields for the UBWC_STATIC register
      https://gitlab.freedesktop.org/lumag/msm/-/commit/43eb9a8a372b
[2/3] drm/msm/mdss: reuse defined bitfields for UBWC 2.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2cb62d9f9cf1
[3/3] drm/msm/mdss: use boolean values for macrotile_mode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dc7b16a4f055

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
