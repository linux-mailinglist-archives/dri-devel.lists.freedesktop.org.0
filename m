Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOg8Hc4mpGmMYwUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 12:45:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53CF1CF678
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 12:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC1710E1BC;
	Sun,  1 Mar 2026 11:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUN3U7SK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NGoSqEru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67C510E1BC
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 11:45:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6216gp0F1083280
 for <dri-devel@lists.freedesktop.org>; Sun, 1 Mar 2026 11:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9IhWw7jETeTBU59aFUoPt94R6Buo5mucBgCBkH/xhww=; b=mUN3U7SKKOBRtR1g
 Bk7P55hgFSmaWqnbGJNlbgtpOARezja2FkEdjQw7HyzPkH3/KIvJaCpEvrtv7L2Y
 B21rD9jW6Jxcb6rZiECTh72p7T+nuKc58AR2JaKhNHEg528joVFjdpve+qO/4Mcb
 +veSvgdAmJRLqJ80eo0nPMAjREAC/xh8KAmZpH3G343byRHFNoP3tJda8uDYn6Q2
 LhVLJwzWvt3M39yl9Rz9Xq8eul0/Hbkh1Nqd9Ou9tq+FPlb2A/k2TzsxrmJ5taNg
 fqoSNZZZibFoorwvuV1y9bSdBRDIUHWYw+Jn5u8vkHaXsFU/LqTuL+3kQrVCVSsw
 VXQjcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd2n6c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 11:45:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c71304beb4so2451914085a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 03:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772365512; x=1772970312;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9IhWw7jETeTBU59aFUoPt94R6Buo5mucBgCBkH/xhww=;
 b=NGoSqEruW/TLOfn7W4HxbY+pZsg/UKN8QEdVd+03fDlU8hMpUzf6iG5ny0a8UelnUB
 3jel6ppr4ib4djdnc9khixAD/P6ZrhjdWMaiVATwfCdiqyLTuFUo9exlXfQbdKXHaFYL
 uiuvQDknTISi7WcU6hr4IiSvs5IihemqZ6FTkG7uGQIy41Fm/C7KsD6Js0vZCCOHYoR9
 2Ekl3iIQY9MMDNOmJ0J0DoriyPcN5FNruJ0lifcIhKKu2vF2TtG0mcKg3bp354EJiDiq
 RjQg4Ae2YYSfskBBKHKv7j8xN1LxxALQb+qaxUkkkiBTqyvvbT18/hiJH9oha4VSqglH
 W1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772365512; x=1772970312;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9IhWw7jETeTBU59aFUoPt94R6Buo5mucBgCBkH/xhww=;
 b=Jo7aGR/KXvK0ZmsUdUBIe5xMRSwdqq8wTphIli/b0RMVGShVwXUZ2LmGDqzAG3lwe1
 VkPYsA+DRNh1QrIqVLJkWwg1hIQqMZrutUrEoVT0iQJ0c5ebExB1/WonEfQPzLISMMMV
 Lh/hJbdWS5DnZMRtkIPrdilrFFpcDRTChwld4xEUvTOkWrIuDRHV0kZ5Pk3FE99u5LdY
 vaQapyZB6mj1O68FhaJUrGQsKGTiOE/KljK8zfenyK9QB+YOFdo5jpWVTZ8zuAWEp7Eo
 Cm0TmRyQagKtWND559Cpx4MYr0EflCDr0Qh7QnkUhtWBKGefV+1HOJDPinlZ5OWhL8OP
 iJCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzMTwdqlja30wX+LAAr26hSm6L9D/oH2cCYDC0ag3tiTTYu4bxg8BOf+iNNChxWiQCqJgq7W5XG1Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybwEetCcPkjjAxydy7hMfpLc57C8/juoNbb4V5JC7T3XHVNg6b
 p4/cWUoPbbwWdUyG5TqzcxAPtZpV+S+bWK4OkrlWfOx5akZlU020M5yMWodbBjbD2wI/CqjRSkn
 qOuwY3UOdChvg1Bl4tvOoef1nb4JkOV5HXku39jT7Hr8CzAETONmvpMYHo3mhGXV8sF9lfQ8=
