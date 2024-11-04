Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DFB9BB74A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 15:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC81A10E023;
	Mon,  4 Nov 2024 14:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="c0PPblBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494D110E023
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 14:15:41 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-37d47b38336so3192753f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 06:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1730729739; x=1731334539; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NU79Kil2FkJdGGfsE/UuFxB2i6vVhYYTYqxwIZYYOOQ=;
 b=c0PPblBsBL2joBDSoBidsC+XDflrqjvlKrsPmKfDTmA1nL6Zv6mn+4b0RfT0Sz209s
 4mo1RpIbx365BIgNojecLgJl9IBbtXzVFU9D6BaCvDjLmQP1KSWfqteZd4ZQZ8YoacHl
 AGSg63uutljt3z65bh+uLYplQaU05mn5r0lk/R3JjMXUsfVkU4NCtDgljQBONJ+89AQg
 J1NAIQnxSmyFmzd5a6x+fUfh5H2JWpz1JWR3Zi93mQ3h8Jg7BWb7X3uQPbT54O+xcLWy
 JQBSEmX9+00jaczhJ5fTGmfoOIEOeXboTj/0uJDfJpS+tE36d4N6J4FhikzPbYVoQxmC
 Qm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730729739; x=1731334539;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NU79Kil2FkJdGGfsE/UuFxB2i6vVhYYTYqxwIZYYOOQ=;
 b=sMHaAbpf8QVgKHBip9VTmrdLH5PAilGkTfiDy5rKOueK/ERoN4UCORdT7raFmEAq5D
 NnKZfmw+ENVV0q9uracgivxtnkJzEkkANJGGc4FJk2v2ke12c2hkfq22VflRyRBTw3OX
 PeTIDvONxYce0jzpzCmgxDieVr35LiTJESKELZK3pOoLSleHqUbo/P4OyYYFmAQy7mWO
 m1yqMNtxW9OIMRJXG90TItyV05tV3zuQ4IPyxfV3GWUVnQzlrRG7vsFEomSfJUg9ku5u
 uAP8DHzV5ZlNCI1CEEn973JUAP/qicuUiUu4CWeMxLN5prjQn4PsBGs3I3/Nq3wnWkz1
 hmvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdnd4TSMu/wvNRVM7RJ36xj1GeS26A4o9IYdX/MmryByDeM4fna1m9DNJOYlKhn9Vz+voZUZhlaHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqSLBtowjyBfJ8UzettpN+uH2kA2Ny83NMxigueEc9dcDy/oAJ
 FvUYT80budrxDFwN2XDS5FCGss6AFahDUnbIrpwJ1CuuatTSpKUWzFMutxz3Bm0=
X-Google-Smtp-Source: AGHT+IG7mlyU7oOO3XUXb2qoKVnfOPe7DTSkNDY8M0ibJiNqB6GPG5O8vddk4VZPk8E9QsQ4xHl8ZA==
X-Received: by 2002:adf:f7ca:0:b0:37d:34f6:92a with SMTP id
 ffacd0b85a97d-38061220071mr22566149f8f.51.1730729738071; 
 Mon, 04 Nov 2024 06:15:38 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116bb6asm13323778f8f.110.2024.11.04.06.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 06:15:37 -0800 (PST)
Date: Mon, 4 Nov 2024 15:15:35 +0100
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
Message-ID: <ZyjXB52dbhjZEHp6@pathway.suse.cz>
References: <20241023121145.1321921-1-jfalempe@redhat.com>
 <20241023121145.1321921-6-jfalempe@redhat.com>
 <Zxpa2zt1P9Avy4Pm@pathway.suse.cz>
 <27c1a6bf-d1e4-469f-a0d4-3e74ab0d0a07@redhat.com>
 <a6c00956-3733-43a1-9538-aa2758d2b4a3@redhat.com>
 <ZyT7MScAsHxkACfD@pathway.suse.cz>
 <d5c8ea70-8596-42a1-8688-0f6131187b73@redhat.com>
 <84o72vcm46.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84o72vcm46.fsf@jogness.linutronix.de>
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

On Mon 2024-11-04 11:52:33, John Ogness wrote:
> On 2024-11-04, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> > I looked at what serial drivers are doing, because they can also have 
> > their clock gated in suspend.
> >
> > Would calling console_stop() in the suspend and console_start() in 
> > resume work ?
> 
> Yes. That is what it is for.

It seems that you are right. I have never really investigated the purpose
of this API /o\

One problem with this API is that it does not check whether the
console is registered. I wonder whether it might cause problems.

For example, we should not set the CON_ENABLE flag when the console is not
registered. Doing so would cause register_console() to always enable
the console, even when it is not preferred.

Additionally, nbcon_kthread_wake() uses con->rcuwait, which is initialized
by nbcon_alloc() called from register_console(). Fortunately, nbcon_alloc()
is always called even if the console is not enabled in the end, but this
might change in the future and cause subtle errors.

[ After even more thinking ]

I wonder whether console_start()/console_stop() should really
manipulate CON_ENABLE flag. It might be historical solution when
@console_suspended was a global variable.

But it has changed with the commit 9e70a5e109a4a2336 ("printk: Add
per-console suspended state").

It might make more sense when console_start()/console_stop()
manipulates CON_SUSPENDED flag. Then it would make sense
to rename them suspend_this_console()/resume_this_console().

What do you think?

Best Regards,
Petr
