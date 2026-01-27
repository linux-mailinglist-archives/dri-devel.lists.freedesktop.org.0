Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMK5ExOleGnVrgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:44:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC69D93CC7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105DB10E055;
	Tue, 27 Jan 2026 11:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="esWF/u4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B9E10E084
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:44:15 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2b79658162dso2771eec.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 03:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769514255; cv=none;
 d=google.com; s=arc-20240605;
 b=N1Z2dNVONr+RnWuwze01kOTWshx66Gac+ESpjrj3SExb3PykhEiaUF2t3gliIuWWdO
 W8vqslmI1198s06Cb1WTAZrAsmhkQEJtYunaX2BZsPqlUqGOLjP6QAxxLL1Z6KFUQpkF
 QaEonGaaGOz1Kakx9QAmDvX92XhtxwOIo5qZDsYRgf2NQgkqiEyv3dEFFUB4vPLnOciH
 PLzXMjvRlOTg8KIBlCvUCMiUPIYKud6aKjy2Dw6LapkNux1BSSkq3FiELq5E5pelzyZv
 OtZ/045/daR+AKSrn1owT5zM6oDsnisVy/c7WneuDIEHQnmkdNpva/lwGA9eL+pSFroa
 +vsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dx7Qje3xfwtzTtjPoOa/QrD/VQ15mG7+9fe5W4XM3Kg=;
 fh=IFTaEbMNswg7ev0g/4u9eN/IZzal60FyCPtp4FqkQj8=;
 b=dlMPywkcHBJ4pZi4kJTBS52//d2iTQexoNKtgC+GTqnQhRhrvjmu+xtpwFkc6pgXOJ
 pwx7h/+WriOOb0T9bIXdvzhrSHYTn43FjCj/V6ifeKUvpb1EEpnMZQLlL5aYtCi6y9MT
 fyVeNjWEcvGazEcKZ3ZSJJQTSjse5SKx6779d/kFGUyts5BV+gGQHn9AnyD/pMPl2ZOc
 oH8d7+3+yAwJ4MM2s2/ZhauwGDwQD3aWnwvh79ItVSoJej3PMCX8FEwLfPOE8m2loCsY
 asEld5dd86NUcTR7r+7h3x+z0qDkv1h5kGiaSQL8mojSpbMersDXPz9SXT8Hv5bq33QL
 Tssg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769514255; x=1770119055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dx7Qje3xfwtzTtjPoOa/QrD/VQ15mG7+9fe5W4XM3Kg=;
 b=esWF/u4LBsJEy0V8tlR32rzU3jF2CpHgT/z6UHFmLcjU3yiIZM1Xktsxq4a9dZVZRI
 wQ3Px37EAh0tVuPg8nM6WYGfQ4GIewRgHpIEXadkZ/dW+LOSwWPZMZCPed1qvtEKt65M
 RpbyoEXA71RDzXBAoEUO6PxXaBLa5fecOH5EwggPG43pa9cvKSUBku+PQeFeIMGVp9lF
 3Ca0/XmENhDKO52v+b8/D1JcvXOU+RuBeIoiaUE+H9GUmJuNWXOIl6NVqkRXsiB/RdKC
 H9K1y+fUxDExB0zU5LJN37a9kRC1qGbGsuH0tJwLwOoXfuawu5vkz8ssSfhEoCIaynrQ
 XUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769514255; x=1770119055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dx7Qje3xfwtzTtjPoOa/QrD/VQ15mG7+9fe5W4XM3Kg=;
 b=t63nghUSigoxw6kaYawT2q2JOLA9m+7TpZEdUTmIoviqZgfbXjq7ORmRPlGrbqYg3o
 t32KpHMeumob68+NUBHL9eAFetp2OkscbnV7JcAfZBg/I8wMXbqNSkhFurFbGezKvXIC
 Maf5alSaRoMZlibpgVjJuwgh8XnDRWTBYNLkO76V7YTSBigzZz9odLUJ3gNG+W3ZBYXb
 MvzKSxrBcA19bBeGDFkSen37PLofzTTMWTIe9ZIR6htytHTcdu5rDHEzzVLZVmU/F55I
 rtHsl3/tLTQlIJYSQlilgbyLp+7J0R9G5vDO5SHsYHCGAzEW8u34cFclxLu7NcOMufKO
 dTRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDCe82+Ra/aq/lWl0C3mSiacnb/4F2qg93SfE2XD6yotzr9oiWsqTNI4hgS+KiTWNii6rsnHUaOgo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQcmeP4qeOAib39HCg/JYuBT5z73GjsdfmT50vwZYDBBQIHYZM
 evXye3OmYht8XKmE7eiI4Ku8DsTtluH3GJGfahyH27rijLYZmK2PVQioakIk2XYw4NFZYzKOW5S
 OGZQdglxoikaFecrmn7m3oZiEMT5iucY=
