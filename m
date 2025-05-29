Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEE0AC84E6
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 01:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F96710E78A;
	Thu, 29 May 2025 23:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSXkEdKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AE410E247
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 23:15:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1SUL003582
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 23:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kX7efsc+IS2/784jVqW415KcZ7V01+TYXKPRgFgJmG8=; b=eSXkEdKVaeU3v7Pp
 x5jGtq5KlfskOfsXmQ7UPlUErWjQ01zFJI7mP8oORmLZy96DYDA82kap14XFkI/L
 aQu4KaGOxcTdrv+pXUUhu//ti77g2G+ycy7kuf4vYY+39FtQJYjfAgWiA6dqEzgn
 Sw1k0vcUYUmUqC5ibN8c7LUdjlaO1SbX9k5ezZZgHLGnmN7RPSG4K9FYyVXzQn/P
 59qICEAD6zD0y+Z1zu3U6XG1iwBNkErExbcjdVYup85kqGYN/YAsHE7wsYW5syRV
 h7in1HuTZqol5BkLTKANsLL3EL4UKQV5B/QNU3N7to7Vw/ie3LvFjco7HnqY0VKo
 X7bk1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549q3w7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 23:15:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3122368d82bso1455642a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 16:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748560526; x=1749165326;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kX7efsc+IS2/784jVqW415KcZ7V01+TYXKPRgFgJmG8=;
 b=psQ/VKx6u33nWDXeXnOGPE08CxIYfgaqNkWFddMEOBIC3ExqTu6Yd3tPiWAwL+D+ZQ
 CHnTqMJRgYPzfQmsC5Q9e2sWz4WJhun1Ps+WzWO1MXX4Wviq1ITnPJ3rK5AMyTGmi23Z
 2EONbC6toyNHhf4v0Y7Kdv9EPNX+SVK+QgiiZiGQusWOPy2Gm5LbXUia/xNYnqxHQHaT
 DIdp2A99qW+KBkPtWG2z/NMGQTremI+7vl+Lfuu0JGXdFhgSfIjSKgbl3bGjkRu6QLnb
 9JsKZEZr1AgM3VQ8lKmTFHcp00X0CHfWMipjSWnO0UNjtJBPXxlEVEFjje7T3xoj6bmv
 9LCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIFf2syzAHhxYY15h1kTrwZoQnr2ZyueeCG/Xbf7EtikZA2xGjtM0ZVixLyEqqpw0zCnFLvpPA970=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrV/BaMxB4hwXAupEiwioHC1TPkkOIlyU8NWUT/czmVlhEvL+Q
 k9CoZlTsrGVI1B+76XhL4vNx75UZbnYL/DtUAH/hwbkFw9IgNyZj3f6thlHQ6YfLLfN8KlFPmaV
 T3/sP8FIQK8Sa5ulnonHsM2mTkv3G0ZAAs0S5j+iXtge7MKEcjQifLZCcuitZIqYxCXQjrMs=
X-Gm-Gg: ASbGncvVve8UC082YVkE+/vtRRTquk/iC+33heTlrKCB+17ewJXez8WWsTKhIZd0DOD
 y9rMcZxATUX2FUCh9FHcHnbFzLWV1L9PAK0VU/99i6vhl21SlVFyQhLx0851YpUJito3HNKxNgo
 OjCMmqto0dFUljHCctXeo0FwhYYcx135EO9PdI15AZaSgfpLV3FkkP//AVHRzRmng4ZuvdV24PB
 g2wVAO5MjKvcDRpR578SDWyMFtiDMO0LVie/5YI8Cls2IYVvEtT34J/eQor8iyRGbAa8XaeSvFh
 3Iyx4wSo9jzKGH8XA0Zjqf58AHPK1G3ZEZsvv5ImxaIEdr5LKoTF3dc/nYKsaWGgKeAIHbLx
X-Received: by 2002:a17:90b:3a85:b0:310:cea4:e3b9 with SMTP id
 98e67ed59e1d1-31241ea0309mr1550075a91.34.1748560526420; 
 Thu, 29 May 2025 16:15:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA3THCormTux9QWIgYTb/ZoeNKtEa6RR3lUUxnW6L7Kha6SEXPkeVkPdWWJIZrBpa4PAFunQ==
X-Received: by 2002:a17:90b:3a85:b0:310:cea4:e3b9 with SMTP id
 98e67ed59e1d1-31241ea0309mr1550058a91.34.1748560526083; 
 Thu, 29 May 2025 16:15:26 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 16:15:25 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:45 -0700
Subject: [PATCH 3/4] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-3-ce33bac2987c@oss.qualcomm.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=1160;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=fcV0U0JSd2Lf4fDNNX9R4rq8oAhewquvTnMKQsk4vw4=;
 b=L/EjQFUOVbqSjowt+2F3fUU1pQgDZXxeNd7PyBfGd52nFzJc3fw8rhldR4/xN61sS8wqJ+6KR
 nwQbP8lg2FaDS8cHgMf5lKPSyxMS6ZmgZItPDqtcoKXmLuD3U5u95KC
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: Gj09wLW1KejJetvQX-BSC0hRamYyzilK
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=6838ea8f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=8oAJioj0-2SxPtK92HsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfX9PCV/DwSIn89
 MREG/g6ZjC9fM9l5m7sulI1pzLtsVgeD4lk3Kvg2nG8RX+/HLc2lQTruZh2lHbi4Q2Re5iEE1OO
 PuDdIcC0wfSMGuUOa7kpNcFKl7/46GkbFYVhcPfs07IkEgFwTDAqsGOID1NsNL6uzPURAFuTmdc
 bTuzCTgw5NeSkcwmM6NmHiYeuvx/HKphFFE141JCLriimMF9UO31t0K4wheYxbGGTOkOiBsztSz
 sZ1XPDGYTE80YdJgrpdIZbhkCMLJ/C5TEd9yJr6uhTYdtuVbjPSFLPNXlJoP6K72OSqzmJSTxI+
 QziAsr3akqIObPk6eoUocGriPAsDFO3MsY9WAu6bIlcFqh6PXcUt6fEZF4UyVQ6c3oV7K3iOjpG
 dYHDqsD+yKuWNfuUGdB1WlZKzm1dOTExvSqU8p+i7bbSV+EnmHwU4dY4oj4fnkNa0eyN/sVw
X-Proofpoint-ORIG-GUID: Gj09wLW1KejJetvQX-BSC0hRamYyzilK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=841 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290227
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

msm_dp_hpd_unplug_handle() checks if the display was already disabled and
if so does not transition to ST_DISCONNECT_PENDING state and goes directly
to ST_DISCONNECTED. The same result can be achieved with the !power_on
check.

Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f2820f06f5dc..785c813d2b31 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -672,7 +672,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	 */
 	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
-	if (state == ST_DISPLAY_OFF) {
+	if (!dp->msm_dp_display.power_on) {
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
 		dp->hpd_state = ST_DISCONNECT_PENDING;

-- 
2.49.0

