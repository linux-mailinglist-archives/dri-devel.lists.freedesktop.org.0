Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17F39B1FC0
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 19:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2866610E00A;
	Sun, 27 Oct 2024 18:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lg705Zxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7B410E0F1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 18:44:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF9CE5C581F;
 Sun, 27 Oct 2024 18:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD269C4CEC3;
 Sun, 27 Oct 2024 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730054654;
 bh=EIntNmE1Xkfl7FP0BbUtu1IEVn58qG+RPycF56flTO0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Lg705Zxs5x61zmL58KHai2XL2C6Z8BnOQSclWkVJzSMOefgre6ELgU7UjOMXAsJ1x
 S5OHO6xH3/MljPl8RhX89vOf9Cs+o8gfGhxhT8Bj6Uc2o1RxQ+Rp+mKK5iIq/AYXOp
 7PeSYUpuKNrNHkGuSn49BAJuyu2abF+pu6qFDN7e0hOHwoIsR1jqClO1YF0aA12XhC
 pKL7/NipMFzTzrOtp1Wy4gvZlHLMrr0h3dddyovP/n436CT2j4onUGsj2w6zVlmHiY
 +fgLc6w3QIjWvyG2+VTnmGxrV9SxlRI3yTKxj9PBhTdlJkCldV7yxYOFD3Mtl/otoM
 bcxaL4BaHGlEQ==
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id CB9A31200043;
 Sun, 27 Oct 2024 14:44:12 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Sun, 27 Oct 2024 14:44:12 -0400
X-ME-Sender: <xms:_IkeZ0bylqZd1EMgVICQKmolf733CRSuG7OFFNo41LBv2WrDujDxZQ>
 <xme:_IkeZ_YnbuCbwegGSi5pWK66QQFGLIesbRCzLR3iKZYPXFElHSE8xTUTULhrlklH3
 7jIKb--F41vWA8cOxs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejiedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvg
 hlrdhorhhgqeenucggtffrrghtthgvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeef
 iedtudeikeeggeefkefhudfhlefhveenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
 ihhthidquddvkeehudejtddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlh
 drohhrghesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhht
 phhouhhtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhope
 grihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosggutghlrghrkhes
 ghhmrghilhdrtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvg
 drtghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthho
 pehnuggvshgruhhlnhhivghrshesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhonh
 hrrgguhigstghioheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehk
 vghrnhgvlhdrohhrghdprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslh
 hinhgrrhhordhorhhg
X-ME-Proxy: <xmx:_IkeZ-9f9qjMSEe-ueet4s1KHilrjY1nz9yePccb1KNtF2fiUO1BEA>
 <xmx:_IkeZ-r-TkLzbCkivqWsrpAvWjVC1esvbL2mNyBhMxewljP5HskQnQ>
 <xmx:_IkeZ_qJpFx9gWVfSl9m0g28gSiF-Q6-vJThUFWTxsoPuKIK4R5gDQ>
 <xmx:_IkeZ8T3Y8WxMEd8mbgy9-3pyt0r8mACGzc7kPHUjbrCPgLxJdHCpA>
 <xmx:_IkeZ_oneK8wy36x6Wrwn15_874iZBfWgOfNEM1t3QG-nKjI4cFi0Mcx>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id A11CC2220071; Sun, 27 Oct 2024 14:44:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sun, 27 Oct 2024 18:43:52 +0000
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Akhil P Oommen" <quic_akhilpo@quicinc.com>,
 "Rob Clark" <robdclark@gmail.com>, "Sean Paul" <sean@poorly.run>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Marijn Suijten" <marijn.suijten@somainline.org>,
 "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <3fb376b3-2db7-4730-a2e1-958f1ddd9f5c@app.fastmail.com>
In-Reply-To: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
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

On Sun, Oct 27, 2024, at 18:05, Akhil P Oommen wrote:
> Clang-19 and above sometimes end up with multiple copies of the large
> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> fill the structure, but these create another copy of the structure on
> the stack which gets copied to the first.
>
> If the functions get inlined, that busts the warning limit:
>
> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size 
> (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' 
> [-Werror,-Wframe-larger-than]
>
> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> the stack. Also, use this opportunity to skip re-initializing this table
> to optimize gpu wake up latency.
>
> Cc: Arnd Bergmann <arnd@kernel.org>

Please change this to "Reported-by:"

The patch looks correct to me, just one idea for improvement.

> b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 94b6c5cab6f4..b4a79f88ccf4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -99,6 +99,7 @@ struct a6xx_gmu {
>  	struct completion pd_gate;
> 
>  	struct qmp *qmp;
> +	struct a6xx_hfi_msg_bw_table *bw_table;
>  };

I think the bw_table is better just embedded
in here rather than referenced as a pointer:

> +	if (gmu->bw_table)
> +		goto send;
> +
> +	msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;

It looked like it's always allocated here when the device
is up, so you can avoid the extra overhead for keeping
track of the allocation.

      Arnd
