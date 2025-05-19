Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F884ABBB8A
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF46010E243;
	Mon, 19 May 2025 10:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxpgE3K7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5D710E243
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:56:33 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ioQY022751
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h1/td3vHUmHobFaVyqHJ4J+uwRZH9mDOdhLlH4XEhBc=; b=lxpgE3K7v51i7KPQ
 MIBlQpZaKkVeNN5/D/BLWURS4d1A6kKGVEKQm+DBSFtyJ2apYJGyDHH43TYv+G8H
 /+n2G+1w6JZBizk+eU5aUUO107oLm2DfNZeFZofF9n+yS3azxJ91gdIvnECImVXs
 cXQymdhE/w1KbmjUoC8G/M31Yd9bq2Ym4wrNlrJOC/fD8q4JDEkfA3X4inmtQ/Zq
 zPeGkxOC0jqH1ewhYkIuZvfmQxtNo4MehJkM4iVRPyH8iaUKbCAhWbwiYX6Xq4L8
 jRGLnkbWK8LakTWlhORIKMJM35/AvNlc/P0/HyQtzoTGP74i3ZAgThmNyGFAPSfk
 SGPCpA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d06hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:56:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74292762324so3193381b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652192; x=1748256992;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h1/td3vHUmHobFaVyqHJ4J+uwRZH9mDOdhLlH4XEhBc=;
 b=FL2Fv67iRGxknXLfgv3KIN1vVtm62uhAE8vW/qnGSWBAqnwC3lQuHkzXp1wjItksGL
 ZdBCs1fA0AKqQJhBBYIdoxAtv0r4mL1/jrePq5arVUbF7zCQ77ijSdgR8FV4zY6BylUC
 kZ4opisgBhcHhRfGKXX3tQW1wTF4I4wY5xeaWPMgs3v7QL990wRmYKzXexTMbSCW4uYG
 653Pv1N2YYNZ5fAbHyfYaJAeAq9EVAoRkofys/NuWSmowNd0K8oGf2JG0enXoCwjZeMM
 lkUQArwmq86FoJonTAY3l+Ai86/AnR666kYygoOnFe2DFAgfRD03y1yiFKG8j1mmbwyR
 e44Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBZk0flVD95vNlKg5Xpc/qgB3paqQOiqPt5a6APDes3lJOIPhHAuIo8oAoxi4dvLdH/RDD6yLKnQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxggiAWOAA8QbR9pjEZXYzeWLwgo1OcEL4HGQI/8Gt1RUtE0SH
 +amOOPERL5wCOkhq3w3ENNb3kiIn2SwbBuyiUrW2bplE36M6QzN7wdsZ1i9fsUVUJQSPQTjl1DE
 TSgToM6kLJG+vqMH5q4uz4K0Oyql6qMhhgHpnxjY5n4Y/DrQkNgixlMkLxW9r7ZDd7Hs5878=
X-Gm-Gg: ASbGncsmgGG7Wt4bV1/P18y/dPlcjwl+j3oekWPmLRtsAMSCJsvmEI509ZwOsNpBeeK
 2byA1TkNV0YMWwyfDzEOzrc1dWl14uNtawvzD56cXVMRmLxa7VCCcWungDxHOrYfVce5v5bf2cg
 IsqNXHbnrgWuZegrixhEo+2ogUDMxUR205y7MfWiWoQUorCJrRuH6GqYb7j5ZAScFHXCgPJ3Rw7
 SsgLU0DV88qgOFpXfBo0J2bpvP5mGi2rbCnGTuKGtjlRV1s3YTmm8tkhlNW1boJnU+eKWjoM4ZD
 2b4SGSH9/boGOL1cCQ2eBRE4NXo+32gV3etUNA==
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id
 adf61e73a8af0-216218f7a98mr16582745637.19.1747652192308; 
 Mon, 19 May 2025 03:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+YEl4DPCmiC1kC569JIh9uPvjA+HhDzxAzt9PU6GwUL7mcjSbRxgYRKdYtvvk4K1w9WTdTg==
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id
 adf61e73a8af0-216218f7a98mr16582715637.19.1747652191912; 
 Mon, 19 May 2025 03:56:31 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a96dfaefsm5947008b3a.33.2025.05.19.03.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 03:56:31 -0700 (PDT)
