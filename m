Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B78D3B80D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 21:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C016E10E507;
	Mon, 19 Jan 2026 20:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMZ47s5K";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHKdzcp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653D910E507
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:10:21 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JGWAu9903057
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NpCOWde7XaYdspXvGBd7lIyK
 uTyTzwfk7MpfKXhNPGo=; b=gMZ47s5KlFZ+nJZm9cYyTMF8M40hOYwc5GAeQPNy
 UxnJkMaKmXBvT6drkP9T8yC3PaETLUw3xvxDK9OrHX4F692PZZlsa9Yg/E/HEgyd
 JUu8jlR0/Nkz5x1rS34j5u3oInnP5CANx4bpLuItDfN60T5aT0A4Bssf/89qeYOO
 yysnt+AdhLKXZfjowGm7aLQtF8cy+SuBgRSew/6Em4ZSCtOmGo+32ovQCYC2f/dq
 LS9D6MgVcE24NLM75Vp4D9u9F9HzZktqiTPHpP9iO+PIubyBf6zCLIDFF69bsgV+
 mFBnSq7awj2NMWv55TdngIJgXHUfNC6NhOiPWu2Tp6iwtg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4yu0x8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:10:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a289856eso919977085a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768853420; x=1769458220;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NpCOWde7XaYdspXvGBd7lIyKuTyTzwfk7MpfKXhNPGo=;
 b=JHKdzcp6L7ScGP83lcDi9m90/7Wo9r+wZ/FqyFcr3zoQHzPmjGWOs2Q0ErlrUOk/Px
 E2twc1AbS1m/JWxKmbO+fwIG1Y67YJVyzhG2kvvuwwaYnm/A94F+9H8JKBRfOMVdwk3z
 5VSHlwz0Btdium0YAWpJnqr/f9D5uvo8RfEKZcKg/KNbbodf2qNdhEixCv6zzNIO3EB5
 jpmkkqfQWHYPce6/34bbIcAYp4TIioMmL0BL4iIHVuGCB7cKlHMI5S8k1zEfxe2RuqwZ
 vgnB/Hdp2Y5SyadRuyKqRPIaYXQqF/iC2DHGG44Pig2sxZrZcmcpWIj1XL4b/nU3QxMS
 BdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768853420; x=1769458220;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NpCOWde7XaYdspXvGBd7lIyKuTyTzwfk7MpfKXhNPGo=;
 b=EN+0YR39GFQfnPXZYGEH50w7pXJz2fEFOAy+YEuGffV+WYf3oivAgctfqaCeqlscdA
 6EpIfWBHEDGCIicq/kKYqIWsvpljnEtN0oN7HVkDslAcXoKLAmjeASTDaH7n71P1Uo/x
 0BLJU/7pQNSXlNUNGn2JzYsUu5VJ8c0oQGed9WxTubKWD/DYJ4ZHYNbxxVLpXxAuB5EA
 5xVSEFXdVAmgjhReHzTv8DM4mEmhbYfp1U7VLdruFPM0Zu3tELjYnMnWLet72ndQzsi9
 8o3xr/HUvussdbQlUCVWlHF2DjVj38JM8akymUx4Fj0hBrOZOH/OLjtSCBdsuGcmJpPs
 my2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGm8RvEIEALLwE9fAI8yi0cHdKaKW2mOiA7KZTk+KmBinQ6h/Ujw0Q2cRr7OQuqbKFLDvqcOxx8BE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZYeQQ/JGHQbSrcMqiwhm+K8k5u1Iv348ZnxBwiSXnLTwNneX/
 tDrdYGKdHdJ2e+3LPPnGPpLyndvIzzqjKCEQJWF4ywz9yCWIFjPbEBHJfWZhgaSu2Ww8NlFntoY
 7D44P1ahqRC6MSyhHBq7YsC7v6SmLavMpnZNaivhYVYDQ1nc0/EcUAQ2esj2JQ+nvYHo5PtA=
