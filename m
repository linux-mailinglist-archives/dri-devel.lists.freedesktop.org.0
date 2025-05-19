Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A186ABBB96
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BC910E3C2;
	Mon, 19 May 2025 10:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+1Xs1jY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E604F10E400
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:51 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9G17Q006013
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=; b=h+1Xs1jY2T0dXP5c
 PH93mDwWyiXLp+X5kuCwCNvDVFbpwLUZ0zJpLFzBX4NaUZ6Sf/AhbYW4n46ewIcv
 63JxMuERXRUDU+2TpBCH83onhVjK9ZZoHM0P9swGgZW4y3ouDXPUkK6aHGGHzK/7
 ecCnwVy5ZRNjgdfczbOA970GvZ65icievAqVZSFM+KUVFU3jAWKAIVcUtxvfOaWq
 KqskdRMPr9o30y6rC4JAITwqBzIkK8UEInzXq3gleLh4uiJtjZANB253NniK7GRd
 gYTkj/NzlCTCU7nLyacBduzQ1wv9sgTuYUGFkS0XwH+rTHCg96jheJZERIf9IT/O
 cRHwkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnym4f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c9305d29abso832379785a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652323; x=1748257123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=;
 b=lczf8yRCjYlgRpnjnlZ5E93SDEE2M0Oodtci9YTBaKT24RXLJ6ZNCQZ5ZFNbJgtx/1
 6Znhb1YPQGsDccLPUekccZkkU3nXnzKXdxEm32h1bZlQ+nS8jrKc1r39EvFLKJYGAsIj
 uXgpZv0V4AheQLeluh5+B+7A36DwpqmONO8FGRiNllJ4BxB5HSHoxScw+cNhc76MoQ9S
 0bceyQJQIbv7kMGC1jGNKTZMiL/9es+ap9Rd1rLD9u9Of5Jm2IKyLJPESA+oLA9zHZIb
 fmuxt9p6HN1e/gC1yJnree2++efam9LWu5KvHovKvhLXwinxt/VFlwiThrtlzbdkXJ7g
 prSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjsSZEyKcvlc8omUBTdh/gl0bohfQ71ROQZe9ZISY7pEAtGlR6bmElt6y5yYDupheSI8kuN5F0H3U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoyJ4spdYrUAKNqPai95fBhK3MEgJSLlYz/Ntprm4d6CuKRtnf
 LxqKHm3MgkZVU8Vvey+EuRKFVuTFotEMkgYEIs07gjpRWDv88iEe2jBb0zY+VpJvljC9941YVgG
 VIlQhHXnfMvlKpvZKQS6eQjBOnPjMccl+YxF37+B0i1IPk/jmxds/0DZHHPrztFPHwEWYva0=
X-Gm-Gg: ASbGncvCIJwPctLWI65xNWtqkU1hBWZQlnqdQYZ1dOP6IEfViOgz0zSDnnWTe4yANu/
 4NgTgiMY1JwOvkBtdKvXSf4qtQTRrIWBdvqZ9kCZsUSWc2PdcxO0NFXl43T7disHUUgpGaCwlQK
 osOS1ynVevWObjDfz+fSoe05jMDknW/lHXQgR6MVaW57LmOAaaOqp76TLdYAOLXTm2xXGAAkRYg
 R6XO/8IYNbXDuTLB6F7v21/2EwTGjCAMBPnwYRSzqUQo+B7extllVGAiqSl+n3GrL/5tW9a80QW
 zFfwkBIUtIWSeAtikNWF0TbWTGKzNpg6GC5l76b6kQWqe36n+yy334iGcZecj+tu0kEVW4O92i1
 PnLQzFUB76cCEzkIVDkwKsD0K
X-Received: by 2002:a05:620a:444d:b0:7c5:5f19:c64f with SMTP id
 af79cd13be357-7cd46708138mr1880483185a.4.1747652322889; 
 Mon, 19 May 2025 03:58:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHlC42Wf+KXtGz5HPa63U8GwHGvVVcZg4hklaSY7uoLCUJYftUKkMonRSvLuBDCGCogzpW0A==
X-Received: by 2002:a05:620a:444d:b0:7c5:5f19:c64f with SMTP id
 af79cd13be357-7cd46708138mr1880480785a.4.1747652322512; 
 Mon, 19 May 2025 03:58:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: disable DSC on some of old DPU models
Date: Mon, 19 May 2025 13:58:30 +0300
Message-Id: <174637445760.1385605.8148657144550211301.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX379XYsEyqPK8
 l2rEGneU0r7g1xDSqAIdx6pbftXpvgcLl8Ghwaxn/5y47g4urp44VJwV5BhI1NX64YWJpRs1vi2
 vBg1Rr+CWxYlul6uCG/l9J8udE02wO3hQ/KHpquXXxo3JoXBrJoTVce2AddhC88tnhp41OXQ1In
 Y/Xq6hbPnkLLcC74ODCdS3pMEgUr3N0sX1VhpUxqFYYg+hzwKceswDhr5jlqUdyznvim8owRaJr
 sLbhf48Zhj3XwjRZiCFv69EnCsWbfizk8sE1ivuHnU/I6RD/nf50fqKz2qQNo6uIlMDQ/fccYBQ
 i8tUjmoRzgRVCOiNC/v9TrM1owXNDpR84qLkyJqtfAuIMYT7rsm0zjiQtOd1H0B1FydCLNltG12
 7BRRZkaJzg9MnlvsroQBRlTKakEwDEUyx+nudmgf1DcaiaWQZaqCZQFzujqvbP9M8UAh8jK4
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b0eea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=FEuYHSLItigONA-XwN0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: aAwNMzLf84jorOpKifOr4KrYtOYI5ORC
X-Proofpoint-ORIG-GUID: aAwNMzLf84jorOpKifOr4KrYtOYI5ORC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=644 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
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


On Sat, 01 Mar 2025 11:24:53 +0200, Dmitry Baryshkov wrote:
> During one of the chats Abhinav pointed out that in the 1.x generation
> most of the DPU/MDP5 instances didn't have DSC support. Also SDM630
> didn't provide DSC support. Disable DSC on those platforms.
> 
> 

Applied, thanks!

[1/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b43c524134e0
[2/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5be98120115c
[3/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5232a29ebc74
[4/5] drm/msm/dpu: drop TE2 definitions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e1fbb0d78e86
[5/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630
      https://gitlab.freedesktop.org/lumag/msm/-/commit/075667e986f3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
