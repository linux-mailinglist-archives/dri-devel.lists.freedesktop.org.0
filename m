Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510ABAE1456
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B558810EB13;
	Fri, 20 Jun 2025 06:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vkjrk8oZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB3D10EB21
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:55:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JGqNWs002594
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dE+rpElHU4skARhx/mUuXyFZobFHD8PzZckvgCz0Wyg=; b=Vkjrk8oZKMq2xXIl
 mNC6vNs074IW/Y5LUKAZcX+EeITRGSzjKAi8JHm8JOX+iEh9tCNmfBPZrhWCX2Vl
 dJH13mhNgoewXPBWcWGiRzj7DkbvetfSwZ8RSpJ6OrCoOFE+WqIl9ropVyc6l9m3
 WkA7CPk60wYuVzFOOWF3qCBsYOvlEY6Q8Ydypt4lp+bcSb7mfUhypk5SNl0yxNhb
 ElX6TTu2wXtFGlIgKge8a7eAOoVC73FZzQgE0xIt+h6e/7QOu0gPJxy+Yp3yOhNN
 YBpwCSi4nVG/DYWmN6NJ/STY89laFZp0a7HtTXfy/J7qF7ykkyiVw0mo08txwsmg
 2fp1Ww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag23ea73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:55:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2354ba59eb6so24133425ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 23:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750402501; x=1751007301;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dE+rpElHU4skARhx/mUuXyFZobFHD8PzZckvgCz0Wyg=;
 b=o1JXl25/NB9Js/3poEAU6Y8MJ1sFkH5RdpG4sKZYuSnoE6LGNhLS0beaKiki3f/PR6
 LUNqmz2N/aCRaHkyXj5wrLDN6Wxprr1GTq/zGR+UVDWlrplC2dd6WC20oXPTzHopu8cd
 DPP6ayYfa92hkPbipuywiEzIZd+jmJgtAYc8fenZJp1i+oGSJl1ZJnbxe4UZhY2b9nhn
 1WT5J8810IIcmwqfybu/XR81mRExeI0LgJg/RUS5ssU6CVbipY9TTF1wH/8kkFAGvFgI
 XDi6slm80VqI3eGuXJr0COJpeGbBlRld0GNB4u+dRC1nw3Me1CyTY6PTZCGSZV7PqfjE
 +2yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmJIgSTqxht1N+dOGIPm4PQvXuKTF28seXsxe/s21U0A1pjuz4+paO/g82U/UWEpr+e4TcKR4BFHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs5BrYJ1aoOQra+/Kb50CrTjB6E2vNqeUMS8Hi3z1Vx8vPQeuk
 Ip5Wjtf9wQiUjvHf6qjoNQ1Krw4XN9CFskJ+NcYbufeg+46L1+Zr5ID+Gxu+8tu6+pJkr7nSipB
 EiDhc8s6hNhF4Ybf0h9ZjujtDB2QNc4V/aioD2fP8QXNpL/211bpIFvLDY+7LRqWCXDe3kjo=
X-Gm-Gg: ASbGncsqfNd7CKlcNsFa9pr0ZGpCim5ElH84lk9QD9PXLAX8a5jYo6uPY7KJowNGD44
 qOhrpnjBltZUfFWAkyTApAeiprZYwnHAmFq/kEuP2aKqY5l5Jsg4YvVm/sQFrjXybmysZYP+IlO
 ZMC2+qxLfLMu9fQ+cI/pDsOeysUlDw+r/TD/vhhBVIPhUN1S7Aj0BI/CGcOM5holm+qQFNiaJwK
 UJNrkarnIQ2SqpeYRM3bTsh8B3EMZQ8nC46kz7WXm4hOS0pFZitxvxNWd5Wi6wiNF0tNR3fC5H/
 vTFl8+AvyUAGyBJQIVJcOGwQEhwx4icU
