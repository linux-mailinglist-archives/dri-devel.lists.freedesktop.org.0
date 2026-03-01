Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KQ5Dz5wpGnCgwUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 17:58:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5051D0C6A
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 17:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85F910E3DD;
	Sun,  1 Mar 2026 16:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkhYPumS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T5HtZ/1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AB910E3DD
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 16:58:31 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6216L0Te3776367
 for <dri-devel@lists.freedesktop.org>; Sun, 1 Mar 2026 16:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yZjRbJ2gpSOpi4BD2wRxX0dJ
 2Njlip5bE4IRh4tsp0k=; b=fkhYPumSL/QAlMbXMLtEWChiX97tIzcJ8VeBIX4T
 7342qTqQUCnt0S7oDq9sQfzhyGpEUUJellGBOuoJYTfsmMFHgnXodEk5AC55z1iG
 c18u06r73+Pdj0npRxhtTGO474kenLYedhcwWpbRcBC3ivwUaTrgm50Dsqk4R6aI
 +2cwuKSHZdg1z1b9ojEBXDyD89t9uzig7w2KMFQb1bUwamY01WeikQvsTWQDMhlM
 wS7Axd8o1A+YDbnxSksJB4wZ0i060owQOeU4T2ACD8MJ4tYn9Af87F/Z+bjux2Vo
 fOz++88nKgW1Zk3CTwm94ccFlRFF5WRpv6fuV0NvlWcAeA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksn430q3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 16:58:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cbb8040f48so3485699985a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772384310; x=1772989110;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yZjRbJ2gpSOpi4BD2wRxX0dJ2Njlip5bE4IRh4tsp0k=;
 b=T5HtZ/1dr8xhlk5K5n2vsvGjj6cJVNlMgnZaFJ286RkQDiVgcMhI7DH+rXVapZ1r2R
 Lcik5RDe83oXJqKTPio3Bf5OkEZmeWAIYkrhstjXFlTpJuM+KOv1C6WmgpLHj7MfZMTy
 eqeLkjkXL9rAk00SK4smmodiSNDj/Shcha0NLmYs7ENXMQu9yBnag0VfbcA3GEwEd+bz
 daruiYD7DdmgCiZNVNdwtiWxmYsJmaYU7GH6U6Rln4fd8E4tin3iln2IuhZVKvK+v6J1
 Rji6TxGl08ZDo46Tx4XNjQ/aPX8yc+L/qeet2Sehj1TTWjt6rbr1op6BuhpQ9pZbFf0g
 rFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772384310; x=1772989110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZjRbJ2gpSOpi4BD2wRxX0dJ2Njlip5bE4IRh4tsp0k=;
 b=Xc67Ppj5DAEEAF/RiRu18KonkuiVQOc2+PyE7tVJrqd4DuTYVJIPqr8OsVkHqo7skd
 nRYy8V08O928QdbgvHUR+NH8DRboQ18wTTV4oPoad4R6YT9zk3avSOMPQmlYs8z9sqhk
 wBfeRNpi5hndw6UXMQLHnIhihUzhU1j6dSbf6qFG8dcs8fonCxCH/sGCZW5KX7kSaNNc
 UlOVWBsLDHfJczZGiPxCGN6lILbnJTsmOcbbirWLZlKgJo+xCXHwwAMHKF+KEUDbFen/
 +wmhsXktAKFn0ld5O7drRZrVjXRtigbUuKk5nBXoMreJb0E7IGWpx+dQwh7QG4VNX2Z2
 7rUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg3l4EhtBB0BvpYbFUFVG4iwjjJoh3fNUpLb4A4NI+ecvKHOuNvjqB6C0e1ar81Ma2nI2FrsU4qMQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzieB6kHeoai8oW04ErVbVLkhHkIE+qsnvgfxYQEWsb9ZbzhuIP
 RC5Qpd1HBWqBI5hK92vRoZiyO4kzoZXaawUGQU89Kbm7EpMKDtZmX7lH49uUsDPTJoOU5/oTFbu
 kO2kMm0TA53NIh0JerW3B41zIIHMVNCKs5BV7PnFgr2G1dcivemWKFKDZwEYJ0ysDhpyeY4E=
