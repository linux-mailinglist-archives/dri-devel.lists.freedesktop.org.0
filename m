Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O6CGFz8b2mUUgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 23:06:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE374CB71
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 23:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E129810E229;
	Tue, 20 Jan 2026 22:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBQQ8f0o";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hc92Y3CR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15A610E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:15 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60KHBgmO314344
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Y4GljF2FtDKElu8MwDlEd8
 tYfMNw95VHPGCXbVyVaEc=; b=JBQQ8f0oU+K7TYKOy5GgG3cUx0J7ZZi/I44vCH
 3EXhBjPeYR1MqTsge4fJONc1Sz/lgplglxtV0zvBaaPBgnlsNFsfs3X+GWX19kXT
 g04lQADJIyO8dGZ+YstRLjX2jVAkZVmWj8SXi1rN7PA7vr4sda/KZbTZ+/lOpHnN
 TiOPjGqAmcZnBj2OjUCpwqJIIf6ZQI9pIX8WPJOk11wC2c8NEUxBnh4S5oboDYAK
 ni/BAt/BFZ7rIWwSR5cnqAbBWbH952LgS4nYklYiTWfEftvIMDAy+G6+6017TvaW
 5ik2kweD9sM8oALuxXsHydejEowGp+4Gys83vQvY7d/DFEeQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btdw2904f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-81f4cb0fdd8so4519969b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 14:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768946773; x=1769551573;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4GljF2FtDKElu8MwDlEd8tYfMNw95VHPGCXbVyVaEc=;
 b=Hc92Y3CR1s1nbZ2tihYcwgse9cDKZGlX5SVKoP1V8BE5JQHFgmM5RDveb5M4pyhw4P
 LRJsp742fGi+aje9oanBSHW8xhwL+r7nKPiARgjK2KoWSXzOfqoEmJHqHaD4Z/utB/1v
 yZQtq0tQbwo90Kq6CGZ4VQ+j8h+3m9vDavecxCG688Vl/+3HHpPjtDgcbXoPKhVR6EBF
 WOUT2GT4nDKo3xxuE2D4qNyisKsgxQiDEdmpbLP87nTWdmfOVDOewm/7trGF8NpXN0Zf
 rgIL+5wSZP2an0g9VpHIDjqxWQe41s0B4cAJIzFXDIExwfw72Y89XjpqjlGvPopdmapC
 M1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768946773; x=1769551573;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y4GljF2FtDKElu8MwDlEd8tYfMNw95VHPGCXbVyVaEc=;
 b=KGLf98M245h3suJ/j8dLvsKgfyTJ5pzKV4tLgGBmrVtE34e0AsuwfMdMcuoGXYeDvG
 9K/xJVe/JITdopACZppEAnPGjbdmYeK+k3zdaiMEzCkZpvSnQSpVFH4N7Tl2lMkgb9Uk
 74zYzkf+nyKKMvVJ2u6nuZSOSGVo1/0jRQAQaaI3OrA8IuJxyZ7/0rsxpb13d6h58dID
 WauS0b/sZJir5wqlJsnl/mnNFlbXjcclZiIgy+UVrfKiCSkAj5wU6LLcs0pnIaJRw0n7
 eznaQTWMPBsOH2F1X+so042NBPd6EQeTP4268c1QgUDGuADSfhZQa1epyH8R6yZTpToq
 zI9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQPIuA1ErUpAEpRp0F8IIocl8F2u/u2vp/4p/3MC/na3m6do4QI5BMhtT22YJlLpiv7UhbZJjSKrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTGUHEgTNTtzV+MEfm+XijaeNBTaTT+v1/Qc52haOOXZPZvnjd
 6JsSKkTZUSh/aZAxvjloEmXxfU2Y3CjgKXJF5jM5C2tyg6H3tqlU5kOQwyD5c7cypMNLmkXAHuy
 83tt1gNQPYMam5gfxQ5ELEfzhH09ehqosXYyzD7EhS89Jmadox+IIZbBld7HzhhZlB9juOpwsVL
 pVjhI=
