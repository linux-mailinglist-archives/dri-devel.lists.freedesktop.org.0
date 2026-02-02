Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBQ/E4JJgGnC5gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:51:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8662C8F5C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB46410E295;
	Mon,  2 Feb 2026 06:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtaQZ6BD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E97kh3AQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EF110E295
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 06:51:41 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 611NgM4T1583312
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Feb 2026 06:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LW+Vjy9g0Y98fAgbe4moCBUb0jVsnAO98d8+7XdroJ0=; b=YtaQZ6BDwB1qR2Xr
 La1SthXJHkC9C20AfiBA+3o4jo1537XCThbekjPBdnEXJkaKs11AVy620vOOg+7A
 QWZBeT/N1FsT+75nmVq0u/ZoFEwzw/gSaijnZ7pjdPsR4ZB45L1eiERiQUKu47GJ
 7NNWcjBYVEPRh+w7m8/hu/6syHyAOE06G6NObtJO4l92ERq1IZqbNPQmWP6SO4vY
 wcp+As+6T09LFup0rtx2698zKWETFWAzyU3u5qEe0B/c0h0d2CHTZ6qneju8hRAc
 uluhGYgyEbdSGqzLwto/yTkG6wt7UsUnepDOwA6WBldizlGBBAy0ePyEbB/k5KIk
 24aYOQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2m9nr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 06:51:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a8fc061ce1so40863555ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 22:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770015100; x=1770619900;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LW+Vjy9g0Y98fAgbe4moCBUb0jVsnAO98d8+7XdroJ0=;
 b=E97kh3AQlsrReptCzKOxtU3FeLMiXiYeeyUnYBNukTjVOH98MU6ahSYwiPWU7zntPt
 qdd2Sd4ubOeJh6RKgvycXfVljoO3PfoJfhcXUq1m/tzPhr9U1537U+lFZocrOo5OaibH
 FQPgmmSeMQS2hXrwvrceNUllsLPSXCvivVoC7dnywco621IY1IAnddEdZhvAn/27PwN3
 FX5KFCgiQTBXyAZSuojhhGiRL1WwjiX3k5ZqLxzmujUXjX2jSt3DDkPZcrA7pCSo4mcW
 9vQaf1MwIY27+MKwf3Q5ljLoM2yLGrv/22qLkdA8EEYLaZ4My8XYzvbG8RbWOQN1f3+3
 ezaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770015100; x=1770619900;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LW+Vjy9g0Y98fAgbe4moCBUb0jVsnAO98d8+7XdroJ0=;
 b=h7Dn40OSLDA6zXoC+r/Y+SgW8vJI6l5/Wtsu5x6D3A9NcLDQCN+Z3PKpUgmYZauRhp
 h2yil4COMAZJaqHnRAdfvywdqMWO1JtGZ2Wq+q/JO6kPWDSG7oV3wv/SVeXvlfS3/mvj
 RbPwetbazHroFRJpLPnKfDGABoU55uvBMAeQta2RH3kiXwi9hPwSdtWQiwnxLBlv/EcG
 PO9UHh8H3Pgzjffqvm84ojk/KnDQQ3jOtTjhIUO6yjm9QD4KPAr3amtTwUg2Dw5OrOOp
 sdw/TQkAQnPq8QDaco3a4SMWoVtfqnpgAogb6WHQgNQvZS79v0kHTp+VKUQR+OdBMquY
 v3nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpFTub+3+tRfqugiGu9qoVs7HVKpU5pj+5g5X7hKxNbx31Fe1xcz6bCS5+b+XSrGyIPq+3aSq4qH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5ROvtG9zVdADvykoNkwxa/sXpQ24XL01bYeZKnn8zndrQDJZw
 K4Lz19jKqsBYx78XleEq9I5fiuCGrVx974JUDAdKsPDlY63iezgSKLyn20aAxN46fAC/TtylONJ
 Pf60nzUrJqpBxy2n7TgwXiH2+40kodqdkHfcKGmtnCzC2XPfM5kVgU4B7VdESlaC/XSZPTBg=
X-Gm-Gg: AZuq6aL9SSlkZQuCa5Ijp8c3rI/7RWKaFC7TMNR9K87xyEBlIuShvNFmSX4W6p5ezOb
 ndUdkWJtw6shgYqFScSexjk6UhBdR/P/7HgBSvnrkkPS3vSOWo3HcyikKfqh3tliIBtJ0y/mHUr
 1ogHqfY5ICSL7dsk/DL3EdW4Nm7WgsQ2f/itHEel7VAwO4zNPKRrnvxJOuuPqh4H3dbyBXopRVe
 g5TR/WOXzofqHLv77tnxn1FvgDsGQUZGnYNyaklIm0WgY312OWBY6JnBT4EP5EJJhPD4upL5vzu
 u1gA5WsP3K+1udUZdhjZ4FTC28taBYqYvs7RZTsLO3sa1rT9PZEJ9lRKBndzPH62QGmJk41me01
 w8l6BgqW9erF5F+b37VchuOR4IPWmcx01lGokNwRGdLOTPBfsNB8/48fWcgXjAdgzR8NzawJV/Y
 YOYw2x
X-Received: by 2002:a17:902:b107:b0:2a2:f0cb:df98 with SMTP id
 d9443c01a7336-2a8d96bc109mr75445925ad.25.1770015099992; 
 Sun, 01 Feb 2026 22:51:39 -0800 (PST)
X-Received: by 2002:a17:902:b107:b0:2a2:f0cb:df98 with SMTP id
 d9443c01a7336-2a8d96bc109mr75445785ad.25.1770015099472; 
 Sun, 01 Feb 2026 22:51:39 -0800 (PST)