X-Gm-Gg: ATEYQzwdrhwK5KDgVVdTLkIqO9epNjz08f2UDkpojoS35UK1OPxfjcDwXvJYO6W/hdt
 UxkPoIktUbIhFFa8VkXhDpbAdNAeeKN8kUyMQWnWySexiZu88b+pjtTRiShmgBQelV3NZrDZ5l8
 K8Mhhn/HHwYvV9YJ/isqJoNDXId+k4n1NboMPe1xEM+2JGGOWjCwkdZNl1E113U1VCoH9chrSm8
 6T0cb4rlmPGYeMCg6rNxcZK6DN9Stin2qCeUtUk/G/knWKzxWNZmPy6tDy6ARapTv7lnQGl4SxR
 6ls2vjEBG1O8mwE9W/B7B+AdIGsUrbohIFA25o71fwcI/yTzuUfu2K5a4DfvR8LWLO/cfw/GKL8
 SbIWDPSS3nUtniNRL9/m0+ormhSI5gKNNEdnPEC1RlmxyISoRQ6uaOrJIySrJUuYjjOZLcsycHS
 oAeh01Z8/xQwIIYyHhZ+wAV/pRfHS4nsaFgi8=
X-Received: by 2002:a05:620a:3952:b0:8c6:e8f6:2c7 with SMTP id
 af79cd13be357-8cbc8e4b725mr1252713585a.38.1772384310461; 
 Sun, 01 Mar 2026 08:58:30 -0800 (PST)
X-Received: by 2002:a05:620a:3952:b0:8c6:e8f6:2c7 with SMTP id
 af79cd13be357-8cbc8e4b725mr1252708585a.38.1772384309937; 
 Sun, 01 Mar 2026 08:58:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca0dbsm1204999e87.41.2026.03.01.08.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 08:58:29 -0800 (PST)
Date: Sun, 1 Mar 2026 18:58:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 15/19] drm/connector: Register color format property
 on HDMI connectors
Message-ID: <mxfdm4rrsizf3jzjbeoxosb5lhm2wrzqipn6rvly4ukrodltgp@vcu2fkgwagdx>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-15-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-15-658c3b9db7ef@collabora.com>
X-Authority-Analysis: v=2.4 cv=Tq3rRTXh c=1 sm=1 tr=0 ts=69a47037 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=QnxT5sWzqww7kDut_5wA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: eGP34BtDox-9pvixaWjsvzeJ_h7qHbQ6
X-Proofpoint-GUID: eGP34BtDox-9pvixaWjsvzeJ_h7qHbQ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1NSBTYWx0ZWRfX5pglYhgCySYS
 t+T05L3e9GVZH3EPIlEfwoeroRxq8FblHZ9AZYIbDH0hSvaIY2L3kXnJuuxY3boVuu2zKSQhTZw
 suZIo3OCiiA1+1Ss87Ff9zYULv1Cz3axS7pqsc4eIqNvqh/k0r1HDDmOEefCkM4CPvbC64ppdNC
 5oz8ACpHJGNDJ8Qdbo/mMJ743r2UbNxNPqIUt/zwxnubmH+j7v7/P2j9IDs2TIqfJRr/9+nwwnr
 GX6rXVAIcRyEf93aLmqCksGdaQFG6wlO+gQIFEYOXVrodqtg0ssQHVhWgOj2eh3KqQYhzkzu0Kg
 qzHssebwjmbUuKE8I8a68av0d6br2k54IxOzPbjeN8Qi3ictR/zTIafMEP2SsfYNsicCSUq8nNi
 XV9Pw3jcVmaU0SCtySsfNGy5uOgcy3hhKIrRLAolXXjk0S9B11ePOQCM2obOmdEkr05liTTzNGM
 Zc40BhEYavPVQrEVHiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010155
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicolas.frattaroli@collabora.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:lumag@kernel.org,m:s.hauer@pengutronix.de,m:robh@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kernel@collabora.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:j
 ernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: CA5051D0C6A
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 08:20:20PM +0100, Nicolas Frattaroli wrote:
> The drmm_connector_hdmi_init function can figure out what DRM color
> formats are supported by a particular connector based on the supported
> HDMI format bitmask that's passed in.
> 
> Use it to register the drm color format property.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index a4907e15dfc5..0f4e24446a9e 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -627,6 +627,9 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  	if (max_bpc > 8)
>  		drm_connector_attach_hdr_output_metadata_property(connector);
>  
> +	if (!drm_mode_create_color_format_property(connector, supported_formats))
> +		drm_connector_attach_color_format_property(connector);

It really looks like:

   drm_connector_attach_color_format_property(connector,
					      supported_formats);

> +
>  	connector->hdmi.funcs = hdmi_funcs;
>  
>  	return 0;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
