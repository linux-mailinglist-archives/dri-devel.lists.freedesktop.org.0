Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2AAB15928
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 08:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63E210E403;
	Wed, 30 Jul 2025 06:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2QjF6sEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2394210E403
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 06:54:59 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-71a04654b82so30341007b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 23:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753858498; x=1754463298;
 darn=lists.freedesktop.org; 
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xb9lxccqqzV/HuE6IBjo5UmOhzvTQ7eGMAvIhyfuiTI=;
 b=2QjF6sEFOp5eEGLz1+ZyyvMnlpYyA6zlEXZrtGjDZlA8LH5AhyAa720CBkzh7zuLTS
 NvMsE6w3HxOg13ntRCUBXFtprW2UG+J/tnSyd1fkFyKVAKsnAKWfNjTg53B4K/Foqnnl
 Rf9/yVO2uxRMxUsly+3OP12gIjJj+Z6YcEugEehzFSeFsNfaEMLwvrQNlxNLpFQaOwWn
 dF70FmObUFlXSC4N1sciZT9voYSBB+Fc0dEkRnAka68uynBtz9slAutFUjZsfOSwKvd4
 z0Q33sQSLRpxdvc0hazcpmCn881eaksQsPLRHvcww8niSRxV5P1vI9UTtYXwTetxrq25
 ODjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753858498; x=1754463298;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xb9lxccqqzV/HuE6IBjo5UmOhzvTQ7eGMAvIhyfuiTI=;
 b=D+yZqjIlg7mqsVf+/brfgJsku6DEKiEfUZge/+Bj9FN7Ct6Z6ozPX2B+rh7YSNwcZu
 uwfFadHy+yWR+uh8AMboo6gpkFh2bMMWczs1HFkba7eiEC6cUmGt/42cSwmkXVh7f1TW
 dHp0KT2M3Tsi0re/DmNtYwTy6CaFLlDtvZBqY6E88aaxzs+URAjkerclUaApqAYIIxpP
 Ulq2jViTq+6Glo4VEMvpSo18DjQpvmqhsbULwylyj/PpF0/S1u4MMzJeCeXJ3z9NaZCX
 iZRh2Ft+LimPE4rTxjmpgp83WcYGorcqgLPnCvf/vP0u+Q5TZSjSPbt0fCVHI1DaSCnD
 KCfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0KFCFDi7olfORamHE5gHpte/LRiB7OGmg/hk4HIjid6blzNyPrj9bLJahkoxvjzf3Ibsm8dZ3mqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoAYgEkSp9Ub3ZjtdKsu8/akpew6mtc5MI3mfsKAJ0UFa2orbZ
 gCNsgHrQ93QRbvuSdDCTbQhu0MmGgcc1AEzDRVzrs7d+u5OuUy05YrB4S59arLeafQ==
X-Gm-Gg: ASbGnctm0Ew6SkEJlt7mBSit2ahSNbGnHMiyrQVegmVXF4Pa27WMJJoGiDtTcVQx0Ax
 qx0+bu4iO667UmW3vM7P1RsfSDlYyCWUUz7nufs2oUUHxIssEcTgDm1+zQpntnGHokxK84lEK/U
 MQYXqckXHnruMQtO/WroCrChfvbjEV6ZY2vUeMsrrlNgVnOh9gxWqDq7kl1G3z5rfyvdhHBe6Jw
 zMkTldXCj+cfEAIsRNyp8NIr175A1LfSfBTjXu7rxNmidaZXU0YvHFVnpoYfR7BMxPt/yJgcsDc
 4f4sH5W4dZttHYogNgIA/Y89MQWhHWpuPOGSj8LTSeWreC19L/f6hojrEThionksg5ZCpIu1sX4
 9nNWIvuaRSF4QvccJAXHFzhisYAfepQYF+se2o22I6RnlGI3IzI6vZEBgq1XGY7QFKX67tB/UpG
 hO6de5gY8=
