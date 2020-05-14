Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD61D4660
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AC06EC08;
	Fri, 15 May 2020 06:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DF06E2CF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 03:44:33 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49My8X5x7Yz9sSt;
 Thu, 14 May 2020 13:44:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589427871;
 bh=iZBASLOaTvF7r2NjS49achKXlbcYsjxWGScH+UJN7+c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eNimw/DJzlqPCeltJf3xFIieLSyobV5R/UR20i6h2twzzFo8SZnATUOyUVJNRd4Sj
 bOx7/itrphk/18brAttlArSb2bsqu52A4od21eqFboK2ExwoINE8XFMcSX5km6u998
 ACWq6ttN0FGsk7zcgk/Ycwx6VZhs7YyMEyW7bxPwTg+CZ7yAwWeU5vDxCDgqNcAJ56
 3dg8lt/whgnaxIphmtObIZnLqiT5Tjs1s/pn+Yrg1m804aZgiaqCBIJdgHFFCV2YmL
 MtFMU/iFH9CZ7CKkkT9u6k0kA3MI13OLKQhSmgX81tYlS4oqO4H3jE+ogItM5M0Q7Q
 wnz5sxcVkrguQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 06/11] powerpc/xmon: constify sysrq_key_op
In-Reply-To: <20200513214351.2138580-6-emil.l.velikov@gmail.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
 <20200513214351.2138580-6-emil.l.velikov@gmail.com>
Date: Thu, 14 May 2020 13:44:46 +1000
Message-ID: <875zczb2oh.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Emil Velikov <emil.l.velikov@gmail.com> writes:
> With earlier commits, the API no longer discards the const-ness of the
> sysrq_key_op. As such we can add the notation.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
> Please keep me in the CC list, as I'm not subscribed to the list.
>
> IMHO it would be better if this gets merged this via the tty tree.

Fine by me.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 7af840c0fc93..0d8ca5c9f131 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -3842,7 +3842,7 @@ static void sysrq_handle_xmon(int key)
>  		xmon_init(0);
>  }
>  
> -static struct sysrq_key_op sysrq_xmon_op = {
> +static const struct sysrq_key_op sysrq_xmon_op = {
>  	.handler =	sysrq_handle_xmon,
>  	.help_msg =	"xmon(x)",
>  	.action_msg =	"Entering xmon",
> -- 
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
