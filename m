Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOv7D2mNc2l0xAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:02:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6840A7769C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8806B10EB15;
	Fri, 23 Jan 2026 15:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eIbXupVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB22E10EB15
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 15:01:55 +0000 (UTC)
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-1233e05c77bso215606c88.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 07:01:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769180515; cv=none;
 d=google.com; s=arc-20240605;
 b=ZAqVhpU3nlvNcmwFPLXumtNpSSj6rgU06rLcmdwrjz3gCKOyadQXRzTkNOmV4e6PJU
 XdPfFWlC9RHvQ0Y5n1sVWf490+UA2Db9Z5MLm3W1/XlOPB2pLQ6c/p26A6cm9XfJ5JsH
 IoOktM1oBF/xIhQIstBhP9+bs3lkBmvWmYk0aWP3tKNbj5Qt1Xcpsv6bcJN9j3gctSDn
 iuJiJt53bFW6015YRMHMbZdGkDTOkUHGozYWRL1BhVvLw2MA38/gsq0UAeF+WzB83ooL
 I3ZPVesug4Y5E2/s7M6OPtYiTuaH47Hm2ylLk8TEBNAb/s2IdBTu7f+EMBW1NGlYeKgF
 7L5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=VbFx30dPL0M2NcCT8PkhEdtarDYXYJVb0o7yqa2B0pk=;
 fh=+R2FgmSDy02jdfFs8YeS5NOCi+7qHcS0vqMBnwo0194=;
 b=GgBhxVnER5oNMvJ3Fag7KuulrYEXnonBGo6eiFLBIW1ROfzyYCJK0HSy+LBVpqR/vn
 YckC59/WvLG4acs62jCPUFeVOdQRw3toKMkiDkv/JYwiJSFMg4w9/dyAdz3b3HMfXM5p
 kHXSGVHOpgk71m9sXnDFjlRHQDV0xhlFbSgTyBHP8Qo7EO8olBQqtOUBhjXpDiEm23MZ
 RLn2AWWr9gKv5hCd5CHzfjuwhP+8DSSwU17lcdw+bn/faXiUE2HHJ/jKCaaBdhV7DezT
 EZxLOzLbkjtWfzb9M2Cc+R1AFDdXKJfvqKND/9cXFDZSfi7KaoFztxlDylDM9Sch+U5b
 lHhQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769180515; x=1769785315; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VbFx30dPL0M2NcCT8PkhEdtarDYXYJVb0o7yqa2B0pk=;
 b=eIbXupVz7XN6QUEHrBRS7FWxSed+cPHlcvcC/L04oBCQB7Z5PQG7ciyuIidwzKLx9q
 JAnTz70ZaHC/oI3PENAccBTLpRIoZG0esEZHH2Fj0T6RaZzL1yX4nt7K72EC2Ksi0xez
 cBASoryMNyEtcqjwEt8/iFIe0+Iwe/uPOskuT5mjg2M74ihRiBuUZVc9iYrXWx6PsZVQ
 bipWsSg7sYzM2+eUz88r0R0boapU/de+YREq5Wb7ScCb9VxDbP+5wXYgkz50y+yQmkNk
 JZz5TH5JNqEEth43ku6UNALVoVBQfyokf9/wiRulY2HF6VQ+7bL+SU5R1jU1wonoAsd6
 aB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769180515; x=1769785315;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VbFx30dPL0M2NcCT8PkhEdtarDYXYJVb0o7yqa2B0pk=;
 b=CiCs/Asilld/6/U0B2GmDrefS9HyJdRlDJr9UjX852sfeFYlmMwvVfC1Sts9CxXiP3
 Sy+EcC8Ww+irHiqKT17wfn+Agd9gO5KYfrJR+gDtU2UVsNpqYaApn+A2u834izbyXfSz
 wII3tosCNPTd26kDh4zcFPNvL+WpEfXyhl3Eyn14+0mOVJOYxxknT7sWUD3HGfZg5+TO
 JEwUtmESIfPzCJc1t8xsduJ9gfmUMpwjYzK+cyQ8oJ4YNt4J5he5GhvL124hvEzVidaj
 T3KH++7JECKFg8NopoEotGvy3LaY214qF9M8Y2gSrZtkvD3OnOIbiw658e7wXAyBIf1j
 7ubg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhpLhbw3Ohp6JPJN3+DXfmxjQctiDWxPiMBgmEQGG0eradbX9Ef8deD+U69CPA396TfI0u+IsAKiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzeyd0A3pF6Zy+Xa231RjqoUCgu03lybtApXKh7qAfPsYiiDlmL
 2W6siaL48/KdeomSVpPPJK0BU9YVJdwhQFEzGMtuDLUFjeFPjN++jgWFDsLRQEzhBkgktMlxXDy
 64mvYWWMFJbqwsBgpAiJi0GlPBDiC2IU=
