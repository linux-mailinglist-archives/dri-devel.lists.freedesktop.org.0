Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ED9D06F91
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 04:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2356310E269;
	Fri,  9 Jan 2026 03:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFQgQyQQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjmWjCHb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C5910E269
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 03:21:16 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608MqTOt2330318
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 03:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=l0S9oVoW17ZH7EHn9m++kxRL
 IL6UaU+sg4ZdoxU8wC8=; b=jFQgQyQQCec7pV7N38Bwd7g6+2p6h2fEE+scdPJ8
 /RH7R7HnMag3gKilpUHxoUL+zcO2AgI2HPOflOVc1DbesViVs/jgPOMZ7szOHkz1
 Wa41X2JNfK4ikoTD4p3lbEKF8tMUQG2sTHRjzl/pXoasPrjWdZjjPFN/0Vu3oGZ/
 v4yk95aLoKCbWhQ6r6ugYSw2tdsk058R4TyX1iqbD5DsMrRnpjGK/z/YMgRx7VUk
 ++q75AloMQPrr+lZ4KaWIKxfGqD2uyx5mKallexTQlKjRoSapmCRnxJEQN+MesvU
 pjavZRh2F3JWa4zSi9/G9NS1EfROa8aBQfhx+WfP0XSV1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfda9tbe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 03:21:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b24a25cff5so1147551085a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 19:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767928874; x=1768533674;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l0S9oVoW17ZH7EHn9m++kxRLIL6UaU+sg4ZdoxU8wC8=;
 b=NjmWjCHbTuh+vfA2E8jka2Kwk/PT8A4iYGvbg0bHC0oY6ThY+cGb3RnJAAjO/UbPar
 K/UYQDfBt7t1U8IW+6yS/wmnhiCNp4HWHyRPKsJY33yTSmtpg6NF44Y0aQwEhrOd2bTL
 RVcaC2PV6sTDXhbpWXiTW7vB+cJxp++Rim4YTtYDScSN5HEFQnbD5xYnYzIDTbFKLJgH
 7K29BTY2DfiV9o/RvK7x27pNWJPgSwRtKZ3jV0pxVW+rzSbPIe9skRNqrx1rgB5Cmky2
 ndR3o4FESgbBd/Vh9ouzgtEEzqTsumOm++H5IfWeXjVDDXKJ5cfPiYA1mPfXn3x6lH5w
 stZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767928874; x=1768533674;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l0S9oVoW17ZH7EHn9m++kxRLIL6UaU+sg4ZdoxU8wC8=;
 b=r7U//lZT4+yvFW/Ei0X3zG5/G8bnV5auA3dxgTGOHGItTQgduRVquTHBYYFoJ0IgAL
 Vu2IHUnMsoo7+m0iOR87Ey/tq7ty6UPyBUJLxRMbsQD4MkpoDF0LC9IExA+B3QI94tsO
 ANNsQO8GXoXJ/K1tA86HzTHcd5W6HY0Y4z3SeO+lvZSBXrWBxAv81u7BxFby1haZVL96
 +jzbG0SRu/BFB9S8umfiLCu0GeZ1faMrj2z0xJ+Je6w5uMFg/byGESVSPVZiC/Lo8vOR
 D5agiOZWaUO6+n5thaf9pwZs87SaknqWmjz23MHfCsYTANJG7jFznH3TAc+3b5vmHwPI
 z+cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9NjXNAOH/p+Ij6Z3cc0sExoOd8AV+WQN3ha3nfQ61f+zGtYERgpTG4LpZB6pnQ9M5ouWlcJhrbLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAVRiubSd5/SsO7Z3s1YVjObYLQ6OglflJH1hov5GBQ+GV6i+b
 zjfqGF8IlqJJ+4s1Gqv8+rrqf1wy4rPlIY53sRn6bQIzC9SGJKoGE1BPMlRIu3+YDb56mEZu7Pt
 0LOnyg/gZ5vHPsP1ud5ZIjUbl3HWjI3+HdyGZweQKtjr8GVMjB3AyGG/bOhczr00mii7P9p0=
