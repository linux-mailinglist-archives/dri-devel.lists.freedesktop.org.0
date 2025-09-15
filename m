Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784E0B584C9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 20:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6A210E108;
	Mon, 15 Sep 2025 18:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCgf5fI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A173E10E108
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:41:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FEMlPS031661
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ljYBCGgfSqSCfxyG4JU8mZuZ
 nMjA7d2IeNHfomCZO2E=; b=kCgf5fI7kztNRrUDyuQZ4glDS6gFDqf86UUOpoNp
 TomWFzUUXpi5Su/qJU52IhNKGBtUfE+o2R6DQosAz8cvX0XF5v5SN9ncZzAY7yXH
 Gj97wANRKfgJhX1E4EWSKU446A5LKmD9MG4RxVKsM5slsysV5G39VMnewcc+5q5x
 2sxWW+KOKezJRhEJmQNBD+jqnlyXOj/PyvydaXBNw2KqpANxalZSjvCs6KmcQuEc
 kzrRBitxXtOE0P2HsaO0A3Uev2KfWBhnTGsx5wViB7wUJvizYCV1Yr6137udEoud
 fJrWVotLmcr1B34Qq0ZTLHmlBI6+FBuyi/03p5vAHCpw1Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma63m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:41:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7721c5d874bso45139266d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757961661; x=1758566461;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ljYBCGgfSqSCfxyG4JU8mZuZnMjA7d2IeNHfomCZO2E=;
 b=UUyChA7ckzEpz0tcyc9z+oFhDuZ10LgulNmFn2qyq6fwOgTZSnB1xCwPqeGZ6LLEbt
 a9zPV1CWRAGGGtaCZlZlB5ZmV+mTxyA1LDXd87hQXM/CIz+E6m0Tspam5gWrLFUo6HCh
 IkJ0GeyBraRIjeoeb4TnZwZZ5GC+wA6LZJ/kCc8Fv3/NEchcLV6hexdgKX4TtSP39qzi
 uTweqCB6CFcUAHPZwF1pS3A0uA2pd+ZKCmexr42+7NPrp0l3JioeuYXy4BULtRr65x6t
 NzH2DKGjTz/Q53dEHdCrArvTYsdrrAV9pkbihGJXzmABReIb9/ykqYznwA5ewwM14A6z
 tD/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6j53bUwdDkUf5GnClpO6Jx6s/PL/8zrg7xe9mnEa4SoefYQU/zixm4F0scYwLMJdCdLjzFIlsIyo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy7SeEh1WcA/YUd+U5iqcg1B9/wi0Lxl1ZQO3tjABIF/uK+m53
 DpQXvmEA3q91kmgYHTmllfXXdSN1v3PjXXgW2vLtCcFMUU8K5sOhQYHNPAtyK0G2JrOJZkqySUv
 E6pPLlcn88RJ6xtvVorb93NagInjAkuq2R+9Ekmoxs1GxdgC06n9au9bwczWjoAym+qEjh0c=
X-Gm-Gg: ASbGncu0AQL9xRdBC1brryGI8p3PlAeQTcYQ7U5V2Dd8DvygLYL8Y7guiADU5IISYuf
 hBaSPjbeyy70b4BYLbQbeZ8S+VJ3wluhnzujy/ZQabyFLGOVzAAPD8G40KA4y+I/X0FCqEw5d5F
 fJjPqNRMj4XBSUvyRK5FgnmAr6ZfIuXeB4TZSI+U3f0RXEAjngExgd2ygFYsUto4AIHVR0oOE5v
 pSbkIU9s+ZPS19gIfU1LwljPrBYTvRM52aOeU4ff6WrOxcz23RCpX7vhIYgZm2jXJXP6q76/P4q
 rKvGLbeSJPAiZl+iBMU4tIpi4WbjVCoki2mnlkiKt7cR+JSCCp9kXOE2jEHSxz8FhiFnixAtKS7
 Bu7TrG6DHwEIm2jdxYEI3Y+Jy7OUjiDy5lIR8kKG1cfs+uZhRTCUq
X-Received: by 2002:a05:6214:1d09:b0:782:9454:ac7e with SMTP id
 6a1803df08f44-7829454aefemr59893116d6.59.1757961660734; 
 Mon, 15 Sep 2025 11:41:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ4P3hm3uzEP1hH4FxW3UdAgtApBC+WtCcYWvJh9nalHV5TC8f6T/4n1Oj9rePwfPz2OQYIQ==
X-Received: by 2002:a05:6214:1d09:b0:782:9454:ac7e with SMTP id
 6a1803df08f44-7829454aefemr59892716d6.59.1757961660101; 
 Mon, 15 Sep 2025 11:41:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1be24e79sm29178661fa.59.2025.09.15.11.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 11:40:59 -0700 (PDT)
