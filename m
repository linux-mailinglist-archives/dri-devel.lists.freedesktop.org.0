Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C966A69474
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 17:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A65110E545;
	Wed, 19 Mar 2025 16:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ejiVhLfl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E9810E544;
 Wed, 19 Mar 2025 16:13:56 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30bee1cb370so74539531fa.1; 
 Wed, 19 Mar 2025 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742400831; x=1743005631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XDbOPF/IzoK1I8Rnzb26Qf0qARjrPhkUyNrbgVryhgg=;
 b=ejiVhLflYMPMenp1XYNN4lycPlzki6qRHO73728i8x73lbWTckLlLkl8ehw7afL4AZ
 KViXJyHAdYCbSt67oqfTGGlGeVhppHdyt1tjv28J8n6v3XMDIyVPl9brETY0KgxRFbKr
 1ugjEBWjSJkPVtVbc8eEzOJuibspYRoxFYtbJNuzvqp32p8ySuK54F9tp4Fo7dlo7Kpq
 NxCb8Iww5zEiFafQnX9p0VRUSsD+dkVR/BzUVCL+wUaPT8Ipg0dX+5QlKIFFYRmSSRkQ
 PVfgv5pJP2/VZQwVFqilJyRl9jvUIhLbFO5maKA+JaT0wkMQCnaL6+NuE4A/X+bs6/N1
 X3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742400831; x=1743005631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDbOPF/IzoK1I8Rnzb26Qf0qARjrPhkUyNrbgVryhgg=;
 b=tZGWYlqSfinQErYX8ACHe4uKWyJRkDNLRKE8bs3DarwwEPpNbYItM+g49ZeOoe7rYh
 et9M6xCFzAuaaZOVZRa46Snswxs2cdtUXhfGOS5qw84gv+rFvErN3eRILI2d7G9AAkSP
 e8+md2UpFbZbTXaIGPjvH0uklpZMgpGEwUXivW7Tl13jFz6hzD8bPJDcvwJ9pkfrzH4z
 meR2NR+4f1lMyXON3oh4OkVLEtlMksPcdO0tgwuqatB4X3qNzQuug+S14FLwhjgASrsO
 mbwHub33DLSoACyoYUstKevCYbmPFOD2JLqUL2VZ6wGvR19iF+szT96RPjUUaNUFHoMc
 qtQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW30EjtxLE/VYb3tB970bRyo+NwP4Y7h0fZjcJLj+XFjG3jrwcGHz4Gc30hHONIM9GAbGE5BDJyAA==@lists.freedesktop.org,
 AJvYcCWafvksjJ43AJdIao/yuvm0HRj5f7+Nv12PEdAKSsw5l1gBIq+vRYyUh0mmDpH4tEJWohQWaub9MLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUhRMWBxMrCcb5SrjSjJx6E3q2TSM0YcuOJLA7t1zU0kQRwHXx
 JAVggxtvQ4b5k15ItqVBNVtL6HV2+jA4BS1gE1W6SZR+MRlvHsBSfxTnMlEncJVQlqGTiOp9g7X
 LD4pUZ/T8B1HRHz44U9R+vGoWfxo=
X-Gm-Gg: ASbGncs4DUSSq3h3AA4o/r4k3I18Ih7JmtJh5dwRaQnSmmppakQ1UCeIWGBqYMIPUA8
 XIAzt8Ny1q6NcQkFZJx8z3uvrtI5rm4zG4xN9Yhsxv510MhPjm304f3YhOk5yx6tmzvUBwlqPgk
 66mA3xtl6W0+A/KSoYnArHPVWEbh1FzF+CD1OcficfvR2XDt95AcuG
X-Google-Smtp-Source: AGHT+IEJ3So2YBqMFG1H7zUP3nZCz8Ilj316FGI0GTnGNuZimGSXr6pVQD8hc47p7L1xCLjbHX9v5p4tc9HL1dohNVE=
X-Received: by 2002:a05:651c:b12:b0:30b:9813:b004 with SMTP id
 38308e7fff4ca-30d6a452d54mr17601071fa.34.1742400831169; Wed, 19 Mar 2025
 09:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250316111644.154602-1-andrewjballance@gmail.com>
 <20250316111644.154602-3-andrewjballance@gmail.com>
 <CAJ-ks9kAROOfyPtxMe6LE4-UPsvXca2sQ2VDjhRchZp3HLddGg@mail.gmail.com>
 <D8JTWL8JY7DM.3IVH6FZ4M49CB@proton.me>
 <CAJ-ks9k+A1+0CWXZmD2m0+jRqTRTNFn-=d9VXqytiOqvn4BR0w@mail.gmail.com>
 <D8KBFC9M74H5.4ZJ2SJK06SGR@proton.me>
 <CAJ-ks9=NQrz3ySacKt+XXm2vS+Fn9gjmtqAaaoz1k=iTG_1HXw@mail.gmail.com>
 <CANiq72mnT73Mb7RJhZjf4de=_Orv4pipunMhOersOj_aqrFA-g@mail.gmail.com>
In-Reply-To: <CANiq72mnT73Mb7RJhZjf4de=_Orv4pipunMhOersOj_aqrFA-g@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 19 Mar 2025 12:13:14 -0400
X-Gm-Features: AQ5f1Jqd_NgzJUOjvgmIsFxkHSPFGuA73TqCCOq_M4gNiWmI9ySs8ijiU2gDWQ4
Message-ID: <CAJ-ks9=23qEqxT5rivsbfNYC6iUP4RXsKbcDU9XDx32ERnKbYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: alloc: add Vec::resize method
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>,
 Andrew Ballance <andrewjballance@gmail.com>, dakr@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, 
 tmgross@umich.edu, acourbot@nvidia.com, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Wed, Mar 19, 2025 at 12:06=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Mar 19, 2025 at 4:59=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > If we're talking about the same thing then I think we're both wrong
> > and the correct phrasing would have been: "you can avoid underflow
> > checking when CONFIG_RUST_OVERFLOW_CHECKS=3Dy by using `checked_sub`". =
I
> > was referring to the underflow check implicit in `new_len -
> > self.len()`.
>
> `checked_sub` always checks (if not optimized away). The config option
> is about the implicit one.
>
> Do you mean avoiding panics?

No, I meant avoiding the check. The existing code already explicitly
checks `new_len > self.len()` before evaluating `new_len -
self.len()`. This means the check occurs twice. `checked_sub` reduces
the number of checks by 1. Perhaps my wording could have been clearer
("avoid *an* underflow check").

Tamir
