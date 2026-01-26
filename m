Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC19NScZd2kCcQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 08:35:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA1684DDC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 08:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7E410E120;
	Mon, 26 Jan 2026 07:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="w2S7Pz1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2309010E120
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 07:34:58 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4801bbbdb4aso34691415e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 23:34:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769412896; cv=none;
 d=google.com; s=arc-20240605;
 b=iqpyIh2UFVnvoRILv+kFyjLkNho/JEIycy9+0slAwopIJxiUgbt8kcPxqO6R9NHCch
 y44dGAr2YtaIQuOg/XRw8m6d8rWN1MeDhFSq9zxlveAvBvMJz1Ig0GQTYbKajf/dOxBh
 ctDY9vgDTGzyhKW6jftbAkoHG7Xb/D0U5sH/bY4J1Y69ZKmKkD6gwCDBAROlxsAw8aQm
 OYT7UTL628sNUVsry0GcQB1PsDiTN4k9l5SffBDI+oN+3jKIoPGampA56Eo/KeRXD04X
 vEed8xhwtg5AxFiLm+AWtQ3mKwiayQ0dclVCZOiqWhIllLE6ZVcwrViNXEG9fXBbAOlW
 8gvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TW8SDHm4wY+72pZI5lkyEknmq1cQQbn7gnfEPgF9Cow=;
 fh=EUU1pwWqhNGD+cjmtuP5xo8irIaivKtKR+qsnC0cwOQ=;
 b=g8e7Rzw42r7etvB4FHjKFdrR8arW0FYjhKfdEP4/mrcX/nt+RKWm0o9FwsNPXpwd38
 ENxvJ7xgtWRnhGOjQlBA2Rcx0BlgYQNpWwokqZ1vHXikbhs9fS0s+yxRlyLR0oPRe/i+
 RIuvz0jet+Ym9uPlWbUXqQ5z+DftICil2cbPIJHoMrd+giP5avjP2JFc0b5PGO3CTmpS
 mUaBgvCSSeHFauB9NNNbdTYoqcNZbJmzxDCF4ctfvhi8BX1U+etkuPrzreWQ6fqUrzI+
 vpRChsvQT5flWHe32yUHVnP1PfjGYbElUWmOg8zCvr07tMAUKS7xb5wjOCXCZSoD3jKI
 CVag==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769412896; x=1770017696;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TW8SDHm4wY+72pZI5lkyEknmq1cQQbn7gnfEPgF9Cow=;
 b=w2S7Pz1MjG1wgmTrItfHxX/tUxHRZartMEa4gR5jGU2S1KlAY+p2Hd5chHXNcJ9h4k
 Wi71qwFxzqF7j6bLK1/zKPlFkUYvPMOJiI3uPN8feg+TBsa6Zl7mg9ZUPLvzwT3HV5l5
 lq9+JgKj7XSWKqd/RKxfOSVpQpxKa+/0Pz+rMlX2yCNd/zBvhP1l+BD9gMl99OAbzBNs
 ekJ7aUW/VxQJov9i1ANhFFHgQJXfsM9WkqgpPg6yw4vwsNamzGfZ72hY2T3e/9HCUB3r
 xA+tKiyw6W91l5pahGJDgvkd/QakQ2fuLlGDhjUSxpQFoJZYaBtqth1VDNF7arms7oIr
 LLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769412896; x=1770017696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TW8SDHm4wY+72pZI5lkyEknmq1cQQbn7gnfEPgF9Cow=;
 b=Wc+ZbyaJjlM5nPdk2ZEOnRfGb+nQVJ+/+xzYHk/dO7lq8DTq+XBTg+YJssna8CD6F0
 QEEfXFiBdRbEfJ2Q3wzox0QpsGIaT9G8dtmURyAZ/CnWsPuk/wF1zhFKYYE+JpFYoVMG
 Y6aaLKhrh75LVEcZIKnDf2rmp1l2pM0Qb7OW5bh1qsV9wp678K24kBCDb5RRgkjAHtLO
 02+wIm7jqVH7cq8umCb3H3slRXw1xvQ2J08/YGujXEdnaAjCUdV0Dp/gB4ODtwBjIgp3
 4Gr53G9xOllvEIPjNyJopSCMjv4CeMp1zbHggJHYWV4zsIykKi0MZUleUaOdFKO+XPYi
 TWAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP3bkxysaVhPMOSPb2amANb4+Su+cF1u989GHkUhJEaynD1Tj+Qi9+yfk21mzc6dhr9ZuWNJkL+po=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY5kCoOS1uX3SC7PTGp8cP5dpoCVSO+wI+Kx33ilASIFXttzi/
 K1uqAGE3TSyDTJtzkJsIgaboRye6TD0KMgqozjEgd5HAHbikeM5Ik6YpEnqQ6cQI5SV9zRbDC4k
 MQgn5VIddP7HZpqPh09eaVyKKl6iL4qyCBYOxym1X
