Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669309D5EB7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 13:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897F910EB54;
	Fri, 22 Nov 2024 12:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceTL7KBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48F810E2EB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 12:21:49 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM36w7F025224
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 12:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2zyqdqOWon+Bb6KDq9EFahJ8KwOZlSLq3h9cfnJbehE=; b=ceTL7KBvdCZ22zVi
 udzdRY3CYZAS9dHzjhEXUYpMQFNAUEyJJWx0j9AWTrlU1Sv50SUvlGWeV1wBj3ZV
 xGDxL/L6fh9buUgSMMSoZGS2b5L4akX3K/u3qqbXWwWJuVwvF9Zs7E9S8GNSp9+a
 G/idSgVQg/kUfpi8Syq65G0aCwvt/YCBlgQshS8wLWWw3wshLoznkEOghhIv2/q3
 AV1vQs78BgOValB+FPpJW+G4Kw2OUqBrW4b6lBmf12UfSBYMgJoCfM4qmpdcHDkx
 ibuMyzc6hyysA70lfHAv2OaPegJF7bTAYNPFj40x7aiCJwHHVIjtgHDhogLw3nne
 Y1zz4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43251nka2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 12:21:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7b1437d6f6cso25597485a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 04:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732278108; x=1732882908;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2zyqdqOWon+Bb6KDq9EFahJ8KwOZlSLq3h9cfnJbehE=;
 b=EySIhuAeazAjlRmzyCJOFIs4NzLPK8dGFC1ZKoymxlydvmga4RXc5F4V7DcrWZ5Xl9
 IVjRSE+cL2igZ8oSphPJ5BjQIKrL+o76+3/n0FtLL0HS7/4CeeYjYcRosrjhtRjKg3gW
 icv7VDh9EdlcMwL+JkM3iYmOuPhYMe3HpRQ54AvA7VF97eXds7XqIiRxJyAkDIZsqpKL
 +j3ldVhGn/ZLfi3GIGnVMLo7DxQUhSWd+O8BRhxli60q+dhbj7ItR2HxalgnHXeDBh7P
 hNEWZIj3Alv0XyR6Xz4KXuzgs52K4+MsDZvQwF2a97JEzKHivk9gjd56mcPyMlqgz6P1
 gqHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbCdQ0Ijmw8yMKIxBo86g2kzo/2cmL9VOVyy18ey0dyR7LwzEzMFlK5lmVr+3Giy62TyHyUPSDVyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywsd4owdvuQ4bH6TPrDWl6HJ6trWoDzJ4Nkm8k46GBI5FE/5ET3
 AXoxwME5pJJdLOHHtjC0t7u65ysrUr4F3evXUvG4EZ+QYgJcmyoHM27e9FKgeL3tqucvScIzA5L
 Vrfz0IgOSPFtIBv9og6UgUa/L4GAQgROo1ZJdQhkYt5bm/LdUvTQMSzNCca5xBfbC85s=
X-Gm-Gg: ASbGncuqVyEpk965630ssweOiji0ZoPFSRR1ynqiM/X15pknyst+5lCPqYXWaH7aU2p
 bb9946JXM6uqiVwhgi9FaDqUX2CilFP+q9D1R0Wlg5DQBEgso+uARJc7WV8XwP2tR8dLBGvPga6
 sveEyFtB1Ex/VVDwR1B8/CJEsuP1CkTd6x6nnS7hwaNRj+/rpPfm5MVLGtX/ZLI5th33zya+o7c
 ptIhFez+8zuMklQkUsH/031mEs+Js0GCHxnXTzIXd5VYSYulOaXq//1h27bOoM0IAIrJfE6WCuz
 pPFjglWMt6Avq04uB6yabH0L5wmetks=
X-Received: by 2002:a05:620a:1a16:b0:7a9:c0f2:75fc with SMTP id
 af79cd13be357-7b51457fd82mr154414585a.12.1732278107949; 
 Fri, 22 Nov 2024 04:21:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHmLTbwm8pNChveHbGVRdyKfjc2M6rbis5hRH/aHBrK0D9jZQQS3R1hjWKmaZIuM4R3iO+zw==
X-Received: by 2002:a05:620a:1a16:b0:7a9:c0f2:75fc with SMTP id
 af79cd13be357-7b51457fd82mr154411085a.12.1732278107496; 
 Fri, 22 Nov 2024 04:21:47 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b57c19esm92298166b.154.2024.11.22.04.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 04:21:46 -0800 (PST)
Message-ID: <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 13:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20241121164858.457921-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241121164858.457921-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: te_bnmeNTjcwGUb47O3oK9H8bTnTmf0c
X-Proofpoint-GUID: te_bnmeNTjcwGUb47O3oK9H8bTnTmf0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411220105
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

On 21.11.2024 5:48 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Debugging incorrect UAPI usage tends to be a bit painful, so add a
> helper macro to make it easier to add debug logging which can be enabled
> at runtime via drm.debug.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

[...]

> +/* Helper for returning a UABI error with optional logging which can make
> + * it easier for userspace to understand what it is doing wrong.
> + */
> +#define UERR(err, drm, fmt, ...) \
> +	({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
> +
>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)

I'm generally not a fan of adding driver-specific debug prints..

Maybe that's something that could be pushed to the drm-common layer
or even deeper down the stack?

Konrad
