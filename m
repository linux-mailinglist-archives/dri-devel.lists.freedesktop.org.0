Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GtbGoWepWltCAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:28:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60171DAC3F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E618110E159;
	Mon,  2 Mar 2026 14:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DaO7uWE4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UgD6/m01";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61CF10E159
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:28:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6229EoJM3630801
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 14:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ExbRH/LQNP2bmO6Gmep+eudGy/kyfu9Y7hVujV61XVM=; b=DaO7uWE4Gfyz29DF
 ZTA6vAya79EeLyccQDWDAi+1kpvA23KfVXnozuXChpBJcjguB8FEzi/vl0q4Rhjo
 /aChyJW4DY6w3rauxye0jyDbCXPI5O0mxQik+By/f2hl+/CgpUNI8lwn/ZY7HD9r
 Ksd680DP9jDJghMbpwaZV7WVadyItxxz1QxAO/s+EHxueZsINj4fAf0R21KF9YoM
 9Nvbb8nOPUrPc0Eof7Pr8D2dl/v22bzyYLDxQD0WoD1UakRCgjEeUv0DKI9YouEv
 IIyFcH5Mkp60Ef4GndRPYZ4nu7kY1taNJa5Qd17XG9tz15pyatdrvFKJGWbGtmQt
 aOOCVg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhryxh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 14:28:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3597f7e6145so841876a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 06:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772461696; x=1773066496;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ExbRH/LQNP2bmO6Gmep+eudGy/kyfu9Y7hVujV61XVM=;
 b=UgD6/m01svUU8Dr+MqW2oEZy9qAKfnp/+pvwCsJRWykUU7N35Zv7SKwD7j+8zoU1E0
 OB0jgDrRD2gOVu2M6VbORjRtUIbn8Qy9E1ln4Gt8qjhHPvHv+hhTKsWXu9w7TChMPNbu
 XQsqs/7TkdyAPGhbkmpUveljCkOmQuQfpxWAcUhE5cF2Yrq5JT2MWzd43TIB8AUIExyR
 QSnwKsK7U1uTSIL6KByovFOexTvoa0TInnE1iaB6o5d8pYGrBoMP4g80ISWy8JFn4sbp
 a4tv9Cnpm5s19vC4Y7NHvLFjvMWVBOSigppZcheBJbUTN/0Ab/L0/SPeyqmMiRXN5jbH
 kaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772461696; x=1773066496;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ExbRH/LQNP2bmO6Gmep+eudGy/kyfu9Y7hVujV61XVM=;
 b=gHGz7P8SFanCVFSXNfg3MWzCGbvjJ5Sp818SsR4rilu2ehpwwmRSpoaUIwROlab+LF
 BIbn/UAUfAiB7Ju/T3Yp2YWNB6XQaXzWWEafGe7+ITArEr1+ZToDhZ2a3pnA/p/s29SG
 6XC9qE3ngJljihfXsk+AW1A2unkIhhVLX1eX0CF/ZhGR6owwEXW4uLngBlZw8ndoAv8w
 J1TlkMHH7A3fVLWe+gSKTYyQC3q+lBWhPV7SdSLI7if4/QNelPEI1GxIGitUrNzDGyli
 fZehLJb2AuyIFiPvFYJST+V+3k6dPOB86kpbz7zxQMqJyJ1WCct/7HPfhFO1E19Lmjpg
 IllQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVPOG0F4fkpvq8q8yeCh/HhLnm6w8Dr4OL0A4sy7H5pbxXdqbwomX/CW5cvC8+3P9aRcmqDLAdztE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdTITKV1G4MWMEb66C8yMfnk5bd2Ye9StTE5zhm1RxPY6PhC0S
 xLVHG//KUxHXjjip9nbNNhBcw/JeJEPWauIHm8jgNdC2i/PirecTVAxQRfojb7GdY+1GuvkzRPs
 7osj885GWP2qFrwzVKWqW/YfO855Gg+Yku/a5bqwrr88vTFWFAMn7+aH/DvRrYismd+mirGU=
X-Gm-Gg: ATEYQzybm/OLpeJS3i08yPgwZ7rchLmIHC944zsjgm4UZP2M1r1oU/yYUg1i3xppsUT
 Cnxht+Kw4UZIo64sPywsBwm4UKolfkz+eaBhL/wRNvg01fCGuozyajtcczfPyY4k6N314I5x7Sr
 xw/3DJhdaNu3mohFCHzoliXraBQc9ds+Igbs4afRJS8CYpqOlG7VXIIOLQ5i1qRlt4K8MhtBaRC
 XhB60PIx4SU+tCwv9icE4L4f20AsX3EWVmshA/9+x1TQPkJFq4HGwx72O6xE3NXJILS3Ps+hJQR
 up5Qf/xOtwhyE3gfuyUz+RKihxKiLNx9HQME1tjvAteZOoK2xMFrj0HK6Wk4euAHZwtRwuHbtkQ
 tV7948NaNg3Nl7dXUGm3WRypGhX5lvDms87QTZqecg+G7gQdQFrZxdNeN/opNMRhxfWvqesvx/E
 BVmPCyTCGyzLdl8qCAdwGbNh0y4DVoB452VRby9+cqcw==
