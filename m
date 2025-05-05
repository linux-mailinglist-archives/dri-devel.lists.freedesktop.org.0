Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BAEAA8A1B
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 02:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FB510E14E;
	Mon,  5 May 2025 00:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqQr7IVh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C7B10E14C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 00:15:01 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544KljXc031774
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 00:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 70R5N83II2gknlMbdIhEMERE7CMg2dERyKgyccEkyWU=; b=iqQr7IVhBWyGuD89
 Kc7IIiWFNIJyjp2lJ2lUfGhfrSq0c7ps7d15ZlvSUuLYl0KDAaxfNKyp1ZsEEoLJ
 hPqkAMmlKiUtEtDsRKDs6PMNix3VrTYBULTpdSx2vaY6PXhD5566ZJShGyhyhRq0
 vc6PnKQFyG/vlgVpKsnl+FrQkdY7F9Bwm6lR0/SAVlUY7sCPcHugCp71Jn4EF0Q0
 KORFcHAemuzQRNoJ3ps6oeG4cxWJEGbRU8OsGR5VyI035vkF7MJB+H4EDJHyeNsM
 W0VC5PACaPQEhZ8bdB39mHsD3rGS/3DeKRXt/CNbt2E3+AWGaXaY6WseR0UZ8Y+N
 Uip2RQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakjhh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:15:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c790dc38b4so697816885a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 17:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404100; x=1747008900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70R5N83II2gknlMbdIhEMERE7CMg2dERyKgyccEkyWU=;
 b=lo34E0BFtUmWVh4SzOm2oP5HNwmpoqt3B9c4R16WYmWMT3NFn1E3x74MqAl4anqiwr
 7a8vGAxplSGxJAsIxABeSKTk/gBsaJh3v3s3chD62yutT4hEa6iAN+D1lNqM9tXm8PO+
 DGNBhqduup7XnUKYKRKKpqXWwMlGgX+txJLouuVNt4ID/yKmGudBZ2JuHFArc6OvXYWJ
 Yw8vjWoY3SK5jbLxE7L5mfa2WbKPkXO9TW2vWK3DxOE9veR1Tlyhv1di/9fPMkdRfI1b
 x02QLZHvRnNHWjCAha17td6513V8OMIF6u4KzAEXllR7ekDC6SgyOqFh9wmyLv3VDENt
 eIMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzKJStwpp61wjY8s/X42AhBd3KJ4Pm5+c8qt2e7A42AiBFrl/JK9DkXPuZiwVG6nHWrZky4Zex3xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRwk4bhkNB4QzaG80AzZLZBftZs9PbNqplcO2q3XWQt9aQLfwr
 0AggOHF6l6Fy8xBEACJGQN7dYlL7QlKEdE/UuZNNWdeVCnySaJkad5PSZCd8uyoPATgFrqFY9Yu
 nTcDMVZ1zbeSrokY0ngn7QUkDPV0VlsZetKJT90Nxp678fUD2fvU/HJiY6vPLK1/+GOY=
X-Gm-Gg: ASbGncu/j0Ehinhe7A2nk+J5LNPHUywvd3zC8IlwtTIdFMqBI4If3q/l/rtAAwr6r81
 sr4kG+9ZbjrsuOno8D0ViQC6F9ZzgD/0o2Iz9waXOFFIsAPk09HzuidLX5L+usbWi6Oz8NIb2C6
 pJnhJuA1Ktfa9Ip4gzxbZv11fcaYvAIkUS4+hzh11nuEiyDEAkQuvXz3uMSty0Y2LOFdk+gNQQC
 U+Felzu9G1QxiLI/OUnEiJQW8exzriaqNDOCKgbQECJazehDfi03uX3EZcXy2ZJeKl4BdY387v7
 yCfVE4ySL/9M7dAoeyRs1J7WcQxNj4nVjtne2eXXTth8899XOcXiRMA81aZMCFdeNNq7MtMdVd+
 WAB2SWnW8ayfdJO8LPg+QCDZm
