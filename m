Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12DDC9A308
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D49F10E52F;
	Tue,  2 Dec 2025 06:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9JmWJQn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2Va+e3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FD410E52E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 06:07:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B236Bce2418643
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Dec 2025 06:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q8K6bpgWS5ImuU3GaEbIeRt3L/diGyGItD0oE6T/xlg=; b=H9JmWJQnFaFoSB1V
 UgkTOJAmSvy0wDqNHZAxwQt5FvifJE9lWcp2wiCPzGB59gbsFxf/VgD3EO1tOzQl
 lREaxW98fEWUsQo4ROUOdjjnMxKyprU1HLsU8zZa0NR3BjpU1FuXvdcIh1T9oPlF
 2uBT4FI0Nh4VKjVwcp5OnAUacD5eN/JRAOq5lyObv4pZMPvOZ8IadU2DalhrljcE
 VmJMiEO4LckrX7esE+FqloRyvRBLkdv46rrdGKsvtfUiT3PnovOlsUg3DZusaxnT
 XOBToNA2AeGCFp3aswU95y9IvwTwQ15pKo10kjkrperEZmjZkli/F64gxC8vEpyd
 8KobQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asqwr0exf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 06:07:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2958c80fcabso107068135ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 22:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764655632; x=1765260432;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q8K6bpgWS5ImuU3GaEbIeRt3L/diGyGItD0oE6T/xlg=;
 b=O2Va+e3l+vKx0GCpvDE8KmU0FmsD2Q0hxGRF/1YzCDsCqo2F1QX84xEqbYDlKZEQYE
 UWZkplCVO/p3HFwBhhTjsQkeVP6/8gF2yCr343mZ2Xeuvf3EUKSJL6jzztDG/NbOr8Au
 9/085p4hjrJeCQJigBqI9wvmYJHBFYfWSR7zPa9WfvJAo5+u2yGuymtCILSaS8Bdikwb
 WLyzLR3qwuTSomhPg+9ss8/xARdJ63X+/CiwnMqqF9cKud7SLP5GNJ0eTRda8/uK56O3
 66dRrJTFwxFx5TDXdjkcdg/iqwUY+9CG0xcEr/i5xOAsV/Q8kOamP295YI5ltGQX/Q1G
 n3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764655632; x=1765260432;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q8K6bpgWS5ImuU3GaEbIeRt3L/diGyGItD0oE6T/xlg=;
 b=fXHYqOWx1ViNJVrStALVjYfS6D/p6qm82/wJ91R7VwlEXqxC2CkuYR7uV9dG8wnWgO
 6IiM6virSyFjQqueQkBg4xQI9fLMsj03/E6/oBZm7uWjOFTJmcGqnvyei6juDzTh4/z5
 rZmqvDB8+LJYE3aQVreGDAIKuj07yyJGXInhvwPNl5ChhYCISLQmOQ2pbkYbRZtyCCSH
 yeXMEiQpQUvW0B4B5iUkoNCxHMtqd+Baag9FWtqCjJtoI/36IrrpqLfAVESat3MRFk9M
 pPgPJNIbVMutCVFZRAvR4qs5FdHltZmZr5rk1n4+M5lSNVQza0a5W0wcwOCWudOO7XV+
 ithQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhWKIhfDzMfGdAGDwjR17iflmkCOlQs1+qGTJ4YwEfjhJ9HGj1CR8ZvOJWZygUhOD3TteKmtgyW7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHhindJsb/IJR5/GjuPOHQQY4KHpDy0vrlEaWPdHP24KseAkac
 5an+R/ulGWuAitOvH5nFYpTl9wFS7PBXr5HPy2MHgJcM6xLhnq648nrf7A2ERbvnrF8k40k7SHN
 vDKXRC+SG3zGZRbkCvJ+c9CrqNTb11eT7K+j4erwoCjvBPP+mlRmTOf2etfnjSgL0CQxnpmg=
