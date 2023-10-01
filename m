Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4B7B46C6
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 12:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E60410E1F8;
	Sun,  1 Oct 2023 10:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9086610E1F8
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 10:27:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C5417CE0AC1;
 Sun,  1 Oct 2023 10:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815A4C433C9;
 Sun,  1 Oct 2023 10:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696156056;
 bh=DxGyjWjHTUQSGvAYneZAx2lx1uJSp6o0TO6XeuUGZmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lx7PzT+VXZnHJG1WevUCUKF1YNah83tz+T7s/Cqkt6y+cwQ2WvvPTUJmEYngV3sUL
 LsTH3/nQrN61nNdAD+9yhwxkhPsl5rKzx3O5AIbrlb1KbZGvozLHAdjWiAGk/no7sU
 x8fSClmDfKoPmq65W6H1cLmz6niUYDGzdC/bbae7v+/R0F+L0mvsr8pPvbLygXYepj
 JOx1BPyX1XH/tO031631FtlukHz/5fLRZMUEQejPYCP764ybKhI2RijC607E+Lezxc
 ul/3HiOzeJ3eFGYhCfOf2W5c6O7HADw3vQReLWDPZL7ex1z88cxB5PEE8y/QPebDxc
 Kfn7EM80k9n9w==
Date: Sun, 1 Oct 2023 11:27:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Convert to use maple tree register
 cache
Message-ID: <ZRlJlW/6fZeWjEpF@finisterre.sirena.org.uk>
References: <20230929-drm-adv7511-v1-1-b871b28ee594@kernel.org>
 <20230929213817.GB28737@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UUmRimESPwoHTN8f"
Content-Disposition: inline
In-Reply-To: <20230929213817.GB28737@pendragon.ideasonboard.com>
X-Cookie: Save energy:  Drive a smaller shell.
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--UUmRimESPwoHTN8f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 30, 2023 at 12:38:17AM +0300, Laurent Pinchart wrote:

> Out of curiosity, is this part of an effort to drop the rbtree cache ?

Probably, yes - there's probably some drivers where it will make sense.

--UUmRimESPwoHTN8f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUZSZUACgkQJNaLcl1U
h9BxmggAgqyJ81ofkMwsTZ+GzDAAAwBb+/SIJtB7aqJg+Vh1/L4NYvaHarCvxL8t
je7RCjIbkQQGB8BXBEeGunr6FqJoj1+37SmV4Qy5MDQhOC8DNempCqpzMgEAbgrB
2OaryKHXgZRF0xKfCmJT2kPQcMK3Ibn+YK//0Y9Ee2LvrAuU5gQtHFwmI5mZCh57
pESuf+mi5QIC4XWI+7g1sBCqsMtIVcDTfAz8/ZtH3JEgRmEr1rYJKkd91nGSJ6SO
Cv0RrbTyjrWsPy7jPDD2HUoRh/rDXIg++YaBfccOuuW8YsuIbDDQ8tGWR3+Wi0z+
+9CngyLjEXD1PWVHR4LGh42s84LSWA==
=03eq
-----END PGP SIGNATURE-----

--UUmRimESPwoHTN8f--
