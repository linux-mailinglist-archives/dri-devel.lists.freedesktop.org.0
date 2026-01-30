Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHW8NCgZfGlgKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 03:36:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25581B67EE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 03:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B771310E8D5;
	Fri, 30 Jan 2026 02:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1yv4IdO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TqgJezDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCA010E8D5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 02:36:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60TMtXmm325581
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 02:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0awdT6874YGtHlqtAyniXTK9
 kMRgr3FTTfRaGKb2iHQ=; b=X1yv4IdOyKB6PET67d45m3p9Yb0f9qcHDyx5XP8A
 5xWePmsQ44fIKbvBqgHHl9zUpy2MFiFthrC2IfcpFQfvLXkAT0QAodAC/IHitTNL
 wOOZ2BGXcWklP7BmG/f4IYb0hpW8pxLyWzb21hCrEXTScir1KsBwjtiGrcJhctri
 kZIra5UEPLd3jITsuwFBw4uv45O9aC8g9cqPVHl/rY+5RrV+D0UP3CupHAM9Tlp3
 XfaciA0EmC7vBgvTHZf6WgIqL78L5I/qbJZ9TFEWeCj4K66yS4r1gU4o+ezYlZUM
 t4JUuczbfDoYTzkxd7m/69mthmDXyweEJ9uBeEScEGAByg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7rfav-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 02:36:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c6b315185aso723764085a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 18:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769740578; x=1770345378;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0awdT6874YGtHlqtAyniXTK9kMRgr3FTTfRaGKb2iHQ=;
 b=TqgJezDVPyVsTzSTpuMsqpmdwwgvUdf/KhpxpFYaYv1i5xS4SDoIU8vdJlhTlZt4wS
 TkfXbjPuTIrI5363J9pTLZHlFu6eIedZJJ8OQ5VQIvGYRz/oY68Oh0Oc0aYlzHmGSMZ9
 a5J8jdHfxb2tfsxF/HQt3Q2ELhJ2Fb9SsniMtDU8xx/KOhMX/DgQ9s7BbCoaJ0sT9yxX
 AxL/T2tGHWHaI38Tgk5FInBggg3OyW7jcEspjXJJYWSxjVHDMlg6NhQ9ZQ1KfjdtJzd0
 T50dfL55ZHEq7bSQLDOnBvrO68Qnq2QI0xnQTLdvREE9cfl4CF6mUwNQdKSnJB9+V2wL
 Dc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769740578; x=1770345378;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0awdT6874YGtHlqtAyniXTK9kMRgr3FTTfRaGKb2iHQ=;
 b=S7DBDhIsoYH8+KnI+nefPq68VSBVBfU47VeLbGC4WvHT34A8BfcBIk8fxKvMXrIcd9
 bLNOlcG2t4UqLCB4LxyDwz64qZgHZ9KQliXYejMMOnc5unurIDxN77CyAv8AwX8tLH4B
 peHxBD1+4rAPwzt2kXCT+Jya/RK0FoeIM8fnYbXWu96rvp2uzqJrMWqCwVGkkuIIRCaa
 Uc1DsNpCNUlZn4VorICnYTL2aZWyEuKX8cUm1IivYo2fiurlgQonsxBtgsSJCqPmKbs3
 rHsJ1RLIQP5+KuQI5t2jE/mLFuqh0WWV5HXp/gUMToV9Bbvf7dI4Am8DAXpz39s5nLK8
 m29A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlfReUr/xISVxh1CQSYLbu2K2+HYkauDXAZ0keG8iDGd5ymiOQr7Jmexl6BM2R+JzHDV1WqmZREOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXibsctPnYI8z8Hi4pXSH+Oe8rwwK8ueeaE8zZpkv0j6Ed977R
 0dqnA7l8Ca0bUITypg9Moe2Mfwj22XEr45xbLm3dHjNIHnIjF8emfOm7Q0hdr9QslFsfj2w+NYi
 +gFSA5vnB/Depi0Ozvnl92/+le9N2GeECeF76BRxg9fuG9RtRAuS1+8owN+NR/4ckTdrqz/U=
