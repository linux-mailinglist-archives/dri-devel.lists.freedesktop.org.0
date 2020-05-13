Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2209E1D2232
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 00:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55BD6E157;
	Wed, 13 May 2020 22:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0CE6E157
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 22:41:53 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (unknown [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC876204EF;
 Wed, 13 May 2020 22:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589409713;
 bh=TctJClh3bXeDVJJ2/6XxJRe2TCYoY13ybyBMQN9qnE0=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=fl9UdENus+D7MZ+ZWOYQt3WzKVKDuSrjbfB4Tqf+0cOEyHqJ7neqle4od9Iph3oJL
 r0YVIBMrHAqBdl6hwWutkFUnF7ZMLBFD9T8mgmyIWkx2RW3Qx4ANbcK0ATB52j3Onw
 Ngo8UF84Ui+ooaMVUQQI6qpp3dpBS9PKD/3SQyvQ=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 26799352352C; Wed, 13 May 2020 15:41:53 -0700 (PDT)
Date: Wed, 13 May 2020 15:41:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 11/11] rcu: constify sysrq_key_op
Message-ID: <20200513224153.GB2869@paulmck-ThinkPad-P72>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
 <20200513214351.2138580-11-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513214351.2138580-11-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: paulmck@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Josh Triplett <josh@joshtriplett.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 10:43:51PM +0100, Emil Velikov wrote:
> With earlier commits, the API no longer discards the const-ness of the
> sysrq_key_op. As such we can add the notation.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: rcu@vger.kernel.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
> Please keep me in the CC list, as I'm not subscribed to the list.
> 
> IMHO it would be better if this gets merged this via the tty tree.

Works for me:

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  kernel/rcu/tree_stall.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
> index 119ed6afd20f..4e6ed7b91f59 100644
> --- a/kernel/rcu/tree_stall.h
> +++ b/kernel/rcu/tree_stall.h
> @@ -729,7 +729,7 @@ static void sysrq_show_rcu(int key)
>  	show_rcu_gp_kthreads();
>  }
>  
> -static struct sysrq_key_op sysrq_rcudump_op = {
> +static const struct sysrq_key_op sysrq_rcudump_op = {
>  	.handler = sysrq_show_rcu,
>  	.help_msg = "show-rcu(y)",
>  	.action_msg = "Show RCU tree",
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
