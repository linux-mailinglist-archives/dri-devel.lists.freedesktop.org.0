Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F00A610A1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 13:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BED610E98A;
	Fri, 14 Mar 2025 12:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A1TGmXL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC30F10E98A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 12:08:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2CEC6A46980;
 Fri, 14 Mar 2025 12:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B55C4CEE3;
 Fri, 14 Mar 2025 12:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741954091;
 bh=CsblKkzrgaBYWK1E9v2Fy8dSmqzMfbZvHjzZ2SWXI8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A1TGmXL+04DceRTtPbY8TmL3vpktUCJ54aeExW9ij3nkZ9KJSKR5zgIVyfXmwJ0MJ
 RE3fNr1ykVugz44dslc1HN+uPkLxn+9gQ9qf0TcGdqp1jQ1uYTdkY/g+M+WGIWYGWa
 8CdxQZ7NONOhaq/PcPEFjqC3ydt0rwtu7HltmuclGLqPA3cRtgHByV7CC0qtwkyEV3
 IN9Lc6uZsfrgSiBB4RRFWl5ARyT6rd9JvOAvT7Q/BbCCCsGKPg4F+4/0ZpTGn9Rpx4
 Cj6HPJJpddyw/UuOcZLRyQfcWkymVGJhVnvKLAY/j0HuJmv0wcn/rL1lxEz+7hmMmV
 1RsJR5ZdaPDTA==
Date: Fri, 14 Mar 2025 13:08:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, 
 Simona Vetter <sima@ffwll.ch>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v3 14/33] rust: drm/kms: Add OpaqueConnector and
 OpaqueConnectorState
Message-ID: <20250314-quaint-acoustic-rook-c925b0@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-15-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qbatj5vagswgvyov"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-15-lyude@redhat.com>
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


--qbatj5vagswgvyov
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC v3 14/33] rust: drm/kms: Add OpaqueConnector and
 OpaqueConnectorState
MIME-Version: 1.0

Hi,

On Wed, Mar 05, 2025 at 05:59:30PM -0500, Lyude Paul wrote:
> Since we allow drivers to have multiple implementations of DriverConnector
> and DriverConnectorState (in C, the equivalent of this is having multiple
> structs which embed drm_connector) - there are some situations we will run
> into where it's not possible for us to know the corresponding
> DriverConnector or DriverConnectorState for a given connector. The most
> obvious one is iterating through all connectors on a KMS device.

It's probabyl a bit of a stupid question again, but why can't we just
iterate over dyn Connector / ConnectorState and need an intermediate
structure?

Maxime

--qbatj5vagswgvyov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QcKAAKCRAnX84Zoj2+
dvkxAYCyCi1bJ3EVAOtyDym8P/XyOqRu1PVtTtQqrcykL8XC58If4p4FZRaw2oP2
8CH+Ga4Bf1BJ0OGDOfan8Z+/3tFDUgoZT7KKcrop6h30bpJrBEXR2WEHjMSEiVPT
AkNxtorvSA==
=fjKu
-----END PGP SIGNATURE-----

--qbatj5vagswgvyov--
