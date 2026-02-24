Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEzANbTOnWn4SAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:15:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36616189A52
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A6710E023;
	Tue, 24 Feb 2026 16:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pu5R/sDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA2510E023
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 16:15:44 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-2bd801b4078so202011eec.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 08:15:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771949744; cv=none;
 d=google.com; s=arc-20240605;
 b=Rgh44SJ2mXK3veoPSC8Bmmfl4co9aCN2iO2XFtLI5fk0RR0D/eWD4wVbaA+C9hiQ/U
 zyO1A6pZ3cNJaJ9hTY0zrQwmgmE44cYoZUloy1/P5vfns8sHugVy1fne7pau82hknurB
 1th3bbH/czGY19/2WOXF2wn9kt7uAu43L0OSnKAyKSZpebAV/Kozg//s45L9yx+X2ygo
 KzXsXFHLxNObTdMkHmJpad3Rrp8MeXAQcZpTXZ/1w2jv/iSbk/q6DsYPWHtcjLqnGzzR
 mLFHiXVtFe9phj39jlxf8V+uqXWU1kfFgSDQLlgYu1+SMbJrgDoxUqLxdGWGrmqTTdFr
 pSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vBMEUj7raBbmsyrS7Us99Qy913X47xoD5tUQ83r3xKA=;
 fh=86Rjb4JPLem/oV8nD+LdXocnC/3HMXW+Zb+XS9znDkE=;
 b=FCvIghsMChILX/rGYvcGLXCMyJrE/qes62/1LJ3dmu/snqDouBK6v0P+3b3tSehGZ7
 PFSTIdqsCY1NsbFCriJjzdn+v5QH4YJhsN8SGOl6/5v2c81s8+UwbggaO6sSyjcPL4lB
 hvKAG+vzvLYE2YkORhBY1nUyCJjr1obIwFxReGCn+3zVEhJyDTQhk0oeKgtSxtfohrBN
 5bbpIHHC4vzfe+C8OUjPzjq7l584EiTyvmHrA/tMsxTIBzvF9jF19T4KyfNRy0dPd1bI
 3Vx67rCRvGV0vATldPOt4snaADvRKemr4vr//DDPVIKMMOKaczSEwpfPliZoEEbzyzi0
 hpew==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771949744; x=1772554544; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBMEUj7raBbmsyrS7Us99Qy913X47xoD5tUQ83r3xKA=;
 b=Pu5R/sDKq9GtVpRxfV3ybewpIxYJO3EFnU9apmNEEm6lL0PiXHwcOw5oIwKk7Kdwtm
 r2U5F4E1FMJQU6ZiBVYcPP1CIuvAHamct7+8Utyqux97NLmfaQd216HxByPW+2aUyvh0
 D2JD3WBuXBuqnBKjvipxB1ZgR0Mjj3+MbJ+fY7WLxFPjuAwkjlR8M6tIp/XOLYlzMTqv
 ooQNO9qisr5lGQ4zbXA9TDoni83cSdHjYToo298kj7mslcXRRJiXHJMjkO0FdoxaLsJB
 FU/HazNPzQzUqqOwzp3ap9BigM+bdlAODLmf9NHeRSMDiKWEAk1yLzDR/nWoPoioQJy1
 jgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771949744; x=1772554544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vBMEUj7raBbmsyrS7Us99Qy913X47xoD5tUQ83r3xKA=;
 b=XvLfXcZOG9dbA1EmHp8kXRSkPxiW58brw9CpP38HhUKI0w1oF7IPMjAPLuq3G+Ocec
 wpBwiZ5WrJ+yLgrSxTnIY4RBd1NisKM1yReiOA4IzeyQQwLkcjCtdmEk/TiLNnpCCFSo
 /D/DfWvu56notLPW+zBxic1khGXhi9AibPz4lGD+6C1qYgMUPXbqrm7QGQNtEzoOxvkc
 0AFAyWrq+Z0OkK3N7oAFYwwI4ZBJnkq+VXc9T6kSB7y/zxCVrCfM5ee8yaEwGcSGF2BK
 J5fQH9B9eP+pHXDhOJgdlwD20wYhtbpklNCM6RrfHprFg2gVEH+YXOeLpJiek4GaJ0Y0
 nDtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5DpA0galUO+vqicvIGiXnAv0QbDLHpnxY/y5ohOAlIOjJ+oNSUGEL4lhmuv395AZ2vZHhxvc//+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuTm6pKw6UL3SgAuOJcLMtOZ0iX1LHoBz6/WNQ2adxgRVqGKLA
 jMDWBT9I9YypZZsRyE5TPX2pNPags6F4WOqqpUw566j0HLzuiUsdw+DzBZ7vIuw/Mvw+8E/07EL
 TIwbKfiGLFPfcp2oR81x0UX9jQzEI0lM=
