Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70692C90DD6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 06:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B12210E830;
	Fri, 28 Nov 2025 05:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ln56N1Vl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXtECh6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6173110E0BB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:05:51 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AS2KOCh288811
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Hu64amW9A5E
 UX9Pnd9zYE8WBf7r6f1Os8itmx4PIfI4=; b=ln56N1Vlnp0qbxqXBTRX0VQLx/b
 dPkeEpeLCuamqXnIGjWgly5bImd5S7g1HzlCTeoPAx9onS6NFWu7///bL1QpE7uk
 HXdsLfWgitXzlqZcx8hxiymTuYIYptVGUlMMnKi95XnDUtxyeaSoOHn2X/imrXmq
 3j4recWWflpwkKzalHsluJ/NHMrCCFGSLx/koTlJgHNVgqF7l0u+ha9alTPGRdR4
 eSdnDSKGXEG4oynDD0Kz+IQ02+xVHk1TFgIxMZuOPKkJPnDxnNSMVYZEFF/xYKby
 mf+rep1T3NubnQ1eCei5DzdM/U4utErSCz9CwOO00wS0zqzSjs+l3UnTnqQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxj3ua-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:05:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297f48e81b8so20586325ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 21:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764306350; x=1764911150;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hu64amW9A5EUX9Pnd9zYE8WBf7r6f1Os8itmx4PIfI4=;
 b=HXtECh6ao39v3JMHLyDyMtrTM0Pc64Fsh8R7jT3llvrpkI4ZxUb6YoOY8r5M1eMNgJ
 nC/8WJ9oi1luMpKQW27hp49sXcwuqPYmJzMS4xLakA/CSvu0G/fDX8aKUT9p+dT/adz7
 SKZk4TZZzXR//ITlxztFJb1VwZAfLDr8PJiHfiLTRbvd6yYX+O2M7AUilEqwjWHVqlD2
 jmEj4gh9FUfdT5x29RNR+6+YlaFICZQ6DvPpbsefUbnVCAR6oIiFqiuRsdQPGhXlnETd
 kRGt2YDjdez2QYfHxuSitYjADAXakaI7g+29nDc5JUiOa2VeieLIYwJc1MOEfNQ9kIh0
 qH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764306350; x=1764911150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Hu64amW9A5EUX9Pnd9zYE8WBf7r6f1Os8itmx4PIfI4=;
 b=MD/pfNq9U0CTobY26bRem52URu9F0CWFcB5730zOCIq0PDNFa14QrOuOiZ9HKA/2e6
 h0Rm8JPUsE9qhV59TzP7D+60L+5q+qbeNC7EXcbPknUTTCytVkwuBIFxlPNfSqy0Qk89
 ORikIKuxxqJdSthpI6wMKn/ezfFn89bJWPdv66pN0s8436fwUQgQUTtigglPHuVz0W3c
 BDWIikDhKdmuTXXapFcGn+CZBECujYchXvmtSKlarKp28MVjaJU2VfqmLn3HJl8iSNrm
 Jo+fMMwr8TK3OQ0+YrFBxRsn9KfVzTfIKo7biDGqPqII+keM5mdeDEmwA+DVIZ6btFwN
 YvTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLxwfLjCrt+MzU/GPanbsqF1f+QON0COsaDOmUNWM5Qa7pKCjm9EsxkQLafq+ntT3pYForUlc4G4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoVWcw3FL1C26hXq3APJ273dwLiRoS/3o7WjNAliV/WlUl6Upu
 9HbZsTdNlJCznlGiZi/bpJTvCZKdj3ZQl/Gwgst84Rfe+6Isn1dqbh5VmdAM0L6CTX3ALZ1VHcw
 ryCoviHCKbXaYwtSCxM8UVLtcPMg63mjcjxy3mRO77A6FxO6lG986TRI9vUQjvUQ+ucbfsAo=
