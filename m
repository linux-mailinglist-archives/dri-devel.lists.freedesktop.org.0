Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1520AABBB4C
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883E210E12B;
	Mon, 19 May 2025 10:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtwP8YOY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D9710E048
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:40:17 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9hkCT027736
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gNunvHAyKDRuQjsR5Fk3dGl22lS8zfx04q4ZmVMevxI=; b=jtwP8YOYH80PO8LJ
 ABnPoGcVt+YjCrc/xbkA0ZoWc9MvForvYW1qzms6fEM8yHxPUqCwLblwcWi638cr
 mJZFb0IOwRavM2xOgLL7epeUznpglQbpq7ci/9/ELs7XokMmBrjnQsQJcRIFfDLR
 q6fJf1rYqzhw7x2ucFyRdAPZOBczO1y0r+r4SV3GjVwRhvObk39Mpi469fbvDB/R
 W3DjHLs9he/GdyOd7tCXvzGmYI8GN2/CtzUX0x3WHXu+Iy/pllfBEyyqirtiEiGM
 BwbeexUJx+C+tn+3hZ0owN4gp9CIcuDe2WRyHSIWru50kDha20odrLYS3BaqhD8s
 sVrtbw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4v2qt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:40:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8cc1c047dso26021316d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747651216; x=1748256016;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gNunvHAyKDRuQjsR5Fk3dGl22lS8zfx04q4ZmVMevxI=;
 b=p9paWRf3ZrrPLKF/+F+o/qM+SNdEuqpVtHepCW9JvVCIiYZ/SK75Eep6QBe79avc7E
 r1rUCvZGa4hD2jzYO/mVvO5qMs873FjtRvJFOvj/n3CvnA3rIYM6yph4BIIAUtu3vtr0
 j7ymeBZ/mgcZ5QJDI0lJj0Z98c4i76ccu6HyPKzn9Do8OhwcLwY1+/0pB24QItlbcMcf
 w2JPTwQvyr5+eT1JA/3+rLGHb660f/1Px1Lob1+If1m8hPDJ042r1Hfc+g0losO9smU9
 1Zh/emUIJp2hZmbV7rMqaRsikshgawmZXDlpcOLMWeSvkf3Cv9byYQ5LR50gJ7pOJrEf
 szoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3VbIEObfDDh5nJkZuszGsFZrLjiZiMkVSatB8YEGqv5JIeLgLwgzYHtuJYk2Sii53B+H49NaVwGA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxypDwW6ciNLG/5Jgg35txki5JyTMMZI5vQUGJJ0fgdtVUSGzC3
 aKKSmPcVlA4Y1gc+kclwgWapQyeX4pMXq1RDM486WS1rJl/7ErnWwZxdyuMNbxvqCascQBds1aC
 hnCzdXGv1TVLR5bf8WUkI9qY5C/WFfu6ntr3woUVTi7x4+4ZGhM5wx8Chwx8xH1oWUJwnzSM=
X-Gm-Gg: ASbGncvD4FLjgQHsvb0RofH6G2KCpUk0LfrmfDDgeF7yw6Wn/9/0tp7zSHXWJUevrIe
 TmeosNALyAoWwVqvkqAfbKIu1XwgxXrOPNvDgMh8WKiPutIGqw3qwJsf60iVV6uBo2zhdVuCK7Y
 66F1lvehvXF6XaGuYRmYi8zqfk1UaLddTI7FSGe4WLVQSlWnbxLMm5fElNVmLJZwNbLWXMeHpss
 zb8ABGSJvev0g+XIccRs2ijUn0su4w2kPMYabYPKY4UauZC9pvlx7+sMkPwCRMPKZvnauxQR5Cu
 gOiTG7loXu/3BeNGbgzH8K2UGOqIVMTjCR0RLA==
X-Received: by 2002:a05:6214:d08:b0:6e8:ede1:237 with SMTP id
 6a1803df08f44-6f8b08f8b10mr180754556d6.43.1747651216021; 
 Mon, 19 May 2025 03:40:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/Skc9ACExrbEwLnHLmp+Q0PppdvM9V5a695hjjw29Yz8NJtOmhXksNLJDqqYJRHflxLJ8RQ==
