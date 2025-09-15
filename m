Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5B1B584E5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 20:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F4A89F71;
	Mon, 15 Sep 2025 18:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PlXw/uhj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7E689F71
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:45:32 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FEBXRL002143
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IhG4O/EXd8muCOughfBp0STWT3L0CUbcXi2YvRH227g=; b=PlXw/uhjfpTRIatW
 GBRmkdtL2xVg+JWPktWzlbnf6QonLDYTB5l9BrI446vZCBceWt4CRZLsNWeLxU28
 aXb9DLC5qi38DHIiWXLHiqNGhmDh/JQPhis7LIvMuWWus7ZTCIOh1LgaRkwWJf4g
 wJEwpjfgb9+uQh5o3HOoocW4pWK9d2KssUXmoGQFyDoFa2NbWCPvkmKDEOEqnjmI
 bQaOwvyQN7MShcB5QoI96zpzW5Z9ZPCpnQSKGge7bmeg34GFBGMiLnpG3aee0prk
 D6upArbrr0DvaIPpz/Vj4Y1BHmO4q/8jI989UPgoHw5EjjNsdO3PbhCx5ovEHZOQ
 G+GkWA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da9aeuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:45:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-786c3986579so17565666d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757961931; x=1758566731;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IhG4O/EXd8muCOughfBp0STWT3L0CUbcXi2YvRH227g=;
 b=YOoaTxDGRlgyrEzGP+MGBoq34ayeYNfon7BnD0xBuJWcuUGcqO8qMxVPFQuHBYuwkh
 h+0g2XExnw8NpglhvNotf4T+lrPgRZ0o4Zn4KAK7T/Yz6k2q8gY/bcMiwnpsdjbefdCu
 KV3Wa98VXSXX/d5PFAe34C6QAMTxY2Jc/Sj1L5JUwUBYBSYF4GuvtJEig4G264Z/8KKc
 obTNRwPWO7aANRxH23N9uFLG/F+EBqP5kbwqPc/BsxaxdpSOlZzxZvCx13f32xAgj8nl
 WEerdIkLRjT7nMMzboFh0kVxDxdimyRzG/+p8s50k4I658L6dMlIm9Rim5qCiglCwpRm
 J9tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuasKqS2fwnO8BWyfoRW9wJaqhX1Jax0DWZdscGOWSf7PvUsjId6CrfhABBmE9pvuWidDf42LstDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT4//BRJFzA9IMxdLvgmAmd7rHdBLeLcPLkZjKjP7EhOam8fei
 X4jJqYLyxFH2ewuniXuPas8wJVYGsev2JrmqJMn1BwCk/mVwRk5b8xJXpEyY26MUdrCbREESHme
 jtSymXSRMuTDAfmrV8HMhlEyqa91otVct2Ba3Ap8Wrjde6at4CP5fxLR/7kGANLutRecNXeM=
X-Gm-Gg: ASbGncvKgZaFYR51hODzeCtOIXQtu+vI4toLRlmLQFuCX3Eg4tTFbzIX3HVJG6WCN3o
 XILalWFuFj7So0cGYewncQlu/aqGpi9lpjh1pG9isjJ2zwvVO7M/5tiR5qPJQTtGss1rhmHSJde
 NgYclidPQvz6ZETBpxaUJ6PuUPFcXpYkIh+WaGt4Rycej/QC5T0tttv1RrA8J4XpvwDH4TvnLZL
 cz0hnPC6M9gJeNVJ+7ZT6Vt7YW9Z1OWb11gKAEz0/dvD0VlafC0eX79b3b/hifkLTZRIicjXTeQ
 ZDHD7Sd1gQWY5UnJ3xR3InIzkjQmRH2dK97ok09B+jgPictIZjowgAJhclnK2mNWi0gUFwdfdAX
 TZkxjCJGYDH2+rX2GUk28LpdNtNEfDGmWwnvdpeFMthPipwhXk0FY
X-Received: by 2002:a05:6214:d4e:b0:766:769e:8c79 with SMTP id
 6a1803df08f44-767c2be8032mr189965726d6.31.1757961930464; 
 Mon, 15 Sep 2025 11:45:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmrWfIl7CmMGW/DaMc1BVI1dcDXfE//3x+Mq8gnVVnpv/GMQWg0bopFFbSV8m5IJZDs/ZvVQ==
X-Received: by 2002:a05:6214:d4e:b0:766:769e:8c79 with SMTP id
 6a1803df08f44-767c2be8032mr189965146d6.31.1757961929677; 
 Mon, 15 Sep 2025 11:45:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b623asm3815434e87.11.2025.09.15.11.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 11:45:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: lumag@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, maarten.lankhorst@linux.intel.com, mripard@kernel.org
In-Reply-To: <20250709085438.56188-1-loic.poulain@oss.qualcomm.com>
References: <20250709085438.56188-1-loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH] gpu: drm: bridge: anx7625: Fix NULL pointer
 dereference with early IRQ
Message-Id: <175796192787.524478.12029336262395393555.b4-ty@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 21:45:27 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c85ecb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=LWE9zbpONBY6LCXfEiwA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 3PfIbkGWeCDhEJldPY-_2j_JTDsjIJtm
X-Proofpoint-ORIG-GUID: 3PfIbkGWeCDhEJldPY-_2j_JTDsjIJtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX+Xfmguc2AtHg
 516PilZsDP2ONzS8khx6Qiug4nMxFw7RwJcj3yqYz7KEoDwsasINPqdaLp9BZ+kx8P4egLS8E9i
 qVy6tBkr+UNnklSgCXTOS2tbtNOp+b7BOz3HvoLy2qiDN0nmJkNAu4u/Ml5qGZSOQB3kUVP6q6D
 xDDqVyH+PwXtJ2mqzheRThEdM6oXgYknydOAlXq1JLVoE0Ad8kXvdr96Ik9lSPgDkeD79HOkF/e
 naaNLY/seZN3coi7z2zP580Be01urHyu0OtqgwLMT/hydQWHWkUs6fiaEeB7JdypIHP1OQ3UIJN
 MsvcwzVgwhDfp+yN5/IH2tlOyyiFmhqmQnkdFuf/FHmMWgad5/ER7joEDm8+CCJMzwgGo/5nU66
 ZTMDMG3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056
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

On Wed, 09 Jul 2025 10:54:38 +0200, Loic Poulain wrote:
> If the interrupt occurs before resource initialization is complete, the
> interrupt handler/worker may access uninitialized data such as the I2C
> tcpc_client device, potentially leading to NULL pointer dereference.
> 
> 

Applied to drm-misc-fixes, thanks!

[1/1] gpu: drm: bridge: anx7625: Fix NULL pointer dereference with early IRQ
      commit: a10f910c77f280327b481e77eab909934ec508f0

Best regards,
-- 
With best wishes
Dmitry


