Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE5DB9EBC0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 12:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E77B10E2A6;
	Thu, 25 Sep 2025 10:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBbXJq9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE86810E2A6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 10:40:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9tI5T029443
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 10:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hkrub1vjfp8/J5x0I8lwP41qVsopVVAqErZdeoHT7KY=; b=jBbXJq9A8X3vT/px
 p8Yol/YmZPOKUckMtoJP3NoRKnA0SzIlKkDdBGUkgXDwwvhNg5ZgkbFy+z9HL3ev
 vahRVXNh+BSY8B31EZcZE8062mRi1JFj+x/fqEG1ETpw/SXlIYGxq89XGnVEXley
 YeCKN3zQMl67ONHAjkXYHBeQgsmzPb3rwjTn4slMZ6nrwlpRJX5sN1dmx+vVl/T7
 /9KO/qy2sDJ3fN1NoPvIx5MsJ5OJhl5Ia1vAOGrBNy8fgPHhcX1yd9Hg9kbnjkQO
 j9yn5wEtN/Yi4SADHGVI6GEq17I6tcxuj0kXO774qQVt4goCQGZxQHs8b6hBCeQm
 YHx0Hw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fqnf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 10:40:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3304def7909so896586a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758796825; x=1759401625;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hkrub1vjfp8/J5x0I8lwP41qVsopVVAqErZdeoHT7KY=;
 b=WKwSja/1KU8XWn5JBn0tiOHX6ozPJvZrKjZk0MOWgS6/P0hGZGWnnjMFoHt/nzJbcZ
 L6r/eO8qhXhFbz+piCx2q6VHNjfNJW2dvR3wLcTuEoCKnn+v8cVOkgKJ9VQ0qLfEtFDs
 9CxOHJNI3nEJ+YlsEt5dwIZdRQ7bnl5SKnM9LlPjocGqOF1A+D30xs1FgnDpbkH4VQNz
 u7k5U4ZcBjZ3VFlPSkrhHXDw4AzSud6c3VRGuGgVM0LfYwBpqqF+w7Jf+xPRy1jzYxRQ
 hRbSnc71tZxwzB/5SO7lWfCn3xgbpI409fKpRYUHg30RCYufEZT2y6M312wVJ2TzQDdJ
 5vjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPr5ztEEDQqD6xWlmrVrD+NFagAF0i8aD+P2+D+Yiw/KnLY55Isdy1qsb/IyFJkY3daGkKVyY9AxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0zN8RhGB6pufGCkwCtk2snaluQmJEZ3vHG8JCosQLiDyxHAIU
 5o15iLhYkqwbIwv1P7txsJO26Dtf1QXeGbwcD1u85R52QmBS8TSekD7oSaY9PLngaQH35MCU3v0
 s79+0mjDY9SV5ozVfUhsEic47RZOHJhWeigKjEf3MYN0yuvL+1BjGU0njepnBe5x34Rgzdl0=
X-Gm-Gg: ASbGncucMj0MkVlcmCujdPIvruEToeL5Xukw+cvU6nxv7CneZdNlxVdTu3g2RyeUnqF
 crfkH45ztnGbUOaMvoee0kL/eWOACIWKEw0d/iF2sCeQp1VRcO/+2kWM+0NkK9mZdOSOLgDi2BA
 t07LBay/xKWfvwhjjSdTHknZt9K9jyxaKzzK4y6vt2cUs7EK8b4iG1i3h2g8Wcaj/Lk26gG+eGH
 Py0z88URjX8wuC3r65AiTdEV3D1rp7v97wCBZHhoweKH4HE4sXTnanHz4jBgGSwZ7qF/EGhQnFo
 co8uGjiod/1TJSp5Oyiq3LLnQ9PvOkYoewMKJ0NreqXl9U3o1714/bGFAZFOYkrVekgun97qPGI
 =
X-Received: by 2002:a17:90b:1d82:b0:32b:9774:d340 with SMTP id
 98e67ed59e1d1-3342a2c66cemr3725557a91.33.1758796824605; 
 Thu, 25 Sep 2025 03:40:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGA+HMhVlFvkRg4P3UZGYiYtHq2iFZKBbWgE6XeeuHnOxopWausReC6LBLc/123h2UNoU/UQ==
X-Received: by 2002:a17:90b:1d82:b0:32b:9774:d340 with SMTP id
 98e67ed59e1d1-3342a2c66cemr3725523a91.33.1758796824131; 
 Thu, 25 Sep 2025 03:40:24 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be2073dsm5353299a91.19.2025.09.25.03.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:40:23 -0700 (PDT)
Message-ID: <41adeb71-f68f-4f50-a85f-5c7dfb5d587a@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 16:10:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 0/2] i2c: i2c-qcom-geni: Add Block event
 interrupt support
To: Andi Shyti <andi.shyti@kernel.org>,
 Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
References: <20250923073752.1425802-1-quic_jseerapu@quicinc.com>
 <eobfxgtssuiom2cuc2zlsvc2hhyi2jk7qb7zydgo4k5wwvxjlz@nksb3x6p5ums>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <eobfxgtssuiom2cuc2zlsvc2hhyi2jk7qb7zydgo4k5wwvxjlz@nksb3x6p5ums>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ff0xMp9cCF0xxMqTSioXKrkfrPvCh2AI
X-Proofpoint-GUID: ff0xMp9cCF0xxMqTSioXKrkfrPvCh2AI
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d51c19 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=GtlKhm42p6TeGv8Q4b4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX1hL/HoV1zVSp
 hQcBgQmCRATjPBvPP4KPzgOF8C+uHZPcJMPsFNOi8RxDwgRzFP0xD3XJWbOmL5ecF2ZVlEtl8tp
 AupFn6Ekp5cVgDhHsqPJdccp6N4DAQqtH4iughqcM5O8H5Bi62fbT1dDCbuGPnCAuRldXn9HkoA
 UwEfjsLJDiltBiGnRqXPCknpIjpAHS5ZqwtJZclPnLsa/d43PsroO6LkodxuSH6KjFc7fDmjubo
 Bp+gleU2ekoqUMEmoGEGoJ8dQsc1Tq+1eoUhKtnQyWzsjB0J9mt6/gPhYcNJwmistSetDeO56xx
 DdXgiqqN/TW3ft9jh/QfhGDYxkfSonTMG8VbmrC+bOjQ1Kj/2pQkVjW7XNno3oridekOGQ2mqoi
 heK1n1PJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037
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



On 9/25/2025 4:58 AM, Andi Shyti wrote:
> Hi Jyothi,
> 
> I'm sorry, but this is not a resend, but this is a v8. Other
> than:
> 
> 1. commit log in patch 1: removed duplicate sentence
> 2. use proper types when calling geni_i2c_gpi_unmap() inside
>     geni_i2c_gpi_multi_desc_unmap()
> 
> is there anything else?
> 
> Please, next increase the version even for tiny changes.
> 
>> Jyothi Kumar Seerapu (2):
>>    dmaengine: qcom: gpi: Add GPI Block event interrupt support
> 
> We still need Vinod's comments here...
> 
>>    i2c: i2c-qcom-geni: Add Block event interrupt support
> 
> ... and Mukesh and Viken's ack here.
> 

Sure, I shall Ack it once your comments are addressed.

> Thanks,
> Andi

