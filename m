Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3491CB29064
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 21:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9098410E2B8;
	Sat, 16 Aug 2025 19:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4HlaAu7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A920110E2B8
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 19:55:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G9pl3K003406
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 19:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DcxZsjcJPbB2/vOoAnHCt2p2
 V782/z2KJdD+dGyjoAA=; b=R4HlaAu7MKhmT9Vjyk9Y5mb6c8nCw0co/MTACIKr
 xJ7tdsyC8Q5RgR3l34CKGC9hiR/Suii/YhG7fODAospZ3SuvbhFHNlKW4fCT44DE
 8ZNVkSdRAWLB2PT9dQu3QmsFwPtYVTnGyFeIL9qRteDCSmSA9x5DwiTVnCUhyjDQ
 PND+oBpOnkLbP3yg6wzlSp8UUbbN26nVJxSf8SXQYPkYiNtPQyKwjUNFPiKD34Bc
 DcX/X1QZ4ikPSZ2v3u7x7/wMt/E/anCOdXT1/Asudh1yJTizVsWG9Y8Ok1Jl8uq4
 YSIHfbI2fHvEGecf/sx0IbBmFhQF96CrZjA1NRE8SoAPeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfpf1aut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 19:55:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e8704fad73so775215485a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 12:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755374130; x=1755978930;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DcxZsjcJPbB2/vOoAnHCt2p2V782/z2KJdD+dGyjoAA=;
 b=xTwgN2LKzT7qTZpe06vlXBw4ZlbqWI5B1pNF5ZmDh/cjnmjV/tZBmworzIdswa4xM5
 HjSpg1GfUolpxI2kltgWxm1odSe1h/6R8wQoQKIFKhieCpFgmChpTQOa2hS3PherPpsq
 +R4s8ShM/d44b/A9VAvHz/SK9aoHGnwKxsiz4AWYkw/mdX2zyWL/DQgxRiWbU/Cabv4e
 EszxXzBUEa8DciCvIq1tu//E1cGkAPr3zzkeahDkEOF9Prl2yE1uOAfS/Cp5mI5ky/xh
 6gLqd3R8y5hIgeYQBQbmChpJtSR8b76BPmfY9qgzumNbhpNCoy1ivENzizcjndwn6Z3j
 29GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZaK5g/zTJnuqDBXUaAcSdCr6v8mPpoVqcsPoD65OE+lt49TpA0nYFe0dOC5XTO8/ODyJWCRzvcL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXMWYK5/t1HtWSB0X5FVABh+UoSC17YPzYxQZ7EiITra/Z4Y+Y
 PFMg/riTQl/RfEgo6kI+1DuGlfb33zR+APIXNv4S/czaZaJiPM3APGOAMf0z0HusgeDIUAgWxX3
 YuI/76Lm1eqBy6zUOq1QWHORHrx2r109NjB2OLrfpF5gt1k0U0Z9R7ZzkLpkBFrr/qMyI/lE=
X-Gm-Gg: ASbGncuZLpixFdbXSIA3Q5GOUXb1s+CnuS3pOpSg3bkFaGHr8JiyoRSf/0ndKnhAbrb
 g4bJ8guOsBP248NaSlTJIltwFc9IlqCf1IpfS0Uz5MfbwXTYYAECyZ9s9KF71uRi+/EfTe++MG9
 2S6Ut7kursPILqRO2QTUoacM2xWEM7onoTjaIggVHJj4uMvO3CyIVgcVEfQMtUzjEx52pLRSXyC
 fC4lA/WdpF4Jr7n7p196+pcW+VSE4lHSvG1J13jPVXoeFY511X1ku8pCl23D45PmskT95b1duqK
 4qGjl5ZF8ZNFAAdLGhEoQC3qhiDMAnyvYxjYC3kl8cBtUPCAAECfdnCWwhRzpPGMeD1UuVcuQJU
 oFaUBRj0s2bb9uJVSsll1AUIWZpRC1ZmmoMg0bdtbeq/Mg01SJbbq
X-Received: by 2002:a05:6214:1948:b0:70b:43c2:3890 with SMTP id
 6a1803df08f44-70ba7cb06b0mr82349076d6.49.1755374129760; 
 Sat, 16 Aug 2025 12:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/qz/f4sYiNsg+ywR1haD9LivBgWwvWG7o13H8HrW9MqL/DBKpsEOaCvZlDPs4BCrfaUVuMw==
X-Received: by 2002:a05:6214:1948:b0:70b:43c2:3890 with SMTP id
 6a1803df08f44-70ba7cb06b0mr82348806d6.49.1755374129306; 
 Sat, 16 Aug 2025 12:55:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3516c7sm987953e87.19.2025.08.16.12.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 12:55:28 -0700 (PDT)
Date: Sat, 16 Aug 2025 22:55:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, afd@ti.com,
 tomi.valkeinen@ideasonboard.com, devarsht@ti.com
