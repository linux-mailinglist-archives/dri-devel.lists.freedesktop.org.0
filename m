Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64664CF45F9
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 16:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4F410E440;
	Mon,  5 Jan 2026 15:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="JkXpH+4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F3710E440;
 Mon,  5 Jan 2026 15:23:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dlJ3M6bXnz9t7s;
 Mon,  5 Jan 2026 16:23:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767626608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gC2Lzs3wCcRPxH7slhmmTPdk1OLnKBcCsXBkys9rvVQ=;
 b=JkXpH+4Ub+LPm5/NwdQgFKgpjWVdQHfuqh4ZGd22US/UaHSvhUdD2uRPJ2FMhyMoKi+b0s
 aC4QRZXhlSdcaE4rZFhHipFuvTO8PdGEd3awdwNsqITWipHQemNnHHLT7RrGv2h1htHSf5
 aZNwkngOekRCiIjseTyiQsQiwT4JYJuGLhQ79EXbu/VetohKHSe0QidHi5I8ERnT7i4jrt
 VboMAN0SZPAzPy+wrF5NBGgWchXXGVfzRBZgpWP2sDpBdHVQcwxQYCdGzI0tjVsuvrZQ4y
 KVEqDS2piC0SzhqtVBWnaq4GF0KSXdkBSUdfP3b+2uG5LFyk6DTsmqwtBxrweA==
Message-ID: <3599677c19457baf5a68ddff563b6c9d8effdca6.camel@mailbox.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: Maurice Hieronymus <mhi@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, acourbot@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, 	nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 ojeda@kernel.org, boqun.feng@gmail.com, 	gary@garyguo.net,
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, 	tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Date: Mon, 05 Jan 2026 16:23:20 +0100
In-Reply-To: <DFGQUPHJVF5M.3EZ2KL4XIMDJH@kernel.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
 <DFGQH1FOS007.3IG8XIBOBWTZI@kernel.org>
 <DFGQUPHJVF5M.3EZ2KL4XIMDJH@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 8103c5ec7968e4f08e3
X-MBO-RS-META: craoikjubuihbssfcrjducu6ab5z9ind
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

On Mon, 2026-01-05 at 16:00 +0100, Danilo Krummrich wrote:
> On Mon Jan 5, 2026 at 3:42 PM CET, Benno Lossin wrote:
> > I'm still skeptical about having a derive macro for `Display`. What
> > about adding & deriving the following trait instead:
> >=20
> > =C2=A0=C2=A0=C2=A0 pub trait EnumVariantName {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn variant_name(&self) -> &'=
static str;
> > =C2=A0=C2=A0=C2=A0 }
>=20
> With a derive macro for this trait, that sounds absolutely reasonable
> -- a
> corresponding Display implementation becomes trivial with this.

Sounds good to me too. I will change my implementation and send a V3
shortly.
