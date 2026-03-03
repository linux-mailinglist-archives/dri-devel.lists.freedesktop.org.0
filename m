Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL84M9ujpmkbSQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 10:03:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D021EB988
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 10:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5DF10E710;
	Tue,  3 Mar 2026 09:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GciZ3ZLN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4CVTbag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D6810E710
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 09:03:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 623534qN3360130
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 09:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=TkTFcphozn9ku+tN3w/Wku
 cRtPDQzYjgQnsjNoQKEZc=; b=GciZ3ZLNSU7CZxxtG4FDb/chNJZxUSLoAkSn2N
 DYiFMrZKKYosXhm4IB67iSIC5MfjK3xXvFMQMlMrnGH9lmuFoVUumD8PKjJsiSdZ
 HH8WNNyW4w4v4tNY23Cn/C7GOS4JTacurHxc0Fzf1QL838ggl/GKUzz4XoF0wuNz
 4NGfXyfp3Njg612A7IbICQB6n2J0zfOpicri+jpLwI1gHoNxthJWdiVju++j2Tz6
 7ncLHY3Xin+/ds8WhCLqn89/hhFXQYU11ervuDzJW6uyd+jNhOrvIQ/cEf+FjBkp
 Vbdip4kf3JSvUYHrKMlxUHotosIj4WXhJMFCNrM1pC69uOlQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5frshx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 09:03:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb6291d95aso5701592985a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 01:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772528597; x=1773133397;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TkTFcphozn9ku+tN3w/WkucRtPDQzYjgQnsjNoQKEZc=;
 b=T4CVTbag9ikFGXMVFlem4VKWX9GDUzAf1sbGmnoKLgPShNsdOQlME+EHiy2Cmz5wEU
 WO4P/6Fuyigkb2yKo5Flj7BIeAGqvD88R/8bbE5Is5F8tL4hgpUTcrb06dnyOccnlNuf
 BG9SMX+FEG+/TiRaOxxCQ8gLSBSNcbwW5OkijbhPsqREW1WCcQfvuaEZo+IgMJHdhTqN
 iwhO2jG7gEszS3ic4F7vLeliRn5u6dT3jb1oV7AJdXV2wyS2TYS/IuCLeO9njvhEiNG9
 xtlaFalzxYV7x5Zx72a7qJFWvfq44KNGXoBXtgoHUi4lw9ipSD1zzP/cB/jB86HwSLxL
 b2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772528597; x=1773133397;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TkTFcphozn9ku+tN3w/WkucRtPDQzYjgQnsjNoQKEZc=;
 b=hZyp2V9Dhn50ozBIjsxN9FyMUYgjpm48IBpPJ3Hp8YTgBjrLguf5Tc1SKnyYKae1Iu
 TGRm3SCA7NbrvCkbimkCVnA/rsI5vxIxlOzt+TlQGlQG4esOlt2RcWS4jDWoSpA3AUCg
 OSsLCNd152DDdxfDzKsUJYD8CROUf+GcXTsYO8LGYSU+mhzS58zNfWdO16Xa5mCM5yto
 XKS6A+alJCuiuIrxsk61a/ytPIa7Uyka2B+7jH//cEcUiPVTtUyq6VQ7qFTmO4moolrC
 iO3gcUIquWGBuD5k/tUULB0th7hWnTZ8I424XyAmyT+oPpgJ8g+7cYTeF82Cw3TbDIaF
 wr/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfo4jrS5aeZibbn4pBhZNXoVRwZ2L3Ji6V0YQRaBJcQPh9zmIHuDuKb2pIGaODyOc2EzinX8p7pjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yynn6OvhZRgz4r6R61jo9Tx8R0b2QIrP1mzVP9EqjLwBf70MexL
 w7XQbNNCxAmJQEbIHtwRzgdiC2/Fumwe/bLDjU9I5ALoGj6i4HRSMfaK3861i5UfsAROEFx4R3D
 QqZBPvzF+LekQXJxq7R3cnZyPsE5lzNuKM37pOn89P/3jOOL2W5ymPCykdSqeez+7ZqeSY54=
