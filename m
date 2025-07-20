Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E80E9B0B5D7
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438BD10E370;
	Sun, 20 Jul 2025 12:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGlAy1j1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCA610E371
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K2daJc032403
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kW1RdFmcoOsd1EwSoqf5o3Zsu7xmMON1mp5RNrIB+Pw=; b=pGlAy1j1w0BPkw9q
 OqoPVYZpD1yWIRztmchbQhabtaijsVtXSxz0ii10+HUti0UOP9Y1chBEXfCJ6wPs
 cr3ca4ZYA4CXzyao3IcYNyXzs6oU8uDdX5Eo+iIapJonSnahqpsB6WFuHY6nIOAz
 rPmZa220YEvmQ9CPrivOoQx8Btnc0giA0WV1B/c1Z4sYT8eTqmD3TMmnyQmmA1Uf
 gzdmOb61QzuHM0ixyaGhwZdONlTYHooKWhqLoonMN50LsHnLjZiyj6FEvGU+divW
 iZ4MXt4ReRwk9sAb2Txj5jWC7MIZ3RSfBbpu7Ne8+zzSZre8nlgcwnx120cx8EMF
 bMBEVg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044fa73s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-748fd21468cso3237053b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013826; x=1753618626;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kW1RdFmcoOsd1EwSoqf5o3Zsu7xmMON1mp5RNrIB+Pw=;
 b=U6+NMZbjozQ3yHC65v2dd2gwk2bHZlnGjkUDE3gPJirFuSHnlE5OsfVto2PG6R4e7g
 Ipmg1SMjNX6FoIB+WjhdIz58REyV5CDzbRxL53aLjLzpZahVW05YGM7YTac0shejSD2g
 Q4YhRCpBh6+P9Cxj4SbWzK4BfDxzAJygEJFR5XaUBH6LRiQONezMiWkhVx2JJr3yYSSq
 3yomE1UeMZitu004HABanFTAXT4LxCP3A0p1c/Rub+96UeGa6EELIzanGGLif7eV92LH
 /E1ltY3lq641vhMlyO26iGKCzSN9ldyJwgO95KqraxGRA1+xTkYKFjqczOMTmfgy6H3s
 D/nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURcw43QkWjgv6dpn67LPWVWebVgzLePMTpFD5pVvHKutXxbQ/G0nZjVpEr08Bt0ErCl+VTnlflDS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGSV4AL8a7lMfg9CDaIUcH6nzJhCTBnkAWPYF7B+/lLx45GYaq
 is+54dVRnVeDBnARvmpwdHTE4Eu7133ztV0fzbvqH6TbKWsf1nKrqfLSH7WnxSVow9XlUxsH9VK
 tWK7x46SbmxlfsTvlaNMXXxThngj5nt4eLy9juaISivF2HSUKCWdH0ZmcW0BrEKmu3RyUouM=
X-Gm-Gg: ASbGncuRv3nAUKjlz2GA8U3Z9FS/GZe9Ifjx1BH6lVnHxLwDnhodN8jG6sxZWI7GpuS
 3wCaOyTnMsWw7v7APimYCNDlH6sLbMSKqdn2Sva3PQdfLAysLYkjAWIBSBPjSxao7YhtiNgrkll
 GeGsREJUHLf1TL7u3ngtmNaHyKhozDz35mMDyAYSCCC54x7maZi0GgB+icI8LdnU5E8nckv+pSu
 FrB82tgxDZnwbKAJLVUxWE3G1wA8GER2Lw86cLbfmM+yFijUoc5Tzzyif1r+IdYWRhGET2+v9G0
 iHjN9sHLvjf8uWAnnFo75YcuewWD0Ucg/SFNyXphIwgDiZeTHRAdqqCweqZAETpy
X-Received: by 2002:a05:6a00:92a7:b0:74d:f997:1b45 with SMTP id
 d2e1a72fcca58-756e81a0b16mr30560715b3a.8.1753013826563; 
 Sun, 20 Jul 2025 05:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJCPBQtnMXy/jZOOBKiFVdjpswk8HG9jRo/IJ5LNgu7cBW5KadTD0q9XkvVA+KGaxqwWZhYQ==
X-Received: by 2002:a05:6a00:92a7:b0:74d:f997:1b45 with SMTP id
 d2e1a72fcca58-756e81a0b16mr30560678b3a.8.1753013826033; 
 Sun, 20 Jul 2025 05:17:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:05 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:05 +0530
Subject: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1549;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=3stwORXOyD2lHblr894e/45a/C3w1GwYkrVrwU46SQM=;
 b=18D4fLzbFzbWn0lxY8knNtoN1Y/tXd2BzOVJmRzc5l+AkfoVEX0r2tMLbpEmrVxCkaWemcti7
 3z95YWbq0QbC08z2Xo5a7RbYiQ7+dZgYQcq+GPAXdz3j6ZBQF1W+rhp
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: AIaLzyHdjhJI4Fz2HTuQNo4ipfTUwjjz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfXwMKnT/3lM50g
 mu9fG0kYSMCvv/wvQPLKpFj1SNwXMs3pZq38uoNMQN4UjlGKwOL+Q03aC4Ztnix8LNYl5ZdYUNN
 ss7OWLCzeaPpqDy/Ul8kOP/JfeGsbX0zN7u4OU3SbpJLDrY5SRnz9IOvdfP/uL/v+Vba4V3KnSH
 WxqknDC3h2+FZrYwUrUmI3Io1cSUsX+Yk9AJ/1sljZ8X30zSay3hP1vNzFbtWZT037xXlCwY2sG
 TXPH1cc0VUEvVSESpN4fO2iPhtk4aiLm5IQSpLanBgjwWMlXv08T9hEAC9uDDtUqda/UJs7OH8m
 ianbCafVWo9sgpha0YMPy+OtPERBwxl0vRmaKXJV/rbmZ4SJqt0cG+zIhF3sXptbOfWpsWcPt30
 4aFCAOgBPoORZ/A6VKgrk2IiDUfhrpDIVJHQutBQJPB6QbSun/V1qJJsyMBuR08bgztmBGhd
X-Proofpoint-GUID: AIaLzyHdjhJI4Fz2HTuQNo4ipfTUwjjz
X-Authority-Analysis: v=2.4 cv=YtcPR5YX c=1 sm=1 tr=0 ts=687cde43 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=D93cZsf7Dk1NQdFOo6kA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=956 suspectscore=0 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200117
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

A7XX_GEN2 generation has additional TCS slots. Poll the respective
DRV status registers before pm suspend.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 		val, (val & 1), 100, 10000);
 	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
 		val, (val & 1), 100, 1000);
+
+	if (!adreno_is_a740_family(adreno_gpu))
+		return;
+
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 1000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 1000);
 }
 
 /* Force the GMU off in case it isn't responsive */

-- 
2.50.1

