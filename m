Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7223FAC9502
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 19:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2901C10E84F;
	Fri, 30 May 2025 17:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpWsG+t3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2974410E84F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:47:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBLtAD006927
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=B+2KkEfWLodMGyIjftnj/+
 LVncTbtgVzzVqk00GViSE=; b=mpWsG+t3plv5e6+19mI7H1/k9Xc2PbY3Srvl80
 D5zBneLrIWg0mnVpuUI8G4tf0+fyNEHsnMfY7WCElXGVHSQa1nG4/d+g7nqbI1ox
 CjUb4JN8+XQHmKJqVYNTSXFcmFnwBHOmLh3vvDEZmffrsbUR9M0VUtt2axHK9FK9
 mti9+nRt3jDtJXxXgwueMG8obGlA91fe/dpbrqram7qw9Hf7C5lRVSn99cKAjR8Z
 68WrbUQYL7ZFIPEd8dcdRU5WZtwAZ66pGDRdyZMNajqdsDddAo7dcgghHMnqwyJP
 tR58ycXdv0YICv8dfMgLyRrmO7RZSDjhrQAjoc1y899xcv3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqj5f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:47:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-311fa374c2fso3027912a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 10:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748627263; x=1749232063;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B+2KkEfWLodMGyIjftnj/+LVncTbtgVzzVqk00GViSE=;
 b=wtphg5iaiFFnl4SubgAMv3DGnhBm5//di+nUWsDTHPCWUeuNAlRgBmC/d8boVrsp3X
 lCcXSvanG9pJH1y68fsyONaghRdpgqkzAQF9jCue/917HwzEf6t19tLj4MCqiQhK2iAs
 bqFH/EVYbZUcWRZJOM4Cs6shDlsbn3dhSXZwdH6R/kmLbe1Xu6vAlQvOgQOocmbAGHnO
 te2sKFnVFrIf80NQX2LVKBmwtqlV8ILqewumiQEsiZndK3FUeai9Pm8XdYKGzFQvd/Ys
 o0l5z6WO9xUHOpoedJ0xieCvEeTx/fYhBVkc3ksSDUvQiNZdLv670SrtVH1S5CHWBCmy
 g7vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjDp8sL8XwGs0j/1Qw/8ElTJHs1wRqTwWCxHkVfZv/LxxyH6YCjC8rNKyAOERCu0hNr7FZjFbRqCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyASBIcNl3GT84TZbjDfCWSqLDJiRNE/uddediLZW8abGn4LwNB
 5BDE0Nl/d0DirLVmzt8wOejtFvMmF6hPeuWvpbXY95+8TnI/u7OGF+CFNFFyOMlgIM3GIqJNNXT
 CGLUJucHM8wdU5yprpwbzAjLMgjGwMIeA6laKWyxnezsuz7oPuACGMkeglSKQrR2nA50YVFg=
X-Gm-Gg: ASbGncteUrV+2qI7GtQKjO8cx40XwzjOC3cmu0v09qvTBi8iKiN6DmWHWreaOwNwsYn
 ubyYdG7QUTjxKJm6YmCwuGihV91ZUaPyve9XiMZsg5wwfYKJ6fnFXgB1O74eSTLZ7kzHfAbH0CR
 pxA57LVfB6Ej8ugm5suLoZtiS14/0eqGAcVLK3T0YLLji6I2Pe7lkJK1752Vnz8Oe/LKzkTrtSb
 3qseyAhmTEtMNpMKwnF5cU6oGuBzQ0jH6Atze8Ls8grsCwRNRBleTqnhuyo1x73V5povtkeZirj
 vUWiDsPETwWD6lOm9HCkqtV0n0BErIwQbsYdS/h/BN7b1M5eFqiIH61hn1xDmgN6X+DIqMp3
X-Received: by 2002:a17:90b:4a08:b0:312:db8:dbdc with SMTP id
 98e67ed59e1d1-31241528e77mr6199243a91.20.1748627262849; 
 Fri, 30 May 2025 10:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIPUUx78SralXxw5BzFba2DK55mhWLzeD99fXJp8xlfnHba499BNeIUSlq76/cXvpfZXgfQg==
X-Received: by 2002:a17:90b:4a08:b0:312:db8:dbdc with SMTP id
 98e67ed59e1d1-31241528e77mr6199174a91.20.1748627262304; 
 Fri, 30 May 2025 10:47:42 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 10:47:41 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/5] dt-bindings: msm/dp: add support for pixel clock to
 driver another stream
Date: Fri, 30 May 2025 10:47:23 -0700
Message-Id: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACvvOWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDIKGbUhCfW1wSn5SZl5KZl16sa25qbJaWlmyZmGqUpgTUVVCUmpZZATY
 xOra2FgDlnKS/YQAAAA==
X-Change-ID: 20241202-dp_mst_bindings-7536ffc9ae2f
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=2624;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=6uc2UGeYDKojb28VLnUtXsaqjBTpOdr4JI5m+IvoZFs=;
 b=B4JARvTLryhXsb9dR+6G59wuZvScg2Y7mSDEApXdzmOtc2rUFkH0me1aDfAEfkCSfEPjF2sfe
 TCooErK5xB4Bc/Yi3hAq/l+BrCIKAkTYbHRNCwluTVfQot2e0Z9hwj7
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: 9bFUyNYLoBVHPqHpyG13I7WTN9W9qCqw
X-Proofpoint-ORIG-GUID: 9bFUyNYLoBVHPqHpyG13I7WTN9W9qCqw
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6839ef40 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BHNpFwMvo4D9IzoZi8gA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfX5ayl5sDnxfeb
 6uF7B2AQgPoIS3p29M3C73clsTnTEvqVlSIgY3TcJe/8rxR7kqSmr9ggvF1r4x8PODUXk9FXeNY
 TP4gySnqqN7FGRQvxIO6K7tzVOMLlzTiVtsJwpsTGID5aExdZL7/Mxoi27hPDFO8JpSrgjOt4Eq
 4JgLWnzDCd226xYqttDfGS5zdjJDHCPHMkZWhyusNGQKogsDWBFM6FLnTmyj+rIGw7UxnL60Ah9
 hpCNtdRQ3bDYg+BxkdDD+QwqRUsLlcA5maz4q24KBz+cztUwwOKNeX8fXItufCGsF7Tpfls9TMW
 VotOCUKHzAqQVU8wkHqrWAYmdGODfQ9LsJmcJ5EcyFHIkaladPAZ6lIoYaWDNVRiNadKkwqc+j5
 YhTbKhSpYR1Ayv2ot6MA/upZCNdMJ5k7EfTeSYG8pqgYm3iDLKT773m3lZo9PJ86/xqy0RV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=966
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300156
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

On some MSM chipsets, the display port controller is capable of supporting
two streams. To drive the second stream, the pixel clock for the
corresponding stream needs to be enabled. In order to add the bindings for
the pixel clock for the second stream, fixup the documentation of some of
the bindings to clarify exactly which stream they correspond to, then add
the new bindings and make corresponding changes to the relevant device
trees.

---
Changes in v2:
- Rebased on top of next-20250523
- Dropped merged maintainer patch
- Remove assigned-clock-parents from sm7150-mdss.yaml
- Added a patch to make the corresponding dts change to add pixel 1
  stream
- Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
- Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
- Updated dp-controller.yaml to include all chipsets that support stream
  1 pixel clock (Krzysztof)
- Added missing minItems and if statement (Krzysztof)

---
Abhinav Kumar (4):
      dt-bindings: Fixup x1e80100 to add DP MST support
      dt-bindings: clock: Add SC7280 DISPCC DP pixel 1 clock binding
      dt-bindings: display/msm: drop assigned-clock-parents for dp controller
      dt-bindings: display/msm: add stream 1 pixel clock binding

Jessica Zhang (1):
      arm64: dts: qcom: Add pixel 1 stream for displayport

 .../bindings/display/msm/dp-controller.yaml        | 45 +++++++++++---
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 10 +--
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 11 ++--
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  1 -
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     | 11 ++--
 .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  2 -
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 18 +++---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 26 +++++---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 ++++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++++++-------
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 31 +++++++---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  2 +
 16 files changed, 197 insertions(+), 92 deletions(-)
---
base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
change-id: 20241202-dp_mst_bindings-7536ffc9ae2f

Best regards,
-- 
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

