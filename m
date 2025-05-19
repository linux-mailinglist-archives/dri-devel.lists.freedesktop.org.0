Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E14ABBB73
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6352710E265;
	Mon, 19 May 2025 10:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8m/+Ca4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2857410E265
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:51:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7Gg8G023259
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u3ZSSQ2BI0FEr1RhjtaD3Kk7h1vCtQqbskNrhnolMwk=; b=E8m/+Ca4Ch3aL3Jm
 J6enJbhJ25NnkzwelZrjmGWEssbSpQLQ+d2AAK0E0V/+7odlZYaXlBrZQCVFPSdL
 K/Ka3OZ4FA/nQ3GIZxkldtbpj2ZMFT9xllqKCqdE/F/XQsqCGrd6DuGx0B1RGHaO
 VRxu+lWLF8mH7hx7M0wUIT/al/fyqUdk8P64evDxMS1dkExDFKJP+uZbl+pZoZJb
 magn/m17S4d9V5vKcU1hTPQGY/h86MT8FCN+2lTZs3ubAt6SjvRgyitcdmzYlOeX
 0X4+yfvrdVABQjc1dT9/6WyV3mjpvXnLhpVhtzjPm1PiIPJIGyi0fNeCOZyCI9gO
 s3ul7A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rma6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:51:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b26fa2cac30so1358563a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747651864; x=1748256664;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u3ZSSQ2BI0FEr1RhjtaD3Kk7h1vCtQqbskNrhnolMwk=;
 b=Mhd5DyjSqdCjW22JSkbEYKVtDV8bi2+ILJCY6hZnJe/q2bI/5rrWNGgNdxB3UI0UKJ
 A49SzA1wDqrNvfXZ10gvDLScaq6gvPw7lUt1RBXNVvewPDObMUFGY+ugh69EUhZCKr35
 bHgWnZNxASuOnyAN5lXWiZmUosX3rAhDKoPJAxRuY09ZuEBO5kolJFcfL+VFA3+KkVIt
 x/RmeKxTF3TrkTaCx3IAHnha4QqPZzGiaI9IW9+z0NuSYJP2TnJb+l22XnlU4HZt22wd
 ltvlqpuSyXHimizWDb3YiGH9xj1B717S7tJN42zb9M8GsVLhkvXqoTiPMESuLZMvljGG
 xVRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAgGTl8UtsX9LtfhsSPNDfp/SH3bMxj79pcnsWo700P9cgNn6bsTuyRYFcXX4WtZdf5SuT8CM6ano=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBEHLWgEM9K7du9EqWwlwsQFhdZX/cCr3KKRpxXrUYMASlPQhm
 Mo+WfvBSXX6lwgRpIxAm2xGZfBy3BN69hIvbP9YlWzfmEUrtbTVRNt/livJwXtI6vhCKt+g4QNC
 uOySi2O1TTUZ6nijc7GRQA5A0DgInN9cbjUeOI/nE142Cnjxqs4SnMH0conQxBeiE1JG+F8Y=
X-Gm-Gg: ASbGncvgR8KxHyPPvOoV9KKPBIskyMzf/cLl20wOL9ksbqFFRuAiiisIOkMsZOr/E9O
 Qoh+16+INzmPbnCSHGhDwHAmwQ0pGhRtmHBceXiKTWnYWbe065jmV3ZlOcMVGL0X6+E3fLMEK8A
 i++C8f8NQ1cf91Kh+91FH9QY09Fk+bBws/9yRmZzPjZW7YVDBZaBOrQ3RAuhu37+Atk/wAcr41R
 t1oGJVGdRlSbB5ncVgR8r/JqfJ4x2sL3xI+knfjh9vLM0fB4VYfw8MtoKMXU3xsbUGvo3CVHgwm
 aklxPp54vT3aBOQsNbMulTjICVt4rM+/CABFEg==
