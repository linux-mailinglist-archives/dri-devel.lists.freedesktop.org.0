Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC46A12C22
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 20:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D886610E060;
	Wed, 15 Jan 2025 19:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Lr934DBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C37510E060
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 19:59:40 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so188752e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 11:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736971179; x=1737575979; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x37MGVTi+7LLCYAbiXmT4g42J1cDZJlwMsnlJFXjsC8=;
 b=Lr934DBRSkFtuY6wujOt9iUKComXCnS3hBMlVQmO/LHWU0LWw6qktpu+mytry3mvgQ
 d3ruOukSvJZcm54yyYXoFdanm+l5u+6emlCMX6a1TuLdnXsUf4MgLOXm2C5cB7i65jWZ
 KTRwyD9szkwsu8nVuPk7LS5xr3uGXk6wBSDdfU4VHec7Ms3L7l/jDqDl/ZAXhSzEmZCh
 A90atuwtAJUFCfKki8lIXgI37Q7tU47C+zgIFzskpXinY2uIuD/E3vh1ZUAG++eC7YzD
 /BqvtWzL+9vXcMzLBsomDdxnRZRd+KyAmDNFbHRpOG0eZJkHbos1Z5nfF3iyydR653Kl
 1aOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736971179; x=1737575979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x37MGVTi+7LLCYAbiXmT4g42J1cDZJlwMsnlJFXjsC8=;
 b=Cy/oqi0Y0kkOzBe82xNzoHAQWzhABfwD5QmsCsP8XAPIzZpJu8Fj4qBRlqyBHGgBD6
 goam+gnAcyhDeulCiJXAGKPpAegfumyHBe34hzspYwB3TMjY9+9cKpX1tqyuRplMBUsZ
 SdVtMBKC8ou+QgAftRUjOMdEjyNQxjwQPIcs/2jS/F9Ex2glGiYcO+cVoRSaQQw5FRKV
 n8zmZ6gWECfZZQaOjMN8GGsXRzWO5yP9scUECfy5XCwTXLUocxgO+1qgpiz12YmtiIaQ
 ZpBGBwi6SRJLKouZ6biX4OjNO3HmSB0m9ySbnhg6ydooSA1S8HaNLknjPrJFrLaBFxjv
 6/2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBZejmWLtJXd7crWLunDVqtTz6OiaUsvqlceY/w/iUINCsGMewQWbHvakun2Og4oK5mBPKItftVyo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4U+GfiTwKSFPpkdRcWiQI9YOg9xX9jbZ28Y2uankgUljSG4/a
 H0nbHJ/rCp9FzaUeB8ZimfxJl6221TojJ+qGeeScrK1u0PIW/tgSgl5zY5vgSek=
X-Gm-Gg: ASbGnctjz60EasSO0hHMeoCXlmVmiITeUgja+eAXh/0xvM1Z6dRv98OgjiJ9ygjvMnU
 OqlqSYEPKVEk3ARy4pAAn5w6xDnM3B8aBW5mguCYjAaAYzY41xWk/RAeg0/WRhfy+KRpZPqi5Xk
 Ck0bgNHQEN/0c+EIpurG1M3G2jbahu6GymNLLFB65MJu0IwRUiDgiJ4DH0sZaMB0znUClCKAeTd
 PjXMJIrO0hpV/TsiEpvI5Zutm2j5cSnjPTvAj5Gw0ZXJw+UKUSWBlfSbuBGnP0CC2KGPCPaLnX3
 kAuSh/94M+m+roQ5VvKDWgs96Rhqa6GYv/C6
X-Google-Smtp-Source: AGHT+IEgsaKsijQtzxn7rCfFidNVZj0/9WmlBcq9snlTFjWsJkPsdGTXxyCiCkpWSsFsl61eUySb8g==
X-Received: by 2002:a05:6512:1055:b0:542:91a5:1d5c with SMTP id
 2adb3069b0e04-54291a51db8mr6711480e87.8.1736971179233; 
 Wed, 15 Jan 2025 11:59:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be499fcsm2104336e87.8.2025.01.15.11.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 11:59:37 -0800 (PST)
Date: Wed, 15 Jan 2025 21:59:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] drm/msm/adreno: Add speedbin support for X1-85
Message-ID: <enykcipequ4xjykcjbkpnmtlclrbbmkhncj7fx3zy4sgmo3h4n@y3k7xgjscpfc>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
 <20250109-x1e-speedbin-b4-v1-1-009e812b7f2a@quicinc.com>
 <356986fa-e66c-4e78-ab92-2593b037ab9a@oss.qualcomm.com>
 <837602a7-bbd5-4436-ab9f-2b101bdcaac2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <837602a7-bbd5-4436-ab9f-2b101bdcaac2@quicinc.com>
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

On Thu, Jan 16, 2025 at 01:07:17AM +0530, Akhil P Oommen wrote:
> On 1/9/2025 7:27 PM, Konrad Dybcio wrote:
> > On 8.01.2025 11:42 PM, Akhil P Oommen wrote:
> >> Adreno X1-85 has an additional bit which is at a non-contiguous
> >> location in qfprom. Add support for this new "hi" bit along with
> >> the speedbin mappings.
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  5 +++++
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 15 ++++++++++++++-
> >>  2 files changed, 19 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..e2261f50aabc6a2f931d810f3637dfdba5695f43 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> @@ -1412,6 +1412,11 @@ static const struct adreno_info a7xx_gpus[] = {
> >>  			.gmu_cgc_mode = 0x00020202,
> >>  		},
> >>  		.address_space_size = SZ_256G,
> >> +		.speedbins = ADRENO_SPEEDBINS(
> >> +			{ 0,   0 },
> >> +			{ 263, 1 },
> >> +			{ 315, 0 },
> >> +		),
> >>  		.preempt_record_size = 4192 * SZ_1K,
> >>  	}, {
> >>  		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> index 75f5367e73caace4648491b041f80b7c4d26bf89..7b31379eff444cf3f8ed0dcfd23c14920c13ee9d 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> @@ -1078,7 +1078,20 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
> >>  
> >>  int adreno_read_speedbin(struct device *dev, u32 *speedbin)
> >>  {
> >> -	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
> >> +	u32 hi_bits = 0;
> >> +	int ret;
> >> +
> >> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	/* Some chipsets have MSB bits (BIT(8) and above) at a non-contiguous location */
> >> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin_hi", &hi_bits);
> >> +	if (ret != -ENOENT)
> >> +		return ret;
> >> +
> >> +	*speedbin |= (hi_bits << 8);
> > 
> > Now that we're overwriting speedbin, we should probably have some checks in
> > order to make sure somebody passing a too-wide cell to one of these won't
> > result in cripplingly-untraceable value corruption
> > 
> > I guess we could just introduce nvmem_cell_read_variable_le_u8() and call it
> > a day?
> 
> X1E is an outlier here, because this was fixed from the next chipset
> onward. For newer chipsets, we can use just the "speed_bin" node, which
> represents a contiguous 9 bits. So, just do a "WARN_ON(fls(speedbin) >
> 8)" here?

Or extend nvmem core to support non-contiguous fields.

> 
> -Akhil.
> 
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry
