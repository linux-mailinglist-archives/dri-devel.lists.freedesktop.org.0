Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFBBD3A6B5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 12:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1A510E244;
	Mon, 19 Jan 2026 11:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cK9FqWXf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cx5aTybP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1739F10E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:23:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J914xi1044553
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Og2bNnMCiD+Qnx/yVwl7sa8q
 3E6jkBERvqpmHJS/OCs=; b=cK9FqWXf4YEzqdLtmjNxnI+ZOiB0a/BMinmgC5Nz
 A0AbGvNu5UOyKvZ0hNbB+39/iqnS/I12vuN96XYXVwIRHGFUFOuz/rWprlsueylL
 PQWRBkbUldWASFJjRUr39tMwOY6OkL4gvkdkJtFpDllq8yg0kJyY59jU+eUPomoF
 lXiiuN9bladCJM/XLOmMXcieoD/v13fH0X+G5EAgaeXu2Ig7SlYnwaj1rC/tYYEn
 iJJ4BhxhpRJA6mc7SDHc3fhCK2n6XbbZhTYUYz77Pc8cFSPmycdxwd+vaToy5vuV
 hgOJrzotIgsyd/6Qa1l7mqlNyzpXFhycJmPvnVadcv2aOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ehwup-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:23:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6b315185aso663753085a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768821830; x=1769426630;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=;
 b=Cx5aTybPHKYWe6RpSKqr6+uoIIq2cbk1gGQcEFKv74M07/kPNFGyWyp4XFz+MSp/Gd
 VeiPh5gBL02nm5DNe9dxQUDcgvG1F2BxOPWptuyKECn6IzEdUk0PX86SdDr4tjO7TFL1
 TM3gya1JWmUWQyStitZAMS/GYHPteFXAVy2GldB6Q4sLyR/eNSaj2Olcr+nXzVIIwh97
 InuZwvaLeJFIk/cAnOeDId4ogKCtU2FVjgLc2DFTI0fVUnmNkAMv70BFjDAViC1bqDAO
 O9QsYABafpf1NrDSk4/k1AF/359VoxNnOAJ8YiN8yZWjbGlJ9rBERzqp7hq9zmO+kUQh
 U4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768821830; x=1769426630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=;
 b=AyY3KK8cLiAsLp1ZpkwLDL8uj+Q47GtKt5Atw+5fD8fdVIha/a1Jpt1HEO3ptdKAq/
 k2A2MkSIBcljUfRJ46b1VN+WQ8fXvXI53rwy3qQ6EiIi3hN60/yXRL+0jaURKlr33H7k
 oI7JTnVrYWRyGb5NtMrLF8Df7h1uwtOeR170yuL+tayBzb6ibvCb68q/nsysGUvfB5E1
 j4tmdh4ZFKm7LvqoSwmNCHm0xiYi5RdEKj5qQY7eV0BDApUAs03LVFnWXRJgAgykdz2E
 aA304GHRxnc7ArC9oRciaEnXhlrzxOf2KoikaeP1zVFuen2knKEwbDT6f0kPnlyX47VB
 aGBg==
X-Gm-Message-State: AOJu0Yx2xsqFBH/rFo3j1SGDknYdIlxbKhilcHDJ7PP6JnQPhjAewRaR
 iro/aT/ysGdHRstT0nniN2Id8Nq34cCKYNHpUObO33WwPX9h5t1sDkNjcaK/D4CB5wAqJ1XB9IQ
 kPtJDffQ5/bUPS3UKHaFArm4dATKbmLml7IR55n1CWBVAT14X0W9Er/Z/TlEC1cTbXIKlik0=
X-Gm-Gg: AY/fxX4sw7zUwhj3+Om7KX3Yda8xxX/NOxNw9a8n+Zz7sCkMyRzlDtfTfiHOdBtYGEy
 A652PkPeHrcHBOM1hxoSpeS60QhYFq5JPDpYMsTNUntOevBPqUYtRqGkLpGgz+jV/fQgmglfziu
 OeO1QiszHZHdOxGPfN2xwQVO0A7yn9vWhEQ8PHrwf+OuDokBSSMEzpfOizjpGmYZkXrosXvp8GF
 GX14k2N5kWUAYKSM8NSA58RKvGX4SjhP6xwt4mdOjo7DSOHd1uWmHipNNz6q6nZ03YQ2hzHIrWu
 eJ04DM17kgjBgVqkpMpftaB0NlenmdJKsmb5j05g+inW00x0Kfyr2qkFdG1rzW3MT2dGkyZm0w1
 tLloY9+7MMDD+fRfgYSVVKw1xp9hB5/TP84gwAOe2aW9u6jC936ZEgT0jdk0Igsx5SdeMRegdP0
 LdTgayI1/9S9H5hYGpsKPMGWs=
X-Received: by 2002:a05:620a:1788:b0:8c6:af59:5e2c with SMTP id
 af79cd13be357-8c6af595e6amr1169567685a.18.1768821828924; 
 Mon, 19 Jan 2026 03:23:48 -0800 (PST)
X-Received: by 2002:a05:620a:1788:b0:8c6:af59:5e2c with SMTP id
 af79cd13be357-8c6af595e6amr1169563785a.18.1768821828488; 
 Mon, 19 Jan 2026 03:23:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384d8d5dcsm30685941fa.15.2026.01.19.03.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 03:23:47 -0800 (PST)
Date: Mon, 19 Jan 2026 13:23:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wens@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes behaviour
Message-ID: <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
 <2fb910198a3be542215592ac3f22d6b2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fb910198a3be542215592ac3f22d6b2@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX0t95a0PUv76H
 N3IegiM1lnZ22mCd7MwS3qTAav4665Z1nO5SQrmSV9324JVSXs8HlAbN3fJFeUhAOni9qhHvj4v
 iLod54lxP0P+HEGRICphAsex5n3kPRX73mzdHolg59ErciGDrVORthSt8bBirjjtWQUUL9k+D22
 ZyfSNZL6YxZ4pVn/I2q+YpLdVplYdMkxl2VWGO50ulKy1+giJV70pIEQmqX/qvdPhaZshpCFFVn
 bmBsMxbJeeKzVb+KxGukH6CvGL9cyEJjg/69QFf550gstFpPYpxlgUISK4GFHGlEB4SJlj+8fH0
 gk6UpVqlWuQAUBGoH5n1VBgdi/COjG4us8Cpq8ionzHPFRc/qF75yGKTUQKHTo4UOvZUrJDVC7b
 tfYLECxBiCBaogu69z+48H9we6ug57VABVdVsAAL9BQZdMD7an823scPPQuiE93H8dMSlq7h/m9
 Rn6glob13Ya2FLiHAlg==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e1446 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VxRmli0-OQd2mcn04XsA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: OsrrG5Ke25ZYVpT-rv3J77H8T7J79pPn
X-Proofpoint-GUID: OsrrG5Ke25ZYVpT-rv3J77H8T7J79pPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190094
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

On Mon, Jan 19, 2026 at 10:13:43AM +0000, Maxime Ripard wrote:
> On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
> > Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> > unsupported doesn't result in a commit error. Also check that HDR and
> > Audio InfoFrames are not triggered if corresponding features are not
> > enabled.
> > 
> > 
> > [ ... ]
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks for all the discussions and the reviews!

-- 
With best wishes
Dmitry
