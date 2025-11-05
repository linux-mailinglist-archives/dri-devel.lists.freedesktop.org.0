Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6616C36C56
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 17:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F5910E2DD;
	Wed,  5 Nov 2025 16:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="We2S4wmO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqj5WWc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D58210E2DC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 16:46:16 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A57mscK3091498
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 16:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V0NNfdE3hYTw3zNUDaf9Tkr9rvcnD4dKnWyPzOQRNqA=; b=We2S4wmOLyuO1nHH
 rRTzXzsQ0dFfXANFMEu8iGnKmhNm2oE616DBj3v3aCGlvbiYW9J2KTkWVN8Z2wKM
 ruW7IWzMG4AdH7m3znPgYiDHvwg3/5L3akRs6IJUXJn22vHaFE59yHtS+0DHZVMO
 NugzL9PqaCoXhXizTTGVs5/GJpxwt5KfCUMkqCqcqNIzgax3DbWtc04X+23pIloz
 NnalIx3qCMW26nytLWWck0+rr+N0JycPwuqrqYBgVJMNh6tKo4EC5WphkBlxKDZs
 PtrqDw4kvrkadaw+qnwKayn0ZvJPBEoSCc5F1FtIHEbaNlo0bJM0y2b814WSF78z
 X2L43A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7s5eb2hw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 16:46:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-32eb18b5659so58065a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 08:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762361174; x=1762965974;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V0NNfdE3hYTw3zNUDaf9Tkr9rvcnD4dKnWyPzOQRNqA=;
 b=fqj5WWc8PPRMKx/Eucd+oBym1zTHDzcofNVpDFC9t4IClG3k+ZMgQ6hLZd9+XqIND6
 bBBTMRxU/Lps5eaKrRokT/ExOc+qLw8sS0ZEe7AK5OxXdLrjiTKoPQGrfsO/kgwGIMga
 nS8IhS9Ftt1JwwdnDni5mwthV3VBPwIEmLsaKadSmU84JS019/AeWweIvwLuemNOwrVO
 RqwgKpNuVOSsP4QOuGDoFapF7wiMDqWowXou0cfbxJ4UKFplAGWWxku0ZRQI85voeb8a
 Joe3/6vsDxQRbG9Y4nCP2I0H29uSutzWdRY0PSYgo150VCZWshx02f0qEuF07bPee6Ay
 xOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762361174; x=1762965974;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V0NNfdE3hYTw3zNUDaf9Tkr9rvcnD4dKnWyPzOQRNqA=;
 b=Xg3pFBS0e9/LbHSDCo3sr5gEFgJKAvxl+xTVb904IvLYh0mLH6RHxpmRE92YBjCJXb
 0SZEaDodKUdHIFzfSnSWYdJI1RG6fph3RXp9GpZQCZMvw7XY/awEBap0pTmZVF5LUyqI
 fL5v0WEoPEsE1ryGj9rl8454WhrLS0ZYap/SOHGUjFuIEhmiojr17VXrnrC86xGTllRU
 nNX1S6JwTy32Bwuaeq1QJbUlKffgUj4Apn1/CxfxyI/qdWZEV2YrUUVXIJFMrtY4GuPy
 coU1aG+Vv+wTJnjJUbeuzXncoalO3jeH/DeoiQ9LM4BWXh0FxKUkBdgU8aB+FaqDXx+R
 OFcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM72a06wNbp0C/6y3Joqigj23MieJWoose6LUrlzoVrF5qxH6YfeNtXemzTlOwq5TMxAPH62Z5wYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNlUuTm02V5IJTS55ZLokFdcvyInT8WeRxHpwondpna52y8AWQ
 z4p2ezIbBHtdSSw9SpyEq/v9pGaxs9+wSwNA5jIJjpgdrbCPX9sdV+bxvKNkpAFLuNmW+Ul8E64
 acGjIwsommbBBFJv4I2Aa8pVCKt6orVG/AkNa1UgMbTdyaUGqenWO328TQOIDID6K7Dedm2I=
