Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDSJD9RvpGnCgwUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 17:56:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9281D0C2A
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 17:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433AF10E3E8;
	Sun,  1 Mar 2026 16:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7bYISNY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZlrROWA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A659D10E3E3
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 16:56:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 621GbMkS787950
 for <dri-devel@lists.freedesktop.org>; Sun, 1 Mar 2026 16:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eOVsPPjRSHguluqilN+Kykf3
 N9M3bR0DVUL4ZH0XYBg=; b=g7bYISNYlH4zm8Xc8NmJw+M0K5jMvJ5cjPbQXgbm
 bGMeZQy7zp6MKJDjrHG1fpDIjml8NhjImDmfW+kEkNkuk8P3xFLHN90IqHo373cM
 RW5Ndm3pzApXW5silQHbujFxwqjOsi7o42PFypVLnjOlH32AAIGkMYcU1z4FAhXh
 n9bbyOltX81FKyM+Ec7S4fznCBe/RqQqafp0KNFl6kNigll5bQBsL0XwZxmm1AH7
 5OYkZGlfPKuqgshdIAdW+rO0jDOUncXt3YNu1bSO5WZY4Kl1DWo/wmKwpwLodB6R
 uuIKygv9NTamdvEIi7PH5LbqSED44L5RgmBIIQyUW0La4A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksn430mf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 16:56:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-896f50f008eso367824806d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 08:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772384204; x=1772989004;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eOVsPPjRSHguluqilN+Kykf3N9M3bR0DVUL4ZH0XYBg=;
 b=ZZlrROWA3fWA9bDFigL+iBEPASefvCxzGCqq3o/sJgRBYrxIOrK52Nw16MFf2WOHIO
 mgYBQ49UDznVeBx7jyMR0SjwqnEPSKH4At+NKAaGNbIhGoowAzrvzAaA50cetycvHRSr
 cPPR8B7Mz/c8jJ+uCQgXQ/AqX+HwZvPFQom0eS9pkmH4xinRYxZuKIzBYnl9bmfy2KH7
 sYEtnFcmUOktR+6bWSi3RBC+sC9Ub1+FUOFMWrSI2PaJMvOwA3OQxhh6L/s3C0rnlrLh
 K5wIlAKmYtw6ariwu/uHe1C8VZ34VUkKFv9+TrTKBr0UoTkK6+6YAmPEes/htssPJqJE
 dT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772384204; x=1772989004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eOVsPPjRSHguluqilN+Kykf3N9M3bR0DVUL4ZH0XYBg=;
 b=fdHL3RBe3bq4FHJUNkrEkt9hl/EOHAZzfuKee8hrKwJFpmLZKPtDQGQ1gwB8D5CmTL
 iT+rNpHDtjXjb7qT+S81EI2J4oJGJLfCxF8aKnQeJH+n9xrsAi7jAr3CDTPnZAAX4Ql/
 TM0nt/D9kpxREe5H4pO3Rt6NnS3E55I4FvVgnSsu2vz07LMxE3gMSaldEYhr0WwgoSaL
 h7bTCA3lfL+0S5M964brMgFe/0TcMIpEvfeudy3/UVtoZLChSMViulfXnSHCFwDNl5is
 wKGc7t33z1Z0I86zoOuVc9a9VVq8K6LJNHfTxHeu8Z0/CMaIwZ0AwgnHOeX7xcJzFfvt
 SRuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy4YztJjzc69sW8OZlbP9ZkYwK3bDNPlF1Fdhqs6TgWdMTCyMqQwCYQeYVnEKKRCDBnsgrgb5aNjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzeadi+h5een+PMps0u9dCEIpP5AMlPI9G25EoD2kTiWGuX4t+a
 SFFG7Ve4LnI4rUCW61J6LmJFQlUiEXFQ280yoOTMYI8thzNxnAH1RfSTlSGqYZOsPyixbxygf8X
 rmXGSXqVgelgCdFsjsSmXX3PIsOPK+h1c7j6IUxg3Q7iQXrfJnDv9d9G2DLC0PaXhEDHYwHU=