X-Gm-Gg: ATEYQzwqsMd/if0ivrwZZjQ304fTU9cpjTpvxdeoZzSn1UHA2LdBJHDpPDBdGras+bO
 lCNzRQXPHRcVqVlpnU0OZ8a8YY0SnEBN6j6wqkn+DCVLu1doXO7gavUZgKWwb6zs5WApVjGDRIu
 iwSlV2Yepw6m0L/fcukYrIy4Y98u6Ce0j0iem1vSnF8MWpmB9U6/DYwQuSgWmsetqIX551rLn4n
 Qv1g3v/UPuq7Ar0yzDQwVOY5zFroXopfrvBrN3+Gq1yWpOf5egmgYOiuT7F/snJrjMH316ecn+R
 UeINJX5Ta3kbmf4AxKwdjNkFWB0U9OBwYywSxv+J7wa+UIg7GosOyzpBMaupIZ0qO3Z3zASD7JQ
 FRc/TgBW0kA5Q1k/QWrCQZu/q8YNjQA==
X-Received: by 2002:a05:620a:4515:b0:8c5:c9a0:ac28 with SMTP id
 af79cd13be357-8cbc8ddefc6mr2051044585a.21.1772528597310; 
 Tue, 03 Mar 2026 01:03:17 -0800 (PST)
X-Received: by 2002:a05:620a:4515:b0:8c5:c9a0:ac28 with SMTP id
 af79cd13be357-8cbc8ddefc6mr2051039085a.21.1772528596805; 
 Tue, 03 Mar 2026 01:03:16 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b7713csm305446785e9.11.2026.03.03.01.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 01:03:16 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 11:03:11 +0200
Subject: [PATCH v4] dt-bindings: display: msm: Fix reg ranges and clocks on
 Glymur
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-glymur-fix-dp-bindings-reg-clocks-v4-1-1ebd9c7c2cee@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM6jpmkC/5WOQQ6CMBBFr0K6dkgpRcSV9zAu2jKFKlDtCNEY7
 m7RhRsXupnkJS/vz4MRBofEtsmDBZwcOT9EkKuEmVYNDYKrIzPBxZoLUULT3fsxgHU3qM+g3VC
 7oSEI2IDpvDkRlFzW3BiNaCsWO+eA0X5t7A9vplEf0VyX8GK0jq4+3F9PTNni/bM3ZZBBVdlSS
 6FlrtTOE6WXUXXG930aD1tmp/wTzrn4JZwDh41FWSmT2aJYfwnP8/wEZZkgF0QBAAA=
X-Change-ID: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=4732;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=v6GXIpomCwRaIEBFV0H7mVE2cv9w18Jd0dv/uSNpndo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppqPQFATVkMVWtiDfAQztcUVwOCLi/R8CS1GNa
 1ZEEvkDgw+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaaj0AAKCRAbX0TJAJUV
 Vsr1D/sHZq+NtGK7x3itFiR2rS3N4JOSxwkr5xJ8vU0K7ETjZBnWJfX04FfFrbF0Ofp4tGFxMrN
 3M3GNtcQvAPBIIXSkFp0Pa5d64auW/8WZXwPh8lMyVD5DbHzEEnfw5k7Zz96qHl0JobEmLTnNxC
 V/30CIjZQRzLrBymmhloBVRC1Bop1J3NY8JonZq0d5jDIrc1yNDWm4GLmCGa1gIih7o1UOGzeIv
 ZkY7rDZst0wGgb9JXpi1q6n5ViKmmDwtFh13qaSbFo/5Te+P+SwHUeLdEORVEpzC8rn8hzZJfYs
 2RbjGi3yKPjmVJ73JK8l7KNrPuYdh1Krw+UEkSRQuurWTOJMLHEb9JlUr1TFaggqXdS3R2qHORC
 geaJVNLKwt7xmKja/GIipiQf8/PZOpk0KLGRfZ0g41JVLgwjkKiaq3/CVQJ6AyMDsaq5Qq2E5l2
 ncMhVoAE1/cjBJnNnB37lbio0OfOcYO4Y22F17ZwS9V11dB06t3SFKaNaXPh27V9T339sgd6QKD
 jFLg9SdkRhAJMAdG6pAjbQXxh31O0KOW+9KidgVq70DBcJ0S7U/+gj7Pe1DZedQ04mVFyCP0kD2
 KBUW5yNZ/EsX20LuLBXyMvDm2tZtLq0lZ/6ATSBYwPHUsWGCTDeYXw6WPoHRfrQr9whd/pBUpk8
 HHyQoTbljkreWsA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6a3d6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=z1kAzz1p8kaNlQmLfu8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Hz7yVNlBFUx3DIw9IgaRJUhmahIsxFwg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2NiBTYWx0ZWRfXyVJaMb39mMo8
 6n1Kbs/qMevNsRS2QXvzaw+aCxyzS5iNes1J4byqbDWPoaBeqOtqlQXaupMwfBX8eMruwHeKiCf
 XWxzAZ6K4FQ/+26tOi6lLf+gfWeb9Hwe5YBKpBlHrrPNhHhpg8nb9Z19F/VxiCqCgBPiaJAZt9R
 +y68RrEu4h55qSXC/OQkjy4Blt6TWZ7q2V/BnoEjJ3Ta7n9b7PVdmNaNVt8TqorU4CJrJRjbd6U
 sGq5yJpQrRwx+6xtwajgtzzPwpgIICE2l+ljAWk3yDW0xiF+OJpgLN7xjNQ10h3QrAX7ryycGKQ
 L5kDCQC/N/V3rhjSQ9FKECQBv5MA0P/HTNUvKvEP3k/YXNjKsU1C9I6fqpnSiGW1ky39xmQXZCY
 us5Iyhzr8rpDIDEGZjHIeQEcwn9qo24mYFsSsS9q/rmyNYPdzKQzaboUubXemsqz+U7Wxls09bk
 /RGbmA24bx8rHgF5uxA==
