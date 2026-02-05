Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEHXBTxchGmn2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:00:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D94F032D
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C4B10E806;
	Thu,  5 Feb 2026 09:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RFOVZWrV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsMNz56n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC7610E7FC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:00:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6153djfM2759471
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Feb 2026 09:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u5X3M5cTVffEVgtyk6KP7I9guD337bpVzGU53BIZUPc=; b=RFOVZWrVLk+ThXCL
 4JVXxUz6zWQhUNxNMYPtpqhIRp9Sui0eg+dNY0kyhInhUZiTH9GpzNVu16O5ks+n
 n7XU/HlyLsc5Em27919kVN9cY5D1I2dxsiqcXSLBi52oEaJKKbtltjckrNNjc9bz
 zhWoU7zOG5Wv9bWFVQYojeTWvxNEteGIpioglUE+eve/hHT612iTxNdXbR3MZfDI
 G8xqIxcuVet2Wn9+9BxUa0eVNEJNUgZwrm0pgJJ//wnMdNXSzfsoQRQsnkAFwzaF
 J58HOOf14iqfmhHXVWUX0Hn+CtUzWibQr5wePOU9PT60BuRPh2UuSCE1U1SwAWJs
 WshVow==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4jpd11k2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 09:00:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8230d6d54a5so1480445b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 01:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770282033; x=1770886833;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u5X3M5cTVffEVgtyk6KP7I9guD337bpVzGU53BIZUPc=;
 b=HsMNz56nEDgO+30/RwH3XaSRuqoks95JMi37dia0GJ6gxC1vuSPZ28SXNqRrfst2d8
 xDTEW9BDZIsnMJiUllOPbzcsXcFToNCHyEzkzXdd13z5CUHwl7n8gS+db6VkGFbundON
 IjqUXt2cmjb+IBhp1l0sO0smIs2XHS7hCJh0+UvgVA11sTPwSj5uqzPBdQG9myXw+90x
 QM28aFgDy8eY0SgKEm6uwZfEiwJFBqLD0h+gkK855BicFgU0i+umnSoIGAOWh9rukL7h
 uZakLaHd3/H3lm6ZLyvwiHNm3G3OPkxGVyEcJx3CKAXQ2HkplDNtV/g/+8cvIcNJeoW/
 Da6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770282033; x=1770886833;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u5X3M5cTVffEVgtyk6KP7I9guD337bpVzGU53BIZUPc=;
 b=Yr0I0czaxrLed11zWRuAYJt7/4FWIKhQFZM+poXA5e9Rj+iJHszHzavlGyD2LCZSQJ
 /rX6YR6ACSFlYEZYPbA3N2laKEMjcvaPymJOmnY/asJ7KuCMWb15gn19WrI04nRB9SZu
 7UtBE/WoiZmi9eaSPBTEPha9OftboKqQsQ64NgIN8eC/gX03cejBkNAP1uHFLUz/WVGD
 zt2A2PBCjR5hClxUoexiRAt+ZQDUQ/vLi6kNgN8X3eCYlOObX65hu2V5R6OTqI7Q1/Gi
 Pbl73mbZaB8sCVhm49FWss7/YDekPyW3uSZyUcAd+2IvV0sWYzHURUhMMMgQnk/wwzPz
 3dGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjjustqcA38psCOjeSU6UdzmF/bFN4hbmXdl5W9yoS1zkowmNETfI1FaNZFy2sSxV157qj/vcoRkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygUakWEMb42vqE2Uwg9y95NRRjtjosDX7X2DxPB80ISDMWXP4c
 emUUp9RL2MOFH+gg8/XdSg+J7puTDysoHHGvngnF3VkNhUoFiJfwoeB3t59rDdvZkd3R/5O1sgX
 m1YPVwH51PtV80kagIrFQ/YbGzXQYktcvoA1DE63vzD4s+cX5utO6Vg63D9jgtcYz7wAOruU=
X-Gm-Gg: AZuq6aK0ND8d6+LhVHvgHhR526KZWnaN5Yv2LKCh6ekNpBQR6O7hNvvwAssQdYE8A2o
 O1JAvQAI0XbACVuXBq38uz6+gjei1mDR3LXQoLZEPnqk1LybJCGxT1VBC/vh/u8BE966vIc1WZl
 8W/2UDwYcQAAExYPJ6MQU8eSSoAOXgxFVF6A38G2R7y6Ln/VRnX3XpX0L+KPzA7fOT5wuFubfxW
 i3Va74TkTX0ffCa2hTu9zCazaD3nn/s81MJzu2PasBo81Dx7+oU9oJ9pHtIGXuG474K/jZ+gqM3
 vlYBYb2nzciibvH1DYQ3U8JcUdlggKtseIhtWW3+eVmPOgOrJCIb4N/vO1z0svFzFRQJNR+yZhF
 CyW7dXaxV7M2w/4ANT7uzxFDCDC89ZXD6DSzcLDWQUMTeCEXPfphjdLKdez/b3JOnU32qszEGaN
 CIx8dn
