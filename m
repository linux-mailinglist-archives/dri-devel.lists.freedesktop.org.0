Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN3EFAPEnGnJKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 22:17:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD517D79B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 22:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8183710E0C9;
	Mon, 23 Feb 2026 21:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoFxN9xd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ViYj2Hws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AA210E0C9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 21:17:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NFVcAl1200431
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 21:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1FKuQnvI/JR7GzRu2Av4diW6
 kuTld28E3cs1g9PwsAw=; b=YoFxN9xdqfbroHf6OUjrfeAF5dcbf7gSGyLivvOc
 kkug/Sl/B92VQYI6SW1xgHu+pHZXEwVdpTkCTlQ2jV4IZVg3iFKd6CRtcwcg/TzD
 KGu5qcchqKgXjob0deTMRKfqx51EqgZ7MVFOOGDWxJhYVCXFCRhnasQiB7JYdn2f
 BcAn6lh6U3TIpqUSSj89ZaraZmfqJeP7rR3nnLyt8S3Z8BSG29AeXYU80fRGVz+R
 GDnZgpU2jF1LHs6R2mFCn5srpSXKzfECXKj1HcmdrFZRYC6JZZYKgkH7nr2cya0q
 hhaLZGVnm3jJb9ybOYXaYiCDyCJZWBe98V42AThT0Zw7ug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r9wc3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 21:17:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c881d0c617so4266825085a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 13:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771881468; x=1772486268;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1FKuQnvI/JR7GzRu2Av4diW6kuTld28E3cs1g9PwsAw=;
 b=ViYj2HwsBcvLGMFQdBEPQ7Fa2we6qweMZT4DKu4wItMIK11CAtZYmaS/Sp29vIlGsV
 EhA1O3g1I1NtTgXI4O3E/Xd7ZTH6hupyyLlEXfj/aF0B7nobqLZ1FqN2nN9dUgV9Ew+8
 psw/gkiYgh6s5d34o+yYobNuhpMP4z6BRWYfoCtNHnKoJAfNrtmc6OKSo41BPehpUaW3
 6D4saeMOTSKZj7lPbkL2Kx3/o3c+Cnz3xJstRHOPvllqNAFx1g8zO6YZGN0PO6SQRUSP
 tpG8RXqTIPMRZ9K6v/8oLsnZ+2E2KNkakERaC7S6LYgBLJ1yqbiqDrPjl9nB/zYgW58S
 T0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771881468; x=1772486268;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1FKuQnvI/JR7GzRu2Av4diW6kuTld28E3cs1g9PwsAw=;
 b=YMo6AsDyV9/5vX9OTKIDOqlY1lAkYxLF9L/H9vH1CTcH1fr6wCPH3G6wuOWRMSFhP3
 +TLahI4+xjMjDAtJw8WLlX6fBS/u/tR2v/ekAFYfClJ1rkt4oqehuEu19iPo9RMxtoVJ
 adzp7QfYT8Evz7+EJ6WZX2SAg95bJQ+6lQcFyUPyXYw/UFzX/46si0agrD8zS2coQtgi
 NSwfahWo15E1GwavtjNIRt4dp2UbL/K+GBGwBVI5t5IVS44Yzv6ALjO0nGTrjWBCU7pO
 UyIDIG7a0Z3QK2axQ0xIQUv6gs0cwlaGpoSLqfEbPQ74bcNvuqUokE898NtrU2P0kTP/
 /VeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUBnNpt1aCmEZkN1VNfDdYdE3njym8Il5iBg4TEwmk64arxSqj5u709/+2qFs2hgotFeShUlXHBfo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNlRlOFHRCtpvFJc+8d7YUk/sKp8oF79b1WA7wPviEAX0wVWZg
 mGS6VwAV+lwhLUvCaBpQnvQszIB3B4y95f7zGR6x66tMslHRYSikEUxV/7NTpgeKRpM7VjpdqYC
 XWEZaKqI0n9Z1A9WXSVsjuDu8RiU67LtJZzoevI2u61lqdUgQlZbZwxRIR0PwsT0X1xwQ6dU=
