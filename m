Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4851BAC03A6
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 07:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E209951C;
	Thu, 22 May 2025 05:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7MTAYN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEF69950B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:01:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIFCaV029153
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NguXm4WSpZwqx/Kmkhi3HpZA4psVbbg60toSxwm/2O0=; b=k7MTAYN483dQAOFt
 s/oWC7P/5M3KlMd8ARsGibdvzc5q0Qw+filZYucDDzpw7+vtKHg0bT1FKrEGrDma
 ElgABAl7Y6+iIiZVGjkaJKEZbh7tS27RgdbMvhyqlZrf41gNxyiAs81G+bjJEYyd
 ZlA0i8Bri6dZ8HJ9AJFXfWezEk5tOenlitwDnC9pSgB2TrtP2wCLQD3nT84zFXOs
 Njrv99lb/Yb4B44hg2NsDTIUQsNkqfQZO0uOIWqSUt3bL4W28pIpTcIi1pN3xBc1
 LUMq780a1L9tGgwpw3WvAPsE4SGXbm6wFCPIBsP3tliV32ZGuu2xjlns0T6etT6y
 L1o48g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf45476-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:01:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b26eec6da92so4312567a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 22:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747890100; x=1748494900;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NguXm4WSpZwqx/Kmkhi3HpZA4psVbbg60toSxwm/2O0=;
 b=QlWnIVD5ib9rYGXWYw2oS+w3FFNr4mmDbrWjA9vgfE3Ga4oFzoc+lMzfClUGznfVOD
 yqkSV/ph63KLerMhL+UDAi9jlOaH1NDXdAbh+knev5iHr6Y2Q7kOJh5mF3poy6tX5ds8
 ZDPJJZ8+87cGLBJ/YdO6okxKo+aLIV+xD2R6IvCEwUzNHyIh+h2MOMIlAPnbwgZlx7BP
 NXbWsMC+jcPB3Bkdbj6AWvp2TC0NgK8nHyEjab9BrjV4jZzv1/OFO4vv7Tfh9FcdRMzR
 xpcLcGXw2+EANRVgo5EQFplMHdrdw6UbSA1kO+CGB1VI3upG7qPHt2UDEJ/xjBkixZsF
 1d4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNjVBcdBJeb13siyWD4oHuysWXdm0hxH1RaNl3TU1BF4rrYqrqVhbsNskcHkCPcdUx8+SkyUKznjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCQLzuiOPc8l5vbqJr0DBEsdW/dFslERim50Kq+oKFr6KqtvdM
 dpv3Cgr3a8rA2XNZaPmrZFjUfuMz8oUeTrbfWkEvkruijUi0TjOywbicX5mGwRDgLAzFiNto+Je
 y3tS92xr29MUWOn/YQNyWIylGecJKFhwOf+WEhZ5ifnXWEA1r7XjqBqseydMYI6U8XFKBhb4=
X-Gm-Gg: ASbGncvH0jvhssyGbSU+28t5IC3I2nSD4nZ7rUGf23zs3nLR3fdpWlZNna8NfUqR9Qc
 5QKkU7DIxrYSV2vGqXzggso+Zmz6Ks9Pp8Lvk/1bkN3zfowGjnxo+WXLETOtANCW2NllbM3OXS+
 dH38SPck8BqNULuh+GtKfpP5ZRvlN0s6zKR7WxzO5+YwwzU1IIk6yL+uM3805Z86tLs1N+8YY9q
 71tAvuItCW1YPS9B26tvG1MMnPi7R/Aoff3cYaeEXExhNYtXfN3jNj9/kzvtgyaB2Di8qrMnOHH
 +Y47ssvqI0UWRlfp6lyrugfG2Jx+VL8mWqw6rvE=
X-Received: by 2002:a17:90a:f943:b0:30e:e9f1:8447 with SMTP id
 98e67ed59e1d1-30ee9f1850amr16977017a91.4.1747890099784; 
 Wed, 21 May 2025 22:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8WP7wi8k/4svaSUleZJvoLTwWHT3Rb3bGLTRbKSE5yOdFgLg+Fxp/WkOQUjL1YK/uYfk0iQ==
X-Received: by 2002:a17:90a:f943:b0:30e:e9f1:8447 with SMTP id
 98e67ed59e1d1-30ee9f1850amr16976988a91.4.1747890099336; 
 Wed, 21 May 2025 22:01:39 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30f36491d85sm4591925a91.29.2025.05.21.22.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 22:01:38 -0700 (PDT)
Message-ID: <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:31:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0NyBTYWx0ZWRfX/kI9B1/ngx2r
 jx4ijj+jEL7LGrGJzA2ST3mp5GXIS6zhIiRZ5ltslg8qDaZyv2k+2b15AqqBYK4A60dOkKWFeZF
 rAB4ApJOkmvPRwrOKi14zCvNDBtV/tgr5mWy9cb5Gkm0MhYTPBwIs0hx8TfgWMTU6xWAdEDPIVl
 KeqzFTzV09DWHOoV/ZY4ZDH76P9wft4ZL+8jPSCaRb8rm8p80t5GHaTxLXcsluWsBCr1Y5biWZm
 vXqdvfaGCbWvKSOTWcwNV+MLz9qV0boI1OjpODJ+iDFAzrpqmKgxLtY2QMcf2gpb8vq4FKJsvdi
 pkKVttkHw0F4wZ+Tyd/BZMGs+L3odQ6tX2U73E8saCSp+pOrNc0Iv3JiI/ptOuKGzboP5633oKh
 3o1Xv8JCpQtOra5NlaR3vY6cT3pl0rh42xWtTuEyM0u4okcy5t46filo9/0GOdyGSmE8MuQj
X-Proofpoint-GUID: _jTLsimcQQJdfrR09y2BjOg899LdR15B
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682eafb4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nXvCle_wObFXJBZB-yAA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: _jTLsimcQQJdfrR09y2BjOg899LdR15B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220047
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



On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
>>
>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>>>> User request for remote heap allocation is supported using ioctl
>>>> interface but support for unmap is missing. This could result in
>>>> memory leak issues. Add unmap user request support for remote heap.
>>> Can this memory be in use by the remote proc?
>> Remote heap allocation request is only intended for audioPD. Other PDs
>> running on DSP are not intended to use this request.
> 'Intended'. That's fine. I asked a different question: _can_ it be in
> use? What happens if userspace by mistake tries to unmap memory too
> early? Or if it happens intentionally, at some specific time during
> work.

If the unmap is restricted to audio daemon, then the unmap will only
happen if the remoteproc is no longer using this memory.

But without this restriction, yes it possible that some userspace process
calls unmap which tries to move the ownership back to HLOS which the
remoteproc is still using the memory. This might lead to memory access
problems.

>
>>>> Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
>>>> Cc: stable@kernel.org
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
>>>>  1 file changed, 51 insertions(+), 11 deletions(-)
>>>>