X-Gm-Gg: AZuq6aKIhf0dA/bXuGlURStERebFtKMlGfd++I2wjVQIxYZahiUNDxjdsFqLPNz+jrY
 hBEO9uwIuA7NGJYsUDTWshArvp6vvA/341nMa/t53O7l0gRQwiFDyfLoxx2WUQTE02ACsIk4dHQ
 KMkXv7O/JG8+mCTGjdWAPgQ082I2IVRRJ2G/W0CVvTBoOKuAkU1HOIN2ZmVjjZkpb2quUUxFVBO
 NiXmCtbyzZsNp7nMhi5dn2vMLWjo2caUphUn6GZBerzPQq1AuuoXhzX5kdcBXw1f1XReGve1l3A
 uocklSbWQ9RB9hP3mthosasyTjZb6/IHWfsnfZ9f9hdOC26jAx4r4FdO0HG67dehP27GURFikPo
 Y75oNXD/3bBX3
X-Received: by 2002:a05:7300:324a:b0:2ae:5549:2c86 with SMTP id
 5a478bee46e88-2b739b6f4e4mr843868eec.5.1769180514805; Fri, 23 Jan 2026
 07:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
 <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
 <DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org>
In-Reply-To: <DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 16:01:42 +0100
X-Gm-Features: AZwV_QjGYp8HTKn0evohs8O9D0EdmrgFJkbU0Dzi-AzDhaVW1Ks4i5R7pcNc1VM
Message-ID: <CANiq72m9Nq-Wonw57Nwk480CTCmoaDk-_rTLX-dFrqh_N+eyfg@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
To: Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: Mark Brown <broonie@kernel.org>,
 Deborah Brouwer <deborah.brouwer@collabora.com>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:broonie@kernel.org,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,rust-lang.github.io:url]
X-Rspamd-Queue-Id: 6840A7769C
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 8:46=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> If I run 1.85.0, I *instead* see the following ones from clippy:
>
>   CLIPPY [M] drivers/gpu/drm/tyr/tyr.o
> warning: operator precedence can trip the unwary
>   --> drivers/gpu/drm/tyr/gpu.rs:51:13
>    |
> 51 |             shader_present | u64::from(regs::GPU_SHADER_PRESENT_HI.r=
ead(dev, iomem)?) << 32;
>    |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^ help: consider parenthesizing your expression: `sha=
der_present | (u64::from(regs::GPU_SHADER_PRESENT_HI.read(dev, iomem)?) << =
32)`
>    |
>    =3D help: for further information visit https://rust-lang.github.io/ru=
st-clippy/master/index.html#precedence
>    =3D note: `-W clippy::precedence` implied by `-W clippy::all`
>    =3D help: to override `-W clippy::all` add `#[allow(clippy::precedence=
)]`

I took a look at this --  Rust 1.85.0 extended the `precedence` lint
to catch these, and then because it was too much, they split part of
it into a new one called `precedence_bits` which is not enabled by
default, which landed in Rust 1.86.0 (and is not in Rust 1.85.1,
sadly).

    https://github.com/rust-lang/rust-clippy/pull/13743
    https://github.com/rust-lang/rust-clippy/issues/14097
    https://github.com/rust-lang/rust-clippy/pull/14115

I see others in the kernel have written similar expressions with
parenthesis, e.g. for Rust in `ioctl.rs`, and I see a ton of those in
C files too.

Personally, I don't mind seeing the parenthesis, but I know others may
feel like it is obvious.

Now, seeing quite a bunch of parenthesis for this in C files, from
kernel devs and crypto stuff and all over drivers and so on and so
forth, means others definitely do not find it obvious or prefer to be
explicit for extra clarity.

So we can just clean this one up and later enable `precedence_bits`
for newer versions. Or if we decided it is too much, then I guess I
could allow `precedence` on Rust 1.85.0 only.

Cc'ing others in case they want to give their opinion.

Cheers,
Miguel