X-Gm-Gg: AZuq6aJjJbetxPVNHNNxjrdqcAAD1PgPO5mxTVYrJUNa0YWiERWJq3b6G43YZFKnSBq
 scmz8Df8w9K9swBi+++ueetGqXWWWHXkdKR5lWm+VhHeAzJX9LUppnU4FXYVkqqQDHDzzbBiB2k
 3L9RQL28f2q0mYWCLVj6IzkEgYSG0g96C4w8A4DPs+Vb/pW5RJ3UBIiFlZ9Vs9hobyJOtJic3UK
 +vP3MokY0dPwrPra1rmh9oPCT9QaNjpf1n6KCBvMd0B5h5I18fwdLqIooUcTqJ89QmDrF9wvBdl
 w0Vz2KAEPb2FdvwSd827pftEWkoS9XoNEPrnpbrm6rag8KquQS0nVK8AcV5MJOS3j6z7HMuUiJE
 VXMnC2uJEnpHMRc319vI4OJbuGvrAZsTezcOUOJdF9Bep5MezY/rjhlzKSrqgux7CSlhuvzlveK
 YEDVUT0h0GsfMtMjHoQyKKmm8PDaxBDGGV59Y=
X-Received: by 2002:a05:620a:294f:b0:8cb:54d6:7ba with SMTP id
 af79cd13be357-8cb8c9d1e69mr1226696385a.7.1771881468099; 
 Mon, 23 Feb 2026 13:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:294f:b0:8cb:54d6:7ba with SMTP id
 af79cd13be357-8cb8c9d1e69mr1226692085a.7.1771881467537; 
 Mon, 23 Feb 2026 13:17:47 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a7aab220sm17369921fa.37.2026.02.23.13.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 13:17:46 -0800 (PST)
Date: Mon, 23 Feb 2026 23:17:43 +0200
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
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
Message-ID: <jyd3ufisoz4xcfe2dvu26odesaz2czj22jn46qswkzz6ocg4zu@6krzvyvirkmo>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: u_llcLRVGNbdS7ZkgM3b8SOS5Cb40Gl5
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699cc3fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KKZUDU7hoNn2ThC74tMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE4NSBTYWx0ZWRfX9du4pZmW/hvP
 o+5U6npeZb67OAeLYkBBbjEAQz0g+iaUp/XvhMLQcib8Sm1gyG5kgQwcHsfXEopZYExkisblhAc
 uJHemMnwBn80/zYV0WqOMeI0tcX60caWnwmDT3gvQTh8g1uVNpw/ivvRoltoQdPcSOXYvRJFDp1
 S86mO5dqp+O8lyj5LRQxRMvxaxu8X5mO++tpnok47mLppHnZV99UIc8x5oB7rKGGBW1GP7Gis+D
 NXIsZNdPpLR52m5j9HxHtVV4lGCMtn8EX27v+eazZ2KYcJoltDKudzfKME5Mtwm9C3ZZEMS49ov
 BUxrLxVF6r2QaJjzWTOD+oWJ879xgtSuxohGU2CtBOgs+Kgu6mcVGzPopND1Q+lXDca7BFWHJ66
 pkvhchIULIFCEywIPd13epZrxWw2OXiJ3iYGqKHu2ct24PIcgJgGwTEQQRlSnZYl7k7gTswM5Vv
 tvmQXF23Ho1dknKvhmQ==
