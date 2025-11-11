Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7192C4EB30
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 16:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A0F10E5F5;
	Tue, 11 Nov 2025 15:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8DeNhzL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCtV5ddU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D667610E5F3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 15:11:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ABBGwnQ2301403
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 15:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NtWhBlV0ZGLBZySq8b2IGhCN1uzwyRzojwI9hN8eLNE=; b=B8DeNhzLRR4TLQlS
 pZkxFgPSE1kjPcDSeJ9xSSRkLax9QEp6yF2Ok3OwcqMUb0IE26fRyynC/Pp7e8bK
 Di0clgLVs7MBd5qpGyS3GGOvf+AIu0n/sipEjXvrln1ffkrSvdAr3mf9Du7irGNv
 9npTC7Ny1z46A/KndkWekKGI4jbgPzAOSL1MZxsxjvpgsBGNd86phFC7qMemy02O
 dfESceNQtYVskKYvJp23sRRCJXuPp/T5KCjHbXGXwfhxQZ9qmHyM2RJDxGAMF9/S
 EHtbw3ONpIu5M3IHIRUwizcwgcF2zdoxTrHSbOEXTV/pCvscZ5IScHKKk1eEsc7t
 bpyPZQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjxqkn51-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 15:11:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b630b4d8d52so3786735a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762873861; x=1763478661;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NtWhBlV0ZGLBZySq8b2IGhCN1uzwyRzojwI9hN8eLNE=;
 b=jCtV5ddU+pNxayIEaUh4Baixu48fEOskW1klgHpsrj2PDXW7hipM8ts3RfYYnbKg78
 wC2iddaKo/FMlIpdQQbr0T5+nmT/eI7EgdOz/ea5hBf9RpPP8ozU9/dWuVzb4jQyAqAB
 QECvqj0FF4PNiy4Y38q1BfIu+055iCO3A1ANUkwir71wO53l6PAhWs+AoKRtSDp0yiZ5
 mHMMB4FkfFvoewzkBVL2k6TjkfTGgTwmXJIC6+EGYAuxTQWTbsfDvVzmOkK2xZW3aDJq
 oxC6pwH0GCvVZOnaHy7zbb4xEqNc1RF5SK4b8WyEvAwp3mScVW0+rfhtS+d+HnyRkRZH
 WpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762873861; x=1763478661;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NtWhBlV0ZGLBZySq8b2IGhCN1uzwyRzojwI9hN8eLNE=;
 b=RsndKZO5lWcS0Uqb6faarAuwwnX899icdsmmYTDpQKQPJKEpwPxhm9MsiVp/HCGz4F
 7AktSLthirsyYjKzlS6HisxuktNMkpeDSJuwRAYQA/d0ilyJPbPiQUNAiUAudDUf/Ovr
 GD0cZdZg9O7UKjvTV/GIHNBcGqJPOSC0mTMWRv4RxNYz02tttXYpF7VnEZTUEjzv93W5
 IlKBBI33lg9qrX4JbNlOc1OAxczet5lYvD5kFeHn7NvNnKcu4m9ahrubTjXTvTS3WGWW
 nJu5+capHtTvna+pXDK2Aq8BD2vreVk/IAaZrLGuvF4EOJ0QFgTuD3Hsttc9Um6FsCG1
 KvwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlg9q+jjPRniBY5X/ke9/TV4BvGNQx61olocmLajFl0ABG+Dh0yfqPq7HUlsZAXIdm0KxF5wSd4ys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjwTGwBtiVoxe+A5ovVA9gnCDqvSGG+0wkM3lve1g4eCfGKWEY
 M4caDQquxnpFBsWlAICKb2mNLQFDhE7gNi9ZxIXRZkSyY4TQg9aRmYdVpTHHTic7snUopBucJHF
 VUinqyZemDIcrKtWWs9LryAZSKEofRX02FNjnR9gUv9k/2V9q+TUUbY2MSgBilnq708XdG+g=