Received: from [10.133.33.100] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b3eecc5sm142880255ad.17.2026.02.01.22.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 22:51:39 -0800 (PST)
Message-ID: <ed46e539-8cbe-4d7f-b6dd-5fd4123298fb@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 14:51:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] misc: fastrpc: Remove buffer from list prior to
 unmap operation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-4-jianping.li@oss.qualcomm.com>
 <3p4quidza7rwxng74fxcfoflo62tgakl7hummwsqmisaqmkwwp@nae55u2ehza4>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <3p4quidza7rwxng74fxcfoflo62tgakl7hummwsqmisaqmkwwp@nae55u2ehza4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KCI19uZqdyEGlZRcFHCrEM4eGbbHn03Y
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=6980497c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jMqK_s9pk_6wsJaoijUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: KCI19uZqdyEGlZRcFHCrEM4eGbbHn03Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NyBTYWx0ZWRfX/kEeLrIzEw8T
 TsVnDfoAcNLh/fLh1xA43TKodOi7hswZ13hHas24iCgc5Dl1YAqrjqc7VjDedo604j9IZDzbSL7
 GLrCiXQYCL/cxKGkII1v2b5RsX3nZ70IU1BQO35SLYf/44l0oXVWWl/9JXFQl2u7ncKOyWWO8EP
 GMGWizhc2ydiCNPUP5HRJH7Uj1cZTGExyOB7Uch851ihfAvK8RRRqzmtc5YSrTJ/iWeJLRgOktO
 jYKQQLdSGjZ5+C8mzJbWmrbQb/CoWcRvqdWKF79T8pxkK9/qVwf9kDtHp/IolvpUV+qzGuywcIl
 cv4wDAW7auyyG/wgOc/lKt47SMeJlqXtmP8syIaQr6hvH6Jp4dyq6vI4VwLFmrdJyZdhYuBTLcJ
 JPTEUtZ6Th2TI2IZ0MAK5xHiiBS6GJ86ki6iQXp6dxZ02jp04wyit/xWWk9VU3Nou7AQFLglq7X
 kUoXzhK0HAcDHpMmMlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020057
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: A8662C8F5C
X-Rspamd-Action: no action



On 1/16/2026 4:47 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 15, 2026 at 04:28:50PM +0800, Jianping Li wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
>> getting removed from the list after it is unmapped from DSP. This can
>> create potential race conditions if any other thread removes the entry
>> from list while unmap operation is ongoing. Remove the entry before
>> calling unmap operation.
>>
>> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
>> Cc: stable@kernel.org
>> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 28 ++++++++++++++++++++--------
>>   1 file changed, 20 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 4f12fa5a05aa..833c265add5e 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -202,6 +202,8 @@ struct fastrpc_buf {
>>   	/* mmap support */
>>   	struct list_head node; /* list of user requested mmaps */
>>   	uintptr_t raddr;
>> +	/* Lock for buf->node */
>> +	spinlock_t *list_lock;
> 
> Why do you need to lock this? Isn't fl->lock enough?

According to the discussion in v1 patch:
https://lore.kernel.org/all/p6cc5lxufmefeulx5bhlh6q6ivwluqf2muj3hu5e5526fsppuu@brcy6arm7epg/

The lock is stored in fastrpc_buf here.
> 
>>   };
>>   
>>   struct fastrpc_dma_buf_attachment {
>> @@ -441,6 +443,7 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf->size = size;
>>   	buf->dev = dev;
>>   	buf->raddr = 0;
>> +	buf->list_lock = &fl->lock;
>>   
>>   	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
>>   				       GFP_KERNEL);
>> @@ -1865,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>   				      &args[0]);
>>   	if (!err) {
>>   		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>> -		spin_lock(&fl->lock);
>> -		list_del(&buf->node);
>> -		spin_unlock(&fl->lock);
>>   		fastrpc_buf_free(buf);
>>   	} else {
>>   		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
>> @@ -1881,6 +1881,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>   	struct fastrpc_buf *buf = NULL, *iter, *b;
>>   	struct fastrpc_req_munmap req;
>>   	struct device *dev = fl->sctx->dev;
>> +	int err;
>>   
>>   	if (copy_from_user(&req, argp, sizeof(req)))
>>   		return -EFAULT;
>> @@ -1888,6 +1889,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>   	spin_lock(&fl->lock);
>>   	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
>>   		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
>> +			list_del(&iter->node);
>>   			buf = iter;
>>   			break;
>>   		}
>> @@ -1900,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>   		return -EINVAL;
>>   	}
>>   
>> -	return fastrpc_req_munmap_impl(fl, buf);
>> +	err = fastrpc_req_munmap_impl(fl, buf);
>> +	if (err) {
>> +		spin_lock(buf->list_lock);
>> +		list_add_tail(&buf->node, &fl->mmaps);
>> +		spin_unlock(buf->list_lock);
>> +	}
>> +
>> +	return err;
>>   }
>>   
>>   static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>> @@ -1985,20 +1994,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>   		}
>>   	}
>>   
>> -	spin_lock(&fl->lock);
>> +	spin_lock(buf->list_lock);
>>   	list_add_tail(&buf->node, &fl->mmaps);
>> -	spin_unlock(&fl->lock);
>> +	spin_unlock(buf->list_lock);
>>   
>>   	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>>   		err = -EFAULT;
>> -		goto err_assign;
>> +		goto err_copy;
>>   	}
>>   
>>   	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>>   		buf->raddr, buf->size);
>>   
>>   	return 0;
>> -
>> +err_copy:
>> +	spin_lock(buf->list_lock);
>> +	list_del(&buf->node);
>> +	spin_unlock(buf->list_lock);
>>   err_assign:
>>   	fastrpc_req_munmap_impl(fl, buf);
>>   
>> -- 
>> 2.43.0
>>
> 