X-Gm-Gg: AZuq6aIgOwehHMHcZ2bAMijZb9Y5snwPwrUfJFBu7VyGyIOVPnY2Dhq7kj8GyaAAlT6
 60qBqFQpHj5/Ryc+PqNzH3Y6UhQsOkRNuyOKom65TUy0lUCFF6rXvI8tZRQmW/g6ANhHWcSHMi2
 Kc/ytHJ15bdnAU2yWI/oCFPXIJTO8aPQofWMryiJct8ey5HB+XurNAJMGC3jwE8npB8b/XDdTxz
 f1YwSp1R604knHDG8+qVzLfn2rkNLuq4RmolOyPaXdcCtbu5iU+K0X+Apxv1jeRXZ8EASmW6TC/
 MQq5XzE5TMTXNq+RNV7GJZl7BBvdPTyo9JuqF7WcTZlPCdeLWIRWU5OAou7Q6oXib0x5aJdtAuK
 r8Pn48bLXyJSj
X-Received: by 2002:a05:7301:4341:b0:2b7:24fc:f639 with SMTP id
 5a478bee46e88-2b78d9042a7mr423287eec.3.1769514255045; Tue, 27 Jan 2026
 03:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-2-gary@garyguo.net>
 <DFXZDYFOPVZ5.1EM568PBOZI1F@kernel.org> <DFZC5UCV59NK.IUELAQIKP5MP@kernel.org>
In-Reply-To: <DFZC5UCV59NK.IUELAQIKP5MP@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 12:44:02 +0100
X-Gm-Features: AZwV_QhVvhR6oqwzeoIZPB0kvVicuxqC-P3J8xI9u_lSyucUndCsrBNFKiEvCBM
Message-ID: <CANiq72mo+RpsTxZm7vEOBd+JQ7DJ65JE_q+H2oa57MeyyaHeqg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpu: nova-core: remove imports available via prelude
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Nathan Chancellor <nathan@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Daniel del Castillo <delcastillodelarosadaniel@gmail.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 Shankari Anand <shankari.ak0208@gmail.com>, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:gary@garyguo.net,m:nathan@kernel.org,m:a.hindborg@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:acourbot@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:delcastillodelarosadaniel@gmail.com,m:joelagnelf@nvidia.com,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:lyude@redhat.com,m:ttabi@nvidia.com,m:shankari.ak0208@gmail.com,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:boqunfeng@gmail.com,m:shankariak0208@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,redhat.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AC69D93CC7
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 12:30=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> I just checked and there shouldn't be any conflicts, so if you want to pi=
ck this
> one up as well, please do. :)
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Will, do thanks!

> Given that klint can do quite some convinient extra checks, should we con=
sider
> making it an optional part of the build? Similar to what we do with clipp=
y?

Yeah, that is the goal (e.g. `KLINT=3D1` or similar eventually).

But if someone wants to run it, it is already possible, IIUC Andreas
already did the other day.

To make things easier for developers/maintainers, I asked Nathan the
other day if we could have them in the LLVM+Rust kernel.org
toolchains, and he was supportive on adding it there when Gary is
ready, so it may be straightforward to set up in CIs! :)

(And later on, ideally, even on linux-next when we things are more settled)

Cheers,
Miguel
