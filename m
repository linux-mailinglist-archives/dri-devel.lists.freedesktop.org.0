Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BGCkBsbZnGkaLwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:50:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0AB17E95B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37D410E45D;
	Mon, 23 Feb 2026 22:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/oPrwQF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ay74M1Vs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565DD10E45D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:50:42 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NDsLAs185581
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TLrQewx1LWqE8yixuzB68j48
 P2XGnr1QqREmwV+PFsM=; b=T/oPrwQFOqKER80CI6r0E2nLqTAVQ/gXyaoUHDvd
 DPxVH12jR7atAn68LTSq15qRt7dkY6jRAzq/rrxed5/Gcw1sK+TtmRO/vnj2AO1Y
 xoqaS0/yoNBwrHUjfwIrTqNFXrjhrkyFpWGWg7WYaNsb9T5fioDexRWDtIxzXTqF
 EZ+rppWzrS+K9kNb00k5qQqGnYw8f0BIaSnmaqcdx6cnjRdHQFf88BgtXJHpx9e3
 LXY678B3Ug6dvUpwDSxZ7fwyAzZJpjvHF1syPYrjQ9ObhDMF9+2eWlFBekhhgQOp
 5NwSYgb/iJW0wOQ82ywZrqWpbAC5ezx2HFMZA9+728XKTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69hj7s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:50:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb3fae6f60so5811845085a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771887041; x=1772491841;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TLrQewx1LWqE8yixuzB68j48P2XGnr1QqREmwV+PFsM=;
 b=Ay74M1VsFJUrJspHRs93FnNelRS9gvyA5xX0D30xA7owMzqZFGGiQR9YB0h9QzRQv7
 TRzCk8774kLLsWivTBB7iuLyHvv+8/31q/pxxr+LoP3owPtElA2w+HM/2kT8H+KM71kj
 H0pmLfxXTJDMkhgTEUWT8RrDEu9Da3wBjWZrcslJePgtKe7iMOwYeROdL/YWEyp7ZlAN
 BLmWaye1v0jos32ZgYGzJoIJMNGCU/eSU9WffRhldSJIfHFTO7nMvJkb3PsRwhAxJJIs
 G/U1q38myuw8SCW7VS4yeIUORNHsN4IC7qC+XKU1y2Ws9e+2KTyKJxjJg2XRweMZ/+2r
 KfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771887041; x=1772491841;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TLrQewx1LWqE8yixuzB68j48P2XGnr1QqREmwV+PFsM=;
 b=B3IpBAuPEL6YWcIXJHsxVkHHOatNdiXQ/xAzxtkgLhZWtwGHT9QwcVQFXhnXBt4iCB
 dNN8jsmQpw+vpxMjrPJScOC/0i1arlNaaLOpGhbeGcfj6BYrQ7eKnMzNuZ922CU26kY0
 mNNny8Uz5eO45IVj3byxIoxc9Lizg0pkimbcRcHwhEHH7MZD2CWhQnsZNlwFkblR7KfZ
 nHH5atwXQooY02bCNVgZv4AoaAIhABtm2dV/bwmKvpOP1mJoqNqsX+oLxsawwjXbHc75
 H5TrM7sEb5V/4fmG3jVIjf7xEJbDWk7KcCUf20eqBgrAtSLv3nlQYFyvwazfYN6GAe3k
 HYwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8gut0UFQ8HS0GSrp2LRFetCEZ/G99rMk75ERIN14Xaj1zOZVBdXvY+GWxygGPo3uLsh1NmaXc12k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLEmsXxqC0En8fjqq0xCQvFHoK0ssJTw0LUfoeIe+avuKg98I4
 e6glwi6EYs/lUPZgU9G2UTtbGvXNG/nA2eMpTRDd30kGTljTM3ak3yt8n8sTX+UJ5LwoRfe1+PM
 zaYwZNej9FhEotNiiDTpeHGyoFBno8QeZW4ej/qUi9MTXD0u3jDL1WCOAepOJFbERtL+pbT0=
