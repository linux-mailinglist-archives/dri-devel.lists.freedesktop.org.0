Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884C9B2B08F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 20:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50B410E03A;
	Mon, 18 Aug 2025 18:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjbJ4SF5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD1610E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:35:57 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IEaQIm002398
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rTw5fI/EzQLooVwdnSKD6j5ks0u5Tik6uLBbFQaZ44I=; b=PjbJ4SF5jsGRuPM8
 lRiJxw1u113tX7wBLGTbQoy+3C6mIwKOJavCnyjt0KQfMN5t6oFVnQPOBVFoUtJQ
 EneaDEiUuLXqtzK5PTacSnK7X/Jr8zazde5n/R9zdJHoO0J3TXn/aWyG32UWilXy
 OEerE0aj750vPxvduioVB33IJ6wu32Xv0hGd25L/AAxffaXz9svr2Xyw7fYZ0mCI
 gZTWWjAwdv+B2UWYuVDb3HZcpSJkDNx/hvt7bjszyLHe2+Htog2zTVX1DJKuuthT
 Rl89WKPzZ9Ol2YfnDRgKI535EjA+i7w8peleWdhzNZHYS5+dWqKo66v+HOi3mb6f
 1Zs8Pw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m62vgu11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:35:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2445823bc21so112090465ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 11:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755542155; x=1756146955;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rTw5fI/EzQLooVwdnSKD6j5ks0u5Tik6uLBbFQaZ44I=;
 b=Cki2SNz3KIFrvYVaaY2dy889QDE9yXj/xs5U2iGdX9rdIU2NMDFoRGlGSUNzWzmsvz
 hQuwFpeCPXzTeLQlPVZiuyTCf6rMPaI02s2ravvs4G6YOdt4ydScNYmutXtKtU3zUaLx
 SgE9KaVhryq0rscd/2r28F8A0VemmZAltrFwEbJufSxAe1q51wzgdkkNECNhUGJE9Ekr
 XrrZ23VCncCgovwdXttC+cM//5Yu4s9P8PLRYd6552knBCxgE7tQnuxnavJkCfRckAru
 jqucx6AL3aWoi4R6pV4fahmUBb+f+ORGObZ5S2soH4AvvIVOyNGRSaoIz7Y6GCPI6z3u
 bnWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUNd4AcYbHr1JdgzOdGby6ynIS1UKt6efKtf/3heqP+GWN70NNl/mpnYYATSgh3R2u1SeSSSRb24Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAB48gKrZVicMhgl/z2T8T9ReOHIJ7dvG4jhJPcULHegICkEYX
 SqDIwkgxAJfNwTlx1rxk4J+KpKuwiz91jyYZsIhV1w2RFP77KS4xZBSvaTtfbROgUruXQ7zt2bF
 mhcL+T4kpIng8jiuCHfbRirK6KNSuLGeThGFu+nRSjJ9w/YJKpw0tXf5daHjlWwaaSj08pBk=
X-Gm-Gg: ASbGncsy06BSs5VqezFFSYTiCDOjFQ5nMqVVHuf2cj4UPCj57OjHdG81Nyba0mVmf7D
 Tw8Aq6dI63nsm/dcRPJ2yv6Px8HOMBx7PFGIKOOaj1CZH6T1Hapgl+gLWayMfrPICWBzzlab+IO
 BkGBsnjRM9y3AKPMJ6+pVHWJw11Pvb7LIZi50bX/7QsgyUAyueRpgyYEINPDFClyjr+0SB28z0a
 2LuFRkTW0W+5O5+Ohk2njPqZUEAmLWVEq6LMTJSIYId8JYXdcc+9JgCmL/qbSLZawM3phgZVn5z
 YfhPrWZWMxnh2Ok2WCof1OSdGA5E/sf/9uVaR1kNB7OehUb6EemfOgMBfJTSzpBI92V1iGYJILm
 rkRvirKCWsyMKB+CBPnxMWg==
X-Received: by 2002:a17:902:e883:b0:234:b743:c7a4 with SMTP id
 d9443c01a7336-2449d05e2e0mr6013475ad.38.1755542154909; 
 Mon, 18 Aug 2025 11:35:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxDSynULb4PcFzZsBZRbHZngTsBrC0gfJFLCUyi3LdHcS+4FTyZjXC2laEfmopJd/tkxjqtA==
X-Received: by 2002:a17:902:e883:b0:234:b743:c7a4 with SMTP id
 d9443c01a7336-2449d05e2e0mr6012665ad.38.1755542154422; 
 Mon, 18 Aug 2025 11:35:54 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9d9a7sm87175925ad.23.2025.08.18.11.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 11:35:54 -0700 (PDT)
Message-ID: <eddfb43e-2d8c-4e6a-83a7-00c88b3ccf7d@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 11:35:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
 <20250816-wb-drop-encoder-v2-4-f951de04f4f9@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-4-f951de04f4f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzOSBTYWx0ZWRfX/cXC38KiXC6w
 OFps0F6XgpgCC1GTX5mpt1arBEZTgMV3yVYtEESnG5CofnJoYCi127FxbuuPG1EJcCT0e8A31ie
 0gwbWSz29tI1Z5CNNsfy3WsPWeH2EPU09xKPV5wNHJchFWc/nwoQ2GPx8WUbatCpZ8QoZhu+YKp
 C/4UxIXqk7V/sqy12skJAx4BrOeYtlwzIZteYdefcAGgN11nku9UCAjbQLUjIsWMtAM2la79RxI
 6O4dKVuJoeiAnx8YplEfY/90kC11ST5zzCVx68os6xE0Aw0/Rfo6j+eD9bI388+oxqAjRVfUSYJ
 8WZxHlxnmieujhNfBQKBDnrwbJqwFPnT6WKecve4AO60Geqp5vZ/hU4a5aM49ZglR7I94N2fxx+
 rry2sQX9
X-Proofpoint-GUID: wFlggzj1-jUdibTDL67R4KPzSU8FfMVq
X-Authority-Analysis: v=2.4 cv=A4tsP7WG c=1 sm=1 tr=0 ts=68a3728c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=hy87YkSEx0gxqBhA-1kA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: wFlggzj1-jUdibTDL67R4KPzSU8FfMVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180139
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



On 8/16/2025 8:19 AM, Dmitry Baryshkov wrote:
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
>   static const struct drm_connector_funcs dpu_wb_conn_funcs = {
>   	.reset = drm_atomic_helper_connector_reset,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>   };
> @@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>   
>   	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
>   
> -	/* DPU initializes the encoder and sets it up completely for writeback
> -	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
> -	 * to initialize the writeback connector
> -	 */
> -	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
> -			&dpu_wb_conn_funcs, format_list, num_formats);
> +	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
> +					   &dpu_wb_conn_funcs, enc,
> +					   format_list, num_formats);
>   
>   	if (!rc)
>   		dpu_wb_conn->wb_enc = enc;
> 

