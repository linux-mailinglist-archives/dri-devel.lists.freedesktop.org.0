Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGJYNnD8b2mUUgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 23:06:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7604CBA8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 23:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E391410E257;
	Tue, 20 Jan 2026 22:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5kE6Mst";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eprQx7D1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85DD10E257
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60KHBghJ314349
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5ao5MxgRFD8rkEGcXPs8DuTKugl75L7IlT1qpaV8lLo=; b=b5kE6MstogF+i6ik
 sCNyL4aWh8+VUWGk2mdkXAmf9W6ZEeTEJresDjFSleS+TPqj8A4PDmMEhUyKxM99
 pZ/nt60w+0RMla/JaPh83KMqQyLyO5oTMzeunoNa5OcNSQhKaneePaNSbCPRfV8K
 MPpS9ack+2hrlYm09ieeioGFlU/cuU+y2DJsEITBcKY4Qrx+0CkbOD2chQFlA0UV
 SnKzh6O3Sl7tRzqyTqsqEVOB4seE4vkXnxXIWEyGZYynoPmqsUFbChv4mVqNS5N9
 oatwd/7XB84lDq0npniLmvwBqME/W+r438KP+TwrY66RAI5Nq8vcGX8iVjqy0FKA
 nsukkA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btdw2905q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-81e6ec1da28so4547154b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 14:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768946796; x=1769551596;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5ao5MxgRFD8rkEGcXPs8DuTKugl75L7IlT1qpaV8lLo=;
 b=eprQx7D1lz38RH0jZDZ5pZXP/yAKZ6xdxaw8QDP16ewAI7IvlvjbsWXv+yPgw+dEUV
 L2K4EI+ZTRcUW5AJZorAOdwVbRCa4Q2dGs30CdAj8dVhO1GzVj3IH6ksiKWualpIddop
 FG7jCYh7I1sSCn0tVFevZX1Nx9VlaBVRkD75NbiOHyS4Mrq3Be23tBdy5yUlrDZs9sLu
 ylKjI7wofFJTNLIewITpZfTW+ujlIUlVWIxJWdh9zCeoWTiTiIiYh0677VG7ipt/lC+g
 AK+Yh4JaNEj1ccAeFFDgNb1g5Py/OIjktu7MyJf+JtWCruDafbLo/9gArGrdjMHIb+ke
 akOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768946796; x=1769551596;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5ao5MxgRFD8rkEGcXPs8DuTKugl75L7IlT1qpaV8lLo=;
 b=sJQJ9okFXt+P/js7d8IpDiA9QZRHqlG+WZjQCSyZXfHR5a5RuI60IQKkSdIZV24yJM
 CTXFbAJsJtCh9DiEW6V0RBA3Z7Esh2CDT4ovabd/Q7c3Ghg3K/LCqFME3bLMbJSnVm+y
 hiwpTq0SSkn64x3nrC1we7rlaTqv/SO+l7+rRCeM8RJJZmidfJuvjrXxSqgJtPmGoshe
 hafNUGKwXRw4IrrC/ggxao6cVUMAphO2iZIg+o50Kh6JVjjoP8pfI75hzAJvk89MIJE6
 f4t6IFT7po5Hu3+fdGtYjMuLltx4b2oX3JeOEuaVmPiBROZFU1LfCekCyDdq+KTo9pp8
 S1GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/F8QRT3k5COY6rpJmYJufkSwWQYNwdPAhkj3l9t5vrs7WlhZ7N/uCvYyKnDn4ZfMCzQzN3pVxGik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo9cFgO3w9WafnXheEhLp2dXc2YZp4c5R5XjrRN7TYlGfKZHuP
 M+dGAC0jCEQM6FcVaMB6Z6Ehx8fxb18PsZiCUUPMyutcMH3m/a5T6UTYXXt6KcUEKbkjGhxGpZR
 13imSRACNIBs55DM3zdf3ytAvpo2uCkiPt9WCjqPJEPVzBYoLVAPZFj8FqNkNdYQXB0r7CiCGde
 es3y4=