Message-ID: <1246b4e6-dd1f-4293-b580-5d642f661956@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:26:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
 <uw6dcnbgg5vbfkcnei54rwkslpbseolr46cqhsosiadscd5srh@ixk67qdcwfug>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <uw6dcnbgg5vbfkcnei54rwkslpbseolr46cqhsosiadscd5srh@ixk67qdcwfug>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfX1iYCKYfnljLn
 1dk/e+kZAE9Q6AqHSLkvwVlwLAAWchMUOmDkCAo5Lk0biJMiRve7CGEuZuroL/cZMjhBl7nZbtg
 uVxdFF/ucTU8I8T5rajku6q5Kyf8eTlQD35b2p1wTsETceofmXIBL59c41/bp0Uv98b3NNP3Pyc
 ZkuEFdzHr0KPcp0X22Q20GFXYmzH1CNSZSwplI3b94JYQJMW+76ZkHSyGVZhlxk/stIrJ8UxxVA
 QGmWftSOI/iIz7PO88GSzmBCMceVz8IMmKt4UA0lGDKP9QdOK69YZWCZgPt50phj0ap+E/Tcs3X
 zQnD4fheL8Jvyd64Z0P4UuPBRYCQQA/lN7M7hNMZTxTU7J1etWpjtLlaWQqWjfSNN89bd8uOI5P
 pNzeSrNNYnIcKL6OlIkGwXJEzWvKmc42BVPwA7EuXUvHaigDxWF6MbFbJqDBSG5y7nb108kd
X-Proofpoint-GUID: TF4ZRuIPI2cEPX0oTa5G1h3omJDzvg7W
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b0e61 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X88mIgiXdH4OVKoEc0MA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: TF4ZRuIPI2cEPX0oTa5G1h3omJDzvg7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190103
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



On 5/19/2025 3:50 PM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 09:58:24AM +0530, Ekansh Gupta wrote:
>> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
>> getting removed from the list after it is unmapped from DSP. This can
>> create potential race conditions if any other thread removes the entry
>> from list while unmap operation is ongoing. Remove the entry before
>> calling unmap operation.
>>
>> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 29 ++++++++++++++++++++++-------
>>  1 file changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index b629e24f00bc..d54368bf8c5c 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1868,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>  				      &args[0]);
>>  	if (!err) {
>>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>> -		spin_lock(&fl->lock);
>> -		list_del(&buf->node);
>> -		spin_unlock(&fl->lock);
>>  		fastrpc_buf_free(buf);
>>  	} else {
>>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
>> @@ -1884,13 +1881,15 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>>  	struct fastrpc_req_munmap req;
>>  	struct device *dev = fl->sctx->dev;
>> +	int err;
>>  
>>  	if (copy_from_user(&req, argp, sizeof(req)))
>>  		return -EFAULT;
>>  
>>  	spin_lock(&fl->lock);
>>  	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
>> -		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
>> +		if (iter->raddr == req.vaddrout && iter->size == req.size) {
> Cosmetics, please drop.
Ack.
>
>> +			list_del(&iter->node);
>>  			buf = iter;
>>  			break;
>>  		}
>> @@ -1903,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>  		return -EINVAL;
>>  	}
>>  
>> -	return fastrpc_req_munmap_impl(fl, buf);
>> +	err = fastrpc_req_munmap_impl(fl, buf);
>> +	if (err) {
>> +		spin_lock(&fl->lock);
>> +		list_add_tail(&buf->node, &fl->mmaps);
>> +		spin_unlock(&fl->lock);
>> +	}
>> +
>> +	return err;
>>  }
>>  
>>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>> @@ -1997,14 +2003,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>  
>>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>>  		err = -EFAULT;
>> -		goto err_assign;
>> +		goto err_copy;
>>  	}
>>  
>>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>>  		buf->raddr, buf->size);
>>  
>>  	return 0;
>> -
> Please keep the empty line here, it improves readability.
Ack.
>
>> +err_copy:
>> +	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
>> +		spin_lock_irqsave(&fl->cctx->lock, flags);
>> +		list_del(&buf->node);
>> +		spin_unlock_irqrestore(&fl->cctx->lock, flags);
>> +	} else {
>> +		spin_lock(&fl->lock);
>> +		list_del(&buf->node);
>> +		spin_unlock(&fl->lock);
>> +	}
> Can we store the spinlock pointer in the struct fastrpc_buf instead?
this spinlock is used for multiple lists(bufs, maps and ctx).
>
>>  err_assign:
>>  	fastrpc_req_munmap_impl(fl, buf);
>>  
>> -- 
>> 2.34.1
>>

