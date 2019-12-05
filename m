Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F9811444F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 17:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A216E97F;
	Thu,  5 Dec 2019 16:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADA46E97F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 16:02:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a15so4231347wrf.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 08:02:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nvlgkH8NpKSoq6L696ietSAe4bPe2+1xH6SqDe2K108=;
 b=U1Q9FvTlHYYfGokNOebNSvjvd6AQRhd9JJiXjiQRpdZP2MmNtIXEvlcHB/wLQD6w5W
 nTUfycBTOsyyVBf25Hg9fp7JJT/tdsfPKO2kPV0qVUztfnXLe+xW8nGS2pZQEUgg9cHJ
 C/RlTuGf865luNOs04S/cMdHLpv44BxKRfL49nPcS+VC35xSgdx2OrfDE3zQiUJaeIG9
 nVOHyjNaCgWqje9/l27Mv9Bv+OYpoVjS94tlZ74lpDTSUGLVEhy/7zxr/bXFxN8JVHTm
 yGlJilejldiSHTZOPQnpT23kSq1FHezEtBvxNsscLHcvolpPUPDmrLUMiqE5DkDuePgH
 plhA==
X-Gm-Message-State: APjAAAW51OWM7mPw8Yf3adNOAya3Inw5uLF86QpsbwAXrRNYqOhrW2wI
 2d+/kGxHxH3hxbdGSKpou9k=
X-Google-Smtp-Source: APXvYqzSs6+Ql7bK8+Q1LEYtYxRemOW46Q9MiOPc3JdBAwIEzGNA/s963C5pMI1zB67+qI2rPJKbRA==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr10816164wrj.261.1575561751201; 
 Thu, 05 Dec 2019 08:02:31 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id v17sm12538873wrt.91.2019.12.05.08.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 08:02:29 -0800 (PST)
Date: Thu, 5 Dec 2019 17:02:24 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomc: Update docs around locking and commit
 sequencing
Message-ID: <20191205160224.GB1914185@ulmo>
References: <20191204100011.859468-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20191204100011.859468-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nvlgkH8NpKSoq6L696ietSAe4bPe2+1xH6SqDe2K108=;
 b=BosoUyByasCYag8xecJg+ifgspGj60S0Ghx11SoYMmVd2G7BSiNabVInl3qGaNhKiT
 21DTpFfsZj5b/0DIvioBDgO2a9yW55XIqdv+HXd8vWX8cBfygc71/q85IR+guNxhS/fO
 9p3679G7cdflXEVJ1/2wZ4ZCEE7jPcmr63HdnMXQ5sJxwSiBpE53DoV5KQHHcHT7X7rY
 Q7zAm4gN+9PdvLLYvD40rp9Vk48BNrpGhbzkq8cOxa+bypE04sk4IQGcb8Y+fWzoqWo+
 mtLVRYTptz5IxYJ47wZNEzFlfs5DRtQjRhVECA0RrKDeXDcqHZLCl1LWiG4ZjWxnXaMU
 GKnQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Thierry Reding <treding@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1180370876=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1180370876==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2019 at 11:00:11AM +0100, Daniel Vetter wrote:
> Both locking and especially sequencing of nonblocking commits have
> evolved a lot. The details are all there, but I noticed that the big
> picture and connections have fallen behind a bit. Apply polish.
>=20
> Motivated by some review discussions with Thierry.
>=20
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/drm-kms.rst       | 11 ++++++-
>  drivers/gpu/drm/drm_atomic.c        | 10 ++++---
>  drivers/gpu/drm/drm_atomic_helper.c | 46 ++++++++++++++++++-----------
>  include/drm/drm_atomic.h            | 13 ++++++--
>  4 files changed, 56 insertions(+), 24 deletions(-)

Hi Daniel,

"drm/atomic" in the subject. A couple more minor things I noticed below.