X-Gm-Gg: ATEYQzxskQeSwpac67kUzzKOalN/GDT8+hfBNY92W5JAYt6dJfBAXF5NoAIGtUzLEHb
 lnk932e5DZiBWNR6+uFITKGdtAe5LKNZWpIC/QtVFrOTIMP9yeduF6KjieYXtws7CR9hPWEPnFO
 R9Oc/FJaDKP/2bjATZU8oo1xX8gb5nc7v2kxuSlFuwrzRAuj0eGmwCJW3YPJsN5dKUin6rkAZBL
 j1U45pPYSm5++R/8qSm0aAxJW+KPHSqFyDzRJ7CMM5vWSXbzEvE627SJ9hc4XQPzlGfCvffMeWv
 ak8X/nAcrTcdJHp1jfAIUtGGsP6JdiG1u8Gyw2ffyC3M+OpHfcUoj7dcHeXF10CS5TR/kUaER86
 TuMQFjIy3JJEw6k6wyWN73HTYCEUe6hwDFzsD2ySpustHnnRN/d2rs6dOxACZP86ieY+JTYqBWs
 QVslMBlNIJL4B/VUs0WgzDCNRsXThE7U5+gMA=
X-Received: by 2002:a05:620a:40c5:b0:8cb:1c3a:90d6 with SMTP id
 af79cd13be357-8cbc8d6719cmr1207726085a.7.1772384203878; 
 Sun, 01 Mar 2026 08:56:43 -0800 (PST)
X-Received: by 2002:a05:620a:40c5:b0:8cb:1c3a:90d6 with SMTP id
 af79cd13be357-8cbc8d6719cmr1207721785a.7.1772384203394; 
 Sun, 01 Mar 2026 08:56:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bd9996sm1161185e87.2.2026.03.01.08.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 08:56:42 -0800 (PST)
Date: Sun, 1 Mar 2026 18:56:41 +0200
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
Subject: Re: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
Message-ID: <ylcczadyx5ovc7lbb57ehux62x6zbawf2k2pd23ymkp2meaqci@fvrf5gserw7j>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
X-Authority-Analysis: v=2.4 cv=Tq3rRTXh c=1 sm=1 tr=0 ts=69a46fcc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=RMrH-QTV4azj2PXgkmEA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: lf-Cdbp15aTD46l9lGh4NpSYI6vz-ULx
X-Proofpoint-GUID: lf-Cdbp15aTD46l9lGh4NpSYI6vz-ULx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1NSBTYWx0ZWRfX8UUnUjANN8YD
 yyjyEmWBHSfEKgYoJctc+pETA8/yf2hcTjZnA6OqoEwmM17+nhCDyIlfpf7d61WfQd7u/EtZBo4
 knfm+vPdSYiwBEHk/m53cdPg9PcvHDhNV68VORNsn0GbSswtG5apEDqTrQ88JEe+vgG32olz5pB
 AaJJwBdgByL0BC9P1UiEUe2WklF/ZgE2NMCEo6xdEYqzP4Y/VwMfNTAbJ0uD2x6aJljuv5Vm4LK
 wUuUGp2rEO2YK8huObGETNzKIcM3K8AztpOtBBjTJbkeBYyxRfRxLUfURN1YhZQEYzIvH30NcM/
 Ga0Rn8c4wEGOK3UbjZTBCG023y15nxPxEB6LpdWLrPLvfxZRmGeMZbEBfiKWIsPpAj7I3MN55d4
 9X4dToJSp3KKO99E0WMwmPoetVQtfU9GjNhzZ46c42XN+yTWNcD3Q1UoogVxVgwcqssZgLHzv6u
 v9eR8IKHBkRnmJTOj4A==
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nicolas.frattaroli@collabora.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:lumag@kernel.org,m:s.hauer@pengutronix.de,m:robh@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kernel@collabora.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:j
 ernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BB9281D0C2A
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 08:20:09PM +0100, Nicolas Frattaroli wrote:
> With the introduction of the "color format" DRM property, which allows
> userspace to request a specific color format, the HDMI state helper
> should implement this.
> 
> Implement it by translating the requested drm_connector_color_format to
> a drm_output_color_format enum value as per the logic HDMI should use
> for this: Auto is translated to RGB, and a fallback to YUV420 is only
> performed if the original color format was auto.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
