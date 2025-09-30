Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B5CBAE865
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A8410E624;
	Tue, 30 Sep 2025 20:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKIFGfsA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2012C10E624
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:21:09 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UJj0x7017574
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+VFb0crc/qOwGeBvP/JtK6gr
 pmOtlDvuwQF4VkTnYOY=; b=OKIFGfsAMS6m9Xdz77R/OpPAtDirEHauS58EhqBK
 TFdGF65sxJhhca0WWxoGIJzqTzensMRHi1C4MUxrjEccLsQPnreEXG/IYa96Epp5
 vp2O/DWSYZSHs/H1Tcw4yEavtsgQB+LCBGFbhwfq7vmCvhoch6shAXdozWriH1vd
 SGRy2WHwYItvrIRcm2jYNTe/BAZROnuMzfXh79HwM4h/oA7e5RSs1p7Hxtx0y+wD
 0MlAkDlzFu54pcauGfmFnSyJJB/MwnHpl+KEvIaoUsXbqsuwFSOQZWe3U0MkjR9q
 xp1n2t3tcxIZ6Pg9Z+nVVQS/wRiH2YNRsJxFZecGEJpOSQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80ttgq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:21:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d7f90350f3so5800331cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 13:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759263667; x=1759868467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+VFb0crc/qOwGeBvP/JtK6grpmOtlDvuwQF4VkTnYOY=;
 b=MTFKxOYXCfGcK4WHB87ClU5h16+Wt1mvAUzDakxBKc2CX3cE1CiphYDT4T/tEP4ewI
 EMVgkZTBpCz1mf1txfDB7R3BPyd4JJxtGZ3OW7F6mDPR+rIP1W2hzvS0gDx1iCIimQ5I
 LQlpxHSFFXW+gRKiyp/aLNBY0cj3BeJAKObB2TgJZeEmPX24vXZK1HtAYF1pBAqomI6J
 /Sp7XtIYmw/hNATkMbNR6A6tEWbLjNCaby0dASrJZyPk91X2cSjTYvBzPrFvsqPZ5S9r
 PnS0zQvB8O110qeHfFd88WWtljlfHsElFodqjMp0kmWKStPgRsaYuhPr/X9CeZaZItoK
 b18g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3AzIgjBtjcblKffTbLe2nRc6Xib8Wf/Jh91XBzvT1jUW80+160q91H6jQho+osktsh00oSh43Les=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBIXT/Wrik/Wqh5NGT86BLOdkjYQ5Bttlb6+PGxjplIsUw4ODV
 ORasdeQHz3tlDaJ4qIYOrrK6FfrmFMCD2CPMCBRWoQHlJ/cZqUEflkDuo4iVfjlF/xxeyKLsMZh
 1HS0iScMbtxf9sxnU59n8lmjhnQ8juabgXubOxYRvZTnRxGuCLWiOqp/3G+XsAlHFIcbjrp4=
X-Gm-Gg: ASbGncs6I8v9CarXYLQiiWGKqUWGydI46S0ajGoN3+RBbPtYPYyvBeIYAYCXvw7ur+P
 dzL32azDWuNat9eTL0NxnemK2z3i6ZeF5OhreaFDgSoqEYIA7v9/XroXybkk2Ejsz44FIcJ+EIl
 5b1lvJ3DHHp19TgABXPPJ8ZL4I2ViIbNy3/3zI890i50uXCJybylMPG5/0LbnPv/MsPCFC//1WI
 ys1fJro+MzjQkw62CuvN25yL/8m5+KhBPfJTADh/3+dwVj6oChFVaslbDOjwuoKJWgNv6ZdBqn1
 /oY0N3qsddgxi9y1Lnzm7EZOAkY9vtGy6srhMs68zqrqwN88/RS86JyZCi+bjmfDjVY9bNCxd3o
 sgGnze22CrWA784oSpxDcmzz4DXFerukk7oFS2wEQfACuUSYfOvW74F8S/w==
X-Received: by 2002:a05:622a:5d4:b0:4b2:8ac4:f097 with SMTP id
 d75a77b69052e-4e27faf2456mr85876351cf.33.1759263667313; 
 Tue, 30 Sep 2025 13:21:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs3xT3p2rzPd59HRBIpsMj0tVPI+tZJQCN5NZbJA76QgFcZCY2wPZXNF7YjDhP63JSlWg6Kw==
X-Received: by 2002:a05:622a:5d4:b0:4b2:8ac4:f097 with SMTP id
 d75a77b69052e-4e27faf2456mr85875861cf.33.1759263666813; 
 Tue, 30 Sep 2025 13:21:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316a32113sm5289277e87.102.2025.09.30.13.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:21:05 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:21:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
Message-ID: <4r25h5uaamfkprrmvrtdqfjlcgcnkfyca2o5q53hteta7rlrbq@xqlrjxhi7z2u>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-12-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX9OQrESMcw4nd
 SZl5WU5scLix5nP0E40ntdzc4Bj9EXxvZThkgLKuJYUBn8OrPuav3KdjQz+Avlg25Jy9BvI9pRs
 QhfgWN6QzEN/TaEcElPQEAmxPrwi4MH1c4hT4m8yOGipEymALZ9mdPHey7RlUcZjIRX3g/PFcUS
 V2o72Oyx2O+BZvHU36oaSy59t7AzuQeu//StA/OwAsNMhXmdkPxgviNbArnF+cQDEeb33YzK34B
 YdJyfazMf2ETtLnzqfvRa8HkP1Zxz0F8q6h8q+5pBMHvTzATL6pcyBBjpdnEQw1PrABdCwzwwFa
 DSfHmISa5m4oPf/rhvgPujvi/tUH8zZ1uW0+YQzR3atMekThUmqtOtzqNyhdI8KJTyK44gYaRpI
 7SifwzEg5OqpozII0LBdu7Y3LFxaxA==
X-Proofpoint-GUID: NiMY1q88L2hvBDoSzVV16Nw-RfSKTpAl
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dc3bb4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=2L4VR2zxEnLzMnak7dgA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: NiMY1q88L2hvBDoSzVV16Nw-RfSKTpAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
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

On Tue, Sep 30, 2025 at 05:09:13PM +0800, Damon Ding wrote:
> When multiple bridges are present, EDID detection capability
> (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> determined by the last bridge in the chain, we handle three cases:
> 
> Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>    &drm_bridge_connector.bridge_edid to NULL and set
>    &drm_bridge_connector.bridge_modes to the later bridge.
>  - Ensure modes detection capability of the later bridge will not
>    be ignored.
> 
> Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>    &drm_bridge_connector.bridge_modes to NULL and set
>    &drm_bridge_connector.bridge_edid to the later bridge.
>  - Although EDID detection capability has higher priority, this
>    operation is for balance and makes sense.
> 
> Case 3: the later bridge declares both of them
>  - Assign later bridge as &drm_bridge_connector.bridge_edid and
>    and &drm_bridge_connector.bridge_modes to this bridge.
>  - Just leave transfer of these two capabilities as before.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../gpu/drm/display/drm_bridge_connector.c    | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

But I'd suggest pulling this to a top of the series to let others also
take a look at it.

-- 
With best wishes
Dmitry
