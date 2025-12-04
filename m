Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D278CA3CAA
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FF410E983;
	Thu,  4 Dec 2025 13:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqrXyyGq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZsJoumF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBC110E982
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:23:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4AF00D926281
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 13:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aTXEd8wP5LDpChD5fpPo8u1L1sTd9Z0jeas5ixGhjy8=; b=IqrXyyGqkxwzt4Ju
 N0ZndfMcfseKRzpl1K2/6RCNx6PIvF/J6kxfEahlF+yZUMDBgBPWgClFY54nPxkw
 Nr8QBBztYhsuZ62ETwcXMaM05Hzda7uj3gUAk/X5HHhyB5K2BH6w8p5m9STU5oKk
 bNtXWuuoztKgj/N9P9syemKiTxqoi1RKKb3CKSSiDoK4fY+lvStrJyJ9Rr1IsCoX
 MGBaw8WCwW1d4WSqIdqgT0TuUgcJaCQ6eOA8r+oPemX6IgYeEapz+ExakTBz4tVC
 nepZJIK4cX5f9LwcfGWBPHVECu8D7OhHNHMmihzvRXkuE7qovCpt9kOId9Qpr2fF
 KFyM1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5m313qk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 13:23:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-34385d7c4a7so652070a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 05:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854583; x=1765459383;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aTXEd8wP5LDpChD5fpPo8u1L1sTd9Z0jeas5ixGhjy8=;
 b=PZsJoumFGELtgGKhI4P++316ue2hrir8N2Ci1FZSFiR0rX36tUh2v2h8nvMAemCSJN
 OwqJgOmcQdzCG6mMGYmiRa0hUTkSxBjopSWPE55N7yZjQ0vCoDkOHMD+gsiTzfQPzoHf
 dwXbXp7Y9UU2yji/wZOherJw7WcIHOI5xxp/kdaKSQHxkak7KTwa81+NrXL8g6A9+kuZ
 uTBrWzv78CdRuUy6xarthfJex0vISfh7bvk8JcltcPfxhVOl9yrFzUSsj9rk/k+5Gh8e
 fUjMlfnhyg5ixB14rmhpWUM3SD+krUkqRxWf+mk39RerW3s5jDy6bxb4QWc7yLrisdwO
 77HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854583; x=1765459383;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aTXEd8wP5LDpChD5fpPo8u1L1sTd9Z0jeas5ixGhjy8=;
 b=droOP6/1S+Dck+gAzR20jGdmjpnEQx4RaGFxjSa2017cu5fFbrF76+YF33cE3IV27s
 VoCYvDf+1K9sy13F5JkaCNdnRvne+qw61EZAlj3m/s8Nl7s6hq566Fqsu4LkPDmc3MgA
 CVeSfmjARu4nlxwRY1p2oDUTYSGZz9U0u5jK0Iz0us4ukuqHFWtgAVzrpFiRS+gR4cAX
 XhKg/sqWp9mFzhj29PGQehwb/DtWdWGxR6qIe1bMOj37OlhqniY8jVwpM2AXXqwBEOKR
 ZU0hnnF6tfgMY8qj2mQVfAh0gHx7n7Bni1oQx3vURF1a2qTujSfK2pgq2TVx14H7IbU7
 /p0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzSo1DPfEoLLQGp6/SOf9WBgcbcLNFMV+Utqt+0Reqy1oSs1+96876yTo22Po1lbFOp9097qFFi+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuBeolgL78aCkho8SNQj8ehHuRiwaD0ODaG7KJpiDZAsVBC446
 coeCoAEqsnq+K2X/LXkK+jYXz8t+zcI8+hkADZZhF1T4mQUh5+cVidKdPF36KvUJq/H3W0KWlfO
 wE1f2s61MDNBwQtvMRGWdx+NOS2XX8tyeo+Cp/SvMB7djomv13t8aVMI8DuoDhNNt96a8/5w=
