Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFloImq9jWnL6QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:45:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D615B12D1E1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98BB10E726;
	Thu, 12 Feb 2026 11:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fVA1mc4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAE010E726
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 11:45:41 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-12734af2cdcso4687c88.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 03:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770896741; cv=none;
 d=google.com; s=arc-20240605;
 b=B4keMAGAbQSlSrEwLSMy2jj0Ao7GS6c11w4irnWosl6epR+Sf3xvF+wLyu+yGTeEf2
 fN5jl9JWJXRioA0DOfBAoQzP/cOUIyc5D+k8yJbN9sic0wU6mNdf/x8UDa20J7yOej8B
 JXqmSog9MPR/K3VvL4QF7vlrI8QZ5C72OAqGneq6Ub03kzrxseZVjC0ostGYySGjDtHG
 lUYMt8aGd8XbZI9Q+jMidH74DKu6xNhG+2wzjGhTqomoTGTzf2mkv3V5QhLKC5GNkEiS
 LdG41OqvPAcJM7lE1Vtj4w2uVDkcRdJk10z3+FLBqnCRc6XgiDiIShwtK6uj6L3VqR76
 xLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aGVkLIr22yJ6JQpgXmUzvygoH7/3iICzBNHCpv+ndoI=;
 fh=xdsv4E0+fPH6zkEhq7nT3GMMZnPYBj9JeA1HI7Z3sGo=;
 b=HOCDgf8ubtyF7RQ/+mOuJjCBmoRMitBQpPG5csqmTWAsR2udiR7EFgzc6RmZ0o4O5b
 rjnkxnULPM7pSy0jHDUFOsyU5XBiLAQvLzrwGgtVYgZ4fCMR4aY+uHLGKuAfC6yhjyVa
 4SZMtYJCPXc5MNFwKCDtghR3RXVkNFTY37kx4LorPdwp3m28qSNo2tGk6DNG0dO1bY2L
 zc9S4n1T3+3sSwsdLpOE7VTZq0X8CyKTwRYhb49h62nIbRxIYzlsvFbo+DnCC57zkxxC
 65yW+tcRuBFjOU0YTf3v2pEYXclCZIrLCVHZn67lx2o/S7NhbT7bzfdllSD/CSxfJC0o
 Zc0Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770896741; x=1771501541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGVkLIr22yJ6JQpgXmUzvygoH7/3iICzBNHCpv+ndoI=;
 b=fVA1mc4xYkEURMjbypEuHQvmykKCdKmLDbTWmEpeYLN4VdRR0Jth87XdDTHgJrgcG5
 tFIBEUqrz06aMJ+c9dHUYkwdLcq/t2RhM1aQZW66/awTw316J1fWhs7JevO3V6/ACvm4
 2k948LHASbd6/y33z+zZ+iQ7QG2doXWUpSVft06e9tUe0iJw/QRohfxV5eS6ot/qgci2
 rIPeUpSvefr2SCa+2g4P+3+A005L0EK//Ug1S7aR/W4BCrob8UGsiea70y4J5XECp1Lp
 CrAbT9pmVgnSPrjpHI0s+GnkroiVqWRBi/Ap6iP+UqFGcMehpqUyRwAyda1Ilo6oHtdl
 jiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770896741; x=1771501541;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aGVkLIr22yJ6JQpgXmUzvygoH7/3iICzBNHCpv+ndoI=;
 b=r3VM8xB2GFgmZZYK1oxgNvkMIm21fBlFl0fw5fp7pqbh4Y2lQNlBo7dF6ANmBWQO69
 1ljh90VvUVMMHpDvbrQ66fMgbQkZkIrfaRFpXgPOfRxzJRyKA21GT9GjVKATeyEcK7Zl
 LAhnFW/rs7j6K23fWZu6FJ8NoZalNAB21G3U5OQRBhxtuhdthiLaLSz3hd9zKqaeY7DM
 c4Wp77Sgd8hdYGInbkuJYw7bSuzJC8ZivXSXcF20CjOWCCMmdYtwPFQbyXWtNrAGPwyN
 tyucDg09yejbMtVZPhHnRuE3qMkBkEVkpZOCrG75Q5cbWSR+BoyLiLi/fxVzJPYNEv9F
 T5gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaG/9Q7G7y0DiSRn/AMNoMYzxQM8GTkTxFe6SPxZTqiyXROK0+IoNvE4kpoPTvC074xKyZmqvP1DA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznm7wWaEw4w6PxGwzccjriFz0zfyA8WnGVj9bNK3bbV2xVbXP/
 bXa8C1oFTjUZV/nZiXMzHWD/poKmCR9fS/5GuYgxr27TDjVbVmUlcZV07/fMh78MGOz0hs4WYvh
 6saLtopdESCaqlF7vn8/CzskdkeIWowY=
