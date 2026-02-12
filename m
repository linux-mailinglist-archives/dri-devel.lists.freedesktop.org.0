Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFlLM3PdjWnE8AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 15:02:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3B412E0E2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 15:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48E710E753;
	Thu, 12 Feb 2026 14:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Xog0FekW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1E410E753
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 14:02:23 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso1468630f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 06:02:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770904942; cv=none;
 d=google.com; s=arc-20240605;
 b=Pyf+pdCIF91bY2jqyD2h02l4yev2OEJS/iRp1RP3gAOOGW4kr7q1qXN5oIXX7Llkhr
 +vQP0LeQn1STbyLy69pspkJpxBkel2tmja9EQ4zFVU28FD4OkMgWqTYD9YTkU9vD/mHT
 CG4IhEFS/DTSGUiQU3dJwVU13VELeJ2HjQnoExF/LZ7CH2tIet+PoeTSD9VK6HRGGNr0
 rCNDY+KO+47g28WngtEZwzyjb40YWqCRXR6K0srR2YweZtRiF7UCmdpvwZUJpUrt3/1i
 ltGMvux8qcZNoBTvZ51ZXmMCpMtxKFLc3k3/M5n8H80OZygNEON4h6CqfFcwCPgpdbQ+
 hEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
 fh=fcQRvMZ5dRhFPd//3nLMRWROXww5O0lDptGe/Thk21A=;
 b=f0k749PQecO4JTCNu7Vv/TsIaIFgjOppM3SjODuXwsHku3ows8UNqjl74SEjkwKrri
 Y+/g0rQQiPDuI1wAye3ZbsoWo3+mSZ29+J9OyMYgDXLCuKy4rvHgeXmoLzaK2O4milui
 nqT+ss5tZMmsWp+aCRfD0FhV2XbT9r0YIlptf9RrHtzuVskir2pXxo6AaCCwgud2L2Zu
 zq+zOCDMNXAqCbwr9XIkd4BGZmxTEoqo0A1GSN9Tfsy2glAITUD4YO1QXZUVigtpN9oT
 Q901n4GYMdRvkzqu4yc1FbZQoKlFGzLAOP4Bqb4LHwitxwFHBZAAYeQIv5kYkUKGJ5sY
 vP2w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770904942; x=1771509742;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
 b=Xog0FekWvXeKQ9dG8glE+Ot/WVzkdUbeESar1SIWnTXtha48ccKCortHK89rnHtW2N
 VbLVLj0tSRn+QLPmsIK+ifiwubBe5mqG0GShGrj8j5sv/Y0MSgNLU+t2L5PYu6gAwrYM
 8dRg6ydyzvP69ecEk3/cHjciLnm7HffmL9uTiQGtovXJAoS529Hf4EJ1/GRJiIFOp12Z
 8XUstvJcGovw/M/D6S2nMCA0NEr48XU+Odigpd63VAEDuk445x4eB3oXy1gpjNPlRQYg
 OGzUGTktcEfLJv1pqZoWmxqhyrI5bWoV242IrHEPTE28t9VBtUvJuurEyfjLVLua2i8c
 3GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770904942; x=1771509742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
 b=hspqB2fk4Foa2gnqEr7xw5kxUMnJ67XkQTuC5fNHGF/sUz5suWnbSLYNPVcZLFk0Ie
 Fgydvmu+HiHBTvl5tVV8eV2MpoFUdTvrYjQXapNS8o68R5m1Fa/TVcDcVIkEvhKefG/A
 SKOjJ7WpwHkGd8FCr63KHzFkq5T48dfTrkpTzMcoPA+U5eW3VfUyf2gj9vZ6/nLqSQ4H
 i03P5DhddNe/X0GIVefXaP7LtYPFypO58lXts68Lo8vTVpu9kxJIy3g9BsxAosbPc0/q
 uAxkorffKPu4c1p6kYt0uIIC5eIu9OnU4p8ISw4rCHO7mnvtEAa03BRXPFIN83EUqDrF
 WB9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCViuRT9u07fY1q7JiyCLbQfxR4bCTcv8xBC8QBYJqYy4SqesZ6n+ITgvw4aozD2wP2VTS9KU13z+es=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzAzaS/M8lTkGTRLFXnbzZoWRh7p5Hjl72kJZ+n7Qt2PTWQTm/
 KD216y94OPHwKfuTUsnv1iqmAvZYxKflDRx1KoyonGLujeYBdpA1WhcXnZLF1h+Ti3in+HJC/sJ
 ra1TbYwR4eM0DcyoZZBIY55MvuzhyUnlcDc68FLa3