X-Gm-Gg: AZuq6aL82dayPMb7nnqyu2aPNUJxPv7wDz6kfOGWwaze1YU69y/zBMHnzWti1VugQT9
 D/1LkLbXBZLGjSrxAJ1q+RJgwBwCv4mhEqHteGqKfJb7BGExu4UW/5vltUC8cgHi40q3kgo8zwn
 8OxQdfI+Ip5fuxZwgqZv/MSlJgJ7LIwk8R2Qwc+FxroohgirQ1lE+3P8GPBPtunLybcrVMg7R45
 8yqKo6lIOb72/BTNAyHLSY6yPciCLau7kjHqTkWdfOSG4Gfbs3A0OqfwT52fBd8kPec8uHdUJ4l
 SrfLEXV4QGcY1CAfX2IMbMWUeQ==
X-Received: by 2002:a05:6000:1acd:b0:430:f2ee:b21f with SMTP id
 ffacd0b85a97d-435c9b29d89mr6070418f8f.22.1769412896418; Sun, 25 Jan 2026
 23:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20260124160948.67508-1-ojeda@kernel.org>
 <CANiq72=3+==Px50E+EA0fhe3pxVAGzRRt+6d+qze3cdeEBjyoA@mail.gmail.com>
In-Reply-To: <CANiq72=3+==Px50E+EA0fhe3pxVAGzRRt+6d+qze3cdeEBjyoA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 26 Jan 2026 08:34:43 +0100
X-Gm-Features: AZwV_Qj9ldnC_uCDqYFEUEUQ3iDRZ5FCfEYSggcx9Mg02uPkev3eBUfDJsHByaM
Message-ID: <CAH5fLgiRvAvoJkpLmkSZwo82=VwQZUjZxCROc_0LZ0YkzZhj5w@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: depend on `COMMON_CLK` to fix build error
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, stable@vger.kernel.org
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:ojeda@kernel.org,m:daniel.almeida@collabora.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:stable@vger.kernel.org,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,lists.freedesktop.org,gmail.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3DA1684DDC
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 4:10=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Jan 24, 2026 at 5:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> w=
rote:
> >
> > Tyr needs `CONFIG_COMMON_CLK` to build:
> >
> >     error[E0432]: unresolved import `kernel::clk::Clk`
> >      --> drivers/gpu/drm/tyr/driver.rs:3:5
> >       |
> >     3 | use kernel::clk::Clk;
> >       |     ^^^^^^^^^^^^^^^^ no `Clk` in `clk`
> >
> >     error[E0432]: unresolved import `kernel::clk::OptionalClk`
> >      --> drivers/gpu/drm/tyr/driver.rs:4:5
> >       |
> >     4 | use kernel::clk::OptionalClk;
> >       |     ^^^^^^^^^^^^^^^^^^^^^^^^ no `OptionalClk` in `clk`
> >
> > Thus add the dependency to fix it.
> >
> > Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali =
GPUs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Applied to `rust-fixes` -- thanks!

Thanks!
