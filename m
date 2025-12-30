Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D4FCE8C98
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 07:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572BB10E82B;
	Tue, 30 Dec 2025 06:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQGxbrp6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfKeP69I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A0B10E82A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:28:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BTNQFqv2578005
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=6T5aBckh0Dl
 dCBnlx57e6ydV3fyOJ05veUQnGzWVFO0=; b=aQGxbrp65iZCXljc1vAhXHjTo2o
 gEcN+fgWSQZNiUk7xonF5nAzcBBR8oXO9iVxoptjwPvv5qzNlE5oUSJEqpRBHk3U
 5YY57RULM0ZmV8hSUxj3UaB/wLPsA6Ak8tY6IzP7eAl1BcoAhnGhJHq7D/w2xwWo
 OIPOQlTNVSoqL17MZGasU5fMt7767O9pDwQ0IMZ+nri4RJH1RfFBcCbM2Ktt/Lz+
 D8K5XFhcP21iEu2Y0DZB/K1z3iIlfRWMeIFXy9+1sn60WRmNhXhLo/uop88vKLQo
 no2Rdo80ybORFYuvQikmQGsAuldt1oCGqH1x05NesSzSriiBhJ9ja0YTPDA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1aa8f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:28:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34c2f670a06so12535130a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 22:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767076127; x=1767680927;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6T5aBckh0DldCBnlx57e6ydV3fyOJ05veUQnGzWVFO0=;
 b=XfKeP69IwGBDfajaDT82sObFDVJP8/i24IN0I72cYBaGG5NZY46rMuwkveqI7U5p1r
 LUqLTIj6nFt1DtjjoMJdceajydNsc/F1YE2eN4gdGiGdaIfnbxexojq/bjqAUEGWz23+
 jgeybcDZWK/54LHiJZqKfN82IP54EvYcqFgBohjL+D/0Iy23qojCncWfR0mFvkuRglgq
 xETrzD4jk+AYyvL1YqN1p7SmfRS5iOxANyaHVmaPqqvdg1nvxDQ8mYKzs/haqphXyh/U
 i5+/W6gPKw+uGGUe0s1hvBalgAVsivaFExviDI1/ihEhMwniOxTUmrI5R4aXQ801O8V5
 USCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767076127; x=1767680927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6T5aBckh0DldCBnlx57e6ydV3fyOJ05veUQnGzWVFO0=;
 b=wHnapQ6Npr8UJF/PPgCWQ4BcGzogdIrQCkXarhA0Ou0HcIzWMYt2FZ0tbf08D8jPYU
 ha4TLb3K+VIJ7e4qL9N7gMuHPD1jG9H7LKFz2PjVWJO6c9J6RVzwYT1mHnL/gm3GtIEX
 T6rXIiONHT61PL5YyJdAIOFv6O45oQcaB5QXYbWdP2D2L5q4mlE2d8xbqK2APmRMvaU8
 afoSWt+HTd6xagwvg8jEAyFyZyqYn1gWjeAQ4H8cixAqR4UfbBCiL+/bjIjbbM3C/TQd
 QvIYt9EKsW11c+6d2zMVAU9uD1qPuQG2qfUx3rvQocCVAmzbbO0SDIUuJtWP0Qjec5cB
 rm0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWheXbKbIXQhnxkRROdlNvWkdE/Z0yiU7X7x6n4/VXQk4Ot6hLk0DDfpjy2oItBgWCnG3jtEElS2k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwdUJmS8BVVqPtvhAQ/407wAw08N2vIl9OkuV624DqNkG66maB
 sGIZN7U3CkSGMx/ksr4aZPfEc7F2w5A9tl4axa+LGAwwlW8yoWVVmp11rT5Jsjhau9CbUWoZVx/
 oLiyVV4spVXzLmaKOS2FbHeSe6uGKn/XWO69TuH5UUEInBUxgARUBN14OM/bhQjMGBybSm7w=
