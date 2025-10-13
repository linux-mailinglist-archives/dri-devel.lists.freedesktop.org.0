Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066CABD3022
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 14:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A52A10E43E;
	Mon, 13 Oct 2025 12:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Irwo3ki0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D406110E38F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:36:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D7Qd1b013013
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=u8goP0px9a8ckKVRo5TU8/0r
 Gkad5U2lG1RKmUfiwgc=; b=Irwo3ki04+biq4RjeyRHjKxUmrs71JT5Nx4DUy+W
 7s6k94p4fH23o1Ua75eMkZ6so8DtxU5JYsso5BwqxPsVsZTasIPZ6fhJIDYeEWmg
 5q2qmvKgBp3+6pGwLSmGii43JqDalJxDZzt8H7GQ9XbXvOdT+QBsqT5yKxHPqkx1
 9e2VySl9KeHULiWcBfXiwxR4KwU+LnnmglW5c1r319HSfqiwN2spJxjNnim9lGNq
 QCRPrIg3piZ5KqsEtNwF9CcnI+yogY/5PTO1RrxUlcgNbmWCx5MfGp29KvJ/C44U
 rIdSB9y2NHkNhJqZ34hpRvSxCUhcZGVWSSg9msKGNwvgIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1a8uwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:36:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8574e8993cbso940159685a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760358959; x=1760963759;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8goP0px9a8ckKVRo5TU8/0rGkad5U2lG1RKmUfiwgc=;
 b=GoqSbG5PTv/2juwSEQYHMxba/u+2fUF14sdTqBeSq2NlvXmqZOysnNRiarrf5PsX9/
 xJUxYp7SXU+7K5Fy6Ud5cSyR3NfqvxHGlKG0Jh2EDBN3ftsBdmrK7e98vqNU649d+NdB
 XExcUFvBV0kz5Xje9NUwgXCAkiPsBclSjVayOxz759bvNPbt1LdU+6qtxJ2hgBCZ93ub
 k3+rTI0qBFpLSYXM2b5EPk/9kWci9xcgkvTsBhGC6JILRmw0B+qlTAFKP5DXy/8MMiLC
 1MrsSyY5AmfnPv9NEpy3kcQz0Gk/g0Moh3aRAYOJbvZjdCW95+X1IdB7DksRVyWuB299
 XM7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY2iziMdWPWn+DXkLHAhLZS9IikbqgMK2S1Zr2hwIHQwc10IG8qsYwN4/aCNuDW+Tt/DmhKcsfDcc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqQ+vxT9tf8kpymzjlskBEIjxyMhAciNif0giZw4PfBONEDT6k
 qYf701HmdqNG8epmZ9E6h5QTQmB5UaTpyo2HYrU7HeMCO0sv6gUK+forztlF3nN2accOXmtdm94
 QPApP+xZir9xnMiXmCksEPAUXsJ2qpX6CQijBbxgA0m1Wpiz1rJDeB0JI7bxLqbaua4i2Yl4=
X-Gm-Gg: ASbGncv/P9PdPkSmTKtGMAVC6Z/9P7qgyFl+mKm/2FTIyXbueA64tQaYPlY8WNqSDDk
 jt3ndqQeWR91Y2kXajIWMP7naywQqiNeFX5xSo0XFmwTWL3S8lwdTh273CJYSEdRYHecmDFXzEV
 nLKsoWo4GpLSypzn4hZv+etg5OutBEWFSi2oOwRitU1TcY0eyFSfAwhMtlTT3oKB8BOKItmXdmQ
 KPKtaQcWcxmaEyHmhH1mXnYKC78nujwpwSzxHBZL1WQYCaCgQPCINzzomISTEV19H+EXa4358oZ
 Rv7Prp1gxsapv9Ga/c0KHupOLYeAUnJx+4khTBacWj4Wn2mVBFo4ZU+s58aEP8YuxkLFqixJH8y
 Fw8OAsc8sSpYEpTN2AWJIubrgFbSrCYw4aqdIYLShW5dwnLVIExcD
X-Received: by 2002:a05:620a:2983:b0:864:1d18:497e with SMTP id
 af79cd13be357-88354ac39cbmr3044046785a.23.1760358959053; 
 Mon, 13 Oct 2025 05:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwoj4faJclOVnlrUN8P7wIZhl4D7mky2VyxsU8g1O5JnX3k9H6mJ7qsn8Lah7rEGjXaxUOBg==
X-Received: by 2002:a05:620a:2983:b0:864:1d18:497e with SMTP id
 af79cd13be357-88354ac39cbmr3044042185a.23.1760358958586; 
 Mon, 13 Oct 2025 05:35:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881e4e4dsm4084850e87.22.2025.10.13.05.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 05:35:57 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:35:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: lemans: Add edp reference clock
 for edp phy
Message-ID: <c4bhkhw6xlaqlwhbataveafav6jcsrgnazk72lkgtj3fygwqjc@4bp5w4q5sygh>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-4-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-4-quic_riteshk@quicinc.com>
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ecf230 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=xNGN3EASD54c2UHPMiwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MM5tU7tAQtpRxKM_2bfrt3NeIMvyLLmi
X-Proofpoint-ORIG-GUID: MM5tU7tAQtpRxKM_2bfrt3NeIMvyLLmi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX7LZLA7SAJwKL
 7C8tBIJJypmb4R/8RrWIg4pr0SH58cB2+MIMdKwiYvou8zm2AyuO+XwQ3+1mD7/yUZg0xddSdC4
 2XwzPUtpITAmOvodx9FrCNxKI23tWHY5cNoO/w9nQckwS1VFJ3GtsMRDu6257ggmAe4cruzxEpp
 T4fuIOWjT6ydQsib7A6+4T+u9LOVZKcntwaRgRf9F/eUgLMTo4k7s55/tJwwdpeHTlknUKW1/5z
 nL5ZE4hOKVf9mn7xNXr23U5sMlqbTkEzLMNdJIXFe/mYgzRsDSpPu+5aFGEwzkhHsNQe9KU+5LC
 DYBj3ZQU5CEfzLXME2ALQol/CitB34tElYs6Jqwg8+5pKuzPPIIiSq3QlezstMBsPjWTuVAh8AG
 KTx1GEP97BrtaIMt5iwFH9/VrSzmnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035
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

On Mon, Oct 13, 2025 at 04:18:06PM +0530, Ritesh Kumar wrote:
> Add edp reference clock for edp phy on lemans chipset.

eDP, PHY, Fixes:foo bar baz

> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index cf685cb186ed..1bcf1edd9382 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -5034,9 +5034,11 @@
>  				      <0x0 0x0aec2000 0x0 0x1c8>;
>  
>  				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> -					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_EDP_REF_CLKREF_EN>;
>  				clock-names = "aux",
> -					      "cfg_ahb";
> +					      "cfg_ahb",
> +					      "ref";
>  
>  				#clock-cells = <1>;
>  				#phy-cells = <0>;
> @@ -5053,9 +5055,11 @@
>  				      <0x0 0x0aec5000 0x0 0x1c8>;
>  
>  				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
> -					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_EDP_REF_CLKREF_EN>;
>  				clock-names = "aux",
> -					      "cfg_ahb";
> +					      "cfg_ahb",
> +					      "ref";
>  
>  				#clock-cells = <1>;
>  				#phy-cells = <0>;
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
