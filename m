Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LynL3ZmgmlOTgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 22:19:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A0DECA4
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 22:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3F110E213;
	Tue,  3 Feb 2026 21:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpNH0cFN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hj7WrQNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52D610E213
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 21:19:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 613ImFsq2056107
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Feb 2026 21:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Q33evH6hj3WLvmlwGk+wUZ9n
 +vp3DbnG7eTLX/m9t+c=; b=JpNH0cFN+0s0YOCsINy6XRDrWXmdJwYdjgIUZOZU
 9Cd/8S1Qk/0aEK3hXNBFJdVXhb3K5wR7bUEI6q4e7psb64VJ9rH3aVO53dRqV4Gb
 /4yflun474jcKFk9HqNC7FVPsfXHworI4SCBqnvmeU+HqL90r7odhoi0dCtKdirb
 Qayy09JfXx2ERiIB+8BJNIl8xi3hQJgwqtmbhbLJDoaJbSZUVSKH21T/q8b2pP2A
 +aELZnKbftBmYbCViSyCwnAnytBcRM7vpK51cz6hhFGfKYKSNZomnw8/Se7uLOLf
 jV0j/Hu3V9GZalR0ayumJiVTepO49EK9Ri3orC/2+LAhCw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exka7wt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 21:19:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a344b86f7so8055826d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 13:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770153583; x=1770758383;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q33evH6hj3WLvmlwGk+wUZ9n+vp3DbnG7eTLX/m9t+c=;
 b=Hj7WrQNXco2/eeDVlGZ2nYoyPNRQstjjNdAO5MOAkxqFPzWXZvljBglTIw9Y474aMn
 wCJbilkemI82/WgAd6TgSecs8OWs5EOx8aw0rAvFWV8C8e/9o3Llel3O3lZjI0fOTFcZ
 yNlplDoOO+vqpi6kMN5hcrZNhWoj+hR69cIBuwu9w5u4NiMXBvdaSQRgsmXcZxP0Lw+q
 QKcrXLX5yW57Xng0tBci8wZzVAJZZKFoDKkmc1P+pwm9LCBNSUF+Qj5cF8cK30yzxAQg
 eBOD25vV1pc+QVhFxzgDA271SxgxAhF4keyVimda5FIJOhwZgb2sFAdlJVvMZI4YR/kb
 aLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770153583; x=1770758383;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q33evH6hj3WLvmlwGk+wUZ9n+vp3DbnG7eTLX/m9t+c=;
 b=GZMu1dSinoE5bf3wd7sDCC/Jq363ZQr/403AriW6orXBVE5q/rpq7HwouFDkqs6BPn
 Mkw9P2oSDMunTx0h2bI+BDkhiwpV6qXcr8/6o8D5Wi8aULlnkCsSpfhupMKmeZeuBs72
 kd4xwDWVYpWUJdw/grAW8X/5zyz6G9H3pp4SyQjhJi9IBRVLEH2Czgc2TK9Yeqh1OgEt
 6/74VYnEamiGTuuJtinErM845nMxRclehEVO4ExiQMV/0yTIiu/K7pTdUDSLs5VN41zw
 12dtSHV1wL3jROZg6aB/9NA2A8Lj/9ePfOtkK1sFkEKZS4Nh/OTu01+DWEfvPAvVUbgI
 aU/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH8quclMgbIdScfw9l7AT6/J2RR7MSuev0yvRe3ZxE5a99K22/JvcLtwfyfOcjM3ryTeFOb1DrJ4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz898GhgeFtQMPFLDtY/3v9VR1OkAIN3U0uiRKvQHsMPGHY5s1n
 0KeCRDjlkytFLAHGF7To9wL90AsEN6xijdh8IINSrcDkxPqHYivx0HSQPnfwI4YB9/rnV+LElmD
 BghwH6gfAbdvK1mMEwUBkNF7noZ7VZmYD5eLQPaUlQ1Cd6OoyjSu6gr04OFy0h1Etyj3EzjI=
X-Gm-Gg: AZuq6aIlGWCE2Uwum2o9bGBozJv7ISZV4YLJN7qZfi0p9bIj4bn1yW8/2qUkaMSsqoi
 cQbCLjDFXJAqxV6sxQ9d8lDO0S2PFVMRQxeyhSKn/HCYjhILxN1mLUsWE25vwibbuVZqoOS4eLZ
 eMTyhyEvebc6dNc6tc27RhTVnYr0JQJbDL5fVA9Wudi7OGuncAGmalUt+T9fEQFHiFYwX6nlms7
 ubEElYTDCqPRNf9lp0ZaGQiPqFv2MVWuoujr806EKBTp8BiUvwKDrRXksh9FlcuzlAiztxoe4S/
 xlPMO6WfPKBoTlnmuk44CO/Eff1LyIwlwO1nHTY2dfrmgHq3RhHGN9jgrjH4t9+hEK5W4aeK0I7
 sjaOiH2+8Kt0yjNlFsaOdCws9FK5lhBi/hmqX6v9NhSCwN0B9kRHX9Q1d1f+u/LUN1PWz4TEzkQ
 CcMtDpHK919h0U8s3AXTGsNQo=
