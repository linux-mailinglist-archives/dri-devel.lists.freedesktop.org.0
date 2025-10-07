Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB02BC2354
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 19:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E97F10E2AA;
	Tue,  7 Oct 2025 17:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHWWecv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608A510E2AA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 17:01:34 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET572000438
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 17:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Cji6HN7EgrDN8yeGOTOkDfIAV0rhFg81di5
 0RD+S8AY=; b=QHWWecv3A46AtqXry6AdYHAd0ztFyiWzX+Tz8n3zIycONz7BeVK
 hlHlnnSwcVrgBwXNhgKfV2P2w2cjYLSq0V1mNoaibfzjjOc2Pze1FEA3OiuqZ87I
 EMkrmeWMT+a0LkhpfjXVnErlK2gQ/QwK5LZQy+nReHlkXQSpdISfX8vo1P28TXu0
 u8YXxeVzJE8ZlAt6fOVz4S19QByzDCU3pNj3aS6xRb7k6XdkrXgPymDkiLTMo9+A
 cp9NmwjuZqB6WXRHgFS3tEEy0HiVrP68Xl3naAzRzwBCnbMRFWv7g4VRXK5Kmkrh
 PQjec+r65GuorgTFHZGTOmjMM8qe6xUYZtw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgr1mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 17:01:33 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-7af2516ff5cso3930374a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 10:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759856493; x=1760461293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cji6HN7EgrDN8yeGOTOkDfIAV0rhFg81di50RD+S8AY=;
 b=HRxWRuAQMis3vNHe/02XYGjGx1KaYi1YMuNiDZKWq49W0rYHXiP1EXvAz3O0ZB+jCP
 pxlMyKb4HtU7qKvKHvRTxI1sRPS0Xjv7H0h1VprvaarkBpxkY2fi3v4LjFpUoUR/67z+
 N4F6IJe59WSWP9CVAjjdm/Ho4w/uf86rWW5M8G5iWHrLw9DyKrkHQRZR8V9ctO5Vupxf
 x2uU06aDN7imBtAN3hmaxDovQbTl7B9cACVmt+sZCEY1wGW4HryOUQEf3ohXrdpugWEy
 8JjQEr4zwNvXXeaDDp5rPY0IxYczIqBXyl0yxvF6QdkH1EF+VoP8DvQEA4p1o6fPXDB/
 U9vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxeAVJnEE68qg2KN86Jk+T+/6ceryMQNtopUexNCQ8WA1+0R830S/Nu5P/ZXpQbl1bnOUXU4qhOcw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVijsRcUGS8LoxH7ORW8XxPq3UWeHq7HTze8qd64Q00kL1coBr
 S1P/OxmeIJoy/agooaXu5VlzYsphfl6ns7dTowCjUHQkamTL0rqxejnnPf8W6OLJhva4UAt6o3b
 E/CpzYHXJGurDU4yDHeq4IqhaWZPLHfMME7R5Al46+GoHltlTrFdhF/0KNEKDpI9zGx9P3qQ=
X-Gm-Gg: ASbGncvRIYBaaxNo3MCpxx79jdYVXopDhJ3eE/Ln6cIrUt3+XU4pC/dadZHFpUGmdt5
 15193NRc+hUk+VJ1irnX13+P+jh6JrjZhhUfKB5KhoWrcYJVLKRU/45cEYc+SJ6XEgHiZpnGyRm
 JSrnyPKF9gfAy2OxXuChVMNa7Ff6s0Jmkjc2XzPnYZdd0vgNR82A/W3Fqjms3tze2rXsgljDjrb
 wgqaj2zUsUDLNHiqQTQyUrivRPOLSgCBTUSSVa1Fmh57y70s0Ta25r3vM7pczVIh95RhqS1c5DT
 a9qB7VyLGdUKgghr+Ht/r3JQF+QzmYCxTe+66+hQ8WGyOr4B7RF5nMBQcZFIYO4Q/8PiLXz5s1W
 pmEw7HI++jA==
X-Received: by 2002:a05:6830:6318:b0:745:bdec:cd34 with SMTP id
 46e09a7af769-7c0df82412cmr293183a34.33.1759856492569; 
 Tue, 07 Oct 2025 10:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGorcyX9d8wv7kD0S//E/pXvdSAztp0WOOq+WHu5UIV6PKfP77oBrcDJX4ccaojmfBZnKP1eQ==
X-Received: by 2002:a05:6830:6318:b0:745:bdec:cd34 with SMTP id
 46e09a7af769-7c0df82412cmr293113a34.33.1759856491850; 
 Tue, 07 Oct 2025 10:01:31 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6376b3aa9f1sm12672017a12.8.2025.10.07.10.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 10:01:30 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Fix incorrect error return path
Date: Tue,  7 Oct 2025 19:01:30 +0200
Message-ID: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX5IXayByF6W7J
 f5qwAQ+KlxtU6ad2w5Ft58S1++r71EMfqBBU0Mve8tDI1NkntSjLJJ1tmp7E168VBFYJgC2mKIq
 K3C7ySrflNw8+ruyEwLGTWW8OzQfkhdifVd3w3BYjIw1aBSEgS2mlEktFkPY/2yoiKUsOfvc4wm
 nJVSOENPLIxtGlWkcllteKubz5NOa61Qusmc7X+jYhHIOxOi9LSNuc/VPtZjLrkKfyK0TZibQUn
 /kXsBgNfghCmpm/OdCBGFlDchcAfmQycPJwEUnxsMvf53QUo5oIZHd7AA1k5vORaOVpXyUQUCLi
 cGsssdyuZWy2/zHU0MF60NSfY7/+PNfffZ3FlJ1Sm9iDEaSuuXzUfjhv/xz7q2gRt+fFaNQ6Xew
 6Qh5acXctGQGC6mrjAeFQ/cpL5N+NQ==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e5476d cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=eRD9WA4UfUJqHvbNdDoA:9
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: NFIfyn3HKLNScwAOFDnyc1AX6YCFr1WU
X-Proofpoint-ORIG-GUID: NFIfyn3HKLNScwAOFDnyc1AX6YCFr1WU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
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

From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>

Found via code inspection that when encode_message() fails in the middle
of processing, instead of returning the actual error code, it always
returns -EINVAL. This is because the entire message length has not been
processed, and the error code is set to -EINVAL.
Instead, take the 'out' path on failure to return the actual error code.

Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d8bdab69f800..b71aa2894001 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -810,7 +810,7 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 		}
 
 		if (ret)
-			break;
+			goto out;
 	}
 
 	if (user_len != user_msg->len)
-- 
2.43.0

