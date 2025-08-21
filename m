Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658E2B3026C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 20:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2ED10E39A;
	Thu, 21 Aug 2025 18:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTc9V3v/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC0410E38D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LIA25C012413
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Eyjmrtt67i/hSgA8ZAsqicrziXjRyLeDwvFEX9xKzs4=; b=XTc9V3v/xDZMNumq
 p5UbMbUr3Ey8ZhRVv5Z+a6mul442zRqvNs3CcT4ELBh5rmpl71dIRShNMtEKUgd+
 rYfJGQmuPqPFruhCYPTTmUZ5PrgNGFH0P4D+RjjeNpGPqjgc0M0cT383CVE4TSz/
 k6YoIcyM+Dm0/gtVSN9zBZQ8rRbkov/8z3qvM22WmkDL4SDaFTQI9oX7mA/keeez
 I294uWhwdq5dCiwcpUvzStDy+ndmwS0/oRxMd000GcbKra5PkWL+jIRLlpQbn+HF
 k2Uj70oTpsrks6m6qOlpgr+F1atUVMO1xs4E2Ak+QZxccrykdeMbuPnJHQ6mTz8g
 J8CXlQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5296g03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e2eb787f2so1513612b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755802604; x=1756407404;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eyjmrtt67i/hSgA8ZAsqicrziXjRyLeDwvFEX9xKzs4=;
 b=wblk/KM+bVg3ZccIuiRlg9RlqVkOYQcl8ar4yPOzM/QJMJNxCUzn16+Feny5X+zi0S
 gsmAE0t0D0fSVqL/fx2nSI1ya/aJlOXDmKUANr6tycM7JH02PeTXrtAKuiAt3zmdoKEF
 DLaTeZfsHP7AqfCVT3WKxLgnypfKmBe6EnfxI9caSb8gsYX9fwguuEGSnAErgzDJC5E+
 wOb4QC2luZ3xm6jRpgS3Kvfzo+9tAn2/SNRt4PWw696MgxAMc2HK/F8DY1vmVfyPbA5v
 6aD2xw0Jy8YcOQGsKEaN/clVrUpMn3JBl4TPctL2w3V8JSjW5os6fEnp9LqGJNksLS5R
 n2QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo/JHEtRvxfiF2O2R3W5hZR0fO4fpJGvueLJHY/WJ0eQ8V54oKS7jEB5HzIEWVrUxWxYTIFwX+nIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydT0tbbPf1blItOLqnUQ5r4R6bkByX7MXzg7CZUD8ZJ1En8GPi
 0BtJt8nANaK4yiF7NdCLC+DEhG7XeBcE2ifApNyzYhU8t6K7zjNFvwHGIGUulfK2mvUTbQj5Gi/
 WDOoYV5Z73ydADYNewQqI6KJDKenBejQ5Y5FtCgu+bO5tO363xOG3iIq7IFoNYb4OKI+eiZ8=
X-Gm-Gg: ASbGnctOvC2DTGgRirsuh5DcSBOLucChdLy2xCm+CLipyQmX4OPezqcHyxUB6oxEpCq
 6kOHG5o5IjxxzOL5nmp9qw1sxcvfLCeZGk2R64/8Cc+KERDaunk8s+J5OUQsT/QenSPK/ymdLUx
 Q49opxQkc2M9G7FoQILwYCc6sbnho+1DMqMX2KIL6Ra4zDuVPhkvPcnccaZxdGpg+NlUpixQbrk
 hp1ltSo57HKtAKq0ewl+J8GTGT4Mw214OUihY5v1UMZ3FTzU+MLJVmtbxcggOHtBraMx2/TVFJe
 YUoIsIzpZgGHaQXL0RUhKidy3bRxoB08Y0XQtmMwJwqvEZW95Xz2Hm9CW+tKN/Rr
X-Received: by 2002:a05:6a20:394a:b0:206:a9bd:a3a3 with SMTP id
 adf61e73a8af0-24340c3a714mr325125637.24.1755802603765; 
 Thu, 21 Aug 2025 11:56:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLnv9zIkKigFMRZ5cTavEVxl0hH0Mk1mEGvhZ0Z3VQ/d704GnW1rvvfgCrrEv2z/W1xLZk2A==
X-Received: by 2002:a05:6a20:394a:b0:206:a9bd:a3a3 with SMTP id
 adf61e73a8af0-24340c3a714mr325089637.24.1755802603354; 
 Thu, 21 Aug 2025 11:56:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 11:56:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:30 +0530
Subject: [PATCH v4 5/6] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-a663-gpu-support-v4-5-97d26bb2144e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=735;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=X5/b2wPl0B5JtiyqdyVNBvFH6QvvW/Oc2oH1DyatOms=;
 b=mTcyCQXosL3wdwNsliBAQNXiroFwDZJGSaZ/bRV17fNt6HD7Zn9Y93qTXO6bpukLNK3gl2S2/
 L5jxBVtbKV6DM+Sf2O9Nz/+8Zr39EA/mNiV4RlT0T38+vpD8UVxN4B5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a76bed cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jbU5qkt2-FsioPMlu34A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: RuEhj9lDdQhDluceM15YJH1FiDq3Usmn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7GELr1p4T3XK
 qrriXqBvyfs2QLSTezN4fGuNM4pvfB9mtYCsSqFk08AMBZ62+bzcRfpeI9yE+CLC6u1xlYjPHcy
 PCnqhDaygsuLjRSRiK1piCV8gIKfgYlF7iAPF5nXtcKeDH9yq69nP7k/gRy3rEIfKoN9nTHTFKf
 oJLWKhF1QWKWby1IVXR63uYjFJd+VGlwDIxVKApEILSOxtJxug5sZiqjIGHEf+hQokWhJJTW9rJ
 /krF0Bw5vgzhNhn2HQO4vC4IeHUwpRgx9Mt7eXOAgH/2QN/+PWfLlGKC5FlkYod5IYg++pQUJX2
 SGALhLAMpcTeK6syCYO3mrU62Sa9cjH1/ZjHwK7F5ZH7rlGg45Kgga3z9+ZlqOXI1YrqSFN/rqg
 2uhTEs5tP5ejwceBIdCMXbY4tuT64A==
X-Proofpoint-GUID: RuEhj9lDdQhDluceM15YJH1FiDq3Usmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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

Enable GPU for lemans-evk platform and provide path for zap
shader.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 669ac52f4cf6aece72141416068268531fd9f79a..876f43d761870b968e43ea1ecc360b4403f19fef 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -253,6 +253,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };

-- 
2.50.1

