Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582CA4FD2F9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 10:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C99310FC62;
	Tue, 12 Apr 2022 08:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3880410FC4C;
 Tue, 12 Apr 2022 08:27:06 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id j21so18678399qta.0;
 Tue, 12 Apr 2022 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F8+i4af9cBBYWvVmZD7Ksp7utdqAU6kVM9+1uef96t4=;
 b=qtMJBCdOK+RBZxJ+5vEIx9FlCkFnbtCamAlCbHbZLRltDQWlvRlRfukv+m/Z+QnKqF
 08mgdjO8E9Q3EOTSpMAtmFVsQeeDRWUrOpdaiyeG4etST13NmtchrSmDrK9ifR0tfGzF
 DP7feoVBk80/nRkmF2t36SCIuJm0NgbwsSXQb//C0t7zO8b/47wZq7om2p/hd1YaL/kd
 12aMfSTOzFfrMXXps7vqcScZEAKvU5fYzpStk7ElvntBgVT6PglZxOd3d2bFBPXkXUeL
 DD6H4LAVeM5633ygAmEdvE2j69La/WP4W3C+wkHE/52RJg6wOKpeejmsiVI3wyVgpMh5
 yZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F8+i4af9cBBYWvVmZD7Ksp7utdqAU6kVM9+1uef96t4=;
 b=JnZuG4IiNdtuIjRPsImxk9dSygGWRlB20cq3fO5yg3Qo6rw6c5hlNufYbR13R0pOzj
 QAcllvALr3QImtN/sGk/JlnDdvmZhlpJmPA7k30NIzJIE0zBvxC7QGAV+7y8VwDUDAAd
 cFH1ZKJijY7pRb+2QkCwKfeDLeyYZ81idegyd4hp0uDLZc4wikZaf2IoybMZmHBpu7TK
 iWbUBnbwcqajyIxq0a8pPHAc15r6iTQdS/IUuXr8yFO5Hfo7S91ZZkX0rk0oSwS0LtAL
 3OI/qYqFuOuhYCEAPglBeI69n3n7izulIy4Xh3bE6XqWiLRwv1WPfY2jpWEmRnMRoVYD
 GSEg==
X-Gm-Message-State: AOAM531sMMaHomWHiZWID55fUWxcnF55aJTWGlzRsAQHWudIdI8RFyFF
 +Bn5SWQ1sNuz0Bi0xnAB/IHp26ZeubjGKL7pGjo=
X-Google-Smtp-Source: ABdhPJxg7fkD2HuVd25C3Jmjju8BWlVnRUU/9iqrYxVZipHIPjT1M6EJwqvqli5FnIdluDD6NMUZ2n9RhL2L51bS3sg=
X-Received: by 2002:ac8:588c:0:b0:2e1:ee12:3473 with SMTP id
 t12-20020ac8588c000000b002e1ee123473mr2392222qta.455.1649752025393; Tue, 12
 Apr 2022 01:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220411185042.24338-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20220411185042.24338-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 12 Apr 2022 09:26:39 +0100
Message-ID: <CAM0jSHOemXQz+qFWOY3ztGeJE4xstvYhXKdW6Kr2PVKppHKKqQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/drm_buddy: Add drm buddy test
 cases
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, igt-dev@lists.freedesktop.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Apr 2022 at 19:51, Arunpravin Paneer Selvam
<Arunpravin.PaneerSelvam@amd.com> wrote:
>
> Add a set of drm buddy test cases to validate the
> drm/drm_buddy.c memory allocator.
>
> v2: sorted in alphabetical order
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Tests look to be passing in CI sharded runs. Pushed. Thanks.

> ---
>  tests/drm_buddy.c | 14 ++++++++++++++
>  tests/meson.build |  1 +
>  2 files changed, 15 insertions(+)
>  create mode 100644 tests/drm_buddy.c
>
> diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
> new file mode 100644
> index 00000000..06876e0c
> --- /dev/null
> +++ b/tests/drm_buddy.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2019 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_kmod.h"
> +
> +IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struc=
t drm_buddy)");
> +
> +igt_main
> +{
> +       igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index b0eab3d6..7261e9aa 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -8,6 +8,7 @@ test_progs =3D [
>         'debugfs_test',
>         'dmabuf',
>         'device_reset',
> +       'drm_buddy',
>         'drm_import_export',
>         'drm_mm',
>         'drm_read',
> --
> 2.25.1
>
