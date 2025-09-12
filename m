Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AE4B53FDA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 03:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8F010E3FE;
	Fri, 12 Sep 2025 01:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIcq5BvA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BDE10E08C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:25:15 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BMVTCP001550
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YsVWw194ZI1CWoyM8/QckT8m
 npp2FjAIPhrizuJH+a4=; b=kIcq5BvASDc27V0NaYPfTm2i8yEDFW+b0Y6Z2LX0
 gr9e+Mqnd/HS5R3jxQD/Ls7HOhSCQkUJ4tru+b8ktksPedSj3GLp2RQFi8fNKmcQ
 d7ilTtTwLSOUpW/ajBHQ/USOOdTXARBj+BxFUdp09XFgV4u5QAjGeqb4D9cVV05Q
 CHqSX1pZUDE3wn6OZpwAdjy90Lw7zAQLAiCdlDqTP3NCUYajvzKU0Um7aGqEifyh
 DMYPMHKSVRp1MinW8wT5YfdMa4BtgTsA7lMmyZMvXprg7JoBJ8l5o0bzTJ2nNVPL
 7DHJokCJ/LR+sTPTsovbuXEdE5MXjqFmR5ZrH1646bW+dQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493ydv1yeh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:25:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b32d323297so30440801cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 18:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757640314; x=1758245114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsVWw194ZI1CWoyM8/QckT8mnpp2FjAIPhrizuJH+a4=;
 b=wJ1HUfpQ/CQ7Hvh+kLNMD/UWiuTkEDSN04qtwSq5T+WW3PXjCnesW5tHR7vQnJmLk3
 043ZtqV1LdG3G1QAOH4XMa4EY50lBDWhPKXmCoXLtK2la7z3GorLwu1FmAPx1FL/oAos
 hiW3WxoxYalUqKec4bSxZ2peAgKNuMSxL49IXXDT93Ru7vKjVzj6d46PpcXt6duD8hsq
 v6Iw3AzAPVICJZaYqqT/btgrKspTWLxCj7OLR7vI+fZK0FZxoLV2Vb4Lu1uLI4+bdAnM
 qtrz99lDQJAWPkk1nPJn3MBa6MZvnWevJujb3HSQK84xYJdOpLZLDSmbFQQzZcPxdDBp
 g7wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhEYUpmm40F3Amwp/YdXonCKTzeZFjdxsFj01K5DqWa8WAvSLSAc0G4VhKu1wx4g3Y8Nb5BSlfJbg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLE6Vbyzfj+4hyDfLZcb9C95wqNu/VBdC/yo859/mrm1Rf3kHu
 /Y6tMjZ+p+gFYb/EqK0AN/VExeSkYzVpLyTXu6knfTw8ElGFQW8DGp1NqkGBJaYktq2XflrY/Ce
 tND2mWE5w+PVTu1DQdX8oPAKYsoN78+VpcWKbJbBZoc+boCN4SKEUR+HW61DeDmHXOQealmo=
X-Gm-Gg: ASbGnctakhXl2vc6AxnnqXZnU3JJfUgGVNUQgb6musEOEYq4zh8xLlrkaGczAR2wFSe
 ypeTbNUbTAg1Ko0rUQBxwbqncfnzfMWgKLRrEB416djlEPClTKdT2ewVstinlHAudYHrOsWNBWW
 gAmTCJ70W/t1ZdotSFW5yGrpIXalBvcvh1ma4MuezWZ21xBW/8/bg2xNz2F4JthNNikTqZcoI1l
 +EUI6eWo+OyXro6XBCFPcNadb01NJGoOSWaFJma1PNLyI1O0gVMYqqqkGKrMpWfH9mthxd2Yeh0
 2B024cLaROmpgFjQEsPzMp1RgDRI3GDCpcIwKJAV/jJcQGszeuLo7nQnClXE8i0UNO2HA6AKxcG
 fRHNo3NMibI6HA/YuME5QspjN9jsaHYU5tsjZJtWqIqBLWPXXA6gI
X-Received: by 2002:ac8:5a0d:0:b0:4b5:e7e4:ba6c with SMTP id
 d75a77b69052e-4b77d16e805mr17533561cf.67.1757640313585; 
 Thu, 11 Sep 2025 18:25:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeSzyRo5fxlQ1s5PZqzWjlXyF7vQvka83jPrQMx8jrzjabtE8ps+uhPSg0QScYf/gUsEIfSA==
X-Received: by 2002:ac8:5a0d:0:b0:4b5:e7e4:ba6c with SMTP id
 d75a77b69052e-4b77d16e805mr17533221cf.67.1757640313085; 
 Thu, 11 Sep 2025 18:25:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c692d10sm786907e87.8.2025.09.11.18.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 18:25:12 -0700 (PDT)
Date: Fri, 12 Sep 2025 04:25:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 05/13] phy: qcom: qmp-usbc: Add regulator init_load
 support
Message-ID: <qpcdlcxvu4avnpc2yebrjaptxcckp3jtk3gdrsdssi5pg2yjap@76a2o2bw6gea>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-5-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-5-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDEyMCBTYWx0ZWRfX+HgHB+5a/WNu
 XSAgrdHEydf+FJat09glvowYzHM2V6/pWjTksVIGnpmVABYGsFRMJ8ScAW/G4aZ1FwztrQe3CFG
 BYwLwj1p7/PYGQkTlRLdTKoDvhi8D5GUzwr3AS9+NeOByvWtTThWzYvOCIQRAbCmyf3llv5I8Iy
 zaitRQjet6Ay1DZZKIj8ZHkArtoG5cQ2fyPg+hcwIjo9i2KOS5FQXxZDnqmCcAiHhEnjRGi+6Et
 DwuoNGKzN1auUUwC42I1O0u2HL7N7lvexyCF06uI98hdsVzH+VCXYg+3qk2WcdpoUoubWmjpdJK
 ikvyb7mfAaFj3714EIUVIgBsXC/r3OX5EbiEjX2yzpUVn4T21vN6aJkEmRjwRcGgu3lrj5UE0sh
 pzQjC+Cw
X-Proofpoint-GUID: L647B08M7UCaWqNxTMEu7a7eGRqkbBDI
X-Proofpoint-ORIG-GUID: L647B08M7UCaWqNxTMEu7a7eGRqkbBDI
X-Authority-Analysis: v=2.4 cv=LoaSymdc c=1 sm=1 tr=0 ts=68c3767a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=mlQFcmInbWeDH1iYaCEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110120
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

On Thu, Sep 11, 2025 at 10:55:02PM +0800, Xiangxu Yin wrote:
> QMP USBC PHY drivers previously did not set init_load_uA for regulators,
> which could result in incorrect vote levels. This patch introduces
> regulator definitions with proper init_load_uA values based on each
> chip's power grid design.
> 
> QCS615 USB3 PHY was previously reusing qcm2290_usb3phy_cfg, but its
> regulator requirements differ. A new qcs615_usb3phy_cfg is added to
> reflect the correct settings.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 70 +++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
