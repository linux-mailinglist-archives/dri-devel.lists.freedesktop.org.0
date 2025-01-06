Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B87A0241D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 12:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38C210E0D6;
	Mon,  6 Jan 2025 11:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="6sTyJMOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B887010E0D6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 11:19:07 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5063qaLB004709;
 Mon, 6 Jan 2025 11:41:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 btkar9lW2qWD6xfk+/i4bskJnPD0JOAOTKhPpwxrwKA=; b=6sTyJMOLsqffMKWj
 v9GGlvavKkwZos3+6Q3ybRgCTg4rB4Ewp3o2BOQ5SRkQAr2iBv9dscAIDfmclvZa
 x0RhjGqFX6Vam8dZYEojWFM0MSsMWYyq2tt9Ipd8sFiFrReDNStuJPLBaRCJPKCy
 O0ZOAI4G5Tg+jPPGBaj8/EugKwPHe0CjwXI6f41wzhlNYY7ehfsgzpfzN7gIz6Qn
 +Jl2NotBapAilT2/d1WYyLZWcaVkRygaavfNrOMy2lCw8BZKDCb+OPkBIYHHf55t
 RxDDZgMFmp2AWmzI4CaPYI3WcFpXRLiC6VmVNYFwVyp0mMDeblwGJANmIODmkZOj
 EZmtEA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4407n9hajf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2025 11:41:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B36FA40048;
 Mon,  6 Jan 2025 11:40:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C51E126E736;
 Mon,  6 Jan 2025 11:39:34 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 11:39:33 +0100
Message-ID: <9c6a316b-10bd-4ed0-b925-babf84b125e5@foss.st.com>
Date: Mon, 6 Jan 2025 11:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: st: enable the MALI gpu on the
 stih410-b2260
To: Alain Volmat <avolmat@me.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241006-sti-gpu-v2-0-c6bb408d6903@me.com>
 <20241006-sti-gpu-v2-3-c6bb408d6903@me.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20241006-sti-gpu-v2-3-c6bb408d6903@me.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
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



On 10/6/24 22:42, Alain Volmat wrote:
> Enable the GPU on the stih410-b2260 board.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---
>  arch/arm/boot/dts/st/stih410-b2260.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stih410-b2260.dts b/arch/arm/boot/dts/st/stih410-b2260.dts
> index 240b62040000b8c0357d39504d3475186958bf31..736b1e059b0a8f122d1b824e1f4e5db0a668ec2c 100644
> --- a/arch/arm/boot/dts/st/stih410-b2260.dts
> +++ b/arch/arm/boot/dts/st/stih410-b2260.dts
> @@ -206,5 +206,9 @@ hdmiddc: i2c@9541000 {
>  		sata1: sata@9b28000 {
>  			status = "okay";
>  		};
> +
> +		gpu: gpu@9f00000 {
> +			status = "okay";
> +		};
>  	};
>  };
> 

Hi Alain

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
