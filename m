Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4BBA559C
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 00:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F19B10EAED;
	Fri, 26 Sep 2025 22:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUbTzr1y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EAB10EAED
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:39:42 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXNc3017425
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 24B+Vz4/U0yEjaNWEtgpTbaWRtur5Gt5Ec3dIyDAQL8=; b=hUbTzr1y2OQ3GzGl
 vLzy1KdIUV6H/hHfFRsKZQDJASMzn9/8rPTyOjYsceJvawjNRHwTsHchB42saWmR
 6ddxTMiAtTcDYbzykEs0NSBR1zzdPOrGxjvzkcTmeRK1/c9SNsdkoFvtr3Rrgnz8
 HR5XdHYNM7E2AA3/hh0kadA3shQmrp2qCDRVIsISTE7kYVdphGJ0r1QoYjsgrCh5
 yCDBl1X/4zdWgQr4ASOOwaYzwcDzjZClFAZm3h+g4+Z9L5r5GgsZ1WW2DEHS8ptA
 JSDF/wzVCuKxAfvC+jvkIbXOX8+0kh1wvpXhv1tBO0GUmwwVzvnncvf0GoLszzcY
 610eoA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u4amq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:39:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4de801c1446so18475651cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 15:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758926381; x=1759531181;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=24B+Vz4/U0yEjaNWEtgpTbaWRtur5Gt5Ec3dIyDAQL8=;
 b=d3Nz8KCkjBZBgrrZH/+qnn09wKRdo9Kdfwovz1/mBKoCxGSU6XojoAo/nx/IcsNRFB
 tnu54HGQnLOHkEJzuQDxFMpFNfCFmZ3kxpqEegtGsIFOE+Q4dRHJWkkqWSxPu8Waqmax
 Mn5VYNoYGzuU5xve6yMydeY7j4chei3mUGLxZ5cWJXgJFjvL6W1NoVDXpoPFccGf6iFy
 ZREeYRBzA3zzp7XVx40ZZx5hEM2WWzVX4xEvBbR3bUhXBjUmMNoor+yaFjXVLSUuTGKo
 itFZJXXIrcSKmY4s/4upTpgBa+8KAYRvtMxA9S1/ikagl7OytL8qts2Lsvl8DkMOy577
 sfDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/4iahylC7oXfwiHZ3lXr7IbcPy1bUXA37jrRqX+XsGCOGtXQqiFiaTUDGd7KtCTVqEOnUZ3WJzDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLLA7eqM7RBuNprcAROV/x2CKT9oSf4OzIlmXObFckjavQZ5QV
 kQ7xb8Df3RFYEz8OTE9M46uVL6sbD+GZnKENNHmL+zhOlcrVDWlcrIcXiFIi0/pEZRW7C32IAZW
 qjFwIz3acpGQO2eEIas8Z4JCzdHGj4a7wK/8Y6eN5ClHIkwTSx1rYlZadHXxPPhWSPr1WVfo=
X-Gm-Gg: ASbGncuN6l58ay/cEToYr63dEHmZAYCLLtVWDexZTyD6CwlFLBsFMHZOnLM8S4J0ojU
 s/wZhoVB7GaeQQkFmXa77p6bKss3cLewRRTZDxnuFxpe/jjq9JIBo3IfWPc+joEYESr6x2AYQXi
 G4qh9R5wTTPWRsWFs5U/Xwdt69dOrHWHLZ5yQBgmthaXJNchXkrwSv92+QmzfqrtbDNOZ5BUmQV
 3xL38LVsC8XaYHrt2THo9Y2IpVAl11JDq2jV9OiqQ/6xXM0EfjwtRBra+4Li5+bi86dQ9GeLIdY
 BjXouFjPQ/0KFa7cvk8UAtIWpmGnGDq7RNoU9A05GPHAaXQ4gH03Pr54MqhwtqkoqeQ7iAIV1vS
 L+QyvwzxKT3+fiBT6IptaV+WkuXdo4V+QtPLvAAf98zKvKUm++ooZ
X-Received: by 2002:a05:622a:1e0f:b0:4b7:9f86:8705 with SMTP id
 d75a77b69052e-4da4c592ee3mr134211611cf.65.1758926380602; 
 Fri, 26 Sep 2025 15:39:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFULKcswbecIMJxJdKm6lG7MR0cO0tulN2B73lbhlln9Tivc+4c4xrQ0vP6iGEuXEcs3svMLQ==
X-Received: by 2002:a05:622a:1e0f:b0:4b7:9f86:8705 with SMTP id
 d75a77b69052e-4da4c592ee3mr134211191cf.65.1758926380083; 
 Fri, 26 Sep 2025 15:39:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316656702sm2157148e87.93.2025.09.26.15.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 15:39:39 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:39:36 +0300
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
Subject: Re: [PATCH v2] drm/display: bridge_connector: get/put the stored
 bridges
