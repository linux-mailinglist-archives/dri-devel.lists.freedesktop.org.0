Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEIiH+eVg2nYpgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 19:54:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF0EBC94
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 19:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D9310E0A4;
	Wed,  4 Feb 2026 18:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JyO2vrkO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF83610E0A4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 18:54:27 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-2b8095668ebso5120eec.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 10:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770231267; cv=none;
 d=google.com; s=arc-20240605;
 b=ZzBBXD0y27h8c0DF7AjIC5ZV4h6GhJe9iN1Npl68z9N39o+E78Xb9wGsPCcIbErM8q
 vv9n4wlrOU9X5w/wZ1IwNXUFpNyNEMwr5pSjnfmgnXO4j2u+wcBx3gCXCOpqAAc0ASmZ
 +3Q6VlTKv3rsr3uiNnGJb7R8q7HPTkBSl9MOBvJoQW+NvVLPy+7Mt9KUTuvYBKG8k+SD
 R+G25lrK5ElSlGKGfh95YJKgv+tbaW2/bRfALEglQ66I8G3Hm2MKVJAuRhPeoUNNmIwX
 lXIhXK1V09ru0Ls9xmCgMRZ5pS8VTl9vYc6rdJlf5xVqX8YVW/weK0grh/VIllu6rkGF
 R0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
 fh=Nf0j3BAVdRi/y+YKkvHXHA+7DHf6lrIqXtUGM6C6ODg=;
 b=Ud4Bw19VZ1B/6XdDYSCTADbnmtnVMb5YqWpGjpJrlKg6WzX4Uk+pFwFZ9QuwWsQMOA
 u7wrl8IbFXPF4iH5/KDangxffdnxNx3jJJb+yy2NwwjdvaxPDh2o0ZKmdzEfrRFoeibX
 K15ULUMVmuXd3PiCRUpnX9NbZum6JcBUTjzTSoP0lci50O4CNGWDNmW4kG8R3xm4U7yU
 3MRjm/x86hIzydZEnuDFJftDo9hzf4/O4btEnSRIZ9N1fmy0piHgU2RHghe8vyXDeYQB
 gMzOag/4Byf32KQQLfIXfeQPrig+jqN2S8QAcGPugYKXv+dgPX6wohXZbDbTXWmzoaKY
 nHGQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770231267; x=1770836067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
 b=JyO2vrkOnTp85T0eQYO8QJclGWx3q+QTmFxasBtv+QVf9rvtxj6eBA76cg2EyDplwq
 g+to7Hkb35VyibAmyqZp2x9pnLg3WCVZwPCAr1G2136bZo+xPFN5j+auymStykg+V67R
 sGv4o0WoACfYLt54Rxzi1LoJ/FaCHvPC1Kcoz21xu/OBian6AvC8ODrWSwHjkwymZnlB
 6OGXC78KNBWQ32JK0qJ1JuWb2d961QvtZtlLI93hfNhRmS8zjdI30Wg+w2ubFaK6KnrT
 wMuRP7azbLJrR41iyjted0t5aEyJ1bkcr7K7o9Qp+04A8ryAk32pce2ZP8/mR8k5UXSy
 8PBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770231267; x=1770836067;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
 b=tV/xaIvR+3jMOh3op8cyL2hYtXW4svYxZzKxUDsZAjMKQIfgqh/nbpR1oHidc+8NaJ
 727pzt9c8SKZaXiXXrkrBQbVIJW4E//UVBKJxE5GYl7oGYu0VN6y9fcFxWamxdw3WMGV
 jn9d+/AAJ4jFWrq4eRNYg50tAbh05v3N9m0zBGBI3Z7dK3ynHSxqx4kJHsUMwIRQPOkH
 qYwWzRcHQqYsqnKDuBgmkTcEH6GmxhZa2v46Hm1T8czjrKhbONfWPfiWFosyn/wkzLKr
 Z7JjbSZvExAIX4OSNNKp3Pw/X9G/Guz3yLHYdUQnBE/QtRLtUJN527l+YEf1l8n49A+s
 nOhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURMwp7U5wW6b1gs040us8Eko+ZAlNKhDU5gkZssXuzjAX33wvfJ3RVTfdkIqGf3OF0APsqpZEL0c0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQPJgYnRqLvZkVTV6O/lp1rJuZeo97DG/ITkIJv9/Z2J72fl+Q
 TV8QUPT7HHtc6kiUweyoNjIXRMapVFyiUJgJHYiwU4rVCrZlUHqsac2vN9CWno8Zr15PLWP4bfD
 WXiFU5XZsLmZr/QOhvVSVWzdm4JKf56c=
