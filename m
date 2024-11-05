Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52AD9BCC97
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 13:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE0A10E57B;
	Tue,  5 Nov 2024 12:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="BeeW2Uz5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF9910E57B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 12:19:54 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-431481433bdso47731185e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 04:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1730809192; x=1731413992; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sQU/IyTDBE8a53IlvM72u1kGeqOoXp5doWB497P289E=;
 b=BeeW2Uz5E9WHk1u798mX47v9LNq0Dbt7JlTwAXAuvoHzu7u9JqMrJOWE/X3ah9szT+
 82apMNir7oHJ38jqvXXz9cc0kXBBn4xSG4qHrqcqFXIpLXFe9V0TF6Em1VuGtiEgDNfT
 F+kNm3q/R/mP/A3IcvpeGqRVXv7qXgzOEbinUxsoO2lIUrO5QZ9cUdJyXzTF4kTRCfom
 fDCXZUtkALcoiu7var9POLKf25CaKajRYMuBNMhBrazlzt1JlI3mWD+GIzEn+sdhOX07
 Jj2m0S6CN5jvo/tw5L2qdU/7b9wpIuuw6LsGhmRC0HnYze2pKomgGRnbNt4tkp+Mu8zj
 8QBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730809192; x=1731413992;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQU/IyTDBE8a53IlvM72u1kGeqOoXp5doWB497P289E=;
 b=Hd5+a+G9CUZEjoS2rMZyTeXOV7zwujQ2dIDmQ6AvTI7iVq4wBIWpdSAcn1gat4/bVe
 +kkpfgQLwaEkGgdiH7710VKTVcg49rv8Td8g2AAXHiUhxm39xnIleuMQt53VmKF/eX5F
 fUq3uiuP800e8uYPX6pUj3vUrusCkAzE3JHzM8aa+Uawgx7+5uy12pAxauo/EcptaFJV
 h/6W7RC1rDcy9qr0gu/a9D96tW+nSm/OhUg773GHr7SPxTMaoQ27i+cqjtJBLDEFiNIA
 JBBKRt0oAFFRlDNCfeBh/V/NCs5hwpTeqaPJ8fLLvGQZg9wJL9uw5lIHq1yLYqgKO9g5
 /iXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/hA3m829amMRy074bfShFVNEicu2r8K4bH0T5PW0DicjCxxYyV+S5EBT+WT1XqJR7lm8VG2HrUUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIIPAgE4eGl1aO7DGOsP4UAzQHALs1qHw7Eclcy3mb2EW+xUr1
 ee9HAR3mBh5dNgtnj90sx9B7VlQBpiMOhBsAVmOreQKmkZFoAV2RNhpqCvpvfpI=
X-Google-Smtp-Source: AGHT+IHoLA3MoVlv5d8Tr8bssN98IwzqrS77jeXA72lGk7Cq/J3lymLYGnd59ADYoNu4jd5UWw1wmw==
X-Received: by 2002:a5d:6c61:0:b0:35f:d70:6193 with SMTP id
 ffacd0b85a97d-381bea1c0c9mr17374862f8f.41.1730809192376; 
 Tue, 05 Nov 2024 04:19:52 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7d15sm16238437f8f.8.2024.11.05.04.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 04:19:52 -0800 (PST)
Date: Tue, 5 Nov 2024 13:19:49 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] drm/log: Implement suspend/resume
Message-ID: <ZyoNZfLT6tlVAWjO@pathway.suse.cz>
References: <20241023121145.1321921-1-jfalempe@redhat.com>
 <20241023121145.1321921-6-jfalempe@redhat.com>
 <Zxpa2zt1P9Avy4Pm@pathway.suse.cz>
 <27c1a6bf-d1e4-469f-a0d4-3e74ab0d0a07@redhat.com>
 <a6c00956-3733-43a1-9538-aa2758d2b4a3@redhat.com>
 <ZyT7MScAsHxkACfD@pathway.suse.cz>
 <d5c8ea70-8596-42a1-8688-0f6131187b73@redhat.com>
 <84o72vcm46.fsf@jogness.linutronix.de>
 <ZyjXB52dbhjZEHp6@pathway.suse.cz>
 <84ikt3c8uy.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84ikt3c8uy.fsf@jogness.linutronix.de>
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

