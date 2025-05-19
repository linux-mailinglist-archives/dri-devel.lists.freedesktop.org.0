Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC6ABBBA5
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95F810E3BD;
	Mon, 19 May 2025 10:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6Hbi8mZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106EE10E407
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4FGqY014521
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=; b=V6Hbi8mZt8Q9rTxN
 i6e+4wxppdu9aIST4QWeF4pbhARFuuYr89ACDnyXrLkvQwzBouNcrRRoLBYlY38i
 Gz7J/rXd85S3MskSUm4C05jkjMpQudqpIsySh/BPWN6vB5KmIeMXr0NOvzN54gkp
 LzZYCLxXpRcDZF2p505v3QF0nTwcCMwwruW8lMwuF3ifBX0qmVHG7xVe1DaHBElI
 JbIdnpbwvy8Zh2tY2eQBrvjGfChY12yxytsktbaYLYsonwBikWVPZpChWeOppgHD
 NbG6BcLcMvoIPoKcIHlGHr9swhnHQMsorBygjnsPR9gHFapdR3SEPkM7/jk/2bSD
 azMOjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwenh5ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c7c30d8986so1403796285a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652325; x=1748257125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=;
 b=DVtdPHvBZbB0X0l7HubKTXFIhqbleHXvqMSxOLS2mhTosdERBNm1FwWRzFV5D2ewCF
 Z5dKmDvl8i77Gt3z2FolHie3cD/ZG9JDnQtA1CFSV9V8YH1QjtTTAu8yQxkilK7tu7+a
 g4U78RPtA4633b9wXRXHnse389kP33ARv/3S4fcqIpL15wqFnAuU1ErBlkc+eKfaQvQs
 Sjrp4klzBvCn2oy2+CK9yISzeUrmeGq64R1+ZmeayQA5d0A/0Z+VzyC3cIG1/TeWPCZD
 OOHlufBoZOwvUq5myek7CN4VjWsASF8u0YfQO0L9flcPpbEI7lqOUTiMdFQrIFb5JsgE
 8Wtw==
X-Gm-Message-State: AOJu0YwpidpsAdVqlp8EmrsmL2r/B7AeOP7n8SEi2rc6P2o1F1+bR8a7
 uQlFqXj1Zb++BqgtU4tw96hVtT2/gG8kxzDAFAAEOXvcmfxBSqoYUc3tbSqkvJ9mGVsbzQUmOeP
 +QgW+YOMyz2qVRHWEL67Np8KJulT/pX4eTWIvgEVZY699b+XAB+nxB+uZdVrKchhEZCpz08Y=
X-Gm-Gg: ASbGncs9vKJ77TMy449MJZQVImFgNO/hz+N9q5GpG3Ix+4P73ZVClE+QvMXF+5aNRIn
 rUGGQ3p+sqoTMvl8x8qrnKm84de8LDXe4Bl9WlB2g5jzkgck9lC0okKzXw3ZIAXPAuKgGS4xXP2
 Wwa6y6ONtUsrKfTvGWx7cMETlDHOx9PuLv7nrN0TOQ2rISXipR3HTS7seWvy4ejPEVajobVmHi6
 EzgLl/iZpekKXjxomzFrZRj5mSI8/2JsYC0YuO7iCn5pUk344cIfdClXG+CvyNGRoqEuvbHCdrQ
 /7Y52bOanYLKvwIZ8+GQYRtAW1D8DzfRv6IyfPQzLnJEsg3tA/vX9VlrbgJMQ7xHaUwyHH1nTc/
 bxrSDsq2Xr2ZUZBOU2T7yqbtw
X-Received: by 2002:a05:620a:438d:b0:7ce:bc7b:1d0d with SMTP id
 af79cd13be357-7cebc7b288emr569708985a.38.1747652324681; 
 Mon, 19 May 2025 03:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG38H3cHcZDLnYTmh+6whPIorhfzFE5GyS34FL7x9/2wg2Uv4PTcUIPRws98NMik6MAgAHrpA==
X-Received: by 2002:a05:620a:438d:b0:7ce:bc7b:1d0d with SMTP id
 af79cd13be357-7cebc7b288emr569705485a.38.1747652324358; 
 Mon, 19 May 2025 03:58:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] drm/display: hdmi: provide common code to get
 Audio Clock Recovery params
Date: Mon, 19 May 2025 13:58:31 +0300
Message-Id: <174637445761.1385605.12669862804792916978.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F8EYoIjxPILCiTf_ECltNpmFIyR4PaJy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX1Cmd6QdRDZ+T
 WImrvkuwqyVL0K3ER9F6GJxknk0A9jjkaMWx4XOLeDW0KjN0XdGqcpHgt6GI5UQ5/JC3z6MjNti
 mAxfBifrIuJx/PNJazRBXnBY09tsjY36p3pmbLz+Vdz6DrOqjE++vcOJOWrztzBaHrcZ/tZCtyR
 mGSzOCDbaZI3T3k2Hx2wbR2YBl3nQvIyxExdNiOLsZZiDZUirmyp07ZzkDlHqrV0f/0EwJUA4eK
 fU5CSjfiG6RKwAgzhOdYgqDS68ghstWmcDpDy5wcvT6R1lObLdmxTfpbrDmyI+bIqoJSrsiYwQH
 vnzZgL1eE9pa4VxZLBDiJwNkkbux9i7IKboUat7KNxVd9XUNlD9GdRF+DqqNR0WIF3/0qK9b6r0
 XYaLPVZlC2phOqBSmIiLzuKtBSbNHqn+rjh6sv2U5lQNbTAv0SJy4Eu8tm5XmR2ugZ/Fhtc2
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682b0eee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=OVqkDxUf0f5yx8408MQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: F8EYoIjxPILCiTf_ECltNpmFIyR4PaJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=980 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
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


On Tue, 08 Apr 2025 16:54:24 +0300, Dmitry Baryshkov wrote:
> HDMI standards define a recommended set of values to be used for Audio
> Clock Regeneration. Nevertheless, each HDMI driver dealing with audio
> implements its own way to determine those values. Implement a common
> helper and use it for MSM HDMI (tested), VC4 and DW-HDMI (compile-tested
> only) drivers.
> 
> Note, this helper simply implements the database for these values (HDMI
> Section 7.2). The question of selecting supported formats and rates
> should be handled by sound/soc/codecs/hdmi-codec.c (pretty much like it
> is handled by sound/pci/hda/patch_hdmi.c).
> 
> [...]

Applied, thanks!

[2/3] drm/msm/hdmi: move msm_hdmi_audio_update() out of msm_hdmi_set_timings()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1735917ac44a
[3/3] drm/msm/hdmi: use new helper for ACR tables
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88321e3529f1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
