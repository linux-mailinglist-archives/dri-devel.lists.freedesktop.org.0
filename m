Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF30BBB8C2B
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 11:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A3510E21B;
	Sat,  4 Oct 2025 09:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISvKLycM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E1E10E21B
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 09:47:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5940gmPA001220
 for <dri-devel@lists.freedesktop.org>; Sat, 4 Oct 2025 09:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JyJUqoq9hNFWEpkGuYsnzzOl
 rgkS1VzZQ9NH0b/ALic=; b=ISvKLycMDh7Y7wxdJh4i9yYpIOXUD4ZAK1GWCR8K
 96pawdlJTaEiVBbn46J6hh5tCb4LPQ9uqe/olea1DTvEYzbCq8PHkCkdRiuS8u+i
 oy6z/FerSl0Fk+NK7/UhEOFalilaXjUddB6zHmX+uTNBuxzB/ag0n63/dTOCyMEJ
 GRZEYp7f4XXLmAVkK6v8Rny4E77JCx/7dlaaYCnLQc70Vub98JEoDIVRfVjGDM1q
 tE1ZVg1rhQNZ33ISuRqoomD0mrdxGpNn+3F5d3NUFdf77XpwL3fkYiYJ3/0D+YCi
 ZnzgkaobacKI8tVUho9NnPdKyvoWcB59OVo83tDikcckBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9drnv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Oct 2025 09:47:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4d6a82099cfso80529561cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Oct 2025 02:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759571236; x=1760176036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JyJUqoq9hNFWEpkGuYsnzzOlrgkS1VzZQ9NH0b/ALic=;
 b=Fm+4za3gFhYk36zaVZOQXxFJqU1ffXAnrItXAIFcWLZkD+/9hjKYPPqPVQZkD1vLfv
 FtVEGcPCS1ryTLfF0Iqm/N8JSYTf/tXwB9/pjCXRcixch+48eTy2ndf1iY+kGkmSX7E/
 b5kB0uk9mwd2W6/arWvEl+6wvg4MxHw7AwHt5Az+HZ8PbK1vTloT5FKjGny9ZhZ9CoxF
 LrzTpBAB9wppKFk7kULuA07FXFeaTR5a6AMY3cS2wijuoWVTCyS5KPTjI9WYnOvGUBZj
 04eknEr4dGb6bZlUQz+HoYtwGCdyXOQ8aehA5oBVH0Pgp4XhyIXc+CfEDj/GaSvElP4p
 SXbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0S0cmP3KGba8yKaPJTCj0FUyWh+LJfW703aHAqLhtAyYaGkX1zfbfqKl7hobVsh/CIUP/D3LykTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1buXaKcVzc0l3Axxdke1fovisUYdpsA16UxsPZVy6AmdHuEBx
 XiUYnkLlofGolht/87rhyGxwCouW+BOjlq3IiKm1D+f+rdbSNfaAo9retUsyJpsFxdGjE2t8BMc
 8AWz9oNrB5bhAiL5YwecnO4/TPQbHoRWNZ+87gGIs/4BnyjwEdwCVZrH/CaZJUXgMgxVtC7k=
X-Gm-Gg: ASbGncs5M4fxUKE89zgWjU1KPMfJAWJXT1KiXbR7ZZ91SKIecXptumamtKdBv1dNLXq
 z7DqypMbmqua4Hrqti7NGV8Z2jG+x8GsBihmtbYX8o9kJ52H8ezGl8CimuGuwbO0gvM/Rf7pr4R
 Y/udi8Sm/XCviyHiXe0uxReEHueWT+fg4bJYnXji3GX/WjjhTnlQh6BrcmQlEWfZVNrcnd01owY
 wclV67YPs2F+m7OIkTBA+GmX2ZFKMonNE5gF1+zyVtfQ7jXaOwOFVdhXmCbbNa8varKg9lfDlCx
 kfBjvdd/Y5H52PKpkSCKfuNJHKYDJcgF2LybYOLSky4Eu39zJNeShdwefdPbzzc9GaNMWjbY4ct
 3SSWqw/AjbBSVj+2HO3zKOYCMLEMV4ocn2lUdt75jXdWfbPf2hhMcVXeoDQ==
X-Received: by 2002:ac8:5796:0:b0:4d9:f384:76a3 with SMTP id
 d75a77b69052e-4e576a2b23emr79564251cf.1.1759571236341; 
 Sat, 04 Oct 2025 02:47:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGynVz3EPA0ykwKTN7pQT6siayEYYAGehr4shsq6/DGHHpjk3iwkY69IuP8QMQLOHlDY8wdAA==
X-Received: by 2002:ac8:5796:0:b0:4d9:f384:76a3 with SMTP id
 d75a77b69052e-4e576a2b23emr79563971cf.1.1759571235845; 
 Sat, 04 Oct 2025 02:47:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0119e86dsm2686516e87.97.2025.10.04.02.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 02:47:14 -0700 (PDT)