X-Google-Smtp-Source: AGHT+IFRrK4i6oO1zKk7GnmCX4K+vLePl7LTsNrBKA6nlwjLECThBMqUufa7+jqHJdcW9Ic1/5Dy+A==
X-Received: by 2002:a05:6902:921:b0:e8d:7451:d738 with SMTP id
 3f1490d57ef6-e8e315bfb59mr2626997276.35.1753858497592; 
 Tue, 29 Jul 2025 23:54:57 -0700 (PDT)
Received: from darker.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e8e3f3a46b3sm504319276.27.2025.07.29.23.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 23:54:55 -0700 (PDT)
Date: Tue, 29 Jul 2025 23:54:43 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
cc: akpm@linux-foundation.org, hughd@google.com, patryk@kowalczyk.ws, 
 ville.syrjala@linux.intel.com, david@redhat.com, willy@infradead.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com, 
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, 
 tursulin@ursulin.net, christian.koenig@amd.com, ray.huang@amd.com, 
 matthew.auld@intel.com, matthew.brost@intel.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org
Subject: Re: [PATCH] mm: shmem: fix the shmem large folio allocation for the
 i915 driver
In-Reply-To: <0d734549d5ed073c80b11601da3abdd5223e1889.1753689802.git.baolin.wang@linux.alibaba.com>
Message-ID: <ff93c415-7ce8-a331-9568-7543c6a37992@google.com>
References: <0d734549d5ed073c80b11601da3abdd5223e1889.1753689802.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463770367-1769646309-1753858495=:2474"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770367-1769646309-1753858495=:2474
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 28 Jul 2025, Baolin Wang wrote:

> After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs"=
),
> we extend the 'huge=3D' option to allow any sized large folios for tmpfs,
> which means tmpfs will allow getting a highest order hint based on the si=
ze
> of write() and fallocate() paths, and then will try each allowable large =
order.
>=20
> However, when the i915 driver allocates shmem memory, it doesn't provide =
hint
> information about the size of the large folio to be allocated, resulting =
in
> the inability to allocate PMD-sized shmem, which in turn affects GPU perf=
ormance.
>=20
> To fix this issue, add the 'end' information for shmem_read_folio_gfp()  =
to help
> allocate PMD-sized large folios. Additionally, use the maximum allocation=
 chunk
> (via mapping_max_folio_size()) to determine the size of the large folios =
to
> allocate in the i915 driver.
>=20
> Fixes: acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs")
> Reported-by: Patryk Kowalczyk <patryk@kowalczyk.ws>
> Reported-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Tested-by: Patryk Kowalczyk <patryk@kowalczyk.ws>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  drivers/gpu/drm/drm_gem.c                 | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 7 ++++++-
>  drivers/gpu/drm/ttm/ttm_backup.c          | 2 +-
>  include/linux/shmem_fs.h                  | 4 ++--
>  mm/shmem.c                                | 7 ++++---
>  5 files changed, 14 insertions(+), 8 deletions(-)

I know I said "I shall not object to a temporary workaround to suit the
i915 driver", but really, I have to question this patch.  Why should any
change be required at the drivers/gpu/drm end?

And in drivers/gpu/drm/{i915,v3d} I find they are using huge=3Dwithin_size:
I had been complaining about the userspace regression in huge=3Dalways,
and thought it had been changed to behave like huge=3Dwithin_size,
but apparently huge=3Dwithin_size has itself regressed too.

Please explain why the below is not a better patch for i915 and v3d
(but still a temporary workaround, because the root of the within_size
regression must lie deeper, in the handling of write_end versus i_size).

Hugh

---
 mm/shmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 3a5a65b1f41a..c67dfc17a819 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -5928,8 +5928,8 @@ struct folio *shmem_read_folio_gfp(struct address_spa=
ce *mapping,
 =09struct folio *folio;
 =09int error;
=20
-=09error =3D shmem_get_folio_gfp(inode, index, 0, &folio, SGP_CACHE,
-=09=09=09=09    gfp, NULL, NULL);
+=09error =3D shmem_get_folio_gfp(inode, index, i_size_read(inode),
+=09=09=09=09    &folio, SGP_CACHE, gfp, NULL, NULL);
 =09if (error)
 =09=09return ERR_PTR(error);
=20
---1463770367-1769646309-1753858495=:2474--
