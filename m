Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C765FB18099
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 13:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4548910E830;
	Fri,  1 Aug 2025 11:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcECG74I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D5210E830
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 11:01:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5715Conp008990
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 11:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WYXbzMnw5z0EY1ywIC96A2ih
 mXgctEyKvWfHkcqiLTI=; b=JcECG74IINB71b79qt9bmcDbE8rCgBzFU18Ibe3s
 /iFWDj+a+KdAnS3o97PmmMe8CtF2f4q8cQvx5tFKdEqUmaUtrBDVz43anokERFD/
 eSBzvbj+cuumSVM9NLVrWyy2zI+zUUWrfkEpGcpQv/WniKd7p/k5AeFbvT+SyR/r
 I5UhMf8TX3xl48O5lN2efCCWyRWgVPatZzgzpZHzJg2PlM2HsYBfEEUAlhuoReiv
 ow/kpm6sewgNaL3UFM4LlFuCbhRbb6cvLS78v4JF2xcS21c1tbXHXrWJh026gVI1
 xAMFtY2DKBuWHTpKxlOB1Bm3mdtxP02SZP5mMa/YaK4Ozg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488q7xs4bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 11:01:41 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-74127ea1e8aso767785a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 04:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754046100; x=1754650900;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYXbzMnw5z0EY1ywIC96A2ihmXgctEyKvWfHkcqiLTI=;
 b=UsMSS+fwhddNllgYCs9v5XrpFj8+iWyBfCT7PB+5VSyqRpEiD27gVXpN6QmjKYHomQ
 1ACFkYL4J855iU7l501URm2kJPUQZSSNKSTty7m9+iJYUtzgD1qcUWZd+YssbyhqZWXc
 RCu+AHvS9iBgBiva6pjQ0Ho+V4+u/xUZkLbXe200irBHxFE2K+FadJ4YKi8pqFabaXtr
 /ENmyzOgNRWEKnubsLzzv5tA0QmkgDHkpcEFpYsvtRzxpVjiozP/FjlsKNtVcOxPNU5B
 sfqWtprfdp8lWoeT7RrR0JTQo4xAxxvOcvjnTywztqf1oVj6jlRSh52TcWknnzluM6X1
 D5mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqsoHNfJ39IIlp5N94Qrivt4pEwlYZcAEshzkkIxEGjM9MqNXeY/8pxJ8pCCzbbUFaajfBJroCRpE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEG72F7l3OsyPaSh3xS4U2nytURlk/o29Yzpv9d85mEa58rFe5
 lNCLEHPzC9z+403tuGY12Mwqi91y+91b6gGrKuDAXRo7M5lbeFnYBCNZunaJCeBpIcq8vMsobxI
 AIkW/4DlbdjANtL962nYoV6ybryoEeVFdVUu8zdl8axIRUBxL0x2bWoZnoBR+ZE5Y1JNh1i4=
X-Gm-Gg: ASbGnctK9FB4B7bAu3BpDuhHPyENsHMgug/u6j2u+lF8MGqu6eCiDn67nDzqeXNub27
 I9+yT/KjKSxG4mDmEXcTl+X4yiQdlY6l984jiM61QNcUCwuM0xB/Zs8xSFHHm1gEk3rYmUqJWy2
 8xqqMcvZ3s6OmVQL60lv0eRSrmaulW/a0pqzAyt9YSrADv8ddOZuDWkMPsawgnir902bU3maqb+
 /DCf7Tqfmldcs3er5eJdL+lQUvkbF27Z5aPy1izHAswfVV8yUR/91bBJfBhPCY51woFu5NFtJA9
 QM3GnvEO9dNwip2aodYCxoQBNuEh+yCBZoUmGgBbiyGlAYlRpCam7iG2RWnI8fm6PIaiR0LWb11
 O4GBn+/mvU5VUqI07UBlbDgyl8QvWzNomAE7YVNikZTo7lwKS1ys3
X-Received: by 2002:a05:6808:11c5:b0:409:f8e:72a4 with SMTP id
 5614622812f47-431994c5dc7mr6196311b6e.2.1754046100515; 
 Fri, 01 Aug 2025 04:01:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeekOIBhBvM1aX744gw8MC8PaaFZ0GuPKhfPo5fIJIqWt7YIuUI58LsNEZlnoO8H3h7iHzrQ==
