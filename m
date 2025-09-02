Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8D1B40096
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1127910E6AD;
	Tue,  2 Sep 2025 12:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2pz/o2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5A310E6AD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 12:30:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AegwG021463
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 12:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BNWoXsVDFnok4UFE+T0JM3TKXHmHj1QrThTVFrNIAkA=; b=X2pz/o2KGIh9+Ffk
 JkvjpBU4/98fgg347M2ChiWgeISMl1m7Z6VQoXYRnp2Ktj3oG8Ci/KOXqrs7bXqp
 kOkwdFX90MjzqHGFGfn7M+Nn00zesmVj1qNejtLuZFoadckRsurdpS4xTcEbadsJ
 JSkokdDfOhK6CRYNVRo4Khygg8EuZ1eztFrGLGthoipZPEAhvyN2awLdSoqD668b
 hiCV06UNzrzajK6Quj2iMaV+c5n0dkdJgm118ZHQsrGQpr1VaMB+F4tyippbwuCG
 thHJcTcB/vS8rMzMZWerk2aWCXgbfEyoILbK6mPqsIw9i1vlbxQ4pIXNFA+eqZKJ
 vI4EnQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ryub4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 12:30:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-715c9cad6f8so3492876d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 05:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756816252; x=1757421052;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BNWoXsVDFnok4UFE+T0JM3TKXHmHj1QrThTVFrNIAkA=;
 b=HIcTgSLIJ+nMEu/IhzUOIyQnOFNmBvTwWXyNNOlrrDgv0w7og7HtdiS0tJILJhKFTF
 84MuBC0G2yhsoSQpQQSUnS+xmcGPE4ARas+T3b+eztRWVuDZYHZJrHQTJbfsRzuPqnE/
 qYEz8dcmdAmuehOR4R0tP2FHn68dBNaqKDQOvPiycLs9pzXUmQNqeOlUUtVUcle5u9mf
 xZKRbCijBqg6VsOr3ebyqsZ8Fne8cp0awOg8wVPgFQ4q9aagpMobm9IxTrLabeCblzyD
 QHkAxVtjCAGOmGD4ChAKNmbqz/+D9hCLb9Fx351lBxse/EnEIEI+jd32wslgPAScypK/
 EX5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf21JtrF2q3wP+VU1dkZNIgYqCEsagEZ5jhStJ+zIdYM5HDvQxxyu72HU7EQmVi8Fv/b3gzIqmEvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXF6Zj7+XSu5X6R5YIMGXCiqY6iFtoP0xlGwf5FzBByGLEL/42
 lrC/UilCn/mhJlZvnznoNXl3bik53pGl35zYZKv/rjG6QECkmkKXCttljfsJoW5K79uQhZGgTRD
 KKr0E7KDXyXKj0GA+RcU6q2TIDunhsMCtuZW77qo6ojmwX1mDq//urT+5nP1B9TqTPJrAr24=
X-Gm-Gg: ASbGncskGaAgo7RfwVWk3BWUzP0Sw7K2ibtpdIeDq98rhjLL07RlDRqNJqF/+9CUGYw
 Qvzma8Cx4FHjF8qTom2m33MTqq6Wkw0+PrIZyecK0rgSqzLSJwShbvyrk78aAEXCh3o9xETiChT
 gT1nXeA8OhkbnT/R0sJFoTeGz8sbU1+wOklSMfUa1S5VP3QBnysZXMcLBnuzNfRVb/by3q774rW
 /QwLlejEwuSYb7rrpWY0VkJQv2VwKfSxpVnwSc4j/5UDCoUoyBqQcs/VCj/1rrSTanOOyUAN9Hb
 NzqtitSI9RvbXXGhUbzxZ548mz1nnLlLBsvnwPVcR9l2Tgurs/MOOWRkUplhZDXalvDEhRHixMF
 ZrewdNvW2CIdGKelsaJh2+A==
X-Received: by 2002:a05:622a:54b:b0:4b3:45a:2b3d with SMTP id
 d75a77b69052e-4b30e9a845dmr104245471cf.12.1756816252092; 
 Tue, 02 Sep 2025 05:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlVMbYgx8dc1lkUCensrY9s8XZ1S7XpWw87suZcVbaJfnjs0OW6CdvMWyEtq87QwjeBLmlGg==
X-Received: by 2002:a05:622a:54b:b0:4b3:45a:2b3d with SMTP id
 d75a77b69052e-4b30e9a845dmr104244851cf.12.1756816251241; 
 Tue, 02 Sep 2025 05:30:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0424cc1698sm544146166b.21.2025.09.02.05.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 05:30:50 -0700 (PDT)
Message-ID: <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/adreno: Add a modparam to skip GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXySxQDYNwQxE7
 +QQ4E3AdWomjLtXzEk1gmaOj741Zbxdcb/LkRm4RXdMtRCTpsWRa3i4DDhs+UTXuIji1sM090dI
 C7v/P/s+dmZd+Tip9LRFk2O+76NnIJd3Qyfc1pSMIbi9o7/zB+rXHpGF1RUAoSTHgxXvP+0ijUS
 96Ihq7JnbQqiSqMAPXPS736iw/k9yJ6HFR9IksladtG5gtz+pbN/pBMb9BMaac/GO+WUoJCry/T
 548gHYJDXCHr5rD83JR1RdIoSW4T7PsbRegcxRGTRG/uWogMbfFHzrZCrk0qfhcTXQtn921J9PY
 F4FNxruXQ2VG4eDYtbZkqNVoZrZ/pVbjTR8hww3ixZF3XIU7Sj7NoEp2cIiIvSaqMG0Hm1qgKKY
 Pm1WYkMf
X-Proofpoint-GUID: eHsWD-KMhq5D-owpN8uGSKIpVWzEl6g1
X-Proofpoint-ORIG-GUID: eHsWD-KMhq5D-owpN8uGSKIpVWzEl6g1
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6e37d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=kokVE_FroeQZl1yzAO8A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> During bringup of a new GPU support, it is convenient to have knob to
> quickly disable GPU, but keep the display support. This helps to
> fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
> modparam to support this.

I'm not entirely opposed, but slapping a // in front of the compatible
in the dt works just as well

Konrad