X-Gm-Gg: ATEYQzzPWGwg1dUKG0dR/Rgt9e/wQSgzFfzLeLaO7h140s4bxaTCamGxITpLTUJR3ye
 evB+a0EvR3+rV4PooY399Ny86p9kGJNlK44g4+u7td2atEAzi/gYjz0ywikJHxmWkWLjzQTMHEs
 dhhQHQwDedx/+tizLM+PCiX3WY56Frrt7k41SWKOdcNtu093rSNVyz7U6rdgoaedCSOd6hQ++ue
 1xWN+DDl7t9TtpwmX9MwkbdWG62wHOBYRFgx/lxSAI/doBJNrQAlCs7qAuj489MtSW9Ff7pabJt
 pIUVRBK8Kb6rFLJa1SNU1ywWhCSYfS1R4GMZvD3fYAlRlCJ9ubtKysOv9AMmujw5CAuLhOnwZgS
 uQF77CjFgzFSNF1pt4hOoab9+n8CxZf6l6XtsXdt71qYrIxmyzesO+lLBcra0PJQZOX+3yFZRF/
 XReC6Cyamba//o96YmYl6TQcshRYV1P2Oi0XY=
X-Received: by 2002:a05:620a:29d3:b0:8b1:7c0c:e27f with SMTP id
 af79cd13be357-8cbc8e54d43mr925535085a.82.1772365511943; 
 Sun, 01 Mar 2026 03:45:11 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8b1:7c0c:e27f with SMTP id
 af79cd13be357-8cbc8e54d43mr925531685a.82.1772365511432; 
 Sun, 01 Mar 2026 03:45:11 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca083sm1031126e87.31.2026.03.01.03.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 03:45:10 -0800 (PST)
Date: Sun, 1 Mar 2026 13:45:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
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
Message-ID: <75vw5t3wf5wndredhot7ashymz4kmjyalakf6bkfexzfrs4ckl@kvaqky4do442>
References: <20260224-lt8713sx-bridge-driver-v4-0-b5603f5458d8@oss.qualcomm.com>
 <20260224-lt8713sx-bridge-driver-v4-2-b5603f5458d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224-lt8713sx-bridge-driver-v4-2-b5603f5458d8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEwNiBTYWx0ZWRfX7ZFbWT/JVEbp
 Wsve+NIYoJfsX3hB/Yxse8H/9f7PbwzC4S7DNUpdt4XsbU8tmrSmSjIHCQzV3P561zX9HiuHt0c
 wd37vLV74kWAt1F+1TfMAQI/aZM/xUPKcJt0120dggtEvHh9INmhRSCm19Xcbf+DorCoM9IYcz2
 dQrzOwaRUFh5t43XXB9AN6h3qFoWAHesX6EpiMPMGESeTC3No/HOfiSSBe9QIwySMRuXd8sAa71
 24KeLTpS731bFyaLG/4tfrKWvfDsakp4Ycb74fxg/Vr+4QMi09oj+QJBQ6e8uD3+CbawxxfuRvK
 0j03EGT+hncoyAtnRiZ9AHOC0beT079M2hqQRW981FKPRuA7lV3kChljoflFaNQiSLbku/k+DeR
 VODPlDwp2E/MNy/0d44D/KflYAeQfoXJSyGnoY1A/RlOWha8eBO/RXg11f8kU3hLecQ5ntX+VKl
 WSKilel3X9OSbmmC5hg==
X-Proofpoint-ORIG-GUID: cO0sFfI89xPxoqa1jneqDafIpRQzBHPj
X-Proofpoint-GUID: cO0sFfI89xPxoqa1jneqDafIpRQzBHPj
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a426c9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1XWaLZrsAAAA:8 a=JLGnUU-u1E3EY4DFL30A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010106
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
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vishnu.saini@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:syyang@lontium.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prahlad.valluru@oss.qualcomm.com,m:vvalluru@qti.qualcomm.com,m:xmzhu@lontium.corp-partner.google.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lontium.com,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com,lontium.corp-partner.google.com];
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
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: D53CF1CF678
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 11:25:36PM +0530, Vishnu Saini wrote:
> The lt8713sx is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter,

"to DP 1.4/HDMI 2.0", it can't generate Type-C output.

> with three configurable DP1.4/HDMI2.0/DP++ output interfaces and
> audio output interface.
> 
> Driver is required for firmware upgrade and enabling the bridge chip.
> 
> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Cc: 朱晓明 <xmzhu@lontium.corp-partner.google.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig            |  10 +
>  drivers/gpu/drm/bridge/Makefile           |   1 +
>  drivers/gpu/drm/bridge/lontium-lt8713sx.c | 598 ++++++++++++++++++++++++++++++
>  3 files changed, 609 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