>=20
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index c68588ce4090..b9330343d1bc 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -260,7 +260,8 @@ Taken all together there's two consequences for the a=
tomic design:
>    drm_connector_state <drm_connector_state>` for connectors. These are t=
he only
>    objects with userspace-visible and settable state. For internal state =
drivers
>    can subclass these structures through embeddeding, or add entirely new=
 state
> -  structures for their globally shared hardware functions.
> +  structures for their globally shared hardware functions, see :c:type:`=
struct
> +  drm_private_state<drm_private_state>`.
> =20
>  - An atomic update is assembled and validated as an entirely free-standi=
ng pile
>    of structures within the :c:type:`drm_atomic_state <drm_atomic_state>`
> @@ -269,6 +270,14 @@ Taken all together there's two consequences for the =
atomic design:
>    to the driver and modeset objects. This way rolling back an update boi=
ls down
>    to releasing memory and unreferencing objects like framebuffers.
> =20
> +Locking of atomic state structures is internally using :c:type:`struct
> +drm_modeset_lock <drm_modeset_lock>`. As a general rule the locking shou=
ldn't be
> +exposed to drivers, instead the right locks should be automatically acqu=
ired by
> +any function that duplicates or peeks into a state, like e.g.
> +:c:func:`drm_atomic_get_crtc_state()`.  Locking only protects the softwa=
re data
> +structure, ordering of committing state changes to hardware is sequenced=
 using
> +:c:type:`struct drm_crtc_commit <drm_crtc_commit>`.
> +
>  Read on in this chapter, and also in :ref:`drm_atomic_helper` for more d=
etailed
>  coverage of specific topics.
> =20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index a351a9a39530..5b4787e33f0d 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -688,10 +688,12 @@ static void drm_atomic_plane_print_state(struct drm=
_printer *p,
>   * associated state struct &drm_private_state.
>   *
>   * Similar to userspace-exposed objects, private state structures can be
> - * acquired by calling drm_atomic_get_private_obj_state(). Since this fu=
nction
> - * does not take care of locking, drivers should wrap it for each type of
> - * private state object they have with the required call to drm_modeset_=
lock()
> - * for the corresponding &drm_modeset_lock.
> + * acquired by calling drm_atomic_get_private_obj_state(). This also tak=
es care
> + * of locking, hence drivers should not have a need to call drm_modeset_=
lock()
> + * directly. Sequence of the actual hardware state commit is not handled,
> + * drivers might need to keep track of struct drm_crtc_commit within sub=
classed
> + * structure of &drm_private_state as necessary, e.g. similar to
> + * &drm_plane_state.commit. See also &drm_atomic_state.fake_commit.
>   *
>   * All private state structures contained in a &drm_atomic_state update =
can be
>   * iterated using for_each_oldnew_private_obj_in_state(),
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 711801b9d4f1..10d62f726b22 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1827,17 +1827,21 @@ EXPORT_SYMBOL(drm_atomic_helper_commit);
>  /**
>   * DOC: implementing nonblocking commit
>   *
> - * Nonblocking atomic commits have to be implemented in the following se=
quence:
> + * Nonblocking atomic commits should use struct &drm_crtc_commit to sequ=
ence
> + * different operations against each another. Locks, especially struct
> + * &drm_modeset_lock, should not be held in worker threads or any other
> + * asynchronous context used to commit the hardware state.
>   *
> - * 1. Run drm_atomic_helper_prepare_planes() first. This is the only fun=
ction
> - * which commit needs to call which can fail, so we want to run it first=
 and
> + * drm_atomic_helper_commit() implements the recommended sequence for
> + * nonblocking commits, using drm_atomic_helper_setup_commit() internall=
y:
> + *
> + * 1. Run drm_atomic_helper_prepare_planes(). Since this can fail and we
> + * need to propagate out of memory/VRAM errors to userspace, it must be =
called
>   * synchronously.
>   *
>   * 2. Synchronize with any outstanding nonblocking commit worker threads=
 which
> - * might be affected the new state update. This can be done by either ca=
ncelling
> - * or flushing the work items, depending upon whether the driver can dea=
l with
> - * cancelled updates. Note that it is important to ensure that the frame=
buffer
> - * cleanup is still done when cancelling.
> + * might be affected the new state update. This is handled by

"affected _by_ the new state update"?

> + * drm_atomic_helper_setup_commit().
>   *
>   * Asynchronous workers need to have sufficient parallelism to be able t=
o run
>   * different atomic commits on different CRTCs in parallel. The simplest=
 way to
> @@ -1848,21 +1852,29 @@ EXPORT_SYMBOL(drm_atomic_helper_commit);
>   * must be done as one global operation, and enabling or disabling a CRT=
C can
>   * take a long time. But even that is not required.
>   *
> + * IMPORTANT: A &drm_atomic_state update for multiple CRTCs is sequenced
> + * against all CRTCs therein. Therefor for atomic state updates which on=
ly flip

I think "therefor" has a slightly different meaning than "therefore",
and I think you actually want the latter in this case.

> + * planes the driver must not get the struct &drm_crtc_state of unrelate=
d CRTCs
> + * in its atomic check codee: This would prevent committing of atomic up=
dates to

"code"

> + * multiple CRTCs in parallel. In general, adding additional state struc=
tures
> + * should be avoided as much as possible, because this reduces parallism=
 in

"parallelism"

> + * (nonblocking) commits, both due to locking and due to commit sequenci=
ng
> + * requirements.
> + *
>   * 3. The software state is updated synchronously with
>   * drm_atomic_helper_swap_state(). Doing this under the protection of al=
l modeset
> - * locks means concurrent callers never see inconsistent state. And doin=
g this
> - * while it's guaranteed that no relevant nonblocking worker runs means =
that
> - * nonblocking workers do not need grab any locks. Actually they must no=
t grab
> - * locks, for otherwise the work flushing will deadlock.
> + * locks means concurrent callers never see inconsistent state. Note tha=
t commit
> + * workers do not hold any locks, their access is only coordinated throu=
gh

I stumbled across this a couple of times when reading it. I think it
becomes clearer when you replace the comma by a colon:

	Note that commit workers do not hold any locks: their access is only
	coordinated through ordering.

Or perhaps replace the comma with "and"?

Other than that, looks good to me:

Reviewed-by: Thierry Reding <treding@nvidia.com>

> + * ordering. If workers would access state only through the pointers in =
the
> + * free-standing state objects (currently not the case for any driver) t=
hen even
> + * multiple pending commits could be in-flight at the same time.
>   *
>   * 4. Schedule a work item to do all subsequent steps, using the split-o=
ut
>   * commit helpers: a) pre-plane commit b) plane commit c) post-plane com=
mit and
>   * then cleaning up the framebuffers after the old framebuffer is no lon=
ger
> - * being displayed.
> - *
> - * The above scheme is implemented in the atomic helper libraries in
> - * drm_atomic_helper_commit() using a bunch of helper functions. See
> - * drm_atomic_helper_setup_commit() for a starting point.
> + * being displayed. The scheduled work should synchronize against other =
workers
> + * using the &drm_crtc_commit infrastructure as needed. See
> + * drm_atomic_helper_setup_commit() for more details.
>   */
> =20
>  static int stall_checks(struct drm_crtc *crtc, bool nonblock)
> @@ -2085,7 +2097,7 @@ EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
>   *
>   * This function waits for all preceeding commits that touch the same CR=
TC as
>   * @old_state to both be committed to the hardware (as signalled by
> - * drm_atomic_helper_commit_hw_done) and executed by the hardware (as si=
gnalled
> + * drm_atomic_helper_commit_hw_done()) and executed by the hardware (as =
signalled
>   * by calling drm_crtc_send_vblank_event() on the &drm_crtc_state.event).
>   *
>   * This is part of the atomic helper support for nonblocking commits, see
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index b6c73fd9f55a..5923819dcd68 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -60,8 +60,8 @@
>   * 	wait for flip_done		<----
>   * 	clean up atomic state
>   *
> - * The important bit to know is that cleanup_done is the terminal event,=
 but the
> - * ordering between flip_done and hw_done is entirely up to the specific=
 driver
> + * The important bit to know is that &cleanup_done is the terminal event=
, but the
> + * ordering between &flip_done and &hw_done is entirely up to the specif=
ic driver
>   * and modeset state change.
>   *
>   * For an implementation of how to use this look at
> @@ -92,6 +92,9 @@ struct drm_crtc_commit {
>  	 * commit is sent to userspace, or when an out-fence is singalled. Note
>  	 * that for most hardware, in most cases this happens after @hw_done is
>  	 * signalled.
> +	 *
> +	 * Completion of this stage is signalled implicitly by calling
> +	 * drm_crtc_send_vblank_event() on &drm_crtc_state.event.
>  	 */
>  	struct completion flip_done;
> =20
> @@ -107,6 +110,9 @@ struct drm_crtc_commit {
>  	 * Note that this does not need to include separately reference-counted
>  	 * resources like backing storage buffer pinning, or runtime pm
>  	 * management.
> +	 *
> +	 * Drivers should call drm_atomic_helper_commit_hw_done() to signal
> +	 * completion of this stage.
>  	 */
>  	struct completion hw_done;
> =20
> @@ -118,6 +124,9 @@ struct drm_crtc_commit {
>  	 * a vblank wait completed it might be a bit later. This completion is
>  	 * useful to throttle updates and avoid hardware updates getting ahead
>  	 * of the buffer cleanup too much.
> +	 *
> +	 * Drivers should call drm_atomic_helper_commit_cleanup_done() to signal
> +	 * completion of this stage.
>  	 */
>  	struct completion cleanup_done;
> =20
> --=20
> 2.24.0
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3pKg0ACgkQ3SOs138+
s6FUqhAAsnl/+lGvNugV2T0vlCNWf8jcBNwZLs8jzKYg9SKiOkYVh3XPyALPAMms
G5LgARUQTK8tsukQKUYdjIEwVJhiynTzLlTq/89sucZQf//2kjM050LR1oJFB2PQ
SPFFJz00a1fCO8rBMDLetQktzKwkIp6pIvAVEkKe/s80YQOCghd301A/xgux1kGf
z70MTqsgVqMmWS225zQtfHPw9duvPx/C8fiyUCG36O2T2J1UZGGeZSVCAOvFKGn/
GjVXAUy7Xkr6xg/JY6VMmue0Rnes/XFHaKChiXhn/ZqBNsElFdm+1M19aWpcrF9w
4ThOTOb5mblM/DLq8zubEOM2tCkeNmOoMvSadSMNNQxIXhLnx02SkilFUzvzuUBk
tRTe/TliMKAGAfCcmDoMiQqPCP+2AOnoGGry3viUj9xzzFKb0GKlK97IGKytj2N0
cHA4Ii48OBOpLR0H1xoqpbfY6DOUjgiE3gPDl3HmmeX+zQFTFCaKnPtXj1iGVHRL
7neSk8ZM1CV75H+Af7ofEguKmat1JNP4e1bJ2WG+nQ+Jf7yIOvPNguDUgXfsz9mh
DVUuVDk3Atdg36C42oihN16C8EmASbU8gdcBNdGreiGurg3CvJGD70VhR67UIelH
bDlQHXTrTpHsyE1cTd0f8G4v+Vya1j5En08UM60JLAXPSiUvi+Y=
=UVC1
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--

--===============1180370876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1180370876==--
