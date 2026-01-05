Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02C2CF4435
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 16:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643CA10E41E;
	Mon,  5 Jan 2026 15:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ceyc/DIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E527310E41E;
 Mon,  5 Jan 2026 15:00:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1919D6011E;
 Mon,  5 Jan 2026 15:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B3FC116D0;
 Mon,  5 Jan 2026 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767625245;
 bh=7gg5z6C6yw3HptKGw75TFDN4ZG/aBRLGLWwhqPAD4qw=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=ceyc/DIZR5YXAjppuoL6w7w7HZopdRIgz+s2KWeiw3t7KHB9OFNAVY4pZ4dxaSoo1
 kUsakpsv5hoTZ3+Ie91bdF3XP2T8Vo/flO6OrNdaKiVErMuZ87PO7BTpZI0KBLLPMH
 r9C5NlQ07vUxlDFsnnqt4sPO6MI3vUzvKjXuN/lDRlq3VpdGb7ykydjji/fSNZmsZF
 68jWpqQgPEkLF5X+zTwxfKnaMjS2xPAK94YBG1Mhm9OB8oL2I26UlAgTBQjO4Vu6D+
 TywOtM9aHaAfGHmHAFi1/79K2ZEGQxj9xSzRd1/gauR/C2eACXh+sEOgWfgfscm1Vh
 T6BvRfh9vMEUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 16:00:41 +0100
Message-Id: <DFGQUPHJVF5M.3EZ2KL4XIMDJH@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
Cc: "Maurice Hieronymus" <mhi@mailbox.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
 <DFGQH1FOS007.3IG8XIBOBWTZI@kernel.org>
In-Reply-To: <DFGQH1FOS007.3IG8XIBOBWTZI@kernel.org>
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

On Mon Jan 5, 2026 at 3:42 PM CET, Benno Lossin wrote:
> I'm still skeptical about having a derive macro for `Display`. What
> about adding & deriving the following trait instead:
>
>     pub trait EnumVariantName {
>         fn variant_name(&self) -> &'static str;
>     }

With a derive macro for this trait, that sounds absolutely reasonable -- a
corresponding Display implementation becomes trivial with this.
