Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38577E7D17
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3681110E0A5;
	Fri, 10 Nov 2023 14:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EEC10E0A5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:42:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 795B3619F8;
 Fri, 10 Nov 2023 14:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B73C433C7;
 Fri, 10 Nov 2023 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699627322;
 bh=r1u4S6czlGhgJr3DSHZB1Nz2Yr5vLHsBgbtwT8LGonA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jeZGc+RXq0whsJf3Tj83XQod+vt8TsuDXIyAKqe3UJhwW+HMN9jR42ZyDve31pWUc
 WCputicK5jjb5eFtCoY1mmmV8ATY+2xlHL+mvmBkxsPDTTiz3/Crlj4lM1qUElDhXj
 YcJT7LFrp/ZRScU54AypyrsDkcTM5gv2toTSvnYApspJgYWH1juzbSMUqYWtwmV+z3
 yL2vkSM1RxJYipYM0x682SNxwWh9T/ojfgeL96cELAzo7LH0ZZQXKyF0N2WhZ/53Hx
 QWz9BTxCQ3B1kiI/4NLeKW7vIBI04m4gPqTnVRqcCo+CbkGvQQfGEW5IDh1F0YP4hk
 rWa3ob4QSAl+A==
Date: Fri, 10 Nov 2023 15:41:59 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marco Pagani <marpagan@redhat.com>
Subject: Re: [RFC PATCH v2] drm/test: add a test suite for GEM objects backed
 by shmem
Message-ID: <dqpsjdpedvpbooffrn2nwg6hxr2bhdizwx27icwz2dx5bgsho4@id5drrg66e7h>
References: <20231108134205.111478-1-marpagan@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5f7kz7hlopnaynsr"
Content-Disposition: inline
In-Reply-To: <20231108134205.111478-1-marpagan@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Christian Koenig <christian.koenig@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5f7kz7hlopnaynsr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 02:42:03PM +0100, Marco Pagani wrote:
> This patch introduces an initial KUnit test suite for GEM objects
> backed by shmem buffers.
>=20
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Marco Pagani <marpagan@redhat.com>
>=20
> v2:
> - Improved description of test cases
> - Cleaner error handling using KUnit actions
> - Alphabetical order in Kconfig and Makefile
> ---
>  drivers/gpu/drm/Kconfig                    |   9 +-
>  drivers/gpu/drm/tests/Makefile             |   5 +-
>  drivers/gpu/drm/tests/drm_gem_shmem_test.c | 381 +++++++++++++++++++++
>  3 files changed, 389 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/tests/drm_gem_shmem_test.c
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 3eee8636f847..a2551c8c393a 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -76,14 +76,15 @@ config DRM_KUNIT_TEST
>  	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
>  	depends on DRM && KUNIT
>  	select PRIME_NUMBERS
> +	select DRM_BUDDY
>  	select DRM_DISPLAY_DP_HELPER
>  	select DRM_DISPLAY_HELPER
> -	select DRM_LIB_RANDOM
> -	select DRM_KMS_HELPER
> -	select DRM_BUDDY
> +	select DRM_EXEC
>  	select DRM_EXPORT_FOR_TESTS if m
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KMS_HELPER
>  	select DRM_KUNIT_TEST_HELPERS
> -	select DRM_EXEC
> +	select DRM_LIB_RANDOM
>  	default KUNIT_ALL_TESTS
>  	help
>  	  This builds unit tests for DRM. This option is not useful for
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makef=
ile
> index ba7baa622675..d6183b3d7688 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -9,15 +9,16 @@ obj-$(CONFIG_DRM_KUNIT_TEST) +=3D \
>  	drm_connector_test.o \
>  	drm_damage_helper_test.o \
>  	drm_dp_mst_helper_test.o \
> +	drm_exec_test.o \
>  	drm_format_helper_test.o \
>  	drm_format_test.o \
>  	drm_framebuffer_test.o \
> +	drm_gem_shmem_test.o \
>  	drm_managed_test.o \
>  	drm_mm_test.o \
>  	drm_modes_test.o \
>  	drm_plane_helper_test.o \
>  	drm_probe_helper_test.o \
> -	drm_rect_test.o	\
> -	drm_exec_test.o
> +	drm_rect_test.o

Thanks for reordering the tests and symbols, but they should part of a
preliminary patch.

