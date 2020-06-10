Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6631F62F9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 09:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5486E8A0;
	Thu, 11 Jun 2020 07:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241FE6E863
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 20:51:56 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id b201so1650294pfb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 13:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BBQ0kH7eFUEzdi1aOvEKWX8Td5hf8bU8NRtY72Z+54M=;
 b=D+gOK5e5N4uDHgaJEiVzXMr6VuyH27uOIfpnVLZCy5Svn8efbO2h827R3C7PSG9a6K
 nSxI9rCKBM4+edb+ob89dSUUXQZZWJrsEl8UC/4RkIct10qQ6WfwWd8slAvfV1/HlK/4
 ykKf76IVM/KVIwnVtOcQc5SFY3uoVQV1mOixWR7kBTjfcGeM6FFil+FjQMvZX2lH6/fD
 gHslJ0At6A3/MekYWNpXmXm3Vi+6i8d7T3bOXM0tia17DDU08MIcYxt4wKKuf7x2IHoS
 KvHq6vwU+GQ2TNficbOEiCmyrVYunxWWsavQXQOZAWvXa7y+sW3BAUPx/QOpU3y9HdG4
 aA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=BBQ0kH7eFUEzdi1aOvEKWX8Td5hf8bU8NRtY72Z+54M=;
 b=BSXo1f/zz7igxD5SQv2Kk1xTC1JcOk4hTvyIN0Vvfo9qiCMw6AUhYWeMcMVC6yX+th
 55x070cBzzlbJ1jan9MVch3xGlVgtX6hBxR1k7xKCBn+lkgLvwwv+sBxS4m6LS1ByQvq
 Yh7J6iRAHfbGCe1ik0HDS7kWl5pm3vwXmFg1BuWdOyvIT2f7X8ugQP1zlFohXGuuEL08
 BYD10PgBHyMInb1jqk4vR5L/o/ZCasSLQ2nlMUEJIrKuLhO5dkIqEnMjqDuHBl4tamnk
 E+Uc/uvZ/PUVrOolC1UvWGO+SKYGAct0RmFLuQGZCh564GGzV4OKtY/tHPtDjr9Bs78v
 a9Gg==
X-Gm-Message-State: AOAM531PacxOY2CTiFwYA2l9ygLgfy2YutUliLU7mG49UEzWadyCl8GW
 T6POVro6N0OJu0cEb4xAZFY=
X-Google-Smtp-Source: ABdhPJxKo0OgffPzJUXcMIqo8lFX22kcJRM0lWIv/TfEFZDqsYln/aDXLO3H4Aw664SDq8TfeoQ80A==
X-Received: by 2002:a62:7a89:: with SMTP id v131mr4254293pfc.38.1591822315664; 
 Wed, 10 Jun 2020 13:51:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id x19sm793349pfo.96.2020.06.10.13.51.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 13:51:55 -0700 (PDT)
Date: Wed, 10 Jun 2020 13:51:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 01/11] tty/sysrq: alpha: export and use
 __sysrq_get_key_op()
Message-ID: <20200610205154.GA14854@roeck-us.net>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 11 Jun 2020 07:54:02 +0000
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
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jiri Slaby <jslaby@suse.com>, Matt Turner <mattst88@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 10:43:41PM +0100, Emil Velikov wrote:
> Export a pointer to the sysrq_get_key_op(). This way we can cleanly
> unregister it, instead of the current solutions of modifuing it inplace.
> 
> Since __sysrq_get_key_op() is no longer used externally, let's make it
> a static function.
> 
> This patch will allow us to limit access to each and every sysrq op and
> constify the sysrq handling.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
> Please keep me in the CC list, as I'm not subscribed to the list.
> 
> IMHO it would be better if this gets merged this via the tty tree.

Still observed:

Building alpha:defconfig ... failed
--------------
Error log:
<stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
arch/alpha/kernel/setup.c:434:13: error: initialization of 'void (*)(int)' from incompatible pointer type 'void (*)(void)' [-Werror=incompatible-pointer-types]
  434 |  .handler = machine_halt,
      |             ^~~~~~~~~~~~
arch/alpha/kernel/setup.c:434:13: note: (near initialization for 'srm_sysrq_reboot_op.handler')

I did not see a reply to the initial report. Is this being addressed ?

Guenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
