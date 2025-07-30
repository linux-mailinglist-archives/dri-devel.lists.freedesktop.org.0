Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A50B1609C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 14:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1AA10E209;
	Wed, 30 Jul 2025 12:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="LPqXtAj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D93910E209;
 Wed, 30 Jul 2025 12:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753879681; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EgwO8/clcXidq7f5NTIpU176mTfpMVWmEDxmWj7WeOtZdm/NsMUDB2/ZNU2d2aa3ZjvNBp6vVpg5lWbdwIHC+GEAcH/TBqZ0x3XgSF4xhb6THIm+PxXbWYcXbFRUujREoVUETHhAwHbqvsDiD5cD3d0RYqrWtrVLNzSEq8lppdE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753879681;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qCAvTtSpwv/bw10fNrHo7ZJSdHiHGn8ognmTiLYqv5c=; 
 b=FmKnqmnRVOZ+1fBoTHmkZiOjDr8ZZVdGCmuYmtaIK7IpL6j8dTtPmCsCwx0+IQmQWRpZX0ZsXdKOemmTQuGw1N3cGzb5vGuEkrGDDykflnVxH8crUP67YTmBhCHEJ/20+nMgz2744tPSu73LimhWhlpy1gOH3934gleto4pGGmc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753879681; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=qCAvTtSpwv/bw10fNrHo7ZJSdHiHGn8ognmTiLYqv5c=;
 b=LPqXtAj1Hq8kcKQOe+HKg8fp04yscpgn/dprQm29XC/UMsQoEAD/g57cA4xXPHX6
 G4Emvjg6u3GzaYnqZ/dtoV1hpx3XlcDmbnMSn6p1dwn/DKQic/yjcF9hEDrg6HcyqQv
 rjnL4czHLOpUTW2/V/zAB8fiThCkVELhpYZPm9Ag=
Received: by mx.zohomail.com with SMTPS id 1753879678687259.03361556399955;
 Wed, 30 Jul 2025 05:47:58 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 01/19] gpu: nova-core: register: minor grammar and
 spelling fixes
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <b1289f95-616f-4bb8-b408-222ce6925e21@arm.com>
Date: Wed, 30 Jul 2025 09:47:43 -0300
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DC0D1E12-75A9-4FFC-871C-05831FA67504@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-1-7b6a762aa1cd@nvidia.com>
 <B1AA6359-7854-4284-B533-F5CA3C18AF34@collabora.com>
 <DBNF8SZWLI79.1NRX9AMW5QW45@nvidia.com>
 <d0ffb55b-690a-4a65-98b5-b83adebfd88b@arm.com>
 <DBNNTU14VH90.25AZCJSVT4JDR@nvidia.com>
 <ce8b4bd9-5122-4b85-b605-a1bf10556208@arm.com>
 <DBOL3HSE1OUW.22PGYP5T6164C@nvidia.com>
 <b1289f95-616f-4bb8-b408-222ce6925e21@arm.com>
To: Steven Price <steven.price@arm.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External
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

[=E2=80=A6]

>>>=20
>>>> The idea of register blocks is interesting. I wonder how that would
>>>> translate in terms of access to invididual registers, i.e. does the
>>>> block end up just being a prefix into the full register name, or is =
it
>>>> something else? =46rom your example declaration I picture that =
accesses
>>>> would look something like `MMU_AS_CONTROL[4]::MEMATTR::read(bar)`, =
which
>>>> ngl looks great, but I also cannot think of a construct that would =
allow
>>>> such a syntax... Happy to think more about it though.
>>>=20
>>> Yes, that is the sort of syntax I was imagining, although I was =
hoping
>>> you could do something like:
>>>=20
>>>  let as =3D MMU_AS_CONTROL[as_id]::try_get(&bar)?;
>>>=20
>>>  let memattr =3D as.MEMATTR.read(&bar);
>>>  memattr.set_attr0(3).write(&bar);
>>>  as.TRANSTAB.write(&bar, 0x1000);
>>>=20
>>> Which I'm sure shows how little Rust I've written, but hopefully you =
get
>>> the idea - only the first line is a try_xxx which can fail and takes =
the
>>> address space ID from a variable and bounds checks it. The other
>>> accesses we already know the bounds so there's no need to deal with
>>> failure, and we don't have to consider the situation where MEMATTR =
is
>>> written but the TRANSTAB write fails (which couldn't actually happen
>>> with non-contiguous register arrays but the compiler wouldn't be =
able to
>>> tell).
>>=20
>> That for sure looks elegant. Now the question is how can we implement
>> something similar using only ZSTs? `MMU_AS_CONTROL` would have to be =
a
>> static array. Then `as` needs to be some sort of struct?
>>=20
>> The way this works looks very similar to what I suggested above with
>> register arrays and validating once that a given index is valid for =
the
>> register array accesses. Then the non-try accessors can be used, =
knowing
>> that the compiler will be able to infer that the index is valid. The
>> only drawback being that each `read` and `write` will have to carry =
the
>> `as_id`.
>=20
> Presumably it should be possible to implement with 'as' being a type
> which actually contains 'as_id' (as opposed to an actual ZST) so you
> don't need to explicitly pass that in. Otherwise there's a possibility
> of passing the wrong as_id in and so the compiler won't be able to =
infer
> that it must be valid.
>=20
>> This would work, but if someone wants to experiment to try and =
implement
>> something closer to the interface you proposed, I'm very open to the
>> idea. I wonder if we could do this without any runtime overhead...
>=20
> Since my Rust knowledge is very limited there might be a better way of
> doing this, but that this seemed like the most natural interface to =
me.
> I can see how a similar approach could be used in C with minimal/no
> overhead so I would have thought this is possible in Rust.

I hate macros with a passion, but I can try tackling this in the =
interest of
moving it forward :)

=E2=80=94 Daniel