X-Gm-Gg: ASbGnctzAvwokIFybwXl107KR9ONL0JXFxzhghwtSWW2JYkjlo7ICBPcJ8PvuLdl7hN
 OykGyooYKxXGng63Sp9N5iXDqgPjci33jP+RJS/PCNBy0/ILkciy0npLzAuebgsXIPJQvrZNpL2
 l1XtcOLA8b3cZrCJlCbyOPuDf/DsY9k/a8RaAFx/FVzZAIKp1BGlBl9FEOpu0m66vwD6IolJjjX
 RiIbPnv+pNCBLexbNBsr/ojOgJ4ZVD6Z2a8M9t1t5F+2DCy/FAgfsbZN5bhnc47vfWJQBNH8paq
 cxE7yjziNI3MKI0tLZ2pmQ3ykzJqdBQiGwAl3bZW9ZJofFk1WhirmsP8m/wsr9rOgm0Ejz5r4ud
 WmspMop4zjNZjqpP5v+3v4lg=
X-Received: by 2002:a17:90b:274e:b0:33e:2d0f:4793 with SMTP id
 98e67ed59e1d1-341a6c2dd89mr5133572a91.11.1762361174259; 
 Wed, 05 Nov 2025 08:46:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExDXPdqPDT2NkdJ7fX7iWKr2pf+irb2Zq0hx+Byc3+KFA1DEVgM9hn1fe4HmX+JkqxfTmWJw==
X-Received: by 2002:a17:90b:274e:b0:33e:2d0f:4793 with SMTP id
 98e67ed59e1d1-341a6c2dd89mr5133518a91.11.1762361173752; 
 Wed, 05 Nov 2025 08:46:13 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341a68c822dsm3426249a91.8.2025.11.05.08.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 08:46:13 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:15:45 +0530
Subject: [PATCH v7 1/5] dt-bindings: nvmem: qfprom: Add sa8775p compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-a663-gpu-support-v7-1-1bcf7f151125@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
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
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762361159; l=998;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=CSOgdQpc0lMePHubTaI8zKt7XuYIPcsGjD7SJ+d1YnY=;
 b=i1IXdpI+2THuQXFa8wLghoNr7UkEvIZ+HYFBfmuX0sPOdoo24L21KRdyc21kfonQ2ky812AeR
 7Q+ZR+DzxwSADT8vgD11jIiqgJfy4qZSSfcOGwkSN4fE6qUFppbBcpE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: lIHRetR0YOdSD20dIkFNyGtPZPKhueo6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyOSBTYWx0ZWRfX8vMX3c5FHkxb
 A65SUWiavQY+y0w+N1MWGX85qYWFfMQDDG6Z6a2VMJh0vfovOc+SDStHEocnPcUOpRge2s2NVsH
 ir2JeQZXTi3MEbVoNR5mFACypyDGPTM4RNtn0V2xJpjq67YeVFgsVYt47sQk/392zGjrDhLoutk
 qTA1LAj5bxVdNTpA7jDlVEGzFKBjfN8DJT0AXg6mR/bzAMjwPVmior8a88wR7poZWWfVW+pAGfW
 VWMMiGNWzVVOP6OfYBZ6w2MGzQ6iPSgNaILnL5VNdjLk/Bntb32pC5SpbHHLRD9CFG5tvMuSEF5
 kFN3mP1hRE4IqZkxpcehnaFLlYcudjy3YEPOQ8fyFvaKcf9+bDhJ56lKsOgHOm35XdT4xwj0oDt
 P6VvD5Hxd/YwzBTSbkcKfyM+yTdhNA==
X-Authority-Analysis: v=2.4 cv=OayVzxTY c=1 sm=1 tr=0 ts=690b7f57 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=TNpnUgr77EDisZP18eEA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lIHRetR0YOdSD20dIkFNyGtPZPKhueo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050129
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
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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
2.51.0

