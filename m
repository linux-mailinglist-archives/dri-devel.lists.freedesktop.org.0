Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE476A3E2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 00:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC1610E047;
	Mon, 31 Jul 2023 22:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1693E10E047
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 22:03:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14DBC6113C;
 Mon, 31 Jul 2023 22:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B58C433C9;
 Mon, 31 Jul 2023 22:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690841019;
 bh=selOOlW4hLpWgPSYrwu9n0BWvrm780rmElbTpU9ZkOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g5pDlBMGNh1S7wsiExRk83FoHE9yt2aaFQkjURsXgiwauqOaJhBkcSRwAGzL9n867
 KtejIajf0OG9u56RXxzizdDwKtROXW4KUJLcJE2ZNDYDs4M+JCCwaPMU5KVH5ta1wZ
 FuMASEM7e1fxktkPOdZiBbfyws5HgI8BvjXQwzYNN033X8KWoablfcTk459L0ENvvF
 tzwa4o8uX6QqI3x+04rE1kARPJfmrHmWoDpTeW8saBG7pwNZIrWPEFGxW0JgvfkQ8D
 cM7f4LzFvNyKapMA+KSKXOLIoECbQl7HoL88YntpXpMOCcyLeDsBc2ytmm5i61VdJl
 wUJua96CBmBBQ==
Received: by mercury (Postfix, from userid 1000)
 id 7317E106752D; Tue,  1 Aug 2023 00:03:36 +0200 (CEST)
Date: Tue, 1 Aug 2023 00:03:36 +0200
From: Sebastian Reichel <sre@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 00/19] Sitronix ST7789V improvements
Message-ID: <20230731220336.zfpiofvhzgjycr4d@mercury.elektranox.org>
References: <20230714013756.1546769-1-sre@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ucexv4psctn7tkkx"
Content-Disposition: inline
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ucexv4psctn7tkkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Each patch in the series has at least one Reviewed-by tag and the DT
binding changes have an Acked-by from at least one of the DT binding
maintainers. It has been pending on the mailing list for two weeks
now, so can it be applied?

P.S.: Looks like I missed Neil in the original recipients list.
Sorry about that. If you are not subscribed to dri-devel and need
the full thread it's available here:

https://lore.kernel.org/all/20230714013756.1546769-1-sre@kernel.org/

Greetings,

-- Sebastian

--ucexv4psctn7tkkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmTIL64ACgkQ2O7X88g7
+poLEQ/9GAwcWkVKgCcArYT9faDxGnIf2Ns5AgQkb2th6tuDatJ6pxBski/sU3Li
mcNQfsZ3kzOU4HZe6nEj9lO1uEA1IJIszEk5E78PUrt0sPgKNKyvaiV7DOMBG4tJ
VJVfWlkb+fYwk1YOqaJfeoAOd//QkPLSxsMF4XW4pfsMS8bsmJTWtk4c2Yw4G4DD
QY48j4WJwvZwXnnOVedEg2hEj47AO8esgDn3S4CW8kqGVZ0JXMs7uFjLQYG+6MOr
t5y8cXMTmQ5P4qnDkqQfplTBXy8hOdNYmKzLkOHzCGiXplljpsKHwtViUWQc8PwZ
oDaZQMk2qrzQz0y2hHxWQiOoCClxWgxNcfF1IZBNs3lzOsS/JYgmLF3P2yCRaWf7
Up+oyG/tNq+RJlEG2l+tONZJDORZuPwkmd4B3svrJHJlb9uTAHCCsBXqw6Plui95
KkJfL7VyuJXpnne2e85IsUEj7BKld0UicDnx423/bb0dVSxSFRDDX9sgnsq5OtVT
8LDghKeaihnIuVEdBN1aH1HFYqwsJPHM9n/A/RQBHSzte0UMaQ0XrARvMzPztJUD
+Z39M2l9LY5UlZzqlfo1VGybWVquPbwa+APxKX6KsdTkdQO1YgUGc8+JVt3YhDP8
XOW4w8HgUZo9scdh4g0XOMPu+PDjZ1DTOk3bEYDsFGY9JQ15W2A=
=hYlj
-----END PGP SIGNATURE-----

--ucexv4psctn7tkkx--
