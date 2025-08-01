Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140B0B18333
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8720F10E870;
	Fri,  1 Aug 2025 14:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rh4XrDsc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C9010E869
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 14:06:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719HGrJ018997
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 14:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=X5mYO9TNcqG6LvwHvkvNnoW7
 mrgbAWbzpJxMDANF+yw=; b=Rh4XrDscXyf2Oo02oBHA4UuChG3U+1dh+T7OZAib
 VOuvM1m8SWmIm9s0HizjkP+In4P+XyxFB4XZx7IO7Jk/zzYjW/kIu9MAoHDfanDt
 ZK6ZqoVyXjZ4oZ9aQZ//45SiMCQnN1Md4SWDUjpVylMLrsI6fDTO6e1lMPCbcul0
 oj45dL+plcwt4ZOUYWeVSm6+aXgBwJX1E3S9fNMRuKw5jxIHAfkXX8Cu7W2h2xE2
 KUNOSM2i5MN6SzVqn+zzuAD2NNXnZ3nFwYlKDBiFE8zuStZ6F5rYuv5nXO0iq51Y
 M0bXcC1Vu0z1BSpGM0cpy9kLcSbf0lYPsu/KiiErHey7GA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwggkhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 14:06:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b350d850677so1208531a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 07:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754057171; x=1754661971;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5mYO9TNcqG6LvwHvkvNnoW7mrgbAWbzpJxMDANF+yw=;
 b=UOJupUsYaF1xweiRzU/yAcchk1gFTQZEnGaANBUuSlfiB60zRLKbihYkCHUhT/N3XQ
 YNb+pA1UZ45qcGwGgDJQiB6TUoNa10n1SE3mShMmgtc9wk/OiMnyEzvrq/vjinOwIaaH
 q0faj/TiMZTyv1iQuOK8Kd5UKUPZBhjHdGMwQKcw+SezTSS+ndT1whlqEMqBbQlAAnlJ
 yfK1lCSSz4cXv3ASV7QoKIzHDK2UslLPyBWwigceuP+aQmezmGTRD7kQqcp6JqpSkIs4
 +6qHb5yl+TZMveWpHZ+vFa1Nl3mmzF4pgsHRHV3Z9IrdBxwfQ56/87yfPd4JULpuG3hm
 rQtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgZV9/fvmr0v3+qJ0icKc1SC41dYIrOFWVqAQaBVRg2eIz5DEJxkyVJtaRrhfHw2Z4iz5yiop/luM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXaxEm4+8B1I+wa7tttibP+vxLYFSzYxbkfxA4Q9hi0HwXLRX1
 TOmyRYhVkHgUz/AqdLMKKFcFaN5/w9e4V8LHcl2YlmyDlDUlbOJiKGMCVJpvCgf23Xcz6GxI23A
 HLXsHR5o5qvbfhihbNGiz3FOzUCiAEQMjnjNiN0ow/PX48pSoXtm2GcMGQRcBrzzXuKiyl50=
X-Gm-Gg: ASbGncspDQPgBtBKOuO6rj9vDzoVduqNMLvepuwVqQn+Rz0ayv+lFRxNeCGjderNpFw
 xhaQMcGGoeLbQW5kP+n/D4cZWDWqm2q6eSxXwaYE7eh3De6tZ4k4bAvzV6UypN9xNEbag//N0Mk
 S0GeKuso7W2sSzU3+ud/QyYMNOaLUz1P8TdUIYQxqLzxmDuHrZpQZxQMwG92nKvkBaSPHCL3a3p
 sV54LMI5IJfnjrI633CXcB+iJvwLECdR3phkHLkmJX9mHnAREVQksBb/mp/+inxpjl9JLwpetmb
 TSFU9s3VF1Pmz3d1OxevvelvAaWOU1VlUXnbY4d77+6SCJ97suWeLjfF+03gDETzIaHpbNzODFE
 buKfrHfiXFw7m4nA/jZmh8svQxQPaBDLZ7jr7sAXM9bXK+g1DetR1
X-Received: by 2002:a05:6a21:33a5:b0:239:29ea:9c97 with SMTP id
 adf61e73a8af0-23dc0ec463emr20483683637.24.1754057170902; 
 Fri, 01 Aug 2025 07:06:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGitYNtTnXOBq8raaQNZX9YeStN7g/CeoibFIFiLag1gYHl4anqkXU57qCgbVhM4DI8a/qNMg==
X-Received: by 2002:a05:6a21:33a5:b0:239:29ea:9c97 with SMTP id
 adf61e73a8af0-23dc0ec463emr20483562637.24.1754057170060; 
 Fri, 01 Aug 2025 07:06:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388fc7d0sm5621721fa.59.2025.08.01.07.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 07:06:09 -0700 (PDT)
Date: Fri, 1 Aug 2025 17:06:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
Message-ID: <z4ewbwtrqnem3af2tuket4wpgsulo6f6vy54hnhxrcx56hdx23@i5nuuiw3j36g>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688cc9d4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=noEQxEA5MoPOL7h678AA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: jt0qI7LT8OpnqCarSFKo9kK-dS-NU0yS
X-Proofpoint-GUID: jt0qI7LT8OpnqCarSFKo9kK-dS-NU0yS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX2nQKSkG7qoFF
 Z8TfKEo2GVMeAZmFE0kQh2WKsLjNk3azpobpnY4uNVFT4xrT2Lr1XgTJbu1nVmEAHnjqQAULzee
 U2s9bvmHnxMC+aq+p0dKn7q6TVjYhHWGf6gEO/wKOH+oR3UF4cqaiAVVXDlxZ6pqIpqV7kRAhB0
 hlCkz6zhsc4Z1O13qtvREwelsBvibwG5ZSD8HqeZtT3QMU1VRRasMNHXJCraw++CSBpIk0NCilG
 8NqqHZsNm/Uief0xRCrYQU2qMeflwBVxUaWbxSvtM5gKVVWDh2eFd5107ZcONKA5FTTyzNm+btt
 eTsW0lv9WilZKFRqfaIsNGQhzSnn00gIqEp+rI7VtNoZkym2ECGPsvQ2ORJNgzL2Tmk2FdE3Rdv
 1Sq4GSAy+gG+UX0wLflQV5WLUyrvHkahQdfxY6jBsXhAr3zQr6yOunqRO6MfXkblwG1S2XEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010105
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

On Fri, Aug 01, 2025 at 04:51:13PM +0300, Dmitry Baryshkov wrote:
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..9986a10e8114680e9da48986f4ca3ce6ec66b8cb 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> @@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)

And I used wrong subject prefix here... I will fix it for v2 after
getting feedback on the series.


-- 
With best wishes
Dmitry
