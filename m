Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJcTM/iUjWmI4wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:53:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4834E12B93B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CE410E6F8;
	Thu, 12 Feb 2026 08:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="r4a+S4ua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3970E10E6F8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 08:53:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so34267285e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770886388; cv=none;
 d=google.com; s=arc-20240605;
 b=P8SSDNuZfKStJAMLD0ZKXkEsnlyzqcY0CciBDg2lAu+d6ubuoFCwW0GIvZOHvyhaqy
 qnEtlWKfqKXAeCWAgpQ4kdbhiOevoaquETpTdBNMkpdag797NkKJGuGa4oO5oGMtfe07
 7yAfQ/DsDtIqA5BbcgTh5c6n6L07lE8eCF3FtAZZnVikV/0B/ztnu5CoPW8Dqxs4L/oi
 lIiYlg4AmyIn9l1y8qRbiM3t1ywDTzYE/Sos/hmC9FvK2yFzEcL7Zj2awtAxZQ5jaHPT
 igqzm3teFouicDsbUftMieJ9JaIzK4oEdEup4pCqTng2O3gkwtewqDT7XTfZ+1+Fi5rJ
 dohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
 fh=TciKcTieTMn25f3WhOtGlhlvBmiif/TF+qYX6ZtxlCI=;
 b=fwvKAfEFPYJ8MyMw6CeH26O+ZKLSvQXUPZMzkOPepyxyKOliizLTN749/tfVKFE7kc
 XUsj6WMPL4oo1q4ZCVofGrlIO1SGVqdJU/6ggMSmoT0xq0uTeF6qJpet6rnz2yd9yfqf
 84hltqUrch4mVMJDSUOWK5On28rjhscVcDDCYx9fX7x0nZChOYSciY6z1UR7pCHAfQL5
 Q5lm1Xn6Bp/+RQNfo6yzRxL4S8Wie704VYj5KwXF84ul/BU8j/E86Rp33xS87zuhttk0
 txDbX59L/latafJaC0xNCruOjbP2ekhTiTDN4YLLB8aR+rPsfQkviJo1Ht3kILzfYu/b
 5p8Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770886388; x=1771491188;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
 b=r4a+S4uazdM71EXVJInRKQ5z9I02ilz8njzk65mRFZtswZembrQqTEDcfyvGqy4f8H
 ON+3VPkw0IGbY/hhaMQ4YnuG1VxLVNPkzAA5JclOCG0E9413j12i95W/7Rc0B6MoMNGo
 +zPAP8hKeWNVoPsKtHbZN+6EwQ0RKgwJdb2vfxhcX4XrZwo8ttWhk74eytceL8bQeiXi
 duUhsA6BRqlnaKRMcouZHQGox4XUH/Z/UBheEphFU5PHQ+jcj7Y92ocomB2pw4pOCMvK
 gWV6nqbGz4VZDd/1RLl6ju+hwC2MJ6Ar4NjFwhRxVeiBVlkJzyKliQQe4Zv2MF7o1jf+
 a/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770886388; x=1771491188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
 b=a2lpA0fpZ44pabqUkAYDULwOk4oJ5BJdiySY+ybsCgNSxf4WqEYsymU+8AzB0siv6G
 nWMAjogqlUo6efU24F1Xyv+K2ewwXb6X6XSqavxGTNt4DaIvDA1ufP2QsE905NLoAPWf
 93OftOQdUiLAYDfdk4PvtgAyTezYmMPxAJuBj5gAuTI4/dot7j1A+TZUDc+2WsPRqqpZ
 thHEZYUeduSgOnYatVitwy4bomsP14v5hpyyruOjfjnAEjGjMERPmRgj7oQgAXfGQQs7
 3H7SRxILHu2U4TaoBPJ7hUP5nHZRTS05s73quchRlw6+ZRDVQLwLU5ye8Yj752q4jOo9
 4Y4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp5xNgPYAypytMNcDsLL6YPshjTFgYI93gyetohV6CNcYpipxMqqLyC9M8pZPs/465TRXD4DXr/j0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyINSrMQfqQkxBLvBlSnn3NaNftP0MI8l/rB0DCHc0HcwIvnjr/
 XNH94OtUQoXPICpRf5B2RiHZD6EzGBCAqtwCafBV6pudsaYf5cCYat3AJ8q+gwHcalW+i/p97Dk
 wardkz+pRn/+OxClsdJQW5fqfSq1NGViq2DFoZTxH
X-Gm-Gg: AZuq6aJWl6sDQ5OtV4BWNYpmyLKC2B0S3INVGnOTDC7L9YDFgVoFXb2xfhMwsVLzpV3
 qix2G2fFy83kXoUG0VGUzAz2XN+uAJ7ZTd1DPzDHCLsyWPuWBE92i8NKh8x0m2KNlWC8gjepgwj
 8Tv0OoTonru2boHtVHpibWLTTdX+7WA5lid2vGGRKfBWiDX4vKbe0h76CBKSuNG6ctQ2ilvFAA7
 o6RWNKRv6Yl6tLOCWZpQDrdZ3nqcza+3nvJP+mrBvajXf7fEKP9HUa7oj0qt/rsRn6nhCEISm1K
 N1jqG4CG0+5jYsnb8A0nDmpFoiwbxmKwdIL1ig==
X-Received: by 2002:a05:600c:a0c:b0:477:6374:6347 with SMTP id
 5b1f17b1804b1-4836715615bmr17466765e9.22.1770886387455; Thu, 12 Feb 2026
 00:53:07 -0800 (PST)
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
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Feb 2026 09:52:55 +0100
X-Gm-Features: AZwV_QhgJnsuH1kZOi2k-I_YfnetcmGyr_LHt3UuVnGbxnKyOqJh-xBICfTM86Q
Message-ID: <CAH5fLggWdQ04fVjmcNcNYvUTx1zTqU10usFbypPV+fe3OpwbkA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
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
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:dakr@kernel.org,m:boris.brezillon@collabora.com,m:daniel.almeida@collabora.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4834E12B93B
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 8:59=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> It works *today*.

The code we have today is both safe and unsound. That is a bug, and it
*must* be fixed.

> And the "oh but driver is using the API" is kind of ironic in the
> context of the Rust bindings which have globally been in that situation
> for years. You can't argue it both ways.

I don't really know what is meant by this. This API is for real Rust
drivers that have already started landing upstream. Sometimes we merge
APIs *before* their user lands, but not without a user. We generally
are quite consistent that Rust APIs must have a real Rust driver that
uses it. It's the usual no-dead-code rule in the kernel.

> Either way, I'm not sure what the point of that submission was if you
> will just dismiss diverging opinions, including attempts to compromise.

It is true that we are unwilling to compromise on the requirement that
APIs must be sound. It really does not matter how convenient the API
is when it's this easy to get it wrong and decrement the refcount when
you did not increment it. I'm sorry, but that's the way it is.

In your latest email, the suggestion came up to make the API unsafe.
That's more acceptable, but see my other email from half an hour ago.

Alice
