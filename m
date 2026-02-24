Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAKqDzbmnWlDSgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 18:56:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D067918ACFE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 18:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E422E10E608;
	Tue, 24 Feb 2026 17:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6z45EV4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A44KQGU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967E910E602
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 17:55:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61OFYg5o061849
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 17:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=BuYNK5gGs7TF703M/4BciC
 3vLGDek4/jqEOiMPcO9C4=; b=S6z45EV4ChEIAjDAygUnjKqsUJd/hc2snSO4F1
 IgdBf5xtR8Yq8H4dHo1HduIOUooBaE4vW/cEVKPD6cTFzKptRuArI/7WzsFDlwwM
 GABxufZIo+ekPBDTGy3VQ6suWfK3OaT1TD17efc4iDlYivurU8rgCuByy6qT1UTp
 tHnp+Ch/ppItfx6o+7huZjNQhyYFcoXyCLBKdbLHT6ASOnl+eP56Q/6qpzUE62C8
 mz9rP+27hJXAFALeXi4WGbByVWnn7fGB2r4hi+oIIZI7HHB89Ihv/v8hFQXPZpKW
 97dtQDGMwDP7x1d0GZsuwi9W8aS6bMCG3HIyI/ArQ/BtrYqA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cherj8hf0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 17:55:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c70c114e02dso1215725a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771955751; x=1772560551;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BuYNK5gGs7TF703M/4BciC3vLGDek4/jqEOiMPcO9C4=;
 b=A44KQGU1aP1Qyvsn87VWQ8gx46sVrfVzNpbsEBgolUCxYaC5Fcd1crZoxudDkM2PW7
 JFCGQjryX+v9/TAvJXLNFoaL7vc1pG95nZZvXAwDlSqGrCRAcGUpGJIeLALJKoNBum+E
 UkxPlt0b8QbJh2j3zJonteG/9NO7yoADpbInyQxcGQ3NCz7x7s+lS0asXvQwuRdbkqyu
 gQkGTlRJ9ZTbMx/EBRbcEvLSsmDk2RK2aaKJEGJSecVu2p1DIsRBOjvpUPPIv2MwEjaF
 E8M9fS+kGsNK0rzorJy6LPI2iJjyPj70Uhpii7DCw8yaBLFcez/eHLxhOMm+r78+Wbrk
 l8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771955751; x=1772560551;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BuYNK5gGs7TF703M/4BciC3vLGDek4/jqEOiMPcO9C4=;
 b=oo4dZiKIREnWNTlI0ZST4ENsgEy81/XnfTtGaLbTTIO73fEAL2fvjeUko7CjtVTSre
 b1TihPjB5x8w//L2iAWr7LNbSCpkJg495kjVG+8Tb8onwMMEHfaNpheRC04Pkz/q6tTk
 7zdMGyEeuMhTZ4NGiUOI20luSLIC8K3JcienzYLIQ5VwbKNRvZ/tasC/3gIOZMHtBC4a
 +KoCooYqR4vp03RReS40LZZaPjlJvLXX+g3PNLjgQHy4cEQGhmCPVp6DEflEEij0yxsm
 LPsQckml668MmNkJS0iwP7ieHj3+HN56pdbYm4QSr5rFs7LNUXj5weSRbziRiJoHium9
 8uHA==
X-Gm-Message-State: AOJu0Ywl0nABnPQYYhCjTavPau7IEXOMC0JL1lYDv8Dl/6RslOEaJAXE
 HCb0wPF5OV7GHPcs71K6FA2BGgH6HHkwDYv3rNqrQE0OLQjzPz5sX7DikeELgN5qOLQ6GWi4C6G
 lC8WP09wJoF4ISCclIrSFnBlNpiVt5PRNhVz5JkP6hAxrdvurB54zk7UeBKlKSd8Bn1uUxnc=
X-Gm-Gg: ATEYQzxKYIvOt/UWPNWU0jMWMPe7vbG4GR69ZD+uz/kDgcbXqwN3C/30eQZ4R6j7CO3
 sBji7bcK2uoNSmxRw5jW4IJ0/iblLtU6AwQ8PEE7TUBzvcG0EFo02eTIeuYSHwsH7tTc+Ox0b5Z
 CuAu24vZaI8YGG2B/YoFQ5Svfbs+pmEOg1jFah9mB73ijeB58RStqjrsFa49x5Eb3qNJcISgUdY
 FVUe/bB5MZ+ypEfaQ4XaG/UKhgji6Ib6fNNR/Ux7NkoRJaQhP8AZjE55E7LGnd8DVaRYKBUGBLj
 Kqkn9JKHMG3BZ3gOy18t8LDiF0HPblgXhGfgobobmNyxTBCg1r1FNA84TnB6QzCuMDqqVm0bIF/
 e3r4w7kC8g47C7A8h60GePW48XVP2Yx/I1wVBx2ricVjc4z7yBX+QS80i4N2KplHF3cJQzR7V8c
 PUgxF0TrLMkGCl0+lkU3xZljkXdIXaUebvGTOOPxjsCw==