Date: Mon, 15 Sep 2025 21:40:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
Message-ID: <zvqtehg66dbrrdmik6ylo2kdk74umfzo5hbfkizwsb352nlyqv@jgouvmbfwa4x>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX/19oj/6wzFbk
 M+TnuoEOJDAksHc6VDJgFYQ5Gj2yrTpGEvfLRMP2yRCsmpgIFBNz71tV6zvZ06dPSQodfETB46d
 fURlswFh7dwOWc+MiJvoAmc/JAPSQWYNwUUnio6aKrjws6B74mBicZV+uxCM0CRAPhLh3gNPvU5
 pDquz3QCxBXLT27byNcFlZPoLB4TIqprbQSs6CqNKViAqmx2Z84TDi3pnZ9bO2UyHBTkVDITz+U
 PD92PS+UVQE7W6ia7z6QLiftAzQHK5HqCyC69VvR6Jc4iDKdn8HegOLMEBcY6mWvZqTIutFB2qD
 ZC58Mtaq2vvnhUSAqf5SBnw7BT5WQPEgDCsFKbDInjmJqYERv8i+SBXaBqAmuP5eapl7M3cvLr0
 HGtaLK6/
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c85dbd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=je0mVrs27Alq3b4RgjgA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: jRIdCCrwQk1wmhmC9Ld79vWKq7A6_OTc
X-Proofpoint-GUID: jRIdCCrwQk1wmhmC9Ld79vWKq7A6_OTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019
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

On Tue, Sep 02, 2025 at 10:32:38AM +0200, Maxime Ripard wrote:
> In order to enable drivers to fill their initial state from the hardware
> state, we need to provide an alternative atomic_reset helper.
> 
> This helper relies on each state having its own atomic_state_readout()
> hooks. Each component will thus be able to fill the initial state based
> on what they can figure out from the hardware.
> 
> It also allocates a dummy drm_atomic_state to glue the whole thing
> together so atomic_state_readout implementations can still figure out
> the state of other related entities.
> 
> Link: https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 382 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c   |   1 +
>  include/drm/drm_atomic_helper.h     |   1 +
>  include/drm/drm_bridge.h            |  21 ++
>  include/drm/drm_connector.h         |  26 +++
>  include/drm/drm_crtc.h              |  19 ++
>  include/drm/drm_plane.h             |  27 +++
>  7 files changed, 477 insertions(+)
> 
> +	drm_for_each_encoder(encoder, dev) {
> +		struct drm_connector_state *enc_conn_state;
> +		struct drm_crtc_state *enc_crtc_state;
> +		struct drm_bridge *bridge;
> +
> +		/*
> +		 * It works a bit differently for bridges. Because they are
> +		 * using a drm_private_state, and because
> +		 * drm_atomic_private_obj_init() asks for its initial state when
> +		 * initializing, instead of doing it later on through a reset
> +		 * call like the other entities, we can't have reset xor
> +		 * readout.

Would it make sense to unify the way the bridges / priv_obj handle the
state with the rest of the object types?

> +		 *
> +		 * We'll need a mandatory reset to create that initial, blank,
> +		 * state, and then readout will fill that state later on if the
> +		 * driver implements it.
> +		 *
> +		 * This also means we don't need to call the readout state
> +		 * function if we don't have the bridge enabled (ie, if no
> +		 * drm_connector_state->best_encoder points to bridge->encoder,
> +		 * and / or if drm_connector_state->crtc is NULL).
> +		 *
> +		 * In such a case, we would get the blank state reset created
> +		 * during registration.
> +		 */
> +
> +		enc_conn_state = find_connector_state_for_encoder(state, encoder);
> +		if (!enc_conn_state)
> +			continue;
> +
> +		enc_crtc_state = drm_atomic_get_old_crtc_state(state, enc_conn_state->crtc);
> +		if (!enc_crtc_state)
> +			continue;
> +
> +		list_for_each_entry(bridge, &encoder->bridge_chain, chain_node) {
> +			const struct drm_bridge_funcs *bridge_funcs = bridge->funcs;
> +			struct drm_bridge_state *bridge_state;
> +
> +			bridge_state = drm_bridge_get_current_state(bridge);
> +			if (WARN_ON(!bridge_state)) {
> +				ret = -EINVAL;
> +				goto err_state_put;
> +			}
> +
> +			if (bridge_funcs->atomic_readout_state) {
> +				ret = bridge_funcs->atomic_readout_state(bridge,
> +									 bridge_state,
> +									 enc_crtc_state,
> +									 enc_conn_state);
> +				if (WARN_ON(ret))
> +					goto err_state_put;
> +			}
> +
> +			drm_atomic_set_old_bridge_state(state, bridge, bridge_state);
> +		}
> +	}
> +

-- 
With best wishes
Dmitry
