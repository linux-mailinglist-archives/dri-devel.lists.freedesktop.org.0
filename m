Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B59CF0105
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 15:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE31A10E345;
	Sat,  3 Jan 2026 14:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DRYq2viL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8486210E318
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 14:23:02 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-640c9c85255so12684764d50.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jan 2026 06:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767450181; x=1768054981; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KWO8OL17OBUAj+kZREKMHrCa17fZaSRz1SGAoiZKS+E=;
 b=DRYq2viLwS3vUWJQ7mh7ih8Ypgaes6zjtZSrnfK3SYN/fPnjaMmVc9EyhqEwZyEFTA
 e+T8xYS+15mG1c7frNtQCzU2mbVNOGH5/7m+jOtxt9c5DqLJFilNxpEz92zpUJLEy5da
 tzFw1TTCvvhKQo/VGjLPlJdAMjZwPSfJLWFTII/LT+RHT4fGPaiEnTORB/to8fETV79h
 F/BZk0Ngz3v4Cgf9jnmXobFDLgscdo5Rd3+1jSHggrsxBaeBn7zcBD/dN4hR6jgmWyyl
 zofS280JSCufn9Ger1COcE2gjjPlPboM4L21d5oPhpUd7MWnwHfPV6Zl4t1arzY1zkG4
 Yqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767450181; x=1768054981;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KWO8OL17OBUAj+kZREKMHrCa17fZaSRz1SGAoiZKS+E=;
 b=uNle1RF4GUPvkH0BJ35e0KMYEx2Zz6cr6MChMJuj6p5RNUojs5w7aEQV2qiZpFhtTb
 zPw8dmdmstk9oTXA/Y9KRsi8neVP5MrOsYGEL3K+pMoqSDldoSFGex29uMpzfV7R6bvd
 hTjI1HuX9x0As4F2bXrfALUxj5fV9mLrdLEbAEHyW905y7nHNukcE4j0/pR5xhG5IWgI
 D1w2nCrgefGysvFV8UgRaqEUPzX/NqqbwHMgwEflMlTYqetD8K3annR/Mn5zN92dA4cc
 fKzu7kLSt6o0ouYxw9Bo6UWHh7UZIhwzuy1ylpwEWquxZ0KobwNB7NkbUDgcwPXi7DsG
 RS+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfQU6wWgDcX0F551tTTxqhxPQo/Swo612U+XRgU1AVxHSU/+Qkkhloz18QWtxCqE130y1H8pMvnIA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCu5yUp3B/53DnXpl+rTrKII3+YQIlG4goGefvUWhIG0ev4u6v
 RE70ELpXcXcO3D2nf17guxDHE/r0RM+4nLWRUptDUAvDDm8/DMY/oIqX
X-Gm-Gg: AY/fxX79a6fFnUAZcgio/ziinZEBbX0e7YEHKeP9zPA5rxKWr+ElKaLL6Wc74tJ4VmM
 vhWbKeshguzKJ7ru6L85ZleP/SNvx6qXq+2eZLIQCyz7C0KDoOzJEueEvwJ5r+llqyh9ysaxOiC
 ZTtR4CGztzQ3YRPgdDx75KI0j1uW/7LTIkqjasv2hi2quoeqwHg6JdvIGcZBaMmTKo7enVn53Th
 IectvmnDmJwB9zyWza4GfWgy1fDu3wEa3LLT3Q/ZaO74X1r8Vvx06Ipi495cDKV/XrNPML+lRIk
 aeUoVEe5e8L7N1MYjAxmaCcQ69p6EqNZIlfe1qNsZUVkjTqht3gcbXxL+GgXd2kqxqeQy55WNAW
 mFuDopI3FVOC7HgPe7mRF3kxeiQ5SdeefZsn+dGdS8l3BJWpm7447T+biE28KaNTbQJyYEi7KiU
 cpg1BS7Js=
X-Google-Smtp-Source: AGHT+IEdPmL19UdV/nj838Gi9cF7n++Nt3CuB8F8HM0/Ed6ihGLC5se2e1S4EasbnPz0/pKisPSC0g==
X-Received: by 2002:a53:cb03:0:b0:63f:a909:d0c6 with SMTP id
 956f58d0204a3-6466a8b6552mr25947887d50.68.1767450181408; 
 Sat, 03 Jan 2026 06:23:01 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:3bbb:b821:6713:e729])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6466a8bcee0sm21277519d50.6.2026.01.03.06.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 06:23:01 -0800 (PST)
Date: Sat, 3 Jan 2026 09:22:59 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <aVkmQ4EGIQgAddZQ@yury>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2>
 <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
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

On Sat, Jan 03, 2026 at 02:57:58PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 02, 2026 at 07:50:59PM -0500, Joel Fernandes wrote:
> > On Mon, Dec 29, 2025 at 11:17:48AM -0500, Steven Rostedt wrote:
> 
> ...
> 
> > I use trace_printk() all the time for kernel, particularly RCU development.
> > One of the key usecases I have is dumping traces on panic (with panic on warn
> > and stop tracing on warn enabled). This is extremely useful since I can add
> > custom tracing and dump traces when rare conditions occur. I fixed several
> > bugs with this technique.
> > 
> > I also recommend keeping it convenient to use.
> 
> Okay, you know C, please share your opinion what header is the best to hold the
> trace_printk.h to be included.

What if we include it on Makefile level, similarly to how W=1 works?

        make D=1 // trace_printk() is available
        make D=0 // trace_printk() is not available
        make     // trace_printk() is not available

Where D stands for debugging.

D=1 may be a default setting if you prefer, but the most important is
that every compilation unit will have an access to debugging without
polluting core headers.
