Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D16BB39DDF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 14:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B8A10E1E1;
	Thu, 28 Aug 2025 12:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLOYBOfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4161C10E98D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 12:56:27 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5tGrt029346
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 12:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OdpmDsm62brobuQjUJYWRZMW
 8nEvkBWHHBR4Kl+p9ck=; b=MLOYBOfxkPhySalZJmsNJxpH0XwqD7DR0CWEmIoE
 JcPIo7+2i1H5T7AE7EZJvX2EoZ1HvOEe4bujMxMHnLO9cqpP/aZmCZHE/lpJ+Wad
 nMiRoSOAR26w87HyvVJfyK/ejhQvXNM0emS38P/Rf1sYjSeHE0YCCSpwHi9Lxcp4
 MkebjToxa5ES3MNmif0KwSWIsbMkp89IlMlhiIesEXfMn1PDKu1F7BkO/qZklzH2
 vV4iyTrApTG6NX7w2N+PJE3ecxd8zDeKaPqoFcgDle2jgmFUCBnTNDwYgZTLo9qj
 IaKTyP53y+09zoON9kvUXf311lp91+oLlw6RN1jywHAlUw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w30emd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 12:56:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70dd6d2560aso23800496d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 05:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756385785; x=1756990585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OdpmDsm62brobuQjUJYWRZMW8nEvkBWHHBR4Kl+p9ck=;
 b=rI9zR4ReJbuYEmUfqFh/ASR7Yxi1KYKd5E1CyL8aZrwJx5nosHFOK/3Za3ZS8hHdpH
 u0K1BHV9x1kutLRI25vlfz2AGw5GLEMkls/lpvAzFrgYc9wznDNAC90fOnZbxJIj8tG+
 p5ZPRccyz8rZMWWfzrsyaHbhXLiZRQxApJd0prJSl3fM7kITUl+5J9iJx0xKThLSaIAp
 KwyhSZufs22mLRsN16Jr0VA0EQnpEeljmrVH/+HU9o8ji1mwT3THuCr0ygDBczcZYUCO
 MHyCdV1v92Vx+AlN7MPfpgJKb4O2PFonf6DZ5AbfRb24WmNG4xQQCc4xIhbKk8+2Qm/T
 uuUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLO0cy01coTT2doHPtJO/zXN1Z8GyUhiLwf8SBSurYBXs3pbzQmTJwmAmtcdq8Vc3wUc8mgfN+2X8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2MjE87UK0F9m4Fimh2hp5jDQhFaNo3BoleVVrJ+a08UVswlyp
 2FFTsxst7nGi60yg4CIFzG57R396O3u8diKgGkfIgI+ZOy6Zneqq9N37uNt4ijs4jKtknG70Ct6
 YEdYfMqDV4d98SsIZQZkIMSg+jIbY7GggX/cD4SDU62Ye3O1au9IpHrFLjuHWOIFBlGGv2Cw=
X-Gm-Gg: ASbGncvcyJU+OQlM13T62rxOMBqTKKgEukZntKRjQDdS3+ROE6+7ZX6LOjvfFXlWbao
 VjTAVS/KJ9qUqoj1SH8t9xBmiQL7sJ9TZEZ4lHqbd9Dc648lGjQ5odVE6SFOGgUuFyNjwFb20QG
 gIgtpJBvro3y5Dpcu2ajHNYo9qXKujjD//fi3h9s9w5paZ36sC7aJD1IQoOIQy1XOVkoLo1JoOL
 P24Tt1d2+nke0u0WHE1ETudYf52N1bPy6HRoFdeS2GcVkwmSKPmMSvGjVLtCQhYlcncjQSuAGSj
 kYjuyAF0QMNbeckPa+mmIBLas1qS7gaas40Hll6tExa7YIZQSagQAmgIbaHhKOiv7dKoA/pcI81
 qNX42t3Or7UNcE56EPyYGxbM6EZ6DcvbgQRUvWQ1e6dJDuGoDMI40
X-Received: by 2002:a05:6214:27c2:b0:70d:843f:6b8c with SMTP id
 6a1803df08f44-70d971e4c73mr254210436d6.37.1756385785174; 
 Thu, 28 Aug 2025 05:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERQ3f0eiZP6GMEYC5Py0gqB9whnbXB6IFHUtmBsYwWEJ7LR2k+sbTMwXECFTAuvR2F5ILzjw==
X-Received: by 2002:a05:6214:27c2:b0:70d:843f:6b8c with SMTP id
 6a1803df08f44-70d971e4c73mr254209926d6.37.1756385784519; 
 Thu, 28 Aug 2025 05:56:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8bc94sm3337416e87.84.2025.08.28.05.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 05:56:23 -0700 (PDT)