X-Received: by 2002:a17:90b:3812:b0:340:29cd:dce with SMTP id
 98e67ed59e1d1-35965cf70edmr8624739a91.8.1772461695739; 
 Mon, 02 Mar 2026 06:28:15 -0800 (PST)
X-Received: by 2002:a17:90b:3812:b0:340:29cd:dce with SMTP id
 98e67ed59e1d1-35965cf70edmr8624707a91.8.1772461695128; 
 Mon, 02 Mar 2026 06:28:15 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359851a5216sm5358098a91.8.2026.03.02.06.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 06:28:14 -0800 (PST)
Date: Mon, 2 Mar 2026 19:58:05 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>,
 =?utf-8?B?5pyx5pmT5piO?= <xmzhu@lontium.corp-partner.google.com>
Subject: Re: [PATCH v4 2/2] drm/bridge: add support for lontium lt8713sx
 bridge driver
Message-ID: <aaWedS3RSoHH3d3I@hu-vishsain-blr.qualcomm.com>
References: <20260224-lt8713sx-bridge-driver-v4-0-b5603f5458d8@oss.qualcomm.com>
 <20260224-lt8713sx-bridge-driver-v4-2-b5603f5458d8@oss.qualcomm.com>
 <75vw5t3wf5wndredhot7ashymz4kmjyalakf6bkfexzfrs4ckl@kvaqky4do442>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75vw5t3wf5wndredhot7ashymz4kmjyalakf6bkfexzfrs4ckl@kvaqky4do442>
X-Proofpoint-ORIG-GUID: 8CtQcgH7sjFtjyMomRgUx3CS5pEVdxxr
X-Proofpoint-GUID: 8CtQcgH7sjFtjyMomRgUx3CS5pEVdxxr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMSBTYWx0ZWRfX2N+LZH9QSRgk
 habrHyp3iZIlnrv4I8QePQZYiuygdMTuZuK6iqAK5EHCTbiJvUSTSQMEoDVqji049YqOXgRvLpk
 7+iW8HzNyXyEoTsRuArZ8VNseyjfjgopPumgw7/E7T7z6CbGH5GKOUlPqhj68YmsV0qsL/swH/r
 PDrSk2GRl6TbKgjOAiZdSYZ1NmpsS6Xive6o6Cscc+WIvhqAvSkvT+BI+AoIiQWKzj3PjP/uXk7
 eG+WGV6uw5zw31fSEJiNBDh8QvzI54sk6LoEqDu9AaVNJ9ySAYGy+dlJTsTMi6BE7DxbyrB+EGE
 yzFyLdnMIjJCuAkjFHEMwHVMKfeX6e0miuW0RLTviG4RZrSsPkyA8kuvaFrflk2poV9deXI+dMc
 IYcei9HZHsKcCLWJDWICVgTElRRjPQpi/yEYpqOrRMnY8GdkCKTxMmsiSPcwmlLzQSHF2UAcfpu
 cW5c6PqwiETFuv4mRmg==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a59e80 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=RynHufMhF2RdOjRzUnUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020121
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
X-Rspamd-Queue-Id: C60171DAC3F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lontium.com,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com,lontium.corp-partner.google.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:syyang@lontium.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prahlad.valluru@oss.qualcomm.com,m:vvalluru@qti.qualcomm.com,m:xmzhu@lontium.corp-partner.google.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,hu-vishsain-blr.qualcomm.com:mid]
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 01:45:07PM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 11:25:36PM +0530, Vishnu Saini wrote:
> > The lt8713sx is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter,
> 
> "to DP 1.4/HDMI 2.0", it can't generate Type-C output.
will correct this in next revision.
 
> > with three configurable DP1.4/HDMI2.0/DP++ output interfaces and
> > audio output interface.
> > 
> > Driver is required for firmware upgrade and enabling the bridge chip.
> > 
> > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > Cc: 朱晓明 <xmzhu@lontium.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig            |  10 +
> >  drivers/gpu/drm/bridge/Makefile           |   1 +
> >  drivers/gpu/drm/bridge/lontium-lt8713sx.c | 598 ++++++++++++++++++++++++++++++
> >  3 files changed, 609 insertions(+)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Thanks 

> 
> -- 
> With best wishes
> Dmitry
