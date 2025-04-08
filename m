Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30D1A80946
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526DE10E68E;
	Tue,  8 Apr 2025 12:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3tCMRND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E1310E68E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:52:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AwYPP027695
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Apr 2025 12:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ozOy0GqJhvM4p+i6g86ZdCT/
 y47R+QwpvYzEE25KFo8=; b=W3tCMRNDVV6kOJXIZ0EmD/SnguEJDNfoPUwX7V5D
 iAcIbJxvaoeB7jKfrCEujpOb67naWQd4Pd4yqIU1JIWpzX3c0UcuwejM3E2vz9ss
 9FE9s96SBrJR/fKTkKD1ZIbh0tQSiZereJiyK5C8eTIz7ENY1r7lwrb2M1LrbjYF
 OxhaZmAO2R9j+pXtroVZs806qYxz8HUmMylDJ2p69UFshJ46HJcuuXbD4tYYbbw/
 wjoWN/KM+ACcE36RTgsw8Ofv2UI3yZ44VxjR4YSVZvMH4FFAJBIzDQ4vxSJzmjMs
 wb4CNpA1nTeHh5c1VRHt1fPF6dtKYJuuuz3Hj6G2+9sSJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyyted-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 12:52:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5f7210995so1008079285a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 05:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744116768; x=1744721568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozOy0GqJhvM4p+i6g86ZdCT/y47R+QwpvYzEE25KFo8=;
 b=iE8ATuwYIMiG4Px1Ie/0wzC+p9E9el+BAUm1irefYVueq66yi2tNJe02HY6mk0WekN
 WuH2pglO6Lw7qxYQdaaSomLusxc2ykavqfGuGrSuqRFHgySouJYY+pnOygS2MS9slC8V
 IoNmdgxRJ/KbFyZINfXU1sCIKVhMzX7KM0aM1+Pf3Xc75jpcDjKLkZXMiPKqam2RxDK3
 M+EPehS1MBqFDmSKpqG/RUu5y6umHZ5K2fXqvc26K86/rVZxn2gYlGV3k8sKrFHFBNOS
 snxum7oMNM2ErS40daSC91r9PJt2KzAcbMCbozsI0FmxNbhnGrALP7QJ1XIs8ZWr1473
 gaLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCYn/tx7HTA3M162SC0nLnQOqMd8juoIxN5fgP5j84l36yfVGEDHVSCPJLpp+G7zttKe+OXKQ9x7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzatJOgMtEHwuBewGezRERl/IddupYoggTRZEGUb6dTHYUAhe3L
 v7qF7QYepEgCE16QIKeLGel1XV2YKEIp9RNSFUGvzcUUZsnqZb/1tcvBahfygpe3cLGRy71ITGG
 qHEtFoCnUsBxsah+tl7/1mnxjJD/EU95kGD4qzAkFjoPaTCkfMka26Vv7IwpNJux9sko=
X-Gm-Gg: ASbGncsB4XRqq0x26pNssb4ho/IINObIPnnxi0k1OjIMvb4clRnVUiRhQupKq+5sZ7L
 E0ZYsuYKJo1W4rTQk2kW6lG3mBp66JmgfDIWtTK8n3NILGk+Z4PfdrPrbdaSLjmG1WDmqJNMGFA
 N/7n5Eh0R61WigfRz0xtNYUtYT2pIxifLR4h+AJ0j5qGJk9PRBOChTYZfvjMkpXnVeRU76GGI0o
 cKqDPaKP1INHiX8lzbdyPrWcsjaptHSpqb9+roN2Ej7CCpF0DoCdUAXYnDxHnTsFqU8wjmlR5Qj
 9aEC6S0n86r4qF9HjdZwGanuMiZ/qKxtT/+XXkzpNgLXvqiU6oIz38vOoPzBHSLg0aZlGJ5XnZ0
 SZiM=
X-Received: by 2002:a05:620a:1a97:b0:7c2:3f1f:1a15 with SMTP id
 af79cd13be357-7c79406989dmr487480185a.8.1744116768695; 
 Tue, 08 Apr 2025 05:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENrprMV38pKL2vCzgWJqCOhSuJOXB3SPgKkRxCoZMwFOXx95HGF4YDMgZqebwP9lm9d8nn9A==
X-Received: by 2002:a05:620a:1a97:b0:7c2:3f1f:1a15 with SMTP id
 af79cd13be357-7c79406989dmr487477685a.8.1744116768396; 
 Tue, 08 Apr 2025 05:52:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635c46sm1531376e87.129.2025.04.08.05.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 05:52:46 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:52:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Pu, Hui" <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/panel: simple: add Tianma P0700WXF1MBAA panel
Message-ID: <owlfv4nuxiwxjjoooyx5haoh7bxuovyctjvi4esa5j7el7756d@xxfl45lpv6o3>
References: <20250407-tianma-p0700wxf1mbaa-v2-0-ede8c5a3f538@bootlin.com>
 <20250407-tianma-p0700wxf1mbaa-v2-3-ede8c5a3f538@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-tianma-p0700wxf1mbaa-v2-3-ede8c5a3f538@bootlin.com>
X-Proofpoint-ORIG-GUID: 7tlOYPqcPuGoQK_ocuPpNjKPFIr77pJz
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f51c21 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=4pWTrk0WRE-EHe8MsE4A:9
 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 7tlOYPqcPuGoQK_ocuPpNjKPFIr77pJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=924 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080090
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

On Mon, Apr 07, 2025 at 06:34:01PM +0200, Luca Ceresoli wrote:
> Add the Tianma P0700WXF1MBAA 7" 1280x800 LVDS RGB TFT LCD panel.
> 
> Reuse the timings of the TM070JDHG34-00 as they are identical, even though
> they are described differently by the datasheet as noted in the
> comment. Power up/down timing are slightly different, so add a new struct
> panel_desc for that.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
