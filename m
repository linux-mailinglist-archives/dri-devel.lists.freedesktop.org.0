Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4327C247FFD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BAC89E9E;
	Tue, 18 Aug 2020 07:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D29C6E31D;
 Mon, 17 Aug 2020 12:15:18 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id x24so13225562otp.3;
 Mon, 17 Aug 2020 05:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HJ0m+miDorhqglJ9JrK44iTq3d9R15TmbjC29old1f8=;
 b=KQ04CZsRLDiNek1Hq6BgWjnM11s2YmAiDjqEVGZ1TB6F4rCxf78rX4jbJ0CzT3vabY
 xrX4JEoDeIRQkHsLGU1+gcp8w5QWNQcEyBm3wuShwRxBfydODrCE4cRQV+E7WBzKB44r
 nItPN0459qY5GQ/vDZ0NyzENyHv44GovdpKFSl4hiVWaOB2zEjXEpxHT00gUoMHFf0Aj
 T3icpJ/3pjaEvvW0UMNkSAFYHa1jbJwCP0vrwjpIL/uytt4RzckTqwRdvf5FUeTb7MGh
 bx2bsLCHbfEXkOD8bVoKRj4Mx5bjsmewyyPYaN17ohutCV8HXhFZHeJnJ+WLeKJ12UV0
 gebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=HJ0m+miDorhqglJ9JrK44iTq3d9R15TmbjC29old1f8=;
 b=ovlHtiVFQ6384+D8o9mVeOCcCBRJotPyw553ucAK2H9bltxUe8h1Z47Pv5sp93d0xm
 U4Rmjtq6KKct32jiekKIMc6N8XNb3Lrxh5nSWQwAM0UdI3Yvu2bbfMetHyBTgBSgDnkp
 CZNw15afScOoEzn8YOTDYX5nfhd/Lu+/BLkjBNXy99DlaYDC4kCVEPFyNJPpC1Er6uIk
 qODRbvJM+TrDBrx/nsx69/lDRgfzpvJUvfYi+bJgGKgJSCDUBE+ZlVk49RTzaRp6JKH+
 x0xZjEq3NWiLJHF9551HM8k9OMOLMoFuQE1k+DgAjNX8wHWeF21TQoZ153LdMRKXenQL
 Sc2w==
X-Gm-Message-State: AOAM533hv3r7yK2B9drxb9AhJQ9daGHUIwpWyMz/HNx7qkQCHURAr6Yj
 ZghArE6cw222Ga9Sqfgcpg==
X-Google-Smtp-Source: ABdhPJy4QfXEUBbWmVDtAzyWm157/pCVwSVPWhR0mJ058Fnm0lC/IAUOoEeTjBc9itF58Cw5xKVyqA==
X-Received: by 2002:a05:6830:1346:: with SMTP id
 r6mr11152982otq.325.1597666517323; 
 Mon, 17 Aug 2020 05:15:17 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
 by smtp.gmail.com with ESMTPSA id l17sm3384049otn.2.2020.08.17.05.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 05:15:16 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
 by serve.minyard.net (Postfix) with ESMTPSA id 846E11800D4;
 Mon, 17 Aug 2020 12:15:15 +0000 (UTC)
Date: Mon, 17 Aug 2020 07:15:14 -0500
From: Corey Minyard <minyard@acm.org>
To: Allen Pais <allen.cryptic@gmail.com>
Subject: Re: [PATCH] char: ipmi: convert tasklets to use new tasklet_setup()
 API
Message-ID: <20200817121514.GE2865@minyard.net>
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
 <20200817091617.28119-3-allen.cryptic@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817091617.28119-3-allen.cryptic@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Reply-To: minyard@acm.org
Cc: ulf.hansson@linaro.org, linux-atm-general@lists.sourceforge.net,
 manohar.vanga@gmail.com, airlied@linux.ie, Allen Pais <allen.lkml@gmail.com>,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 kys@microsoft.com, anton.ivanov@cambridgegreys.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 maximlevitsky@gmail.com, richard@nod.at, deller@gmx.de,
 jassisinghbrar@gmail.com, 3chas3@gmail.com, intel-gfx@lists.freedesktop.org,
 kuba@kernel.org, mporter@kernel.crashing.org, jdike@addtoit.com,
 keescook@chromium.org, oakad@yahoo.com, s.hauer@pengutronix.de,
 linux-input@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, broonie@kernel.org,
 openipmi-developer@lists.sourceforge.net, mitch@sfgoth.com,
 linux-arm-kernel@lists.infradead.org, axboe@kernel.dk,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org, martyn@welchs.me.uk,
 dmitry.torokhov@gmail.com, linux-mmc@vger.kernel.org, sre@kernel.org,
 linux-spi@vger.kernel.org, alex.bou9@gmail.com, stefanr@s5r6.in-berlin.de,
 linux-ntb@googlegroups.com, Romain Perier <romain.perier@gmail.com>,
 shawnguo@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 17, 2020 at 02:45:57PM +0530, Allen Pais wrote:
> From: Allen Pais <allen.lkml@gmail.com>
> 
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

This looks good to me.

Reviewed-by: Corey Minyard <cminyard@mvista.com>

Are you planning to push this, or do you want me to take it?  If you
want me to take it, what is the urgency?

-corey

> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index 737c0b6b24ea..e1814b6a1225 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -39,7 +39,7 @@
>  
>  static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
>  static int ipmi_init_msghandler(void);
> -static void smi_recv_tasklet(unsigned long);
> +static void smi_recv_tasklet(struct tasklet_struct *t);
>  static void handle_new_recv_msgs(struct ipmi_smi *intf);
>  static void need_waiter(struct ipmi_smi *intf);
>  static int handle_one_recv_msg(struct ipmi_smi *intf,
> @@ -3430,9 +3430,8 @@ int ipmi_add_smi(struct module         *owner,
>  	intf->curr_seq = 0;
>  	spin_lock_init(&intf->waiting_rcv_msgs_lock);
>  	INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
> -	tasklet_init(&intf->recv_tasklet,
> -		     smi_recv_tasklet,
> -		     (unsigned long) intf);
> +	tasklet_setup(&intf->recv_tasklet,
> +		     smi_recv_tasklet);
>  	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
>  	spin_lock_init(&intf->xmit_msgs_lock);
>  	INIT_LIST_HEAD(&intf->xmit_msgs);
> @@ -4467,10 +4466,10 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
>  	}
>  }
>  
> -static void smi_recv_tasklet(unsigned long val)
> +static void smi_recv_tasklet(struct tasklet_struct *t)
>  {
>  	unsigned long flags = 0; /* keep us warning-free. */
> -	struct ipmi_smi *intf = (struct ipmi_smi *) val;
> +	struct ipmi_smi *intf = from_tasklet(intf, t, recv_tasklet);
>  	int run_to_completion = intf->run_to_completion;
>  	struct ipmi_smi_msg *newmsg = NULL;
>  
> @@ -4542,7 +4541,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
>  		spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
>  
>  	if (run_to_completion)
> -		smi_recv_tasklet((unsigned long) intf);
> +		smi_recv_tasklet(&intf->recv_tasklet);
>  	else
>  		tasklet_schedule(&intf->recv_tasklet);
>  }
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
