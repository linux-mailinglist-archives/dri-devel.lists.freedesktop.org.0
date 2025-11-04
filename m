Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5C8C32AEB
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B4B10E0ED;
	Tue,  4 Nov 2025 18:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gb2ZY7ar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FA210E2A6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:35:48 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b983fbc731bso219843a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762281348; x=1762886148; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pDB/Q9lx5j80vNN8jyV2lRu5iagSZIvfFZ7cYndtLs4=;
 b=gb2ZY7argjcnJhZ08ls90ODmq8jLI1TCSDdlEgz3lg/XTyCPY9vL6o7XX339mR4Gan
 VKJaJUo3v9brVQV7J1/oTWMP4r/7J6q9Lh7D22QPT7Ro7crrZjS9YBL5itK2JVOpEZvF
 Ktzn4gEQko4vethuiZwK4OqFCt1IoUYaMGJ3LL89Gc0vIXcgDlpaliUNM4Che1AOEBaB
 DDpnnzxaPphdMKrATIBLaMFekTYqHhha4bSo359gF4yuKLGfqxb9WV5gCDEI+9L0Kg9g
 FauQ8y1ARoKHVpKkGRlrPwPJ0l3hTFu3aI6HFXrH5zwVvwApV9fcKX4ELCtn1m21DJQi
 k9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762281348; x=1762886148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pDB/Q9lx5j80vNN8jyV2lRu5iagSZIvfFZ7cYndtLs4=;
 b=AFxGZPn7lrzpIqnrEqfhUqNt/DqGc1TiS+yu5oAa5P1sXjQYJwmfWsuCuQje7w9hPV
 2roiAfuq10sNTaH68KHy9k3Rfx8B4YdU+Hgpknh1O05ljZ/23YOSQw1eSyIEusruHNtc
 qw3qzs4QumFw3DwWrnoao5oDetq+kmAGqCRHoqP84IJN2uPw7OqmVMtQtnz5fChoVmqc
 SbQOwwREWcsbe9sBe6U5WKfMmuoanGhODKe52AnlXala66Yw9urQUM+igBydxwXcVSlw
 jC9H2WSnEn7TXbnKWN3zECex7RdONCtRxmtGDTA8FRpNF1A4syTW21xBuLgQ8QFqgV5B
 D8bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6CspKRnPc3q+arQj12HLGdKNJziUfCKPaF/oQiY8NH7OP3xqFyIvK5r7B8n3puU5lnsa4i/uv08g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPdPJKSnWI0041WssMBszu91q95HQKlFzqt+tNWV9pA7noYK+l
 h2KXEv7etewsVJahYi1bXdk+ZcXgMaV53VqjoC6hCXFf68roHJfV5CjLXPbUN9QkkejlzL+Ah4B
 YRKjXtxDw4Ykpcmn9TGx1je977iDPfXw=
X-Gm-Gg: ASbGncv8Gc7eVmpwTpVZYmfBPtA6n9ytYWQqrGQf8bMm/+TCw0w5ADEZ0gvDNBL0LgB
 kXDF6XcUsz9676IKDGjqsuaBvau2KkTGNCaChmyWV/DefPfbKh6ic/GWh3Yt9pOo/0r7kK9c+Hv
 3wWWb+rXqZkVvX4XuZ/8RpaEynWvM9q9ZG/1NgKemZDqJ0VChPf2iqdf2rVufqD7ANP4tJ1T2jQ
 CYQZ812hSBN4tt0u9vKWUk722ikwLBEA5JHcIAbNNg27Edfhz42lQJoyCXObmP6r8t6eDANDdU+
 mXVLBTpRdamCY4Qtxg27Q5czCw5Y8r2bQJvs+E+z/Lgo8qggvfGvpF9vUL7DFkUhCZzK9MI2zYO
 IfJw=
X-Google-Smtp-Source: AGHT+IGILpSUE4gVnXtKxcfD5gs3NAicKe3yGxxboyBy/726/XJYsRyq6U0De47lxh6jH86MUyGGWjvhPdulmM5+3So=
X-Received: by 2002:a05:6a20:6a0d:b0:244:aefe:71ef with SMTP id
 adf61e73a8af0-34f8620acbbmr152946637.6.1762281348226; Tue, 04 Nov 2025
 10:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
 <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
 <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
In-Reply-To: <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 19:35:35 +0100
X-Gm-Features: AWmQ_bn9ka2mYlunhef8Qs1JQYv0mviCoj_SNM7trLL_sBiialuKhkFBTWi90tg
Message-ID: <CANiq72nLzuCXh0r5W0HMM36f9yTSQfP9yCxXbzH+wS7VxFM2Eg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Guillaume Gomez <guillaume1.gomez@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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

On Tue, Nov 4, 2025 at 3:35=E2=80=AFPM Guillaume Gomez
<guillaume1.gomez@gmail.com> wrote:
>
> You can use `cfg(doc)` and `cfg(doctest)` to only include parts of the
> docs when running doctests (if that's what this is about).

Thanks for the quick reply!

I think this is more about having some code essentially "prefixed" to
certain doctests without having to repeat it in every one. Or, more
generally, to provide custom "environments" for certain doctests,
including perhaps a custom prelude and things like that.

So one way would be writing a `mod` (perhaps with a `path` attribute)
or an `include` to manually do that. Or perhaps having an auxiliary
crate or similar that contains those mods/files (that probably only
gets built when the KUnit doctests are enabled).

Orthogonally, the script that generates the doctests could perhaps
help to automate some of that. For instance, we could have a way to
specify an "environment" for a given Rust file or Rust `mod` or
similar, and then every doctests would have the code prefixed to them.
But I prefer to wait until we have real users of this and the new JSON
generation.

Using `cfg(doctest)` in some code in the `kernel` crate wouldn't work,
unless I am missing something, because we wouldn't want to have a
"parallel `kernel` crate" in the same build that only the doctests
would use.

Cheers,
Miguel
