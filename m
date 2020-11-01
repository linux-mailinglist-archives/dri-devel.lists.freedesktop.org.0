Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6302A1C76
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 07:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CF16E075;
	Sun,  1 Nov 2020 06:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6F96E075
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 06:39:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 657205C00D2;
 Sun,  1 Nov 2020 01:39:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 01 Nov 2020 01:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=7Zy0X9cj7Iuwxadae5N9eX4bb1H
 i9Y8mnSqXOcU/JUk=; b=qi/OP1CXEcnqt48j+cMmSklPmbsXQ9Lc+7KQ3yaLluh
 z95VcVTsbXMgDCMF1pGz5nQPEyD5x21tsHMaQwv+FkHySGW9mOd0HH5zUwqpxG1N
 GXs6LVzjpwFPrQ2KuFYoW0AjYsQvC6H4cLoAasNGBsjPOJ73IY6cDUNYRMyAP46x
 feJcnPf9krddAndxwAWzabn1pgoQbf5K2dkurDxy8qlewPT/ebvM62KdN+ot+N1H
 whVo0ipOsTchQWXgLOdQAvFt/U55TGunAYfixVUvxHXGhpoQhUvDViQR8Zc9mM0M
 g7giKmjjoe+fb5GaMbuBw0ssMrMfdgTbHrX8GR6+b2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7Zy0X9
 cj7Iuwxadae5N9eX4bb1Hi9Y8mnSqXOcU/JUk=; b=oMHJDuYDI618yXvuYWeUbh
 NRSpJm/JZTExp8Ldc9f1DVK54AGxsPN5OR8gykt3GO64tCw7U4QapbRAK9g6FZHv
 J7SoS75pWkdy4tVJg7Nb/eoCErPhoZI6Ix4FXJI+lxi3+yPWgswl5/1X6BccYRzq
 RuTtzfh8LF22peFtiig86cVrB2W0bTh1MbfmXZUa/RcnYlWvG9j++YkI7vgWpOWw
 FneXFITo5bPzd/hRFDIiNNF2+UcjfFJLgMTBw9/rzjltnnYCJPGrPkbhXAbOxCYa
 J1t2dGx2mMysK6NVEd9iaadPNxJyusi+lJ2K2IvImc60XIKnwJihxthFuaTZZWZQ
 ==
X-ME-Sender: <xms:NlieX_pLMI9e84s7pWZYL6oQxr77CJ22cOyr3tFp9A8u-J83lC54fw>
 <xme:NlieX5oRQXoEtVdaBLXff3hewe8gcyidDe00V8CLGP_03ITcpdO8StBS42t2zFogG
 uV2YwT1gr54Lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleekgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
 ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
 keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:NlieX8My3UDK1FU4lESxjYtH74C_B9C2Fqw20PzJRIdl0zo5qALhuw>
 <xmx:NlieXy47cYTTolVAmk8P28r46e-HN-CI-P-wuwzmQU_HY09BVGnsFg>
 <xmx:NlieX-5KDc5UkSqK3AbTH0cInFmtBjKDhr9xbbrIVBJigQXJyLprQg>
 <xmx:OVieX52WP77hziVEKRQYWkOGSx3H-eYTp1l2y_OlDxBLb5sUkTPG2w>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 441463064680;
 Sun,  1 Nov 2020 01:39:50 -0500 (EST)
Date: Sun, 1 Nov 2020 07:39:48 +0100
From: Greg KH <greg@kroah.com>
To: Hassan Shahbazi <hassan.shahbazi@somia.fi>
Subject: Re: [PATCH] staging: fbtft: fb_watterott: fix usleep_range is
 preferred over udelay
Message-ID: <20201101063948.GB432418@kroah.com>
References: <20201101002010.278537-1-hassan@ninchat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201101002010.278537-1-hassan@ninchat.com>
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hassan Shahbazi <hassan@ninchat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 01, 2020 at 02:20:10AM +0200, Hassan Shahbazi wrote:
> Fix the checkpath.pl issue on fb_watterott.c. write_vmem and
> write_vmem_8bit functions are within non-atomic context and can
> safely use usleep_range.
> see Documentation/timers/timers-howto.txt
> 
> Signed-off-by: Hassan Shahbazi <hassan@ninchat.com>
> ---
>  drivers/staging/fbtft/fb_watterott.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_watterott.c b/drivers/staging/fbtft/fb_watterott.c
> index 76b25df376b8..afcc86a17995 100644
> --- a/drivers/staging/fbtft/fb_watterott.c
> +++ b/drivers/staging/fbtft/fb_watterott.c
> @@ -84,7 +84,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
>  			par->txbuf.buf, 10 + par->info->fix.line_length);
>  		if (ret < 0)
>  			return ret;
> -		udelay(300);
> +		usleep_range(300, 310);
>  	}
>  
>  	return 0;
> @@ -124,7 +124,7 @@ static int write_vmem_8bit(struct fbtft_par *par, size_t offset, size_t len)
>  			par->txbuf.buf, 10 + par->info->var.xres);
>  		if (ret < 0)
>  			return ret;
> -		udelay(700);
> +		usleep_range(700, 710);

How do you know that these ranges are ok?  Are you able to test these
changes with real hardware?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
