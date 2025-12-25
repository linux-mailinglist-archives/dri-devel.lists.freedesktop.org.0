Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B01CDD29B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 01:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA1C113CF1;
	Thu, 25 Dec 2025 00:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oeeaece2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XorhJFvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37268113CF0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 00:46:17 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BOME1YT496967
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 00:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JOjQHtR1y2v1403nVUZI/TN93ZvCJctn5qaK3e885+s=; b=Oeeaece2MZ3qzFTt
 7NKGkQzV0oPQKoo8SlhKKfk2ysifxGsgRQtqnSVYs+cp1yPIcRsXGNQPwAbmyS9c
 Pt5N3vtFiFS4HHAb0052LrkdcgtLjRkj9CJuZi+mTn7hLpzToguYk+gZbnmRJ65S
 CfcgecR5XN3CyLQg73ed21wwB4o3mbtyrT658sdxkhbZ+ICGY/g7Yn7CT0Gu2mqK
 s3q1OoaJ81amfAn4QPIVIStO1klV8CksbY0AR+cM7/Q4pqxWyvVZjAqwZ3xSMFW1
 FZTCmXDbwzW1SoaWSfVtoYYy2GJ+8G7Clbd7loGMuz1Wi64vJ3dzJhjWlM8U0aMI
 QNEKUw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsc1kt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 00:46:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34c64cd48a8so13877289a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 16:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766623575; x=1767228375;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JOjQHtR1y2v1403nVUZI/TN93ZvCJctn5qaK3e885+s=;
 b=XorhJFvJFh2w4oM0U+lN8aplDO3E93BAF17XSEMt4ICpPdGPrXJEFoGcJuQmIl/5nV
 yZ9nWeY1SKNjBHZ/nwlUqhqnSK0OtMvuQ9rlVLG+SjnJUdy7tCGvQeTuth8hXg2C8wN8
 ONUf/R8RqPKt03Ik4slnNjFrD7gJjdaEvGr2OpOWUAUleB9Fj35ltkyJhE78Wcozi3Qm
 RZiW2yypx+cF66u8XNIYRLSWhQNsSb8+kDHGvzFi0SC+jST8pP3fU60JEScSIUOScnHH
 2SK2ZyknqLwAg8FPx8gnWKomFX2IDz223dIrLKsYAVibo+f4iGbDwJoip50Xl93swRIV
 vGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766623575; x=1767228375;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JOjQHtR1y2v1403nVUZI/TN93ZvCJctn5qaK3e885+s=;
 b=xNDV3P3Xye05o8HdQGiH8F1RPSjN788QubcdpZfdmirIlJe8ndIdaPRJFA5ql1OCAe
 nof9rCxhZ05bnIzO+zgD7fnewNjX3lPsaJ7zJzpUOZ+6XulX6knHlG9v0XgLR/J4QX10
 ngVq1jb5InXfQjbo4k8VvnjEqzmpPj7A7wGREnQshqWANokJBwQgsPEU5NTyea9SiZZ3
 p3buvj8nAOdWmMrUY6ELPPxJpz6lqIcTtjK+2DGPolB3/FzKFt/Q3iHi/oDho6RKUp23
 MgnuauS23zP8WhCMvyIw9ixZq5wqrBQRF8qUXQy2DaokSwCRjTaa7iJhCRFJIsPBvp4+
 OWRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9mjKimuKl8mt0Sg6hKGnH+yUHuyLYV+V2p3IUuMCNyyx38rBdxZU14QzUv9QTb5oTp2qWInCqNrg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyOfVAt7VAYpM0NScOoEqJL+2vQHlVGF2tFK119KG5bk0/QLj8
 8leARhTe182Cdmp5EWVQD9hOJ5JmAkTvxEdYUBkyX9FpFlrE9nUaHLepWfYycj83x9JJ5/06LoT
 jRDuHHixYMLtoKv6Qm4vNm6bxqbIl7J8deod114gd4gH8IWA7s5GyrAm8C6dYCrF3iy5CNsQ=
