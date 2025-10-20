Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B98BF0752
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027D510E407;
	Mon, 20 Oct 2025 10:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A3VT5mh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D2C10E404;
 Mon, 20 Oct 2025 10:13:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 963BB61D0C;
 Mon, 20 Oct 2025 10:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E64C113D0;
 Mon, 20 Oct 2025 10:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760955211;
 bh=MfxJouz/1s/HQ9XACEExFeHjaUCFWc22PevzBiJAZKg=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=A3VT5mh1lThYKr2EZVY1Llk/2Tn090PKGz1/IKdZ3R9zR65yFw0aGoklyyv/AyHIA
 iHir/QFTDnPdkSJvlneLGBUKFl+WTcZnDFFlxnw71lF6mJl8Id6qWIFzhKfDPAkSMl
 Vo/WcCP4QMarxCJ0GQJOm2BvLD07DGiBCPYPdELwFMt2TUOT9d9vg69x7d9E/w3ZXg
 x4Elv5zrnMvV9c3b54aC7BZ4Jml/XolDUPw2kbzdJ51YMtcGeaP1y9LFNzmy++Tbd/
 nHByJuifTUWv7WPBuUKFa/EjEr/8l+wj8biLKLW7uyb0U3MGf7kpSF05JPZ2u/+Az8
 6sPL8+DqrqlWw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 12:13:25 +0200
Message-Id: <DDN2ITDOVCEV.50CEULQSFLVO@kernel.org>
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
Cc: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
 <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
 <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
 <DDMWPMS0U5PK.3IW61GCOI3GZB@nvidia.com>
In-Reply-To: <DDMWPMS0U5PK.3IW61GCOI3GZB@nvidia.com>
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

On Mon Oct 20, 2025 at 7:40 AM CEST, Alexandre Courbot wrote:
> The alternative would be to have const functions like `usize_to_u64`. It
> doesn't look as smooth as the extention trait, but can be used in const
> contexts.

That's what I thought of, exactly for the reason of being usable in const
contexts (at least for a quick fix in nova-core).

Whether we want an extention trait and a separate temporary const_usize_to_=
u64()
etc. can be discussed in the context of making it common infrastructure.
