Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C84EAEC7A5
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 16:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C790E10E141;
	Sat, 28 Jun 2025 14:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IXXpN9Xu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C223810E141
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 14:29:43 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b2fb9eb54d6so515755a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 07:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751120983; x=1751725783; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8rK0LNTNZFI5uOITPOK3NWDXLKxWYEPkVY5RC1g95E=;
 b=IXXpN9XugHM8kMZrJWTHr49cNFufAGBZIFmORTKwObC2/RM8MR9o9/dyemYJqucNOa
 IYIWO+qfX7uxAZmTjkxxMcTfz2S0F04I6rKEr11DExklowBycXtSgycC83SLpNh6DQEZ
 LbODhOsf2rgVPNXa70Xz8Q065HfwNaSxU/lRxwlTLoyGN5yxdZEFW/j+uI5j0RSvDbDO
 fnKp5WUrfnjn+KsoCt0Jv1vjZWAa1a1DJHmF+2kHNYbYHJvJfW3Lt8GMk7YSfktgy8ap
 2P3D3cOAta+RWojq2QYGf8PpFxh4zlLx7lKqrFpsB50p3N/8GFmkwl36gtEXBbBEI0BA
 ELDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751120983; x=1751725783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8rK0LNTNZFI5uOITPOK3NWDXLKxWYEPkVY5RC1g95E=;
 b=pHY/BUuYT1aLxs3e2DKDUY2fIDj4ZJhmv2gi716xHC/zJeb3fHcu9oxlklZuJB8NBQ
 GPuidj88qYLVQ3lt9mu2EpdhWgsfQRGAuZsbjUfWqNG8aAf4EA15iTKUlUwrDoJsVYt7
 hHKM0JLshg7SFW8AkFYM0zdvMxj/xSA+Bkfi8KUl+irABcbt48OynUWLzUuvoblgb58A
 sd8xebgmUfAPOEj74FAHsyHjFZFN8Grmfil18SLxlKM7QbGodOUvGHj4MmquMUb8HI8b
 flR0RmI5qwScwPA5EN3fST1dPm0Ds2fawp97fR/TdE4VAWPYwPanika43O1xGekQsSVx
 mAqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWAsD9dQ2oRpb2g744ZjoVru9mW0YVQK8d9U3gaIJKm3g7wyRUkccpwThcq/1fiRPoZPBuigZZUVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzf4nABUEyvaL1RkPkvHNve29Vd/9nQaViwFqr50pAmdxXA6ASj
 H4chfQ9uUGUgT5XMi2sjKNyN4XTgPYG5Iv5M8U08is5kmBt6sx+QI+LO0AJe9TzMpBB5EcJEcGE
 ZY4NasnmpCzZGkVDDO156U9OjEC6aEwM=
X-Gm-Gg: ASbGnctOfSeLQObi7zWTyVBXvWHDY3P36edvtKBxvwc1uZ6jp5+MLL+WtlN7ng7AN+O
 pqGgJUIpaGnX4L7G3PnKaP3yYBojcxS7qsevYV6FKuxVaKVkxnpgowZjKfV0+WyfJemxmLnKfHO
 6avTZ9qD1wSd4BXCNz7LtfrVilDGESeboVgYGQaWWlewg=
X-Google-Smtp-Source: AGHT+IEBB8Xqc39C0N994YZDielieKfflkaDCiTAdwXbea0djsWBlJZ8r6j9Gki1hd80aLoznxs3pd6yTbRPtIErX04=
X-Received: by 2002:a17:90b:1dc2:b0:312:e76f:520f with SMTP id
 98e67ed59e1d1-318edfc8f90mr1619475a91.8.1751120983155; Sat, 28 Jun 2025
 07:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <CANiq72nJcEM09HbQB3_NpKGxr9x8Ah0VE+=XS=xvA26P2qg=_g@mail.gmail.com>
 <48605183-78B6-461E-9476-C96C8E55A55D@collabora.com>
In-Reply-To: <48605183-78B6-461E-9476-C96C8E55A55D@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Jun 2025 16:29:31 +0200
X-Gm-Features: Ac12FXwykK9WpEDj8sy1SYn6UJGGfGhd3PbUMsp81V7dzsqhylvpeGilPLCu43U
Message-ID: <CANiq72kWGUbpDW+WjKki4JUYX63j_GFBcyQse-rgddwyoFw7cg@mail.gmail.com>
Subject: Re: [PATCH] Introduce Tyr
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Alice Ryhl <alice.ryhl@google.com>, Beata Michalska <beata.michalska@arm.com>, 
 Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Jun 28, 2025 at 3:06=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> The branch I shared is drm-misc-next plus a few dependencies, i.e.: 10 co=
mmits
> total if I counted it correctly - all of which have been sent to the list
> already and most of which have seen a quite a few iterations. I should ha=
ve
> explicitly said this, though.

Ah, that helps, thanks. It is completely fine -- I am just pointing it
out in case it helps you make this easier to land and for others to
follow.

> Anyway, I thought that having a branch would be more tidy than listing th=
em, as
> the branch shows in what order they're applied and etc. For example, the =
patch
> for read_poll_timeout was cherry-picked from Fujita's v12 series, and tha=
t was
> subsequently dropped in v13 until the rest of the series was merged on v1=
5. I
> thought that referring to v12 of that series would be slightly confusing.

Yeah, the branch is definitely nice to have to see the end state you
want, but having the Lore links helps a lot clarifying what the
dependencies (and their version etc.) are. You can use that chance to
mention anything out of the ordinary for each dependency (e.g. like
you mentioned here).

> Yeah, it's a constant battle between having spelling check enabled (which=
 on my
> case flags the code itself, thereby producing a mountain of false positiv=
es) vs
> not. In this case, the bad spelling won :)

I would suggest using `checkpatch.pl` with `--codespell` (I don't know
if it catches this one -- I just saw it in my client -- but their
dictionary definitely did catch some for us in the past).

> Hmm, I must say I did not know that this was a thing.
>
> Why is it better than [#allow] during the development phase?

I have some notes at:

    https://docs.kernel.org/rust/coding-guidelines.html#lints

Generally speaking, we default to `expect` unless there is a reason
not to (I list some possible reasons in the link), because `expect`
forces us to clean it when unneeded.

Not sure what you mean by "development phase" -- even if Tyr is under
development, it should still try to conform to the usual guidelines.
Of course, if a particular `expect` would be a pain, then please feel
free to use `allow`. But is that case here? i.e. you will want to
remove the `allow` anyway when you add the new code, no?

Thanks!

Cheers,
Miguel
