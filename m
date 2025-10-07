Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD804BC15BB
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 14:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD2E10E037;
	Tue,  7 Oct 2025 12:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSVzVfNP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D9E10E037
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 12:23:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973aTGV019977
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 12:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=aiUajtN5GWzNUWiw1YQ9LlfrYjjIOfa9LPl
 jq0wLUa4=; b=FSVzVfNPyDtjh3kpjTi2oudwPh+omZKoIF7D4eGi1iq5LNDC2jV
 pOVuNkCWTkNEoGyidm9VxWVBvAe/lIupEplIf02onITDHuED1YNPwg27shpdQICe
 OlSND058hr+mdxXyJM0zji7zfUhZw/ddMb3N/LxXqEpRjYtJYBwgSUzF/wUlSCe8
 lMWus+jWg2hqKmuOX5VAxPMN4hOWQIW5Dc+5R5tfCeb8gu3IlnBl5RsZhPJzXJSK
 5CvuoKXx6F2/2LBZ5E1e18bo4+SNtpIOabvVEeO/WVL4073bwqgSerFLeALow9Yh
 7+xJFNs3JY+5c/j60Nstb8crwrYTkf+beaA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1q3gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 12:23:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4db75c7fa8dso154835171cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 05:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759839802; x=1760444602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aiUajtN5GWzNUWiw1YQ9LlfrYjjIOfa9LPljq0wLUa4=;
 b=q0maHLkUBSU4lATW5LSlNAKN88kpqo63o5Yed3XRDagIE5QQt6HhDpTzGBEWWAOpzG
 jbYBzIuZVPwtB7RItQpVzAlUhD0TNNWOi54FWoR2GFVn4o1YuUX59g4vcwwRU5YZpOaA
 HA/CSbMzgAvxeK+a2Wrpp+oIgAelY7O4xwOFEj9ZlqBN62/WDdaYqkFjoz4V+4fvw5Gx
 lGvb2PdUHc+iZ45S/mY1PSTYgnP0rQYfRHtitYDZ6oQILfyXsax0ZvViajw+dfuwmNO1
 ImsWoRR1fc9fA0DDWEHYcvuWN++BPpzCP52SHu2vT2Y+jNMebSWhM8sUBwIjQHAGjgbn
 u5wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQtJsjI/HA4dVbrR2+ZL2iZmfa4DpEmt5xNMpuDa/fXLL5TrMAnvA3lpCXpausIyymTat2MmQImHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrX9xD1wTButm8a4L2R+RJpFlxeoM2AMOW7xospIWBoeBsLFMl
 BmvKIhVBGFqiSsrAM4s+7UVLCFy2GWTofn6JVJSicUpUYq9cnXOHEE4GkDJnKfoe53O0wozMiUa
 KCHxiDMWk/2jkGOQpCpjkof/HgQgzEcRVY7RqOdjWZsYMiN+edNKpIZq1ivYO4RbLe933tm4=
X-Gm-Gg: ASbGncucuunYtC1iz7v9RXhAzbaAiUgLw/ErfDAnN93dEypgMVRf4i/0ACtTHJP+EeP
 hg+H/MXHQ9vPEmtVuua6st0K4e8AC1NrgoqdzF25FecEKlPeUV3USIW8kaPlIwXTHdOdxxiCI9o
 87fEJfn7LYdujMvT8eEBwWYKh6Vm5gXEX8LGSzyzDzNgOUrRVPntYe4JQ3uTbS1YdofqVkrn2NP
 TEwRiVfUZLJtenhuRjfBeRMGIrL8AUvbqhiLYm+6cgX6F7nX9ZOo533ciBGayjX120JtOm+MkVm
 p/MbkSVkaOwFfPXeWNnF3cR+6X2tGQU5+idDt8V7qgK+vMxPr2qa9yxwB1KLP48yZLdh8Gk4vqa
 JF8AOEgCV2A==
X-Received: by 2002:ac8:5885:0:b0:4b5:fa2e:380f with SMTP id
 d75a77b69052e-4e576a40192mr236425611cf.27.1759839802338; 
 Tue, 07 Oct 2025 05:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp8uERkIS0UsyK3pgHpFGQoon2cJaUrFYaGhDOjwk06qRqCcd7nXprkJyekAiWSuRXYWBqZg==
X-Received: by 2002:ac8:5885:0:b0:4b5:fa2e:380f with SMTP id
 d75a77b69052e-4e576a40192mr236424921cf.27.1759839801648; 
 Tue, 07 Oct 2025 05:23:21 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865e77427sm1408179466b.36.2025.10.07.05.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 05:23:21 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Treat remaining == 0 as error in
 find_and_map_user_pages()
Date: Tue,  7 Oct 2025 14:23:20 +0200
Message-ID: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zycA0CP-tdFlrzAmh8DA0FIXotxE3ms-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX5JTsiHdZQgn8
 1hTmF/BIGAIH3I3730BqweJCGd4A9bJXBtIQIfcTh6iIIJOiqNyfUvECtYQXnXu2qoiHjOHiMjn
 miqXTPMQCFhBPKQBGljDcX4MvdDBcyt/IL8Afyl7hlEd46unBXsqdr9J0mT5hSC2U+0SBctcLfb
 YKWgqs5VqOEgG21sHj9Ta6gD9AtfwM+WkBzHOwLTj00uIrrjdh6/XtIetQWabYksh45RuRkbXw/
 erYGIc0BeLAphTAcDgXieJ3Jf1AiVnoSYGBXnBxA6XgBEI3YpBGVDkD8JntWbJUMv6UZi2cKXhw
 z7kGUcIMfolLb2hVSNeFgnPTgq/9bMFI+BMz5hMhtZvD/Od+qvfby/IUmihdCz3eh3DigrSrrKM
 OUpdN2B774qpT4m7E67lI//kHpymAA==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e5063b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YWuMGPkJ6SgHaI83TUEA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zycA0CP-tdFlrzAmh8DA0FIXotxE3ms-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027
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

From: Youssef Samir <quic_yabdulra@quicinc.com>

Currently, if find_and_map_user_pages() takes a DMA xfer request from the
user with a length field set to 0, or in a rare case, the host receives
QAIC_TRANS_DMA_XFER_CONT from the device where resources->xferred_dma_size
is equal to the requested transaction size, the function will return 0
before allocating an sgt or setting the fields of the dma_xfer struct.
In that case, encode_addr_size_pairs() will try to access the sgt which
will lead to a general protection fault.

Return an EINVAL in case the user provides a zero-sized ALP, or the device
requests continuation after all of the bytes have been transferred.

Fixes: 96d3c1cadedb ("accel/qaic: Clean up integer overflow checking in map_user_pages()")
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d8bdab69f800..b86a8e48e731 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -407,7 +407,7 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 		return -EINVAL;
 	remaining = in_trans->size - resources->xferred_dma_size;
 	if (remaining == 0)
-		return 0;
+		return -EINVAL;
 
 	if (check_add_overflow(xfer_start_addr, remaining, &end))
 		return -EINVAL;
-- 
2.43.0