X-Received: by 2002:a05:6a00:ad8e:b0:81f:c6d1:5608 with SMTP id
 d2e1a72fcca58-8242d87fbb1mr2042925b3a.1.1770282033479; 
 Thu, 05 Feb 2026 01:00:33 -0800 (PST)
X-Received: by 2002:a05:6a00:ad8e:b0:81f:c6d1:5608 with SMTP id
 d2e1a72fcca58-8242d87fbb1mr2042897b3a.1.1770282032984; 
 Thu, 05 Feb 2026 01:00:32 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8241d1a7793sm4946737b3a.17.2026.02.05.01.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 01:00:32 -0800 (PST)
Message-ID: <70ce1dd2-2345-4d5c-bab1-683c8c634c1d@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 17:00:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] misc: fastrpc: Remove buffer from list prior to
 unmap operation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-4-jianping.li@oss.qualcomm.com>
 <3p4quidza7rwxng74fxcfoflo62tgakl7hummwsqmisaqmkwwp@nae55u2ehza4>
 <ed46e539-8cbe-4d7f-b6dd-5fd4123298fb@oss.qualcomm.com>
 <wmq356u5rqdjzp27zvvvjwgzsf3ft4j3gpv6fuewxm6ohg5h4s@kuf5j7hxved6>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srini@kernel.org,
 amahesh@qti.qualcomm.com, arnd@arndb.de, linux-arm-msm@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <wmq356u5rqdjzp27zvvvjwgzsf3ft4j3gpv6fuewxm6ohg5h4s@kuf5j7hxved6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NCBTYWx0ZWRfXzpa9f5gV+2Ya
 A3HopCE1BWCw5gHR2fLiNz8T71jQ1+lflzlbmkgiQqqYiyyt90ixaZzc2/M7+YuNAGkQakatIU6
 7cD2o3+lmUDJlwMul0zXulx9R688hbsPzw6ZZXeOq4N82t0e6U0qWHUYh4BWiQvFiEKBAyVwHci
 lmbEwa1Ak+YZQdqrhmUBCtdXlYJPXX+ZD++xvUovUA+vX6JaZzCGeKp9stFQ8zxwZ24De9N8CLv
 aAXnK8KJ+AA8s/jKx+t/U5bQVkZt9yNm43DkzCVYWcQOfAZh7B2JpWqnbWqfycMA/IOaGvZo9SS
 9nF5zIzqVNbjL0fryJZJwYzJ2YPF42P6r8ZCMYasVD/MO7Gfm12ViVjRnFZj8AeToOWklKw1T44
 297DgsIBaFhERPBlVTzFU/JelWZyPVzt3nxFWT8WZQP218gyGhVqkSswieIqN+GNZF1TKl+CVsf
 K+c/TrsoMNAigfKVDpQ==
X-Proofpoint-GUID: bZTzs590Edfy4zeYAZnmDEI-41Rifb-_
X-Authority-Analysis: v=2.4 cv=d7j4CBjE c=1 sm=1 tr=0 ts=69845c32 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dWLI_mats7cmKkoWj24A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: bZTzs590Edfy4zeYAZnmDEI-41Rifb-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050064
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out,oss.qualcomm.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[stable.kernel.org:query timed out,jianping.li.oss.qualcomm.com:query timed out,ekansh.gupta.oss.qualcomm.com:query timed out];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B2D94F032D
X-Rspamd-Action: no action



