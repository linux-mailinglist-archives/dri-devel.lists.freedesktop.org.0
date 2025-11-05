Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DB3C353D3
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 11:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1657410E0F4;
	Wed,  5 Nov 2025 10:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i5FyoGFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CF410E6FF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 10:54:15 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-656c07e3241so66654eaf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 02:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762340055; x=1762944855; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UI+zvnrKdhRN8SIehVxo9mkD9QgvEwvxC3LXtBEgkQ0=;
 b=i5FyoGFWlwiloplPVhtZ5VWpADiwqkWdedmD+en5NtwC2HmfUcz1t/K9nFRZUhlhbK
 EnCvSPkO0Ekx6C4Fub1du+ySIZgXtEXEPKwx3PNIu70IadBmzA79L+0BuUTZE3Xzsw1w
 YgQOg5W6qTI/TokfcjaxGUybXtZ118+DUTqv5684J+78I/yPgMaLEtqZfSZKGj+fD5/Q
 uE/UE2PgfolIm4BML2+iAsdthFQgqfmVCeNAqKHynopQA/YIIMaE1dSbnMdp0965Exbo
 o02K0wowVYlWX/Ae7d1ocvGvg+PMDTPYBV49lGO2wW0wsG52k3JQl7aIs81DSoWB/r+1
 KrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762340055; x=1762944855;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UI+zvnrKdhRN8SIehVxo9mkD9QgvEwvxC3LXtBEgkQ0=;
 b=wvfmeQmgRrDKD//ubnHDOxbbv8Rw70KntLpyOWDPuGI2p6GMARDYZuZBjh9lU7BZI/
 VzjLqRZbp1Wkm/oU3RHH3Vw8mVx1FgtcOpZToRe6QopdpOUR63FUM1rtnm91bxfVOw7j
 THF658/3dy8Y1loy5HNqBl46PQzU52ncMHheODGxYPDpeuG7HPXIAn1hVfakYFj3DKU9
 gBvYOFhH74C7X9ZbJILx2Eydc6AnLj95IoD3FZL5TkhrIHgrAsFsFO0sYgxaokPf9nYE
 a9Cc6S0324X91O7RQGKK5fJGLgYb/RszQlXi4aWtG7WC1WUAoXqrAAp+71TJMF94Kqck
 GTyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI2CccDCitjIbDzKzm9PLu8DxxRCqXtNPLzV3dQ4zwn4jyKhAJIKYDDuZoebgsORHDiiPgLHw3W84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbiA23oBVgLbbseaQ6TP4OupVYu58JY4dleSQ2eWOmYi33RqTq
 J/P1CShSyCU6c3dGlils4If4f6WcRjCBksAzoMHhbDClkpL42nW3ToJ6gYr7cxyGra6TGH2SxCJ
 2CExGUW5+xpl8DJDdcOFd0ZU9PAQz7pc=
X-Gm-Gg: ASbGncsavjdfxmxt8J2sXuYXZRai2lkjqcxlfWqpQUePevEulMrLCEi15e8wjPpUiEv
 i8WOo6GiyFO7TYbe/oRn+tV6CsYpLofqd0OnHlSRDEZYHsOOEZ5St2jbMia51LWfN/UWG4h1Xq6
 sWML9N62FG3HieoJfCdWpVejDEMbNQev3hOY0gw25AT1FjF7AG468Z0HSH9YRYDUec14/EFIZ1S
 CVOxLHj72zJzYFzlVfZPlsRbPUTwG9XioX0wbsuLTwCyzLzAfnO/XvDkH33RJsM0dy8cpo=
X-Google-Smtp-Source: AGHT+IGOrCYrmHNMLavSyZ02ydICrKRBss+q8PZq/0Rzc5ZPlgYctyKGHcxtmk3f5rN9LiTKlT/v4xGFjERNNmxuico=
X-Received: by 2002:a05:6808:21a3:b0:43f:5e91:d556 with SMTP id
 5614622812f47-44fed48970cmr1063735b6e.44.1762340054900; Wed, 05 Nov 2025
 02:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
 <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
 <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
 <CANiq72nLzuCXh0r5W0HMM36f9yTSQfP9yCxXbzH+wS7VxFM2Eg@mail.gmail.com>
 <CANiq72kYYu9C94aY72HK1ELSmvktF3nq+G4+smdAW_Xaxw1kqw@mail.gmail.com>
In-Reply-To: <CANiq72kYYu9C94aY72HK1ELSmvktF3nq+G4+smdAW_Xaxw1kqw@mail.gmail.com>
From: Guillaume Gomez <guillaume1.gomez@gmail.com>
Date: Wed, 5 Nov 2025 11:54:03 +0100
X-Gm-Features: AWmQ_bkMmilAyN1uUJZCacC-4Uedu5I4tT8-UDX7Z-O78YpFpr8K3EAt082H5zI
Message-ID: <CAAOQCfSRVqFZAJN_m-kGLe6fnqKYyhLUf_WOKdHHMW-C6NShkA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

You can add your own tags in the doctests, and with our patch waiting
to use the new rustdoc doctests extraction, it should be pretty easy
to plug such a feature into it. We can check it together if you want
when the patch is merged to see if we already have everything needed
or if I need to add more things on rustdoc side.

Le mar. 4 nov. 2025 =C3=A0 20:06, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> a =C3=A9crit :
>
> On Tue, Nov 4, 2025 at 7:35=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Orthogonally, the script that generates the doctests could perhaps
> > help to automate some of that. For instance, we could have a way to
> > specify an "environment" for a given Rust file or Rust `mod` or
> > similar, and then every doctests would have the code prefixed to them.
>
> I guess this could probably best generalized as "tagging" doctests
> with custom tags that `rustdoc` just forwards in the generated JSON.
>
> Something like:
>
>     /// ```tag:foo,tag:bar
>
> would give us a:
>
>     "tags": ["foo", "bar"]
>
> in the JSON. Then a custom generator like the one we have could do
> whatever it needs with it, including prepending code or other things.
>
> Now, I see there is already an `unknown` field in the attributes which
> already give us the unrecognized ones, which is great and we could
> potentially use that.
>
> However, should there be a particular way/namespace we should create
> our custom tags so that we don't conflict in the future with `rustdoc`
> ones?
>
> I have added it to the usual list:
>
>     https://github.com/Rust-for-Linux/linux/issues/350
>
> (There is also the question about supporting the old non-JSON way for
> things like this, but I am ignoring that for now)
>
> Cheers,
> Miguel
