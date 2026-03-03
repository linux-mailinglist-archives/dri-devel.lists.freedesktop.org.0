Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UODOCtEPp2k0cwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:44:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B41F4030
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6244F10E85E;
	Tue,  3 Mar 2026 16:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlGiuM6L";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XeAVwwKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61FD10E85E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 16:43:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239nGTV3349588
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 16:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=UC/1X9LLLCNNOizpP5u5YF
 CEcHwOUMvz4FL7ouzur5I=; b=QlGiuM6LQnf+GbNnuPUg68tjQ4r7KxDpkgxieA
 nYHafuhTsCZvHaGidcnAyld8eiJg/e/uLGRHy8INOv3FGSm4qmgZTJxalvYXT4JI
 7KVRNTW77Q1NjMF3vbSk5OYeG7S7TcWrQ6Pd76n1MjR66997m6NAmkC+YAUFyt1U
 B0G2qlUR0PXk+pDlLBZtfwHHGyYcfQPQ8I/s8PpWL0/Wts0aRloB7TDtfCaRC3SX
 CpS00Bx1rSLNKVKu31HI8jo7znPKv0VXQCn1SMJiM/rQS4GP8ozcGOIoonZog50F
 8LDcUhFhRY9UVDKuqoFtvYWhGCBRPPU/rYySLs+JNUbAhU4A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsbk2e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 16:43:55 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-127689b770cso591907c88.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 08:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772556234; x=1773161034;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UC/1X9LLLCNNOizpP5u5YFCEcHwOUMvz4FL7ouzur5I=;
 b=XeAVwwKQtmqbQpSbSbNoSWkMQXtZIdg1wRmxXtxtL3EJoy24Ab/q/pYkS/NhrDqE76
 zPs9tAXskjJY9roecM/B0j78C9hF6pv0J0e2chy2fhvMpCyMSC4uiQDC5dpM7pJM4BDS
 nUGt7EwHP4jlF901dPSL6VDK+JZSTPlGyMvRt4XQLwlsvPYJbhDUA5AbriqyVmjoCeCI
 o3GaDvRIO5JPZSpXpTjaWdxNC6BNPSS6jadRD5BauUY0/9OsGuou33hyyYdY6pyUsp1l
 XwBATcr96ORGppT0JvIOf49foyESBkmdvnZp7cZa0AEffW0ts9IN1KRWnlG+JHwnmCbr
 CWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772556234; x=1773161034;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UC/1X9LLLCNNOizpP5u5YFCEcHwOUMvz4FL7ouzur5I=;
 b=LGHaOOHuIC8VlVxnoES8dp09LlO9yIT4lbdD0M430qAQaLayGypXYdmf2c1Ey/1e97
 gshERrHI6VziWtIeK74VIzvb9oCwCgrVb7BnvUeICayn9BReYqjAcCN5Ymqx1g9Cwtlj
 5yMl2f1EV0mJz+UjIBhoSzYucO3i1XhcAdZ1N2yOLM1xzrplMSD50J0MrOAid7aIhLml
 FM9VSqO6N3m2W5BQsu5t2rOMdB6pcc+j1y4QIFl0TTpecTQeUydOnXbEot332KnU39/t
 8LyOpw9fc/azi5IaDXHkN9fy8NyDavv5Q4vc1KSgICvuhrm+2IkjqZizhn7oN1FVbUSP
 b4CQ==
X-Gm-Message-State: AOJu0YyNoOd7vYJU8g+Q/IBf/dcVqcnRhVr8D4L3TW/IEKqqBXruW8+6
 T5w8qxVDTRtloLzOQV422xAlBifawDZxg9R8N/KEugVpwprGpltvaeZlBUE+JhX6woHzOClr2rY
 60N15Esz1iv/Qtjt1mrBcRtS5S/FEYn+uj55EWpC+yaHl+pqJNMQirAHEvfMhaWa7/d4OFmnVMH
 LtwoQ=
X-Gm-Gg: ATEYQzzVr5Z0THltIMhUniy8WceIw4SSPJkDNzq2qtRMrKTakxkrkJHMwzJlDu/xL5E
 e6QemlPHTQrZ1EI0ZpWWevLoMIPlsB8DhiFeZz2pKTSYN4BiskPHrX1X8R3LgRCp1azTFulyB3d
 uWuN0xk3qy5PgjT7NpDeEfIPd2q/nYAjZktlkXy2IBFwSM8yaQIcdfN9oEkUe51bBlSiTMBJHli
 rbGVELEw5bAjYw3fQPLg6ymbjlurVXn8cFpiZ2x2MI5Ly/PFiZg0IfgVFEvLfSQ3w1oI4GRggDW
 KOKy9cN+IOECybhOejYhKmwkf1gZeQrRzqbMaQs/sboESNCNdX3L2wF5DXC/Ttx5LqHQU9BtL98
 9D6kYhU05uJBiqgIPakgBjLN9npMa9mpoclJMbf7GvTfvntiOJVWUJxaj+3FEgajixdIUuenQqE
 HNoTg5+W3tPpQoBoot0rWsj3oY9lSCNFGW0so8PcXvEQ==
X-Received: by 2002:a05:7301:2b84:b0:2ba:7d5a:a816 with SMTP id
 5a478bee46e88-2bde1cf86d3mr2957393eec.4.1772556234091; 
 Tue, 03 Mar 2026 08:43:54 -0800 (PST)
X-Received: by 2002:a05:7301:2b84:b0:2ba:7d5a:a816 with SMTP id
 5a478bee46e88-2bde1cf86d3mr2957365eec.4.1772556233308; 
 Tue, 03 Mar 2026 08:43:53 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be002ee839sm8823286eec.8.2026.03.03.08.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 08:43:52 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Add lontium lt8713sx bridge driver
