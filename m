Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727B4BC1F9B
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AEF10E6EB;
	Tue,  7 Oct 2025 15:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iT682xzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065EA10E6E0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:45:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET4XV029333
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 15:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=uzC6cr1XmyHJvxN5ZCqD/yrayfmcb2xgD7c
 8ae74a+w=; b=iT682xzEE0IdScQDAs7Xavxv3f0RNz9e0Jg+46gaYyWmGVSS6cT
 +JntuU4LRxgPF5leBnX2lbtUZbPn5XwzWsqvgfk/6zGYIEdZSvs6JAmAt8bQU2pr
 47sV/QoY+jGbuqLBVEdM2UB+LDcLnDwnAgv2EzqCjDrx4Rm/Jww+5J0n4JwoWhrN
 2Va3DZovDM4RVstzjKYYxQ7+Oiir+7VgwzreeBohiQ1F79iC+dt2XrvbjwP3qDWT
 FYFwLKBglUqzXpibwW2uTYuU6qNJH6hCp00vUHxFjDRDo9h01QkMYcT2+TX0S+0E
 tlH0PoenHQYoxLvBo65ZVXI6NLtK5nGaaZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkptkjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 15:45:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ddc5a484c9so163738581cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 08:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759851927; x=1760456727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uzC6cr1XmyHJvxN5ZCqD/yrayfmcb2xgD7c8ae74a+w=;
 b=ATwQj9GWkyIk5r9APjvzVjjqZkQkljXqASwNahm0vVplY84K6x+SH73Qg9IZ8iXcMm
 ethL6QT0wbmNa1PGvTsTd1YBPCqiuajd3RAvOV0Yn1pAY89na2EgsNZKmoo1Le7L8Ngy
 h5aJEPjmptqGzJCtL858YgJTBcv5esypv3d0wL0Nvm2UtpAP6Rg8eBgABRCaxUD513hr
 YTp9iNucN0QL8QkaKDmr+9qcPXUJFnhKJeY5U+kmGWjFAGb8ehuV8AVNyffoqbrrlYsG
 fm2fwVSbU/G09a+YgBKjvjlXvURLB6rUNCJhQZd6fR7HcvDLC/fD3s7WuEfZEaLTuE44
 DwHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUShNVlOXHSFvDnqfLHkKmFoItEbN2njUxFCHxwEm9KHuOZafLi30HsypuXGcgsICZ2Rct8/uIMuRg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIEkPLQVtKpCiS2CbrBN6WEHgcdqgv3yWqgYdZAJeN40sGj3Wa
 unLaBZqTRi7e88vrdtLIXhuJ/5cxuI73a7j+Ia47KG7tgQRFV40pXYF6fCvQmKDUBLbMpp43Z2r
 4soAPTC+WVE3ZnQMIw4Ttyer/VAIWtgHpvkOyVTWPKIkssmAcEMh4J7EPX83z89CUXuujp/s=
X-Gm-Gg: ASbGnctr95ewm6pEBFsLrC023XUaMF4CxxSLjJSBg7gn1/ag6YsLsdW3xg/olcWTjC6
 AZFYIKykH1D/nDqnPGcecyWMJawuLb6YnPJ2pRLpCF4xzqiLZb+Kbns4MYhUpGTzMy7KTztZnsY
 nmBAaiterHbjcaxI5LvRddagJshQcyQOlfv4hA2pP23rEUYIHBOlbeh+sWQnccDGUm0lDTmgLuq
 DSnmQgelA3+K3MRn+wJS0ptZIw+OpYrDsD4NVqZ/U1EcP3L81tojlOIYBPWhSjcWq6LCsWB4Goe
 T2CAM3+aT8l+A2yBu3jN08XPTjQDWh6uMUoO6LdEPJRRYkvPDSO5UddiOOmIT7ijOIcu7PygFOw
 kVTR0Rul+QQ==
X-Received: by 2002:ac8:6f13:0:b0:4b7:95da:b3c7 with SMTP id
 d75a77b69052e-4e576ae5e78mr211662431cf.48.1759851926898; 
 Tue, 07 Oct 2025 08:45:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt79x6LJ5dCtqfIWhwe8WAQwwI9bDIhQG7xuS6ZPYBCKrhtE+gFeELQnmnrZrLECs1V5wL8Q==
X-Received: by 2002:ac8:6f13:0:b0:4b7:95da:b3c7 with SMTP id
 d75a77b69052e-4e576ae5e78mr211661551cf.48.1759851926303; 
 Tue, 07 Oct 2025 08:45:26 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b30asm1467957566b.59.2025.10.07.08.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 08:45:25 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Include signal.h in qaic_control.c
Date: Tue,  7 Oct 2025 17:45:25 +0200
Message-ID: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yAH20Y9acftO9ZZrbnkYKT85LNJgVW76
X-Proofpoint-ORIG-GUID: yAH20Y9acftO9ZZrbnkYKT85LNJgVW76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX8cqOabijZ+TK
 xPzndVEfJeTCnXzbuaTKo/Wojjy+2/kmglllTE31V0nijbVlSPsWlvTISoYWNcqiflRTrRdhEmR
 78oZyfYBJ/je7sRSPDb+L3aV8f+q2ya994eVrjDeQ4u90mLjxf9gA3ZDSO56TF383MiQAmYqQB3
 kp8rD4l5mZ1IS3dt1ez2skeaujlslcYS+zCO3ViQj4LdGSW31+1jEb6tBumAerC4y5vVRdZSDjT
 34XpcOZCNDq0/hUWhuTFCW9HsqB+Mvs7CfopeBl40bl8/G9GuOxNAaNauLbz+hYpof0KGAhFRB4
 FjYUf+fRXaBMaipWvNcffYvQsLvkxJ5k6M1Pbk8DM+FUWBYlfR7IT5dXF1E52DCydw3wwPqEOKx
 AVK3b5Ypprr/YliSVp9tLXegKzxdIg==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e53598 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=2SYoI0-8wfQ5n7FIWCoA:9 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168
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

From: Zack McKevitt <zmckevit@qti.qualcomm.com>

Include linux/sched/signal.h in qaic_control.c
to avoid implicit inclusion of signal_pending().

Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d8bdab69f800..e47a48de7876 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -17,6 +17,7 @@
 #include <linux/overflow.h>
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
+#include <linux/sched/signal.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
 #include <linux/workqueue.h>
-- 
2.43.0