X-Proofpoint-GUID: u_llcLRVGNbdS7ZkgM3b8SOS5Cb40Gl5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230185
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: ACAD517D79B
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:38:55AM +0530, Ekansh Gupta wrote:
> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
> integrated in the DRM accel subsystem.
> 
> The new docs introduce QDA as a DRM/accel-based implementation of
> Hexagon DSP offload that is intended as a modern alternative to the
> legacy FastRPC driver in drivers/misc. The text describes the driver
> motivation, high-level architecture and interaction with IOMMU context
> banks, GEM-based buffer management and the RPMsg transport.
> 
> The user-space facing section documents the main QDA IOCTLs used to
> establish DSP sessions, manage GEM buffer objects and invoke remote
> procedures using the FastRPC protocol, along with a typical lifecycle
> example for applications.
> 
> Finally, the driver is wired into the Compute Accelerators
> documentation index under Documentation/accel, and a brief debugging
> section shows how to enable dynamic debug for the QDA implementation.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  Documentation/accel/index.rst     |   1 +
>  Documentation/accel/qda/index.rst |  14 +++++
>  Documentation/accel/qda/qda.rst   | 129 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 144 insertions(+)
> 
> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
> index cbc7d4c3876a..5901ea7f784c 100644
> --- a/Documentation/accel/index.rst
> +++ b/Documentation/accel/index.rst
> @@ -10,4 +10,5 @@ Compute Accelerators
>     introduction
>     amdxdna/index
>     qaic/index
> +   qda/index
>     rocket/index
> diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
> new file mode 100644
> index 000000000000..bce188f21117
> --- /dev/null
> +++ b/Documentation/accel/qda/index.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +==============================
> + accel/qda Qualcomm DSP Driver
> +==============================
> +
> +The **accel/qda** driver provides support for Qualcomm Hexagon DSPs (Digital
> +Signal Processors) within the DRM accelerator framework. It serves as a modern
> +replacement for the legacy FastRPC driver, offering improved resource management
> +and standard subsystem integration.
> +
> +.. toctree::
> +
> +   qda
> diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
> new file mode 100644
> index 000000000000..742159841b95
> --- /dev/null
> +++ b/Documentation/accel/qda/qda.rst
> @@ -0,0 +1,129 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +==================================
> +Qualcomm Hexagon DSP (QDA) Driver
> +==================================
> +
> +Introduction
> +============
> +
> +The **QDA** (Qualcomm DSP Accelerator) driver is a new DRM-based
> +accelerator driver for Qualcomm's Hexagon DSPs. It provides a standardized
> +interface for user-space applications to offload computational tasks ranging
> +from audio processing and sensor offload to computer vision and AI
> +inference to the Hexagon DSPs found on Qualcomm SoCs.
> +
> +This driver is designed to align with the Linux kernel's modern **Compute
> +Accelerators** subsystem (`drivers/accel/`), providing a robust and modular
> +alternative to the legacy FastRPC driver in `drivers/misc/`, offering
> +improved resource management and better integration with standard kernel
> +subsystems.
> +
> +Motivation
> +==========
> +
> +The existing FastRPC implementation in the kernel utilizes a custom character
> +device and lacks integration with modern kernel memory management frameworks.
> +The QDA driver addresses these limitations by:
> +
> +1.  **Adopting the DRM accel Framework**: Leveraging standard uAPIs for device
> +    management, job submission, and synchronization.
> +2.  **Utilizing GEM for Memory**: Providing proper buffer object management,
> +    including DMA-BUF import/export capabilities.
> +3.  **Improving Isolation**: Using IOMMU context banks to enforce memory
> +    isolation between different DSP user sessions.
> +
> +Key Features
> +============
> +
> +*   **Standard Accelerator Interface**: Exposes a standard character device
> +    node (e.g., `/dev/accel/accel0`) via the DRM subsystem.
> +*   **Unified Offload Support**: Supports all DSP domains (ADSP, CDSP, SDSP,
> +    GDSP) via a single driver architecture.
> +*   **FastRPC Protocol**: Implements the reliable Remote Procedure Call
> +    (FastRPC) protocol for communication between the application processor
> +    and DSP.
> +*   **DMA-BUF Interop**: Seamless sharing of memory buffers between the DSP
> +    and other multimedia subsystems (GPU, Camera, Video) via standard DMA-BUFs.
> +*   **Modular Design**: Clean separation between the core DRM logic, the memory
> +    manager, and the RPMsg-based transport layer.
> +
> +Architecture
> +============
> +
> +The QDA driver is composed of several modular components:
> +
> +1.  **Core Driver (`qda_drv`)**: Manages device registration, file operations,
> +    and bridges the driver with the DRM accelerator subsystem.
> +2.  **Memory Manager (`qda_memory_manager`)**: A flexible memory management
> +    layer that handles IOMMU context banks. It supports pluggable backends
> +    (such as DMA-coherent) to adapt to different SoC memory architectures.
> +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
> +
> +    * **`qda_gem`**: Core GEM object management, including allocation, mmap
> +      operations, and buffer lifecycle management.
> +    * **`qda_prime`**: PRIME import functionality for DMA-BUF interoperability,
> +      enabling seamless buffer sharing with other kernel subsystems.
> +
> +4.  **Transport Layer (`qda_rpmsg`)**: Abstraction over the RPMsg framework
> +    to handle low-level message passing with the DSP firmware.
> +5.  **Compute Bus (`qda_compute_bus`)**: A custom virtual bus used to
> +    enumerate and manage the specific compute context banks defined in the
> +    device tree.

