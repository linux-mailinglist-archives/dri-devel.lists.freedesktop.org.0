Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83381BDF53A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 17:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21F910E089;
	Wed, 15 Oct 2025 15:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qs8PLf6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5DF10E089
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:22:43 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAoUXl004011
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=edJ0bEjnWm5j3ldlKq/JlHzM8rs/5qauvRp
 LA6s36iQ=; b=Qs8PLf6p6JQ8PQKVqU1+OaJcebSkaVyyeuCAIW6rmJ+KTW228aB
 jGb6jwRYx9rr+qD6dQ2Epaxoed/T9JppRX7hNxrfqkuo88/WvVGCiufWpQrZR0BH
 U7MfJ3mCHmxNdut0r87sLe0laNZleORAfEYeDxrR4KznWJI+E9JfjICbYKWr1IR3
 IyYPZyHjryjdqzp4u5yxuonv+Hc9l5tsTh7QWEWG3EzP18byvgY7ArbMB4BKozwL
 rsgW2XXX12mtJ9JhcwGVz8VtG5Ka273nBLgUADIGDd7Qr3Wwt60bdwwZobLuX2Uz
 tKRiF5LYr1JxwOgOllN3MYjRlojVrACUq8g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg4s4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:22:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-78ea15d3583so284676006d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760541761; x=1761146561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=edJ0bEjnWm5j3ldlKq/JlHzM8rs/5qauvRpLA6s36iQ=;
 b=NPFI0MLBePTUIYUKAcz7nz1LZBp/1nGw9OdR2y3W43BACUlV3vViT4tn5Eu1uOcvs3
 3MVTeHgy2/vsu2UEZmef/gKIHry7WxiVejg33JuCY7InpmSsr6BbrFIGYCy19dK7YfvV
 sQWv80XKNTRtxuU7zt1OPGqrl6LN8gySOY47AZj11iiqLYTrKHNiDhW9srTmyPdh7CGU
 xPtvPN0FQ9dEv8mGSwgwrLtgn2h2YYpKlAVkkh/o0URSCWqKYTy0bZvCQdxh6h4Nf8Yg
 RXT+RX7VRb8xlroVmXnGvGb1s8g9qUzyU6zWWR4FsLrqKQ5yHLGBqFID/LoGfRhaOhuy
 OdWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5MWuFwysnQ+7+mw9zrfWnDiBUxKxk4tYCVgRuaO4bKJFFB2G61qNhHEiJZ1Ks1/38jZju/sjxp8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY1zmB+x3mNeQXRraDznvvluKPhrYBSnhmB0zpJAabFwDWHE2f
 0ykQF5ZhpEGzEXDTFLRkJnYvtbzTs0JBxY/FhfJ+M/BOEXPA94gZ4jLpCyhvX0LCRcot3t2x2iY
 5f/Pyc0KHyZMVQJfbpU7eAxCxcTOvAB7IPIaPA2OIv39hBzJ2pMEnncJPM0ObD8MCcVgF8Qo=
X-Gm-Gg: ASbGncv+E95W9kHdczyxW5+a+r9Cz4j8OC/0fhXdk3cUlJMqHTJVjuNKg9deFqfyrqM
 oWsmqG4hOrzj4e7jK5QOjapQM3hhAMGyUe8OGJ1eMSfGePIX9tD4QWNdwXhhsrtYYmGAksTBZS8
 cJBS4kWDAJrNYM2qkMx1ErZrHGqQeAcq6lfl5FF6CM98gP7CpxbkX8vV6Sy5mUqBKudh3SpJA/C
 HgfAA+dCM0jqKuKMlj9ihuY8/SMDeYO0wbCuSrJ634ub7MTPvuSyhoKQZZ2HWkfefnNfROuE2a/
 JlBZc/9Zqb+Mvs12sgN39NmeybLFgmGexBVONjFRdlBPJsL5lGJUaGZzL5/+EoZN3MZp7x8i4eF
 JTfW9
X-Received: by 2002:a05:622a:508:b0:4e7:281e:df87 with SMTP id
 d75a77b69052e-4e7281ee715mr149667501cf.21.1760541760871; 
 Wed, 15 Oct 2025 08:22:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpCCdhARt3ZuZXs1p8VBeOh7OQNbgINPUU/IinUgq+Yn542+19RfvpRPL4ZuON4lZwBwjdcg==
X-Received: by 2002:a05:622a:508:b0:4e7:281e:df87 with SMTP id
 d75a77b69052e-4e7281ee715mr149667031cf.21.1760541760260; 
 Wed, 15 Oct 2025 08:22:40 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cb9e80bcesm256689866b.26.2025.10.15.08.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 08:22:39 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Replace user defined overflow check
Date: Wed, 15 Oct 2025 17:22:39 +0200
Message-ID: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfXzTeXIICPiJ1f
 CQODPo9lz70cn+k+vs2mY7cuwTznI2ccle+hSckBq7ZKLG4UttFb4mOep7VHkZndKYsNqAL1YiU
 WnAv9Y4LtLGuWX6KNJF2VU2roHeh48QZKDmr9G6dbgGNMZ7Sq82yBD1LnFqK0CCL+wxXX69Q/zz
 UnOKi+ttHuimql+vWUHtDodKplPSC0Qy+O1ijLwMYnrxZMjg4pMsMRe/U3ENNdjfKUzChqCxl7f
 goGZVzI3CCkzkaW86ZW5bA2Ayezuy7bm1jetcK8jYSkzaOV4u629Rr4CmjYHHyEkdYedkT9P+H5
 UorEewcJe51QFHklGsjA8PIESKeVlPP6FBjF45Df6JiDGEFbyxLtfoN/YsW0KmGgg7axh+Rh/OD
 XKYiPR5GZK0VgL6aOqAuY8LpABIiyQ==
X-Proofpoint-GUID: hyIJoFITDmdoP9qwh2tKnZtYgV31MaxD
X-Proofpoint-ORIG-GUID: hyIJoFITDmdoP9qwh2tKnZtYgV31MaxD
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68efbc42 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=FPDjysqdnJW7MIsHof4A:9 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
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

From: Sourab Bera <quic_sourbera@quicinc.com>

Replace the current logic to check overflow, with the kernel-provided
macro `check_mul_overflow` in the function __qaic_execute_bo_ioctl().

Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..e6f96dbb3382 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -15,6 +15,7 @@
 #include <linux/math64.h>
 #include <linux/mm.h>
 #include <linux/moduleparam.h>
+#include <linux/overflow.h>
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
 #include <linux/srcu.h>
@@ -1305,17 +1306,17 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	u64 received_ts;
 	u32 queue_level;
 	u64 submit_ts;
+	size_t size;
 	int rcu_id;
 	u32 head;
 	u32 tail;
-	u64 size;
 	int ret;
 
 	received_ts = ktime_get_ns();
 
 	size = is_partial ? sizeof(struct qaic_partial_execute_entry) : sizeof(*exec);
-	n = (unsigned long)size * args->hdr.count;
-	if (args->hdr.count == 0 || n / args->hdr.count != size)
+	if (args->hdr.count == 0 ||
+	    check_mul_overflow((unsigned long)size, (unsigned long)args->hdr.count, &n))
 		return -EINVAL;
 
 	user_data = u64_to_user_ptr(args->data);
-- 
2.43.0

