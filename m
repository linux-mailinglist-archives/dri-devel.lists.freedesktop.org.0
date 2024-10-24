Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465479AE8FF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 16:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FE510E29F;
	Thu, 24 Oct 2024 14:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="NBhPZY0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D86310E29F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 14:34:08 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so10283185e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 07:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1729780446; x=1730385246; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=goylafI7jLfFStQC6WZGaXMsQ2JFeFWTrPYVmVeRIjk=;
 b=NBhPZY0qpBylyMHJuLo3IdNt1OL1NJJ6XXwjOquhpiSFsodPvI2+O9gwDOuYCOYh5y
 uxeyhzKb/7n1YKxWpiTpVKauOFS9LXzEFueBL6lhTKCdsCFawS+zs+qI0J4TX7Keti5N
 N5XzxXJeiFLRUlgZ4+tW5X4UB+nkksx6K982SgiM8AfgFijgxOrHMmCEfI7Z9SGoQ5q6
 +bSr0KGrOMJ4FKrjHmWslxZaAZJ+dwFUh0s8eGrAdP8rcP+Y1U88EJ0PiqpLvdE45GUc
 6T+CJmY7yPv27vefwrCR7kOaLsTHIws4Gs7rP+2lA2ChWpiksAaD/t43J1MtonFizAFf
 rNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729780446; x=1730385246;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=goylafI7jLfFStQC6WZGaXMsQ2JFeFWTrPYVmVeRIjk=;
 b=Oh2T9eVNKFMzyhLV+9vvTLjVOd8q+pfz5cJJA9UAWiKKJlg8GdLylCriSoXoLjNXhx
 Yq38LBAekGaY2t9K1Kdj0bCJAKrlFwld65jV4cl7QI/iOlzXphw5Lqv4UAYpWj585luf
 9xar+pILBci4qRkHB1fQjzo/zHBBEw/uDJ6z/Fp84UMSwcgtAF3BeRrIbIsKDqagwzaW
 m/PlJlPjIGTYA0TpjxpOfTgHSnhhdAadcgkkp86sTPpXgKTzueWD2OYBaZ7fTfzBLejB
 zOASlAVWw7mf1rXIVmmwfoNY2ZQM8wTOd8MKTOQDHAX49U9+MMhTRTTSQXiTOPDI36fu
 TPCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV7620+vW4BGqt4IvJYrHLa7tX8yPQ+a71cdZESAOICRCf+QX0xhrsvkCmSDQy49j4sy77P8QzvGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQ6Ru7cMZxmsfzn58/UQ7p8H2xiF5D1h7V2MWqriZGOXJl67dn
 3AU5j2gy/KWKPL+CHjiycbeG1Y6UdFMsJzPsvJhGWQiUjBmTS5eKYz8pafXH1WM=
X-Google-Smtp-Source: AGHT+IFhIt6s0sLeMk2XuVfEdZOyWRHE+/3IRCdvhMVcdF+DL47SssF2SCYQrlPrKU0scUP633tJVg==
X-Received: by 2002:a05:600c:3107:b0:431:52b7:a499 with SMTP id
 5b1f17b1804b1-4318416039fmr44548645e9.20.1729780446073; 
 Thu, 24 Oct 2024 07:34:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43186bde181sm48034125e9.11.2024.10.24.07.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 07:34:05 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:34:03 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] drm/log: Implement suspend/resume
Message-ID: <Zxpa2zt1P9Avy4Pm@pathway.suse.cz>
References: <20241023121145.1321921-1-jfalempe@redhat.com>
 <20241023121145.1321921-6-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023121145.1321921-6-jfalempe@redhat.com>
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

On Wed 2024-10-23 14:00:13, Jocelyn Falempe wrote:
> The console is already suspended in printk.c.

Does this mean that drm_log_client_suspend() is called
after suspend_console(), please?

By other words, does it mean that "dlog->suspended == true" is set
only when CON_SUSPENDED is already set in the related con->flags?

> Just make sure we don't write to the framebuffer while the graphic
> driver is suspended.
> It may lose a few messages between graphic suspend and console
> suspend.

The messages should not get lost when the console is properly
suspended by suspend_console(), set CON_SUSPENDED.

Or maybe, I do not understand it correctly. Maybe you want to say
that it should work correctly even without this patch. And this
patch creates just a safeguard to make sure that nothing wrong
happens even when suspend_console() was not called from some
reasons.


Note: I tried to check the order by reading the code. But
      drm_log_client_suspend() was called via too many layers.
      And I was not able to find where exactly it was called,
      for example, from hibernate() in kernel/power/hibernate.c


> --- a/drivers/gpu/drm/drm_log.c
> +++ b/drivers/gpu/drm/drm_log.c
> @@ -310,10 +311,32 @@ static int drm_log_client_hotplug(struct drm_client_dev *client)
>  	return 0;
>  }
>  
> +static int drm_log_client_suspend(struct drm_client_dev *client, bool _console_lock)
> +{
> +	struct drm_log *dlog = client_to_drm_log(client);
> +
> +	mutex_lock(&dlog->lock);
> +	dlog->suspended = true;
> +	mutex_unlock(&dlog->lock);

It might also be possible to explicitly set the CON_SUSPENDED flag
here to be always on the safe side. We could create variant of
suspend_console() just for one console. Something like:

void suspend_one_console(struct console *con)
{
	struct console *con;

	if (!console_suspend_enabled)
		return;

	pr_info("Suspending console(%s) (use no_console_suspend to debug)\n");
	pr_flush(1000, true);

	console_list_lock();
	if (con && console_is_registered_locked(con))
		console_srcu_write_flags(con, con->flags | CON_SUSPENDED);
	console_list_unlock();

	/*
	 * Ensure that all SRCU list walks have completed. All printing
	 * contexts must be able to see that they are suspended so that it
	 * is guaranteed that all printing has stopped when this function
	 * completes.
	 */
	synchronize_srcu(&console_srcu);
}

and call here:

	suspend_one_console(dlog->con);


But this is not needed when the console is already supposed to be
disabled here. If this is the case then it might be better
to just check and warn when it does not happen. Something like:

void assert_console_suspended(struct console *con)
{
	int cookie;

	cookie = console_srcu_read_lock();

	/* Do not care about unregistered console */
	if (!con || hlist_unhashed_lockless(&con->node))
		goto out;

	if (WARN_ON_ONCE(!(console_srcu_read_flags(con) & CON_SUSPENDED)))
		pr_flush(1000, true);
out:
	console_srcu_read_unlock(cookie);
}

> +	return 0;
> +}


Best Regards,
Petr

PS: I have vacation the following week and might not be able to
    follow the discussion before I am back.
