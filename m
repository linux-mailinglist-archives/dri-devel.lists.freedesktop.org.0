Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGI/OHf8b2mUUgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 23:06:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC34CBB7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 23:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC43310E64C;
	Tue, 20 Jan 2026 22:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbFDpJql";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N571vX9b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3890210E64C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60KHBi1k314500
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WB1ECFOLGITva9lWFvjGi9bk/gpXjPSRbqGr6mbr/Us=; b=cbFDpJqlmDkbWwCP
 eEs56Zbq76UflCH06fVQCjvO4z/oNGBxZJ+xK1ra+0OrX3Qzkh7dTMYYsGkruHPp
 AhPaxVlodSuhwfGeAIwbeQHE9rLlDBD32tz031nrZnd/nqrhudLlkMlG7IvCYxG9
 LzBwJNcMEgA/rJwVA8VLMY3PZ823SWU1NdnMZMFLkNzkyW/62vh0FwWZgNOWJNcC
 SVJ9TpFutCKU8PoM9+oonzFXAX/VHsXoA8a8utvoLE57PrDI7Rfyr4Qck79MUpBN
 ETrllYvphODOrB7FwizdEj2gz/RlcLfobF7zkOehfBqPJbKkVWGXnuEcw3L6pY3a
 FteDJg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btdw2906b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-81ed3e6b917so5368961b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 14:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768946803; x=1769551603;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WB1ECFOLGITva9lWFvjGi9bk/gpXjPSRbqGr6mbr/Us=;
 b=N571vX9b+9Wp9UiCuedPmolxVRcBBEUq7TUMQKTuc5rKuZwFq4G7zH7AkHo5Jc7Xg8
 mG9B9UO/+lOGkyqkklS60T0Foh44gVUFwA6xqTfaOZpaKrqXRc7ED8XEU1GRpXm/k2Rj
 tnWELuotjN9qZ+UJmOZvyCHrHaF+KiE3B57UcpokMDH9iC1CgnlIpLnujyPNRCr0VDYa
 3VGJWMxuWoW/7RU4QWLlhxvOI5W1eSRaQkWoRWnLVaGphPT1KuHHDmNjXYwxht8y4eoA
 En3Z6rJmaoykG+iKdMgTl4zVZi8NDN+BX0yIu08GavxHGxRONa5L4tckdr48z8z7BF2a
 BTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768946803; x=1769551603;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WB1ECFOLGITva9lWFvjGi9bk/gpXjPSRbqGr6mbr/Us=;
 b=XWEWPw8S/WtTbhppIXmJ9VaW6P+TFTiRCzalokw6lyz5PMcZ6PvkK8Ahki0rbWBUkz
 OUdsz3/pLy7Cu0LTMp5OmqVT4v4e/8h8KVrbyoFyg65Jssfv3CUMEfd9ZKeW7+BA+Rzv
 jOkbwjza1hJXNjWF9YvI0U577Gm12FfSnvrJ8+Nt99yv5ilvgeIxyUVnHVkXNkPKL8K8
 luZxeCaZXzRNVoxAi16Ojn7ClRh2CR9jiDlO7Pfl51ndS9t2t/eJ3bltzDqotz2N1c6K
 a7GZIlRNXIaozHHCxf94qHnKeTWJmUpMrso5IaavOj8D10UgSlccRlMerT1i4LnLVwRk
 Sd4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1NR7PhMgl1f/S6pu53WrgUjNWPadpPOxUHh2mKW+A+rlO/WYnszVLqxBlluFoECbajLsydI1IHhQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmDr7ompnQPzlUGStG3l0OUZPVvZNAV0Oy5oZRSb3dhcVUJwOX
 YfWRoNXFVRHWll3Z3EOVZCEcc+yrOd6Tqv+cDP0C5yMk3tvZPI1P+/t1lVerbgBapJrip/iEMlf
 B7SttkJrpymdDpyR+jn1VlqRVs7m7Byr8ezGtamVY8aUudSoAV+19BQGXuBw4eL2hD+1byq1GN2
 Q9SMs=
