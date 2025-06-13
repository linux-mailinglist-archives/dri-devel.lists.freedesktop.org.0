Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9084AD9596
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 21:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1C310E4AC;
	Fri, 13 Jun 2025 19:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSrPdwDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C1D10E527
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 19:33:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DHvgHS003701
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 19:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +fMLdwnRPpM/JGdtaQkyjB4OdZw1gHBXH2ofPLgbcHk=; b=bSrPdwDyVHDVY1cE
 FDtMc/JMZFLYRhZ6Ok535aWwgysIfTSbOug82ixcVXoINnwqCpHnxgxth9CGTkt6
 1irMAbqWu328Fqi67WFjPzuMDQ5ze21UntANglhyM8TeBdAqRJ+M2ZUdxs7RxbbL
 iJJ1m5cWBuV9fC5OBzkuAsa+dkUbglhBcF9fRHz6CFOK6JWSfQDOt1dMdvuqFz0O
 CRvZ+Z5KoNVmTjF7lk/K0FYvzIkpdH/aUI8iJNjxTVgKTV4AlLNhmqZT2tqcW1y1
 59EOksy005Df3zdjpMZeX+Bzba1rLEH+rb/iweSD62YV+X6px09i96UZgAWe8ym3
 BYigNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcvcqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 19:33:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d21080c26fso62573385a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 12:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749843193; x=1750447993;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+fMLdwnRPpM/JGdtaQkyjB4OdZw1gHBXH2ofPLgbcHk=;
 b=uB5uVCvq2+QhF+Zw16gHLAsME6rUvzlvE8pzz9bnfGmPEWcg8rnQ5heHo+RK0ff4NR
 irb9UMbcdcgWc+KTwLDYbEuPGkHUxykADj//EE/MUpOFQ390z/u52OcOHpVndnvkV9U2
 y/S8b1Fvp//D6MZnCoX3/3qUMz08GIcrm7MxKAbUIUeuFLCRrxgSAk8wIsEJbKk23CYh
 b7klrrG29R/ppO+Vf8BX/NCjkO7USvD/08QV6b3+YY5A3lqe9AfJqlIwyLg8oEDsFVAr
 ZqQ88q5iYVmyqj40ELSsKTM7Xis11JVH3KgWVrqfqRKUXGyreRYFrPpMZIGzs+v+uYWb
 Xo+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuu7fyLYYyuAPjFLR4mhKfFRyuSiI1iGHadZc+5OYJhuCtlBgOHSSUG/X8ZYKgAUcR9iJ329nwtkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxZsznxljzyIExNG7bhjzJNRzngTc6h5rUpTvcnVpbICYm1bg1
 cxph0pBXRXElbzZ2CE3/IezehnUaN6yD1UR5k3Nwn8yBMksWXW4GM+ubhAyqz3J1axMkc+jdE9H
 wH2Eze9ibQpT54R3MJmPpBTG1KZN0cZogtMuZUB0uO8AJNkkQlLFzcdQVVnMPz6hwChFbsqA=
X-Gm-Gg: ASbGnct9jDQ6yDE9RkDrOsbDE+VUT2JFBAQ9LmVOXwuXKtotV7WenqnIH1cuSFOgoU+
 godvQtLh31ZZCs5au07z8bpnQAtuzAGZpxIVxHP6aFoqIRr4/SOpUGzjbn9GjyCeAPXwjyT+Iun
 3Dnxonp+uboVxvoPsoQz2MnpVtnKw+P+6MgcbNp35DbTP1o8gGnWwtNLOTHt7E4xPY+sXgRYhj7
 e5O/T7ui7uZtyjmd/GWnJ2XHa1DTJspRifEN/l9X60pHvGqcHD7wAMjwfspbR4BE58WAc66r6Q4
 DFq/To0PMDLWN/0j855fNpp/6GwpYQN0nG09euj0KZh1fz3aRHGuHkdYlpmsECtvfdHVPxPJFvs
 qcOU=
X-Received: by 2002:ad4:5cc8:0:b0:6e8:fee2:aae2 with SMTP id
 6a1803df08f44-6fb477fe024mr3165326d6.9.1749843193263; 
 Fri, 13 Jun 2025 12:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH01QDZOiXpTt+NsBhAxASqjmghXoKA9xtVp0rzR0/hmDEEoJUb0ozfkNkgF193N2L9KBI4Iw==
X-Received: by 2002:ad4:5cc8:0:b0:6e8:fee2:aae2 with SMTP id
 6a1803df08f44-6fb477fe024mr3165116d6.9.1749843192890; 
 Fri, 13 Jun 2025 12:33:12 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b48a8477sm1589010a12.6.2025.06.13.12.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 12:33:12 -0700 (PDT)
Message-ID: <89b7c681-45cb-4729-9684-4d1f13595859@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 21:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
 <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEzNSBTYWx0ZWRfX7a+25N/uw29U
 Cnuxmhwi1n8HYQiFbZ0qbPmZ9X07raPxxcdpXK8DMCV8Gzw6I0fGUYcos1q2jZm/3h7CKC0aNjk
 he7IFVqwsft/2wxPhVVyR67hpt105jPQyjbfV3yO/dfvp5l8OfQ65xYVjMqSBjamOm+nmKbRhNz
 0sfxRIMyWePRJ0ucKHNL7ZalFPpBtx2lkow0+IUZEqo32DP6LRdTY4xJEItXu456VyiEGkOGl0Z
 n545rU16kTnmYQi46PASNwQbdQLYVj1vtDDBNjLNp1BqFr2Y9Ye3hHYIZ0hZgHPZWHQ5qodzSM3
 6xZsg0AxuEz/oV4h5ZkkO4XBsa2KKhcbJRihixOCgLePyjAzYy7KbsQ8sptRAsppqormBX7N3uF
 eOA5EGRs8AH+vYsr6s2ea1Jg7F/a4vWIMFvRMeVkSUl3d5LhzICd36yBq099apQY6F4zvQe3
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684c7cfa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=BU9CULlEoaguDH3JKbIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: aK50kCtsGmWBbpq3JNEuO4zB7freQwyS
X-Proofpoint-ORIG-GUID: aK50kCtsGmWBbpq3JNEuO4zB7freQwyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=961
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130135
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

On 6/13/25 4:57 PM, Alexey Klimov wrote:
> On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
>> We want to WARN_ON() if info is NULL.
>>
>> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bind")
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
> 
> Apart from tag problem it is usually a good idea to add relevant people in
> c/c. Especially when you fix the reported bug.

with Alexey's concerns addressed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