I'm really not sure if it's a bonus or not. I'm waiting for iommu-map
improvements to land to send patches reworking FastRPC CB from using
probe into being created by the main driver: it would remove some of the
possible race conditions between main driver finishing probe and the CB
devices probing in the background.

What's the actual benefit of the CB bus?

> +6.  **FastRPC Core (`qda_fastrpc`)**: Implements the protocol logic for
> +    marshalling arguments and handling remote invocations.
> +
> +User-Space API
> +==============
> +
> +The driver exposes a set of DRM-compliant IOCTLs. Note that these are designed
> +to be familiar to existing FastRPC users while adhering to DRM standards.
> +
> +*   `DRM_IOCTL_QDA_QUERY`: Query DSP type (e.g., "cdsp", "adsp")
> +    and capabilities.
> +*   `DRM_IOCTL_QDA_INIT_ATTACH`: Attach a user session to the DSP's protection
> +    domain.
> +*   `DRM_IOCTL_QDA_INIT_CREATE`: Initialize a new process context on the DSP.

You need to explain the difference between these two.

> +*   `DRM_IOCTL_QDA_INVOKE`: Submit a remote method invocation (the primary
> +    execution unit).
> +*   `DRM_IOCTL_QDA_GEM_CREATE`: Allocate a GEM buffer object for DSP usage.
> +*   `DRM_IOCTL_QDA_GEM_MMAP_OFFSET`: Retrieve mmap offsets for memory mapping.
> +*   `DRM_IOCTL_QDA_MAP` / `DRM_IOCTL_QDA_MUNMAP`: Map or unmap buffers into the
> +    DSP's virtual address space.

Do we need to make this separate? Can we map/unmap buffers on their
usage? Or when they are created? I'm thinking about that the
virtualization. An alternative approach would be to merge
GET_MMAP_OFFSET with _MAP: once you map it to the DSP memory, you will
get the offset. 

> +
> +Usage Example
> +=============
> +
> +A typical lifecycle for a user-space application:
> +
> +1.  **Discovery**: Open `/dev/accel/accel*` and check
> +    `DRM_IOCTL_QDA_QUERY` to find the desired DSP (e.g., CDSP for
> +    compute workloads).
> +2.  **Initialization**: Call `DRM_IOCTL_QDA_INIT_ATTACH` and
> +    `DRM_IOCTL_QDA_INIT_CREATE` to establish a session.
> +3.  **Memory**: Allocate buffers via `DRM_IOCTL_QDA_GEM_CREATE` or import
> +    DMA-BUFs (PRIME fd) from other drivers using `DRM_IOCTL_PRIME_FD_TO_HANDLE`.
> +4.  **Execution**: Use `DRM_IOCTL_QDA_INVOKE` to pass arguments and execute
> +    functions on the DSP.
> +5.  **Cleanup**: Close file descriptors to automatically release resources and
> +    detach the session.
> +
> +Internal Implementation
> +=======================
> +
> +Memory Management
> +-----------------
> +The driver's memory manager creates virtual "IOMMU devices" that map to
> +hardware context banks. This allows the driver to manage multiple isolated
> +address spaces. The implementation currently uses a **DMA-coherent backend**
> +to ensure data consistency between the CPU and DSP without manual cache
> +maintenance in most cases.
> +
> +Debugging
> +=========
> +The driver includes extensive dynamic debug support. Enable it via the
> +kernel's dynamic debug control:
> +
> +.. code-block:: bash
> +
> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control

Please add documentation on how to build the test apps and how to load
them to the DSP.

> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