X-Gm-Gg: AZuq6aLH9L73lcHsK5W7cFAeRlde0ART/tAqTgobFrhxpY7hG0tRT1nQS8kPCkIVWWx
 X6M8aIJDjVgVBN2OzxeVYYksNugCvs0bOzxNVfRgx7n5UYBQ/lDIIfaDCmUSfHmR9DlkxXhSMhy
 /bIXIOa70O1dpOMHusDcjSf9ZQQmITryI9CTb76I/rSvdfZtfkBUwkB3Mtwa8MCdUz4Tlre6ksc
 wL8c5vwJ1nZkh/AZ9tchTmoaeZEFpEft0v0ovGkOq7LjRZGcA3ydAWsT/pq0uDznhZkD1eHOzE1
 JczzU6F6bp1XrCBQJwWAK1KUThYt0Co3F/594fXICRxr/UJNOkpcEbAPKWPqXCB5mT9aOOuzgG0
 8Z6ca8ssR70gj6gydouTwq8AHFBLZw2hF+w==
X-Received: by 2002:a05:6a00:3a02:b0:81f:4294:6080 with SMTP id
 d2e1a72fcca58-81fe87e9f5emr2873048b3a.20.1768946773463; 
 Tue, 20 Jan 2026 14:06:13 -0800 (PST)
X-Received: by 2002:a05:6a00:3a02:b0:81f:4294:6080 with SMTP id
 d2e1a72fcca58-81fe87e9f5emr2873000b3a.20.1768946772893; 
 Tue, 20 Jan 2026 14:06:12 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa12b30f0sm12867088b3a.61.2026.01.20.14.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 14:06:12 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v7 0/4] Support for Adreno 612 GPU - Respin
Date: Wed, 21 Jan 2026 03:35:51 +0530
Message-Id: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/8b2kC/3XRTW7DIBAF4KtErEs6YBjjrHqPqgt+W6QmjsGxW
 kW5eydOpURuvQEe0nw8iTOrseRY2W5zZiVOueb+QKF92jD/YQ/vkedAmUmQWoDQfPAVaavHfOC
 Sx6C0gxBd1xlGM8cSU/6avde3Wy5xOBE73i6ZszVy3+/3edxtBjrwMD7bskfFU184biWw6+RHr
 mNfvudik5hHfzu0iw6T4MDBWatUMtCBfulr3Q4n+3l9ZkvLDE7yjgj4g0hCrAytV8kljLiCNA+
 IlEukIaRLKihv2qRFWEHUHZGglogiJGkL4LVDbNIKoh8QiUtEE9JoFQwqBO/dCoIPSCOWCBISr
 GnpfxMa0/yDXC6XHxUpNRVEAgAA
X-Change-ID: 20251015-qcs615-spin-2-ed45b0deb998
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768946765; l=4503;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9qFuBOJpVm4NZ5jGLP9VDemKSpzt4dZj5vBYO/y0ZNQ=;
 b=SFJvj/OwQhzKaZu7LBOCkLayme1MJ1wDmFGR9S15KPB11NXSJCyo6p31ClGL7lTlUFU1wME4S
 UItKvlbxZMSCICaElyGGY3HnlOLd87FjUIhei6gOPPcCZuKImJoaiyl
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: -WGoSbXZMxA4qWoRutgzQCc_bMekaU40
X-Proofpoint-GUID: -WGoSbXZMxA4qWoRutgzQCc_bMekaU40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfXwyUEctHWlu9o
 iXLUH6yDXmXIfmsJxeD8eW7uFPTU+DRN8WD4QcybLiaZbmk8WKdU3H3sprT02+jnmZE07SJ6OMR
 CxQVWOJsxKlyyph2q/GektMrX/NTk8x8/C20k4EIhHb/u0EhAr0pWvErjdAjQfjMKdQ+AOmabRA
 M/QBzNTK5GQYb4F3s2r3YnbBZGb8y8CrMeLRz58JtViZNrj3oCXF4BEzmbbGfph+WMW1PGoiyL7
 YDWeuy27UMBDjeN6QoXeFHrYbBZBg0C4IgISr7BX9iW1yI/6+qehM6BwOQkFwcLfFgsLCgw9MPr
 oPJSKSIws1eGM8lqFC4IpTl55AHXPQOA9syFGymsiX9wtmEyRFKZiyy8BnTzI9WomqiWh70Z16Q
 buy8XADMKWMF0fRkRqbhPEtr/567iMCtsDfYXJNpw2inbPPqN/ZFJ2FXAn7MwqoMOtP60wWFBV9
 vAG3IsWotGuEXSSwcFQ==