X-Received: by 2002:a05:6214:d08:b0:6e8:ede1:237 with SMTP id
 6a1803df08f44-6f8b08f8b10mr180754126d6.43.1747651215476; 
 Mon, 19 May 2025 03:40:15 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a79asm12163358f8f.25.2025.05.19.03.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 03:40:15 -0700 (PDT)
Message-ID: <c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com>
Date: Mon, 19 May 2025 11:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
 <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
 <7svn6kgajzw6p7hxw3zzjbxz7ipakgv3gacbj4v3gxdw5ssdsj@lvj3hxn7qxu6>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <7svn6kgajzw6p7hxw3zzjbxz7ipakgv3gacbj4v3gxdw5ssdsj@lvj3hxn7qxu6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b0a91 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qkwAhwrShwPuNbHiLtAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: AA2P3vM7eu-CyiuLbx6PLv0WcOHQ3cIt
X-Proofpoint-GUID: AA2P3vM7eu-CyiuLbx6PLv0WcOHQ3cIt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMSBTYWx0ZWRfX21pKb4iOwiau
 N6A6jS9KVyrqW9jH/AQa5QjjuuuW0JrvVSMo8B4LF26Luo+FpBDrn7RAqpiw9xbqdTdWgFJxNO1
 aJLgyxm8NmYxHY1xowbTJaRbebrpzMwHlKgZ6DNZ0TYjrTxZi3DmyUZ62iiRYwuL03e1KC+xUgW
 +TnGV+PI2tfXvBjtPASw7yADyvKc50TjnxkIb3vqm9J92EcxQvqGZ5JJX/uyvjmB/8J+EnDxWGj
 doknnB/hfUouMXH/ShZK4R+f90KrSe+YhBve4+4HRIL/jPv+92LWFTyMT/1egAZ1kQXXic47VzX
 oucgNS5GC/1M0SNjOGRAGpz0yboGg2ZUHvs4zI2lIDZzL6FLNQzD+fbWzVm/xk24O+pvDdOO+9a
 TOFK4igUXdHRa6Zg9lN0pfLdIZu0IdQPC+/7D/UbR4X0wbxSv5JjByc2ArNNXpUUnyeRnnyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190101
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

On 5/19/25 11:09, Dmitry Baryshkov wrote:
> On Mon, May 19, 2025 at 10:25:46AM +0100, Srinivas Kandagatla wrote:
>> On 5/13/25 05:28, Ekansh Gupta wrote:
>>> The fastrpc_buf_free function currently does not handle the case where
>>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>>> dereference, causing a crash or undefined behavior when the function
>>> attempts to access members of the buf structure. Add a NULL check to
>>> ensure safe handling of NULL pointers and prevent potential crashes.
>>>
>> You are mostly defining the code here, but not the root cause of it,
>> What exactly is the call trace for this crash?
>>
>>> Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
>>> Cc: stable@kernel.org
>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>> ---
>>>  drivers/misc/fastrpc.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>> index 7b7a22c91fe4..ca3721365ddc 100644
>>> --- a/drivers/misc/fastrpc.c
>>> +++ b/drivers/misc/fastrpc.c
>>> @@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>>  
>>>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>>  {
>>> +	if (!buf)
>>> +		return;
>>> +
>> Most of the users of the fastrpc_buf_free() already have the null
>> checks, It will be Interesting to know.
>>
>> If we decide to make this function to do null null check, then the
>> existing checks in the caller are redundant.
> 
> I think it was a primary reason for a change: to eliminate NULL checks
> on the caller side, as we do in a lot of other kernel API.

Lets remove the existing NULL checks at caller side as part of this
patch too.


--Srini

> 
>>
>> --srini
>>>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
>>>  			  FASTRPC_PHYS(buf->phys));
>>>  	kfree(buf);
>>
> 

