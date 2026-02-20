Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xSbLIJ22l2lj6wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 02:19:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFA51641E3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 02:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DCD10E347;
	Fri, 20 Feb 2026 01:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QaJHd0qT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209F310E685
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 01:19:21 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-2ba85f77203so33071eec.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 17:19:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771550360; cv=none;
 d=google.com; s=arc-20240605;
 b=ero1azcBdNMvZQEVgYBRLl1tQSOhROvWynMhht4IiJq8ucpV+n5JU8QI4eA22f+aVh
 6EJnnjLoXgj/GIJ6CazG2B27y9hIUMB7S6nyk/CavOIxznuDBvee+MpV9MBIkeW9sJzO
 sV3HQirqhG9ebDnnNeMyW5Ib1VoFVYf6o/5XZglzcBAB/9fpV+UKNQfJCARWSbh/4dEP
 lB/jieX06lQvLGaEEaLTaEnoR9SkwoWTpGk4EbCskTEyaXTYFcwvJ/j/kVYNps/5R/t6
 bHFaGU7Fv8ZMYpuGZgsoT8jmlHbWutCeoOhysFWbW6emnRASBjUp3y2Qt30sudVU4EVC
 kkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wxVPQliT7y1tlNyaDRmJdeHvLMVEy2aDzAdtD3Jyb4U=;
 fh=5YE2Llb9g3035wrjf5GPAWDgj103ChwwO0z1HVl02Eo=;
 b=d4O1yaRsC3DeRJqEI4s8lao0thTkaS1ueTc0T3mBLsNtXsbv1+hEPAUIjGNPR/DCVQ
 XYTsK5/LnHv2NWsGir0e3Z7oDe4RFPzPjxCUm6KhqjPSoKCjZ5KhkRjKqwyTYE+9dlvN
 JyVno5rSUffpng24ejYi1YA1bFhwJ1J6d4fsKrOPIrN5A3BMntAXyssnYixmB0ou+6DR
 inDY8DwWJCaU2qulAN8jz2JouI3BRErywHCYaMYuFRuCaMl5CRP6uZbg1dWgpNAWc9LR
 QidJAqu46lymiUcnSSEx9hVpMrRyI1OmYlUCXxUFnVdYDZWZrhaQOsZqnqMsC18rZonJ
 O/bQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771550360; x=1772155160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxVPQliT7y1tlNyaDRmJdeHvLMVEy2aDzAdtD3Jyb4U=;
 b=QaJHd0qTBJGXizqtgV4sD/gdl4J1nMomyWVp9m+MSwtb7zRK9dJWCpW2AWrZu+Fnf7
 W9UFHx1ReRjxHyM+OghZ6KfcmkggTDfXMhFr6jkQ3gBQl5Qa/R8gXe7eCfXapUPGJTf2
 k+YY6Qu2h6i6KMB0rFs9530rRIWLI3t5ijiiOXhQt1rVaVo68GUdXwAg7dtRSjGWQsCr
 GMFjjkJ5KWBibaWjBgRnI0YMV6gl+IuZ1MtGo4RBEGBJaqimiSCz3QiUaTGH2b+QP/rW
 wLcU4D83zjQTK/IuxEkX4DagwN5ed0p3fmO/sqdTL7wO3lYSA+UhbPysFFi8C9hb978G
 p+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771550360; x=1772155160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wxVPQliT7y1tlNyaDRmJdeHvLMVEy2aDzAdtD3Jyb4U=;
 b=gEQs7si21G+AcY4EyyKGsyctEVrj4sGzmkFfPfuLOmtcauP+rrWNUR1INBbvw5cH/a
 pE3gXQor88GQavO8yElfpupfivbN6WR9fapBbzdyWGvfuK6EYm0ZSXg0jrh/Z85DL3tq
 88FhSe7X0B9NXkHV9uY80dZ5ihEebmHth+MznmbQJn3Pmztzy5sc3QrxQjrUHXkMf5ih
 bPDWlM7Ujbd5c37CI3T3dYYE5NKYCXB+I0hvvQFNO/7aUbPizc1fSpYrdkb0fFJ6eNnj
 z3RuW7b4CkGdIu7zFyqENG+otvQHdzmKa3CbnvfXdpfoDRRH38lGuMGyLiei1FcFLKzc
 aUKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe4mftvn4XhoNvZET4IXjiHSMGKypSFFR9ZhFBhQqwyhWvbbx+bTgIJ5bsiquiH9+GjEYU/6Yvq+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXwSC4xtoIDuXLOOqqm1PEskkYgOK5TrudxdsMMtnAnVN5eTKh
 CItIUy9dUE2QIN4XWWeK4RY6Y9BUHsPbsujg0MWi2EolZKSpOmbn9yryT6X2G5r8Q2j0VJH/Rvz
 YwQYj45zgdiBt2sTrkWow0pW0KdmveVI=
X-Gm-Gg: AZuq6aLMmindDtlSpnva3wkt7LizwKsZ94QvZWY7VgSG83VNN6QsymqjRCQE4/6oGkk
 NejTu95Ft84wO9H077dxSZT46jw1B+VLAxDUf8q6LVb2brbO3WqQOjDD4RrSyyX2FcKWsq5vcMN
 b4s/7SXBVpE+XhZag8WKcRmKP0BHcy2RX6d6rXVvTL7ZzSixHjavelBovYcUH3opVt+KUgZyVoW
 pL2PN1e0d0eQRtV1oOvARub64UY2Wx1hTkOcVNwLjVYDZnp/V5RCUKwvM+yE+HG1RNfa6XcpW5s
 EH8KKcvGjG/4Pf9hcsB292Yg/Rpp6HWARtQ8fmV/qIph8DW+nnJROr978Mk6O+E71yO2hMhxB6c
 XFLDjseciltQWgBXPbRd9KZ4q
X-Received: by 2002:a05:693c:3747:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2baba09fd2dmr4832186eec.5.1771550360125; Thu, 19 Feb 2026
 17:19:20 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
In-Reply-To: <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Feb 2026 02:19:07 +0100
X-Gm-Features: AaiRm53I7xSBVJREH3FirrvsTnrCWsVkXbfgOvRoa4QFaRsf9_1Rj3wL1p43FyI
Message-ID: <CANiq72m5=1iB3g4w4-r_eGtbJT6+Xzd7vpp=YvGU7t=y3YevEQ@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
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
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:dakr@kernel.org,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:acourbot@nvidia.com,m:airlied@redhat.com,m:daniel.almeida@collabora.com,m:koen.koning@linux.intel.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:ndjukic@nvidia.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,vger.kernel.org,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: DBFA51641E3
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 2:09=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I don't think so. Most of the kernel crate is doing FFI. We have a `ffi` =
crate
> defining FFI types, we have `CStr`/`CString` which in Rust std is inside =
`std::ffi`,
> etc.

Yeah, I don't love that name either, for similar reasons.

(The entry would still be a sub-entry, either way).

Thanks!

Cheers,
Miguel
