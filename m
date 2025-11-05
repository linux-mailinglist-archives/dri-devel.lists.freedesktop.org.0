Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA29FC36C74
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 17:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2126E10E2DC;
	Wed,  5 Nov 2025 16:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnQv5Fds";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dk4cRrPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0F610E2EC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 16:46:37 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5DMZfG4011438
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 16:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sJFOrjhFJZHkN7hWb6jUgTkGNx4wTKXUTuj6Z9f24XU=; b=jnQv5Fds5DZ66Zry
 IvEzoBTbpAmxm3Blk120fyRbtP0En3+vWCNKbpcPwQX1Fj+O96uxXgs+LB66h4lf
 6yHEDzMzedtzY0DTKt22ScHUDXr45zH6TeU9NxHGwbcPeZSBdw33j/5fz7BxiQwS
 WjfFtovv7k4shYJj2uiTEdpJi3PwLo40h+Npnl+XYeHLDn/+un/Na1CtWAy3+iIr
 OoBuXOQq2zS0fLg8arQlmt+u5NVsP10Tp3T1rVrkTxl4czG1MMnu90djVWXamARR
 //kE+VxVSM3+7n0/wi77orDia9+SYl4nePF4qLcd+QNUhSWEGsH4295dTv7TpT/L
 WMIPJQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ynwswxy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 16:46:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34176460924so62030a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 08:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762361195; x=1762965995;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sJFOrjhFJZHkN7hWb6jUgTkGNx4wTKXUTuj6Z9f24XU=;
 b=Dk4cRrPkheje7JdTNZD3tFh5ZdSXaMZCF4OPzuy1GPOK8llPqdUXY2Y4pDQ2WqY1J0
 0im7P13xsSUtuf3fHD4cN7lnkz/8xFR+v3kPBjjqrSGMlnCLdMncPpngiPWt1ZlwDTMX
 QkFMixni0915SSl1Ov5dVkzBucaPltglkPDimXayLJJPc8vEYUQubvVY7afamb7hYDu/
 +4S0KqqgDVKt4BH1IKYma3ydqas2NYSHIHEKzg4g7qWDDpONRGg1q7C5mmxv9PdZAJJC
 iTNElEvBROS9Ub9Z0pzFbdRf62a0sw/48+5BZxsgEnObW4Y6/gI4kEUvfBDI1BB/Zg2w
 G/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762361195; x=1762965995;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJFOrjhFJZHkN7hWb6jUgTkGNx4wTKXUTuj6Z9f24XU=;
 b=PgzC7BhCI1q4P9hJDlkv+JD/faFWo3XQdSPxC+2w1gkQZ1D2sJObV9jLyTbti01yMu
 VTsP3FwGjp2l4PK6Lut0gOH/BG7dnayd83r7eEiva0Lu/E/C0OpbMI6GiWf86OwX2u1A
 yz4sicG35nK6SKxNQ4Si2nwo1Qwq93SN8EEdRqNyEFGXoCl57QszIgcHRv5o0y5H7hWn
 VzeY4ol8X98lN5UYQnYxMBTBAFSlTOg8w7xGhZKajOUDUg8S3aVWGvQRlaxAhsmYMKWr
 lRRiUckwBr50SUVbKQVXQzfjvUMN2HRTtR6lCGVyi8oWsJ13FL9k2zeY9LIOoepaO6HY
 O3wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0esRBDmWpDewE1lLcHqY6II/CcrfETwO0T+p9kt0i0h7k+H9frOKHSjwxxryjKKdKlxKHQzqP3Zc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz05EbGDVzL/ZVmYU6WAKHuWsmUG6say85K9PZaP+JNQfDkt4n5
 TkS688qe5QwyOfDlM6myb9Hw8cGNg43SSVShfKiNO+3nH06WG5Ll6CKaauEttdDXl128cEkabnM
 XDLb21MrwJ/4WK9nkz5BelVfNHlZcYq2FxoYEhm2vk/fndsEXpiWyNpFzpyNCmzqlGD7q1H8=
