Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFOxMlincGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:15:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCAB550EE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E1010E743;
	Wed, 21 Jan 2026 10:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1D+LO0y";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aNHFlb98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A90E10E741
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:15:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60L6XL912938431
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ITPm88aV4JzH5fq9gpUXrg
 BaZryXscNZaMU+0OHF2aU=; b=a1D+LO0yd/Akq8L07j6M1Z/vYl4qDsent+EzmF
 yBbTveZ5E2Z55IQSfAA/gJvU5R+v2u3LFN2gXb0aZJlEe8C/UP4LTQLUu8fDBjh3
 6ePlMrUWgAdtPOmpLl/jd726q/2fUyw9AAGzck5c7v2QEooZbiNOg2sI7TVfzpqN
 F09nAzmvYtxXsOqO6ooFL9tOQpE/9zNwvTSWAhXj4z2KOLeC5A85u08kjeE8pUBP
 SYmLWJ+98huAzARtLS/wVztzXODS7un4DV9+SVgsjyA1RR19GNuA3WosHmybiUpL
 eTJuMsQlHwKa3jw2SWk/h/nYK1timqLJK//nQqMOB4/NWoPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmu908k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:15:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52dcf85b2so401514385a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 02:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768990548; x=1769595348;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ITPm88aV4JzH5fq9gpUXrgBaZryXscNZaMU+0OHF2aU=;
 b=aNHFlb984fn2gV8PFRiObauxRSvQ6DYYPFAoCU8s1HydqgK4RZdK7U3OGipIbdmxIp
 XwwZY7xEZ671hnh2EdHYdWc7G7r7INkS77A0u9gB6PejQjno73h2dAPtFfYHYTV38SAR
 PV4YEwoQYrk+/iaLf4KKO4jpJssSZFk4H01+7elk0YQmZNKJ3TVn0J65pQIVhhucLCAL
 8viuuA1oABcasff4phRgPA2rKE8YBj2Is9O+D/WbLon0b3l9+Oaw4+nZ+L4NCV6e7szC
 11Mli7H3AIbTwdBHSEYbJGOZJv2+WAHik5Vvu+xeoyKNmei8Lvkrzaf16RWrxtkaxZr+
 JKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768990548; x=1769595348;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ITPm88aV4JzH5fq9gpUXrgBaZryXscNZaMU+0OHF2aU=;
 b=B5CxfQmlzLbRGEWxpwttoNRs4gWvDQOOvaXOq7kfjDwM0xDeTFSHRAsKmdADwijl0+
 EA52WfEWZxh0vaWIPu5INqNIoDe0U+e8Rh9wI3utz+Zbv11YweplI5OGvK8+ey9ZzPaU
 gYaZzK06fF4lHoNMi2YPbB8W5lCsu/KD+tRKRQi5rgheQ74a3xiyA9T8bn9KWjVOs8jJ
 ENuppNZZYF7f1aKMoyV4bExHUd+GCce1NDWHC+YWSQ9ebz+qM165jJH/r8erw/G5YwFI
 2Inm9mFbabA0SeWbuXB5Mygtpxj3WnZAYwNLTlnotQSpxReVIHeiU97L/j1RHB/nx5PQ
 5c3g==
X-Gm-Message-State: AOJu0YwBMeZ8r7VT+XEyt6n0OAd1HDwrcgD1vpE4d9PhkLhrpO9YsDcX
 nPUckN5pWHzTOKR7H1luLijC6cYqPBVytZgEhV6dhii6RcqHvyvJIG4XCZNmt/dOYC9mwCYGdgx
 Hhdf0r4DeRysTFi0OWcM4hx0mWxIr7I0Wnjr9tf+uK+kxc1msW2jdDoI8Kynh3S2v7AVYZ3E=
X-Gm-Gg: AZuq6aKstYPCD/Dl4QWtSlEg17esW9MDwlbS+cPG6TPzpnkcNEUoVT1uYwEiB1eElzv
 b7oFzKWeF6OhUuNjkbmPRZRbEvFth3Yv0NDFZkksHLV7sCvJeFY8PT7GMOopVqoVDO0P9hb1Rft
 VUY01HRNs+VuS8CF2IeWOKIQRHAhNLpEVOuYvB8XcXx0pkolIcvP9RWG0QJGO0E0wA1/JAnTU+A
 qzaCziZ3+ZoRjKo9qPG84tXN3185RN0R5cfZlfxV16mTivxoA4wRsIZyJOKSkzpZonVbxnn+QuH
 F3F58+5kDvQWGCqXgBQcaLsXAOfxkcL4HTJouA0rQqPHMga5VqeJcqw/r3sqO9+ooPC+xkJgiN3
 +I4LP7kISQoByQtf9baVDBNJIRk4gpiqmaBtEY4VUaVsZoHki9W34ArZ4lhgQ7n+Lmbicftuwhr
 8An1yOhIwHCxfkuJfp34aia7g=
X-Received: by 2002:a05:620a:4586:b0:8c6:55d1:aa4c with SMTP id
 af79cd13be357-8c6a6956064mr2425031085a.71.1768990547588; 
 Wed, 21 Jan 2026 02:15:47 -0800 (PST)