X-Proofpoint-GUID: Hz7yVNlBFUx3DIw9IgaRJUhmahIsxFwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030066
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
X-Rspamd-Queue-Id: 80D021EB988
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:abelvesa@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,af54000:email,ae90000:email,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

The Glymur platform has four DisplayPort controllers. The hardware
supports four streams (MST) per controller. However, on Glymur the first
three controllers only have two streams wired to the display subsystem,
while the fourth controller operates in single-stream mode.

Add a dedicated clause for the Glymur compatible to require the register
ranges for all four stream blocks, while allowing either one pixel clock
(for the single-stream controller) or two pixel clocks (for the remaining
controllers).

Update the Glymur MDSS schema example by adding the missing p2, p3,
mst2link and mst3link register blocks. Without these, the bindings
validation fails. Also replace the made-up register addresses with the
actual addresses from the first controller to match the SoC devicetree
description.

Cc: stable@vger.kernel.org # v6.19
Fixes: 8f63bf908213 ("dt-bindings: display: msm: Document the Glymur DiplayPort controller")
Fixes: 1aee577bbc60 ("dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Did not pick up Dmitry's R-b tag as patches have been squashed
and commit message re-worded.
---
Changes in v4:
- Squashed so that it doesn't break bisectability, as
  suggested by Krzysztof.
- Link to v3: https://patch.msgid.link/20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com

Changes in v3:
- Fixed the reg ranges in the example node in qcom,glymur-mdss.yaml as well.
- Link to v2: https://patch.msgid.link/20260302-glymur-fix-dp-bindings-reg-clocks-v2-0-e99b6f871e3b@oss.qualcomm.com

Changes in v2:
- mistakenly sent without cover subject line. Please ignore.
- Link to v1: https://patch.msgid.link/20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com
---
 .../bindings/display/msm/dp-controller.yaml         | 21 ++++++++++++++++++++-
 .../bindings/display/msm/qcom,glymur-mdss.yaml      | 16 ++++++++++------
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ebda78db87a6..02ddfaab5f56 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -253,7 +253,6 @@ allOf:
             enum:
               # these platforms support 2 streams MST on some interfaces,
               # others are SST only
-              - qcom,glymur-dp
               - qcom,sc8280xp-dp
               - qcom,x1e80100-dp
     then:
@@ -310,6 +309,26 @@ allOf:
           minItems: 6
           maxItems: 8
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support 2 streams MST on some interfaces,
+              # others are SST only, but all controllers have 4 ports
+              - qcom,glymur-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 5
+          maxItems: 6
+        clocks-names:
+          minItems: 5
+          maxItems: 6
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
index 2329ed96e6cb..64dde43373ac 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
@@ -176,13 +176,17 @@ examples:
                 };
             };
 
-            displayport-controller@ae90000 {
+            displayport-controller@af54000 {
                 compatible = "qcom,glymur-dp";
-                reg = <0xae90000 0x200>,
-                      <0xae90200 0x200>,
-                      <0xae90400 0x600>,
-                      <0xae91000 0x400>,
-                      <0xae91400 0x400>;
+                reg = <0xaf54000 0x200>,
+                      <0xaf54200 0x200>,
+                      <0xaf55000 0xc00>,
+                      <0xaf56000 0x400>,
+                      <0xaf57000 0x400>,
+                      <0xaf58000 0x400>,
+                      <0xaf59000 0x400>,
+                      <0xaf5a000 0x600>,
+                      <0xaf5b000 0x600>;
 
                 interrupt-parent = <&mdss>;
                 interrupts = <12>;

---
base-commit: 7c21b660e919698b10efa8bdb120f0f9bc3d3832
change-id: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

