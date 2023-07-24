Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10C875F4D4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 13:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7907610E2D8;
	Mon, 24 Jul 2023 11:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BAB10E2D8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 11:19:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EAB44601C3;
 Mon, 24 Jul 2023 11:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A99C433C8;
 Mon, 24 Jul 2023 11:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690197547;
 bh=eGy6WqfVIqQPgGPKAvW81QoB/ySKTHMD8LagMZuvVeI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RHzmUKfDX0RqsMSw4+UXlmUaQUik1fGzIrw7OkY5/eBelHFVDPIJKS3wvfgBRJ/mq
 QUQxVXV3n2Snr5fqcXXOlRXANyayo/dGFKRCr7EuCKcblCl5oXkQ3i3mqbPmZtezG1
 qLh0yJpb0ZlWzdqqg/XquKFpEZpSZ9AuCwh21WFVzXnATY8IdML8xKmLiYznPvPfV7
 IrXY/lCZh2sD7GKaQ7H8mPifPkKqGAG8Cglnrv1CjFqm1oYBI+S3rISRfjieX9bmLb
 eDUFNwfGr+c39A6DuVrrkxTFJq0T6HcJe64O8jhWH3w2txiYdpHE91I1yHbmQvdT4m
 QGyuv0lIt5lQw==
Date: Mon, 24 Jul 2023 13:19:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>
Subject: Re: [PATCH v2 01/11] drm/tests: helpers: Switch to kunit actions
Message-ID: <v2uvmcc2buyc3enmnholj4jgfw2viywmnv4jxwzx2xlcuwuyxu@sdaxiwnkdrmo>
References: <20230720-kms-kunit-actions-rework-v2-1-175017bd56ab@kernel.org>
 <202307210148.7gWzLOtn-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ysvrjn47vocn3ezn"
Content-Disposition: inline
In-Reply-To: <202307210148.7gWzLOtn-lkp@intel.com>
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
Cc: linux-kselftest@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 llvm@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ysvrjn47vocn3ezn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David, Brendan,

On Fri, Jul 21, 2023 at 01:14:41AM +0800, kernel test robot wrote:
> Hi Maxime,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on c58c49dd89324b18a812762a2bfa5a0458e4f252]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-=
tests-helpers-Switch-to-kunit-actions/20230720-191901
> base:   c58c49dd89324b18a812762a2bfa5a0458e4f252
> patch link:    https://lore.kernel.org/r/20230720-kms-kunit-actions-rewor=
k-v2-1-175017bd56ab%40kernel.org
> patch subject: [PATCH v2 01/11] drm/tests: helpers: Switch to kunit actio=
ns
> config: arm64-randconfig-r022-20230720 (https://download.01.org/0day-ci/a=
rchive/20230721/202307210148.7gWzLOtn-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git =
4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210148=
=2E7gWzLOtn-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307210148.7gWzLOtn-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> drivers/gpu/drm/tests/drm_kunit_helpers.c:53:6: warning: cast from 'vo=
id (*)(struct platform_driver *)' to 'kunit_action_t *' (aka 'void (*)(void=
 *)') converts to incompatible function type [-Wcast-function-type-strict]
>       53 |                                         (kunit_action_t *)plat=
form_driver_unregister,
>          |                                         ^~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~

I missed that warning before, and I don't think we can address that
easily. Should we give up on kunit_action_t entirely?

Maxime

--ysvrjn47vocn3ezn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZL5eKAAKCRDj7w1vZxhR
xbDXAQCzzG3lszYEUk6OTrkeopYKRMhD5DWQkj4bxS7jDlfp+wEAliilztZzak6w
syeBeoK9ukIhtHWM2yFxJNj+irZJtw4=
=0xh1
-----END PGP SIGNATURE-----

--ysvrjn47vocn3ezn--
