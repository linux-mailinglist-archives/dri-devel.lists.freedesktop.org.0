Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07058D22CFF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775F810E6C3;
	Thu, 15 Jan 2026 07:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lA4r2Aer";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jA9RDXTf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C175D10E6C1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6gCea1554609
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=; b=lA4r2Aer9hocwYNS
 HjpLjW/ZbQklU0LkL34P30bPINgLs3C+zfnTRAPoQOO7+A2KcFXLmB+Rl9pOfC9E
 Xf+Y6P0R+C+74Mkc/y+5P6cP/staUKk4Hj7x4kFUUAiQEdyD8PANWgpchqkbGiqZ
 s2NPitEpRtG33Gt6FUgijHIfNFHFaU4DWO6yuZyO9IaLTt19/9ouJP0Lqx4SGv15
 UKaKjnbp6mEbkpxzfrGG8VvOCBec2Rh1H7c33tMevKdpJ1eapCQYDhnQUauuz0pq
 XWQWZCtKx8b8xYXLU25PqQpmjFxNZiFeIugn6B8T51MTLgC/xgWO1DewUq9dXo1a
 nZcWXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8udb9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c6a2ef071dso19293585a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 23:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768462153; x=1769066953;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=;
 b=jA9RDXTfhNgcCgUNufN21OAF8qrCBchpPZSsyzHQ1EbhvXO0LLXgBGHHoJjG/70hps
 1PNFAfyK5L9cPWneIjr2BqhQebJQXhgpAPywiZYeA8ra5zMIRUj5aHmKSUixcmLw/kW3
 fA9d0/Rj+qKV1MlQIZbXNQqeV3C0P9zMZAwluanLw7AFumk8WgtTVkIbRQ+eQDxKMvDp
 C+0ROYQ83LBy346I0LLw9jki31Df8Cz1PEhHZ8iW5gexMDC20ZAX79+fhgwMi4MM4Ozi
 qbbIWA1pdkzf38OOUksEv6Vde9IUismNzNo9l1jaMCDWXMy/AVSbeE9OlHv/3NyTiHMr
 y2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462153; x=1769066953;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=;
 b=a1oXgIaY0zPWz6TNlkJBogiEFGHYz8Gyie8SrCfnVru4vghImw//5pJR5EkGVFFPN4
 fqhvZ/jkIYWjWcRRBltAxTmfc4j+GPXRqahcLGxlVtv0vlKJXAejKGB4hlKIIk4MuPhR
 pl4b3b+goRQ7t/MepZUhOKRGj/hYB7B1SvW22CMVffW7z05Up6OyFR8bEag8P73gevq5
 5Nul/Ghqwrrsfsld6853swtTTeRPFpqsrPNeTk8EikOzPOrAOsd8bfGvSIwaYoHz8hoB
 ikDyTqMrO7ScZAKg4ITPUjXSJrxkGEW0PUX++BADLPljo90Z6ZeDsdNLAHDDggkpUxKE
 n71Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrlGCBZfLBVl5K6IMdbFGJbEtSKd+IV7MLrqGifp3pkx2xZVu5itwNG4LTRihlUW/OiNybu7auwB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMKPIhEsaIa7dmY7mpZFMXjB8qo0vwrNhI9i1hXeXHr73LEPng
 YeZ7Cwf8PfT0RVkJ11udUpCxRuEdCGcSTRjGw72Hyr8NYT2jokI5U2rnttZQfhttzjulm0R1kRW
 Gp9+iScZveWZRNuWc8vsPkgacmVbXRNR7mytjwTPCBla8Wi7rmx5SVoT0FUyhVHxfoaHd59Q=
X-Gm-Gg: AY/fxX6LaB/ziN+NkkOgPgO9suv4gT8DrNh6559uEBSBxcjT1oXPSauDLZXhHXErO3V
 sJGUbmutrVn34DRK5VVoSdU+am79LgQWDBwpynsbMn7GWtzv1cUag5cUZKdR+HL89ovgYcZ0Zgg
 TYisieC2fIJGVf/L+QUUdgzmyQmxF8rJwUPaoXN47zUwEIR4rXWx8VhF2RCKQsHGrjyCPsbdA6A
 3GECcoJrF2s94zYnrqpPhUYuiLmlgT4/ULYvAw49e8UJ2+5Ounm1IW84r04c8tSbXjkZBvB/cL4
 IXERHnmMgzt6ZC09IDefno1laD2ClLuPgQI7gYaphEDXwhrGXnXk13MwiLYjLo9klpf78//nO9X
 053XgXmGMGW/gbDsdnghAI9mIk03OVwArj1mlZdIRPQIcXoBXWHcwd8oq9xDPn0h2GK3dh7jN80
 sDhcJgDTJNnhhdhZ5AlbOPPwE=