X-Gm-Gg: ASbGncvY8UDNfwqiKn1e58ILJLNGyjJ74S+Dv2xxOPA6yQZKM0yA3UTZo7LPGrpkaRx
 8oYhcAMTShAFs/ZhAY/wxd3UWhr+SxGLW6MXA1Ca+jqImGNr5/cXF9ONXMWl2sS9ySTO27YLWsZ
 i/vo/H+JJBlmU/Nwu12kGk8qNorUWIOXGUklJYFSaNH5Gze5Jj6TQxSJfyorCbycpe4+F8HqZQV
 zAJAV8Ci8tXQLpbJ736clReVkvM0KHlxBbupZqZmp2xIRpbJmOS0kD22rOHLMZWYVCjdNp0CqV0
 DEyu/OumPg2oQ8kKcmRrIS5gsSuJSbV3Pvp2aexDMXc2UovkWrLCfGuamokuq9N5CsN14mC59dg
 Iz5XVMIKOdua202knIDqciPKfWVd1ZmzHhGVFWLiB
X-Received: by 2002:a17:902:cf10:b0:295:4d50:aab6 with SMTP id
 d9443c01a7336-29b6bec46afmr496941055ad.18.1764655632314; 
 Mon, 01 Dec 2025 22:07:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH48Bn8NoJ1p0E5RqctHP3ZlF8O/wTAnajenHXwUDkGTLgAiFY24benR1CbGAPHl3ePh1Q5Wg==
X-Received: by 2002:a17:902:cf10:b0:295:4d50:aab6 with SMTP id
 d9443c01a7336-29b6bec46afmr496940705ad.18.1764655631666; 
 Mon, 01 Dec 2025 22:07:11 -0800 (PST)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bce442702sm144280365ad.35.2025.12.01.22.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 22:07:11 -0800 (PST)
Message-ID: <4efa42cb-807b-46b9-8fc6-46c7c05db15b@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 11:37:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] misc: fastrpc: Support mapping userspace-allocated
 buffers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
References: <20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com>
 <20251128103428.1119696-3-ekansh.gupta@oss.qualcomm.com>
 <2025112854-septum-asleep-8c35@gregkh>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <2025112854-septum-asleep-8c35@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -0QthxHhUiSIOLdCXVPgM7N-QCNYvDf5
X-Authority-Analysis: v=2.4 cv=H83WAuYi c=1 sm=1 tr=0 ts=692e8211 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0Ga8u4h-uXT8-BnDPgUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: -0QthxHhUiSIOLdCXVPgM7N-QCNYvDf5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA0NiBTYWx0ZWRfX8GuihXOchWme
 j0fm8lFiObmRyuGQSfOgWX5lqdeyNPTomRzIxRmLrqvwSf56FlSfV6zuI3RbprKMg/eKElY/w80
 NUslIwOFOqtRmbL7rfhFtH4y6ALivDh58QBTZqxVMllW5ZLIvS45ZDQ9uFnEDcE68pxSDzn0dHc
 2Nrm6ZuuVAlQnGqBgxdYd3SZoxOJuppPozybPnkKBwsurJ24xT/wEmfCSHmM317wl5InSEEp5bQ
 N4+M3pVhNeI1MFRwZegXg30oLjWsbssGCgK0Hbh9SKcQGl/b3Oshj8TeRU4iAgMsTmCjvr/NoWt
 o0mQ/WJGoU27Zns/nn0NMMRdHW7t3nktMdYfRwdLDwGqXoDhuZrFFSHFEvitspLxh5TEy8Mum7d
 YpB6Umtdhlq7UUD0t9ZER9w6U01GMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020046
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