X-Received: by 2002:a05:6a00:2354:b0:824:91f5:aa2d with SMTP id
 d2e1a72fcca58-826daa6725emr6281454b3a.5.1771955751300; 
 Tue, 24 Feb 2026 09:55:51 -0800 (PST)
X-Received: by 2002:a05:6a00:2354:b0:824:91f5:aa2d with SMTP id
 d2e1a72fcca58-826daa6725emr6281425b3a.5.1771955750694; 
 Tue, 24 Feb 2026 09:55:50 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd68e147sm10338005b3a.19.2026.02.24.09.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 09:55:49 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add lontium lt8713sx bridge driver
Date: Tue, 24 Feb 2026 23:25:34 +0530
Message-Id: <20260224-lt8713sx-bridge-driver-v4-0-b5603f5458d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABbmnWkC/4XNTQ7CIBAF4KsY1tIwA9jiynsYF/zVkqhVqKSm6
 d1FN7qwcTPJm5f5ZiLJx+AT2a4mEn0OKfSXEsR6RWynL0dPgyuZIEMJAJKehqYGnkZqYnCldjF
 kHynHmgkhpbFKk3J8jb4N4xveH0ruQhr6+Hj/yfDa/iUzUEaNkxos2JozvetTqm53fbL9+VyVQ
 V5yxm+tWdSwaCi1EwobpgEWNP7REJc1XjQFG9Ua3zIvzQ9tnucnxByIKl8BAAA=
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
 =?utf-8?q?=E6=9C=B1=E6=99=93=E6=98=8E?=
 <xmzhu@lontium.corp-partner.google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771955743; l=2039;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=DIZztn7GRp8nfyI6TfrlMQ62hz2zY99dI5lpx7SpZJs=;
 b=sec6qpxkmOJ1nftTfPduQBbBusYllsemNyffVhpFcTp9+q8JW2nFYQ5teRHvqUgws5KBDNdqw
 m6NmZAJdjfLCLk6qaM11FuIcR9+KPWBIjDtBPe9rNFvHirgxBkkWN57
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE1MSBTYWx0ZWRfX9B/Xa4Xk7W3L
 wUcI+N4cN435baSYSDUedEKUZekXAMwI6vQgrFdn0sA65rkEbT2RU1nyrvKJhdeL7yTfu9fI2M9
 ek/TLM504dniiHnVoyL9aS4R4ne3LDhMy3cF6bluNsAQYBrExVECLBp9Q42ucpKB41FRqsMZNx/
 H9C+BMQvejx2uJ5WNT4OIn9CnHfxPmx5YXeTbRdjW+0hUsMA//CJo2CZHuaGqM3y03NKnXyTE67
 n/QsVG0KjAOV/YDZyGfsy6vg/4wZ2jneLQyzSerf2JDhozx7/p7I0vjhJ/TzLxDQu1HGV+xV75f
 IKP6UGIRwhTsqbQ4AMwTSFbj2d9ja34zLi4zLNgAnIQo1Efpl+ES8QikYQaDl1qRPOtWS6PjCaw
 oIBItvCUtfm18hCfKiRUrkKVlAcJ1livzF4Oa+r/pn+0GQu53zY/XfMmlK/BN8NE47njK8kzp2Y
 w9KZ2IMVlEK9CVUfFxw==
X-Proofpoint-GUID: iXsHaHq5CAg1m3oSO-RAOSjccPoKQxAk
X-Proofpoint-ORIG-GUID: iXsHaHq5CAg1m3oSO-RAOSjccPoKQxAk
X-Authority-Analysis: v=2.4 cv=NeDrFmD4 c=1 sm=1 tr=0 ts=699de628 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QxBZ9i5KDo26hP1ghMIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240151
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:syyang@lontium.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vishnu.saini@oss.qualcomm.com,m:prahlad.valluru@oss.qualcomm.com,m:vvalluru@qti.qualcomm.com,m:xmzhu@lontium.corp-partner.google.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lontium.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[checkpatch.pl:query timed out];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: D067918ACFE
X-Rspamd-Action: no action

The lt8713sx is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter,
with three configurable DP1.4/HDMI2.0/DP++ output interfaces and
audio output interface.

This series provides bridge driver and dt bindings for lt8713sx.
The driver is required for firmware upgrade and enabling the bridge chip.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
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

