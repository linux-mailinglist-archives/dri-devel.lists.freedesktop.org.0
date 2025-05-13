Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F5AAB4A84
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 06:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1EE10E2C3;
	Tue, 13 May 2025 04:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBy3rIC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF8910E2C3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIwwdi010230
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=80VSBrnaMRJ
 WWQG6HQKfwi1RurptGFsnclEszCS2EMo=; b=eBy3rIC2NAX96Zdk7fuJsOzUt85
 6ifwrIy5+rpygd58PYr8tVmvWfS+Cpto09Uu/Sa1OU0/7jmYM1pcq5wkupMT+m5r
 Mh9aVUVXLCqTvmM8k+IVIDE1m6IUqhf9PTw8mwsihps3kPnlMrNOvp1mauVIPkYx
 JlLFxJaYTb0GWnVc9vpOak5iCMQtb7Ldkg9HV8ctBlFqfkZ3Z7a/i8vf9uxhqnso
 6L3AGbHGk+lmwHU+nqNwsqKkgccFH1XnUUsh1ZEg1RrAOmuROOZQX5rfcADN7t70
 XMiF6GDxx6KPYMoos1wLT8y1Kw8MznrGSxTmwOWP7U9YAHn8jS7ePRCqWsA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hv5qeps0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b115fb801bcso5624989a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 21:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747110519; x=1747715319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=80VSBrnaMRJWWQG6HQKfwi1RurptGFsnclEszCS2EMo=;
 b=giNhHm3Iv7pAtYp6okYuzdnjdf4tW9JlSJwJrGOHfxt5429YI28PUojUnrmNSTfkvN
 o5+GswvXP1IPQ3CE9oU7RgwPBquz8CUNGURZ20DYN4vvIFdclhZDvT/Lsxu+cgngJNug
 FUxkxk3ClqF1Hsn4fo9IzG2OY4lFGdtXpHn79xf0M+zgB6sB4RPIGHX9UXKA1egmbshY
 O4f7kjUPMgaIPeF0/zkbheJ7xh6qfQU3ONU/59i1V6XOQ03HH6nuuDHxZDi7xNFs5O42
 X+BUSy9QYN2tTCvR93uxM85C5OsFwbStRlxYrqztk+7RqSSmLgiP4MLmNpdPlCzYxoTN
 LOlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6CNLgKDKL1fKvPn3L+KTVayTmYBOf2Wy5FDhW6Lng6osBGWEMYZpbr1F+O2oQ8RKY1jE1vVQ3Ilk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1K3iILlZzYV01iMd27nepvYNZQpevyFpkKnn0tWYeQewU68bW
 qav2Cj9e7qq1l/M7MU1SCTRHcHMykRUK9eh6s9SSFqQ2e0HlnVTTJY8+tDms87KZChMacqZVeZa
 Xcldk04NEDyYDB10oLZGdbCgASFiMJS9+iyT/BuUEyF9FzWnGJD/u85TsEtSqZFUtyYQ=
X-Gm-Gg: ASbGncsC8HKhwtV/HdEvS5oJM3mEokdhuyPmHuUvp7zpFcAjxpKhywx8o+G1f47HRrI
 exnXQsTq+krwBV3Cl3o4CrvS4w61CL/UrnYFlcpMjX2/HDg9VvGX85U1lrW6cntKr8AEvsF3Chq
 IIzy2rk14yy80VG+1O6LxQ9fwKT4D1C6xQnNKiTAqTQDZH1wCQS6HOn35cuD5rGnJq1s+8i1pS0
 iiF8zPlMS3EaKKf2BUg3e1OFB4SKAaFSnbwp2q1CLdWnQwD3A8eBp2iGLc7oVECh1QAe8IKG4tB
 GtxWHyfdDDCrFROJxuy+P64Kwd9+OUBsdDBeXqHLtdvO
X-Received: by 2002:a05:6a21:458b:b0:1f5:70d8:6a98 with SMTP id
 adf61e73a8af0-215ab883667mr25224176637.0.1747110519627; 
 Mon, 12 May 2025 21:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkhTKa1aIjIDArtHetshGQTFyREicJBCEr0fG8qbpWn0Htg+JAbubSWvVsCfvyg9O9E3J4Ww==
X-Received: by 2002:a05:6a21:458b:b0:1f5:70d8:6a98 with SMTP id
 adf61e73a8af0-215ab883667mr25224141637.0.1747110519205; 
 Mon, 12 May 2025 21:28:39 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 21:28:38 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for Audio
 PD memory pool
Date: Tue, 13 May 2025 09:58:23 +0530
Message-Id: <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DqtW+H/+ c=1 sm=1 tr=0 ts=6822ca78 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l_23c2mIThvE2ntJpuUA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 3w5JDf3_lxavnNGhS1FC3_Yn3uSem5yE
X-Proofpoint-GUID: 3w5JDf3_lxavnNGhS1FC3_Yn3uSem5yE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOSBTYWx0ZWRfX9jnIEz7tdSFO
 xuE94afX1Hi8+kLzzgtOesWHuQrbH1Qc3J7rBnsbtyRUiDCWbk8Q59V3L1KgvkkNoN4nOsm4inS
 2e+iOS//idnGedguhJZ23hIth/+d4HCG1s/aLa9v/FVjuAzvJ3mQkl72VWbavtnY0jVLIx92vH+
 dj/+AVMPFSwK+Ptpmkc2lJR1cwRL684I8Q5Mzd/2ZUhylMyV15Tr5p29PWujZRJxaMKloUi4Rsy
 V4najYVO2y2b2wrnrH+UOuf2bRKeGupFEUPEL3tJKd/cwU2/+uy6VopisllNhr0yu4IBiraJ/Qn
 2c4nBm0zxEeuVZOYt8LUjFGZeCQfVYhs6+GS5OR+SKt4ea4DcurK5Qs+dMy6sR0+oK+SObNrHEO
 NVwMC2B8GjrjhTYAUi8a+tfqrWuslcSQw/CsfF1j21kGpFR+MZVIf1C3Ng0xoCDTDo2sAaaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130039
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

The initially allocated memory is not properly included in the pool,
leading to potential issues with memory management. Set the number
of pages to one to ensure that the initially allocated memory is
correctly added to the Audio PD memory pool.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4e38b5e5e6c..b629e24f00bc 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
+	inbuf.client_id = fl->client_id;
+	inbuf.namelen = init.namelen;
+	inbuf.pageslen = 0;
 	if (!fl->cctx->audio_init_mem) {
 		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
 						&buf);
@@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 			list_add_tail(&buf->node, &fl->cctx->rhmaps);
 			spin_unlock_irqrestore(&fl->cctx->lock, flags);
 			fl->cctx->audio_init_mem = true;
+			inbuf.pageslen = 1;
 		}
 	}
 
-	inbuf.client_id = fl->client_id;
-	inbuf.namelen = init.namelen;
-	inbuf.pageslen = 0;
 	fl->pd = USER_PD;
 
 	args[0].ptr = (u64)(uintptr_t)&inbuf;
-- 
2.34.1

