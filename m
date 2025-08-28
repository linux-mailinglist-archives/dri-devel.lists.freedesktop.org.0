Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C53B3ADC2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 00:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452DA10EAF8;
	Thu, 28 Aug 2025 22:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUIvoBJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7080A10EAFC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:34 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWdZT025049
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H010azYPB1dFkM9rbItrhry3MhtWqv6s9ueklIrUJck=; b=ZUIvoBJeZOkTjVNH
 BdeTWwQw9MJE3eS5Jb/1mmcRhaoxvmP00w7dfH9PDXurrZ/tu7xLqojnOK4Gh1xQ
 Q32U/ZTQUKNCQJw0xd6PrdN2viv7TKIRYKCLhL5UNctyYdJwjfltVX/l1Kim+4LJ
 GEL9oMXpJrWnFLGQUBRMM9fDA1noWep8HiFybFn49bDA6yz5JJTM+uvW8R0Ohy/T
 SYzcFXnkBKZ3R8DatrEYM9xuy6TjC4bz/Jf5swKiv7j9cfSJPkNhynTK/u+SslQb
 408NSYDWRCUOYHmd0Ll/XNTK6thnwRpbtw/h2i+HgAkgHr65L9+HCugGeXyVMLEC
 AeAWig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615sy9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b10990a1f0so33690271cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421312; x=1757026112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H010azYPB1dFkM9rbItrhry3MhtWqv6s9ueklIrUJck=;
 b=k39njq1k5LCAV7r+fMPJfhjCWEd+AmFHWIvOgeZO6JF1GZCcEwGYxpgN3aMTxsSczj
 pSAdng93RaK+ZoBY2UVfx3j1kpPlQUElKkpn4f45cAFT9uyO4h2LYwAmmOvMaxKo7l7t
 966vRFP2OuzahgiZOnis95XcYNnO01DflsOGwUGZ7SaA6BnJz+/Ds71Py+AjYDXHkbTF
 cU+GPL3PaJO+3m4GOBs/i9Tnz3+k/rXowBb11XOeS75yCvkJ77pFM4fpbH9TFBzGth4Y
 DN23GMzQY1SuXS0ZV/B1fnscUTixsA6AXuEuQRy/6RjdnleFBcun3nGYcM9is6pXguLs
 Xz1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvaBEKzsR60KK5MstDbdd8DUQhLOTjW9ttgFCpDNuh8G1eRb9bdy9aGUspLWYElL+VKdl0rYjIccM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5QkSGDc1PqI2Gj5h81sndKC1zJm761UOC5ujEIPuk4OQPp5B+
 NR7NKisnZco6yA1W638KnekhCrs0GSGBLh2czBQHaJ6SNpK8UqW4ZZ9SMzT7OoSWO+hRxMFnYp3
 6lpiTUb3xJX8pBnyvDKjjEvjZ6D5L4lwt2Rh//KKu4lAxL/eEHRyi5ulykzcJJmWNLeBG7v1ftu
 RbDec=
X-Gm-Gg: ASbGnctAjdhhpQlZ3Koc3tAiAzD6nC/OTrFA5TWLmXbgwu9kebmNV5m2T0xQx7eA+l1
 O6xSoHsgX7GXXYecPpUd/cEf4WLSJ41EK3BiiTTCmQu0JYnknATOX0CbCtBDEYpIZNMgAMr+5Mk
 8/8U1++xINcuIEHs/mkca2SfkURVdYSVG5v+zwRSfNlsUHWJywYap5DgJYyhX67xiikxDfHVwDV
 tK3fXDMwq4mTRQinf17LFEnSBBHhBQCuJg8H+M75DDzVAo2g/qT8J2tpw/TyiT05HrwCwjRJ2IG
 bpaj+e/EVmx4vktcDnucLazkYGXUPbdprWHp0o+FjlVPW8jiD4C1SflEhO7anKC4BMVZAWBIF1U
 gPp5VcXM7P7DcFyhOTvChO1HxJq3OdC2lsEYaiSZJnBHFNY1QwKm8