X-Gm-Gg: AZuq6aLXxVcf+N+WHKpj367S47511nV57NtOkCM4FLOLaT6h9w2cAkEQaaym6Tzn88g
 U5l61282RdyVV11OEWidn9aJwxmmYR7X8yq0HaveRASBXk8Wl+15RpdOEn+WItRVmGxERkKS82t
 yasg6Y0gHAy8AInxYruk6iaWsbhdY71x+/wa77nbQMvkSt14BjP87fqK1TWrWhKgkhb8RgBibFX
 0OLb2/PU96jQoWTuH5rUy09bCq+XYmY3PrgrSgrc1MiO6JwByn5kCZbdxTJPS6bBmE/jLXda+I+
 8esUrrbPo/WPz3MRKFRy2W/62cVgZdPnzOXjBFfAjqEWy0CeDXPAoJ/8GPNpHbRyTuGZPKPUyTT
 HqHqQZTnaa+qK
X-Received: by 2002:a05:7301:fa07:b0:2b7:f145:a66 with SMTP id
 5a478bee46e88-2b832895203mr863567eec.2.1770231266769; Wed, 04 Feb 2026
 10:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
 <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
 <8859d68f-ca38-469e-8345-84059573ac97@nvidia.com>
 <DG5OGLH0BHNE.2XSVBQHAAXHGI@nvidia.com>
In-Reply-To: <DG5OGLH0BHNE.2XSVBQHAAXHGI@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Feb 2026 19:54:14 +0100
X-Gm-Features: AZwV_Qga4SHaJVbqnKL6-k_z0NAbFWIYrZ90umh2b3m2XbOK6FLc8RcS6JCVOMk
Message-ID: <CANiq72nhzix4Dr9_gbaFwZQQq=3cDY=oAYVgG5hDAmMgaYKQJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Dirk Behme <dirk.behme@gmail.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-riscv@lists.infradead.org
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:acourbot@nvidia.com,m:jhubbard@nvidia.com,m:dakr@kernel.org,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:apopple@nvidia.com,m:zhiw@nvidia.com,m:simona@ffwll.ch,m:bhelgaas@google.com,m:alex.gaynor@gmail.com,m:dirk.behme@gmail.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:boqunfeng@gmail.com,m:alexgaynor@gmail.com,m:dirkbehme@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,vger.kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,ffwll.ch,lists.freedesktop.org,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AFCF0EBC94
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 11:25=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Thus for anything non-trivial, I'd like to keep a `// CALC: ` header
> describing the intended operation. I also noticed that LLMs check that
> the code is in accordance with comments, which provides an additional
> layer of checking.

Yeah, it is the same reason why documentation as well as other tagged
comments like `// SAFETY:` comments enable to catch mistakes even if
they may be redundant in a certain sense.

I wouldn't mind having those tagged comments after a certain
complexity -- perhaps it could be possible to define a heuristic for a
threshold where such a comment is required, and get Clippy to warn
about it (we are trying to get other tagged comments implemented, so
it is a good opportunity).

I guess a fancy IDE could perhaps render the math expression on hover as we=
ll.

Cheers,
Miguel