X-Received: by 2002:a05:6a21:710a:b0:215:d4be:b0ad with SMTP id
 adf61e73a8af0-2170ce19e95mr18160184637.28.1747651863670; 
 Mon, 19 May 2025 03:51:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRUZHj+keYyh4tvRJA0RMopjYd9Ue0jtkb++xI97wCYj9qcOcTnyB+z2V9xA/ltGj+bmNFPw==
X-Received: by 2002:a05:6a21:710a:b0:215:d4be:b0ad with SMTP id
 adf61e73a8af0-2170ce19e95mr18160153637.28.1747651863265; 
 Mon, 19 May 2025 03:51:03 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eaf6e6a5sm5931497a12.17.2025.05.19.03.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 03:51:02 -0700 (PDT)
Message-ID: <2b1f5b07-aec0-46e8-81c0-9f0090828ef1@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:20:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
 <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
 <7svn6kgajzw6p7hxw3zzjbxz7ipakgv3gacbj4v3gxdw5ssdsj@lvj3hxn7qxu6>
 <c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMiBTYWx0ZWRfX6yfPkHZu9IhM
 V0eRBrQmID1u2rDce5Wepzug48VzFv6kSFzm99/jSUxhEFr9aYYvw9dSX/oZfzs9QE2YiTbp4uj
 bjPfI370604WSNdXQeuPwYj9JsK+wt3H5ZBRKxCrhkz3L0Ml6Bhk3cfOppLgpZNwTZCmk9QNlqn
 LSWr2t3iPsFw3L3d3KhrpVhQ2rGMFwcyFV3EiOslzh8KVbgLLf55l5QLkPfoq73F4uJk8rcBtGJ
 ulacZSaP8aYVUXPTTDcfHh3UQkTREWPDpX+H5XsGqOVmNNyiTCMZxC3LPMHj0Ys3orS4ipLFU/1
 /wZkbsqkKWEI03A2yTDXIkxqZ8Ge2vTeR5LMzkGMu+WhG6HKYpV/Obn05qsnKTsU0xq7aIJvQxE
 U0TKVeiJ/XQV8E5zL+M9pdFd9OAueVos4OiYhCj6z+9NkFQHnJc9pX0NV3YstqBm+jffNpKV
X-Proofpoint-ORIG-GUID: -9JxCdpmlEE8QKmo5MlZMfaAdRebpm4n
X-Proofpoint-GUID: -9JxCdpmlEE8QKmo5MlZMfaAdRebpm4n
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b0d18 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5nem0Mg8QPlJnJBmK2IA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190102
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



On 5/19/2025 4:10 PM, Srinivas Kandagatla wrote:
> On 5/19/25 11:09, Dmitry Baryshkov wrote:
>> On Mon, May 19, 2025 at 10:25:46AM +0100, Srinivas Kandagatla wrote:
>>> On 5/13/25 05:28, Ekansh Gupta wrote:
>>>> The fastrpc_buf_free function currently does not handle the case where
>>>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>>>> dereference, causing a crash or undefined behavior when the function
>>>> attempts to access members of the buf structure. Add a NULL check to
>>>> ensure safe handling of NULL pointers and prevent potential crashes.
>>>>
>>> You are mostly defining the code here, but not the root cause of it,
>>> What exactly is the call trace for this crash?
>>>
>>>> Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
>>>> Cc: stable@kernel.org
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 7b7a22c91fe4..ca3721365ddc 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>>>  
>>>>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>>>  {
>>>> +	if (!buf)
>>>> +		return;
>>>> +
>>> Most of the users of the fastrpc_buf_free() already have the null
>>> checks, It will be Interesting to know.
>>>
>>> If we decide to make this function to do null null check, then the
>>> existing checks in the caller are redundant.
>> I think it was a primary reason for a change: to eliminate NULL checks
>> on the caller side, as we do in a lot of other kernel API.
> Lets remove the existing NULL checks at caller side as part of this
> patch too.
Sure, I'll remove the checks in the next spin.
>
>
> --Srini
>
>>> --srini
>>>>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
>>>>  			  FASTRPC_PHYS(buf->phys));
>>>>  	kfree(buf);