X-Received: by 2002:a05:622a:2588:b0:4b1:dd3:e399 with SMTP id
 d75a77b69052e-4b2aab5676dmr361928411cf.64.1756421312209; 
 Thu, 28 Aug 2025 15:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOO/erwDQbpF4Fb6KhxbS74zgMW6cQ9wfbbmzdHGrqUotbO/43B6vA9aYP5MQ8v61W+56RbA==
X-Received: by 2002:a05:622a:2588:b0:4b1:dd3:e399 with SMTP id
 d75a77b69052e-4b2aab5676dmr361928031cf.64.1756421311744; 
 Thu, 28 Aug 2025 15:48:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:19 +0300
Subject: [PATCH v7 6/9] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-6-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jRBkyHcr8xMj4BTwupyA6gCqxajStjyC+O9UZ5EGgLs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNyxSi2897UPGWZ7+tGFFt87eM4WwDieX+9/d
 AYmK0GVlNWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsQAKCRCLPIo+Aiko
 1cSSCACsQRdfjhH0Jaax+CrEha+9shhAT5RQvLhMX95pUZ2Y2o6Vhih/OvqKcCenfLYKTXOZ18F
 8oY6sJAu4UYge3f03Kp5+9J1rYLDRMfPiAsX+Po13rnS+sAflMR7Y9gGqZ7Q4eI5tG6XKUHxNcS
 ymj68EImGXDPxcj+tqACxj6MiRGFibqMCTea1hCoQIiYmjxpvAtPFAQHmc0BV79nQ9sviNijwMr
 6Yf8DfJeLIJpSNGrMnjQ0CPeEddn0VY+IaYoHzvmlcDXurmZzewpgykeUumiVfC3+/Z0rks4u7T
 y6UUq5jCI4/Umr0mY9xDWIymYe0VQaHgtrTltxNUWtTl44Gd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfXxL67QGPKWK01
 WYj3Ejf0rP9XEeThoQOoX7Ntrfs0Ri0f9mvz3won8MvG0JyKUCYNMoqdJsGpRZmIxfzHYAoisTs
 iS/2MLBxaLUyeKEerCM9rZ3MFhjEjAhrkJVTgzuoeTIp/6ivaYy5D+ms+oAfGiXaR+7sSsYU+8r
 cmV7sRHWpyPUVxk2/88g8NiAc918LT9biZyZyH3fzgAEopynlQNpZ6jU2uoshlr7cxB6rwzw9C5
 vjQGMc0gyIT7e8fGnZpVyrNJwwI4/uvXUaxLwwjQApb1VRKPz7i8xaErPtJ2sfYZqipe69lyNCY
 AWIq/AeM69HzaU1YDrCj9UkEuOD+zRm2bDrm5mC97vpGFxPAIN1AScxfG6Nz6FsOcsv8peBHLF9
 gEr3I6S+
X-Proofpoint-GUID: JWxKXeS_P7eWI95thTwGeoz2jTKrKge4
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b0dcc1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VjVaSBsDX57WhQYIrYsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JWxKXeS_P7eWI95thTwGeoz2jTKrKge4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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

DP controller schema documents assigned-clocks and
assigned-clock-parents. However these assignments should not be a part
of the ABI: there are no actual requirements on the order of the
assignments, MST cases require different number of clocks to be
assigned, etc.

Instead of fixing up the documentation, drop the assigned-clock-parents
and assigned-clocks from the bindings. The generic clock/clock.yaml
already covers these properties.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 6316c929fd66588b83d3abaf01d83a6b49b35e80..afe01332d66c3c2e6e5848ce3d864079ce71f3cd 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -86,16 +86,6 @@ properties:
       - const: ctrl_link_iface
       - const: stream_pixel
 
-  assigned-clocks:
-    items:
-      - description: link clock source
-      - description: pixel clock source
-
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 

-- 
2.47.2