Date: Sat, 4 Oct 2025 12:47:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] drm/encoder: add mutex to protect the bridge chain
Message-ID: <2ksmq6ytj3zabxuexzjuqovalik6memy33vrba2aihfld7b7so@lhqhmaargucp>
References: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-0-78bf61580a06@bootlin.com>
 <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-1-78bf61580a06@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-1-78bf61580a06@bootlin.com>
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e0ed25 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=P-IC7800AAAA:8 a=KD47DfvlZnWFAtPs4N0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: uH8CZ2EkJqP4BkAua7pWdR-EIUHPloVh
X-Proofpoint-ORIG-GUID: uH8CZ2EkJqP4BkAua7pWdR-EIUHPloVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfXy/bkoUOUGTdQ
 OB+qlUsW9mqpXDtb26ZZlRQEGaREELEd44EBnE1Waf3sqGb7wSUS3McRLr10YhikpK2gz7EG+uC
 dAZedb/xRKYaTi8BN4VlBAvEPqdI+aXHVD3kUCJ7/hy2oX+rmr7eBtVR/B5INNijBlKM8FM9IdR
 D2HGnA2p4oVQy2fqdIHQvQs6m2lIVrvrBt7o/gTq6Dwdh6BTKk+y9zEFfMvV7uonl5hKNypQYrg
 ncX6ZMy+7fc4w4+EZH5TSCSNUpSgj7lv5CtVasstEGIptUkkCKt4A1dVSBhF3hLt1eCOwwysrxg
 bnKO5GOpfuNHxSDjcIc9UeXi3iO/A2fAExp1gQJESnkGki6+4OweRDcacpYupVI5Zw3bsYDpDs5
 3fv9RHd3Hb75VJcFnfLMQFL5uuijuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
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

On Fri, Oct 03, 2025 at 12:39:23PM +0200, Luca Ceresoli wrote:
> The per-encoder bridge chain is currently assumed to be static once it is
> fully initialized. Work is in progress to add hot-pluggable bridges,
> breaking that assumption.
> 
> With bridge removal, the encoder chain can change without notice, removing
> tail bridges. This can be problematic while iterating over the chain.
> 
> Add a mutex to be taken whenever looping or changing the encoder chain.
> 
> Also add two APIs to lock/unlock the mutex without the need to manipulate
> internal struct drm_encoder fields.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v2:
> - Added documentation to new APIs
> ---
>  drivers/gpu/drm/drm_encoder.c |  2 ++
>  include/drm/drm_encoder.h     | 39 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 8f2bc6a28482229fd0b030a1958f87753ad7885f..3261f142baea30c516499d23dbf8d0acf5952cd6 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -129,6 +129,7 @@ static int __drm_encoder_init(struct drm_device *dev,
>  	}
>  
>  	INIT_LIST_HEAD(&encoder->bridge_chain);
> +	mutex_init(&encoder->bridge_chain_mutex);
>  	list_add_tail(&encoder->head, &dev->mode_config.encoder_list);
>  	encoder->index = dev->mode_config.num_encoder++;
>  
> @@ -202,6 +203,7 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
>  	kfree(encoder->name);
>  	list_del(&encoder->head);
>  	dev->mode_config.num_encoder--;
> +	mutex_destroy(&encoder->bridge_chain_mutex);
>  
>  	memset(encoder, 0, sizeof(*encoder));
>  }
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 977a9381c8ba943b4d3e021635ea14856df8a17d..449281c37e39f67a0037603762f347f5086df983 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -25,6 +25,7 @@
>  
>  #include <linux/list.h>
>  #include <linux/ctype.h>
> +#include <linux/mutex.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_mode.h>
>  #include <drm/drm_mode_object.h>
> @@ -189,6 +190,9 @@ struct drm_encoder {
>  	 */
>  	struct list_head bridge_chain;
>  
> +	/** @bridge_chain_mutex: protect bridge_chain from changes while iterating */
> +	struct mutex bridge_chain_mutex;
> +
>  	const struct drm_encoder_funcs *funcs;
>  	const struct drm_encoder_helper_funcs *helper_private;
>  
> @@ -319,6 +323,41 @@ static inline struct drm_encoder *drm_encoder_find(struct drm_device *dev,
>  	return mo ? obj_to_encoder(mo) : NULL;
>  }
>  
> +/**
> + * drm_encoder_chain_lock - lock the encoder bridge chain
> + * @encoder: encoder whose bridge chain must be locked
> + *
> + * Locks the mutex protecting the bridge chain from concurrent access.
> + * To be called by code modifying ot iterating over the bridge chain to
> + * prevent the list from changing while iterating over it.
> + * Call drm_encoder_chain_unlock() when done to unlock the mutex.
> + *
> + * Returns:
> + * Pointer to @encoder. Useful to lock the chain and then operate on the
> + * in the same statement, e.g.:
> + * list_first_entry_or_null(&drm_encoder_chain_lock(encoder)->bridge_chain)
> + */
> +static inline struct drm_encoder *drm_encoder_chain_lock(struct drm_encoder *encoder)

What is the use case for these wrappers? I'm asking especially since
you almost never use the return value of the _lock() one. I think with
scoped_guard you can get the same kind of code without needing extra API
or extra wrappers.

> +{
> +	if (!WARN_ON_ONCE(!encoder))
> +		mutex_lock(&encoder->bridge_chain_mutex);
> +
> +	return encoder;
> +}
> +
> +/**
> + * drm_encoder_chain_unlock - unlock the encoder bridge chain
> + * @encoder: encoder whose bridge chain must be unlocked
> + *
> + * Unlocks the mutex protecting the bridge chain from concurrent access,
> + * matching drm_encoder_chain_lock().
> + */
> +static inline void drm_encoder_chain_unlock(struct drm_encoder *encoder)
> +{
> +	if (!WARN_ON_ONCE(!encoder))
> +		mutex_unlock(&encoder->bridge_chain_mutex);
> +}
> +
>  void drm_encoder_cleanup(struct drm_encoder *encoder);
>  
>  /**
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
