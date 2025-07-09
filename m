Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F33CAFEBA6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 16:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787D710E047;
	Wed,  9 Jul 2025 14:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HRWphehB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2070B10E047
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 14:19:59 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so64432465e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752070797; x=1752675597;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onxQyqbXg2+8eNUdjRi8yLtGmLMnVsEDz+kKPNPRjAo=;
 b=HRWphehBiYar6Q6BJCeEMivxNShKz6wCInOQtgpo4BR3GG1x3vcGYbUurERS7YwGNE
 eqFjQolLSVdNA2WA+aaZlGgz/Qgv4Fvj9RQGnJR1Tiw4TiH7Ph7KeEBj7cKjaEXOIwxR
 YIPW9emV+wx7VNo0cqjFUCc9yeGRAep59lv0eODGLheRWiV9QZ/Z0cLNZjCo6ns8YAeR
 gncg1RT109O/5Vsm+pPqeHjTVMA6laEBvui0MkzNnYiB4kJcCn9vA/JnzuXF6e+6lfHQ
 IeGzLJFFaLcNs5f22l04uwBSMAaXZaIElirwbFDGL1TovIyKkEfYdGNotZBJFo2Rjdv+
 1mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752070797; x=1752675597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onxQyqbXg2+8eNUdjRi8yLtGmLMnVsEDz+kKPNPRjAo=;
 b=vi0bAclM1wBAly71Hj1nD7oZkLJJ9aEnPZg/ZlTe2bl1TWYAo4jWqBrVsAaDHQB+gq
 pag2DVKBbrZWQIDulI+vRJ3TNVPBjx8s9RQlc8TftWTy5VnEbeXfwvbiHe1rD3mPN9RW
 dZXuFCYaBFjnK7+ZoYvsV/ijsTGVIhuiXVVdSkKFMBLl5YkXljRW6KNl1waX6vtWJypQ
 eQ3cXxgycA0h5p7bGgyYsko4kfTZfg8wyccmC1XB+jE9WRqAmjkBztqq905VVNlnJWQo
 x5a5I90TLyN5yKVSfo42oR99/ArUY+jGMqifdyWJAgXBkJS+dbI1pnvJaa0FHfNUIeVS
 /jVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL2J52/ymu4NeyICHyVW3XVynBxBEqhFjhhI6VwRZoxDc94X63Lnp6E3ZHR/ULWSGJ/u8qVvrV4ok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGOqztlt9LskN0NYd978f7KHuK1l+rq5nevk/wQA+/sQTUrbNq
 v42S+gffwApLzAxd03Jtt0/JmpXe07RbfcTHuI9Jik7vJkrVsZK1LGP6+48DhpW5HkS3WNMD+/p
 b4JJhyBjDEZ2g6YtxCHK6lG/H76BLT6U67gjr8BXn
X-Gm-Gg: ASbGncsKO4P5u72vWMzwX/vDZOgMufFMvSE3mB/7lwQgU71GiMjYRfJJ9IjoQpaMW7q
 NRWinYUFZn7CxlggcaH604VHUbCcGkqz8gmCSOCm+zz/93VI0CNkhq168+VMG26EzZAAlWgFC6t
 +7ermn26M/I3fePA0HNMTOb7pRP3XFg5ZgtEFPfyyEhFe9RYJKE9GEBXza11AH9mPW0YR1JwWEe
 g==
X-Google-Smtp-Source: AGHT+IHymgYqf5Be4dPgTGavXNkdAqtCHlNw8IloAmJ/sAoTV++LmztnNSzx86sJhSRZfMqHeXmmwb/R6uZnNJhr5Ts=
X-Received: by 2002:a05:6000:4712:b0:3b4:9721:2b13 with SMTP id
 ffacd0b85a97d-3b5e450988cmr2292725f8f.14.1752070796982; Wed, 09 Jul 2025
 07:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-device-as-ref-v1-1-ebf7059ffa9c@google.com>
 <DB7KZXKOP5F0.1RMMCBJNR43KO@kernel.org>
In-Reply-To: <DB7KZXKOP5F0.1RMMCBJNR43KO@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Jul 2025 16:19:45 +0200
X-Gm-Features: Ac12FXzkjhW6iD-XDuQYdQEQJTvTDaPwURvqNJ0qQ1PU5t7-VlkiVmA2ozb6b7I
Message-ID: <CAH5fLghf1zwmR_hLVAxYU0khmeTGEejTL8qE_BaF3d-Ncg3HAg@mail.gmail.com>
Subject: Re: [PATCH] drm: rust: rename Device::as_ref() to Device::from_raw()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-pci@vger.kernel.org
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

On Wed, Jul 9, 2025 at 4:07=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Wed Jul 9, 2025 at 3:53 PM CEST, Alice Ryhl wrote:
> > The prefix as_* should not be used for a constructor. Constructors
> > usually use the prefix from_* instead.
> >
> > Some prior art in the stdlib: Box::from_raw, CString::from_raw,
> > Rc::from_raw, Arc::from_raw, Waker::from_raw, File::from_raw_fd.
> >
> > There is also prior art in the kernel crate: cpufreq::Policy::from_raw,
> > fs::File::from_raw_file, Kuid::from_raw, ARef::from_raw,
> > SeqFile::from_raw, VmaNew::from_raw, Io::from_raw.
> >
> > Link: https://lore.kernel.org/r/aCZYcs6Aj-cz81qs@pollux
>
> I think the link you actually wanted to refer to is probably [1]. :)
>
> [1] https://lore.kernel.org/all/aCd8D5IA0RXZvtcv@pollux/

I can update.

> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Can you please split this patch up in one for the DRM renames, i.e. drm::=
Device,
> gem::Object and drm::File, and one for device::Device?

Sure I will split into two patches.

Alice