X-Gm-Gg: AY/fxX5JL7/0XQ+Wzbzfp62OfIPFE81x4sw3kwXtLmrFQplYJ9fVOx7B7okJsIJ3ug7
 hy0kh9lbnOSJ2aFNcCyXZXKD2r3ryTIfXHJmw48tkR57lJ7sIUBX9G02EcGy1xJnYSWF7d+pvkI
 665tOut1Oy1vT5naOZISbKY8b6F+jfxuGlrbHUg1qhoYyaTyNgaPOeBnChquxMDkK8Coxi/ExaD
 F3NeEtPNi8jJUHY9JBUZdAj1SuC4ErZdfWONDv1K8F2UKjuUBQ+aI5VLlyBYn0NA31L/lhmMj+I
 Oc3M1aYmTmicCYPPKe6BLX7bWpgbZ0WSVwpz75FCkSe3I5tIx9m9K5+64/lL8gFqN85diULe25l
 UgbPX0H/jzBK87+7mwRRRHJ3ypBDt7JKSane0vNXC3w==
X-Received: by 2002:a17:90b:1e53:b0:321:9366:5865 with SMTP id
 98e67ed59e1d1-34e921e9ca9mr26762808a91.33.1767076126764; 
 Mon, 29 Dec 2025 22:28:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRMe+2U/aiLSBzMsqrv/IRia8jR6gfLlAnG9kGH+caVyUtzCdyEPfhIhk0zzI4GLOuzMmuXA==
X-Received: by 2002:a17:90b:1e53:b0:321:9366:5865 with SMTP id
 98e67ed59e1d1-34e921e9ca9mr26762793a91.33.1767076126283; 
 Mon, 29 Dec 2025 22:28:46 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7961b4d0sm26491536a12.5.2025.12.29.22.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 22:28:46 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v5 3/4] misc: fastrpc: Expand context ID mask for DSP polling
 mode support
Date: Tue, 30 Dec 2025 11:58:30 +0530
Message-Id: <20251230062831.1195116-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Z4NpVppchDAahHp6-DtNSorVaHvyPAFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1NyBTYWx0ZWRfX5fMCHvk92wHV
 LNyC2dXI0epjI4kfjaJzP+ypmy7Zclny5Sdg+TpXuLamcuhky7gta9akiMsrPf3tVNjCfg0nQ8L
 amsA8kYILxueWY2p/bz/6BG+0eQWFQAi2elXrqtk7p9x2ymNI59pw6LPvju53dIfQcZkYbQQB6z
 NWEkMPYpTA9mFavTiroMRjf2xzw9KUeBzQfjdlxPdf3//NPWaBtGXi8u+9l0Er7Yjgtoo9NXhIv
 wfr4FWYF9RoU+uQE1tFZWjMJT/rSWhwj+MRDiRoVLZXZFJA5AQfblhdOogz8T9d1Wo5/Nv0Zttz
 djGO/qKarE2XDyNMvuvfMaynL9tIolbToNkX5QNEgDf8lyLBzOlOTgDQL8UhONp2b54O2QxrG0T
 43yGwUhFl/e2CjeEEDUEGV0AwR2yyknf7kJeE4ONbl8Jpqxm0KYrbLDbH6gXTSrfEKGtIUG46Ig
 WDx/7ofin1azlqV47DQ==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=6953711f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ou9iVbgrfxuWbo8UQ_4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Z4NpVppchDAahHp6-DtNSorVaHvyPAFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300057
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

Current FastRPC context uses a 12-bit mask:
  [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)

This works for normal calls but fails for DSP polling mode.
Polling mode expects a 16-bit layout:
  [15:8] = context ID (8 bits)
  [7:5]  = reserved
  [4]    = async mode bit
  [3:0]  = PD type (4 bits)

If async bit (bit 4) is set, DSP disables polling. With current
mask, odd IDs can set this bit, causing DSP to skip poll updates.

Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
byte and lower byte is left for DSP flags and PD type.

Reserved bits remain unused. This change is compatible with
polling mode and does not break non-polling behavior.

Bit layout:
  [15:8] = CCCCCCCC (context ID)
  [7:5]  = xxx (reserved)
  [4]    = A (async mode)
  [3:0]  = PPPP (PD type)

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