X-Received: by 2002:a05:620a:294e:b0:8b2:6eba:c42a with SMTP id
 af79cd13be357-8c52fbbee3bmr739900785a.61.1768462153293; 
 Wed, 14 Jan 2026 23:29:13 -0800 (PST)
X-Received: by 2002:a05:620a:294e:b0:8b2:6eba:c42a with SMTP id
 af79cd13be357-8c52fbbee3bmr739898485a.61.1768462152871; 
 Wed, 14 Jan 2026 23:29:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 23:29:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:06 +0200
Subject: [PATCH v3 1/8] drm/msm/dp: fix HPD state status bit shift value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-1-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hzwfWK5+EPLPBOMgkg/4Azem10iuzkilPWoxif3rO60=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlol0OgRxZ1MBFNp0tkki7+qUT/NIE7YGEFzQfNJAcdZ69bi
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpaJdDAAoJEIs8ij4CKSjVhioH/13E
 FHzJE52YmAQhFdyvBSMPAFtSVssioEXr3PXm8t4IcDujo+95BTt4RPx4/7yzj54pddcI/MM1Gq+
 d6nwzkrWyio/F3OYxfwJQKr2tj6D5tMY7NPdi3/LAJYFmjs48i8lee27y5+6MKgcqjSe0LtkwvV
 G6p4AH8Cbrv3hcf2M9trNwSVgAwcxNpWIpD+ejGYV6kYIdig448hT6G4wJR5QW9txrADi8nfk8M
 ABr4khelULaQ57GFxVGGwYyz5iHpcuJQkUtEByILkOVFgnC9otGU7KZ+i7uPDd2Vl/2nez0gPXC
 1POFbvmkzvr/gJMNN2rqQaYba/jgW21luZtkPzY=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: FIdn_ElEzCb1gsKy6BmB0CvHhzoO9Rq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfXyqqmK6NwodHo
 E7oxe4tt/ECJ8AkSXzVI2fI3zOsQcwNryrV8Em6/Vnep+xr96ELpTyBElNGvMi3INZa1SOQ/WaH
 X7fi5u+aQsVV+VsUDBELfOHLG1eqnGDdqoybpdvyEUyl7XV6b7VBCnbjpRp3qgLXmgqa6XtzMmV
 SrQPDuv9oAa5jzzaNTM3m3vVLbFlGAF9ZnbVFvJEpA9WVDbbUFjRVrJ9uDNmCN6Z3mpHRWw2Un+
 zCEGqPKLZGQ1RLlp2EVVKh6LgGNIPXTtnZPNyqucmk2SK5EFO72xB4C9QBKEYi58CHR7NRhaOJt
 niasp6Kxlxxq0L7y7DPg8/QAdPpnqvT/GCpLrhYpJffQHDtrbvm1SaCEHuH+mBZH0VtIGcb5rNE
 MiaoASL7IBtzD8FNjL/XJZ6uNvm4qxQNkmOHR3OfOy7JI7gPcyZ0umAsNQOG6zfdTzBC5fDA9kQ
 tJ7gwQsOYxqoi2lRA7w==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=69689749 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IBRk8GtBIsankUNt0b0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: FIdn_ElEzCb1gsKy6BmB0CvHhzoO9Rq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

The HPD state status is the 3 most significant bits, not 4 bits of the
HPD_INT_STATUS register.

Fix the bit shift macro so that the correct bits are returned in
msm_dp_aux_is_link_connected().

Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_reg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 7c44d4e2cf13..3689642b7fc0 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -68,8 +68,8 @@
 #define DP_DP_IRQ_HPD_INT_ACK			(0x00000002)
 #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
-#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
-#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
+#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x00000007)
+#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
 
 #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
 #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)

-- 
2.47.3

