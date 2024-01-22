Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7B98374C6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 22:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D476810EF5C;
	Mon, 22 Jan 2024 21:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D2F10EF27
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 21:01:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4C0C53200A4B;
 Mon, 22 Jan 2024 15:51:51 -0500 (EST)
Received: from imap53 ([10.202.2.103])
 by compute1.internal (MEProxy); Mon, 22 Jan 2024 15:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1705956710; x=1706043110; bh=DHf6F3i9HM
 03yZ5OjQEw3X+C9dEFZ+MMU1+PGpBxv8U=; b=jDGuOYO5vY+qkuxrXvqMkGWUf9
 VAobHuZZqSTuWTQSVVPCSnwlw0CPpWlE+otp4dLH9MZ37Eoz6I9KmmpL5+KTyTuu
 369vkZuLfj/HW1NPRr41yLB5a+SuTvr7O11S4YxpWsnf0HCkWtlpo6xeDzDmQHkU
 4O5eJm8J1KDhvVNYpPx1yk8lhtf6QxXEnqOYGXWibtSfJqto/zisPgFTG66a6Ajh
 Am469ijD1yXYdebthJKhgU/AIEZsjpL3+Vx66sayD85UMejOpxK5ItgK/wzjSM5P
 2EWNZMbl3qPN37AqlNtOLwkoMyAYtAvNG4K6GANWoXP4hnSKMruGc62y70oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1705956710; x=1706043110; bh=DHf6F3i9HM03yZ5OjQEw3X+C9dEF
 Z+MMU1+PGpBxv8U=; b=CCrcjoNXZ0wuhMh0BD1AIco/t64rGJ4WftHn7YsM8W59
 9mepzD9oKiYPMGMbM2FRmjNvjPjf6Ed2XaksBEtspcs5ZdchwIJPX8idnuRSjmWw
 5AYq0TYV9cl+/a6XQN1CepiZiXFd47kYKpm9GWh0SvoOHsnEGGOkN1VEQMxYOAyK
 Jt/5BenNNvOY/dK8UmJ59yX3D+th0auGpoUlbkBjbirL1xRn9s/mtqSZKpttx+RL
 syFRrGJfXhPnZcEmAATQNtoGjYdIZIiR8rv38Irld2V4CfaQ7VOK7N8vckAIDJfm
 iRCuOep+ZYpqV8ZbtGYiCYrtPzo+r4Geg1KxR/Dgrw==
X-ME-Sender: <xms:ZtWuZdCw6UM81oJ5BrBILcdTpjklPYd_1Pht8QcLUIuo2XFi8xJYzA>
 <xme:ZtWuZbhEEYdvairXXuV_BS5UAELqTh3Y_XCcxsy68lFu2mkmODWO8tBFBxB4uRmoq
 fNzdrKlF10WogpXoQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfl
 rghnnhgvucfirhhunhgruhdfuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtth
 gvrhhnpeegteelvdfghedugefffeejgfehffdtffehgefhieelhfehffetteduteehieev
 feenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvght
X-ME-Proxy: <xmx:ZtWuZYnqF-e_RbB7zXp17YlPX4nzVCiicWBxrlf4-lES6m0JCWa9hA>
 <xmx:ZtWuZXxeFSvMqR9RewhubCofd57fqYzQYOKVYxVKc3lBaqWVFlIxSQ>
 <xmx:ZtWuZSRnkGkp0DWZc5JtliW-bWcX4oi7gECJQ-fvyBmL4b62Ah2LUQ>
 <xmx:ZtWuZXIKL7uBZ5ieUn1fW_plWZcn98W-X_20Vzv5l0HuD9UdkqqvCw>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3FD0D364006B; Mon, 22 Jan 2024 15:51:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <7c0ed806-b7c3-480c-820a-fb9b311d03f5@app.fastmail.com>
In-Reply-To: <20240122161233.125192-1-arnd@kernel.org>
References: <20240122161233.125192-1-arnd@kernel.org>
Date: Mon, 22 Jan 2024 21:51:29 +0100
From: "Janne Grunau" <j@jannau.net>
To: "Arnd Bergmann" <arnd@kernel.org>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Subject: Re: [PATCH] drm: apple: use strscpy() in place of strlcpy()
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hej,

On Mon, Jan 22, 2024, at 17:11, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Since commit d26270061ae6 ("string: Remove strlcpy()"), the strlcpy()
> function causes a build failure.
>
> Since the return value is ignored, changing it to the strscpy()
> causes no change in behavior but fixes the build failure.
>
> Fixes: f237c83e4302 ("drm: apple: DCP AFK/EPIC support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> The apple drm driver is not in mainline linux yet, this patch
> is against https://github.com/AsahiLinux/linux/tree/bits/200-dcp
> ---
>  drivers/gpu/drm/apple/afk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/apple/afk.c b/drivers/gpu/drm/apple/afk.c
> index 99d579d5ce47..9fbcd18878e8 100644
> --- a/drivers/gpu/drm/apple/afk.c
> +++ b/drivers/gpu/drm/apple/afk.c
> @@ -236,7 +236,7 @@ static void afk_recv_handle_init(struct 
> apple_dcp_afkep *ep, u32 channel,
>  		return;
>  	}
> 
> -	strlcpy(name, payload, sizeof(name));
> +	strscpy(name, payload, sizeof(name));
> 
>  	/*
>  	 * in DCP firmware 13.2 DCP reports interface-name as name which starts

thanks, patch included in my dev branch and will be in the next pull request I'll send to Hector.

best regards,
Janne
