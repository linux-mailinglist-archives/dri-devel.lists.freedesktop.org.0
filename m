Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GyXGJtlgmlOTgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 22:16:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D30DEC40
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 22:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFC910E266;
	Tue,  3 Feb 2026 21:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzyJdjwC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VX7le/6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB76410E266
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 21:16:04 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 613Ilv6H2053568
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Feb 2026 21:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dribig466652vcmeaTT+Hyrw
 R8BVj0tk1GBS3y0D7Js=; b=dzyJdjwCtKagXo6HHR9TIuZHbiiSt9blSY2FBJu6
 zoz9Fcona9nWcc89Zjbf2jPDBX5YXy9c+7K4qOa8IU5prpqWiIig/9cFeTwrgodZ
 KT0P6+pXWHrVJ66wIzbVH60fX0auP1TkdiV+32bRiiPMagKt2XufIb+lKJa6vuOD
 HQEoUCQqqTAMyLP95BN/cnpnAYkCqNQG2byUIATWQRH4CkLOeSnYNAaD1W5EwyYq
 aAJ6PYqhgblnEo9KaC4Kn8X2p8F5THDXBxEah8QmJ2htFSkzq5Sbp5T+I3QOJUAt
 bTIkxEszAD33tY8DpfzPJNzZArzvgQbsRYmUjG3YJ/xqKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gsr1s5w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 21:16:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c70e610242so1655230985a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 13:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770153362; x=1770758162;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dribig466652vcmeaTT+HyrwR8BVj0tk1GBS3y0D7Js=;
 b=VX7le/6zN2zTyEHR7K4DY5bGBwULD4BkpG0vZqu4UhwKsU7j785m3+Mga9AH8k9EK9
 ZlCcrGPCaRLpiRz8h4mLIxjjaU2SPmqIo7b33lfrvvYJXEU18uS4NMyWQIC9KtQGMukT
 3yEnTd9ge8dlfSMoqBiDk/LFfh9zWSiyTFag0g9kB3WJpUe22PINDqATsH4dC+7RkdJZ
 iEftaWUys5o9wy8TIeEwMQH1g7KVhR40rXOGJFgPDKntNPv6YxGqVcRDELuScUbZC9MP
 2kK+1sq60KJjB7p2JCx9c04JFPf06K6PVXsQzrhyMKg/a2ChrbBFHBR3x5rsgMa+5MFH
 ujdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770153362; x=1770758162;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dribig466652vcmeaTT+HyrwR8BVj0tk1GBS3y0D7Js=;
 b=V7Uss9w/Pmvpug22z8f2k5UKVsumDwvz1Pe4U4IN05JRa5ZnkZr06tSOhaIlLoa5rQ
 8dd8mJJTG78cxwfH+n1BlMiBFaBzm3fwy4Qa7wSbslLzI4XT75uAJvrpwQIkEuYzhloe
 nemh/pWOrmTQiV5w1PQHDiwsOiwC2PwDAyQ6cc/qSdoNkzcS2ldUYc8/K+geN8VrFoax
 Z0NsMDy+/sWvz5M7osgRRtBjOpKri9130RWJ2bZWkAEWBKx7wfUlTwSKMzCEBpvmv7IU
 aaHuI4U5gxEdPPVyMS4yQTlitwffa2O4nUjjVqNPDitCUhG+6UFNCi3LizhBI+x8F60T
 G5tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkhZ9IdB+fvDh51jY22SI5X91tUFQHEtwV3tXAThf8IpOW8irJlGDu8iXtIwFNcCpeIoRa7x0v4rc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtLyamNFhDvPhaKbCVFYZ91xlZLqBEhtbGsrKW1RpLc96FpToX
 nNz2tTHWGRFfzmwwposjaMwBbd+tZVqJ79bqIPXuNMT9JrrEmbfo145jvFo6qqk0ej3rkjLlyIC
 bRLs5iazJKm30nei72i/9e+aWJ9ATVkWOtyW85sJPzrqliXB/ofkQZM7wYuvSjski9Gy2MT4=
