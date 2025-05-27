Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A142AC5B3E
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 22:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCE789C0A;
	Tue, 27 May 2025 20:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QoGYhMc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3775B89C0A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:10:13 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJJL1d001582
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6Owj/q8MDW3oPRgGhPL0R31xjnGlGRt67klQ5Pu9VTE=; b=QoGYhMc2QWhZHVSw
 3+jKYxeyS2N1XJEPxdEh12SxYKMuFic1745D8mju4/HW4Z9qpgvA+zGC8n15Brxw
 EBRU75cQFcyMYWBIKkP4KhLQyR92xH2vcYg4TVTZgsgP714PS3xI9qdzdEj0oLUV
 6qn29wOdSOHXK+VS6sArIbkZiFIcUKsW7ZDcGPEM8g+V2BuHxwaowkw5Ne6FMC3I
 d4VzIKurce+QUC5q1YaUKc+I70td5vGRmBBbXTk+VERwwCslfqm8uAl9SNjXMito
 p9aajEFix9KeKDmaojIaq467By0yYGCzcL08vooa1evu3Jra5xwPtbSaM3WibGf2
 1q5rug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavksv4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:10:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c544d2c34fso505721685a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 13:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748376610; x=1748981410;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Owj/q8MDW3oPRgGhPL0R31xjnGlGRt67klQ5Pu9VTE=;
 b=jACS5AkKmE9zbi4BUeiCLdsb+6bw8LcSHvVEHczBmqeoWMlsPvjMeDG2k9SGm8eA3R
 JOr8x3KiI5DJwXXA91hjAdSJfYM+kqjeGeGyBEccqvtZdeiMUjZ4vFDy9zD+11yQMEGE
 iUQqup1OLuOBQQZK7ITUS2pBKnp993+QPqMpVQZeH4AYPPq9w7vNs1BXVwX8l7zA/xto
 fPO0KF46vl98pTegw4+Cme4CpwC3Q63vb3/b0pdiB8irAFlBMPEUaEaDfIU/47du9YJl
 /emSciXtiKOJ3mZ2SZ3rcCoI0Le6M+vYIjk2CBJb07RlC4XDdpnsriffJSgSMBEWsJ5t
 EzsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG9+dIJzvtMwYISIHi9XWXdp6H6WzyylkO2g1aXfLivKQ8hjvEet8O6njeBuUHRremNPJiQW2ljIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr9K0UF0NbQZVCkZhRs/NB+zP7V4p2bMe08u5e69GjWnTzVRY1
 Em3FVrGldOQCAHAm1FJcQQ2S6o4Drt8pAr9OdLl3KsGNgK0x+I8IC6HUudnP/BbzGexlyjTPHwu
 lj+D7MRSNFr3Zy06ZYkqXbsqiaNDjZPJIPnwCHT8WDaz9oE951DXZ2YjwnOOAMybbIE2o8uU=
X-Gm-Gg: ASbGnctT8EqSpAF6/nu9LH0iL7UWXibVTfwJlp1yA5ON1Bw2LJDRNYsxPIHdJnu/NFm
 t1KHpQzK+vDhthlwhTwEy4EfrqD6VbzweuW0KV3SsdXCO1y1sw8vptNSnYNDglnk3Wedxoq5J41
 chRIqxWhFwKECOojObQFeMcHjEoi2MqzADeBP6aXRXoPrJWLxbIJAqIbhKbY9nEsllpzUeN7Oap
 W80+8LrhhFNawXrxYb17LJcOZUpBLQZ6U0Z3m7wnI06e9PhomY1riALtPlXsiYiZdpn+mnd8ucp
 eRoPToECrfGjpV8d94pXLfUGRtn8NPTgEg1lubW356dOHpO/CY87pt028Le5IF09AO0i7Yo9Bro
 =
X-Received: by 2002:a05:6214:2025:b0:6e6:65a6:79a4 with SMTP id
 6a1803df08f44-6fa9d35b343mr214911936d6.44.1748376609949; 
 Tue, 27 May 2025 13:10:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERinI+Jx/0rl1f1e9a7mxHigY8cprXWibM54aGl5SogMthMUkckg1NTLlEEnP3qiZxr5LPTQ==
X-Received: by 2002:a05:6214:2025:b0:6e6:65a6:79a4 with SMTP id
 6a1803df08f44-6fa9d35b343mr214911476d6.44.1748376609413; 
 Tue, 27 May 2025 13:10:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a6340594bsm8643491fa.4.2025.05.27.13.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 13:10:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250527-hdmi-audio-helper-remove-fix-v1-1-6cf77de364d8@collabora.com>
References: <20250527-hdmi-audio-helper-remove-fix-v1-1-6cf77de364d8@collabora.com>
Subject: Re: [PATCH] drm/connector: only call HDMI audio helper plugged cb
 if non-null
Message-Id: <174837660819.602917.1928145236467232695.b4-ty@oss.qualcomm.com>
Date: Tue, 27 May 2025 23:10:08 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: -EZq57fgTAuwojVDrxc2zGseZJlD_48P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE2OSBTYWx0ZWRfXwTHI9isweuL9
 akKP7gX63uf4049oVMs/0QZLS9kS5ahHm58uq9+lOULkk2DAPrcccRWawf3d163i+TrcXKKGnfI
 Dwj19f5Ii4rAshfbARs63Ump8bV9OX9mjjoJMl4o+BfxDVTZJyT4gQwLTV3b3G2vm8+sSf9uLoE
 X36n3+Jvf4K88lPz7POyNelSds2BXgwZr34n5PYZRiwA8r+53A7zIcym8KjxvpsxdhXWYW5LesV
 D1hIsk/wkn2R/PYl5jxmOvcIobvyo+OaMeHfjTOOCDNPGQeX+COVHoRkzoLP1qpHffsLXcPlTxE
 DWYRmNgjOzP2sI20z5isgqfciGeL1TjXXL44mJcQ0jlXQ/eWDg6TTpdEjYwaCRjV4yZCxZWtfbu
 ykvDYvT61Qd+KunO137FzbiSsXi4fAHQyZEFuynsQvGupPuEMYsokTh6ryZyHqJGLk3xLiRJ
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68361c23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=3R2PNEn0RuH7tX0IixoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: -EZq57fgTAuwojVDrxc2zGseZJlD_48P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270169
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

On Tue, 27 May 2025 19:57:08 +0200, Nicolas Frattaroli wrote:
> On driver remove, sound/soc/codecs/hdmi-codec.c calls the plugged_cb
> with NULL as the callback function and codec_dev, as seen in its
> hdmi_remove function.
> 
> The HDMI audio helper then happily tries calling said null function
> pointer, and produces an Oops as a result.
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/connector: only call HDMI audio helper plugged cb if non-null
      commit: be9b3f9a54101c19226c25ba7163d291183777a0

Best regards,
-- 
With best wishes
Dmitry