X-Gm-Gg: ATEYQzzaf3RH2lBLkHEag32cSbGSKwrEZgIjsw8UCnc/cBTs5ycwidX1VUUFwgeVhJZ
 k88i12K/VT/jK6AaGIRAJbfDHg+84TtAnbEKXomb68n6A68XPvtUNPLOaSqnFyCl1etlLZPbwiz
 Xc4klHUU383naetsnRyNifEZsxXUmYMrH9+/teSmonvSQbypr5KTbuvC/XPK66dLCU7LbPKLFYF
 iOUXtaBcUGLepBdwDGb0n9t674+uzk2lF2w3UO2bIKfEaRWVGrQy9nNtDDg0WML8MKJckPCDryh
 iVYUmWEvHQ64QKf/PA4O0yM9F1grzaii9q5Ixkg2G8xGr8OxBYeWXpe+Wh4deIo3mNfZNynv0d2
 X1YyaBYTFJoGImJOHtjw3F0BGb+EC
X-Received: by 2002:a05:7300:f108:b0:2ba:6978:2b0 with SMTP id
 5a478bee46e88-2bd7bd5a67fmr2747179eec.4.1771949743876; Tue, 24 Feb 2026
 08:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
 <DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org>
 <859ee9c5-f37a-475d-81eb-6f9de6d34b4f@nvidia.com>
In-Reply-To: <859ee9c5-f37a-475d-81eb-6f9de6d34b4f@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Feb 2026 17:15:31 +0100
X-Gm-Features: AaiRm53le2roUqYa4Jd9OPo9BPShlpMhNiyuPKhqHHVFn6yvlPnm_kCgXr8IATU
Message-ID: <CANiq72=2rE-R0g=aKWjZwQVz-GqLUQ00M+bi+ANrNu3+zGL0Yg@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 linux-kernel@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:joelagnelf@nvidia.com,m:dakr@kernel.org,m:gary@garyguo.net,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:acourbot@nvidia.com,m:airlied@redhat.com,m:daniel.almeida@collabora.com,m:koen.koning@linux.intel.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:ndjukic@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,vger.kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 36616189A52
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 1:54=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> I do tend to agree with Danilo on this. Unless someone yells, I will chan=
ge
> the maintainer entry to "RUST [FFI HELPER]" for the next spin.

Not sure I am following the "what FFI means" discussion, but in case
it clarifies:

The Rust subsystem is meant to be about anything related in some way
to Rust; typically meaning all the things that are not covered
elsewhere (including what both Gary and Danilo mention), sometimes
with overlap with other "global" infrastructure/subsystems (e.g.
Kbuild), sometimes acting as a fallback for Rust code out there if
really needed (i.e. similar to Andrew, but for Rust bits), and so on.

From what I understand, Joel and Alexandre want to focus on
maintaining the `clist` bits (at least for now), and if they are both
going to have the "(CLIST)" suffix, then it may be simpler to make the
entry just that for now since `MAINTAINERS` it is easy to change
anyway.

Now, what kind of things would we want to have inside such a `ffi`
module? (apart from `clist`). Does it mean the proposal is to
eventually move existing things like `CStr`?

Cheers,
Miguel