Subject: Re: [PATCH V3 3/4] drm/bridge: it66121: Use vid/pid to detect the
 type of chip
Message-ID: <ffdyawzggxva47wl3a7iukqiikls5aoovnfdjyuouqhr7vucsx@ilk5hrpszjnd>
References: <20250815034105.1276548-1-nm@ti.com>
 <20250815034105.1276548-4-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815034105.1276548-4-nm@ti.com>
X-Proofpoint-ORIG-GUID: uAKiAV0uDsiC1x6sKkDzYrgLzfupW0Jm
X-Proofpoint-GUID: uAKiAV0uDsiC1x6sKkDzYrgLzfupW0Jm
X-Authority-Analysis: v=2.4 cv=X9tSKHTe c=1 sm=1 tr=0 ts=68a0e233 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=Eu1ZELVgde1a8Dhk3PoA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwNSBTYWx0ZWRfX+KAeMDYWnqOA
 HF/QarKE0a6R81U4QsdNCUAC/jAAoV13bbEg6XpkN1XiGJswvgEwrKZZwSFmQzHUFKdkWnv0464
 xduP5gEge/PjMS4epwrL1PC3eMb+F10iK5WO0GI2bOSTau+X6sGk40LeJquLZn/jgrpQST+nRs0
 6L4W/NSur+9UWPkC7QCc89gH6tQK6DToW3Irqzefzpqq+R1/d75ARRQ6+wKxFwcFdcj/+xwAcg0
 3AHYDgW6+hM/h3bf70XQSd9m77wyIDnxkhYj71ekmotkGAgRUWzItuecAYXP3M3U2IMHpwRsqRL
 0NTxMGbSNvdKjOX64K6WGXj+biq9rvk7HTgM1In3xBgchOLk//9su/AmVAWWYCViTwxVTA6uhns
 I75OK9Fi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160005
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

On Thu, Aug 14, 2025 at 10:41:04PM -0500, Nishanth Menon wrote:
> The driver knows exactly which version of the chip is present since
> the vid/pid is used to enforce a compatibility. Given that some
> devices like IT66121 has potentially been replaced with IT66122 mid
> production for many platforms, it makes no sense to use the vid/pid as
> an enforcement for compatibility. Instead, let us detect the ID of the
> actual chip in use by matching the corresponding vid/pid.
> 
> This also allows for some future compatibility to be checked only
> against a restricted set of vid/pid.
> 
> While at this, fix up a bit of formatting errors reported by
> checkpatch warning, and since the ctx info just requires the id, drop
> storing the entire chip_info pointer.

Separate commit, please. Don't mix unrelated changes into a single
patch. "While at it" usually means that it should be a separate patch.

> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Changes in V3:
> * Converted the patch to lookup ID based on vid/pid match rather than
>   enforcing vid/pid match per compatible.
> * Squashed a formating fix for pre-existing checkpatch --strict warning
> 
> V2: https://lore.kernel.org/all/20250813204106.580141-3-nm@ti.com/
> 
>  drivers/gpu/drm/bridge/ite-it66121.c | 53 ++++++++++++++--------------
>  1 file changed, 27 insertions(+), 26 deletions(-)
> 
> @@ -1606,28 +1613,22 @@ static void it66121_remove(struct i2c_client *client)
>  	mutex_destroy(&ctx->lock);
>  }
>  
> -static const struct it66121_chip_info it66121_chip_info = {
> -	.id = ID_IT66121,
> -	.vid = 0x4954,
> -	.pid = 0x0612,
> -};
> -
> -static const struct it66121_chip_info it6610_chip_info = {
> -	.id = ID_IT6610,
> -	.vid = 0xca00,
> -	.pid = 0x0611,
> +static const struct it66121_chip_info it66xx_chip_info[] = {
> +	{.id = ID_IT66121, .vid = 0x4954, .pid = 0x0612 },
> +	{.id = ID_IT6610, .vid = 0xca00, .pid = 0x0611 },
> +	{ }
>  };
>  
>  static const struct of_device_id it66121_dt_match[] = {
> -	{ .compatible = "ite,it66121", &it66121_chip_info },
> -	{ .compatible = "ite,it6610", &it6610_chip_info },
> +	{ .compatible = "ite,it66121", &it66xx_chip_info },
> +	{ .compatible = "ite,it6610", &it66xx_chip_info },

Other than dropping the match data completely, please keep arrays
sorted.

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, it66121_dt_match);
>  
>  static const struct i2c_device_id it66121_id[] = {
> -	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
> -	{ "it6610", (kernel_ulong_t) &it6610_chip_info },
> +	{ "it66121", (kernel_ulong_t)&it66xx_chip_info },
> +	{ "it6610", (kernel_ulong_t)&it66xx_chip_info },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, it66121_id);
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
