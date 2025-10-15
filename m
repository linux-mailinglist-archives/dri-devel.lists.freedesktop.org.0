Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF957BDCD27
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 09:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DF910E31D;
	Wed, 15 Oct 2025 07:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="oVKmUxp4";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="GS2h8t8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC12210E6F4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:06:59 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 3976B7A0199;
 Wed, 15 Oct 2025 03:06:58 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Wed, 15 Oct 2025 03:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1760512018;
 x=1760598418; bh=ihTX14CCnGZh2yCohCI2HJ86LjAi76UHdq/41TZfvYQ=; b=
 oVKmUxp4m/sW/KDei9klcN0VCiSvhu+zuPESVJg+vRInkCiudaQL2mEBvZVR8xKO
 ZC/QXJzIZNH+XImb0D1QbHxWEHOlrVEZlwDfDUePx+1ll7/Yz7Lk1LgFaQA2udAg
 bIU9pTO2RDbYIb0deMgR+Ni61DaCLZd6gIJwR4dYxFJjCfrX5+V6oGeU2eSFL0J0
 5zJ7ICSFoh+STgHWuHwOr1bgBAlX0SkKgbMq/f4V8ZNFRPDBeWmylvnsjN28qAyL
 HF03NeW02zNXAryFtEFu4Kfxxbo81ov6yPKVSieCi6uGyhMa4N0Muwkzm41YmJrg
 M6M96Wi19r+H9CHlHGRiww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760512018; x=
 1760598418; bh=ihTX14CCnGZh2yCohCI2HJ86LjAi76UHdq/41TZfvYQ=; b=G
 S2h8t8vhkqb0qKYX1mJA2REBNk1c+upesEOyZiLAbtuSTAsRrN8Q3jwnHa8nzxVH
 jONvVoGdH0b4rK6Q/RoYV0xt3JaV9wI2DFoZuK0naZp3fzgvJut4yu60gvutCpvk
 P7OMCR2cCVZEwTT/ejwOCy9qB9jUYpxJeXBFtzAy6wOhhzYw68drTMcjQByqmKP5
 5R2aivdTkSA5RIL/pXvQhEQKQEk5nsJRan0ejaHTjJXyH+wMQ5u5FsVDB5rEeXtN
 NHkZccpv8Ac/TupkETuPkCTuKVOQQqnfp9h8EQhJG7W9avbuhlzpCW/rfPVgVDAj
 hb+l5BA7qytaCUbc1aPMw==
X-ME-Sender: <xms:EUjvaLPrwtcFXyuHi8d_N4IMgFnkTvMtNBNGr7dXHWqcFRV3b1t5ag>
 <xme:EUjvaAwBVFw1Kg8ex26yNrxNa07SNnTOgyQdPGetZLWvZZgibZXgq6tWZHs_bvaq0
 CF_AQEfo3SaXqTuPWa_Vab2NC5aIRoesfhOs3dc1f8LHaZPjhibE6MQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvddvjeejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
 uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
 hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
 gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopehsrhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrh
 gvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegurhhi
 qdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoh
 eprghiqhhunhdrhihusehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegv
 khgrnhhshhdrghhuphhtrgesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtoh
 epjhhinhhghihirdifrghnghesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthht
 ohepkhhumhgrrhhirdhprghllhgrvhhisehoshhsrdhquhgrlhgtohhmmhdrtghomhdprh
 gtphhtthhopegrmhgrhhgvshhhsehqthhirdhquhgrlhgtohhmmhdrtghomhdprhgtphht
 thhopehkphgrlhhlrghvihesqhhtihdrqhhurghltghomhhmrdgtohhm
X-ME-Proxy: <xmx:EUjvaMSwEu2JmVjqg3D5_DHXJHB-iCalyE1Ylmnbl7m384Y_LYELyA>
 <xmx:EUjvaDKn23nYoPFxbonnlv61eCpxN1FCFHoKX19TjW5CKSIUz8MyUQ>
 <xmx:EUjvaCVa1IipiWVcxJIz7jd2r_Zd4liCwEtqT1w8usbGSDDDccr0Qg>
 <xmx:EUjvaPgdvHdWzbCZPIuJzjP-puDkersyfQ4FsnP-EU0YogI48A1c9Q>
 <xmx:EkjvaFY0SIJ5VuagyDc2ukvZ6oW3vbhm8RGuKp04iPE7yAohf0i7vqFh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 9E045700054; Wed, 15 Oct 2025 03:06:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AVCRraWH2f2c
Date: Wed, 15 Oct 2025 09:06:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kumari Pallavi" <kumari.pallavi@oss.qualcomm.com>,
 kpallavi@qti.qualcomm.com, "Srinivas Kandagatla" <srini@kernel.org>,
 "Amol Maheshwari" <amahesh@qti.qualcomm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Message-Id: <4dcbf05b-1da6-417e-8d37-2756762fed94@app.fastmail.com>
In-Reply-To: <20251015045702.3022060-4-kumari.pallavi@oss.qualcomm.com>
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-4-kumari.pallavi@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] misc: fastrpc: Update dma_mask for CDSP support on
 Kaanapali SoC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Wed, Oct 15, 2025, at 06:57, Kumari Pallavi wrote:
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1a5d620b23f2..f2e5e53e9067 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -267,6 +267,7 @@ struct fastrpc_session_ctx {
> 
>  struct fastrpc_soc_data {
>  	u32 sid_pos;
> +	u32 cdsp_dma_mask;
>  };

I see that you add the field here, but it is not initialized
anywhere. Did the initialization get lost in a rebase?

Also, this is not the mask but the address width,
so maybe rename it to cdsp_dma_bits?

       Arnd