X-Gm-Gg: AZuq6aIDtzJubkBUfpouOxn444K5xsqfBQIKj6uZftC0HixX+o2bqlUITyCN2U72wiv
 FRcRj+dg99WDUQ4vO7eRxuODr0++wjeIB+24Yopr6Fw3I06V6PKia5Ns4WNzSyK3Q+BEJWNF2Gg
 df/VH0ULasNKXuLCrIuo0w+4N/7QVywU6pn/AkmDOwezJnuuXP3YKP+asWO5X/LJTko6Bn56FA0
 GmJeHEG8JzjGNQCegi9qBt23ZOco/vQwNqk42x8q8buNRfMdQ+Oc0c/LWJnUyzsilR6+NuCNNKG
 eW0U4HIrqEAAzfZoI5e8WOieYF51eiAbGYzIexmo67YLRyo5HDLIafye7uzZUb9wyJk4If6C18f
 2Ka2FlRSWoRdmtp2yfw/g630F4l+XZbuaO6QmvkzrxPX35HmOLjfPAKIPIhOUH9sE8x+ZfWfhBo
 gfqk7U7wpfu9k43LQ3mZKI1HY=
X-Received: by 2002:a05:620a:4115:b0:8b3:14dc:4821 with SMTP id
 af79cd13be357-8ca2f82e4f9mr119607085a.3.1770153362012; 
 Tue, 03 Feb 2026 13:16:02 -0800 (PST)
X-Received: by 2002:a05:620a:4115:b0:8b3:14dc:4821 with SMTP id
 af79cd13be357-8ca2f82e4f9mr119604585a.3.1770153361463; 
 Tue, 03 Feb 2026 13:16:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3869205a5a6sm1108961fa.38.2026.02.03.13.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 13:15:59 -0800 (PST)
Date: Tue, 3 Feb 2026 23:15:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v2 3/4] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <wmq356u5rqdjzp27zvvvjwgzsf3ft4j3gpv6fuewxm6ohg5h4s@kuf5j7hxved6>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-4-jianping.li@oss.qualcomm.com>
 <3p4quidza7rwxng74fxcfoflo62tgakl7hummwsqmisaqmkwwp@nae55u2ehza4>
 <ed46e539-8cbe-4d7f-b6dd-5fd4123298fb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed46e539-8cbe-4d7f-b6dd-5fd4123298fb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=A+9h/qWG c=1 sm=1 tr=0 ts=69826592 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DPixz7r4OgWGLxUs6AsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: t2oiuOKYgcJJRGGajiPGaVY2EzgpA2FQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE2OSBTYWx0ZWRfXxCeTdKPk+B1w
 fYbBuniJmHGuOwPbfrfU+25bCB4yAlccB0flHvzGP2hYq8/JnbXtm6pTVvnRGgqzOm9zsyqmWff
 ONgLPK65ARW8kHMLxx8A3ECy7XucljK5AYljjzo8fgd+DjrIIwi/2AZsCeuiv6ejT1ddFpWm4Bo
 xBCTP36hMtOkn0a3K05QxPRqKVM5Yc/XkU2MkL5uvyFMemNd5SDOssU1j9Js4fkgNCuzB6hXe3H
 9GTZRIBuFggh3tF7gZ0wVfYAjmUYjiz73hRSjgCBmwkrvDWbPX8ZbZzU5WpPVllUJQwTkhGMSml
 K9pGTzY7n4eErFtYolvLDg1sZZx3qljM7HchlfQfh5ShyB7qHtB4obUi5HQeobABdVZIhgN6YCl
 3GNPQRsZXTdpM/F7ELsHAdtCh4fYzqgyyz78lOqYDQBA6UxzttJjtKfbfBNubhSyn2ZULa9cQ9B
 QLuLkIggobASOMPqiqw==
