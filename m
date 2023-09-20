Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CFA7A72F3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 08:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED1F10E159;
	Wed, 20 Sep 2023 06:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712C110E159
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 06:40:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A5949CE18EA;
 Wed, 20 Sep 2023 06:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C861C433C8;
 Wed, 20 Sep 2023 06:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695192007;
 bh=QdaDxHqtaLe5D46ildkhpzTfwiTKFpwZhONBdF/TK6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q5JO5kgUzBwgM05BbJKjzFQR8qujZId9X07ee8gaGO31S94UsnScc4SjSS+A2zxSn
 OTPPxZDf3KfCmO9F11loIBC55dPi0OemVkXWgx0sxa/Qw5mrDGqeoTj7gP4gUi7Nrk
 IX8gPMReKBaijl7zyx6XQBVYVLIzuXPzxi6ty9YQsY7cqoMC9MpM3vgYoki3VFVmW3
 SGzKtNtBZdFP6doszSXPk/oQ+JRvYF4jzE9oFBrQ5VX0BiGXZtkqGRaWS8kPAS4/ii
 08aPlv8oDvsrsGZ89C0yCky2CUi5mHrYQGUVe5LecpI+yHTKYFWzchybVbuhIAnMj+
 M6qN6Pi59fmwg==
Date: Wed, 20 Sep 2023 08:40:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 3/3] drm/tests: Fix a use-after-free bug in
 __drm_kunit_helper_alloc_drm_device()
Message-ID: <66zj2spgswo2adyhh2xbcefimggiyci2whxjhsygdistyyqvob@rot736yxggcw>
References: <20230920-kunit-kasan-fixes-v1-0-1a0fc261832d@riseup.net>
 <20230920-kunit-kasan-fixes-v1-3-1a0fc261832d@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q75l2sqotzpskg3l"
Content-Disposition: inline
In-Reply-To: <20230920-kunit-kasan-fixes-v1-3-1a0fc261832d@riseup.net>
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
Cc: mairacanal@riseup.net, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, andrealmeid@riseup.net,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--q75l2sqotzpskg3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Sep 20, 2023 at 03:11:38AM -0300, Arthur Grillo wrote:
> In __drm_kunit_helper_alloc_drm_device_with_driver(), a drm_driver is
> allocated with kunit_kzalloc. If the dev argument was allocated by
> drm_kunit_helper_alloc_device, its deferred actions would access the
> already deallocated drm_driver.

We already have a fix for that in drm-misc-fixes, could you give it a try?

Thanks!
Maxime

--q75l2sqotzpskg3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQqTxAAKCRDj7w1vZxhR
xTOaAP9pjkE1m1Q7mszoUSKaUx/K3sfFfs5u97hCYtBm58HrcQD9H3YghSvpmnGY
f07dxL9+X4Wf2mIZiAjhgeUtnDa3UQk=
=U1Oy
-----END PGP SIGNATURE-----

--q75l2sqotzpskg3l--
