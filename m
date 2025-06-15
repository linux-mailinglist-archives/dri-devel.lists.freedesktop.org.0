Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E6ADA1E1
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 15:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B15410E232;
	Sun, 15 Jun 2025 13:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ghEIqce1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC0510E232;
 Sun, 15 Jun 2025 13:25:55 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-313862d48e7so705986a91.1; 
 Sun, 15 Jun 2025 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749993955; x=1750598755; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FSZZSMDBPFtEVqKeoNqHLJlRKfMjtGjyva/WaUGres8=;
 b=ghEIqce1pzk68/WhIZ+n7RhVbqUfsZ0v1MOBzWKwoRpnJ3eDapAsAsWdbCcofJ34W5
 tS4HHh2pPVOqIIdyooagKM1Pele6RoSF/Fo2AcCtOuLCJ23XNfqOMT6XU60NRtb5BMGW
 bmDp/69ngnDONZCF62TDdwUR9AMgNAwd1rRCBWo+U+wT5owEgq1SyWYxLBsSrql/ZGU7
 cXwZPoqNiOElJI++eM5SBodYangXXvwP81sewaAoDqLPQknsruA2KRw3hKzP5HX7oT40
 ZFrjsu5Ixy165VYgHLdfI1nI4bUIKf/D4tK1P8f72Kv4itYzgJML927X1rIxGeQBTKr1
 dZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749993955; x=1750598755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FSZZSMDBPFtEVqKeoNqHLJlRKfMjtGjyva/WaUGres8=;
 b=FeZ6ec3rTHVZMUWxUrA2NmYQIfZVS0vINAsc9Y0KndKv9BXJEUoWQQEvf85IjInjBD
 zqI4E7GA+Qvb3gCG/hue3AqGYoGQQM4bkHG6aeexDZvlmCiYth3upX54NlOCQvQbaDlI
 xBoKEUZPTfErd5T+geESTATkRA9EVHVS9DL2R5SlihWwiBH+9pTs9KcVayczQyET5sIF
 jYNAqN4SUlL5y++IgatCE5uL80HiDSldHyAOltW6aCZpbWcnq64fDtnN3gLhYkBTDRtZ
 mrJR7WTiLp6Bk4Q5ET87e6wvUGAQl0fUS6UbgHiml1DG07DFIp5uV1vfoOYRLD6iYzxi
 UDJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0eX2n0jHOLs3oFV6xTvIOChplIGaLuQR6y4FhkPe8S4SnIJnoCetgyJqz3/iTlddXPEFfDJOYvA==@lists.freedesktop.org,
 AJvYcCXkemxnESWxdA+DbtivpY86SwuumaXkNN+EtfMhoVuOf1XtVy2gIzZ2mxddm9aB/RZc4xpsF7HUCs0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzLp3Vyhzmdo2Bref+SooCEOGB6OCMs1WShKsNCGzUvaK5bGo1
 JfWt0xi4l4eZvTQjuB8bL7YBq92nEG2IZpbv287rQACzs+mFgk6sdDq5ImldZjs3dfBV1HxkF0I
 fRh8zT2Rr5DJHSG1EBx/B9ID30EDhZ0M=
X-Gm-Gg: ASbGncvf+ReBCXAjLR7r7sfAFSWQ9KHG4+RIWGdJRVZuv2+rcpzXA6lAkmX0kz0V73S
 CYtCGXhxPxxoSO8Ej1nJp8LXxxo7c4Q+OztMkICLj30vxoEflfu6x33yQaOz0Ub0Zs4o8M+MsDG
 pKob4gckQg23lPzMfbxtgunZS/bf9XqkXL0aAnD+NrgJI=
X-Google-Smtp-Source: AGHT+IHL489+Ip7x87tr3uBuoh4+FL6dhvUV+iEgTRFzqe+7NJzeg4yWPgNk3PpSOcE1u2TzipBmgzEfpVIaZmoYc0Q=
X-Received: by 2002:a17:90b:4c45:b0:313:2bfc:94c with SMTP id
 98e67ed59e1d1-313f1e70849mr3454988a91.8.1749993954821; Sun, 15 Jun 2025
 06:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
 <CANiq72=3nDR=J2OXu9nWwZW_kcWfZ4KhZ3aS12_dcB=1EP2icQ@mail.gmail.com>
 <DAN1SGG5DPVE.UUW0B523LQHO@nvidia.com> <DAN1XS7Z0AFO.3S7PRNH5FWWV4@nvidia.com>
In-Reply-To: <DAN1XS7Z0AFO.3S7PRNH5FWWV4@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jun 2025 15:25:42 +0200
X-Gm-Features: AX0GCFtthC9dPN0SJASTPTNnA5ujZZS706Vksi3r_Hn7M7E3IClaBsBN60VbcoY
Message-ID: <CANiq72mpFX2pSuy7JU+Xb_6fCkEA96er6Rsg0bVv+wBBO5OqUw@mail.gmail.com>
Subject: Re: [PATCH v5 05/23] rust: num: add the `fls` operation
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Sun, Jun 15, 2025 at 12:58=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Also, although this will work nicely for `impl_fls!` which is a single
> function, I'm afraid this won't scale well for `power_of_two_impl!`,
> which defines 6 functions per type... Any suggestions for this case?

We can always generate the same "cases", i.e. sharing as much as
possible the lines, and just passing the values (numbers) that
actually differ, which you then plug into the example line
concatenating.

The standard library does that for their integer macros, e.g.

    https://doc.rust-lang.org/src/core/num/int_macros.rs.html#3639-3644

If that happened to be too onerous for some reason, then we could
ignore it for the time being (i.e. we don't need to delay things just
for that), or we could put them as `#[test]`s to at least have them as
tests.

Cheers,
Miguel