On 2/4/2026 5:15 AM, Dmitry Baryshkov wrote:
> On Mon, Feb 02, 2026 at 02:51:33PM +0800, Jianping wrote:
>>
>>
>> On 1/16/2026 4:47 AM, Dmitry Baryshkov wrote:
>>> On Thu, Jan 15, 2026 at 04:28:50PM +0800, Jianping Li wrote:
>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>
>>>> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
>>>> getting removed from the list after it is unmapped from DSP. This can
>>>> create potential race conditions if any other thread removes the entry
>>>> from list while unmap operation is ongoing. Remove the entry before
>>>> calling unmap operation.
>>>>
>>>> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
>>>> Cc: stable@kernel.org
>>>> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>>>> ---
>>>>    drivers/misc/fastrpc.c | 28 ++++++++++++++++++++--------
>>>>    1 file changed, 20 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 4f12fa5a05aa..833c265add5e 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -202,6 +202,8 @@ struct fastrpc_buf {
>>>>    	/* mmap support */
>>>>    	struct list_head node; /* list of user requested mmaps */
>>>>    	uintptr_t raddr;
>>>> +	/* Lock for buf->node */
>>>> +	spinlock_t *list_lock;
>>>
>>> Why do you need to lock this? Isn't fl->lock enough?
>>
>> According to the discussion in v1 patch:
>> https://lore.kernel.org/all/p6cc5lxufmefeulx5bhlh6q6ivwluqf2muj3hu5e5526fsppuu@brcy6arm7epg/
>>
>> The lock is stored in fastrpc_buf here.
> 
> That was a separate topic. So, why fl->lock isn't enough? What is the
> race that isn't prevented by it?
"Is fl->lock not enough?" — At the granularity of the lock, fl->lock is 
sufficient. And you can see buf->list_lock reuses fl->lock.

The purpose of doing this is to pass along lock together with the buf 
via the buf->list_lock pointer, so that all operations on buf->node no 
longer need to look for fl, reducing coupling and lowering the chance of 
errors.

If you think buf->list_lock is unnecessary, I can remove it and use 
fl->lock that makes more sense.

> 
>>>
>>>>    };
>>>>    struct fastrpc_dma_buf_attachment {
>>>> @@ -441,6 +443,7 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>>>    	buf->size = size;
>>>>    	buf->dev = dev;
>>>>    	buf->raddr = 0;
>>>> +	buf->list_lock = &fl->lock;
>>>>    	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
>>>>    				       GFP_KERNEL);
>>>> @@ -1865,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>>>    				      &args[0]);
>>>>    	if (!err) {
>>>>    		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>>>> -		spin_lock(&fl->lock);
>>>> -		list_del(&buf->node);
>>>> -		spin_unlock(&fl->lock);
>>>>    		fastrpc_buf_free(buf);
>>>>    	} else {
>>>>    		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
>>>> @@ -1881,6 +1881,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>>>    	struct fastrpc_buf *buf = NULL, *iter, *b;
>>>>    	struct fastrpc_req_munmap req;
>>>>    	struct device *dev = fl->sctx->dev;
>>>> +	int err;
>>>>    	if (copy_from_user(&req, argp, sizeof(req)))
>>>>    		return -EFAULT;
>>>> @@ -1888,6 +1889,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>>>    	spin_lock(&fl->lock);
>>>>    	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
>>>>    		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
>>>> +			list_del(&iter->node);
>>>>    			buf = iter;
>>>>    			break;
>>>>    		}
>>>> @@ -1900,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>>>    		return -EINVAL;
>>>>    	}
>>>> -	return fastrpc_req_munmap_impl(fl, buf);
>>>> +	err = fastrpc_req_munmap_impl(fl, buf);
>>>> +	if (err) {
>>>> +		spin_lock(buf->list_lock);
>>>> +		list_add_tail(&buf->node, &fl->mmaps);
>>>> +		spin_unlock(buf->list_lock);
>>>> +	}
>>>> +
>>>> +	return err;
>>>>    }
>>>>    static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>>> @@ -1985,20 +1994,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>>>    		}
>>>>    	}
>>>> -	spin_lock(&fl->lock);
>>>> +	spin_lock(buf->list_lock);
>>>>    	list_add_tail(&buf->node, &fl->mmaps);
>>>> -	spin_unlock(&fl->lock);
>>>> +	spin_unlock(buf->list_lock);
>>>>    	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>>>>    		err = -EFAULT;
>>>> -		goto err_assign;
>>>> +		goto err_copy;
>>>>    	}
>>>>    	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>>>>    		buf->raddr, buf->size);
>>>>    	return 0;
>>>> -
>>>> +err_copy:
>>>> +	spin_lock(buf->list_lock);
>>>> +	list_del(&buf->node);
>>>> +	spin_unlock(buf->list_lock);
>>>>    err_assign:
>>>>    	fastrpc_req_munmap_impl(fl, buf);
>>>> -- 
>>>> 2.43.0
>>>>
>>>
>>
> 

