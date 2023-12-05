Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63468058DB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 16:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1776010E562;
	Tue,  5 Dec 2023 15:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E8A10E573
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 15:35:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C84A6CE0B03;
 Tue,  5 Dec 2023 15:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA2AC433C7;
 Tue,  5 Dec 2023 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701790503;
 bh=jxxlSiaaRyezQ6LzFH+4I6UqsA5xw8pyUZ9Qn3g/Aik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ilL/AlxEv10rifhxB24AONRldMt8n7ncUkQmbUmqhJNG/5jBxUo+3xS4ZSQyhXD25
 PYJFQNsd3Z3hNcIq2F87nxy8EV7OnqLJNgUjN51xS6qH02FLT7abEFGvPTsI7rbl6h
 rDId+IZBN9Cd6P/nMU6jiEU8yTozxgYIhk1/6exgeNOtw21GfMgT7wMBuFeN9BvCcN
 vycoGXDlrkKnzQB0HRUz2knn660/0jxDz9iSxS3Ss3ZELoN5pRW+bIGZ4yWh+mc+NW
 h+qLCn4D7njLDo9MJ/aSCBHm93m6k2wc1v7X8TdhqwzQ3aBvxQjo3iFomIrEhavSwh
 yYAb2pTZo+VKQ==
Date: Tue, 5 Dec 2023 16:35:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v2 0/2] PowerVR VM fixes
Message-ID: <j6w6ccewlvoosop77ug56r3sqoi4hglj3ejkyfw4dj3s3pdsw5@b473njzq5u3d>
References: <20231129220835.297885-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="frqu6fpipq3ipztj"
Content-Disposition: inline
In-Reply-To: <20231129220835.297885-1-dakr@redhat.com>
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
Cc: sarah.walker@imgtec.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matt.coster@imgtec.com,
 donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--frqu6fpipq3ipztj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 29, 2023 at 11:07:59PM +0100, Danilo Krummrich wrote:
> Some major GPUVM changes landed just before v8 of the PowerVR series. Sin=
ce v8
> went in rather quickly (review process was finished otherwise) I haven't =
had the
> chance to review the subsequent code changes.
>=20
> Hence, this series with a few fixes in this context. Plus a minor GPUVM p=
atch to
> make the drm_gpuvm_prepare_* helpers useful for PowerVR.

This doesn't apply on drm-misc-next anymore, could you rebase and
resend?

Thanks!
Maxime

--frqu6fpipq3ipztj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW9DJAAKCRDj7w1vZxhR
xcnCAQC2Rnlt3ZS+eAeCOJ1rX+c3IzfC6+DAB7Ordkhc8HmZpAD/QcM1HDPb7Tzi
26TfeH0Ck+dr4dJGZF6YLiYxleZuPgk=
=poSS
-----END PGP SIGNATURE-----

--frqu6fpipq3ipztj--
