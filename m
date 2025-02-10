Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57748A2F397
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 17:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E6310E5B4;
	Mon, 10 Feb 2025 16:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cn0JoMwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5317210E5B8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 16:32:25 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ABg7Ek031872
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 16:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PllHdGFA8xSW0690rPMUrAEqzelfEIRuIJxgSYa+UlQ=; b=Cn0JoMwZEOyoPkef
 61kkoxfOO8ACryC6Dz0YVUUIuK/gbvwFhhTs6OuNOwazixlUJJCm+GW+Sgz4Bdev
 NI4OlSvfNmM0ilNyUagm/sBmSUnPrAb2ze7+t2hxVxFxsFLWp67rrppA5TtYa+aD
 5PwSa/SmbQLC67e45REnAoXtBBJnbXEXdLOMDqG2xYNI3I9pxn/ERV9iHyhF33yf
 qba+zQ/kZxr0L9AGSZw+SE8XImfJZ9wqxIHz0+dgB/B191xN9/fUGG/3dTC+9tVF
 zTjQcFrEL0y7wmafcq9tspH64NgPEzOok3vR9QuYI1kla+ullsQK0Hb1f3Ro0tYN
 uOaC9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk0qwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 16:32:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4719ed0f8easo645681cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 08:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739205143; x=1739809943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PllHdGFA8xSW0690rPMUrAEqzelfEIRuIJxgSYa+UlQ=;
 b=RRBnaADZ+YmUW21+uT5xCD32j1WvjJXd9BZDjp4YZZ0S0i52yqAem7447jl/LMIyr+
 CnIeGOmjhpDmRFZ7zMvMahduTRaZ3HvxbbQjtsnYi8ZMYWVXTa4xa49KKpWiQ+5T6GwN
 k9jELPl+CIUwC2roTNzPJ3LOpOLukzBwgfAAn4bS0JC0sRfXqdwqcSEYAbvAel35YEYK
 lKsV+W5+2cJjHok8GkTJMShwBogIzsu9ALVqhc4ZLsGS54ysUxkCgv3tD6ycmgzJLZTt
 qGC7GOmDTTJ7fZlyx2zntTKbyZ9dbp57aKj0To3kzMQA6ehzKGQgwKVK3nroGgWmOv6Z
 dHJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiLnbmjv1znJF9H/yTKzcIozVZ9wlAKLgmW6KhoD5qAi0Lfe1G72F6Nv0qxPoFCMPFJ3fabyUPKpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvtgUQ71EClqwZYXZxWY3kJBDuAfxuARkAGD3OjG/vtNW3f66X
 YV0E4Qh3PgLFVCpmn/FuLX6R/pFRQXfD661WLNkaFL0LkNQbGZ3z17E5z5GRSunuPUg2jVBzQt+
 9epFIwCho15ucovK6uPXfqRPjinoROBoc+FBbPqadjuCnCWqnANNtGF/gYkc+1kmxHrE=
X-Gm-Gg: ASbGncuyjZA1w/2NMms8BuVQgEQsNxpPuKoIanqerFy9d46nlZKbWC1GmWDoUFLwWRK
 kZCgCHX2hTxZ341vfNLjAj0EQa5tHgU72NO918TLXu3g6LHnxUHcL9vFlGe9KHGZHQF74R7qdpl
 tGQqLn4Yy5dj9aG81pD14QXQmR5NeibkSSfpkBLtr+P6pK9emOArfhk7KLDImQBL+os9UipXBqy
 PsauUt/bEt1RVdIvTcNXLTIRgWVrtZ7+TtK7NWw0DEe0Pq1vyuhkKkEb1BfMZDYrgBnoNEWPZci
 sTJPLzW+kThnhzYx7bQwpEwC6tVB9rHnqDvhvGoRyyOSoK2FSbog7iHJXa4=
X-Received: by 2002:ac8:7fc3:0:b0:471:9a28:9cd9 with SMTP id
 d75a77b69052e-4719a289dbfmr10935551cf.12.1739205143338; 
 Mon, 10 Feb 2025 08:32:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5IbZNKFe36TXsRdBve9RfSnI6zfiiQRD265XZv9cUtcHZVy3F19fELt4eG6KVJYmaMFNtpQ==
X-Received: by 2002:ac8:7fc3:0:b0:471:9a28:9cd9 with SMTP id
 d75a77b69052e-4719a289dbfmr10935441cf.12.1739205142905; 
 Mon, 10 Feb 2025 08:32:22 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf9f6fa21sm8114981a12.68.2025.02.10.08.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 08:32:22 -0800 (PST)
Message-ID: <1ffe8c68-3668-413a-a289-51a0b6bbc8ca@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-4-54c96a9d2b7f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-4-54c96a9d2b7f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KCDSjnn8GXyfN3lJyO2tN7HPLZnw0HYM
X-Proofpoint-ORIG-GUID: KCDSjnn8GXyfN3lJyO2tN7HPLZnw0HYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100136
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

On 10.02.2025 10:32 AM, Neil Armstrong wrote:
> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> add the missing cpu-cfg path to fix the dtbs check error.
> 
> Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