Message-ID: <ucuzhhlqs23bcunjdhashydaxlgjpqvp3aezqfw25pkcbppg4l@4rltyxmfbm7w>
References: <20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com>
X-Proofpoint-GUID: NKOXYIZMWXTWkTbtJPO-M2AGlElZFi_o
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d7162d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=bV7b8LOMf5y5Q0lBeo0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX3mVCbRNzsRFp
 /iyK7/oNckk2wDXXqC8zEkqWwTR5yOrHVz3WfS4SL6qIKOyHhjrKnMFoSDKqXPa5R4zxYf5olc/
 LPHOojJ/dOdxtzTYGGxFgzR3nOA08NgPRR5HjceKquZzB79stOJcoaQUngU8dscbIKQ5zXlqFCV
 BbJagmIsi2LGCHWAppQzmkRUfmwkmZJk/+8bSWYe7Sfc1unsS1+HVNH1SXvveMsDxxbKT5WlPGa
 /OY7xUhWT00vh/R8vR91U/JL38F1Y4P2HpyrWSdtYe0C97jAb/0z8bKKJWJVwH8P9PXChW6EygP
 AZSQznsmr7YXWvFYMmNyG3QxREZPVb1BE7rn1pV9NOJeU3503RPIGwqViyYeD/P2hhMLbkIPf63
 E2qKeLXUOYuRqCO3tnVRm1/tdC3gqA==
X-Proofpoint-ORIG-GUID: NKOXYIZMWXTWkTbtJPO-M2AGlElZFi_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Fri, Sep 26, 2025 at 04:59:40PM +0200, Luca Ceresoli wrote:
> drm_bridge_connector_init() takes eight pointers to various bridges, some
> of which can be identical, and stores them in pointers inside struct
> drm_bridge_connector. Get a reference to each of the taken bridges and put
> it on cleanup.
> 
> This is tricky because the pointers are currently stored directly in the
> drm_bridge_connector in the loop, but there is no nice and clean way to put
> those pointers on error return paths. To overcome this, store all pointers
> in temporary local variables with a cleanup action, and only on success
> copy them into struct drm_bridge_connector (getting another ref while
> copying).
> 
> Additionally four of these pointers (edid, hpd, detect and modes) can be
> written in multiple loop iterations, in order to eventually store the last
> matching bridge. However, when one of those pointers is overwritten, we
> need to put the reference that we got during the previous assignment. Add a
> drm_bridge_put() before writing them to handle this.
> 
> Finally, there is also a function-local panel_bridge pointer taken inside
> the loop and used after the loop. Use a cleanup action as well to ensure it
> is put on return.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> This series ensures the bridge-connector gets a reference to bridges when
> storing a pointer to them, and releases them afterwards.
> 
> This is part of the work towards removal of bridges from a still existing
> DRM pipeline without use-after-free. The grand plan was discussed in [1].
> Here's the work breakdown (➜ marks the current series):
> 
>  1. ➜ add refcounting to DRM bridges (struct drm_bridge)
>     (based on devm_drm_bridge_alloc() [0])
>     A. ✔ add new alloc API and refcounting (v6.16)
>     B. ✔ convert all bridge drivers to new API (v6.17)
>     C. ✔ kunit tests (v6.17)
>     D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
>          and warn on old allocation pattern (v6.17)
>     E. … add get/put on drm_bridge accessors
>        1. ✔ drm_bridge_chain_get_first_bridge() + add a cleanup action
>             (drm-misc-next)
>        2. ✔ drm_bridge_get_prev_bridge() (drm-misc-next)
>        3. ✔ drm_bridge_get_next_bridge() (drm-misc-next)
>        4. ✔ drm_for_each_bridge_in_chain() (drm-misc-next)
>        5. ➜ drm_bridge_connector_init
>        6. protect encoder bridge chain with a mutex
>        7. of_drm_find_bridge
>        8. drm_of_find_panel_or_bridge, *_of_get_bridge
>     F. ➜ debugfs improvements
>        1. ✔ add top-level 'bridges' file (v6.16)
>        2. ✔ show refcount and list removed bridges (drm-misc-next)
>  2. … handle gracefully atomic updates during bridge removal
>  3. … DSI host-device driver interaction
>  4. removing the need for the "always-disconnected" connector
>  5. finish the hotplug bridge work, moving code to the core and potentially
>     removing the hotplug-bridge itself (this needs to be clarified as
>     points 1-3 are developed)
> 
> This was tricky both because there is no central place in
> drm_bridge_connector.c to put the references on disposal (handled by patch
> 1) and because of the complex code flow of drm_bridge_connector_init()
> (handled by patch 2).
> ---
> Changes in v2:
> - Use drmm_add_action() instead of hacking the .destroy connector func
> - Removed patch 1 (where the hacking the .destroy connector func was)
> - Link to v1: https://lore.kernel.org/r/20250925-drm-bridge-alloc-getput-bridge-connector-v1-0-f0736e1c73ee@bootlin.com
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 114 +++++++++++++++++--------
>  1 file changed, 78 insertions(+), 36 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