Date: Thu, 28 Aug 2025 15:56:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andyshrk@163.com>,
 heiko@sntech.de, hjc@rock-chips.com, naoki@radxa.com,
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
Message-ID: <n3scvjsx2aec2ijnr5wwevkmhtegkts5nb43yti7dkjujqaezq@shbcy7ftibzo>
References: <20250822063959.692098-1-andyshrk@163.com>
 <bochli5u37mhc6eup7h2oz3yeignofbbj4k5nrvm2k7zf6f4ov@t2sje4gmveqa>
 <d040da3e-501f-45d8-bcbb-95fa77e94a59@suse.de>
 <20250828-tangible-wakeful-coati-ec27d1@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-tangible-wakeful-coati-ec27d1@houat>
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68b051fa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=tUpP_D99XMz3yPDlsHkA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX578fwMv/f8ev
 rVNqrGNSL/UAwfHOolvua4SqiYs3Z+v7ASZjYVHtvh2hFqaAYuxWcBs51y8t7uG2HmLgRMBM3rI
 q2CMsENmfC9B0jaz0Gu/IGHr22VEKrSt0GmvtAITh9kHWvVLHvsE8GVNFmQ9dyC76EAe/zGxM/s
 QJfhltK/PRRX0/W+eeoPS2FWaSVTu6tyPAzLIKcUoLPevRNfQEtmAJkVtdDmqafUx0O1f+jnpeB
 t5hF9dGKxKz/ZvgZMSAgy+r4TIK7Xg9wwG6m+dyztGVvkJwIoI1qV6pnZSEmrgiJDh3qc8mMnhB
 wlBq+P5N/PwgP2aESwGRVwoSmjXFH83zhZyHYzSJ3imVUeVw/WyYLh+cN8UvM4Oqg2NYCr01lsQ
 ZU5H0BPt
X-Proofpoint-GUID: yRcN6zyXzkwzHbZaSBBHMeIP1Ol-E-9v
X-Proofpoint-ORIG-GUID: yRcN6zyXzkwzHbZaSBBHMeIP1Ol-E-9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Thu, Aug 28, 2025 at 10:05:28AM +0200, Maxime Ripard wrote:
> On Thu, Aug 28, 2025 at 09:50:34AM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 28.08.25 um 00:24 schrieb Dmitry Baryshkov:
> > > On Fri, Aug 22, 2025 at 02:39:44PM +0800, Andy Yan wrote:
> > > > From: Andy Yan <andy.yan@rock-chips.com>
> > > > 
> > > > 
> > > > There are two DW DPTX based DisplayPort Controller on rk3588 which
> > > > are compliant with the DisplayPort Specification Version 1.4 with
> > > > the following features:
> > > > 
> > > > * DisplayPort 1.4a
> > > > * Main Link: 1/2/4 lanes
> > > > * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> > > > * AUX channel 1Mbps
> > > > * Single Stream Transport(SST)
> > > > * Multistream Transport (MST)
> > > > * Type-C support (alternate mode)
> > > > * HDCP 2.2, HDCP 1.3
> > > > * Supports up to 8/10 bits per color component
> > > > * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> > > > * Pixel clock up to 594MHz
> > > > * I2S, SPDIF audio interface
> > > > 
> > > > The current version of this patch series only supports basic display outputs.
> > > > I conducted tests with DP0 in 1080p and 4K@60 YCbCr4:2:0 modes; the ALT/Type-C
> > > > mode was tested on Rock 5B, DP1 was tested on Rock 5 ITX by Stephen and Piotr.
> > > > HDCP and audio features remain unimplemented.
> > > > For RK3588, it's only support SST, while in the upcoming RK3576, it can support
> > > > MST output.
> > > > 
> > > [skipped changelog]
> > > 
> > > > Andy Yan (10):
> > > >    dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
> > > >    drm/bridge: synopsys: Add DW DPTX Controller support library
> > > >    drm/rockchip: Add RK3588 DPTX output support
> > > >    MAINTAINERS: Add entry for DW DPTX Controller bridge
> > > I tried pushing patches 1-4, but got the following error:
> > > 
> > > dim: ERROR: 5a68dcf5837a ("MAINTAINERS: Add entry for DW DPTX Controller bridge"): Mandatory Maintainer Acked-by missing., aborting
> > > 
> > > I'm not sure how to handle MAINTAINERS changes (or whether it's fine for
> > > me or not), so I will probably push patches 1-3 in a few days, if nobody
> > > beats me (or unless somebody points out a correct process for
> > > MAINTAINERS changes).
> > 
> > That warning has been added recently to make sure that patches do not get in
> > without sufficient review. It's overly pedantic, though.
> 
> It's not "overly pedantic", it follows the contribution rules. I'd argue
> that, if anything, we've been overly tolerant with that kind of
> practices.
> 
> We do have a bug with handling MAINTAINERS changes at the moment. But
> everything else shouldn't be ignored: either patch MAINTAINERS to
> reflect the actual contribution path, or get the maintainers Ack.

For me that points out that MAINTAINERS changes should be integrated
into the corresponding driver patch rather than being a separate patch.

> 
> > If you're confident that you have R-bs from enough relevant people,
> > push the patches with 'dim -f' to ignore the warning.
> 
> And let's not just advise that either.

-- 
With best wishes
Dmitry