X-Gm-Gg: AZuq6aKRNnxb4W0a20rS2onED9XnleMSKu0jd1W1jn74hfrwYzLTJDxGaexTBgwY51L
 xdnojHEPzkJ5L3dhX7y/x5U7Pi1kU3856VTC0ulZuD/Ix9XvjHAhlTR4Skr+kik/toa66aTq3qm
 nnK9QdNyVyV25QHa6/fQ6MofgTXm9cvg5MCHOX/rUGRyjpIgwT3NeZy7MIMUONmAf72g/5fXizS
 87zZLLJkPVJMjXgeuWZOPQrQIb60rRl3+SZV98TeIJuJGUJ5Os63wxzBZRPT5FPxWDCOapxQj1r
 uNcfBRFtJ5eSUvB1IMCc8YEmF2RsAhoiHYtmqC5GAmgPveqCNJK9TaOxLmmon8bns8mUG9S8Sjm
 jl3Nz6u2TzhdLEw09kvXJggJyo1UmmmtQVKQ2YwIOj9ek8UNb+NFNfmmCq2FLkUrTmzBUmRW7M9
 NV79+0M3Ej46OfdU8M1kn79ppMJveIxQLJZqU=
X-Received: by 2002:a05:620a:4506:b0:8cb:df8:e86a with SMTP id
 af79cd13be357-8cb7bfc8d11mr1987076185a.28.1771887040696; 
 Mon, 23 Feb 2026 14:50:40 -0800 (PST)
X-Received: by 2002:a05:620a:4506:b0:8cb:df8:e86a with SMTP id
 af79cd13be357-8cb7bfc8d11mr1987071185a.28.1771887040143; 
 Mon, 23 Feb 2026 14:50:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb45a64sm1809193e87.67.2026.02.23.14.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 14:50:39 -0800 (PST)
Date: Tue, 24 Feb 2026 00:50:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 06/18] accel/qda: Add memory manager for CB devices
Message-ID: <d7s4e7xzfqfbcf5o3grc6xqm74dzwpck6ge7hyrwewmyacpuez@lcd6nhzyjr55>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699cd9c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=6noqdOoYruC88qHUYLQA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: hDRV4pIP6EhuOK5w7PM9ACuu1syMrOgz
X-Proofpoint-GUID: hDRV4pIP6EhuOK5w7PM9ACuu1syMrOgz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5OSBTYWx0ZWRfX+2GeZiLrimzd
 jL+IgLUp3RIQmziQGGau+NHRxQW3u9tWfcPtyD24uiPfZgf1Vy4BK1YgEKENIbhsLujInBOsys0
 oJg+cHiSy+8bRwyAP7lZF2NmLYnSP696g0NNuounGkga7obR6VD8D2hkRkrrllUpYHXPdiXbT/G
 NIqjB+Ums47QFX/BbRHn/JUyn6LWpBis1tINlfUnLLGxrToxsZY9LLLQEdyeWrVmMaNUfXL+maT
 x+m+9BtiqJYEGSf0yUXLzX+n82mxF09iX0yg8FICuJ9mJxCIaZ5zdZoXyRHIALDSf92+a5QQ6o0
 NJdQU7xMTbP3k2XSymcY9p7R2jK3GTH3SWhVZdFv8Z7ERD7uIiAdGw6zExTfWRqmVdnTPTPXLC/
 POiNC6VxsLuP78uiFhv0QBqWOr7pC+yzs5GPuwW6WLD7M4zKW+x7A0wI8LBGAdReuerX/1UGXkI
 d+Dz/YLn0B06Rw6ZvvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230199
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6D0AB17E95B
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:00AM +0530, Ekansh Gupta wrote:
> Introduce a per-device memory manager for the QDA driver that tracks
> IOMMU-capable compute context-bank (CB) devices. Each CB device is
> represented by a qda_iommu_device and registered with a central
> qda_memory_manager instance owned by qda_dev.
> 
> The memory manager maintains an xarray of devices and assigns a
> unique ID to each CB. It also provides basic lifetime management

Sounds like IDR.

> and a workqueue for deferred device removal. qda_cb_setup_device()

What is deferred device removal? Why do you need it?

> now allocates a qda_iommu_device for each CB and registers it with
> the memory manager after DMA configuration succeeds.
> 
> qda_init_device() is extended to allocate and initialize the memory
> manager, while qda_deinit_device() will tear it down in later
> patches. This prepares the QDA driver for fine-grained memory and
> IOMMU domain management tied to individual CB devices.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile             |   1 +
>  drivers/accel/qda/qda_cb.c             |  32 +++++++
>  drivers/accel/qda/qda_drv.c            |  46 ++++++++++
>  drivers/accel/qda/qda_drv.h            |   3 +
>  drivers/accel/qda/qda_memory_manager.c | 152 +++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_memory_manager.h | 101 ++++++++++++++++++++++
>  6 files changed, 335 insertions(+)
> 

-- 
With best wishes
Dmitry