X-Received: by 2002:a05:620a:4586:b0:8c6:55d1:aa4c with SMTP id
 af79cd13be357-8c6a6956064mr2425028385a.71.1768990547185; 
 Wed, 21 Jan 2026 02:15:47 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397785sm4720733e87.51.2026.01.21.02.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 02:15:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm: bridge: anx7625: implement Type-C support
Date: Wed, 21 Jan 2026 12:15:44 +0200
Message-Id: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFCncGkC/3WMwQ6DIBAFf8XsuRhYQU1P/Y/GA8W1klSxYInG8
 O+l3nt5ybxk5oBA3lKAa3GAp2iDdXMGvBRgRj0/idk+MyBHJQTWTM9bU6Ni676QYbzppVKDxKr
 XkJ3F02C3s3fvMo82rM7vZz6K3/uvFAXjDPFR8aGVtW7bmwuhfH/0y7hpKvNAl1L6AmLhvAixA
 AAA
X-Change-ID: 20251126-anx7625-typec-07d455f423da
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DVyVjd3DA+M4ICG8nrdapPYCwKc6tga3+HUezhcNR48=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpcKdRp0cS6dFURXtA2XjAcTajk63y7k5PHALqf
 1EUbOGTAISJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXCnUQAKCRCLPIo+Aiko
 1WUECACeTYP0kN9b5t/Hxm/8RwzOLSt2MO2b+j9m9KynWmWKgqwluN11nvOGBeI9EQj4W+Siy9j
 4KrsaAHUizKE0PC3krv/pYuWAVqK9jueBUfuRqs4SAvhBisZuN+YJPdVByd3S8PqAK5L752pWXH
 +qnITFRiQDkFRwJ/T0Xou/ETFl8YtgPfV/rScDGBg6E2tA6qv44GEl0LbKK7nCBDJX5FkvMrb5i
 xG2yGbUu3ZTsEc3gwtE4AwAzpO1QFr7oK8v1PdWS0EudfUWBM7KJOgj003BHnGDPhkV1MUiRxaX
 b9pvxSbnOwtz5SdbsQJQNx9EgDr7gd8ALJkQ9Sdgqr6YpRiP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OaiVzxTY c=1 sm=1 tr=0 ts=6970a754 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lTOfhhQ1OH7yEsO6ukYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: YCxxRmFBzmR0cf8dAfJzoWazxQBYbSQV
X-Proofpoint-ORIG-GUID: YCxxRmFBzmR0cf8dAfJzoWazxQBYbSQV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NiBTYWx0ZWRfX35De+ismB4fX
 Ipgvx5YskOAD4QnUWXNl/uxIQKoMaFkI541qSxi1nfeKyeQqHqsw+oBL+fBkitMIRaHqoqxuCr8
 B+Q1oBbjpqwydUYoJJDstLw+Kd2MVR4cw2YVCdjyIaSfyhrTvRJsNfTqVnQcRLkEawleuAxV9if
 oaEKhDeNe6XkxAvITVinJqmp7u4Kj9F7OdyW+dADBx0r58Q/0ezm3qWMANclKvb9EPosSfh5tWa
 +wDmXTamMzwiAVC+sowNokFA3HUVEH2MQmnBeoHlmTol8v5WGQ95UQJ0wP3AsV9it2lDgRN8NHv
 InWA7bW7bsMlm+kZEm0FgTQdJw+9h42OF0L6Y1EPAnCqmr3w+F1kTqRLciVoq/oSwOJbGCttc1X
 LvREyfrbuSS5LOIIByRKxrzLGViBDhAMNVgbb4unEQOdbD/mcCBNnhU2eAUf1eVay84dM7DGjwH
 wM6vilVHHz10T7kIhSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210086
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:xji@analogixsemi.com,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,analogixsemi.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 3BCAB550EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ANX7625 can be used to mux converted video stream with the USB signals
on a Type-C connector. Provide minimal Type-C support necessary for
ANX7625 to register the Type-C port device and properly respond to data
/ power role events from the Type-C partner.

Notes:
- I'm not 100% happy having Type-C code in the DRM subtree. Should I use
  AUX device and to move Type-C-related code to drivers/usb/typec?

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Reworked handling of status bits, removing code duplication.
- Enabled setting data role through the ANX7625 messages.
- Link to v1: https://lore.kernel.org/r/20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      dt-bindings: drm/bridge: anx7625: describe Type-C connector
      drm: bridge: anx7625: implement minimal Type-C support
      drm: bridge: anx7625: implement message sending

 .../bindings/display/bridge/analogix,anx7625.yaml  |  98 ++++++++-
 drivers/gpu/drm/bridge/analogix/Kconfig            |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 223 ++++++++++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  34 +++-
 4 files changed, 345 insertions(+), 11 deletions(-)
---
base-commit: 873e63546ef0e4c612f57a097e4fbcd5b2f4abb6
change-id: 20251126-anx7625-typec-07d455f423da

Best regards,
-- 
With best wishes
Dmitry

