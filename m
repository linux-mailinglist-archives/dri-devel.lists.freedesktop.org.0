Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F0FB19052
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 00:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE5210E023;
	Sat,  2 Aug 2025 22:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeMnVJPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09E910E023
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 22:24:01 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 572M9LMw000737
 for <dri-devel@lists.freedesktop.org>; Sat, 2 Aug 2025 22:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xl0OxxNA7ca072iJm6M/zPG6
 jGGT3ai/1U553419los=; b=aeMnVJPpOqTPR3I2WDmw51lqLpvUV2fYhyARPtzJ
 SBY2x5WNIE57zCPGcVper6imusSo8jxDorgVgWeJX/aCGimBRqOdNIqF+WBI6uq2
 6nHGncnFUryddtwt3fyA80U5I6LqtoW6pHJfOWSFjzspVoEbk2xGx1GPQgOxl4WY
 fvF8d7J2RFihfDNHah1LU2RCO3LBGxZVFpnZ4OB7fu6ItVyTwTZnLt17G3F5BPe0
 +rVzOdk9X/GFYA4poaOBg6Lrdk5V9Ism/2L0LX+2heAaaBLpTMa5zcFH6vKbCh3+
 GU5sp+rKsLgR8ph1MVvu97s7OnDKIPp7fR1C9fHarRMeYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqh9f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 22:24:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4aa826c9464so46970871cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 15:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754173440; x=1754778240;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xl0OxxNA7ca072iJm6M/zPG6jGGT3ai/1U553419los=;
 b=KS8Ai8iOBqE6DnQLIigcl2tNCwq9T+HBMsJq94WUFUkM8Grx6kazkaDRNBqrGBSOaL
 goA0w+4vrKIFABmXRo/PlVeAHdVIUQwrTPedKeH34JOOZNZzQT5LVgznGPmWMAlzO7CO
 HhnuG2ZTd2NAEsuAOCiEeDeZifyFDJGvq6P0YWgi1aI6waDJBtom8uj+MKSHnLUqp6Lz
 8sYnnzKlEU3D0kAl5GNfV03szrlU6LRfZW4oD98imoVVKzPktIhRPLDQZN0Pt8V1HgWN
 CQUKanKJbudBg3oen76zOpbAymFdao1bzFfhagh/mqCSks/9cDdujtfr5qZnsAG7EYdY
 Nc0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrMByLAiL/N58mlLKHVj13hrqTPjS6fuEBdKgCs8LfKEDQ+vxQmAmz62aAMna9CLbEYKO3ARFqShI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWMiT8qiiWYyeR4viFVwwMgWgYbu3Iiv+C3uBHssoOMMD6JEdz
 ZtVgtvbrtRbTKcynS24fZxtMTyDAMjHgB1wq7jD/fEVMrFAK1qHVZ8gZ8bhyG48+4Frq6HvZIq7
 iUL0fDvrEhddv2RSqJ2CRTBvkw08EEkJvGTJjRPJT0F+AUl1tJdpZbJwwqzdK2lIDIg6P0fg=
X-Gm-Gg: ASbGncsEwt7ePdbj73gt2pbSyV7nTqbRk4qeANcAeLTd43wiF2yZPz+oiBPf9iuTHg6
 ymGd8AvOcNQzQVoIHa/XhRu2PuvaJMDPid6wPx8v1acxbgzNVxgKv8ofYtPdNoaXijE2kr/Exhf
 P7qh5QYcmghmIP387gNF1LPXSvWdJ+dOqx9Qen459NCkjfCRTzWoMHDOx6hYncBZTrUfQhJd8pq
 cHS/Hx1HG2cvo15ZNnCtIf1+vIITezFzgsYG03XaveYNDjig0z19eDnVWVF8mCmiEymXzUDxmc1
 2Et6vYOGhx++MoiH5mUlREgwrQWrB0Rtzq5DDSAwSVGSdd6PwfBeqmsg2HWWi0mGJ1Zn5EfroUo
 p8dLHT+xRCAF6BwZhIiD7wS/6fXJlOFycIybAbhB2Xz7SjaVbRub4
X-Received: by 2002:a05:622a:2614:b0:4a4:2c4c:ccb3 with SMTP id
 d75a77b69052e-4af10a4a6f8mr71116031cf.38.1754173439776; 
 Sat, 02 Aug 2025 15:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrRsxcmSymm/iOQUBWA1JUQnU1xwsXzPXR9p1T+dpkt3Av38hBwrNFCZmoKC0DXjNEzzqClg==
X-Received: by 2002:a05:622a:2614:b0:4a4:2c4c:ccb3 with SMTP id
 d75a77b69052e-4af10a4a6f8mr71115661cf.38.1754173439390; 
 Sat, 02 Aug 2025 15:23:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88ca6776sm1105446e87.141.2025.08.02.15.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 15:23:58 -0700 (PDT)
Date: Sun, 3 Aug 2025 01:23:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
Subject: Re: [PATCH v9 00/23] Add support for MT8195/88 HDMIv2 and DDCv2
Message-ID: <2eq5je6xk4ly5lxijit3ufor7pmm7mgivbuigzr35lrbe2ryvr@3axnsyabigm7>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
X-Proofpoint-GUID: I79GG9PHqVvyIJBem8B0cRQzRUTGlfj0
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=688e9001 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=k3YYP44_YlkhweOvE2wA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDE4MyBTYWx0ZWRfX2zq0yUzNlklQ
 nIKOSz66mSqO/9QCSr/IKSC21gu+mFlTaYXfmo/asuuRHsNJq9HLQ7Ym75P0gX2hinik/yOTc83
 J1l18NdIFjmpUyXctsGMHIFJJpWRC65/Jt0/d5qUXVJdsjOWGeIaErkZLZ6oLME6A4YGSHx71Fo
 kLcGzaNfQetPTf0dA0gvrXs3/MgeoWYB0ylHz5EBCi0SdnE0Jd9kYYuja2jgkCY4BPGgBzssYiL
 IDEGY8hf3WJ7CEbclJarO/MdDyt2KW835ZADCpkr5+7zaEZ3yr4HUTLNj04lgMo4T6IM8qitsxw
 aqHW1iNF7PpI6ihlsWQD13/ElHCWsCCqsFuNAkFLGt8TlVcb7P9uM9ibtTKqNxS14pR3PXxcc62
 PhDdM0+t6mbVHuARqNCMa9/e2LZIh2CW+is6yrxCvO+TiqFSMmFVrY0yVevb/2F6llnzJOKk
X-Proofpoint-ORIG-GUID: I79GG9PHqVvyIJBem8B0cRQzRUTGlfj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-02_01,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=765 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020183
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

On Tue, Apr 15, 2025 at 12:42:58PM +0200, AngeloGioacchino Del Regno wrote:
> 
> This series adds support for the HDMI-TX v2 Encoder and DDCv2, and for
> the direct connection DPI as found in MT8195, MT8188 and their variants.

Angelo, just wanted to check, what is the fate of this series? I think
it wasn't updated since April. It was a really good example of utilizing
the HDMI framework(s). Wink.

> 

-- 
With best wishes
Dmitry