X-Gm-Gg: AZuq6aLvkVEZNJmA6bfzHJ5y0siFZ9iwqLgDlMSP+oCJ2JnT91wgfvGBIflWCd93e01
 F6wifZE0vJJXVA5cJTxCx4SeXNFbu7u82j+VHI1voDwlTLaEsg7oSB5T1WT6z4kxurRvVO+W+eI
 4rRVg6AMz798+c9SSGTI+OOgdGli6y7XTX6WEzLSEVM147cppmpa+AHmA/3c1Fe/D/2Qqm+4/8a
 IIc9CHPD3B2gH2pokCzw2KypTXOHQne9kAHr43Mj8cBPApIb05/Xn/OKMDv2mOrNvWkhCZOZwRn
 L65SJhwz+auKDEBrJ1a2Z/giHINH2KzyWGsrsJbi8p59wI5WVmoxKslSCEXINTeQC5Hks7rUYdj
 UnB/Iu4jU/zY6CAK7QfBw8tyRedbNXnhqGTGsDS3qOeuBvl1Nlaidleeqgedce4A8TPcOh2+Gfk
 awr1flzaMlJ6pkETaP9h0Payc=
X-Received: by 2002:a05:620a:254e:b0:8c6:a034:9226 with SMTP id
 af79cd13be357-8c9eb34e749mr228382885a.82.1769740577630; 
 Thu, 29 Jan 2026 18:36:17 -0800 (PST)
X-Received: by 2002:a05:620a:254e:b0:8c6:a034:9226 with SMTP id
 af79cd13be357-8c9eb34e749mr228381185a.82.1769740577160; 
 Thu, 29 Jan 2026 18:36:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38625c61882sm11991331fa.12.2026.01.29.18.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 18:36:16 -0800 (PST)
Date: Fri, 30 Jan 2026 04:36:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v5] misc: fastrpc: possible double-free of
 cctx->remote_heap
Message-ID: <72tlx2t6n46k53of4xxhihbfsce6qd4x35iwaavuspc5ma47rz@qs3bzn4bartf>
References: <20260129234140.410983-1-xjdeng@buaa.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129234140.410983-1-xjdeng@buaa.edu.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAxOCBTYWx0ZWRfX/uqyCD95Iz+M
 Mmfqg722LbEpDVT9+pxmYyrrwe/dBpQu7BhkuOyTKh8cbANTZy2YSZN+ZIx8++NcNjEnDIPxaza
 BH81B2sj9TKBJAkkrvT8LlFeKE02Hd7RSndE2zkjhBHRmQZomfIm8PlZ3ndYO/q8VNYoKhuE6Fg
 3YP7sab3TgxbW9/MoJ3G8knVGDHyYLLmHJX8/8jkiaM7WT07MDlvff8HfgLAJ1ecuRdrFlDyhGN
 4DDKKVJlhLkeHdpeo4AvTXWnmgE+JtQP39SxeMghE1ThKnzNcsEw8gK4VKMaNwvcVuPB8M+B39Y
 atZxufdvl7NAARU4txGJGY162bnnEzBWarAxHgRdeelCL7b+VYmu57QbPPuaI+WinBiktgcKInQ
 FT66sUFlB9JQm9EkWpb6nnxIFIhS5hk+tjuo4IIyqNCqA6cMOX6XTdRBfmH/iWJ76HhKzpAuZPp
 O+pu4JLb1q47yBHEqcQ==
X-Proofpoint-ORIG-GUID: Rd16FnqYCKXyRBlaW-cS1PHoY6WqzY5X
X-Proofpoint-GUID: Rd16FnqYCKXyRBlaW-cS1PHoY6WqzY5X
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697c1922 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=W5TWiRnh0Z6joxywpxMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300018
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:micro6947@gmail.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xjdeng@buaa.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 25581B67EE
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 07:41:40AM +0800, Xingjing Deng wrote:
> fastrpc_init_create_static_process() may free cctx->remote_heap on the
> err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
> frees cctx->remote_heap again if it is non-NULL, which can lead to a
> double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
> device is subsequently removed/unbound.
> Clear cctx->remote_heap after freeing it in the error path to prevent the
> later cleanup from freeing it again.
> 
> This issue was found by an in-house analysis workflow that extracts AST-based
> information and runs static checks, with LLM assistance for triage, and was
> confirmed by manual code review.
> No hardware testing was performed.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@vger.kernel.org # 6.2+
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