X-Received: by 2002:a05:620a:4709:b0:8ca:2baa:766 with SMTP id
 af79cd13be357-8ca2f81cd2dmr133809385a.2.1770153583352; 
 Tue, 03 Feb 2026 13:19:43 -0800 (PST)
X-Received: by 2002:a05:620a:4709:b0:8ca:2baa:766 with SMTP id
 af79cd13be357-8ca2f81cd2dmr133805685a.2.1770153582815; 
 Tue, 03 Feb 2026 13:19:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38691f6ea0dsm1218481fa.9.2026.02.03.13.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 13:19:41 -0800 (PST)
Date: Tue, 3 Feb 2026 23:19:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory
 for Audio PD in probe
Message-ID: <pm7lequ6lqrgu3mloytfph5opz6aynaa4ag6uedc62fprpskoz@qqvonfthnk6n>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-5-jianping.li@oss.qualcomm.com>
 <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
 <3ba77da6-4a43-4e2b-b4d6-3d58c403ca0e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ba77da6-4a43-4e2b-b4d6-3d58c403ca0e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE2OSBTYWx0ZWRfX/cSZMZZbA8GD
 qXbzDNnK1TRF2i/UyjioIkaNhmREK9zcR4xCbhfCEG+t+m12MybHjFyTup0m4pqZhMru2b0HLuI
 jpQrjgpd+xB8Wuw01keRA6h/xg5AvyWnr8YMGTRkPNhjUoAEht8N7G7ku7jLcuDrSeC8gbZOVA4
 XxFVWJZ1T0Orhgr33VqxouhkgQm7ri+dDaKS9d5HnkormZ9bWVpBMqEirhGX20hZXEYq8ka242Y
 rTNor37R/ODKdXvGOuN29QpaAl+eUYS50t874DwjUhfkzXE1vCNzgM0uTLOVAQ6JBYZ5untCvZx
 CkJ82denKmGXSqchnFO9dT4Stc5vw6f3ijLljmu7KxYJStCrAR/4nXxL42EEfnqldFUel1bJoL2
 UecpWuzLpVmEt20Y413EtXuIIOcDGATWfUVa0EiR8qzYzSn3A6o1b1CoZc7KVx7F7ZaZBF9OoQr
 PiicTIxKCLh5qWP0Qmg==
X-Authority-Analysis: v=2.4 cv=XfOEDY55 c=1 sm=1 tr=0 ts=69826670 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=AFE5799QvwBUUD9YL4MA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: gCy5gJiq4m9uKK-2HCK1O7YynLuHDYo3
X-Proofpoint-GUID: gCy5gJiq4m9uKK-2HCK1O7YynLuHDYo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030169
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
	FORGED_RECIPIENTS(0.00)[m:jianping.li@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EF7A0DECA4
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:06:59PM +0800, Jianping wrote:
> 
> 
> On 1/16/2026 4:49 AM, Dmitry Baryshkov wrote:
> > On Thu, Jan 15, 2026 at 04:28:51PM +0800, Jianping Li wrote:
> > > The entire reserved-memory region is now assigned to DSP VMIDs during
> > > channel setup and stored in cctx->remote_heap. Memory is reclaimed in
> > > rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
> > > heap lifecycle to the rpmsg channel.
> > 
> > > @@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> > >   	args[1].length = inbuf.namelen;
> > >   	args[1].fd = -1;
> > > -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
> > > -	pages[0].size = fl->cctx->remote_heap->size;
> > > +	if (!fl->cctx->audio_init_mem) {
> > > +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
> > > +		pages[0].size = fl->cctx->remote_heap->size;
> > 
> > Do we need a flag? Can't we assume that remote_heap is always to be
> > allocated to the PD?
> We do need the audio_init_mem flag.
> Once the PD starts and daemon takes the memory for the first time, PD will
> start using the memory,
> meanwhile, the daemon can be killed and restarted. In this case, the memory
> is still with the PD and the next
> daemon connection should not take any memory for the next request. This flag
> is maintained to ensure that.
> The memory needs to be resent only if Audio PD on DSP restarts(due to
> PD-restart or Subsystem-restart)

This needs to be explained in the changelog.

> 
> > 
> > > +		fl->cctx->audio_init_mem = true;

What if there are two racing IOCTLs, trying to init AudioPD process?

> > > +		inbuf.pageslen = 1;
> > > +	} else {
> > > +		pages[0].addr = 0;
> > > +		pages[0].size = 0;
> > > +	}
> > >   	args[2].ptr = (u64)(uintptr_t) pages;
> > >   	args[2].length = sizeof(*pages);

-- 
With best wishes
Dmitry