X-Received: by 2002:a17:902:d58d:b0:235:f18f:2911 with SMTP id
 d9443c01a7336-237d980c6a1mr28550025ad.2.1750402500668; 
 Thu, 19 Jun 2025 23:55:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMDsCNHSiBKMs1kY/KjnuipJmlII9kCnPO7IFtdMURRQwxNK64L+TG4Mrupen8/n1We9Zr/g==
X-Received: by 2002:a17:902:d58d:b0:235:f18f:2911 with SMTP id
 d9443c01a7336-237d980c6a1mr28549725ad.2.1750402500248; 
 Thu, 19 Jun 2025 23:55:00 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 23:54:59 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 12:24:28 +0530
Subject: [PATCH v3 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-x1p-adreno-v3-1-56398c078c15@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=1734;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Jtd3nbg/Ox1IZzmZs1FmDMcvo0C/VyluJ+Ezh9idyY8=;
 b=LjU0vVC1hUPqnFgJGxkwdrUm7NneephzJaIH4RMyAS1VSeQdKXhhIleM945Mr6+vbjpelI5WK
 afkcNVHNlA6Cvp8JSahtciGIKbP5f9LD41HiTH9T3/d5UKd14jd0GvC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: ZMDoBxfre_xUpTFFMALNR897lCqtrvBM
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=685505df cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=PEQATVZ-5NWm0mRdv2wA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MSBTYWx0ZWRfXyyavrUdTEe9b
 114dXr3mbl4ESJv5dJzFXgPSkn6lcsTVYyM41q/4znJv7HmAvjP7Af6L6MnL/2vw7BOlTzfzVN2
 NC0L63TgxxphaX75lY7U/yRfueRlCaQlGEh7Lepg5NBfCrs4oJGvfZZrzEt+9E96gJVrzSkKiWQ
 gJrgHg4H9hYnVHnDmz/uJDCnlsNPNMMG4Vgo+8jjaiBcdtWGHjz8I+eRN2oY+U9noUJqFCInp3n
 A+eIMzPs1OMNvA7zbOkZsk54Ma+JHD7Iy30evNexsrKDeGR4FHaQzC8EbkNC3RMPvcB2dlVTZXA
 b9kGriKF97zh1PxNF2Cfe4UcSnKVrRzLta0oifzWIsHJdBT07VsEpctOjVI1xIrbIPlc92oR6bT
 PfjdpeWtbQREDLG+Hs6/Dca/SYeF0r/KWNWxe3WaXm4KAoGLiJ8Jt3Vdcjb/gQyqUms5WoTI
X-Proofpoint-GUID: ZMDoBxfre_xUpTFFMALNR897lCqtrvBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200051
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

In some cases, an OPP may have multiple varients to describe the
differences in the resources between SKUs. As an example, we may
want to vote different peak bandwidths in different SKUs for the
same frequency and the OPP node names can have an additional
integer suffix to denote this difference like below:

 opp-666000000-0 {
         opp-hz = /bits/ 64 <666000000>;
         opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
         opp-peak-kBps = <8171875>;
         qcom,opp-acd-level = <0xa82d5ffd>;
         opp-supported-hw = <0xf>;
 };

 /* Only applicable for SKUs which has 666Mhz as Fmax */
 opp-666000000-1 {
         opp-hz = /bits/ 64 <666000000>;
         opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
         opp-peak-kBps = <16500000>;
         qcom,opp-acd-level = <0xa82d5ffd>;
         opp-supported-hw = <0x10>;
 };

Update the regex to allow this usecase.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
index a27ba7b663d456f964628a91a661b51a684de1be..0bd7d6b69755f5f53a045ba7b5e1d08030d980e6 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
@@ -23,7 +23,7 @@ properties:
       const: operating-points-v2-adreno
 
 patternProperties:
-  '^opp-[0-9]+$':
+  '^opp(-[0-9]+){1,2}$':
     type: object
     additionalProperties: false
 

-- 
2.48.1

