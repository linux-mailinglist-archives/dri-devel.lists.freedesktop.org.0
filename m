Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Dn0AHpzQeWlCzwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 10:02:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6727D9E92E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 10:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14F110E629;
	Wed, 28 Jan 2026 09:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="PIgPuFEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FAB10E629
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 09:02:06 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-480706554beso2862925e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 01:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769590925; x=1770195725; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qAOxIVYTEue9E0jsTADeINvfipVSQ2+6/g8YDctDKvU=;
 b=PIgPuFEx5vcqVvz2E8gbLRs/tpZRlbk95AzCbsoRXSjSvdU2SaOIOwQkOAk2RjalV4
 ltEqyCOB2J5+x6FCd9ZyWAt0sOOKJApzMzu3MaeBSI/qHJ8G4W5axQ/V0cyLcbR+kn1S
 M9rZ7CFM+wMStAoKd9qmTF1O1KzOgfwykaA3d72R7vZDeAkyKkwDQoV3UaD6BlMXXkM3
 sqxKjrGEKIsUo3xV8Iz5msePqTw5MMXTTo3gge4aS+8X5uAB/M+uFbJTTXrPx2O0N17t
 xF+AIWJQTT6aTz9zbY1Z8yGogXAybT+2Txr4QipZyhpp+nn/bnKHfQkQjstSrOkUvO8m
 tPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769590925; x=1770195725;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qAOxIVYTEue9E0jsTADeINvfipVSQ2+6/g8YDctDKvU=;
 b=bmOPEJK3SPJ6WyAEDYclO01vYh7f+YYBwflDFjQzBAo8QQGa3K46XL34jCMXtZsq36
 a944n/LVI45l6s79JvnT3crTEeLIxDeOQ/58lak0S2p9laVSp5HNRRDCO2RfOLWyVAw+
 pyP2dh7Z/4+AVY2OAY7ss9CHhl975buGFO1Um9KZggWbBlg6cVygQFcccHMHbtvP1dR5
 QoKhC51gIkTs5zadrGdbdlqcenZi4MrRo6ri7ciiPom8/4cMhO12m5tpQB0Qf/XXZoMm
 rkHEHByyKaOKubnYpCHsxL7GurxU9OJlcLEL8ydqtcPAPz64fnW3B2GDBSYM3faWS4Lv
 HqQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAs8FiXME7MEhUVd6MfgXoWOWYRgiVii2ntGcvHDlB8ZvlrTCDt5YNskLEFu9Z3eqqkktfwn5KoRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy7Gow7y71zihveyVe9fUWJ8GwW8wLzjt/5k1SmEYUSUycdEIz
 B5AcQJfSMjKul6AkX1/YkBguSuvRi7Urtfjblm5E1bFJwqgm8zJvmfatWa883hULc20RA6UCLwE
 rcG5Q
X-Gm-Gg: AZuq6aKzC62lczKweWxVJMPQK1jMII7ICyWwk4J0jJQ5otRYcCbPFLuJFoaoYYHtkcn
 hB5W+QH/n8Mt6KzYlMLRIbN/vb5E69aBcwWuCSbWQzFPkJt4bglV5Ct/i+u+lMDluQeWxRrgfij
 CEdJli4WI0V/PVQfaWw4NC/2x83d0hpUYdyYfk0ZmaJpKkBoafLYFZHkZTMIf35mBz8Sem0+v/U
 net3WyEnZIv279Y7qmNO0VrsJyO7kL7u2Ae/VNFKoYdxuquvgSn/HIO+UL8jK/TopI/4K6qOUYE
 D7TcVRgUXuOnd20c0z0BGGa2/A2EEhq9JFsVMtuD3AJ4gkOQy5H8jr5QJmQTcdH4I9EXFC5G5XR
 aX2Ib84iPrPpVod5SiNPgpsXAMa6Dx6vhN+N/Fr7d0umKNSPwhaWYkXgbEpkTbIGAKhGmZZqcs+
 x49qGs5FVtlIbMhQ==
