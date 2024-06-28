Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213F591C45A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 19:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C1A10E059;
	Fri, 28 Jun 2024 17:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tWWbyaIx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7B210E059
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 17:03:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CA832CE4220;
 Fri, 28 Jun 2024 17:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D17DC116B1;
 Fri, 28 Jun 2024 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719594224;
 bh=POx1/uOZB245FBmusGgfUJEuxJZ5QwKWVHTEfLbKB3c=;
 h=Date:From:To:Cc:Subject:From;
 b=tWWbyaIx9sWxHG1muZu1WUYRxAlF4z+kkav7+NUzp41wqho53eF3L53iD74P9yeYd
 Pis4VQ4CeCAtHVUMJemulnSzfO0PhwySn2Cd/ozM40GEE9GWdn8zjFA4LiJH3KEdtS
 vgZ/Z77DbXiAhG/Lr4ho4U9u28G6BmBo84eFlk+AjjytF5a6WVxidWVj1EnGYJiCOi
 Aq4bq0g4nDLgWzNc8XYpRP6tFrc1HNZnF94dczj61+vgxNItFiB8e/9APwqs05lqCJ
 EyhQ80GDbOJCF/AEQU/1/qucEiUYwhfjhZKaTLU+lwqiqVcrNv0B5wNUcorJ97ujvk
 QnQGHVjiSZ0VQ==
Date: Fri, 28 Jun 2024 18:03:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
 Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: buildfailureaftermergeofthedrmtree@sirena.org.uk,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm
Message-ID: <Zn7s611xnutUFxR0@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uOs/tamzhpjy196+"
Content-Disposition: inline
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


--uOs/tamzhpjy196+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c: In function 'pf_get_threshold':
/tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1788:27: error: unused variable 'xe' [-Werror=unused-variable]
 1788 |         struct xe_device *xe = gt_to_xe(gt);
      |                           ^~
cc1: all warnings being treated as errors

Caused by commit

  629df234bfe73d ("drm/xe/pf: Introduce functions to configure VF thresholds")

I have used the tree from 20240627 instead.

--uOs/tamzhpjy196+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ+7OoACgkQJNaLcl1U
h9AZ7Af7BkWNkwptMGFswj/tCDTgrJq/z+dXFYulloh54R2jxB/Mi+47dqpkBM7g
ZgIw8HD3dzN5t9voQsTvkuhecOhKXLXZBS6QE0CpO+B8DgIlD39yVzdzshNzhM0L
/1Q/OAgbXI42YqEFptlp4cBbYIJjtCQm9nzyavlWJZRjW24nPEoe4fKtRWVBypKA
nQYzY3K/BHtr19jfeTNMPzW0jSb0438F9csnctrS2xKYoxY70tlw/J2IbQAUUSld
JzqRnHMRXoGx7WRMCta91wCl99SIS/QTsU6dBTwBl/wivZDPZtx5SsjDivkjVXBY
NeG0kB5MK0FDpb5bEBAJNj787dQf7w==
=Zwag
-----END PGP SIGNATURE-----

--uOs/tamzhpjy196+--