On Mon 2024-11-04 16:38:53, John Ogness wrote:
> On 2024-11-04, Petr Mladek <pmladek@suse.com> wrote:
> > I wonder whether console_start()/console_stop() should really
> > manipulate CON_ENABLE flag. It might be historical solution when
> > @console_suspended was a global variable.
> >
> > But it has changed with the commit 9e70a5e109a4a2336 ("printk: Add
> > per-console suspended state").
> >
> > It might make more sense when console_start()/console_stop()
> > manipulates CON_SUSPENDED flag. Then it would make sense
> > to rename them suspend_this_console()/resume_this_console().
> 
> I worry about letting console drivers and printk.c both modify this flag
> during normal runtime. One might clear CON_SUSPENDED too soon and cause
> trouble.
> 
> CON_ENABLE and @console_suspended were always orthogonal. Moving
> @console_suspended to CON_SUSPENDED did not change that relationship.
> 
> IMHO we should continue to keep them separate. But your point about the
> console not being registered is a good one. We should update
> console_stop()/console_start() to only operate on @console if it is
> registered. Since those functions take the console_list_lock anyway, it
> would be a simple change.

First, I am fine with using console_start()/console_stop() in this
patchset. I agree that this API was created for this purpose
and should still work fine.

But I think that the API is a bit messy and would deserve a clean up.
We should do it in a separate patchset.


History:

  + commit 56dafec3913935c997 ("Import 2.1.71") in v2.1.71, Nov 2007 [1]

    This version introduced "console=" parameter which allowed to
    choose the consoles on the commandline. Before, they were
    selected at build time.

    The @flags and CON_ENABLED flag were added here as well.
    It looks to me like all available console drivers were registered
    but only consoles with CON_ENABLE flag printed the messages.


  + commit 33c0d1b0c3ebb61243d9b ("[PATCH] Serial driver stuff")
    in v2.5.28, Jul 2002 [1]

    Added generic serial_core. The CON_ENABLED flag was re-used
    to disable console when suspending the serial drivers.


  + commit 557240b48e2dc4f6fa878 ("Add support for suspending and
    resuming the whole console subsystem") in v2.6.18, Jun 2006

    Added @console_suspended global variable. It was used as a big hammer
    to block all console drivers and avoid subtle problems during suspend.


  + commit 9e70a5e109a4a233678 ("printk: Add per-console suspended state")
    in v6.6, Jul 2023

    Replaced the global @console_supended global variable with
    per-console CON_SUSPENDED flag.

    The motivation seems to be to remove dependency on console_lock.
    The per-CPU flag allows to query the state via SRCU.

    But the flag is set for all consoles at the same time in
    console_suspend()/console_resume()

	=> it still works as the big hammer.


Observation:

  + CON_ENABLED is not needed for the original purpose. Only enabled
    consoles are added into @console_list.

  + CON_ENABLED is still used to explicitely block the console driver
    during suspend by console_stop()/console_start() in serial_core.c.

    It is not bad. But it is a bit confusing because we have
    CON_SUSPENDED flag now and this is about suspend/resume.


  + CON_SUSPENDED is per-console flag but it is set synchronously
    for all consoles.

    IMHO, a global variable would make more sense for the big hammer
    purpose.


Big question:

  Does the driver really needs to call console_stop()/console_start()
  when there is the big hammer?

  I would preserve it because it makes the design more robust.

  Anyway, the driver-specific handling looks like the right solution.
  The big hammer feels like a workaround.


Reasonable semantic:

  1. Rename:

	console_suspend() -> console_suspend_all()
	console_resume()  -> console_resume_all()

     and manipulate a global @consoles_suspended variable agagin.
     It is the big hammer API.


  2. Rename:

	console_stop(con)  -> console_suspend(con)
	console_start(con) -> console_resume(con)

     and manipulare the per-console CON_SUSPENDED flag here.


   3. Get rid of the ambiguous CON_ENABLED flag. It won't longer
      have any purpose.

      Except that it is also used to force console registration.
      But it can be done a better way, e.g. by introducing
      register_console_force() API.


As I said, we could/should this clean up in a separate patchset.
Like printk-people should fix the printk-mess.


[1] pre-git linux kernel history:
    git://git.kernel.org/pub/scm/linux/kernel/git/history/history.git

Best Regards,
Petr