X-Received: by 2002:a05:600c:3154:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-48069c1a7ebmr50821355e9.11.1769590924606; 
 Wed, 28 Jan 2026 01:02:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bee7d0sm122234435e9.4.2026.01.28.01.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 01:02:04 -0800 (PST)
Date: Wed, 28 Jan 2026 10:02:01 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rt-devel@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] printk, vt, fbcon: Remove console_conditional_schedule()
Message-ID: <aXnQiSBskXo4RDAL@pathway.suse.cz>
References: <20260126180836.SNCdMW2f@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126180836.SNCdMW2f@linutronix.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:rostedt@goodmis.org,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:simona@ffwll.ch,m:deller@gmx.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pmladek@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[177.210.252.131.asn.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.linux.dev,goodmis.org,linutronix.de,chromium.org,linuxfoundation.org,kernel.org,ffwll.ch,gmx.de];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[pmladek@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,suse.com:email,suse.com:dkim,linutronix.de:email,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 6727D9E92E
X-Rspamd-Action: no action

On Mon 2026-01-26 19:08:36, Sebastian Andrzej Siewior wrote:
> do_con_write(), fbcon_redraw.*() invoke console_conditional_schedule()
> which is a conditional scheduling point based on printk's internal
> variables console_may_schedule. It may only be used if the console lock
> is acquired for instance via console_lock() or console_trylock().
> 
> Prinkt sets the internal variable to 1 (and allows to schedule)
> if the console lock has been acquired via console_lock(). The trylock
> does not allow it.
> 
> The console_conditional_schedule() invocation in do_con_write() is
> invoked shortly before console_unlock().
> The console_conditional_schedule() invocation in fbcon_redraw.*()
> original from fbcon_scroll() / vt's con_scroll() which originate from a
> line feed.
> 
> In console_unlock() the variable is set to 0 (forbids to schedule) and
> it tries to schedule while making progress printing. This is brand new
> compared to when console_conditional_schedule() was added in v2.4.9.11.
> 
> In v2.6.38-rc3, console_unlock() (started its existence) iterated over
> all consoles and flushed them with disabled interrupts. A scheduling
> attempt here was not possible, it relied that a long print scheduled
> before console_unlock().
> 
> Since commit 8d91f8b15361d ("printk: do cond_resched() between lines
> while outputting to consoles"), which appeared in v4.5-rc1,
> console_unlock() attempts to schedule if it was allowed to schedule
> while during console_lock(). Each record is idealy one line so after
> every line feed.
> 
> This console_conditional_schedule() is also only relevant on
> PREEMPT_NONE and PREEMPT_VOLUNTARY builds. In other configurations
> cond_resched() becomes a nop and has no impact.
> 
> I'm bringing this all up just proof that it is not required anymore. It
> becomes a problem on a PREEMPT_RT build with debug code enabled because
> that might_sleep() in cond_resched() remains and triggers a warnings.
> This is due to
> 
>  legacy_kthread_func-> console_flush_one_record ->  vt_console_print-> lf
>    -> con_scroll -> fbcon_scroll
> 
> and vt_console_print() acquires a spinlock_t which does not allow a
> voluntary schedule. There is no need to fb_scroll() to schedule since
> console_flush_one_record() attempts to schedule after each line.
> !PREEMPT_RT is not affected because the legacy printing thread is only
> enabled on PREEMPT_RT builds.
> 
> Therefore I suggest to remove console_conditional_schedule().
> 
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Fixes: 5f53ca3ff83b4 ("printk: Implement legacy printer kthread for PREEMPT_RT")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Just for record. This change looks OK from printk() POV.
printk() does console_trylock() and calls console_unlock()
with preemption disabled anyway, see vprintk_emit().

VT code still synchronizes some operations using console_lock().
It is possible that some non-printk related operations rely
on this. But it is hard to say. It might actually be a good
idea to find it out.

Also I have seen many printk-related softlockups. But they
were always caused by slow serial consoles. I can't remember
any in VT code.

Feel free to use:

Acked-by: Petr Mladek <pmladek@suse.com> # from printk() POV

Best Regards,
Petr
