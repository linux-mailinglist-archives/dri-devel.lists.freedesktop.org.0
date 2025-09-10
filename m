Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2FDB51583
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A7E10E8E9;
	Wed, 10 Sep 2025 11:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhMdYRrB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C782810E8E9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFUn7032208
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8xCz4z0Bi/57zqJUn/Mu/aLwfF4knJr/ZgFBZ7thB9k=; b=AhMdYRrBoiwiY/1V
 xEChmpMDD1v90QbkJStq44JDSMtwAiIA8errZSW444pOjGSTp0lDVRqIkqamX+bB
 h2Rfolu5xm5Wk1E/5WAGlQ/VJzODA+7N6oXEb0OazwdyXgkJcmqOrBmr2EQzJw8K
 fMb01O+kLFpyePaRS6JFxPiVZ1rHWia8be550csJqrGqC9S+DUc6+PQz0PoYCOfL
 L+L2cUtWUuso3UfRfYUk1itKgJe8LfReBn3ak0aSvSRrdvIl+CMn64gY2sprwcx2
 aGfNPxwDPr3r7y0sxKWQOUOeeoJNW/hU1xi6LceifgOWbbbu1zFLNziy25vqZ5Xu
 AzgqJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m3h5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-77283b2b5f7so13705371b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 04:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503577; x=1758108377;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xCz4z0Bi/57zqJUn/Mu/aLwfF4knJr/ZgFBZ7thB9k=;
 b=KtXtskz3hDinK++kT+cCobXrJGcdFso5g0H8pGVayHiGlFIfnYQHckISixBeioD6qy
 q6HTwgZlbCza5sdcW8w75Ujwrj92RROPygP1FiPfPpKNr1ZK8J3+9z8oODZCvCIuLcTH
 c4I0SCFYqpG7P3hcJcevEMD2CipxZm13c74q5lDlchRD/AWZ5NNOLBFJ1EipfiSThnGP
 bHVqaoJDjRmxZPyBojOlBymE39kMOaH1wtW36F+G4G0mULjW7BkYam0huekN/VZKKW3f
 HPUNHeC0vkcuqilBm63TaEVbbtbIXRWFjiDwalvRwLSf58gC5keEpjD0SIsjpmJkcFlr
 P0Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNO608hy1XK4PkRZeFPHS0a6inIa/0VtrxYG2lX/3R5hIXmqmkncStuUV9bfMs02+yAA+QqFfcE74=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+JH1HHYO2/fX+b+zKDphYaMt5NXBEmZy+SLg0AoUyN2/HC0JC
 hDFZ7fKZLgowMOytB+HHRUxuwEk9qbYlHGBWgjFa6gJWMzSxQGOZQgl7tEuuH6lyu/6fKqLYcER
 HA6ZCJRAjWXFsljJr5OJAyzqb17nrgw0/z/8AM47P3sVpKkySnXcSrLKffWZawfYgPXJLE54=
X-Gm-Gg: ASbGncu0E+aCBph//M632pPjoNxPAraVrWf5sxIHLRDJ2u2IJmzkqA7vxwq/aOyA3iW
 ZgWXDwpX2+6NGNrKpmEMDiumE8TI2gezuPhXTo5c7BarWlq8GhLA9YINy/BwWErM0ligQqH9wmo
 meo9RFjr2eNFZh5dRPscQS7J2nSdjssfexaRG2QEJ3DkZn6XwdSnmx0ewi7ivKzpPEU3O7jkDg9
 Y9CsM2rU3KGtK+JJ1NcG/jAqG2TM6EXByDMe7T6UE0fJ9G+VHK3u0i3Cr90H4si8gjjoqKSwuXh
 ipTtV2hpGVg8/OrjJydoXN5oGAr6vxi6IZqRVnTlXLE8RY/nQvWlnrynqqxmbRuZ
X-Received: by 2002:a05:6a00:4b01:b0:770:4b1c:8155 with SMTP id
 d2e1a72fcca58-7742df2f3bamr20536934b3a.31.1757503577259; 
 Wed, 10 Sep 2025 04:26:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+QDB9UfSTw2dpK6r9PESzhtTxePgwetKm4/3FAkoGJBYT+EgDiwgz5uRPw9lAa0ANlB5rGQ==
X-Received: by 2002:a05:6a00:4b01:b0:770:4b1c:8155 with SMTP id
 d2e1a72fcca58-7742df2f3bamr20536906b3a.31.1757503576750; 
 Wed, 10 Sep 2025 04:26:16 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:26:16 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:22 +0530
Subject: [PATCH v6 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-a663-gpu-support-v6-2-5da15827b249@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=928;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PL01mJ0RQboPDnIbyuTFQL2+JjE45/PjCXjxeBASbKU=;
 b=jbHbZpOfOJnlTpNnSBL+ndOzzQcLInmZVQoFwGPwAfCej3VR+/xoFNWKsr/YC7aCrzP97N+4w
 KVWvC5iBnK9AOH+xqLminNazLWF26SM4yGMZR3CsuW/pcOFkMFDYIvJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX0giA8lUHbcKw
 SRFGBDJ6H7g/Cg/Ak8ZXNEOq2x8qDe7uzwGg1+7m4pn7QjlOTKvO9AdzIgMYvZFhUBIrCL9EQKV
 +qFsORzn0shztDsdK/OjGqY/VNEDoFR1rFvjckNIw+3sVJIkztAEx8gvBDySGTsn3QyxO7R5zhX
 ul3G/I7FjpGYYPexqR3M/tPseUL5gAMjVrpdMwX9GvhHhWmva6KWS0IV7y04B/WYX1AN8AB3gtL
 4YT6k9MGrSO3EkKEpTqWDqWUfvHEleKxSptFn+UyQM+fZH5orJjwHmBFHwJgAG/VBha0PjnsXa1
 b5eE0eXZQJSzEMWdLvnNc+9EA8suHGks6Sxmdfzam3XP80rPsjB9P4BQp7KF1nu5UN3x6NQxp3c
 2ICigZxq
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c1605a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=TNpnUgr77EDisZP18eEA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1OiGOaAMK27LOsa7uk2eNpOR-wmC8fYb
X-Proofpoint-ORIG-GUID: 1OiGOaAMK27LOsa7uk2eNpOR-wmC8fYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

Document compatible string for the QFPROM on Lemans platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 3f6dc6a3a9f1adc582a28cf71414b0e9d08629ed..7d1612acca48d24c3b54c4d25fa8a210176d3bb5 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,qcs404-qfprom
           - qcom,qcs615-qfprom
           - qcom,qcs8300-qfprom
+          - qcom,sa8775p-qfprom
           - qcom,sar2130p-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom

-- 
2.50.1

