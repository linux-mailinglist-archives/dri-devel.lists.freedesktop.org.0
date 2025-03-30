Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F051EA75BB6
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 20:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5554110E347;
	Sun, 30 Mar 2025 18:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ragl/Hij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD2710E347
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:11:39 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDG2hT020921
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vVUKLCIEpo206oYXZqtYL/532lLPSl4dW8ZhmmRNjnA=; b=Ragl/HijPeAkHk37
 VULHizWZt5LEXj9cVUkE8adHuFhgdMplH4A2qw/QNyxeHNGp8t9Rdryzk/ujUycI
 1RouVw70STahMdY9mI8s117MxGESOtUDHQ+NhLz4/VIKgdpWHIqyQqLiDwfzT3KY
 qqCHHGkAIUmS401ziT2j/PVaqkGqqbzi3ymsvNtsUIuseD+SmFohiwkx6nxdI+CL
 cJNlONlAa4jvTfPmLb0lNh1cNan2tzN7Y3j4iH8k9zg738ciEOySZi94H6vDGV4D
 u8dlmehF47Msek3OL8yjgNMDlP9894J8iTiS7tRVCPvasK8JU2gOeQIylnyqmSJ2
 5kycow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935tk7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:11:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0b0cf53f3so589078985a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743358295; x=1743963095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vVUKLCIEpo206oYXZqtYL/532lLPSl4dW8ZhmmRNjnA=;
 b=GAhrpMmp6nSPbtb9ckaxgjD7K8ikoi7zBzOxKqa6OKGgEMbVUIaHVIK0yorD1x2MiW
 oZZ/K5HKPr8si+MfJw62PDDr1aDP+DncxgXeeRPb16Lh7w5kcDyctt1/8tbpsV60CjaL
 DRnM42hbTUnOZp+0XI4DNlP7JlGnJAXL42DMWjwTjYeqJTg+HMQQN01vfCEKttCdDz7q
 yiGKkWMeboK5xOzPg2JhEKuic1aJFsszOX8Z4zqdS7CGFPMdIvmWRPR0yMDWF2raFc5y
 slt6PKTZmXIPXNadE8KdZHBptSxEc7NCrC//fxJrm6rnFUmbEERKqxPEoTEJtTOgbeab
 fzMw==
X-Gm-Message-State: AOJu0Ywx5sX/Gf7BcQFKJ8zWLWo+rlbzC5e+/gxwbabEQXqn96AJlu8M
 Z4dJpRMjoQVWklS+Oa6P7cIf8knplAARZr4D0yS4aorK9iHFVXnjlzF5UsUmGfduOv++Dm3SY2s
 ncXMc4JhPaF50vWXXmAi8Dafuc3l4iEnAO8UxlCom0W28e6O1zmSbcAxIRMfLs3PCG7A=
X-Gm-Gg: ASbGncsls6hc7TahKy/P+ifL07OAtjFiqG26h/uREe15oYdAYIrHp9+N+2PKHzZMHAR
 g4l+FtcSwXrnA7uvgUgfmnXwgVyHwOb7Sof08o2UMzdxcVBLiugdu53vsn4zf4n/N4hofwA+vMe
 nnWyKVtxnxaUMQFg+5jKKkzJo2YTf5odhYTZ5q+1nt0NpsBQzWr1pWtMvqPe8jczSB9yvnF/lkj
 TMNESH1hYCuj3fEvw+BM18hOPu85VmQ7YRuribsNgN/sep/n2dEGeuj/sRwTU3qujRMerRL8Muc
 LxyLF2JqGS0CXHlYApm+h/LQUNt28KyT3KUl/JKef+/N7YP9ShVA1n6qqvmKKo+78CE=
X-Received: by 2002:a05:620a:4152:b0:7c5:53ab:a74c with SMTP id
 af79cd13be357-7c6862ebd01mr862966185a.10.1743358295532; 
 Sun, 30 Mar 2025 11:11:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/4Ayu0px2bsgfwGlasLAeI7cob1w2ZXmawFYAbJ+6bPKbrGT1NUrtNEzMcRulXVA9Z3WOew==
X-Received: by 2002:a05:620a:4152:b0:7c5:53ab:a74c with SMTP id
 af79cd13be357-7c6862ebd01mr862962985a.10.1743358295232; 
 Sun, 30 Mar 2025 11:11:35 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2aa9c56sm11478831fa.4.2025.03.30.11.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 11:11:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/bridge: sii902x: Set bridge type
Date: Sun, 30 Mar 2025 21:11:29 +0300
Message-ID: <174335828699.2569365.9085452563273162039.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326101124.4031874-1-alexander.stein@ew.tq-group.com>
References: <20250326101124.4031874-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Gg9LfmZ5rKOdJ2Wjebe1ueEwZ6nZaYE-
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67e98958 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=QAnTTyjkLDB7MCdMeLoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Gg9LfmZ5rKOdJ2Wjebe1ueEwZ6nZaYE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300127
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

On Wed, 26 Mar 2025 11:11:23 +0100, Alexander Stein wrote:
> This is a RGB to HDMI bridge, so set the bridge type accordingly.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: sii902x: Set bridge type
      commit: 586831a417c9ffbcac63cf1b53f05d15024fdd56

Best regards,
-- 
With best wishes
Dmitry

