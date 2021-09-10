Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D044D4070C9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 20:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFEA6EA57;
	Fri, 10 Sep 2021 18:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FFC6EA57;
 Fri, 10 Sep 2021 18:06:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E7D76113A;
 Fri, 10 Sep 2021 18:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631297199;
 bh=y7gzzPXHMkryt9e4+4AKiJdOsSmuXw9tQqMcv44sZO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aZj3p9/AxT/C6MApqRK4nHQPKulw+LKH3LIemaam4nAojJ/zOqveJ//NsqBebMhHN
 B0vcjKK9OjuJkxOXGolJHy4oNDJjy9AvUMMxYTcZhhY5+3WPkQrosvJrcptfXY6ROF
 VFaSHruncpG+fCj2A0R9TFE/uEvx7o4d4b4ASo9ph/p7PzghQ6svl3Om8wDUgYx++o
 mUVD/47AuKw5cQhIKWU2UDLj6CisPbkVGKU5h/+wGixpHiyIiHQRkq9hY+EnPdreQz
 jmUYZPjsbHvDydbHG1wqJz+2xfIRY+X/om4Olq+XFymwHE227GrsCVaZ+1wSI+sH5n
 5po5YKvlxfd0g==
Date: Fri, 10 Sep 2021 19:06:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2] kernel/locking: Add context to ww_mutex_trylock.
Message-ID: <20210910180601.GH4474@sirena.org.uk>
References: <20210907132044.157225-1-maarten.lankhorst@linux.intel.com>
 <YTiM/zf8BuNw7wes@hirez.programming.kicks-ass.net>
 <96ab9cf1-250a-8f34-51ec-4a7f66a87b39@linux.intel.com>
 <YTnETRSy9H0CRdpc@hirez.programming.kicks-ass.net>
 <a7e5d99d-39c4-6d27-3029-4689a2a1a17a@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="U3BNvdZEnlJXqmh+"
Content-Disposition: inline
In-Reply-To: <a7e5d99d-39c4-6d27-3029-4689a2a1a17a@linux.intel.com>
X-Cookie: You are standing on my toes.
User-Agent: Mutt/1.10.1 (2018-07-13)
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


--U3BNvdZEnlJXqmh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 09, 2021 at 11:32:18AM +0200, Maarten Lankhorst wrote:

> This is also useful in regulator_lock_nested, which may avoid dropping
> regulator_nesting_mutex in the uncontended path, so use it there.

Acked-by: Mark Brown <broonie@kernel.org>

--U3BNvdZEnlJXqmh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE7nogACgkQJNaLcl1U
h9C1wAf8DRBLZNw/1NtB8vjzFkFGUyhl1QcogXZ/PZiQr8ZaYyuCxWV6f4cXYJOV
uoUy/RXBkW5rX4+TDqj2dDcugYffBDQ4XjLKAsNaUznOlo6kvlGtKwIoNibDGuoh
MYx9mFMNlSEhK2q2QVXhgVeKCc19e03XsN6EzN6fqzGCRKlGxdBRGWLZ1HkPfKia
eo2oFiowQmJdrm1INKM39md3CDY4z6e09p0fmIUs6nCl5VvgWls/FyNCMuILlw8C
BhimfCE429mqI4KDYr0ndzYNWXv+y4f2PI4EB+0aFhBxKYYj4xlBTwrXmiS/nxwR
/o/o58UBtmax/fFX4l5pT+u8Cj4WAA==
=X/vV
-----END PGP SIGNATURE-----

--U3BNvdZEnlJXqmh+--
