Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3C6C858A1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 15:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2359910E41F;
	Tue, 25 Nov 2025 14:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzwYKouo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTED4vNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF80C10E41F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 14:48:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APB5ZsE3255979
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 14:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2J63HAWT/xBRSAZdQdUSYuIS
 IPaqDrp8aGKI/vJREVU=; b=QzwYKouo7G2xySngcb3N+7/Ui5J6y33hstKhvQlv
 2BAkWnNKYblxvdEFsOaWMIDHmpO/6S+Wje2gxz+0jmV5jERGCuhVSWd1r/yJGPo3
 hVoLWAOcoyqv8kdnFLwCHUcDkFE6rjflSxmhMVVHXBe6elzj0GD20hnoZV+3PQ/j
 LP6jQoVQdePeciCalOaMA/HJtG3kLHUZnzeGvnpWXBh75AINV2KnrHvsq/31u3v+
 Lx7obMuoc7ucQBIRPAiYA9fXGWuQr4C3jU1FcDe7kfsqIOc4Jm6GBEvN7384LytQ
 ZAqGgZVI/P7vbGWOyG5K4ZYTqHZ/fsMokQhLrjwaY1upkA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c0kdv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 14:48:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee3dfe072dso158749721cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764082107; x=1764686907;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2J63HAWT/xBRSAZdQdUSYuISIPaqDrp8aGKI/vJREVU=;
 b=PTED4vNnVI15a4slvZxwLbQxrnXI/NKuND4iOev5z3nkQfkNhSLLizaLNMjFRE66Iw
 jLAwecNVR80IVoCvIzmFdiLZhBbIyG5fibAizsPfK0GPuJccsaaM21w0YnA/iWM/dT1g
 IM6bTsAIwAGezFBQfzZypQgvrNDPz26oWNotirD4QHiP1ghh78t3pE8htoIRL2KPv6/d
 /P6EARqFbM2aXLzSFEjUUvKZMeS8sWE0DkyJYVlj6SoHA5HUDsz5yaw+2iidF6crfcFd
 9s/B8ZttvCSZ27mmtjfXKCZ2nrAG4JO+kKiXus7zQOcn7+MjUoiwiwDsR4oJCxCPmdSM
 XpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764082107; x=1764686907;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2J63HAWT/xBRSAZdQdUSYuISIPaqDrp8aGKI/vJREVU=;
 b=S0b7p9V7KmUUH4nW7LH4QsCqgNM11QZEwzmcu3CkwDXN8NrNCjMMXAI3UrBc9wHDjh
 RRwa+vlLCy9afNdyxMD/qu7yOM62jxdUUxEWWfd0FkI3sJ6S76caJdbTXypRwh/b1XNF
 LajpSrTgQpyNRLukT3vbdG3GZiSex71TtXRAcpz1QuOCmbPIgMrXLlzpxWQ3C60t7RnU
 /z7cWEz7nlrzoD72mTprpF3qLigmk4+2yR+cvsTD52nLAhVJ06tYRNE8WiAxxJkfwFns
 CsNR6j9uM9oQc/x+jpj+MA0til4Y7zzQpJlNlgBbaWrwWsuN7QczKjl33dlV1RuYy9hL
 pUuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQtmvkcKKmufg4F5v01rGIOA0dYP2jAuji01Io+1sshfo193jdkbHAVlVuQ7TGBk1oKnEL2tHnekw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZhg7eO0w6Nu+9h6P1BKDeHgg4lHtQY5Qdj2yroc6Klh2ja3gQ
 u8gC3xRRd3QY+zQFpTnrQGYQmsL2utfQgJaO8/k3U2dqh/7cFfFVkP2vF2RzA4SlunX26xE8KuS
 lYJI3L6rvTExVLNunRu1F45cIVh4pNQXC4Z6amHhkoy4Hpd+Uha+N+T4Dx3Y7yHSJWbNePkM=
X-Gm-Gg: ASbGnctodVqN1I1ylpZV8VtVw58SWuFKsa4jSXqngNseOuOC41Jr51LW8C0WRZneueL
 kzFacTyohqyMsHkshQ5fjH7Fyve7dMj5yf2YP6GE3vPo5A0dltcSLHPDgwamzShqbK4g03ET0kO
 pjooLp5DEIVoyJQeoqUuA3NInnjLHPbSz+p1gzFzv/FkZZCetO2g46CHano74uLK3LZ/2S8tEPL
 APSfWyLRrHvEDxaNuKNMnr97OYbFdgYD3g6UC4A9WsWdMB+agWtjrNQ29mTgbK7aw8PVmZOE9S4
 cXIkSdKDWyXBYp+hZ9IKo8cw7THd+GWr89NGcTF/dmAnWTKWzC3is/n4jmMnDz8kqHySyOc5lso
 a5kByU4SVN+MozUroNReJioryFnUVpUGIvZutRbStLTlL0JGkZTUOymEbOGvLsg49iAi8cN5rmr
 i2bJVKVJ3n
X-Received: by 2002:ac8:7d94:0:b0:4ed:6e70:1ac4 with SMTP id
 d75a77b69052e-4ee58911639mr214711331cf.42.1764082107228; 
 Tue, 25 Nov 2025 06:48:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLx8aIX8BiCbNvSxqGqHKSgfTB/Fws1bzqBUnUGjst6JC4+3XSzRzlcwUpZfMZo/EmN4sXbA==
X-Received: by 2002:ac8:7d94:0:b0:4ed:6e70:1ac4 with SMTP id
 d75a77b69052e-4ee58911639mr214710831cf.42.1764082106732; 
 Tue, 25 Nov 2025 06:48:26 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db88f71sm5302737e87.34.2025.11.25.06.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 06:48:25 -0800 (PST)
Date: Tue, 25 Nov 2025 16:48:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 06/10] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <syfppoocftklfe2fqkx2c6wwanjuikxc6tozybc2jvfrxfbf2y@n7nmho57tuvk>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-7-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125064758.7207-7-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: XVIqHnWxxa-O9L9PxJUnSM0CpqsPVWJH
X-Proofpoint-ORIG-GUID: XVIqHnWxxa-O9L9PxJUnSM0CpqsPVWJH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyMyBTYWx0ZWRfX/EAQ/BUNvnc/
 LzSJxEYwAMttRt3DoMN98nDlQfoMOdk7QWgT2WwHF7zYyZHioIMsE3aMax1ocfbW5j9cXEX06Ib
 ASLgQS9FHIMH4PrtaRATIKepGxdFhH49lP79HQyA12pmI9mQLCdI0R/li7EjYtBHFYB5zXccLn4
 u06IOBeM0IDETLvX9MmFbzWNpmyXrzKRVzoEaIgpVTMFtrfgwfvn4Ker0huo1ohK2NI6ozQLdKz
 3MUA0735zJ+KYzNC3bIHtGw+kg209BRE287YBUCfVdqb+Hx/A0HY/UppA96FNIMBTMxF2vq66+p
 TA+KRLcCBUX31LP7yEJYgMa9eon3Bop+AMlMGNWFIMCQN1mwGlFcoserohwfDy5qqUTQoLiAJCB
 7QHmK961iJ6Ph12DuGNNFC+HNNGfsw==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=6925c1bb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nXOiHK4lao4tYTmu_wUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250123
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

On Tue, Nov 25, 2025 at 02:47:54PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI PHY support for the Kaanapali platform, kaanapali introduce
> addition of DSI2/DSI2_phy compared to SM8650, However, based on the
> HPG diagram, only DSI0_phy and DSI1_phy works.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