>  CFLAGS_drm_mm_test.o :=3D $(DISABLE_STRUCTLEAK_PLUGIN)
> diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm=
/tests/drm_gem_shmem_test.c
> new file mode 100644
> index 000000000000..983380490673
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> @@ -0,0 +1,381 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit test suite for GEM objects backed by shmem buffers
> + *
> + * Copyright (C) 2023 Red Hat, Inc.
> + *
> + * Author: Marco Pagani <marpagan@redhat.com>
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/iosys-map.h>
> +#include <linux/sizes.h>
> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_kunit_helpers.h>
> +
> +#define TEST_SIZE		SZ_1M
> +#define TEST_BYTE		0xae
> +
> +struct fake_dev {
> +	struct drm_device drm_dev;
> +	struct device *dev;

AFAICS, you're not using the dev pointer anywhere. You could remove the
fake_dev struct entirely and pass the drm_device pointer in test->priv

> +};
> +
> +/*
> + * Wrappers to avoid an explicit type casting when passing action
> + * functions to kunit_add_action().
> + */
> +static void kfree_wrapper(void *p)
> +{
> +	kfree(p);
> +}
> +
> +static void sg_free_table_wrapper(void *sgt)
> +{
> +	sg_free_table(sgt);
> +}
> +
> +static void drm_gem_shmem_free_wrapper(void *shmem)
> +{
> +	drm_gem_shmem_free(shmem);
> +}

I think you need to explicitly cast the pointer (or do a temporary
assignment to the proper type) to avoid a compiler warning.

> +/*
> + * Test creating a shmem GEM object backed by shmem buffer. The test
> + * case succeeds if the GEM object is successfully allocated with the
> + * shmem file node and object functions attributes set, and the size
> + * attribute is equal to the correct size.
> + */

Thanks for all those comments, it's super helpful