X-Gm-Gg: ASbGncsrJ4q1BqX4ZLvddIz8oo1EcXhdZrbKfVwrCPZmfH3D+cOdremnPaXau/vLUJ1
 /RDXTEgl12VxUEuel6LsiWBCw5XwlpOtJj73nitr1Ev780hOU6mOt7838We+nzrpp9TB6rAeg49
 ooOCSiX3Ha2yMO6Wltp5cTsfKg5CXAC6l6cJJfseAtyo10RsDBIdLO7IWzgWTS/HfmezJxWl5/y
 FkDAJzgrLy0NdixupV5F5EzzcVfDaRWvv3nZ7fbdrZKEgKqJIqCTtID0cLv4+eOb55q6YaOn8du
 jno5Zbwt/5+EGE5Bfob5jnK8dpYFUgDksqZEwQvVFURRXyqtudhT0ocOIdItQ4iS5hNJLObOwhs
 OD6iW69j7xrVFi5i3qe882Q==
X-Received: by 2002:a17:90b:5710:b0:340:a5b2:c30b with SMTP id
 98e67ed59e1d1-3436cb21a6dmr19109669a91.9.1762873860811; 
 Tue, 11 Nov 2025 07:11:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNf3T6rQRdI+ynvsyLg96H/Cq6hXZuZujE80OuxKOe522yI9DUPjy3z+RAOvPojmWw+JmU6g==
X-Received: by 2002:a17:90b:5710:b0:340:a5b2:c30b with SMTP id
 98e67ed59e1d1-3436cb21a6dmr19109605a91.9.1762873860285; 
 Tue, 11 Nov 2025 07:11:00 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c344838sm14745324a91.15.2025.11.11.07.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 07:10:59 -0800 (PST)
Message-ID: <65714302-3b71-4a15-8647-ad707e056302@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 20:40:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-1-a2d7c4fbf6e6@oss.qualcomm.com>
 <abf79d96-72c2-453b-aa2d-0626be584baa@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <abf79d96-72c2-453b-aa2d-0626be584baa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEyMiBTYWx0ZWRfXxIHGjSHV1zAK
 fDrolJ47QcErAa6VBQjR4IsyZNkiIrQx7FnuTkKZbBpGA9IA8RumJisnqMbuTrBu2lWJTgcnzic
 YB/Q8EhxnZkgZFemkO7Nwtp9jg39zK+cQSmHN1GNGcjm0F2wOwa3eqL6dxad+91WG4ioJKUGUgn
 WSu6QB0J//Lf/YLlvTDLoE6lkFREVc5s0jjd5BROKLYcNFc+UNF0t2VsqXgGJ0wEn70cAMg2Csc
 JTSdOjEp//cilITFdTrJgLPcqasx2+cCGw55YEPjblLTrr41kp054MSVwLbnt2oj+o0uOJwcezG
 AjDz0Lx8xnj6jUTBs8XenqgD70NpbLdXE3pTEEn1W8aOBMPJnPYJ5IhZlKN1uv/r2tF1jhuSk/o
 X9ELGJhyz9VZqTJ6qyuaEpHLaKMYEQ==
X-Authority-Analysis: v=2.4 cv=CsKys34D c=1 sm=1 tr=0 ts=69135205 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qJyp-pYZgGMIYD5dL0UA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eNJiAEBfoP7lR4ftR6UGeRynFlk34Q3n
X-Proofpoint-GUID: eNJiAEBfoP7lR4ftR6UGeRynFlk34Q3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110122
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

On 11/7/2025 2:28 PM, Konrad Dybcio wrote:
> On 11/6/25 9:50 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>> of A615 GPU.
>>
>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>> which is a small state machine which helps to toggle GX GDSC
>> (connected to CX rail) to implement IFPC feature. It doesn't support
>> any other features of a full fledged GMU like clock control, resource
>> voting to rpmh etc. So we need linux clock driver support like other
>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>> This patch skips RGMU core initialization and act more like a
>> gmu-wrapper case.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  	/* Enable fault detection */
>> -	if (adreno_is_a730(adreno_gpu) ||
>> +	if (adreno_is_a612(adreno_gpu) ||
>> +	    adreno_is_a730(adreno_gpu) ||
>>  	    adreno_is_a740_family(adreno_gpu))
>>  		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
> 
> Downstream sets this to 0x3fffff, but IDK if having a timeout too
> large is an issue

I reviewed this. It should be 0xcfffff. It looks like the latest tip of
kgsl has an incorrect value for a612 gpu.

-Akhil

> 
> Konrad

