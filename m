Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABF2AB4A80
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 06:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AAD10E0B7;
	Tue, 13 May 2025 04:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyERwcWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA4810E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CGv6OJ023741
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=0Wt0GbBUNwU
 U3CBX0BKb99qSKLR+tWyMkIzj1AQsy0Q=; b=fyERwcWyxHKMuCu8oqpW3wonN4B
 9+mQ1tI14fOldzaUEmrqzTsn2qabSdnVCBtrNDL39guRPjh1A4ITtTgUgAL+ABwP
 PgqyOhaIFsUqtGfXYti67R7U2TE6vQBxD6sG7Yio7cia/sdM1OeHggJUflYeTSWx
 1h137inJP4oTVAolZ/yI29NrKreEXO5iXeQ4r+KIbPnDrzdhwGCh4u1SS6M/u+Cs
 q1GGJxfILQMmWFjzcKDmU3GQvEEQH7SkP6JCAvJg2xzJPA0HiuhgVdzB1pcTdnmV
 yWXZPup/XU5iMQWnqocsOQiDBVF0HuW7qF9GQODGv3JK65sIjllO8OuefNQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kdsp2m90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2085f3bf5cso3043168a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 21:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747110513; x=1747715313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Wt0GbBUNwUU3CBX0BKb99qSKLR+tWyMkIzj1AQsy0Q=;
 b=XnF5atro5R39PbsKnwewEanTb6UCDeUWjdj2Yje5QIPKnPxjot700dIlFHZKshTeLo
 HcRct1Gj8vPTDa4WAnrKaqTlmpZAF1lOpum841/GoHVF5LJYgvpirYOYsMCYbwGF+Ou2
 vp8kexC8RYbABdVz4Mvg/dfgphEKdB5gjKDrjKYBOIv/H6298BBSHRfcKJf3+piKfyM9
 LhjiXgRHKP1wQTvRq3YUstRQjvt0jnj5IvqNMroO6N2CTznROr9SJbA3PkBvwqxbukv5
 sQPm3AmV0WXLuVW1TPAc7ED211JAWwuR/w+FF45fDBAaygOTPxsYto7JNwdSN6ypMuBu
 Q/Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjHe2otXjNhRcxCbvKbCPMZRHK28qJfsL0S2s9EJM8N/c2l7VeOTgdMl/0ZoGHmpYYA5cT5nW/8yo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+/fQVl5Br3kw2IbMGTbh7AYECET3vyFm0QXJ98Isw13yTNO4h
 mxaODugb67TCVGAl18zYcYI7PmXE0C2zO09XrQKnKGPMdTfKJR6KnhjS/4A8h2klPalZKTWJ64j
 nH89cy6twoA7NZtk6RCAhPFzcD2FOGZPSr8UZxj99uu+Oey+PP/M1ClOYGOxcquj+5K0=
X-Gm-Gg: ASbGnctgNaxzCBrKgq+eN6yTsMHG9eFPDSvAJRY51tABKG0NQW/qSW6XA6zVVPJuzn4
 zwSU8n7E2cVK8raJzovmdn7g0Kr0JdUPspWHWQBdUltaQBSHDEGQ6SnQiit+kHAJDMr/pl7ak0J
 E6/vDi0IqNgmNPMsDg8w2TKalwoGzjSZTGQnI2cRya/1oMYtnVhwPspaTQamlKusUUj2Z2wOa3H
 SBPlXPEg4s1vDf1JQw/ecUHos+KKcgy3qp7CGq0yLLn3YIuWYK7K82nPgSr+34CjzHjPGRty0zH
 2pxI9B5FK7uTOn7h30HPJSh38ocOd685+3TGIXfthsrQ
X-Received: by 2002:a05:6a21:648c:b0:201:8a13:f392 with SMTP id
 adf61e73a8af0-215abb3a036mr22831424637.20.1747110513042; 
 Mon, 12 May 2025 21:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtAZDS57gaeo6+l2GKtDyxXJDhvCrMInic2QuKuXWsVSU5v5nDoqK57ZyLXWaJ0MLUYJUb+w==
X-Received: by 2002:a05:6a21:648c:b0:201:8a13:f392 with SMTP id
 adf61e73a8af0-215abb3a036mr22831397637.20.1747110512674; 
 Mon, 12 May 2025 21:28:32 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 21:28:32 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free to
 prevent crash
Date: Tue, 13 May 2025 09:58:21 +0530
Message-Id: <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SLF_IWcMW_2sd_jRzmfz5vqgC9d47LYX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOCBTYWx0ZWRfX/+XWvQHuC4+Q
 uyYxkHulB/U53G5oxaEiiDGXs88zZrOlxzD0NigZ1LxhZSEuXqlyxn5fU1PyuTVc079Q0OI91Tx
 7gqkjQJARZRCnBydxtQSbAwb+hfP+gDX21qaBZe2c3nHrn1AXWjKUH609EyzZP67tWw5uMbMtKy
 RCo8s6ok6F0Op8tgYKa9FgRfysaHZestynDfuzvW83gfkwmvUw9Mdi3zoceqqfi/1br35nWHIj0
 Zd+Of1rrdryjTgchiVQnFeFzN6eQ3SR7k37E2wRQn7EL+oXIQkOa/gMQl8kwOsQl5p+dLA2YkHg
 I9Pwf65pHG5yPCROMA6/neskdLMfOVDTMRyduLBT2wh4mf6ch+q3OgkeAzFu62IMz8mo/Nd+L59
 tWnF6AqsItdAgcwmOYiLUS7JF/1dDPshUnofOCrbYtShVj5YNyBXT0jh4VOlH5WbkqbaKSc/
X-Authority-Analysis: v=2.4 cv=TrfmhCXh c=1 sm=1 tr=0 ts=6822ca72 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y_gjuFtE12-Q3iuIhokA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: SLF_IWcMW_2sd_jRzmfz5vqgC9d47LYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130038
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

The fastrpc_buf_free function currently does not handle the case where
the input buffer pointer (buf) is NULL. This can lead to a null pointer
dereference, causing a crash or undefined behavior when the function
attempts to access members of the buf structure. Add a NULL check to
ensure safe handling of NULL pointers and prevent potential crashes.

Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7b7a22c91fe4..ca3721365ddc 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
+	if (!buf)
+		return;
+
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
 			  FASTRPC_PHYS(buf->phys));
 	kfree(buf);
-- 
2.34.1

