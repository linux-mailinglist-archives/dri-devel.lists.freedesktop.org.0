Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AA9CF6D3C
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 06:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689B310E26F;
	Tue,  6 Jan 2026 05:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="el8ktEYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7A510E26F;
 Tue,  6 Jan 2026 05:56:14 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dlgQL3yZfz9tKf;
 Tue,  6 Jan 2026 06:56:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767678970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zNNJeUjcqXP09KifZHBl4UPg/Uv6TGp/KcRFDIyRRlw=;
 b=el8ktEYv6mUjC+Ut3t2jrwm1EL5iHjhlqc8tqoJWPzadHpZ1ivlHAdYQzAfJFvQtFjHNBt
 XvpePUFuabfxtTNv9mAFG3SbgY2crnLOgpOfkAZKVLPsviAjxklvKpkPrCnDHd8beWxgqM
 T/0pMRwrWw9CVS3xyIDTJyqNT86g7b7fhn6avcSZ6fD13fWSL1uPAWE0/8c7L/gjecJRPI
 h80xL9KYR8FTF4g5jQSEaOWFsrmAMPzam5rrj9BGskG9LW1wlqD7MNNz00fU5jf8VD9uP3
 wDHdMJLh1njKVWrmKkg4SyqmMGlugaSbjTc9znbKHrinivU1U9uvdVar5y4rBg==
Message-ID: <90fac786f019f06765edb7c362e96f1a19801f26.camel@mailbox.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: Maurice Hieronymus <mhi@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
 aliceryhl@google.com, acourbot@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, 	nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 ojeda@kernel.org, boqun.feng@gmail.com, 	bjorn3_gh@protonmail.com,
 a.hindborg@kernel.org, tmgross@umich.edu, 	rust-for-linux@vger.kernel.org
Date: Tue, 06 Jan 2026 06:56:05 +0100
In-Reply-To: <DFGZUHLJ3ALF.EZDC85ZEFJA9@kernel.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
 <20260105161110.5d1ab548.gary@garyguo.net>
 <cd9d7dd56e8191eb2d61dce1c3fd88ccffcff690.camel@mailbox.org>
 <DFGZUHLJ3ALF.EZDC85ZEFJA9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 988fjm6qg93t4asmng8b5qxhs8p76q9z
X-MBO-RS-ID: fb77628ce3067bce7cc
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

On Mon, 2026-01-05 at 23:03 +0100, Danilo Krummrich wrote:
> On Mon Jan 5, 2026 at 10:11 PM CET, Maurice Hieronymus wrote:
> > Before I start implementing, I want to reach common ground.
> >=20
> > In my opinion a derive macro which implements Display would be
> > perfectly fine, as long as the name suggests what it does. So for
> > example #[derive(DisplayEnumVariant)]. This would communicate the
> > intent clearly to the user.
> >=20
> > Benno, would you be okay with that? If not, Gary and Danilo, are
> > you
> > fine with the proposed trait implementation (e.g. the variant_name
> > function)?
>=20
> Actually, it might even be reasonable to have both. In the Nova
> driver we have
> the case that we want to print the enum variant exactly as it is
> defined in the
> code and a lowercase version of the enum variant.
>=20
> > Are there any common use-cases where one wants to change the case
> > of
> > the enum variants? If not, I would not implement an argument and
> > rather
> > name the macro accordingly, so the intent is clear.
>=20
> As mentioned above, we do have a case in Nova where we also want a
> lowercase
> representation to construct a firmware path with.

So there would be the need to have two derive macros:

1. #[derive(DisplayEnumVariant)]
Implements Display for all enum variants as they are (original case).

2. #[derive(ImplementVariantName(Case::Lowercase))]
Implements the mentioned trait. Case could be an Enum where one could
choose between Case::Lowercase and Case::Original.

Something along those lines?