X-Gm-Gg: AY/fxX4TFSafaYwNn4zb7fRKMZWsJ9OSZwNqgbZlaJgctXdGkU9i5gk422NVf04g9aO
 NspOpNsjr5FESUWn8Zd6Tpdo3gzhjNqrYlWsca81s454WmnBr5xT91w7QjmJnV8S8dtm/yKVLFY
 CEboXst8oWac4NKTux3/NFg/cQevyI2Y/P4zY4ZkZ5//8mPLQ1pcUUYsbCdqzdp4zhniv/OBTD9
 Or23hMdq1cjWcwyNnXhMyZx+FjyG6DWFZ4dm3mXF9eWcklI8wWNvfdng02j7hejN3sSPr8+XZWk
 JZ6mg8mrgcQNJtjaMoMOZX2byPNWRguIXBBa+3JJ7HXhD+b6KugT/meDnExZGAoKOSp43OqrT+n
 FHoP9TjJFYXi7fhNgS70UlJuT1J+n+Dz/nGnKWsVt5ZDfB3TE2OherXy6oKGulRJUYe9yslQX89
 2i2cBwWZ6l3cJ7l0sj7CkjWgo=
X-Received: by 2002:a05:620a:1a10:b0:8a9:eb31:1033 with SMTP id
 af79cd13be357-8c6a64fa12cmr1683680985a.30.1768853419698; 
 Mon, 19 Jan 2026 12:10:19 -0800 (PST)
X-Received: by 2002:a05:620a:1a10:b0:8a9:eb31:1033 with SMTP id
 af79cd13be357-8c6a64fa12cmr1683676385a.30.1768853419147; 
 Mon, 19 Jan 2026 12:10:19 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384f86157sm34657731fa.36.2026.01.19.12.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 12:10:18 -0800 (PST)
Date: Mon, 19 Jan 2026 22:10:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH v3 08/15] drm/arm: komeda: Switch private_obj
 initialization to atomic_create_state
Message-ID: <zupxnkuw722bwemijb25dpcpgph5lobpef2edgnxnm5misbozy@xh2k67b4q5a4>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
 <20260119-drm-private-obj-reset-v3-8-b931abe3a5e3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-drm-private-obj-reset-v3-8-b931abe3a5e3@redhat.com>
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696e8fac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=THMqgn_pniuY5k9AMpQA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE2OSBTYWx0ZWRfXy2vNWasxvnAA
 UUVyyreozqt0FA59JMmS+xY1ZVRAeNexhYoKWq0pQAkzHgi9yEzXlAejCAa3ioZe+yXWajU0jhB
 W4kbtD5g7+KCJkECi6VGSaLCGIGjjcLg3ZUUY3pFtIGWBkDwHhF2fKIO2iHkcM6F7HeeTCLpSry
 nWOpI1p41ZsWXgqPa+47+LvsKWMnT1f/OVgcsxWf9L94bkGA5SDDFBThyCgJXddoxfr6nLuO21T
 dvRoRzP0OHtdMqBe1E0/eu+ftU0fKbSabxufVjuSX1ndbU9EC5T23LueQzd13DEz+ssbv4u5o7d
 6zShNJoBIUSvxfduwLNKc1gft4Cl8MXpcyNx2EOmIkR4LqpdOTABv/lQ3W8msrfeqbWahjSWO9N
 tWFO44aeWM5v6VHyuQPE8r0DDJEmm5DTQPrOEOktf4sp3Z/c5DMtoCJX17BVYdQfMXkAP/1QyQp
 OHF/+l/byXYJ92s85YA==
X-Proofpoint-ORIG-GUID: zeOUeXFD_-x0LOWZ3seZRHB3Y-8F_cFh
X-Proofpoint-GUID: zeOUeXFD_-x0LOWZ3seZRHB3Y-8F_cFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_05,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190169
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

On Mon, Jan 19, 2026 at 01:50:04PM +0100, Maxime Ripard wrote:
> The ARM komeda driver relies on a number of drm_private_objs, that are
> initialized by allocating and initializing a state, and then passing it
> to drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> ---
>  .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |   2 +
>  .../drm/arm/display/komeda/komeda_private_obj.c    | 208 ++++++++++++++-------
>  2 files changed, 146 insertions(+), 64 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