On 11/28/2025 9:02 PM, Greg KH wrote:
> On Fri, Nov 28, 2025 at 04:04:28PM +0530, Ekansh Gupta wrote:
>> Currently, FastRPC only supports mapping buffers allocated by the
>> kernel. This limits flexibility for applications that allocate memory
>> in userspace using rpcmem or DMABUF and need to share it with the DSP.
>> Add support for mapping and unmapping userspace-allocated buffers to
>> the DSP through SMMU. This includes handling map requests for rpcmem
>> and DMABUF-backed memory and providing corresponding unmap
>> functionality.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 96 +++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 85 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 9bf76e224852..feba79913763 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1854,8 +1854,10 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>  static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>  {
>>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>> +	struct fastrpc_map *map = NULL, *iterm, *m;
>>  	struct fastrpc_req_munmap req;
>>  	struct device *dev = fl->sctx->dev;
>> +	int err;
>>  
>>  	if (copy_from_user(&req, argp, sizeof(req)))
>>  		return -EFAULT;
>> @@ -1869,13 +1871,41 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>  	}
>>  	spin_unlock(&fl->lock);
>>  
>> -	if (!buf) {
>> -		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
>> +	if (buf) {
>> +		err = fastrpc_req_munmap_impl(fl, buf);
>> +		if (err) {
>> +			spin_lock(&fl->lock);
>> +			list_add_tail(&buf->node, &fl->mmaps);
>> +			spin_unlock(&fl->lock);
>> +		}
>> +		return err;
>> +	}
>> +
>> +	spin_lock(&fl->lock);
>> +	list_for_each_entry_safe(iterm, m, &fl->maps, node) {
>> +		if (iterm->raddr == req.vaddrout) {
>> +			map = iterm;
>> +			list_del(&iterm->node);
>> +			break;
>> +		}
>> +	}
>> +	spin_unlock(&fl->lock);
>> +	if (!map) {
>> +		dev_dbg(dev, "buffer/map not found addr 0x%09llx, len 0x%08llx\n",
>>  			req.vaddrout, req.size);
> Never print out kernel pointers "raw" like this, use the real %p tags
> instead.  Odd that the current code does this, that is not good and is
> probably a "information leak" somehow.
>
> Can you fix that up first so it can be backported properly?
Thanks for pointing this out, I'll fix this before refactoring.
>
>>  		return -EINVAL;
>>  	}
>>  
>> -	return fastrpc_req_munmap_impl(fl, buf);
>> +	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
>> +	if (err) {
>> +		dev_dbg(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
> Same here.  Also, no need for a \t in a kernel log message.
Ack.
>
>> +		spin_lock(&fl->lock);
>> +		list_add_tail(&map->node, &fl->maps);
>> +		spin_unlock(&fl->lock);
>> +	} else {
>> +		fastrpc_map_put(map);
>> +	}
>> +	return err;
>>  }
>>  
>>  static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
>> @@ -1989,25 +2019,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
>>  	return err;
>>  }
>>  
>> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>> +static int fastrpc_req_map_create(struct fastrpc_user *fl,
>> +				  struct fastrpc_req_mmap req,
>> +				  char __user *argp)
>>  {
>> -	struct fastrpc_req_mmap req;
>> +	struct fastrpc_map *map = NULL;
>> +	struct device *dev = fl->sctx->dev;
>> +	u64 raddr = 0;
>>  	int err;
>>  
>> -	if (copy_from_user(&req, argp, sizeof(req)))
>> -		return -EFAULT;
>> +	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
>> +	if (err) {
>> +		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>> +		return err;
>> +	}
>>  
>> -	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
>> -		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
>> +	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
>> +				  req.vaddrin, &raddr);
>> +	if (err)
>> +		goto err_invoke;
>>  
>> -		return -EINVAL;
>> +	/* update the buffer to be able to deallocate the memory on the DSP */
>> +	map->raddr = (u64)raddr;
>> +
>> +	/* let the client know the address to use */
>> +	req.vaddrout = raddr;
>> +	dev_dbg(dev, "mmap\t\tpt 0x%09llx OK [len 0x%08llx]\n",
>> +		map->raddr, map->size);
>> +
>> +	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
> argp is already a user pointer, no need to cast it again, right?
yes, right.
>
>> +		err = -EFAULT;
>> +		goto err_copy;
>>  	}
>>  
>> -	err = fastrpc_req_buf_alloc(fl, req, argp);
>> +	return 0;
>> +err_copy:
>> +	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
>> +err_invoke:
>> +	fastrpc_map_put(map);
>>  
>>  	return err;
>>  }
>>  
>> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>> +{
>> +	struct fastrpc_req_mmap req;
>> +	int err;
>> +
>> +	if (copy_from_user(&req, argp, sizeof(req)))
>> +		return -EFAULT;
>> +
>> +	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
>> +	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {
>> +		err = fastrpc_req_buf_alloc(fl, req, argp);
>> +		if (err)
>> +			return err;
>> +	} else {
>> +		err = fastrpc_req_map_create(fl, req, argp);
> You changed the logic here from what used to happen if req.flags was not
> set to those two values.  Are you _sure_ you mean to do that?  If so,
> how does userspace know?  Why don't you have a new flag for the new
> type of memory you want to map?
The userspace follows the same logic for all the flags other than the defined flags
where a buffer is allocated using DMA-BUF and then mapped onto DSP using this
IOCTL call.

Do you see any concerns with this?

Thanks,
Ekansh
>
> thanks,
>
> greg k-h

