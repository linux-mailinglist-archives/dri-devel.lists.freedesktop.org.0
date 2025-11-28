Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E20C92E3F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 19:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E6910E837;
	Fri, 28 Nov 2025 18:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Pl3GZYY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2439C10E78A;
 Fri, 28 Nov 2025 18:17:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764353846; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Jox1fFDdDRfcOoaUgQo3oiYvtsKKyp/YmElZftXBiNabSoJDMwjAeZ8QCxGMVjAc4KOLw0WaxhklQDsQt8rSajaMg4RAhi+ZXarYcT8FwyULXgvdbcj4WxP8NbpmDel9q0q+dlHbBTZgVPBR/xjImt6sQlF4dZzDIf1fBj8Iu7U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764353846;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=j4ivFqigThk49301zG4PXOGvB2HvqPMCvI/Ch9oE6HM=; 
 b=BuS1PoU0dfPkp4tWlSJ5l50GqoWc8lALMKL/6XCHaNkVF0o+jg9dgksFBUdQUnca6LjnA41fIJJjW3hFqYTGxXXkYTjaP9z5ER0Eht6ZdYtW0JpodVBAptOG3yx3QIkxEWjqXy8mARDZ6uwi/1tWXyIwtMfqwSvsbLvDnvR03ug=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764353846; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=j4ivFqigThk49301zG4PXOGvB2HvqPMCvI/Ch9oE6HM=;
 b=Pl3GZYY+Ovwc5F3PMyeD3yvPF1/f3kJCS8Av5PgSmlwKTg11xBIaD/g1eWjGdcE5
 viCH5seUu2P6NrKPv/h3v6AVMEsi32WUrbSFFC1HGpsaYlhRztN26MZ3XSJyzLoUVWm
 QM+nFM7x5XKLljDuPFPUW9spJ0bgc0U31Z2femyM=
Received: by mx.zohomail.com with SMTPS id 1764353845000735.4598349893454;
 Fri, 28 Nov 2025 10:17:25 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
Date: Fri, 28 Nov 2025 15:17:07 -0300
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 Andrea Righi <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F21F7D7-D0E7-4B25-AC3E-D21331EE4A1F@collabora.com>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
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



> On 25 Nov 2025, at 22:16, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> On Wed Nov 26, 2025 at 3:16 AM JST, Joel Fernandes wrote:
>>=20
>>=20
>>> On Nov 25, 2025, at 9:52=E2=80=AFAM, Alexandre Courbot =
<acourbot@nvidia.com> wrote:
>>>=20
>>> =EF=BB=BFOn Wed Nov 12, 2025 at 2:13 AM JST, Joel Fernandes wrote:
>>>> Add Rust helper functions for common C linked list operations
>>>> that are implemented as macros or inline functions and thus not
>>>> directly accessible from Rust.
>>>>=20
>>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>>> ---
>>>> rust/helpers/helpers.c |  1 +
>>>> rust/helpers/list.c    | 32 ++++++++++++++++++++++++++++++++
>>>> 2 files changed, 33 insertions(+)
>>>> create mode 100644 rust/helpers/list.c
>>>>=20
>>>> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
>>>> index 79c72762ad9c..634fa2386bbb 100644
>>>> --- a/rust/helpers/helpers.c
>>>> +++ b/rust/helpers/helpers.c
>>>> @@ -32,6 +32,7 @@
>>>> #include "io.c"
>>>> #include "jump_label.c"
>>>> #include "kunit.c"
>>>> +#include "list.c"
>>>> #include "maple_tree.c"
>>>> #include "mm.c"
>>>> #include "mutex.c"
>>>> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
>>>> new file mode 100644
>>>> index 000000000000..fea2a18621da
>>>> --- /dev/null
>>>> +++ b/rust/helpers/list.c
>>>> @@ -0,0 +1,32 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +/*
>>>> + * Helpers for C Circular doubly linked list implementation.
>>>> + */
>>>> +
>>>> +#include <linux/list.h>
>>>> +
>>>> +bool rust_helper_list_empty(const struct list_head *head)
>>>> +{
>>>> +    return list_empty(head);
>>>> +}
>>>> +
>>>> +void rust_helper_list_del(struct list_head *entry)
>>>> +{
>>>> +    list_del(entry);
>>>> +}
>>>> +
>>>> +void rust_helper_INIT_LIST_HEAD(struct list_head *list)
>>>> +{
>>>> +    INIT_LIST_HEAD(list);
>>>> +}
>>>> +
>>>> +void rust_helper_list_add(struct list_head *new, struct list_head =
*head)
>>>> +{
>>>> +    list_add(new, head);
>>>> +}
>>>> +
>>>> +void rust_helper_list_add_tail(struct list_head *new, struct =
list_head *head)
>>>> +{
>>>> +    list_add_tail(new, head);
>>>> +}
>>>=20
>>> Just noticed, but of these helpers only `INIT_LIST_HEAD` and
>>> `list_add_tail` seem to be used (in doccomments).
>>=20
>> Correct, but it makes sense to add the most obvious/common ones (also =
to make it clear that using these are supported).
>=20
> "It makes sense" is subjective, and in this case I am confident it is
> not the right intuition to add dead code just for the sake of it.
>=20
> Each of these helpers adds a potential breakage point from the C API
> should the latter change, so we should only add them if they are =
indeed
> necessary.
>=20
> Actually, some of these helpers are not used when they could have been =
-
> you have a `is_empty` method that rewrites the C function instead of
> calling the helper. The only helpers that are unjustified as of now as
> `list_add` and `list_del`, and these are easy to add when they become
> necessary.
>=20
> But this raises an interesting dilemma: these helpers cannot be =
inlined
> and add the overhead of a function call. On the other hand, the
> definition of `list_head` is so excessively simple that manipulating =
it
> directly is virtually as intuitive as invoking the helper - and =
doesn't
> bear the overhead. So should we double-down on these helpers, or just
> drop them completely and re-implement the list functionality we need =
for
> increased performance?

IIRC, there is someone working to fix this overhead by working on LTO =
support, or at
least I remember this talk at some iteration of Kangrejos.

If you use the helpers, you=E2=80=99ll be covered in the future.

=E2=80=94 Daniel=
