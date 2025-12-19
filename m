Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A146CCCFF3D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 14:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594FE10E161;
	Fri, 19 Dec 2025 13:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MvJIItnU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F074710E161
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766149439;
 bh=Iml+BOzB8itHmy1wmzCJMarP4nhjL9hrlRJNdNtfPdI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MvJIItnUqfLCkNBxP9g14nWqbwg/PDtQORAB1wus+Q15Od5tRJybB6k177PHEAqzL
 opgage7mSkCZiYoksrYmyKuRdEsqrfBTv1a3CL5WTftWoHB6F1eioTtk7XQT5QLrDS
 4EBJYV9QU0UyCns3ypDLrbZnToawTKn+F33KoJbLDYE5TOxW333GmYZinyeeAohz90
 vyQozwrZC6GyY+YEge9Rf1QISwxQxg0HbfjzQKNsDsmQaUZs4NdpG5fhv82POZLL9E
 glu6dPsN4RwsOJjJT5AkAmOvDLzdvr6vC1W530amBsNwwGjerNWHZKUV+tQKcGnM0M
 w0GyspAWKH3/A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1EBDF17E0465;
 Fri, 19 Dec 2025 14:03:59 +0100 (CET)
Date: Fri, 19 Dec 2025 14:03:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dmitry.osipenko@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/tests: shmem: Swap names of export tests
Message-ID: <20251219140355.27212b9b@fedora>
In-Reply-To: <20251212160317.287409-2-tzimmermann@suse.de>
References: <20251212160317.287409-1-tzimmermann@suse.de>
 <20251212160317.287409-2-tzimmermann@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 12 Dec 2025 17:00:32 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> GEM SHMEM has 2 helpers for exporting S/G tables. Swap the names of
> the rsp. tests, so that each matches the helper it tests.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 93032ae634d4 ("drm/test: add a test suite for GEM objects backed by shmem")
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.8+

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tests/drm_gem_shmem_test.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> index 68f2c3162354..872881ec9c30 100644
> --- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> +++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> @@ -194,7 +194,7 @@ static void drm_gem_shmem_test_vmap(struct kunit *test)
>   * scatter/gather table large enough to accommodate the backing memory
>   * is successfully exported.
>   */
> -static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
> +static void drm_gem_shmem_test_get_sg_table(struct kunit *test)
>  {
>  	struct drm_device *drm_dev = test->priv;
>  	struct drm_gem_shmem_object *shmem;
> @@ -236,7 +236,7 @@ static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
>   * backing pages are pinned and a scatter/gather table large enough to
>   * accommodate the backing memory is successfully exported.
>   */
> -static void drm_gem_shmem_test_get_sg_table(struct kunit *test)
> +static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
>  {
>  	struct drm_device *drm_dev = test->priv;
>  	struct drm_gem_shmem_object *shmem;
> @@ -366,8 +366,8 @@ static struct kunit_case drm_gem_shmem_test_cases[] = {
>  	KUNIT_CASE(drm_gem_shmem_test_obj_create_private),
>  	KUNIT_CASE(drm_gem_shmem_test_pin_pages),
>  	KUNIT_CASE(drm_gem_shmem_test_vmap),
> -	KUNIT_CASE(drm_gem_shmem_test_get_pages_sgt),
>  	KUNIT_CASE(drm_gem_shmem_test_get_sg_table),
> +	KUNIT_CASE(drm_gem_shmem_test_get_pages_sgt),
>  	KUNIT_CASE(drm_gem_shmem_test_madvise),
>  	KUNIT_CASE(drm_gem_shmem_test_purge),
>  	{}

