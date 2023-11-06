Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F737E25FA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B9B10E31F;
	Mon,  6 Nov 2023 13:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5D710E31F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 13:46:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E2200CE0B89;
 Mon,  6 Nov 2023 13:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB78CC433C7;
 Mon,  6 Nov 2023 13:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699278403;
 bh=UMo9qYG9JxxpGt1tXwkBsURejlZe7ea1mXalWt6sYSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vqlzg33ro2BWfJXpbHrXhNe2CcU6yPcQ59eO5vWnH8tzEqBPoVQfmfs3ZSKKv5zhY
 4gVLTMGsua0PRJdMWWfG9QXKXAURFAiJE9/RskqdWwsMfNbtPvE/tP5faIUXRMN2aa
 cbYOcN82xmcl5udNag2AzoAwvBNHtfTjZVEIhOAa0PvXh0r5iX2qN36hY33XRPPy0f
 4W8J+q+mWqoUxe4IWx3AJ1bJM1RlIuJ7yq02T26hiUxU0opRhYR/IhKoCIzAxgVq+h
 ui4qPeM/I56ocswP62wnegNhcHzo2XITTbl3k0CV5hcIJE1XLJ92jWAzqmaYu7M4l0
 ZthyR6pinmgBQ==
Date: Mon, 6 Nov 2023 14:46:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marco Pagani <marpagan@redhat.com>
Subject: Re: [RFC PATCH] drm/test: add a test suite for GEM objects backed by
 shmem
Message-ID: <ju7huixzwdjoz2jvnhdwc3mxrrbm7uvj73wezbpedcossijgi6@3la34kfiaval>
References: <20231023164541.92913-1-marpagan@redhat.com>
 <zakappnhljtx3axi2ovvis3evhju4cwqrena7j6gqn5kjdjtsb@mgrhkn5oboid>
 <789aaf2b-4d68-4128-b8ff-c1ba4849e141@redhat.com>
 <bychwi46hiqd34ch2f2ikvcijnq3hxvqudycsja5mawng46gyx@cq7wwxozv4si>
 <3e32dbc2-c93f-45a1-a872-4e1798141a70@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o32cap6w7m6manzj"