X-Gm-Gg: ASbGncvSbP9QSrTXpHxCGASv0YR3j8CLtqFsoF1LulE9+rNopz2CqLIq6O+wE9zfHZm
 oaobo02M+ttp0oApADjx4VE/K5vbmRfl8lgGZLGOjwl6h2VaHJ4WJzmntvZ0qHaOkfHqmOW8Iey
 SyqKQSlbZapAvcHb2XzjHOxHYcQN1MJ1RMP4Gh3UvWXBUJfUtjb9MGLihA7a0spQAsygOgWg57s
 /2q62CHy22MRnBK6rLURLLXbnqOfZQQvZ1+hE2aw0xPl/YlpM9umex6jzG9xKklj/RmJiaTtru7
 6BSY1wNb18EijKy6BjubsalhjLOsUCteNqB63YQBavFdlFkXkG1W/lfccVTESwNmtTEg5twHMB7
 BERQFu2UZsgvAxhc4pBLRzao=
X-Received: by 2002:a17:902:c947:b0:295:7b8c:6622 with SMTP id
 d9443c01a7336-2962ad10486mr59682345ad.11.1762361195354; 
 Wed, 05 Nov 2025 08:46:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYVpEn9p7yDIsAYp1aZP87Bdl/2uK5TgZtdjIwNg03NFpwQ20p/nGpKGX/x/FLTLX8/vHeGw==
X-Received: by 2002:a17:902:c947:b0:295:7b8c:6622 with SMTP id
 d9443c01a7336-2962ad10486mr59681825ad.11.1762361194676; 
 Wed, 05 Nov 2025 08:46:34 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341a68c822dsm3426249a91.8.2025.11.05.08.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 08:46:33 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:15:48 +0530
Subject: [PATCH v7 4/5] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-a663-gpu-support-v7-4-1bcf7f151125@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762361159; l=804;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=QygCnmXl5Esc5BPNyYe6tgH6/RC9PgKmXDBI3B/5l+4=;
 b=kkr/m55E2zuEnA2RDfM9Hl+ewlE6yBtGv8M1mz14zrUkkvyLGc1oQRrfOQuIGcFm462YtTEbc
 +q/796q/1FHCFP/yO+/k9iCY1uPTdpFDahQ0z7BN/arcIQwhtr7ayCa
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyOSBTYWx0ZWRfX4C5WqgySHs+Q
 iJE/hrQnK+JKbfl6PPhEoWEaIQkAw7ocSnL8Ux45y5E99tx1lLEZVuQcPoacAtzaku3vwxHcUiI
 Unribp02Y8rTiLhpW2RY8Lqe0udYSgr9XNerjvsKv4mQPqSw11UWHvpWN5HEtxoDwZFtQAVZaVI
 PjKfobK/XPeIiFbx28f+ZEsdGd7oCfQLlA3IkkGtwIySVTNov7RHza6d81++MlymGcodnqd3XZg
 xOwfeHXnukcRJagIlNt7FMYdIOTidtQ7fS3SnP47Id03aOzf9xAVbNK9mmgzbUu493qGH6OvRQW
 iQ58w6ppS97QuoO8Q6VFprjPGd3H8r5wPGT7Lk0E9OqlYDL1BR7tvTMUS3kO3wSa2JtIoIhsQ1z
 kVoaiGVgZtlG+q69D0gmv55K4cX/+g==
X-Proofpoint-ORIG-GUID: zjzy0U1VwWstfWx5ti8Kt395XS1yQ6ft
X-Proofpoint-GUID: zjzy0U1VwWstfWx5ti8Kt395XS1yQ6ft
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=690b7f6c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
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

Enable GPU for lemans-evk platform and provide path for zap
shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index b40fa203e4a2f080f501140fd1c68b72d797fd00..28bf152f5fa8e8d7779904986da1a5c2f06a5909 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -454,6 +454,14 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c18 {
 	status = "okay";
 

-- 
2.51.0