X-Gm-Gg: AY/fxX6OhesMIKREScnHfZXwbjlQNnoLT/DfnCFK7VpnXZhhYcrQu80mUeGMyGN3SRv
 32MNzrtBMgN0O2uYc90uMDgajTUqHPOIF0vJQ/o3unKbOKX3uaAYsWEYPA5qXsB+q9WVMy47hqg
 NB/I2xxmOBVKTmva/5apxEdVPsrF4SCIq6q0NZIE7D02dYj7CYqJBRL+t17KnwF6Olu7wC0Jyii
 x0uSe3+fIgZcZMiaPnH5jO4d71JqkvOPq+knPajYpq3KrbWQgcrpy8Dd6SVM+Jv4VZSODMJ3FjU
 msF9BTL8dvWV56gOrbmMfZ5eM8DuxIzGNZtz91WvkJEXkaaGg8Y6JHRI6nl86r5vUnfMwzmxw/4
 Iftbp9Uc2XE9elP93jM97EdyCfZ4n+YYywvkR
X-Received: by 2002:a17:90b:582f:b0:340:c4dc:4b8b with SMTP id
 98e67ed59e1d1-34e92142aa0mr14731707a91.10.1766623575162; 
 Wed, 24 Dec 2025 16:46:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXP9A6tpl8ucIRe8Ods2JAIDC87if9iUX4kBKrYAcnz4tFgm7QZa8EUdMVTSrI0HLbzd6muw==
X-Received: by 2002:a17:90b:582f:b0:340:c4dc:4b8b with SMTP id
 98e67ed59e1d1-34e92142aa0mr14731687a91.10.1766623574691; 
 Wed, 24 Dec 2025 16:46:14 -0800 (PST)
Received: from [10.216.32.21] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70ddf58dsm19645493a91.17.2025.12.24.16.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Dec 2025 16:46:14 -0800 (PST)
Message-ID: <ab947157-37c6-4df0-9242-9d251defaced@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 06:13:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/disp/dpu: add merge3d support for sc7280
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251124-merge3d-sc7280-v1-1-798d94211626@oss.qualcomm.com>
 <nw6oxqdeoeckcqk4lycxyujh2uk63vjdzdpaddddkjb257xldx@eh36fawnt2an>
 <5ucbip23c23z5cpoevo5uxifl5de7mfipjfkhblyiw2vbxv3j5@h464opwvswrd>
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <5ucbip23c23z5cpoevo5uxifl5de7mfipjfkhblyiw2vbxv3j5@h464opwvswrd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDAwNCBTYWx0ZWRfXxP60Qbq8sNAd
 pF6zGwMAfwDSbKB1pqblC3kCdX5TD6VbGz7V96FJnsZMmVFRLM8BCbTf3nf1fhHkxZiqMI4++9k
 lLk5AfVFHrXF+spmpHSRGmLyqDd/0rsa5lopjOw/MSdjqTxXbPFcrN3EKv1FoQDy26FZpUR0ZkJ
 ID2SXksDsw10R2oSW7QiuA5iSKDwwJyRXFi2LGiZZlUnBglfoft5FhkglQFsZRniEQdmQD3w7EV
 c7tgYr8qUssUzLjMb9IHrD2NB/cQEo4NCDw3Gcy02OGfuH/nQ5SheEaVHEN64UdMn2LxZnWIjJe
 03h/VeuawyCU1UoOcDRIo9KqdJ5nJcDYUvcKWEQPW+aNikereD+nJ6hoIOui7GDGwoKUUXa55XD
 6453UkfrAIoWuMM5XFck44wEVUspQiUEmVnn3meAWwmVhwbCbfeY9zbq2uxubIvyB+RuzL+L4Xb
 nTM/Bf07tg3851va3Ag==
X-Proofpoint-ORIG-GUID: 2Szx458p53jcRHiZgROesuxfbLpi14lm
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694c8958 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Pw9t7XW4HU1aVLqCAW8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 2Szx458p53jcRHiZgROesuxfbLpi14lm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512250004
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



On 12/24/2025 12:05 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 26, 2025 at 02:32:41AM +0200, Dmitry Baryshkov wrote:
>> On Mon, Nov 24, 2025 at 07:57:01PM +0530, Mahadevan P wrote:
>>> Add support for the merge3d block on sc7280 which will allow
>>> merge of streams coming from two layer mixers routed to single
>>> non DSC interface. This change helps to support larger buffer
>>> width which exceeds max_linewidth of 2400.
>>
>> Please see Documentation/process/submitting-patches.rst.
>>
>> First describe the issue that you observe, then describe steps required
>> for solving it.
>>
>>> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
>>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>>
>>
>> The patch LGTM.
> 
> Mahadevan, you got review comments about a month ago. Any updates?
I apologize for the delay. I will update the commit message as per your 
suggestion and post the revised patch within a week.
> 