X-Authority-Analysis: v=2.4 cv=RqzI7SmK c=1 sm=1 tr=0 ts=696ffc56 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Vfy2LTQACiyTdmKGC14A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200183
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
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:jesszhan0024@gmail.com,m:gaurav.kohli@oss.qualcomm.com,m:dan.carpenter@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:quic_qqzhou@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:quic_jiezh@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: EAE374CB71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a respin of an old series [1] that aimed to add support for
Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
have consolidated the previously separate series for DT and driver
support, along with some significant rework.

Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
down version of A615 GPU. A612 has a new IP called Reduced Graphics
Management Unit or RGMU, a small state machine which helps to toggle
GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
full-fledged GMU, the RGMU does not support features such as clock
control, resource voting via RPMh, HFI etc. Therefore, we require linux
clock driver support similar to gmu-wrapper implementations to control
gpu core clock and GX GDSC.

In this series, the description of RGMU hardware in devicetree is more
complete than in previous version. However, the RGMU core is not
initialized from the driver as there is currently no need for it. We do
perform a dummy load of RGMU firmware (now available in linux-firmware)
to ensure that enabling RGMU core in the future won't break backward
compatibility for users.

Bjorn, I have rebased the pending DT patches on top of arm64-for-6.20
branch to make it convenient for you to pick them. All dependencies
including dt-binding doc patches are now available in linux-next. They
are ready to pick up right away. In case you test dt checkers, please
use the latest linux-next tag.

[1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
    Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v7:
- Drop msm driver and dt binding doc patches as they got picked up by Rob Clark
- Update interrupt property to use 4 cells
- Rebase on top of arm64-for-6.20 branch in Bjorn's tree
- Capture trailers
- Link to v6: https://lore.kernel.org/r/20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com

Changes in v6:
- Move the rgmu register range update from patch#8 to patch#6.
- Capture trailers
- Link to v5: https://lore.kernel.org/r/20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com

Changes in v5:
- Rebase on v6.19-rc2
- Make the reg list in A612 GPU's binding doc stricter (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com

Changes in v4:
- Rebased on top of next-20251204 tag
- Added a new patch to simplify gpu dt schema (Krzysztof)
- Added a new patch for GPU cooling support (Gaurav)
- Updated the gpu/gmu register range in DT to be more accurate
- Remove 290Mhz corner for GPU as that is not present in downstream
- Link to v3: https://lore.kernel.org/r/20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com

Changes in v3:
- Rebased on top of next-20251121 tag
- Drop a612 driver support patch as it got picked up
- Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
- Remove reg-names property for rgmu node (Krzysztof)
- Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
- Describe cx_mem and cx_dgc register ranges (Krzysztof)
- A new patch to retrieve gmu core reg resource by id
- Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com

Changes in v2:
- Rebased on next-20251105
- Fix hwcg configuration (Dan)
- Reuse a few gmu-wrapper routines (Konrad)
- Split out rgmu dt schema (Krzysztof/Dmitry)
- Fixes for GPU dt binding doc (Krzysztof)
- Removed VDD_CX from rgmu dt node. Will post a separate series to
address the gpucc changes (Konrad)
- Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
- Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com

---
Gaurav Kohli (1):
      arm64: dts: qcom: talos: Add GPU cooling

Jie Zhang (2):
      arm64: dts: qcom: talos: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: talos: add the GPU SMMU node

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |   8 ++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 149 +++++++++++++++++++++++++++++++
 2 files changed, 157 insertions(+)
---
base-commit: ebd1eb365caef3c815cb8a041d300dfe4263faea
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