> +static void drm_gem_shmem_test_obj_create(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +	KUNIT_EXPECT_EQ(test, shmem->base.size, TEST_SIZE);
> +	KUNIT_EXPECT_NOT_NULL(test, shmem->base.filp);
> +	KUNIT_EXPECT_NOT_NULL(test, shmem->base.funcs);
> +
> +	drm_gem_shmem_free(shmem);
> +}
> +
> +/*
> + * Test creating a shmem GEM object from a scatter/gather table exported
> + * via a DMA-BUF. The test case succeed if the GEM object is successfully
> + * created with the shmem file node attribute equal to NULL and the sgt
> + * attribute pointing to the scatter/gather table that has been imported.
> + */
> +static void drm_gem_shmem_test_obj_create_private(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	struct drm_gem_object *gem_obj;
> +	struct dma_buf buf_mock;
> +	struct dma_buf_attachment attach_mock;
> +	struct sg_table *sgt;
> +	char *buf;
> +	int ret;
> +
> +	/* Create a mock scatter/gather table */
> +	buf =3D kunit_kzalloc(test, TEST_SIZE, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, buf);
> +
> +	sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, sgt);
> +
> +	ret =3D kunit_add_action_or_reset(test, kfree_wrapper, sgt);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D kunit_add_action_or_reset(test, sg_free_table_wrapper, sgt);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	sg_init_one(sgt->sgl, buf, TEST_SIZE);
> +
> +	/* Init a mock DMA-BUF */
> +	buf_mock.size =3D TEST_SIZE;
> +	attach_mock.dmabuf =3D &buf_mock;
> +
> +	gem_obj =3D drm_gem_shmem_prime_import_sg_table(&fdev->drm_dev, &attach=
_mock, sgt);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gem_obj);
> +	KUNIT_EXPECT_EQ(test, gem_obj->size, TEST_SIZE);
> +	KUNIT_EXPECT_NULL(test, gem_obj->filp);
> +	KUNIT_EXPECT_NOT_NULL(test, gem_obj->funcs);
> +
> +	/* The scatter/gather table will be freed by drm_gem_shmem_free */
> +	kunit_remove_action(test, sg_free_table_wrapper, sgt);
> +	kunit_remove_action(test, kfree_wrapper, sgt);
> +
> +	shmem =3D to_drm_gem_shmem_obj(gem_obj);
> +	KUNIT_EXPECT_PTR_EQ(test, shmem->sgt, sgt);
> +
> +	drm_gem_shmem_free(shmem);
> +}
> +
> +/*
> + * Test pinning backing pages for a shmem GEM object. The test case
> + * succeeds if a suitable number of backing pages are allocated, and
> + * the pages table counter attribute is increased by one.
> + */
> +static void drm_gem_shmem_test_pin_pages(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	int i, ret;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +	KUNIT_EXPECT_NULL(test, shmem->pages);
> +	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 0);
> +
> +	ret =3D kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shm=
em);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D drm_gem_shmem_pin(shmem);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, shmem->pages);
> +	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 1);
> +
> +	for (i =3D 0; i < (shmem->base.size >> PAGE_SHIFT); i++)
> +		KUNIT_ASSERT_NOT_NULL(test, shmem->pages[i]);
> +
> +	drm_gem_shmem_unpin(shmem);
> +	KUNIT_EXPECT_NULL(test, shmem->pages);
> +	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 0);
> +}
> +
> +/*
> + * Test creating a virtual mapping for a shmem GEM object. The test
> + * case succeeds if the backing memory is mapped and the reference
> + * counter for virtual mapping is increased by one. Moreover, the test
> + * case writes and then reads a test pattern over the mapped memory.
> + */
> +static void drm_gem_shmem_test_vmap(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	struct iosys_map map;
> +	int ret, i;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +	KUNIT_EXPECT_NULL(test, shmem->vaddr);
> +	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 0);
> +
> +	ret =3D kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shm=
em);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D drm_gem_shmem_vmap(shmem, &map);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, shmem->vaddr);
> +	KUNIT_ASSERT_FALSE(test, iosys_map_is_null(&map));
> +	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 1);
> +
> +	iosys_map_memset(&map, 0, TEST_BYTE, TEST_SIZE);
> +	for (i =3D 0; i < TEST_SIZE; i++)
> +		KUNIT_EXPECT_EQ(test, iosys_map_rd(&map, i, u8), TEST_BYTE);
> +
> +	drm_gem_shmem_vunmap(shmem, &map);
> +	KUNIT_EXPECT_NULL(test, shmem->vaddr);
> +	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 0);
> +}
> +
> +/*
> + * Test exporting a scatter/gather table of pinned pages suitable for
> + * PRIME usage from a shmem GEM object. The test case succeeds if a
> + * scatter/gather table large enough to accommodate the backing memory
> + * is successfully exported.
> + */
> +static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	struct sg_table *sgt;
> +	struct scatterlist *sg;
> +	unsigned int si, len =3D 0;
> +	int ret;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +
> +	ret =3D kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shm=
em);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D drm_gem_shmem_pin(shmem);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	sgt =3D drm_gem_shmem_get_sg_table(shmem);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
> +	KUNIT_EXPECT_NULL(test, shmem->sgt);
> +
> +	ret =3D kunit_add_action_or_reset(test, sg_free_table_wrapper, sgt);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	for_each_sgtable_sg(sgt, sg, si) {
> +		KUNIT_EXPECT_NOT_NULL(test, sg);
> +		len +=3D sg->length;
> +	}
> +
> +	KUNIT_EXPECT_GE(test, len, TEST_SIZE);
> +}
> +
> +/*
> + * Test pinning pages and exporting a scatter/gather table suitable for
> + * driver usage from a shmem GEM object. The test case succeeds if the
> + * backing pages are pinned and a scatter/gather table large enough to
> + * accommodate the backing memory is successfully exported.
> + */
> +static void drm_gem_shmem_test_get_sg_table(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	struct sg_table *sgt;
> +	struct scatterlist *sg;
> +	unsigned int si, len, ret =3D 0;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +
> +	ret =3D kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shm=
em);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	/* The scatter/gather table will be freed by drm_gem_shmem_free */
> +	sgt =3D drm_gem_shmem_get_pages_sgt(shmem);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
> +	KUNIT_ASSERT_NOT_NULL(test, shmem->pages);
> +	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 1);
> +	KUNIT_EXPECT_PTR_EQ(test, sgt, shmem->sgt);
> +
> +	for_each_sgtable_sg(sgt, sg, si) {
> +		KUNIT_EXPECT_NOT_NULL(test, sg);
> +		len +=3D sg->length;
> +	}
> +
> +	KUNIT_EXPECT_GE(test, len, TEST_SIZE);
> +}
> +
> +/*
> + * Test updating the madvise state of a shmem GEM object. The test
> + * case checks that the function for setting madv updates it only if
> + * its current value is greater or equal than zero and returns false
> + * if it has a negative value.
> + */
> +static void drm_gem_shmem_test_madvise(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	int ret;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +	KUNIT_ASSERT_EQ(test, shmem->madv, 0);
> +
> +	ret =3D kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shm=
em);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D drm_gem_shmem_madvise(shmem, 1);
> +	KUNIT_EXPECT_TRUE(test, ret);
> +	KUNIT_ASSERT_EQ(test, shmem->madv, 1);
> +
> +	/* Set madv to a negative value */
> +	ret =3D drm_gem_shmem_madvise(shmem, -1);
> +	KUNIT_EXPECT_FALSE(test, ret);
> +	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
> +
> +	/* Check that madv cannot be set back to a positive value */
> +	ret =3D drm_gem_shmem_madvise(shmem, 0);
> +	KUNIT_EXPECT_FALSE(test, ret);
> +	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
> +}
> +
> +/*
> + * Test purging a shmem GEM object. First, assert that a newly created
> + * shmem GEM object is not purgeable. Then, set madvise to a positive
> + * value and call drm_gem_shmem_get_pages_sgt() to pin and dma-map the
> + * backing pages. Finally, assert that the shmem GEM object is now
> + * purgeable and purge it.
> + */
> +static void drm_gem_shmem_test_purge(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +
> +	ret =3D kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shm=
em);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D drm_gem_shmem_is_purgeable(shmem);
> +	KUNIT_EXPECT_FALSE(test, ret);
> +
> +	ret =3D drm_gem_shmem_madvise(shmem, 1);
> +	KUNIT_EXPECT_TRUE(test, ret);
> +
> +	/* The scatter/gather table will be freed by drm_gem_shmem_free */
> +	sgt =3D drm_gem_shmem_get_pages_sgt(shmem);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
> +
> +	ret =3D drm_gem_shmem_is_purgeable(shmem);
> +	KUNIT_EXPECT_TRUE(test, ret);
> +
> +	drm_gem_shmem_purge(shmem);
> +	KUNIT_EXPECT_NULL(test, shmem->pages);
> +	KUNIT_EXPECT_NULL(test, shmem->sgt);
> +	KUNIT_EXPECT_EQ(test, shmem->madv, -1);
> +}
> +
> +static int drm_gem_shmem_test_init(struct kunit *test)
> +{
> +	struct fake_dev *fdev;
> +	struct device *dev;
> +
> +	/* Allocate a parent device */
> +	dev =3D drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	/*
> +	 * The DRM core will automatically initialize the GEM core and create
> +	 * a DRM Memory Manager object which provides an address space pool
> +	 * for GEM objects allocation.
> +	 */
> +	fdev =3D drm_kunit_helper_alloc_drm_device(test, dev, struct fake_dev,
> +						 drm_dev, DRIVER_GEM);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdev);
> +
> +	fdev->dev =3D dev;
> +	test->priv =3D fdev;
> +
> +	return 0;
> +}
> +
> +static struct kunit_case drm_gem_shmem_test_cases[] =3D {
> +	KUNIT_CASE(drm_gem_shmem_test_obj_create),
> +	KUNIT_CASE(drm_gem_shmem_test_obj_create_private),
> +	KUNIT_CASE(drm_gem_shmem_test_pin_pages),
> +	KUNIT_CASE(drm_gem_shmem_test_vmap),
> +	KUNIT_CASE(drm_gem_shmem_test_get_pages_sgt),
> +	KUNIT_CASE(drm_gem_shmem_test_get_sg_table),
> +	KUNIT_CASE(drm_gem_shmem_test_madvise),
> +	KUNIT_CASE(drm_gem_shmem_test_purge),
> +	{}
> +};
> +
> +static struct kunit_suite drm_gem_shmem_suite =3D {
> +	.name =3D "drm_gem_shmem",
> +	.init =3D drm_gem_shmem_test_init,
> +	.test_cases =3D drm_gem_shmem_test_cases
> +};
> +
> +kunit_test_suite(drm_gem_shmem_suite);

Looks great otherwise, thanks!
Maxime

--5f7kz7hlopnaynsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZU5BNwAKCRDj7w1vZxhR
xd8BAQCWQfZ2OUNNLGx+mO3N4bk72Lqzux9XJTMEhqQKbwFPJwD+J6F3JeK2aGcw
HnOZStcGzpv8ESgnBrcVBVAhp0/Nrg0=
=2My6
-----END PGP SIGNATURE-----

--5f7kz7hlopnaynsr--