X-Gm-Gg: AZuq6aLaw7WhiUG7DcNUbArb2RyyDSst0VsnnrYiSmhW7SLfT8yndZgj+WUs93XcEkd
 B4CNQyvtediGEjwyOZLms4UyxXWF6frSYj1YSFrgFVCJ+2Q5CDS2H3EZ77J1LxVGkLwxWOdwlEW
 yLs7OfkyJjJ4uwdSUQC9DTRkDVb0IaCHGZZJC5Nmupf5abMT2clTjOo5TC2DAdCABS2ZpE8M5tW
 3hfFLP5TlKk/P3QA9mMuBJbt6cCI59estJv2uaRIH9an+uasTcK7dYreAvZEYzl1RGL9ZihRWKR
 uk4LwLUojW1PsIC9lm7XoxrFDHUwxo53pU9IrcGL/ACh1o6MeTOqJPIV4z6MjyadcF4x/7PoM3h
 REhym1P0mF7/H0u9IzJIzRIlhuRSJppnx6g==
X-Received: by 2002:a05:6a00:94f2:b0:81f:42ba:2005 with SMTP id
 d2e1a72fcca58-81fa1780f3dmr15165347b3a.6.1768946795640; 
 Tue, 20 Jan 2026 14:06:35 -0800 (PST)
X-Received: by 2002:a05:6a00:94f2:b0:81f:42ba:2005 with SMTP id
 d2e1a72fcca58-81fa1780f3dmr15165316b3a.6.1768946795141; 
 Tue, 20 Jan 2026 14:06:35 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa12b30f0sm12867088b3a.61.2026.01.20.14.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 14:06:34 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 03:35:54 +0530
Subject: [PATCH v7 3/4] arm64: dts: qcom: talos: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260121-qcs615-spin-2-v7-3-52419b263e92@oss.qualcomm.com>
References: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
In-Reply-To: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768946765; l=1569;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=mm7OH7DhhrPoewx3F6eoJTJC7J5WYhKTe1PwFwcJBsw=;
 b=5fwB6EOc/g1yYfdTpwYze7kGYW957kHbnrYS3S3ykB/kHpdWwf/o35z39XJb+7D8hbMK6eXey
 EsiZjW1+ReTBGU6dUXnnQKbIMOBIJZ7EHnSoZUVsiSMd6ujROnZ0zaf
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: QNO_L96xg8EKxRVVoCYTAOCF3a33Qis-
X-Proofpoint-GUID: QNO_L96xg8EKxRVVoCYTAOCF3a33Qis-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfXxVDonX7OkKk8
 nQeEr50PLEtT9tDIvuODI+B18+5AdxviJqdJrC3ImO+/yG5KVe5Zkg495ehzzOaKvybXIUMF+cg
 22cHxrIkWLvq35nQZqnkuT9sM0tTRNOL2vDsRELDy5Wx3dAmbELDWhCbUvyf1gHIhIA6hKyKw2h
 LNo1JGhHl/NVvOjCIEYmGZ/zpY7PBIHaIBUfx9GWIJikGu3g0XuklZl4M2V3PoZydPgI43U0g8k
 GI9Zd1qJy/L5Kz3+7e5BAzU4WrZ/+m6bE194sf14vkIIGsWzrWu/X61E9qf0okujUHrkR1hCKCa
 wpX11cXdtoqivB6EiR+ZxOjAkaN2qkFkE8auXJlI3evUFsvIlQOS1exyvelaMpgh/IQJeYv7AHl
 mQ37rS02OhK/YFg/LdgETY/rLrDVfKuI3mgJ0RpZOWS453RS6TiAGDrVNMltVhm9Vqpl8frno+9
 uSGTbeh0aG5fn8G9oaw==
X-Authority-Analysis: v=2.4 cv=RqzI7SmK c=1 sm=1 tr=0 ts=696ffc6c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
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
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:jesszhan0024@gmail.com,m:gaurav.kohli@oss.qualcomm.com,m:dan.carpenter@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 8E7604CBA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index b51a8f173e1c89e75be2f999ff96fb63247accfc..5f66c058555ea12d7c3a12c471aa02764be160ac 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4968,12 +4969,25 @@ gpu-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
+				gpu_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		q6-hvx-thermal {

-- 
2.51.0