Date: Tue, 03 Mar 2026 22:13:34 +0530
Message-Id: <20260303-lt8713sx-bridge-driver-v5-0-6cc2a855aafa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALYPp2kC/4XPzYoCMQwH8FeRnrfSpM1Mx9O+h3jo16wFddxWi
 yLz7tsRFj1s2Uvgn5BfyIPlkGLIbLN6sBRKzHE61UAfK+b25vQVePQ1MxRIAED8cNE9yHzjNkV
 fxz7FEhKX2AuliKwbDKvL5xTGeHvC213N+5gvU7o/7xRYuv+SBbjg1pMBB66XwnxOOa+/r+bgp
 uNxXQtb5ILvmm5qWDUk49WAWhiAhiZfGmJbk1UboBtGG0YRyDY09at1AlE1NbV8Sp2QIynSXv+
 hzfP8A9QJ2witAQAA
X-Change-ID: 20251115-lt8713sx-bridge-driver-32704455bc9a
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
 prahlad.valluru@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Simon Zhu <xmzhu@lontium.corp-partner.google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772556225; l=2252;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=0luLqj0bA9HqriWeMlInhLYgC8atn2e/7AMYtJLxTo0=;
 b=A+VBgVZVipLftaWUhKTWxZyB/s94eLe9qv+M+zYLKr4mnWoC9/yDpNa4hnvdWT94LICh+Vr/7
 g1mC+O1NbWeDFmjUkFonV5AoZVsDvTtFmJKNUKRo+d7w3bsQX/b0IpF
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: h0PoVfmHE4uLqcRXpQnolDHkm9FtXjBt
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a70fcb cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QNFiEYH7FFPh0Mko9SYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: h0PoVfmHE4uLqcRXpQnolDHkm9FtXjBt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEzMyBTYWx0ZWRfX+XCQ0vwqvw8F
 f36jK8hsB7qDpoCQgfLDfioEkYkvIhvgUN92aPzT3YFBqi0HDAMsEeEeGt66Fwi3W5slBAgcC8W
 8wmpx8TZoF3tk24FvUeBRsG7Uyin7QRS/Ccop+8xkmWnjzhhkSrkx8cgsaYCcjHDID9bRBsEqvw
 1N+cxX4NujuvVpDCT/jmzrpGX/dOvUyVZFJqG9KMcClcLiIKdAhe5Ae2Om3hXr7/kNAsJcTYWaB
 96tMsZ0TJ0yJ9VRcBnfovG7OX9P2npKPzkN8anSC/JAIDFNpKOO4wU7Mzep4sUPSltLH1jG72Lo
 x5yIJ7oR1m+nyFKx0NMsyU6KqqZB/cka2S+bnJeG4KRfm4KK4mCJ3XPMJCLVMxVPh8CYgzDhCnM
 T5gpaps4ISPlNDZJPtep+M4z473M7JpS36++7W1Tw0snR3Dv4f4RKEUMV46A8F1CJnguqdaJUxN
 FfZEwmItY41vw+vVwlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030133
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
X-Rspamd-Queue-Id: 744B41F4030
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
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:syyang@lontium.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vishnu.saini@oss.qualcomm.com,m:prahlad.valluru@oss.qualcomm.com,m:vvalluru@qti.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:xmzhu@lontium.corp-partner.google.com,m:dmitry.baryshkov@oss.qualcomm.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lontium.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

The lt8713sx is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter,
with three configurable DP1.4/HDMI2.0/DP++ output interfaces and
audio output interface.

This series provides bridge driver and dt bindings for lt8713sx.
The driver is required for firmware upgrade and enabling the bridge chip.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v5:
- Commit msg changed a bit
- Added Author Maintainer after confirmation from Lontium
- Link to v4: https://lore.kernel.org/r/20260224-lt8713sx-bridge-driver-v4-0-b5603f5458d8@oss.qualcomm.com

Changes in v4:
- Improved crc calculation, calculated on padded buffer instead of bit
  by bit.
- Fixed brm bridge chain, using single drm_bridge as bridge chip itself will
  take care of providing all edp outputs from single input.
- Used guard mutex where needed.
- Link to v3: https://lore.kernel.org/r/20251228-lt8713sx-bridge-driver-v3-0-9169fbef0e5b@oss.qualcomm.com

Changes in v3:
- Used linux/sizes.h header for size definations.
- Used linux/crc8.h for CRC calculation
- Added Basic drm_bridge changes to support corresponding ports handeling in dt
- Ran coccinelle, smatch and sparse checkpatch.pl tools to improve code quality.
- Link to v2: https://lore.kernel.org/r/20251118-lt8713sx-bridge-driver-v2-0-25ad49280a11@oss.qualcomm.com

Changes in v2:
- Addressed review comments from V1, majorly:
- Fixed DCO chain.
- Added supply in bindings.
- Handeled deferred probe in lt8713sx driver probe.
- Link to v1: https://lore.kernel.org/r/20251115-lt8713sx-bridge-driver-v1-0-bd5a1c1c730a@oss.qualcomm.com

---
Vishnu Saini (2):
      dt-bindings: bridge: lt8713sx: Add bindings
      drm/bridge: add support for lontium lt8713sx bridge driver

 .../bindings/display/bridge/lontium,lt8713sx.yaml  | 113 ++++
 drivers/gpu/drm/bridge/Kconfig                     |  10 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/lontium-lt8713sx.c          | 598 +++++++++++++++++++++
 4 files changed, 722 insertions(+)
---
base-commit: de0d6e19d2ef33ba34be2467ffdf3595da5f5326
change-id: 20251115-lt8713sx-bridge-driver-32704455bc9a

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