X-Received: by 2002:a05:620a:a4a:b0:7ca:d9e8:d737 with SMTP id
 af79cd13be357-7cad9e8d908mr1091029685a.22.1746404099966; 
 Sun, 04 May 2025 17:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRhCRNcvKG5ymjFE6pX4ZnRjXc7dZtbqrZKKdZ0iDjLTptYnzUJfbnAUIC3NcigRTH0B1TZg==
X-Received: by 2002:a05:620a:a4a:b0:7ca:d9e8:d737 with SMTP id
 af79cd13be357-7cad9e8d908mr1091027485a.22.1746404099646; 
 Sun, 04 May 2025 17:14:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:14:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:45 +0300
Subject: [PATCH v5 01/13] dt-bindings: display/msm/hdmi: drop obsolete
 GPIOs from schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-1-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gcOjyAZkXuR3SrOQQtUEYQYbb60rDFhov+Xy2NtQ5t4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL7tA9sxa/DweHnrlNpCUZI8ErVU6X39GuyJ
 8xVcAVW1ceJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1ccPCACgPWq8rM5hryfozxB2ZWetX4xJ24yyrKuD89yYi6VrlRNmyhCy5tuIwVtGlxtPWIPNhQB
 dTWXqSpX1rjDTAELM4B4E59M4ZOn5EMf4QASI7RjO1QxJgvB/oh0RISwTAD41x/DhwsAZW9SYsT
 7HujJL66j41R4uEvXSC//FCkBhJX3lq7m4V2hohlH9NDv7XrBFEGThI0sEM+nzA31Baya9aD1ML
 YEeMypT4BBlpR9/viELikD8eDcvX9mdZ6jxJ4Rq17H/+xAqxGakHWKGUSD1ELIUKf59jy05URF0
 TWRcURDtUuVLJJwIk4b1XLXof83szgUS9+yy+Nf+hHiy1l8o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX3wANi7ILarzL
 wzwNt6l2J0/k3APKkNQYsV2HArbvEfuF4XZSsGmJUuDfD4SuyOpE4EJa0r82tthHha+oCQZZuYO
 PvYBoa29cDRLsjgyUG5oBnvsLBUZIuzAhXTGgGC7kxuUus/RDDr74A5g72RWaJByCyf/mce1Z7x
 h/82wn18nlMR0pOf8Y624hqv4EGNVBNKaz5iHBhL0VUdFpFRldCGlH5Pl2PRtkNwGoJUKw82SaX
 4feODqoOui3cJbjwfZKt/EmrTaBRriQYvHR0jBEzdyZSA6I0bk+osBZQKSWb+vjPJS/7v8OICB6
 yRoQJm96YxBZII3u7L1/yOKkxS0jf8qoG2oxGer4sAp8j5a/qF9J+zK9BCuWNj9xh/Pz2APKTZE
 oZciWdhlQ2j3e0sWNgFYS538761HvMeP3uNec3TVSteO7d1H3/PzrhDIxP0eKPbq6lXdxR08
X-Proofpoint-ORIG-GUID: 97TtFJzvfIRI9_MDPfXY0FANFtmSMLKq
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=68180305 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=Q0eG0X4qb_EmYOw2QsEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 97TtFJzvfIRI9_MDPfXY0FANFtmSMLKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050000
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The commit 68e674b13b17 ("drm/msm/hdmi: drop unused GPIO support")
dropped support for obsolete qcom,hdmi-tx-mux-* gpios. They were not
used by any of the upstream platforms. Drop them from the bindings too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index d4a2033afea8d4e4f83c9859f8840d30ae9d53f8..7e6f776a047a00851e3e1e27fec3dabeed5242fd 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -66,21 +66,6 @@ properties:
     maxItems: 1
     description: hpd pin
 
-  qcom,hdmi-tx-mux-en-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux enable pin
-
-  qcom,hdmi-tx-mux-sel-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux select pin
-
-  qcom,hdmi-tx-mux-lpm-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux lpm pin
-
   '#sound-dai-cells':
     const: 1
 

-- 
2.39.5