X-Gm-Gg: ASbGncvbCae1WkvZwx2FSkQULh5IOfTJXSjUa3IAZuZ/ZugorvEr7Y/7Q14sljfd0wA
 w1xGqVnC7lZOPcbAz83cRSIMt9Mssxb5VElPrelILyq9DdIqrTMk+1xXOlt37MZQ/NGzPG9u720
 cakvYMLrgjQ4Uyuwu7IiT6oE9rrARGJ3of6aBq7N3n9j8u83GKzOOttU/FGCZNuO5sGoKqa2vqC
 iNR4zWntTfefTmICWj3LBbxUCFVlY2tg2NBqcnB9AW7iPVxPQnaKXa7NMp1rw41bytrokKzaLzG
 MxAzT3i1PEkdowFL8XPxucnWxD1agPeO5VygGqwl1nE1gJ3ZhzPxMWoDuUZKSRnvcIEpAUABAja
 SGVvYaCW0fdvCVxbLlHDG4OpAYxkbTn61C2NNqBIGlA==
X-Received: by 2002:a17:903:166e:b0:299:dc97:a6c9 with SMTP id
 d9443c01a7336-29b5e3b6b04mr292120555ad.20.1764306350176; 
 Thu, 27 Nov 2025 21:05:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnZPuuDoNqGww8zARhrgAh0/9U9koXPe5CLxH+oUCH41mNlEOVmh+iC6IejsR9qbfAwOOBrw==
X-Received: by 2002:a17:903:166e:b0:299:dc97:a6c9 with SMTP id
 d9443c01a7336-29b5e3b6b04mr292120265ad.20.1764306349517; 
 Thu, 27 Nov 2025 21:05:49 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bceb40276sm31952075ad.73.2025.11.27.21.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 21:05:49 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 3/4] misc: fastrpc: Expand context ID mask for DSP polling
 mode support
Date: Fri, 28 Nov 2025 10:35:33 +0530
Message-Id: <20251128050534.437755-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
References: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=69292dae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ou9iVbgrfxuWbo8UQ_4A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: SzBH_DF_vvotV6giJq6W4EEvGAL0givA
X-Proofpoint-ORIG-GUID: SzBH_DF_vvotV6giJq6W4EEvGAL0givA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNSBTYWx0ZWRfXzVaN/wyZebZM
 zxJlfVvY76yE/rDrH5g4dyfrmJJnIZWnK56IKAsfE2qK6vk9AuJTimyHezOf1V/d2tHv8po+eli
 C88hiZgQpw7k25MGX7MV3DnaByzr7n8SGEAqqeLUeJfWmKWMSGADDV8uNqtxGEYRxyBWBn6UCQY
 E2Q4vKZjIGEogZ9t3mrQjHjqPHOgd44NRhJVT3yVU9853KpJjHR57w4D/SRlmc/eWFoiJXd8L5i
 5GowQ+nqaMVCWnr2vV77eGGeN2nStTb7qjMNe86FbHVXHGux4/TcPIWRmIdjtbxwniGPzajx/a2
 z3mYCvrNawFW0J/a2FMSHMUoulfP+ggF1cJGx70gEsw4mzRnB1OiZjO73uh4u0mfmBc08gTzC28
 UWpTILraNZV2bk+dJ1ZzapVvTQFAqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280035
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

Current FastRPC message context uses a 12-bit mask where the upper
8 bits represent the context ID from idr_alloc_cyclic and the lower
4 bits represent the PD type. This layout works for normal FastRPC
calls but fails for polling mode because DSP expects a 16-bit context
with an additional async mode bit. To enable polling mode support
from DSP(DSP writes to poll memory), DSP expects a 16-bit context
where the upper 8 bits are context ID, the lower 4 bits are PD type
and the 5th bit from the end denotes async mode(not yet upstreamed).
If this bit is set, DSP disables polling. With the current design,
odd context IDs set this bit, causing DSP to skip poll memory updates.
Update the context mask to ensure a hole which won't get populated,
ensuring polling mode works as expected. This is not a bug and the
change is added to support polling mode.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f7fb44a8e9c0..222ff15e04bd 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -38,7 +38,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK GENMASK(11, 4)
+#define FASTRPC_CTXID_MASK GENMASK(15, 8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
-- 
2.34.1