X-Gm-Gg: AZuq6aJjxONDSLy9/kGS/I1jqbXDARxsjDrKPAYX9VMk7208roqLmPuG57hh1GFBlKO
 LeYtVd6+klOVtUcWCJPCkbbfIRM/LOCufv2Z5ZqJ8m3IpGrwBA0T8YUiz4zcPFSdCI1OXynPzuO
 wsOuq/jyTCAM+PugoxwPTtdBTkqYDTq6dDsGWqd3JUQmd41TO772OeJARqgqS3mcvRaWjtbLLG7
 YkDcq7idIBDcLkIDDfThL1Zc/oFwZOKGkMW5ei5TqVCCEBl9C+m8ex39lQrHwNeQr1OIeEYVWrI
 F0Ba6W3ns52URKcu53/HsoPGTUonVXF1U/OPgA1Zczr2PDZoawZyYJsgERYUGsgOWUj6dUdMed0
 uEuShq6DYJhATbF5pf82i7dg8
X-Received: by 2002:a05:7300:aca6:b0:2ae:5245:d50e with SMTP id
 5a478bee46e88-2baa806e40bmr507989eec.8.1770896740603; Thu, 12 Feb 2026
 03:45:40 -0800 (PST)
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
 <DGCAAE4YEDLO.299F5M641E90B@kernel.org>
 <20260212-obedient-faithful-koel-d8aaf6@houat>
In-Reply-To: <20260212-obedient-faithful-koel-d8aaf6@houat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 12:45:28 +0100
X-Gm-Features: AZwV_Qgkz-xkhnIAg7JBqdav3KKnsGWyI0KDQ-RkibJi23X0-5wEzPLcw-SuW5I
Message-ID: <CANiq72m67XpoE-M2eiJn7RF3LvxRLKZ17YExJJFOFw+H0Bw39A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, 
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:dakr@kernel.org,m:boris.brezillon@collabora.com,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,google.com,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: D615B12D1E1
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 8:59=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> And the "oh but driver is using the API" is kind of ironic in the
> context of the Rust bindings which have globally been in that situation
> for years. You can't argue it both ways.

I don't think this is true, if I understand you correctly.

To give some context, when Rust was close to land in mainline, we were
explicitly asked to cut down what we had out-of-tree to a minimum of
APIs, which was fair. So I did exactly that, to a point where you
could essentially only declare a module for x86_64 and use `pr_info!`
in it (pretty much). I even considered dropping the `pr_info!` too...
:)

Then we started upstreaming bits piece by piece, getting agreement and
input from the relevant maintainers for each bit, and so on, which
took years for several reasons, one of which was precisely waiting for
actual users for APIs.

[ Others were getting maintainers engaged and involved for some of the
core APIs/subsystems, getting authors of the original code to submit
it upstream via patches was yet another, reworking and cleaning the
code with the new, better approaches we found meanwhile (like
pin-init), and so on and so forth. ]

Cheers,
Miguel
