Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8453E1CC9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 21:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5FD6EB34;
	Thu,  5 Aug 2021 19:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862176EB34
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 19:34:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 003CD6044F;
 Thu,  5 Aug 2021 19:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628192068;
 bh=fwKKY6bFMJDEL2FPKkqHpTNMBchlx7gUmuOL3vFnpa0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KopAm7IudIT4aRfoUq561wLhRN2vUeBsXMGygdGnhFy1c1HTMsOuYfS6HaX8o+l0E
 aHCqfATzorWjqjHq3JwQf8JNapgt7V7nWfpppLaJ3V8RKg9/gsH93m3vM1dit0myg+
 5cTiwH08XuCqdH6JxUDx7cV5mB84BUOxBb4HIOL8=
Date: Thu, 5 Aug 2021 21:34:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drivers core: Export
 driver_deferred_probe_check_state()
Message-ID: <YQw9QVwL6we3dsrS@kroah.com>
References: <20210805192110.90302-1-paul@crapouillou.net>
 <20210805192110.90302-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805192110.90302-2-paul@crapouillou.net>
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

On Thu, Aug 05, 2021 at 09:21:08PM +0200, Paul Cercueil wrote:
> Export this function as a GPL symbol, so that it can be used from
> modules.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/base/dd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index daeb9b5763ae..658f1527a58b 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -296,6 +296,7 @@ int driver_deferred_probe_check_state(struct device *dev)
>  
>  	return -EPROBE_DEFER;
>  }
> +EXPORT_SYMBOL_GPL(driver_deferred_probe_check_state);

Drivers should never need to mess with this, it is for only a small set
of busses to use only.

Why do you think this is needed by a driver?

thanks,

greg k-h