X-Proofpoint-GUID: t2oiuOKYgcJJRGGajiPGaVY2EzgpA2FQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030169
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jianping.li@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 55D30DEC40
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 02:51:33PM +0800, Jianping wrote:
> 
> 
> On 1/16/2026 4:47 AM, Dmitry Baryshkov wrote:
> > On Thu, Jan 15, 2026 at 04:28:50PM +0800, Jianping Li wrote:
> > > From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > 
> > > fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> > > getting removed from the list after it is unmapped from DSP. This can
> > > create potential race conditions if any other thread removes the entry
> > > from list while unmap operation is ongoing. Remove the entry before
> > > calling unmap operation.
> > > 
> > > Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
> > > Cc: stable@kernel.org
> > > Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 28 ++++++++++++++++++++--------
> > >   1 file changed, 20 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index 4f12fa5a05aa..833c265add5e 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -202,6 +202,8 @@ struct fastrpc_buf {
> > >   	/* mmap support */
> > >   	struct list_head node; /* list of user requested mmaps */
> > >   	uintptr_t raddr;
> > > +	/* Lock for buf->node */
> > > +	spinlock_t *list_lock;
> > 
> > Why do you need to lock this? Isn't fl->lock enough?
> 
> According to the discussion in v1 patch:
> https://lore.kernel.org/all/p6cc5lxufmefeulx5bhlh6q6ivwluqf2muj3hu5e5526fsppuu@brcy6arm7epg/
> 
> The lock is stored in fastrpc_buf here.

That was a separate topic. So, why fl->lock isn't enough? What is the
race that isn't prevented by it?

> > 
> > >   };
> > >   struct fastrpc_dma_buf_attachment {
> > > @@ -441,6 +443,7 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
> > >   	buf->size = size;
> > >   	buf->dev = dev;
> > >   	buf->raddr = 0;
> > > +	buf->list_lock = &fl->lock;
> > >   	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
> > >   				       GFP_KERNEL);
> > > @@ -1865,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
> > >   				      &args[0]);
> > >   	if (!err) {
> > >   		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> > > -		spin_lock(&fl->lock);
> > > -		list_del(&buf->node);
> > > -		spin_unlock(&fl->lock);
> > >   		fastrpc_buf_free(buf);
> > >   	} else {
> > >   		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
> > > @@ -1881,6 +1881,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
> > >   	struct fastrpc_buf *buf = NULL, *iter, *b;
> > >   	struct fastrpc_req_munmap req;
> > >   	struct device *dev = fl->sctx->dev;
> > > +	int err;
> > >   	if (copy_from_user(&req, argp, sizeof(req)))
> > >   		return -EFAULT;
> > > @@ -1888,6 +1889,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
> > >   	spin_lock(&fl->lock);
> > >   	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
> > >   		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
> > > +			list_del(&iter->node);
> > >   			buf = iter;
> > >   			break;
> > >   		}
> > > @@ -1900,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
> > >   		return -EINVAL;
> > >   	}
> > > -	return fastrpc_req_munmap_impl(fl, buf);
> > > +	err = fastrpc_req_munmap_impl(fl, buf);
> > > +	if (err) {
> > > +		spin_lock(buf->list_lock);
> > > +		list_add_tail(&buf->node, &fl->mmaps);
> > > +		spin_unlock(buf->list_lock);
> > > +	}
> > > +
> > > +	return err;
> > >   }
> > >   static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> > > @@ -1985,20 +1994,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> > >   		}
> > >   	}
> > > -	spin_lock(&fl->lock);
> > > +	spin_lock(buf->list_lock);
> > >   	list_add_tail(&buf->node, &fl->mmaps);
> > > -	spin_unlock(&fl->lock);
> > > +	spin_unlock(buf->list_lock);
> > >   	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
> > >   		err = -EFAULT;
> > > -		goto err_assign;
> > > +		goto err_copy;
> > >   	}
> > >   	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
> > >   		buf->raddr, buf->size);
> > >   	return 0;
> > > -
> > > +err_copy:
> > > +	spin_lock(buf->list_lock);
> > > +	list_del(&buf->node);
> > > +	spin_unlock(buf->list_lock);
> > >   err_assign:
> > >   	fastrpc_req_munmap_impl(fl, buf);
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry
