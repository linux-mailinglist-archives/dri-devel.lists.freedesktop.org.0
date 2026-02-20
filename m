Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGEcFyOfmGnJKAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:51:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA78E169E03
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A50010E827;
	Fri, 20 Feb 2026 17:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ogMLxT4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185D510E827
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 17:51:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59C806183A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 17:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AA5C19421
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 17:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771609885;
 bh=LCZsbY0WlkLDQaB+g3+Nolk280ujbFsPA+yQ4pCMsbQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ogMLxT4fZDIGFz9T/q1fVk1xsqCLg7tuOxY0rcVuLkCjEG7zOjZaWVrBOSWJ1QcY+
 ctyFHL1ed8ZGNkOShwM6jUeq/i5Mr2NSGw/d3iHKbRvDjYN8olL3xDUnjQA/2nIDDa
 WLlq2vxK1I50F4iJaPRoXU2UzPQmLQJgKY63W/nHdsJ7gKsjs4ZDhTgsiuydRl+mae
 pXtK0Ng25A6oXSizGr2uz90pVVIQey7vfDZ9AnI9kXcIblN/xyljgOxgBvdOfpYJwL
 Uv9Q37Hh9G4yDpza8wDS9GWvbl1Ulz9veM8yBxM6CE8V43IQaV6WIwyVyl+uJgpVSA
 tcIk/S0il7niA==
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3870d178a9aso19722641fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 09:51:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWE7aaQ8tuYLXR8x1yA4N/QVN+y4+WEmGovfRjDrMxRwBpalNG/WgeLAy9yZ3oLLhTlpX0NTPPESCo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8Xb29KNRxZpAayeQ2AvFKNrMQbBxfZBviYoo15cjwvlHzG6on
 IU4nFFsdXuhmMlK5ClQ4qg1eL18LZdoXa+XSWlXSFdDO6o6adWM4lr9Avc93cCyGQIHbxhdTLPx
 N+0W30ezi3UhIDQMpjHS3LJw2/vpUVf0=
X-Received: by 2002:a2e:be1a:0:b0:383:24fe:4eaf with SMTP id
 38308e7fff4ca-389a5de4d48mr1328121fa.30.1771609883065; Fri, 20 Feb 2026
 09:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20260220-unique-ref-v15-0-893ed86b06cc@kernel.org>
 <20260220-unique-ref-v15-9-893ed86b06cc@kernel.org>
 <CANiq72myc+tCEHm0WtZspZHWwsSzvesxsmUvk31=GCdUN_zVNA@mail.gmail.com>
In-Reply-To: <CANiq72myc+tCEHm0WtZspZHWwsSzvesxsmUvk31=GCdUN_zVNA@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 20 Feb 2026 12:50:46 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9n2N5fCVdEF-jLsjLhAiyY7HLHA1dbanmxqEj1vuqfuKw@mail.gmail.com>
X-Gm-Features: AaiRm50BHJk8sWqZZGVukWMOtaBDUYkSm_Z-CQij1pvKGbmHOip5UB_YSDsNkM0
Message-ID: <CAJ-ks9n2N5fCVdEF-jLsjLhAiyY7HLHA1dbanmxqEj1vuqfuKw@mail.gmail.com>
Subject: Re: [PATCH v15 9/9] rust: page: add `from_raw()`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>,
 Serge Hallyn <sergeh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:a.hindborg@kernel.org,m:lossin@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:miguelojedasandonis@gmail.com,m:
 igorkorotinlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tamird@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,gmail.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com,vger.kernel.org,lists.freedesktop.org,kvack.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rust-lang.org:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BA78E169E03
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 12:34=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Feb 20, 2026 at 10:52=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >
> > +    /// Create a `&Page` from a raw `struct page` pointer
>
> Please end sentences with a period.
>
> > +        // SAFETY: By function safety requirements, ptr is not null an=
d is
>
> Please use Markdown in comments: `ptr`.
>
> > +    /// `ptr` must be valid for use as a reference for the duration of=
 `'a`.
>
> Since we will likely try to starting introducing at least a subset of
> the Safety Standard soon, we should try to use standard terms.
>
> So I think this "valid for use as a reference" is not an established
> one, no? Isn't "convertible to a shared reference" the official term?
>
>   https://doc.rust-lang.org/std/ptr/index.html#pointer-to-reference-conve=
rsion
>
> In fact, I see `as_ref_unchecked()` and `as_mut_unchecked()` just got
> stabilized for 1.95.0, so we should probably starting using those were
> applicable as we bump the minimum, but we should probably use already
> a similar wording as the standard library for the safety section and
> the comment:
>
>   "`ptr` must be [convertible to a reference](...)."
>
> where the term is a link to that section. Cc'ing Benno.
>
> I have created a (future) issue for that:
>
>   https://github.com/Rust-for-Linux/linux/issues/1225
>
> Cc'ing Tamir since this is close to the cast work, so it may interest
> him as well.

Thanks Miguel -- FWIW there's no current cast work on my plate, I
believe everything was merged except for provenance which was a bit
too hard to work with given MSRV.