Content-Disposition: inline
In-Reply-To: <3e32dbc2-c93f-45a1-a872-4e1798141a70@redhat.com>
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
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Christian Koenig <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--o32cap6w7m6manzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 11:58:20AM +0100, Marco Pagani wrote:
> On 2023-10-25 10:43, Maxime Ripard wrote:
> > On Tue, Oct 24, 2023 at 07:14:25PM +0200, Marco Pagani wrote:
> >>>> +static void drm_gem_shmem_test_obj_create_private(struct kunit *tes=
t)
> >>>> +{
> >>>> +	struct fake_dev *fdev =3D test->priv;
> >>>> +	struct drm_gem_shmem_object *shmem;
> >>>> +	struct drm_gem_object *gem_obj;
> >>>> +	struct dma_buf buf_mock;
> >>>> +	struct dma_buf_attachment attach_mock;
> >>>> +	struct sg_table *sgt;
> >>>> +	char *buf;
> >>>> +	int ret;
> >>>> +
> >>>> +	/* Create a mock scatter/gather table */
> >>>> +	buf =3D kunit_kzalloc(test, TEST_SIZE, GFP_KERNEL);
> >>>> +	KUNIT_ASSERT_NOT_NULL(test, buf);
> >>>> +
> >>>> +	sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
> >>>> +	KUNIT_ASSERT_NOT_NULL(test, sgt);
> >>>> +
> >>>> +	ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> >>>> +	KUNIT_ASSERT_EQ(test, ret, 0);
> >>>> +	sg_init_one(sgt->sgl, buf, TEST_SIZE);
> >>>> +
> >>>> +	/* Init a mock DMA-BUF */
> >>>> +	buf_mock.size =3D TEST_SIZE;
> >>>> +	attach_mock.dmabuf =3D &buf_mock;
> >>>> +
> >>>> +	gem_obj =3D drm_gem_shmem_prime_import_sg_table(&fdev->drm_dev, &a=
ttach_mock, sgt);
> >>>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gem_obj);
> >>>> +	KUNIT_ASSERT_EQ(test, gem_obj->size, TEST_SIZE);
> >>>> +	KUNIT_ASSERT_NULL(test, gem_obj->filp);
> >>>> +	KUNIT_ASSERT_NOT_NULL(test, gem_obj->funcs);
> >>>> +
> >>>> +	shmem =3D to_drm_gem_shmem_obj(gem_obj);
> >>>> +	KUNIT_ASSERT_PTR_EQ(test, shmem->sgt, sgt);
> >>>> +
> >>>> +	/* The scatter/gather table is freed by drm_gem_shmem_free */
> >>>> +	drm_gem_shmem_free(shmem);
> >>>> +}
> >>>
> >>> KUNIT_ASSERT_* will stop the execution of the test on failure, you
> >>> should probably use a bit more of KUNIT_EXPECT_* calls otherwise you'=
ll
> >>> leak resources.
> >>>
> >>> You also probably want to use a kunit_action to clean up and avoid th=
at
> >>> whole discussion
> >>>
> >>
> >> You are right. I slightly prefer using KUnit expectations (unless acti=
ons
> >> are strictly necessary) since I feel using actions makes test cases a =
bit
> >> less straightforward to understand. Is this okay for you?
> >=20
> > I disagree. Actions make it easier to reason about, even when comparing
> > assertion vs expectation
> >=20
> > Like, for the call to sg_alloc_table and
> > drm_gem_shmem_prime_import_sg_table(), the reasonable use of assert vs
> > expect would be something like:
> >=20
> > sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
> > KUNIT_ASSERT_NOT_NULL(test, sgt);
> >=20
> > ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > KUNIT_ASSERT_EQ(test, ret, 0);
> >=20
> > /*
> >  * Here, it's already not super clear whether you want to expect vs
> >  * assert. expect will make you handle the failure case later, assert w=
ill
> >  * force you to call kfree on sgt. Both kind of suck in their own ways.
> >  */
> >=20
> > sg_init_one(sgt->sgl, buf, TEST_SIZE);
> >=20
> > gem_obj =3D drm_gem_shmem_prime_import_sg_table(&fdev->drm_dev, &attach=
_mock, sgt);
> > KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gem_obj);
> >=20
> > /*
> >  * If the assert fails, we forgot to call sg_free_table(sgt) and kfree(=
sgt).
> >  */
> >=20
> > KUNIT_EXPECT_EQ(test, gem_obj->size, TEST_SIZE);
> > KUNIT_EXPECT_NULL(test, gem_obj->filp);
> > KUNIT_EXPECT_NOT_NULL(test, gem_obj->funcs);
> >=20
> > /*
> >  * And here we have to handle the case where the expectation was wrong,
> >  * but the test still continued.
> >  */
> >=20
> > But if you're not using an action, you still have to call kfree(sgt),
> > which means that you might still
> >=20
> > shmem =3D to_drm_gem_shmem_obj(gem_obj);
> > KUNIT_ASSERT_PTR_EQ(test, shmem->sgt, sgt);
> >=20
> > /*
> >  * If the assertion fails, we now have to call drm_gem_shmem_free(shmem)
> >  */
> >=20
> > /* The scatter/gather table is freed by drm_gem_shmem_free */
> > drm_gem_shmem_free(shmem);
> >=20
> > /* everything's fine now */
> >=20
> > The semantics around drm_gem_shmem_free make it a bit convoluted, but
> > doing it using goto/labels, plus handling the assertions and error
> > reporting would be difficult.
> >=20
> > Using actions, we have:
> >=20
> > sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
> > KUNIT_ASSERT_NOT_NULL(test, sgt);
> >=20
> > ret =3D kunit_add_action_or_reset(test, kfree_wrapper, sgt);
> > KUNIT_ASSERT_EQ(test, ret, 0);
> >=20
> > ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > KUNIT_ASSERT_EQ(test, ret, 0);
> >=20
> > ret =3D kunit_add_action_or_reset(test, sg_free_table_wrapper, sgt);
> > KUNIT_ASSERT_EQ(test, ret, 0);
> >=20
> > sg_init_one(sgt->sgl, buf, TEST_SIZE);
> >=20
> > gem_obj =3D drm_gem_shmem_prime_import_sg_table(&fdev->drm_dev, &attach=
_mock, sgt);
> > KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gem_obj);
> > KUNIT_EXPECT_EQ(test, gem_obj->size, TEST_SIZE);
> > KUNIT_EXPECT_NULL(test, gem_obj->filp);
> > KUNIT_EXPECT_NOT_NULL(test, gem_obj->funcs);
> >=20
> > /* drm_gem_shmem_free will free the struct sg_table itself */
> > kunit_remove_action(test, sg_free_table_wrapper, sgt);
> > kunit_remove_action(test, kfree_wrapper, sgt);
>=20
> I agree that using actions makes error handling cleaner. However, I still
> have some concerns about the additional complexity that actions introduce.
> For instance, I feel these two lines make the testing harness more complex
> without asserting any additional property of the component under test.=20

If anything, the API makes it more difficult to deal with. It would
actually be harder/messier to handle without an action.

> In some sense, I wonder if it is worth worrying about memory leaks when
> a test case fails. At that point, the system is already in an inconsistent
> state due to a bug in the component under test, so it is unsafe to contin=
ue
> anyway.

I guess the larger issue is: once that code will be merged, we're going
to have patches to convert to actions because they make it nicer and fix
a couple of issues anyway.

So, if it's still the state we're going to end up in, why not doing it
right from the beginning?

Maxime

--o32cap6w7m6manzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUjuQAAKCRDj7w1vZxhR
xZIUAP4nxKW5nlbzzvyXfNDLXwSOCafaX8ziFwHyO6uOpAaQ/wD/ahMbjKTpWtAv
lSr9PJJaR+rJk7pnvNB14wMm6Ud7owo=
=9b+7
-----END PGP SIGNATURE-----

--o32cap6w7m6manzj--
