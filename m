Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2DED32372
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 14:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F3810E199;
	Fri, 16 Jan 2026 13:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RfFA1nBV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DF210E199
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 13:58:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 24C9140365;
 Fri, 16 Jan 2026 13:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556E4C16AAE;
 Fri, 16 Jan 2026 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768571894;
 bh=g5iALcS0tIslRxLBVt9TYjT2cP4WEv0rfJAOu9M6usw=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=RfFA1nBVANwp2mZUEpeIrZJ8u7/QmnY2Km5o84kP/EIuj0/f2uNXaSUsVh+Z0Kfp0
 lCMetP4/zfGemUsK3PLdFBr94R392ZzWHN9rpn6QqklBPsAs5VXCeKVlkd7YVhu6sv
 E0QAzg+1exf/Pzd3pqG3LbKrw9tDb+GOKOIDwo7LybBbdZYOgRuUcB7LLEPBlaIGy3
 v8AtrxO1mmEKJJkFyUr8UbiIewS0UXsRbHjQbVsquPcezfbRyZBUVcuQsfz3PD6k8E
 WR02gWE2vZm2Se+OoQWkegp40aHZAfy1E6nJNOKDtQIDFb4hf3lS+5/wOYn3vTnhlm
 ix2myJBTQO+Vw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 14:58:08 +0100
Message-Id: <DFQ2ETAYEE9B.1B3P7RH733YM7@kernel.org>
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <dirk.behme@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Steven Price" <steven.price@arm.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com>
 <DFQ16QS1RAEL.1Z0ESXE0MBA7G@garyguo.net>
 <25EE982E-B03D-4C50-B973-34AC4FFA96B6@collabora.com>
 <DFQ2B06J0U0T.M8K7D98WCZYI@garyguo.net>
In-Reply-To: <DFQ2B06J0U0T.M8K7D98WCZYI@garyguo.net>
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

On Fri Jan 16, 2026 at 2:53 PM CET, Gary Guo wrote:
> On Fri Jan 16, 2026 at 1:38 PM GMT, Daniel Almeida wrote:
>>
>>>>>=20
>>>>> Is there any reason why you replace the UPPERCASE register names with
>>>>> CamelCase ones?
>>>>>=20
>>>>> I was under the impression that we want to use UPPERCASE for register
>>>>> names. Like in nova
>>>>>=20
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpu/nova-core/regs.rs
>>>>=20
>>>> Not really. UPPERCASE for non-const items will trigger the linter. The=
 Nova
>>>> people chose to #[allow] this to align with OpenRM and, IIRC from the =
LPC
>>>> discussions, their registers are automatically generated from some int=
ernal
>>>> docs.
>>>>=20
>>>> We have only a few, we can simply convert them to CamelCase.
>>>=20
>>> Frankly, register names do look nicer in UPPER_CASE, especially that th=
ey're in
>>> many cases, packed with acronyms.
>>>=20
>>> Best,
>>> Gary
>>>=20
>>
>> I don=E2=80=99t have an opinion here, to be honest. I think CamelCase do=
es make it
>> easier on the eyes since our register names look quite simple,

I think you want to go with what your datasheets do, it is much easier for
people if names are consistent.

>
> You're on the lucky side! Most hardware don't enjoy that, especially if
> you want to match register names with the ones documented on the datashee=
t.
>
>> specially when
>> compared to Nova. However, I can switch to UPPER_CASE and add an
>> #![allow(non_camel_case_types)] if more people chime in.
>
> I wonder if we should just such allow `non_camel_case_types` to the regis=
ter
> macro? I don't have an opinion on whether we want to enforce using UPPER_=
CASE,
> but at least I think we should allow it.

I fully agree here. I would not enforce it either, but given that the absol=
ute
majority of datasheets uses UPPER_CASE for register names, we should allow =
it in
the register!() macro.
