Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8621EB0C6FD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8FC10E563;
	Mon, 21 Jul 2025 14:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNXilcgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B58D10E55C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:55:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LAMnPB015997
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FejjzcessRXamuxdGef6IiWtk5XK9CE9N5H4NCWgoR4=; b=PNXilcgUTbMv1ouq
 A1YYn1t4ZKuvtrEsH12jT5n1aov+zYfP8o8+0WQP6+kg+4OMdpBurm8ataI9Yw75
 bbL0Yuj0mw33YiN+G0TsVc/fEtdvAlMObpiKSDHgHN/kWSajdPZTh3fpciqa6t8C
 qL+bU5nSd7BjCvu2t8EM85mbo79+Us41V0/xkeqOzmqQVcJPubC47CzFtQxj7Hhp
 eLjnJ3Mb8iHwtdJJ6ZiWLFTen9nj9Fupt1Anrm7QLGUHBPiPp3hwY8sljekyf+iM
 bP2He1bdTd/PcUuemlCkKHgrM4DrGv2NGBWc143uV/VLaZFYJX6GQAyu92P8iToY
 r4oAkA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451dmuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:55:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-235c897d378so40999435ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753109705; x=1753714505;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FejjzcessRXamuxdGef6IiWtk5XK9CE9N5H4NCWgoR4=;
 b=DAz3pQKuH50BKfnnDzi5IvvgvqrGVIO+fEHnF9BkxAvJ17ZtuG8nc764BNVnOTeASO
 GZeiwddNmnlrVH6+w3Qi7t6Ze3qykHRfhExU3tb7LoPNTvK14I5ay8C/jJLmF3XghVnj
 gPdijOkZnIUntc6OsbV6PvaE1mu1dBKGhgv+20eU1RWsrvQ1x0n+3X62kjCB/XJs9Wpv
 egJ9mNgmCXBm8312oKrPKxJlBB1tzL4jrd9ljwqnlRvdcSIZAoeqTViSiiYMvAIwLSLi
 jODw2pGFWOAYUR8T2gi/9bl9YKaV7OgXcSu/h0KkXEj2GQyE7GFsPjtcnj3NBhG0OQj6
 8P5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoq3riVHAicQr2wszXBcYN/ie7j6V9LLFee/ofuoZsMUS5MKH+SwF/1Rvf1tKBp99gg2IGTd4HHSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBo+K434NVNcgVK1YZBWpIqnbYYooIIKBnS7TQJ3w6z1PvHknV
 8jFBt46mTDtj4bFRVj7zi8gVPx9xwhRAntlYSzLM7hdI8/QiffNtJtrFJXZA508qEI5tZig6sDq
 nEU6aRl/LjC/toRUeW5E1LYzg3EpYuP55RVU1OWmgfvgPhdAoL5IrcDx/hVWZn4j4KZUSzu0=
X-Gm-Gg: ASbGncv1l8IZGsW7EixC3Ef4sSSm2vV4E+u4te8pvaUB9M7rOdb5NBAkk8a7C+vTk2+
 VNXrLMpbYogpVjo15JSlY2hGmplSki2ey3wq/ZNx0DwL+OXqEtxzb3u3HF75sx5oeOcL0EgKnaL
 NpQNSUGuqn6fPliYWfGeYS8U8WSIfQEAsbKz7Xx4CqlaTLQr0mu+QxPrg6yTjEHzSXQBQFcnFe4
 gkHRJtLY/SCjWSp+6nlxP6DFY/eCBJSOr3LP3Gm+TV3NAGG/PT2PBba7vIWJnO5SNscJSkTRN3M
 PzQRq/YEHMOXVw1epPMMNozWV8T7AGcPFoitiC6uISVI64tdEpz61sAwJzuroyFmhulvEVCmnnD
 cXpwYqsVlfv2YOQ==
X-Received: by 2002:a17:903:284d:b0:234:f580:9f8 with SMTP id
 d9443c01a7336-23e24ec73bdmr227526365ad.3.1753109705051; 
 Mon, 21 Jul 2025 07:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ97391DW7uxpfMEy3HG26NDZaHXwi2jparAOfw5+iKlWu2Jnai8JQP+g81zAyqSEzBAX4EA==
X-Received: by 2002:a17:903:284d:b0:234:f580:9f8 with SMTP id
 d9443c01a7336-23e24ec73bdmr227525925ad.3.1753109704562; 
 Mon, 21 Jul 2025 07:55:04 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6cfa0esm59073595ad.145.2025.07.21.07.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 07:55:04 -0700 (PDT)
Message-ID: <b48c6694-2bd1-44d0-9dd1-1b7a67e22d87@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 08:55:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687e54ca cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=DISFzqtZAAAA:8
 a=I0N-cO3Jf6GV4mgy0ZYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-ORIG-GUID: WiXgIRkwucNBeKHwYBmh0cwila-Kp6W-
X-Proofpoint-GUID: WiXgIRkwucNBeKHwYBmh0cwila-Kp6W-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEzMyBTYWx0ZWRfX5BAXXnbEQU7D
 dCEjOb8uFrhROJo8126aGHIXkwIijhFAosKwA8XU/0gESm9VI6twEw7BG2o5IbJUwy3vHRPswCD
 O4YK2PJkH6fjoI21IJkl72NPXj/bywbp4FCXwnemUi5GxOhmdptBPYF3CYPZWW4v9lXFxSEkGZz
 R/D9lSp4487HFo4unvjTXesceRBMCTSwpZO8vI8wVE1Ri1pwrGdByCbXuwG4kDBFNcMJLaboOut
 Ppq4L/gIJ/rD7b2HYT38LkvrevuaZQwSQj+6pfQfXhNDVN+pOtA2V0kWTtq53wP/bJy6ACgjZJ0
 EqtPVAS7cp5CDSTp7zYXzI0ohpRnyeomLC4Rvhcl7iqgG26zY3VWzcZY6ndpS6ZdaLrkhB1ac2o
 TtFGO5eV1PX7XN0uo/dYxdqHBqsfucjq8dhSaQnLkGOM7ymZOunLcHyCaUGzIh0UApnRj8hG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=872 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210133
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

On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
> 
> In its current form, it supports the specific NPU in the RK3588 SoC.
> 
> The userspace driver is part of Mesa and an initial draft can be found at:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

This (and the userspace component) appear ready for merge from what I 
can tell. Tomeu is still working on his drm-misc access so I've offered 
to merge on his behalf. Planning on waiting until Friday for any final 
feedback to come in before doing so.

-Jeff