X-Gm-Gg: AZuq6aLPV/1wAiq4IqHqj/szK5ZxxydA6QlMXnCtx3KFhNLAKJXeb3hRSJA4KDIPDNL
 pK+LxuZbODbrxUh9ExeBVjafmtkeMQ8apBsVyF6B95iSi4yPUTynsKYAVuY8j5u8G8YnZ9SM4xi
 0wcRlddbPHxp9jn9Hs6PIKVPqSvLdGRCsRCAqbtaQ7dwr59FonFK9jDsjwlrQkc49RKPxt29c9n
 +t2Y777axo0DA1iksU8bV9x+Hx+oN9xloSrmbw6FvhnaaY4IkaefPLJV+PPsm9ycb6P05MVl1c1
 A6pr4lTe/7h3k7XUbC9TYNZmsMS349/hvwRXNi/HeyDTaD7R8hjNCKrfO6HfSqf1oMTkmg9aIIh
 G8/KJwMUmctTcpbqKLwMvdoJCdDF2cIUDow==
X-Received: by 2002:a05:6a00:4b0c:b0:81f:51f5:77f with SMTP id
 d2e1a72fcca58-81f9f4d524cmr12167769b3a.0.1768946802870; 
 Tue, 20 Jan 2026 14:06:42 -0800 (PST)
X-Received: by 2002:a05:6a00:4b0c:b0:81f:51f5:77f with SMTP id
 d2e1a72fcca58-81f9f4d524cmr12167736b3a.0.1768946802339; 
 Tue, 20 Jan 2026 14:06:42 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa12b30f0sm12867088b3a.61.2026.01.20.14.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 14:06:42 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 03:35:55 +0530
Subject: [PATCH v7 4/4] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-qcs615-spin-2-v7-4-52419b263e92@oss.qualcomm.com>
References: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
In-Reply-To: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768946765; l=941;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ZiW6jOez4q4s7UFSzYJiN8BRNzCWh5U/qQxE8K5ykQE=;
 b=QZP3GHh/qNFnuZodCzW+5T/jIbsllVpQCI5AKabL5BYKxofRVvG88hp8Hly8uvAj4sKx0IwqK
 ZPYM3F6ds29DGbWubQlvcedlKMOfvH8VD5YZTxUr3GNtOI9hETIYQSx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: kIRohZVs_zoepeTmecKiLB7H09s6pQfB
X-Proofpoint-GUID: kIRohZVs_zoepeTmecKiLB7H09s6pQfB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfXy6B1MuM3MS7o
 MIhYF66dnKrBvmvCsilm8wrcHbkS4qb9jtIeuiMFfW0WUkyN7iItaA2CV6esIuXtNrS2awoo2ll
 Lku7nrQDVO9kHamprQ/k1iUX1ClevSt7KLJ592lJ8g8heJlAYDI+dt6yns2WmgktJwV7/IRidpd
 5AJ/KfPCU4JbK7MjUQTzz6ZjjAm28sz+PMdw2P3O+sab9U1tQY6UN6JAPWxfRJ//VM0Q7Nn/pUH
 UPsa7sBQsEiLCa+CX7Dg83pXGijLp+MUaR2OwHIWWmqsgglZwyWyNVWUtNAW5LIWJHDKP8QDkgL
 fG9qCT+hmjia4IyP9kvPKQjzb3Tnh230RexG2S7M/UNZMt0iLG2rZ+FAQyngGaHRSxH1Qm2aGjN
 ZteQNocNr6KorgzK5ZJ5vhx7RtpEqbW89IgtYNY0XJnUclcAZ0dxZUdH6PUTJazrjivF81Nzgfr
 D1xGnzzNqdQQ/mTP3bQ==
X-Authority-Analysis: v=2.4 cv=RqzI7SmK c=1 sm=1 tr=0 ts=696ffc74 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DDenb0FKNr3EH7qfFfMA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200183
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:jesszhan0024@gmail.com,m:gaurav.kohli@oss.qualcomm.com,m:dan.carpenter@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:quic_jiezh@quicinc.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 96FC34CBB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e3fa92e3b543ed48b2fcd6b20c6ca..599361b7c54acfbe9e5e45eb2bae046e7fbc5715 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -372,6 +372,14 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.51.0