X-Gm-Gg: AZuq6aLpfT6bNaVPgBq6yQ6C4MPnfvIbq5QnRtxPjUbVgDpg1R87YPwlhyZyTQdfvSR
 6gKK7kBthnlHU6D3YhN15Q/t+64XhyT/o02pPOdp8VEdFe8I59MoTEiuQymQ52WGfwCFNAv/9TF
 bfgtv0t0J+tHBvG4+FJm9aV3qRROs2qADasN/4FN1IHOuGdIfNQAs7X9ce2i8g0jVo0F3nNR28r
 mfEqt7R0oUlu5qErl2Jlz8eWbfPosWjDbzH/B0i+Fm5FdzVo819hpqVg+2mk0salDXR2/RnKm6c
 XCBOXkCSSrzZQ4wf6BcE3qsejEuE9EjzDMRnu1O6oWI5W+as5DoXgFEvS62xTUc/U1eS5g==
X-Received: by 2002:a05:6000:208a:b0:435:932e:f924 with SMTP id
 ffacd0b85a97d-4378e6d8d92mr4583407f8f.2.1770904941572; Thu, 12 Feb 2026
 06:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
 <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora>
 <20260211-flawless-feathered-boar-0b87ad@houat>
 <CAH5fLgiQE7mJBpAxv6xTVKKFWadg2GdVe31hRM6gNk3Vah61MA@mail.gmail.com>
 <20260212-lumpy-uptight-petrel-cac725@houat>
In-Reply-To: <20260212-lumpy-uptight-petrel-cac725@houat>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Feb 2026 15:02:09 +0100
X-Gm-Features: AZwV_Qg2-1q5B4F446nU29Cn7SlWuusys2TSQd4MD8qGMnFLRNj2Nk7LREIXN9Y
Message-ID: <CAH5fLghyg-QzT11gehvwTb2ii4FA-dkse=QtYD0Tc5MT5Dhd7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:boris.brezillon@collabora.com,m:daniel.almeida@collabora.com,m:dakr@kernel.org,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1F3B412E0E2
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 2:38=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi Alice,
>
> On Thu, Feb 12, 2026 at 09:16:51AM +0100, Alice Ryhl wrote:
> > If you make the raw API unsafe, then that's okay but any use of an
> > unsafe API from a driver will receive very hard scrutiny.
>
> And that's totally fair to me. If drivers want to have a more optimal
> but potentially unsafe use of the API, then it should be flagged,
> documented and scrutinized.
>
> > Yes, there are occasionally good reasons to use unsafe from drivers,
> > but the entire point of this Rust exercise is to isolate unsafe code
> > outside of drivers as much as possible.
>
> So, aside from the risk of fuckups, are you concerned about something
> here? Do you expect that scrutiny to be constly on the maintenance side
> of things?

Well I do think it's mostly the risk of mistakes, yes.

> I guess what I'm asking is: except for the obvious "review" cost
> associated with it, why would that be a probleme if we have, say, a few
> dozen drivers using that unsafe API?

The reason I wouldn't really suggest the unsafe API is that, if I'm
the reviewer of said driver, then my review will be "just use a safe
API instead".

For example, if you really want explicit inc/dec calls for
convenience, we can make a safe API with a counter that returns an
error if you decrement more times than you have previously
incremented. Or if you prefer something else, I can think of several
other safe APIs.

> > If Daniel's proposal is inconvenient for some drivers, it would be far
> > better to have a third API that is both safe and convenient for those
> > drivers.
>
> Yeah, I guess I was expecting that one to come after we have a few
> unsafe drivers using it and we do need to consolidate / make it safe.

For most things, we implemented and used the safe API from the very
start. I'm not going to say there are never exceptions to that because
there *are* exceptions. But I don't really see why clk should be one
of them.

Alice