X-Received: by 2002:a05:6808:11c5:b0:409:f8e:72a4 with SMTP id
 5614622812f47-431994c5dc7mr6196247b6e.2.1754046099912; 
 Fri, 01 Aug 2025 04:01:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b889a290fsm547517e87.54.2025.08.01.04.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 04:01:39 -0700 (PDT)
Date: Fri, 1 Aug 2025 14:01:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org,
 lumag@kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lyude@redhat.com,
 luca.ceresoli@bootlin.com, viro@zeniv.linux.org.uk,
 andy.yan@rock-chips.com, linux@treblig.org, javierm@redhat.com,
 linux-kernel@vger.kernel.org, devarsht@ti.com
Subject: Re: [PATCH v4 1/5] drm/bridge: cadence: cdns-mhdp8546-core: Remove
 legacy support for connector initialisation in bridge
Message-ID: <zur4q7hcb2jujfxowrhoh7sxzkawadv4oe6vuemb75xnajq6gb@ti7hhpt3fb5m>
References: <20250624054448.192801-1-j-choudhary@ti.com>
 <20250624054448.192801-2-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624054448.192801-2-j-choudhary@ti.com>
X-Authority-Analysis: v=2.4 cv=EqPSrTcA c=1 sm=1 tr=0 ts=688c9e95 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=sozttTNsAAAA:8 a=yxYSh2cz8_at7VSpBNAA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: Y9ph7cBeC24Mkb2Y6-vVxzp-QbH6T-PD
X-Proofpoint-GUID: Y9ph7cBeC24Mkb2Y6-vVxzp-QbH6T-PD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA4MSBTYWx0ZWRfX1XSkUkaoF7mx
 kuZETkDJ/l1rf/sa3hX9gmzcsufre3tKG6wp2GGiGMJgma1nG1szIfsYumvEl1DMFvtUkIpwzoN
 hH2IVe1KGB8Ky9/TU/9C6SFsWavjPtlVg+HroE1rOdrFCcLPlplf4GVkvMe5MbEdybcy5OxqtDh
 +1MXoHksss/eDhH68HFWmOEgPQ62qFlm8K+anp8D7HxfjAt0T2LagKYccPzPtZRbpG2lElM5HEr
 uSOrYMfWwtRIuCRQFn8EzQiPNzmFyfcfvqIQ0VcNMH/annJKhOQR/QjM4KTO5AYV8o7GNXYC8TL
 4gQ8Wao4sbWSOayarUeO8H2oSFD35R5FKo2zJOqSEuz7v2u08F9aadrQLe41qrzJuC2QoQkfbv+
 4LSrJFLNQ29/CqFNPxVM9iT44tqzxrVmW/Fux2NGro8LQuop/0WyNx2rhiMipMksMqDXhXFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010081
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

On Tue, Jun 24, 2025 at 11:14:44AM +0530, Jayesh Choudhary wrote:
> Now that we have DBANC framework, remove the connector initialisation code
> as that piece of code is not called if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
> is used. Only TI K3 platforms consume this driver and tidss (their display
> controller) has this flag set. So this legacy support can be dropped.
> 
> Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 187 +-----------------
>  1 file changed, 10 insertions(+), 177 deletions(-)
> 

> -
> -static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
> -					    struct drm_atomic_state *state)
> -{
> -	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
> -	struct drm_connector_state *old_state, *new_state;
> -	struct drm_crtc_state *crtc_state;
> -	u64 old_cp, new_cp;
> -
> -	if (!mhdp->hdcp_supported)
> -		return 0;
> -
> -	old_state = drm_atomic_get_old_connector_state(state, conn);
> -	new_state = drm_atomic_get_new_connector_state(state, conn);
> -	old_cp = old_state->content_protection;
> -	new_cp = new_state->content_protection;
> -
> -	if (old_state->hdcp_content_type != new_state->hdcp_content_type &&
> -	    new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> -		new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		goto mode_changed;
> -	}
> -
> -	if (!new_state->crtc) {
> -		if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
> -			new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		return 0;
> -	}

This is the only place which handled disabling of HDCP while disabling the connector.

> -
> -	if (old_cp == new_cp ||
> -	    (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> -	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED))
> -		return 0;
> -
> -mode_changed:
> -	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
> -	crtc_state->mode_changed = true;
> -
> -	return 0;
> -}
> -

-- 
With best wishes
Dmitry
