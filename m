Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A588374C8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 22:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C209210EF27;
	Mon, 22 Jan 2024 21:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 579 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jan 2024 21:01:03 UTC
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607D310EF27
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 21:01:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id C677A320046F;
 Mon, 22 Jan 2024 15:51:19 -0500 (EST)
Received: from imap53 ([10.202.2.103])
 by compute1.internal (MEProxy); Mon, 22 Jan 2024 15:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1705956679; x=1706043079; bh=HAFVDSjmtG
 uSNBOsIjxRld4wZCro6SBlL7gz48ZG4+0=; b=wrP0NJ2VJPnD5L05SmaHeNndf6
 PHoJKM6MXwzyNnpEYrPGMzaVuFypoY0el0nxfPx1kKZ/ZtbfwGWgiTnEaEyJ414x
 Sti2RPm7roMkV40gCwErXrFIHpAgXtNfixjXzZBprSy95hLVdtGuTpn64vDfdfBq
 n6/WdS/f/d/Rh/amCM+BZ9uBu0oZetLfPHINqDRbcShwo9mCvgV21SR130Wq3GlW
 Xa9RbAwGMxiwoIY82g9px26Z0FLXbXUM0CbTD40vMUnGnHXs0cFGDqpx1+LRvqkS
 Xq1ccu61I4WPurjcseAYpLL3FiX5Txh7yPjsNJyt0bwPZCatGITCoF3/Bi6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1705956679; x=1706043079; bh=HAFVDSjmtGuSNBOsIjxRld4wZCro
 6SBlL7gz48ZG4+0=; b=ZiyhvjvE9MkiMJZcvPcZuBAEDkx0Sl8W18pam+aMKUDL
 nkYvPdMUSm01qfMGpBvR+rgMby/MldT9IlsE9rVftMe0cnn9BZBxKzDjGYG4baJy
 XUQ0ADDvEJiOnjzCifFPOcydH0nt/aRPzOZMgwkAtKIIrcL4roHXqOLA4CdraD0U
 NFe4yft0+YJXgrSPbDbvqcKhczLiQNhz+/b/dK0vRcX4iZXY8FtBCWa4ajuBse54
 Mlw4+3Ubn4DBTjkVg06i08/Q9WKu6Q4QhByPl/E++t3ssCWxDWPX7xDZunzYqFLJ
 BlLh0yryk+2OjhETIVNEr4qnO78BoMA8nwcDuHLL/g==
X-ME-Sender: <xms:RtWuZSd5RX0CJfTBay7tGr_4AyZgoBZ_uGhUzSTQlGnPZK4mP9quVw>
 <xme:RtWuZcO7V4tsc8vrYkx6CC-s5yf_xWOSYIb5LCKb32OAvQLIOdYxx5X_K3uPd5vYX
 HS7vtkHCAw7vTKMOSo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfl
 rghnnhgvucfirhhunhgruhdfuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtth
 gvrhhnpeegteelvdfghedugefffeejgfehffdtffehgefhieelhfehffetteduteehieev
 feenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvght
X-ME-Proxy: <xmx:RtWuZTh8MFC1Ey7NLOPtKVQlZsfO61KCLAiKf1-Q-Ek94RQLuDNAww>
 <xmx:RtWuZf-fwgzKAq1f0Cfe-D3KCNV43qh0JQ770xpF0hFxPV-LKtnd_A>
 <xmx:RtWuZev99CdA1t7WuoppbTUxhJp1dC8k5M73z7Yylvy6_amHX4dCFA>
 <xmx:R9WuZb-8gzf3BYryG8WZjMYjaJbe6N1vt661L6bVKccM5EDVPdLQYw>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0EA65364006B; Mon, 22 Jan 2024 15:51:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <efebd848-c952-41f8-9422-fe2235d92259@app.fastmail.com>
In-Reply-To: <20240117104448.6852-1-arnd@kernel.org>
References: <20240117104448.6852-1-arnd@kernel.org>
Date: Mon, 22 Jan 2024 21:50:56 +0100
From: "Janne Grunau" <j@jannau.net>
To: "Arnd Bergmann" <arnd@kernel.org>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH] drm: apple: mark local functions static
Content-Type: text/plain
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
Cc: Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>,
 Asahi Lina <lina@asahilina.net>, Hector Martin <marcan@marcan.st>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hej,

On Wed, Jan 17, 2024, at 11:44, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> With linux-6.8, the kernel warns about functions that have no
> extern declaration, so mark both of these static.
>
> Fixes: 2d782b0d007d ("gpu: drm: apple: Add sound mode parsing")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This is for the bits/200-dcp branch in https://github.com/AsahiLinux/linux,
> the code is not yet upstream.
> ---
>  drivers/gpu/drm/apple/parser.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/apple/parser.c 
> b/drivers/gpu/drm/apple/parser.c
> index 44aad9a64f9a..ea9f40bb7de2 100644
> --- a/drivers/gpu/drm/apple/parser.c
> +++ b/drivers/gpu/drm/apple/parser.c
> @@ -694,7 +694,7 @@ int parse_epic_service_init(struct dcp_parse_ctx 
> *handle, const char **name,
>  	return ret;
>  }
> 
> -int parse_sample_rate_bit(struct dcp_parse_ctx *handle, unsigned int 
> *ratebit)
> +static int parse_sample_rate_bit(struct dcp_parse_ctx *handle, 
> unsigned int *ratebit)
>  {
>  	s64 rate;
>  	int ret = parse_int(handle, &rate);
> @@ -715,7 +715,7 @@ int parse_sample_rate_bit(struct dcp_parse_ctx 
> *handle, unsigned int *ratebit)
>  	return 0;
>  }
> 
> -int parse_sample_fmtbit(struct dcp_parse_ctx *handle, u64 *fmtbit)
> +static int parse_sample_fmtbit(struct dcp_parse_ctx *handle, u64 *fmtbit)
>  {
>  	s64 sample_size;
>  	int ret = parse_int(handle, &sample_size);

thanks, patch included in my dev branch and will be in the next pull request I'll send to Hector.

I suppose the recipients are generated by an automated get_maintainers.pl invocation. Is that desired for out of tree drivers?

best regards,
Janne