X-Gm-Gg: ASbGncsqV4EHcgnNzjmrPBLT0+RYIBnE1WNMgoClcaDpjqRGLDrVoAE4Cew9eI2qA9A
 Zx0BzOgNkwYXvrasU/ZvznEtdsfxqxBymhfpf6/k0j7k5I3BfMsnVf5WT4EyistUDjyoQaeTcBT
 B/Vtdtb8DwPzsd4y6H0Ks1zaRM/sgPg8uJJx+gVqKFjXArhIhxNfrZTp0wMoOKCKkEePqoqcqiG
 7tk8QO+ZrV/k0rnQzI2Pzrk6+sVQHJoCLUX4UkhMw50ywCvGajxePR8H2jScFQWaFNLiwpttFS+
 f8SZlYXP9oJZ1K90nZcGw8W+aQmH9ghqMkilSMhZBE2gyyiy/hK4txD4+JEiPoPv679WJ7s1Rqv
 BiV3c/biVtbfkxpdMQjtbl8jXbXxC9Eg+GA==
X-Received: by 2002:a17:90b:4b8e:b0:32e:3592:581a with SMTP id
 98e67ed59e1d1-349438bdb29mr3230121a91.17.1764854583358; 
 Thu, 04 Dec 2025 05:23:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn4JZgnbcDINjtOA7+dnAJ8EBm0g3g2oNvPSaAR4vbKS8svkkxZZyc6KCVwyRlizMUdZaVMA==
X-Received: by 2002:a17:90b:4b8e:b0:32e:3592:581a with SMTP id
 98e67ed59e1d1-349438bdb29mr3230093a91.17.1764854582867; 
 Thu, 04 Dec 2025 05:23:02 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:23:02 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:59 +0530
Subject: [PATCH v4 7/8] arm64: dts: qcom: talos: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251204-qcs615-spin-2-v4-7-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=1441;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IH4I7WgYz+SJJ76MCxNVByrZLxMvwBXKq41j5sQdwN4=;
 b=d27ZngPAgX4XvtvRb01eTZZlP1aPV4sfV6opmYoqiirXrpN2hXPSTpqcGHopZAK/DSlAOuSWJ
 e3FMup4mnZUDI4x8bpQUOsw5I8blQeGBrzOxvSB3fhjkr2wsSnStFQi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: SN3Mc6_qxH3LKqnT0LZ2M5lsFcsEy0G2
X-Proofpoint-ORIG-GUID: SN3Mc6_qxH3LKqnT0LZ2M5lsFcsEy0G2
X-Authority-Analysis: v=2.4 cv=esHSD4pX c=1 sm=1 tr=0 ts=69318b38 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX6smaKgr+PWAa
 n0BSEpI6dsBjFUgmUBmdD+HbY+tgzGrOZMI3I+A3SzhtsBqGOnm3tYu310sz7zL038HTkbeKp8g
 MylkqwmJOrTS7VjU282Kmy2ZcMxsxsuzn9QHx1YIddu+5mJYBkXXpwaJNL2ImYi/WGIuw+BGdtk
 KVA0J1bb9LGfpz4JC9aLMgCBGU5Z2CNrkGxzPCnLODSIGrI1IbMH6Zj+08uQGm+qVdyvfvHU3wh
 6Q5RLbbrXfrqgf4QtaRpmsheSS2ujUtRrKc6VyrG4LR4eQe0S5vC46QjH+NR4yMzvEV70C5sNAK
 FncGqe7VJ4tqJf6vIq4fzAOId/c3+2rIcUnR1a7PSkI3voosfyDzyq5fOhCtebfgxdCkU0aRpmZ
 28KfjgmcJVI6rJREn8KVYDwcaT7EjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040108
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

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index effaff88df83d5e6a0aab45a2732a00cae11e83e..7c2866122f9a13b8572fd9e6fa9d336176765000 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4844,12 +4845,25 @@ gpu-thermal {
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

