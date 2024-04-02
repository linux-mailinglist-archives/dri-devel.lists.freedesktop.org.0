Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEF5896060
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 01:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1525B1121B7;
	Tue,  2 Apr 2024 23:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YP2z9cle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605851121B1;
 Tue,  2 Apr 2024 23:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1712101629;
 bh=O1LoqnEQMcpTdBwdEfgqlvn/fIUNF8+6dsCHnA8sUDY=;
 h=Date:From:To:Cc:Subject:From;
 b=YP2z9clebzpRta9TeoArx28YOxl7Zk8HUM2pUUwcs+eJYNXV+AuoyBfnGY2MNH4K8
 30fXfu7UAqYqQvweszB5pk2QNAPzdFeaxqNhXP0yAPf8B8NxBm0V3wEYAlnzIt5cJX
 3e4oA+NGk+/ftjINrI932Mx6FLyh+FuWzYa/2sIRdJtjs+wuY1UTxC8yZiUS5XuCCI
 H3cJmEpGpiQf9knJ+ALHZxn4jO+qt7f4fVm6C+xhNUh+fdZou8Isvxcwp7xUK9feQz
 2ctWCVlqUGLlTb0XQaZPhj+GqRbQcwDqe45Igm/P+WiEIMn4Z701ftSA3pF2sUASwb
 UImA9jwfPBcOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4V8PgK05cdz4wcp;
 Wed,  3 Apr 2024 10:47:08 +1100 (AEDT)
Date: Wed, 3 Apr 2024 10:47:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240403104705.2ea598ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=h/rHpjwY4cM717RH==vH..";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/=h/rHpjwY4cM717RH==vH..
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build
(x86_64_allmodconfig) failed like this:

In file included from drivers/gpu/drm/panthor/panthor_fw.c:19:
drivers/gpu/drm/panthor/panthor_fw.c: In function 'panthor_job_irq_suspend':
drivers/gpu/drm/panthor/panthor_device.h:326:13: error: unused variable 'co=
okie' [-Werror=3Dunused-variable]
  326 |         int cookie;                                                =
                             \
      |             ^~~~~~
drivers/gpu/drm/panthor/panthor_fw.c:979:1: note: in expansion of macro 'PA=
NTHOR_IRQ_HANDLER'
  979 | PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
      | ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/panthor/panthor_fw.c: In function 'panthor_job_irq_resume':
drivers/gpu/drm/panthor/panthor_device.h:336:13: error: unused variable 'co=
okie' [-Werror=3Dunused-variable]
  336 |         int cookie;                                                =
                             \
      |             ^~~~~~
drivers/gpu/drm/panthor/panthor_fw.c:979:1: note: in expansion of macro 'PA=
NTHOR_IRQ_HANDLER'
  979 | PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
      | ^~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
In file included from drivers/gpu/drm/panthor/panthor_gpu.c:19:
drivers/gpu/drm/panthor/panthor_gpu.c: In function 'panthor_gpu_irq_suspend=
':
drivers/gpu/drm/panthor/panthor_device.h:326:13: error: unused variable 'co=
okie' [-Werror=3Dunused-variable]
  326 |         int cookie;                                                =
                             \
      |             ^~~~~~
drivers/gpu/drm/panthor/panthor_gpu.c:166:1: note: in expansion of macro 'P=
ANTHOR_IRQ_HANDLER'
  166 | PANTHOR_IRQ_HANDLER(gpu, GPU, panthor_gpu_irq_handler);
      | ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/panthor/panthor_gpu.c: In function 'panthor_gpu_irq_resume':
drivers/gpu/drm/panthor/panthor_device.h:336:13: error: unused variable 'co=
okie' [-Werror=3Dunused-variable]
  336 |         int cookie;                                                =
                             \
      |             ^~~~~~
drivers/gpu/drm/panthor/panthor_gpu.c:166:1: note: in expansion of macro 'P=
ANTHOR_IRQ_HANDLER'
  166 | PANTHOR_IRQ_HANDLER(gpu, GPU, panthor_gpu_irq_handler);
      | ^~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
In file included from drivers/gpu/drm/panthor/panthor_mmu.c:30:
drivers/gpu/drm/panthor/panthor_mmu.c: In function 'panthor_mmu_irq_suspend=
':
drivers/gpu/drm/panthor/panthor_device.h:326:13: error: unused variable 'co=
okie' [-Werror=3Dunused-variable]
  326 |         int cookie;                                                =
                             \
      |             ^~~~~~
drivers/gpu/drm/panthor/panthor_mmu.c:1689:1: note: in expansion of macro '=
PANTHOR_IRQ_HANDLER'
 1689 | PANTHOR_IRQ_HANDLER(mmu, MMU, panthor_mmu_irq_handler);
      | ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/panthor/panthor_mmu.c: In function 'panthor_mmu_irq_resume':
drivers/gpu/drm/panthor/panthor_device.h:336:13: error: unused variable 'co=
okie' [-Werror=3Dunused-variable]
  336 |         int cookie;                                                =
                             \
      |             ^~~~~~
drivers/gpu/drm/panthor/panthor_mmu.c:1689:1: note: in expansion of macro '=
PANTHOR_IRQ_HANDLER'
 1689 | PANTHOR_IRQ_HANDLER(mmu, MMU, panthor_mmu_irq_handler);
      | ^~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  962f88b9c916 ("drm/panthor: Drop the dev_enter/exit() sections in _irq_su=
spend/resume()")

I have used the drm-misc tree from next-20240402 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/=h/rHpjwY4cM717RH==vH..
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYMmPkACgkQAVBC80lX
0GxDKAf9G3v6j8SSmsO725iM40aC0aOWHSxf+5dri4sI6wjIhxTIJ7Iy9x6628/n
PErvIk03eZeJSF2AfQEtv2EZhdQLveic/2M0qhzoYe8g+XmPF9Ed64F0WBQNFO7i
/F1RJcTHXDHll83mJroO7yuVFvmidBRhHG7lGUXT9JvHxvImRQZjD4Nw7i4yRN6j
kPgUWf4wEEPVrthJVoRvo0AFI25aCb+d50yye0oBcXgAMMLlJfdCfysn1d6AcOH5
UfK9xzntnUkX9wp8ZONMbnnNsiHj7CiC/OuSndeTzAgZx3MIe7ujiFirRk25P+vp
+BVVTQP4xhDo87Z3k6EKBMvIi3c0ZQ==
=2cUO
-----END PGP SIGNATURE-----

--Sig_/=h/rHpjwY4cM717RH==vH..--
