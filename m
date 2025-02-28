Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D371A49ACF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 14:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC36A10ECA9;
	Fri, 28 Feb 2025 13:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D74YUx0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BA710ECAA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:30 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXMKV011828
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uK7XPFL9iClFWAeim23sLhZiHmmfyDn3gazcoBk2iEs=; b=D74YUx0MGKkLqrsn
 plW6U5fatD9Sbz8W3JEK8uNcX54S7V0YQiMTX8G5pMmVi4cCd16z0b609MWeZ00P
 3nezOn4EIrtoBkaLJD+2lBYeMYUqLneevM8qHRGU0sz6hWrmuiFKZL6YFRWtC5T8
 YrLI6phohOguy3bQjB6jKTafAteWHSzJagG477EWpD/vHNRncNS1ic50tTLlLzYA
 2mkOPSxvXHT1nryaD/b7qjfKeCxwCrlXVyIvHvr91xVjNXJMfWLgBDMseP9OkT1N
 OKjvpxlMMKlTSUb5XYqBeB7wwv4xfudSRUKvETzBmSdTK5cmNMnomkbot0YzKQ8f
 bBwxYA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4522skykgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e19bfc2025so3867366d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740750208; x=1741355008;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uK7XPFL9iClFWAeim23sLhZiHmmfyDn3gazcoBk2iEs=;
 b=eI/GvXf2kqyXgXsLPAuPU9nNfjdjE2kzEat6WPybUbidL45+H/nF28L+bKNgZCo8cs
 pKxt22sdUj/j6slwYrNkkXynGhxHRt95VgPiV2yg05uN5hDdH1Q9+LxdNI0GLw3sATh7
 b1Ra8yx9NoVBNPvS+qBuAFLUyx9GkbX6yYr8LoTxW4yLmBS0K94YI3bhPe8S3okz2DY2
 XmQFAOK4gbHvWtQzL7fDFb/OhEuYdkr3qAOxJwKpVOBH46CTAN+YDC1e7oRB15rji+1E
 ybrtpxYngxkHMWHdujj2FQfUO4CrFru5lrTiSwWQhyvdOopvkwvI418fvcfIwdUUDGqj
 p2og==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjlseuJbK9bYLPWXbqeoi0nozBcYuRZt1DMpPShiBvRacd6WL7pff2HUFmIjByOGQfr3de6PgQUYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvt8yC6l9X3lx5jNmxiCdxJwxcBsOFB7zNdK8szxV0hlCq9h3J
 LtTV9cbmKxrnIk3mgp7oP10Ebh6mh68tvOUJ6dVChkQ2S/ZyYhJu0QfCC+ZFKa+bDcWuKnZWTFZ
 aROVlxK/VZX25EIcOkz7syoxodHePhBihJScUm43q4EhX5W8dvKUoGFI2BHTb+ToFNLg=
X-Gm-Gg: ASbGncsg1CoO9HeIGJF/0ZuRbHEXy57I95hIbj2RoRRhfrx+VLVQB09xJkvF0Ztyr/u
 rCFV114ODFs4TudqUTbpnC0PGBFg44nPu4LHEjjbUyS3ci+M+zQUOUKzxRcArY/e9T4YGXWfRht
 Jg2YQ6e4/24lA8TmERKv5pf8dLEQm7pJj8nOWLCVI+Jf6wkjIDSdDDLN1ea+/n1XCvNxHUs1msc
 mrfYtqQ/wnqGnHy/Y7mMJeIfiU/yTQmFKQTT8W7liaInrxlZoPFUAcJoV7oOmaI1N+40V1mbXjS
 kkh0DfV6VORxAWrge3H4TZg7xQN2Ld23yGw3N6svmemx4Gr+gzeNLfu61kdzK4RdGIGxVw==
X-Received: by 2002:ad4:4eeb:0:b0:6e8:9c91:227a with SMTP id
 6a1803df08f44-6e8a0acfacdmr20127946d6.0.1740750208593; 
 Fri, 28 Feb 2025 05:43:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6LsgtGwg0dHHSjda+X6QBa3Lh1LM3XCxwbSPqdc++bbG/PxqnrKamtHXvnvNs9sSIfeIs0Q==
X-Received: by 2002:ad4:4eeb:0:b0:6e8:9c91:227a with SMTP id
 6a1803df08f44-6e8a0acfacdmr20127616d6.0.1740750208096; 
 Fri, 28 Feb 2025 05:43:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0dd6ccsm294572366b.57.2025.02.28.05.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 05:43:27 -0800 (PST)
Message-ID: <aca6056f-cb53-4879-81b8-3d9f0913c571@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8953
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-3-b05d22fbc2b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-dpu-fix-catalog-v1-3-b05d22fbc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sxhpx3qv6AHOcdIvZ-6dDX7I_qwbPf6R
X-Proofpoint-ORIG-GUID: sxhpx3qv6AHOcdIvZ-6dDX7I_qwbPf6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502280100
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

On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask and, as it is the only remaining bit,
> drop the .features assignment completely.
> 
> Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

With the commit message fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
