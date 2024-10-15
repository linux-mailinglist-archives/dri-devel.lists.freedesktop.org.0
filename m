Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF7199E045
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 10:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9F710E52C;
	Tue, 15 Oct 2024 08:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ljones.dev header.i=@ljones.dev header.b="LejBiwmz";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="gxZKk+7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B0010E52C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 08:05:08 +0000 (UTC)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfout.phl.internal (Postfix) with ESMTP id A4EDA138060C;
 Tue, 15 Oct 2024 04:05:07 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
 by phl-compute-08.internal (MEProxy); Tue, 15 Oct 2024 04:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1728979507;
 x=1729065907; bh=2tg0AJwlbHilJUx1GHU+g8sA1HCyQhKZDaJQ8Aaub10=; b=
 LejBiwmzhvrWszfCK+0j5DznXwrfltvaYZzRuyBUq9JzOA1sngjyN/mhsW7Vbu5n
 T2zExFV6ngL4yNTxHzR2Lqe+Tk8HKSTDMkZOIcGmxWnqDer9gG8KevGtv5EEw5OC
 enWc70FxPifjThN59HZ7MSFCkEebM0OYSD608PCb6ubQnPJ5Mkvvw7ufXZhKNv1R
 NwRgP1mREXphRxmWXCupw7x4AdbNR38QDR73ui7AnmNsIOTl1GHHd3XW8fpXTZf/
 hS/6WQcJ4JbSY8e7ZOb91e3gSSJ+7HZiE0T9ytszP31B0qtBzt4vdz0aaJA8ok5j
 eyh30hAwFuPhFfiICjKqkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728979507; x=
 1729065907; bh=2tg0AJwlbHilJUx1GHU+g8sA1HCyQhKZDaJQ8Aaub10=; b=g
 xZKk+7dc2OPTmUSLNH/aoB9RjLxWOH+lWW4YU/2ohFgTNm8c0lECO3AM0KclLH/a
 qFpqlXqi5xnysXMsZToSCD34L6bOhBtidW9gBDNVRFaOL1NZQDeugtorZSQdXCT4
 ULK4RDzlt0QXBI79WFvh35xsJdOU41rPRTFJOHPo7HrzSlPs7BpCqqKbMF2LvkZ8
 zfCXsdcU+5/qG3wT0kbrP1JewODoOoQGf0dTQJanGZ0RUeP9YKBD8reQPBQ3eQuf
 eAERcg5Xm57IAvZKMaqlvhBKsa4/ZbTlwdwCdsnOTzMjH+WErDHegIMjCQzY73al
 rJF6XFg+QfM4EF6LCgiRQ==
X-ME-Sender: <xms:MyIOZ7uUg5fISSUqy7lPRbBFuFpfmONn0oRxoq9ljT5Yq5DGG68IYg>
 <xme:MyIOZ8dxAEnxU7tkc_N2NrQNj2kXEzaj4QXnryAx07s8ZzUN5ozo1-LVufkIiSy5s
 h4pqQl6AIhKWG6SAVc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegiedguddvlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdfnuhhkvgculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdrug
 gvvheqnecuggftrfgrthhtvghrnheptdehuefhhedvhffgvdeludfhhfdufefggfdvhffh
 teejjefhudduhfefjeeghfdunecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorh
 hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhu
 khgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtph
 houhhtpdhrtghpthhtoheprghlvgigrghnuggvrhdruggvuhgthhgvrhesrghmugdrtgho
 mhdprhgtphhtthhopehmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpd
 hrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehs
 uhhpvghrmhdusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlse
 hlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidq
 khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
 dqphgtihesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:MyIOZ-yTPejwj26-tsNUkBhERX80fpimUiqlXDEUoiO3u139qvxrvw>
 <xmx:MyIOZ6NvkX8MQGnozecvZgrCH0Z1mFSDnpZ_DhLFDaJ11id81c-Arw>
 <xmx:MyIOZ7--wHsw3i27Cb4g4t3BfrvyN7NcDoEbSmXLu7ID4QTzgT0ddw>
 <xmx:MyIOZ6Vta9cgfxnO4FqS2LB8ekD1BIrcnrB4OgZOcE7OYu1-dFLPwA>
 <xmx:MyIOZ2k_yqJI8rAvoUdJoiP1uVkXyWjSxkgWfHO7PFmITVcRDCI0XSes>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 5EEC13360077; Tue, 15 Oct 2024 04:05:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 15 Oct 2024 10:04:47 +0200
From: "Luke Jones" <luke@ljones.dev>
To: "Mario Limonciello" <superm1@kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>
Cc: "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>
Message-Id: <20b48c6f-7ea9-4571-a39c-f20a9cf62319@app.fastmail.com>
In-Reply-To: <20241014152502.1477809-1-superm1@kernel.org>
References: <20241014152502.1477809-1-superm1@kernel.org>
Subject: Re: [PATCH] PCI/VGA: Don't assume only VGA device found is the boot
 VGA device
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

On Mon, 14 Oct 2024, at 5:25 PM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI display device.
>
> ```
> 65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeForce 
> RTX 4070 Max-Q / Mobile] (rev a1)
> 66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] 
> Strix [Radeon 880M / 890M] (rev c1)
> ```
>
> The fallback logic in vga_is_boot_device() flags the NVIDIA dGPU as the
> boot VGA device, but really the eDP is connected to the AMD PCI display
> device.
>
> Drop this case to avoid marking the NVIDIA dGPU as the boot VGA device.
>
> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
> Reported-by: Luke D. Jones <luke@ljones.dev>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pci/vgaarb.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 78748e8d2dba..05ac2b672d4b 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>  		return true;
>  	}
> 
> -	/*
> -	 * Vgadev has neither IO nor MEM enabled.  If we haven't found any
> -	 * other VGA devices, it is the best candidate so far.
> -	 */
> -	if (!boot_vga)
> -		return true;
> -
>  	return false;
>  }
> 
> -- 
> 2.43.0

Hi Mario,

I can verify that this does leave the `boot_vga` attribute set as 0 for the NVIDIA device.

Tested-by: Luke D. Jones <luke@ljones.dev>