X-Gm-Gg: AY/fxX6xAglvc0ymROE1IV5dy4+n9G6XOpobv/ogaaPm+K58TKwiFGODBKxIuZCcS2/
 7rTQyyhl1F0HRzo6FgmPJnS2nLAuaxMurtYOWDAzqkieNwTiyCJp4HLMExeYz2i0fpnND88j16j
 bsmi3ymqPzoIaWF4znEaZ+j8bMkHTEplD4STr0V3EMPRnTu6vCr1iyE3f55Y9ptKdaMhkxtrtO3
 /KVaoAICxWwboJoD3EGzvxoA/Fbh5RE8JKZl17ZClv/G7GZtr/oV1+C4n+yCnO2lVgCsqYOEbZz
 wtoQArDV1cnl5l7wdg30pCEPJGsOYNKIc07DalBS0VZfX5sfLOSuVUKPP0PJjL5HeHh8n8inAwa
 Aeyri/XOEFL1RD9hzi0tgHG6NrcpsOIHIhg5l/iKYnyRZebyoBOhmKogwgynl2CoEYwA2AwlwYa
 jn0Rvo9uVAJybgwKOQYckMEcU=
X-Received: by 2002:a05:620a:269a:b0:8a4:6ac1:aeb with SMTP id
 af79cd13be357-8c38940dd62mr1175659085a.74.1767928874408; 
 Thu, 08 Jan 2026 19:21:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7544jDNijz3Oqai5ryzQM1LZ2uw6kV2IuP26zDDOOLBfIgypo+Dzcw8kzTONbK6QX+Jn/2w==
X-Received: by 2002:a05:620a:269a:b0:8a4:6ac1:aeb with SMTP id
 af79cd13be357-8c38940dd62mr1175657085a.74.1767928873942; 
 Thu, 08 Jan 2026 19:21:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7a5c1dsm20225721fa.16.2026.01.08.19.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 19:21:13 -0800 (PST)
Date: Fri, 9 Jan 2026 05:21:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960742b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZmktGZHw0soJo7N84tMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: k41ed2wCI9lIvFiMEd1M_kfiRL2eNVB0
X-Proofpoint-GUID: k41ed2wCI9lIvFiMEd1M_kfiRL2eNVB0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAyMSBTYWx0ZWRfXxgrR1md0y32q
 HlpVLU7EArfF8L/akvQ6RibU272yOUXIyaxLWbcIaXcosLgV5dp/phE8hZIIRg+oV2vVDde1zon
 jLcQZZovNHA7ZaEpjOMH7M+xbZMWjowmz8oQbJ5F7AFrE+XW3BpImP5xthoZUYoADDjzPh1BrF6
 FC09bn81eXOrVzXI/dCn5n6aKGfvfLH5rao7Uz6q0x8XAxVfBy8xoSJYbNLELO89pxZ8i97GpSs
 t1FL8PyEadKH/9gx/gkzFNZRnXaFTXS9r0dd+UEZ6zYUeFjcIGQ1L5b9+Hy2+bL0RB8euAikOh4
 qi78Aw6DqKGgIM2o+zvtL/loOk+IdcCjKFtw+4ALgaE/JcEXJlMX9v+U6z67t9vhaZHsFXW6DOT
 DQ9cruBHh4oOGSXrQxXksjAM+Ur0AA8TcRm1mIkq2Js7x7bouwO5hMgPNYp6XaK3N4DkjrlL3L9
 up6l2YMzmd3sWEkv89A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090021
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

On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> > > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > 
> > > To make sure the correct settings for a given DRAM configuration get
> > > applied, attempt to retrieve that data from SMEM (which happens to be
> > > what the BSP kernel does, albeit with through convoluted means of the
> > > bootloader altering the DT with this data).
> > > 
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > 
> > > ---
> > > I'm not sure about this approach - perhaps a global variable storing
> > > the selected config, which would then be non-const would be better?
> > 
> > I'd prefer if const data was const, split HBB to a separate API.
> > 
> 
> I agree, but I'd prefer to avoid a separate API for it.
> 
> Instead I'd like to either return the struct by value (after updating
> the hbb), but we then loose the ability to return errors, or by changing
> the signature to:
> 
> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> 
> This costs us an additional 16 bytes in each client (as the pointer is
> replaced with the data), but I think it's a cleaner API.

What about:

const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)

I really want to keep the data as const and, as important, use it as a
const pointer.

> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry
