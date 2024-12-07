Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A69E82C1
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE61010E425;
	Sat,  7 Dec 2024 23:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fkvwqyby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED1010E031;
 Sat,  7 Dec 2024 12:45:19 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso372288366b.1; 
 Sat, 07 Dec 2024 04:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733575517; x=1734180317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGQkzKFSDY9TmwP9AaO3pZHfF41YjBH8/yCe8njtTKs=;
 b=fkvwqybyjvsi1klLDfAd3fvQaUUPyshRVNkGNO5EpanpTKvOrxNvwssMZEpzsfN8gG
 FVm6fjfPz/RPlm6AU5UPY4F+yYOXc3/L4s3VnZM9DE9xO7yWHaqKLqB6ZTz1qFiucScj
 NTZKYWh+p9ntkTLMXc8vScZyOudWitUZm7TDsggJKS6oIcGUN7rJIqPSKy6ZARih9Se2
 JXnvZ1nCrhsQh/i2kDwLbV9fV9k3FKQt1vqOOQI1Zb4yU8Ryw0U7s+Ug+yBJ+819gDYC
 05xif6FbHU3VzmIEfsr4EEPTrqMXkW4KzqTWuHCkO3ynF3kzgq3NXrgFGpG1kpdNPyFp
 FjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733575517; x=1734180317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wGQkzKFSDY9TmwP9AaO3pZHfF41YjBH8/yCe8njtTKs=;
 b=boq9Diq2hUNT5KASpCn1Loh76PexYXPbX/IyyIhihQ1vLhM0dnZjg7fJbppM9tbA8m
 jdmewN3TqjpuLrWIF1/OWNHz1VZlflhLai8MmaMaOVQ11bngCD6OnGvaoqgDseFxW9Ky
 52LzQiJopSKEM+ihWOpuhNHbeppSmZlTouKWU8/u9mdPU9jaT9VDNcr2hBaznGNQBYcK
 E5R05p1WQamAuFjPYrai15YQZyMW7iQpsAMd1yzM7K75FWbTBuGeyiilMd3PlYE7DyFl
 IL1+3GFvfR4vCwU+sS6SeURXjhyw0UyToUm5W5LfMRu9ztMeM5TK3rrPrSfKRJJqk2fe
 Rjcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ//eHYillTtNVpeKW9dr8pbqPdIh2YAAe0gal9U/Iky/gDZGAZm+mRCqeBvWFU7Gi1ifloXt4CBE/@lists.freedesktop.org,
 AJvYcCXeq50f1IzxSDex7McnV9jivM4DbpPAMPlZreGhKSG4X4I7LekpzBuipv5wiwAIUBixMPEhCf3+4Kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhIdAHHplgmEyWBzZtSUWdgpSZViUyVRLJmTj5QZuBBb/RBcRc
 B/Jd8ezYTCh8zZJJEQfqycLEXfgrlYr3sv/x83xYGfNbpTqf6oKYzZQE2zR9vdDkdNPSUqqXpxF
 +ten7xe4ge7+J8exaSF5m1i1vtXc=
X-Gm-Gg: ASbGnctRlf46YZj7GSt0b1wZge3ureUMOuB3egT7AraMa7pDbzNtxYuNg5PUfIhACrd
 rs+WIDxKXtU6IMXalG2VC3A730yZHVps=
X-Google-Smtp-Source: AGHT+IFKLT/0vBLq8e4+Q9cBsFCmjYKYarCQPpvMXUHvXes9qzmJwCAEBQoHpEZanqb6oPfHlcskXKrazzFRS2f9zhw=
X-Received: by 2002:a17:907:9516:b0:aa6:1ee0:c111 with SMTP id
 a640c23a62f3a-aa63a33cbf7mr437084566b.42.1733575517044; Sat, 07 Dec 2024
 04:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
In-Reply-To: <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 21:45:05 +0900
Message-ID: <CAMZ6RqJGqBqvgxzp5yPFY1pk0WkkwEMM34qU-dZ3kXfsnKaqEg@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: David Laight <David.Laight@aculab.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 07 Dec 2024 23:46:21 +0000
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

On Sat. 7 Dec. 2024 at 17:39, Martin Uecker <muecker@gwdg.de> wrote:
> Am Freitag, dem 06.12.2024 um 16:26 +0900 schrieb Vincent Mailhol:
> > > On Fri. 6 Dec. 2024 at 15:40, Martin Uecker <muecker@gwdg.de> wrote:
> > > > > Am Freitag, dem 06.12.2024 um 02:25 +0000 schrieb David Laight:
> > > > > > > From: Vincent Mailhol
> > > > > > > > > Sent: 05 December 2024 15:31

(...)

> > > > > > > > > @Martin, do you agree that I remove the accreditation?
> > >
> > > So, do you agree to have the accreditation removed in compiler.h?
> > > Personally, I do not mind. I am also OK to remove you from the
> > > documentation and add you to the CREDITS file if you'd like to.
>
> Sorry, I somehow didn't read this part. Please do whatever you think is
> most appropriate (but please update my email to the new above if it
> still appears anywhere).

OK. Then I will remove the accreditation from the  compiler.h
documentation and instead add an entry in the CREDITS file in a
separate patch. I think this is the most appropriate way.

> I find it amazing how much time the Linux kernel community spends
> revising code to make it work perfectly.
>
> Still, I am wondering whether some of this time and effort should not
> be targeted at C compilers and language work to make these macro
> hacks unnecessary?

It seems to me that the long term solution to this problem are the
constexpr functions.

But the core issue is that before getting this support in Linux, we
have to wait for this to be added to the C2Y draft, then implemented
in the compilers (probably just reusing the C++ constexpr functions)
and finally wait maybe one more decade for the C2Y support to reach
the kernel. For reference the kernel supports C11 only from 2022=E2=80=A6 S=
o
maybe we will see those in the kernel around 2037? Meanwhile, we have
to deal with those hacks.


Yours sincerely,
Vincent Mailhol
