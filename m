Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6198B0289B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F139510EB04;
	Sat, 12 Jul 2025 00:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6CEWo6o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D536E8924F
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BBLPt8018809
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bszOuNEzmYEHHlgQlK1KYpB1RHEkBL6gk1zou4Kczfs=; b=d6CEWo6oMn75QCMA
 eP9iMW8OF9R10iyrHRSm+vVx8ns2eAJKJUYPNkDazLyslYaVpGIWnqLZmFdnFInZ
 x/4uVBEdBEgZU3z65jW3hRxycwrZiqdZ0RK0Esa4p4VMb4qep+I4fs+nXpV9N+Da
 iyw6udVBLUSreh8QnJju4oUBb7hv5rnwUMEqSMj3NqLGb7K6zX85ywdNxWaKi/tW
 FNK5c4U0pbb4yurc/i+eDewmHRA3mqwxpxfem97o2eMEqQYk1veR1nxuE4Mz/4YW
 5OsxdcocS02p3rUhpVAFV1hOXDH5u+bOG6w1GfXiti87uGzFWs8v9DvDx3fknyP8
 UDcgxw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf345yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-31315427249so2419218a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281928; x=1752886728;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bszOuNEzmYEHHlgQlK1KYpB1RHEkBL6gk1zou4Kczfs=;
 b=bHc0oOm7zNtrQ0oWHysEm5WrrNhFPbdhmyihH9aBYDB+HvoV27pum9VG8t1DxNhFlc
 6cgRbrViM2lAYnrZN957+BGq6B7TY36Eh0HExHLju638RpbP85uoPOPjIINVpop4q6a6
 hTnPA10sUI2Yua19qNnlvd8llBqbJk7SHnm4sjgt2hgp8DNfxBSgi5irO2PJkk+qMdSP
 hRNgk+qMeoGZxJBanIA6hZmS03JRfYD+AtIrVk8pbYxr69IHxEHTcZQ0aL/N/m45fT3j
 25Xn+IGIEqXUMXU8bS7uSdfHCM/4nfus1qN7D8XURWJd3WGOAfLGSdo8eJHZWxYJhQRx
 i+ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCW59vK3RhPvJbKUDqzxyQiRRPd4aGP8LcHXbgziQhilU/6HHJs9vrLi3fXviZG8y++yXd3HJYb3K6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQ2yLgQ9+3bdfsLq2YTtIrNTeOnqilfWmf6lCL/QNSo2op+lVm
 dLqsKWABqBSeGVpdxP8P/KhcKqe1jbFRLO6jS4ZiLVEclIQrQ8mc1MuNlExQJPkw06Ct2iFmSmR
 nBuQAvusNtM6lVRleFDSSd2WfB7j/4e+7Tw48aciigtycAmWgxGzXNjkFJW3861/LArgLSYM=
X-Gm-Gg: ASbGncs1RSr37/4Qlns1rlNo62T6XllxuC8a28ltUKFIiSmVWIZmach7ohD4nWAi+bE
 hX8xh6v2tEVDewWpLVSA/+RPA6SrcDTL7ICHGGxasBFS9A+ccVQRvTVd94qpDMDk+tqt1Egb3z7
 RLbs3bMohFtijEGMVlUBhLlzwxfbDit7z6lh6fq5TEygsC1stXK+0dn6O18dyA1/WIwy6ioExd0
 HoxtM//MLi+ZMQ67MuTqL+vbV1akMhTpIdJ5d0l3Hjk4z8y8UzAJojVuTp6FZmk1mtEkAOHd8h1
 X7E2AEl273O/DHzjKMTSfXhQlPdd5DOJxqKgjtHG5YO3y+G79jzR5N+8gNxQA5diSbMn/0xEl5B
 kVoN0pOVj0udXEttUqexTdYlj
X-Received: by 2002:a17:90b:3a46:b0:312:f88d:25f9 with SMTP id
 98e67ed59e1d1-31c50d5dd27mr5480910a91.7.1752281928533; 
 Fri, 11 Jul 2025 17:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPp232VKZu5fw0vh7/xwi5GtN1guTWNchaqd+MF6vNbgX0pVciWwweX1gqU38GAdEKUujB/Q==
X-Received: by 2002:a17:90b:3a46:b0:312:f88d:25f9 with SMTP id
 98e67ed59e1d1-31c50d5dd27mr5480891a91.7.1752281928124; 
 Fri, 11 Jul 2025 17:58:48 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:47 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:19 -0700
Subject: [PATCH 14/19] drm/msm/dp: Drop ST_CONNECTED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-14-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=883;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=rUc4Sgw5rxOU20loNM6AdBhsgLGh23bqcztnvCfOjeo=;
 b=ofz4DmMAv5I6W/4k9XAX02jtlY82ln0uuSdJIP6n0rJn+5lWf3v5ties60153vfPtnsCPGq3S
 QElekPUwvEHBF8kimc20I7HFgbTWwwOGAq8QBTFIY7ozh/OADyjlT5v
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX15Pw/MU+42nU
 HegmLB6HaQbqvfjHL2qFOU0kdHThX0I/DVxrWB9vpHPMUJR7/yHgNmrP6ydfdIUdzh3Csn9uxud
 oE/Z2ap4q+3RDFhel1tSbCzARVijWVKlTuFkp7DPbiVfr7AA9IK9viMZ1okFb5UFYsyX6dIJGOh
 fhmmOVxeettFS/O2PQnHetYJofUQfrZBGgKdX/Y/0xjLktIHlHN0WMIrdLjMDdoNpXTsvsetT43
 ZuJ0n7jAiGMR1CEERBZ75m9tpehwKcYvcTGN7bbAdYBQK2QdhDNtFZcZ/aqjdqzJQXZdzwmUy73
 RdCdlMJ0EEFtgX39I0CZQR3yamN4cCVFO/92dYk/laJYLsk0yu+r6SC0cX7B+QiZqrrYs1ZoelP
 MaIYICVH1rVPjdf8KpXM7D3n0bk6JFxi4pSq69/qCFlrmAyvstG3xPk3cOxFqLeUHADy7ubW
X-Proofpoint-GUID: 5-i01FWGEZltL5jQ_6YsziE2BrAbDsar
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=6871b349 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=k23i9R_ERYQwGrdfUk8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 5-i01FWGEZltL5jQ_6YsziE2BrAbDsar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005
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

Drop the now-unused ST_CONNECTED state

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dac5078a849d..c7ad61e96b37 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -45,7 +45,6 @@ enum {
 
 /* event thread connection state */
 enum {
-	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
 };
 
@@ -1594,9 +1593,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		msm_dp_display_disable(msm_dp_display);
 	}
 
-	/* completed connection */
-	msm_dp_display->hpd_state = ST_CONNECTED;
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 	mutex_unlock(&msm_dp_display->event_mutex);
 }

-- 
2.50.1

