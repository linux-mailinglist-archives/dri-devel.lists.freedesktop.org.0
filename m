Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444DFB30264
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 20:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9150610E398;
	Thu, 21 Aug 2025 18:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYFWGnrk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCD110E398
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI92AW003498
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hg0J2wlHD+qbwTRIm0aZirbDd2NKawJ141THIM96R+U=; b=bYFWGnrk+i631NeN
 LipidM3q73BVwNp3x/3nmDSFegEAqSk22I2FZVjSDjQ4TfkV8p6N32nWyG5nrSOj
 BrdNOSb7U0GL3jZKcw1AGkRhu/H+Ueia/4rCnqpao9ci9cKqCzxAMHz6Zp7bvKHI
 uHkeChvMAtG14JP5W+xZyXn6bZTG/qmcJUk0CU0LNkCeQpGZX8+N292G6nVr4pZx
 uAhJIZsZg5Hd5yuOP5Ems6LUJiRt7+of9qf5CL+x+Am21GAnwHoUaVMdKpZxyCe/
 1Pc1x/Ktbr5CXi4r45Dm0bMIEsMtV/1OzCUjSv9b3MSP4z5gxlSVeMOVEywzT49N
 YK15pw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5296j54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b471a0e5a33so2311121a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755802585; x=1756407385;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hg0J2wlHD+qbwTRIm0aZirbDd2NKawJ141THIM96R+U=;
 b=UnS1XcPvnIW2oHB3KMOTu3hJr+JHSmmgnA3F738S2jSTxPHOeACR345EPlx9Dnxzg+
 qlJvIgUHNGZqTyVGZvTSiy1E8Uk25FfAQ8V0Cj9PCkWi349PxXojTDXyOpFhf/g052Y0
 H0ZiRRAiOuT1CZXDeE+k2qKQHWVjgrmoxA/vxT8S3l49BSUtv9e+XXYcFXirF65fKNKE
 AwP3c2sUkivC0RyZJXDBTlQn2mztcudy8+6KS51pDZzZUoEGTgYbJq0sWjwF3pgTsJ5n
 g1f2ulFwYWiFdezkXNPJn3Gi5h6Qi2zkoifXfb+/GiTC4RzY9ntwMZ0ix13uk9tCN5xQ
 1r2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmOd31uJH4BA4Lh31+nr1q0X9I7dBVns7FibeygNERg75RodracO46S0xrHjRSRCRFUVkurCfZDMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/8pL5HVPlO0HJt4OzWGqd/yRbr3Zgztp3jsy5+dRtao/ut+P3
 bZM+uK5438+v7wT1/2tSQ3WQIQcsi25RG3iONtzJtFlPsELt2YjancmDEyasjGZhmk7D4/hfKp6
 U6pL5bbhNSQoo6sSEkuwd8YiNLClJu0hUmq5Rjh4m6eZgYYAvhIQG4YeTsYcZ8mxRXJGBvKI=
X-Gm-Gg: ASbGnctONKpeMm4t5AQiEJZzhfSeJXGt1aqgOfOCYgXm1TJhoIVBgbJvQd4dopbvGIL
 EzXnY9M3gsoJcavnMgLsjaOWZzGM8VQYtKpKRAAsyBj1r2y0+G2x6cj3RYS/mCcq9KEHY8p9Eo4
 jttCcr5olulC1DE2GT7PcQhPrOEKcstZpPcNriWpcWrP76jld5+cW7q6Us3KklCyRBX2soOFMfv
 eFvxqlncpktenRC1ENLHfCtGUIF9mMR2QVWTH/3BPqI0eMhJ2d4DShTqDlQ1MXKlo72vQgsjddA
 pBmTNXteot07nY5zKgf1gFKGhe3zZPMCu0ElNAKu9VMtdN77dawU5tWq8U/F7uKo
X-Received: by 2002:a05:6a20:7489:b0:243:15b9:778c with SMTP id
 adf61e73a8af0-24340e6cb77mr247417637.48.1755802584597; 
 Thu, 21 Aug 2025 11:56:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn6rh0B7c47MXx8XdwaklyhTGhJwh7xCUoqZlm5H7COv9fUxz3qKZRUNFP5avMhQt1EeCF4w==
X-Received: by 2002:a05:6a20:7489:b0:243:15b9:778c with SMTP id
 adf61e73a8af0-24340e6cb77mr247380637.48.1755802584196; 
 Thu, 21 Aug 2025 11:56:24 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 11:56:23 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:27 +0530
Subject: [PATCH v4 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-a663-gpu-support-v4-2-97d26bb2144e@oss.qualcomm.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=864;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=aChjfEXy6a3w7pDrZzuIMywJYTXB4ltbGRJ/LVzK4KE=;
 b=/XcmgOUoAHeDff1fiNFaye/iAKfeR2hwV0huFEwN3Fp7thPfeoVIoG3nl8g+jN7M47WJKWChK
 oKS2daX3S28Ac8lIb00kR4jkby/DjG7Xj96UckrTpIbzxV58+O+9Y0g
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a76bd9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vw9LXNJGsfarEDkO4cMA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: KyRI0Dqkk1VmunkRpQJel1AlYYmXNkUT
X-Proofpoint-GUID: KyRI0Dqkk1VmunkRpQJel1AlYYmXNkUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwq5/7TCQm4Ue
 dO/q+ejU+ludBqWz33lcDT1VhOhiYkvoy4aKgIs5h8DDYYVDTxX3AQTFsJfXsMaqfJ2b0S3mu26
 EuEaTO5Un+WINUnk4E/0um9VwYz2aXWRtip0/kby3jEsfwTuPufB5sSpJvImDvZH+QAJFU2j6g/
 HcoQ/qniHygKd2cobcGINfeGvI+YtfvIZ7e9U4Na0LDJeysBZrEZxB9Z1C9owJnjQiYA9j53yZB
 +jTsxrReDCBMvpLPWX68zO2AjxZCLFIo2cgrl0zL/XVvuGnXz+F+WCnCl6ZTsK6xvSn7U2S+ml5
 zcmSc0X+LNUvnN7TmfN9zCf3P94Qb0XHT0EbPD6MEsAPjePP6pyRvbN6fxRjnj/L5prFWMNFl/o
 WsVvO7DnPiykbg5iMIhtYnaXuAyXFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

