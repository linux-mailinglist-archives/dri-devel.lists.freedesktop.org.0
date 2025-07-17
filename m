Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80382B097C4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 01:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B46910E8BD;
	Thu, 17 Jul 2025 23:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJ6yAY0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3241C10E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HFPxKL016003
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wWByVXuqTAYkmR6e95nPijhHkyi6G8c8w9KcZupqunI=; b=hJ6yAY0O14NAP0SA
 OD7RIk1xgMFCFV0Waxc6glqINKfqNrshKx7X0m+j1IhGZTgu4SKIcyaO88U3fK93
 N/RKgxJxcUmMYorqd+tANjfAmIXX2xtm3ZsKQ4OGannWCaKJIFYdvWfJbaRlo4XE
 3hGm948gTzjskqC0wBuUGVM432JOTHdn510OiakPXvjx5QkFPic9x1vCooGbZUQ7
 f6/1yaSjf24JUbcCnCXhx0yq9e+s2KCzPX+ViaqgfGrJLEyP/8erLk3wZn5xF/R0
 KKRazVs+JRI6XJEmg2toHA2p/Lk/xI+DYUvClM/8Ri8L5sG3TbDtvgmo3tj3Yl+0
 e6vusA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc19v3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-237e6963f70so22935105ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752794935; x=1753399735;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWByVXuqTAYkmR6e95nPijhHkyi6G8c8w9KcZupqunI=;
 b=FUlyfTAfGskR5vGJnyzH8vK+ZsRJcHFKbqqdxjpFV71aSV3TXE2lfyyqNEN4lquX4Z
 PFAbARkSyar/Vmpl+7yvah2YMTZe2C6wwMsWTLcaooCb3yzAqFHmis56xBLClwFOm5Tq
 enspgiLnnEqYUx5A7dcuyUGNjBOSHSgrrpO+d2SoeQOVC3neaxLdJ36No/hORH2ccHwi
 /XaAvvmnm9RHLVNaq/aMH3ngCeshYFdru0jqQvk0zNJdEgifekSvGqvARFY5QKBprR54
 H0JW5b/DnB6NehaHSArXyCeKhembkdU3jcW/dOYa2PnsDXWRNcdjhcgWDCF0ScFmlKSu
 7y1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyK86x0dB8bBC2Wp2tUmwx+wZA98MXdWu1SEdTSbY/7i29ILOQHPw4hBbfMAOoQYwMKS3KH8w2/Ec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy41SRtRAqqZyapQ86/eApCXFQqru18teU0/UIMHDy9tawmhVY5
 S4vRALqdTFfcQETo8E3usefGmG4J+5pzH6ERx/1J53yekF21PcN3rkcsTM9jMgggESZExu9Rv42
 TdkcGWW/bZRhcvR7wLWYDONjsO+YwVuAhy9FNjogUNb3cwnzrnr6o1eUJP6GL0fDDGlAAuvw=
X-Gm-Gg: ASbGnctvNPQZwYnltlvKQcoy9V2sUkPypKSuv58YHv83dJ56ap4L6vqvTDMMURGIXyg
 OIwRLLsghAX/6FMi1t3HA7jvkW/G2MhPiRt99yn8DvqBGSeZaxVhPYmOAThNTdY+l2bJD57x9eh
 Gr2ulqM8XycEK3QYhdwXwygcWlZ5Q3KKbz1y8yJcxxuiQSs8UN+lFuPd/0dm9fVl0zLVyuiIMcY
 MJTAN0/0l4l+KFKN2YfvtUWy7L/0ideT0AF373xjtxvWC/tBuWPQOQtMkbKsWpMgV0a6JOzqoK9
 3KTyduoG33NrBxo4M79G9rWgtkhHOGbtcloXfw0UMAD1iG5wpDwTXMOn2/l/FEUXQbAfIoQJAtb
 wpM4UmzJRHRLk5anoSInh7kL+
X-Received: by 2002:a17:903:288:b0:235:ed01:18cd with SMTP id
 d9443c01a7336-23e3035f782mr80881305ad.44.1752794934712; 
 Thu, 17 Jul 2025 16:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy7EY+GZlHPcNHVs1AkXZZ2eIbMpFdFBa4h83G1a5pVhnBvbRDWLwMJEYWXJSA5sRyT8Jqsg==
X-Received: by 2002:a17:903:288:b0:235:ed01:18cd with SMTP id
 d9443c01a7336-23e3035f782mr80880715ad.44.1752794934261; 
 Thu, 17 Jul 2025 16:28:54 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e3cb7sm2002195ad.17.2025.07.17.16.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 16:28:53 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:28:44 -0700
Subject: [PATCH v3 2/5] dt-bindings: clock: Add SC7280 DISPCC DP pixel 1
 clock binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-dp_mst_bindings-v3-2-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752794927; l=911;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=sZ2y2IyaYhBO6AuOxdT0mFWtWBLRRO6rCaMc6lj8Ipw=;
 b=JIQEhhSfOyDoyV7zPgQsd3A3ppzobltB2q4r0El3ARcu9XmGhKVnrWAmOUE30VXrx8yJGe0zd
 e/IkHZCE9atCpqRREuhMprBnDp3dtKBR9yS3h9V0DD0pruyJh5ZbmIW
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=68798737 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HZRYMJrZkReahVkyUwcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: o73KY8SPTtO2ILgzwEbkso5atj_Erl9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDIwNiBTYWx0ZWRfX4wX98/o3ry0w
 X7zEAQBRRn7HnOkmh/QhFKr/cg4LxCROuwUoxjx+imR21jRbz0XJpDIsa4Ug0q7UDOVTy7szkMI
 075vL1t+z1x3mhCwNiGpU+h2VCqz9KlZ7r0IBKJ+rcFGTZhxAAzVlw6nzTylsqtvQpacstmmcE/
 d0FKaFH0owfjYhyeuesI4sKdOaAf62VXbPfAOuniWnuq2bTGcVu3Y1lA0envcbpRFgR6Tt+Xtwh
 lNJLOvDkTyhLyQTljzvy7Ftz5i1UceOqMg6JpHzMm62YXuKQglJKfYBrS95MmB5u/OfU1zmHR4P
 04YWNVFcDTc9voXGD42dUarexRajqs4OfRGx7jyzx5GPD0zaG90XPqXZwy9ZBVYE4O9lZM90W4k
 DGouO/UX0zLuzxWjI7wIZbhqbII5QXO710GEudSnYlkGtbhz9HjyMvPY5C4PnAFS2P41cR3m
X-Proofpoint-GUID: o73KY8SPTtO2ILgzwEbkso5atj_Erl9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=954 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170206
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add DISP_CC_MDSS_DP_PIXEL1_* macros for SC7280

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
index a4a692c20acf..25f736629593 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
@@ -48,6 +48,8 @@
 #define DISP_CC_MDSS_VSYNC_CLK_SRC			38
 #define DISP_CC_SLEEP_CLK				39
 #define DISP_CC_XO_CLK					40
+#define DISP_CC_MDSS_DP_PIXEL1_CLK                      41
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC                  42
 
 /* DISP_CC power domains */
 #define DISP_CC_MDSS_CORE_GDSC				0

-- 
2.50.1

