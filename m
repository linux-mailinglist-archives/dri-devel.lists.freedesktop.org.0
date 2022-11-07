Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3D261E9A0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 04:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C103110E04C;
	Mon,  7 Nov 2022 03:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1517610E04C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 03:29:56 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4N5Gv31DGYz4x1G;
 Mon,  7 Nov 2022 14:29:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1667791792;
 bh=hfcnysi5XE55sQ7n9xn2W1rxdYZnNTSb6DIFzZ2gMmE=;
 h=Date:From:To:Cc:Subject:From;
 b=kaO2POaWN3Rtdq35kgtMMpUbhEToSiR6RpXhGidtvkDbjE25fxDzHUGMynCCfTwpl
 DpoomdyelbGVMgxDqbU9b7dQggGwazRBY6tltoOhQrVRN8NOsSIIfcEo8hIXYgeZVC
 hKK9tJpZZ1O/k2G6yDi+mxzHZum0rEySGiHYgwSjREd5ClpLeoXY4sjYr2EQTAa8Bw
 sAnhYDFzTMRCKZVWHQ1blOOYFtvWQD6yyU7pT1I0XNi9P+GLxDoC+SHajwE/8m+40F
 nWKRI0pTNuGEbSV2rUDxdG+/AoIOMkiP8Dm3lCWi7UKcp8/bc+MhUaojWG/0xU6MqJ
 XWK5Mw0rhMSlg==
Date: Mon, 7 Nov 2022 14:29:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20221107142949.516a9112@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uMbCnewP=F7/L37N0U=sqBA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/uMbCnewP=F7/L37N0U=sqBA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (KCONFIG_NAME)
produced this warning:

drivers/gpu/drm/i915/i915_perf_types.h:319: warning: Function parameter or =
member 'lock' not described in 'i915_perf_stream'

Introduced by commit

  2db609c01495 ("drm/i915/perf: Replace gt->perf.lock with stream->lock for=
 file ops")

--=20
Cheers,
Stephen Rothwell

--Sig_/uMbCnewP=F7/L37N0U=sqBA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmNoe60ACgkQAVBC80lX
0GyLbgf/RZ+b7/pLF2D7REzj9nzdFaW0dnG/URf7FawvAzfOczmNxiIbYkz09LLv
Sy/Q96j96L7Pwtad/tOxUMj2alLRzjwQFrC1wF21SQ2CbExKRtuUzygnr6p/5jAp
oy68vEGwPboXHTzvb4rPPehfPIGwkHGwc0gwvoKKgz4O5wgGU9yI2i3+UWx14/E2
nMGgN3ohShAklRKCLFjhFliiF9Pi1DWSk5wEecMtNKaeU7rjDk78seTJlWh9HtAJ
27y+iMMdR+JQ8J9cJsPdKG8/SEihY66H562KEhUytnejea5Dd+549zsthMosz0ve
8VBkeA4nsN5MENehGenoUPRar5CnMw==
=z9xq
-----END PGP SIGNATURE-----

--Sig_/uMbCnewP=F7/L37N0U=sqBA--
