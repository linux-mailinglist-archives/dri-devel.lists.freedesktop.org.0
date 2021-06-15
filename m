Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3903A77B4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 09:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34B16E182;
	Tue, 15 Jun 2021 07:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109426E182;
 Tue, 15 Jun 2021 07:10:37 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s22so23570025ljg.5;
 Tue, 15 Jun 2021 00:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=GgowLPOR+RXWuxl1Kqlx9KFwgkDLT8onrt6cQOK+tpU=;
 b=FkZKkQrSjBeMzl5fdJc/zRmkoPuZGInGAewHDeGVB8BTzTYGUPxVUcBX6KU6KQpg1g
 TUaodvUbXZ/R9zRIaGqclaHfDU0TT6qNSeIWGES9nOX/0fGGjJI68oyLMTu+xArKnlbv
 DKlGZsVfxnYpDwA3Z+gmpyJbpFAPT56xTSHiOaZPeAHpowVSiG7zsVF9j4VVquEhmo/m
 NItdjV+efWl0ER6jKE4G1Ov+Yr0fFdbrL/c9bqoYSu8BQHx04BDvI/5BqFmIWpBnqVT0
 cGqsOPjjHqjYZIc5viyUG/Aqw/ilQXXqW3gcLjuDD57SQR9cNZ+uqt9MOU5Uye2OtXNF
 m0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=GgowLPOR+RXWuxl1Kqlx9KFwgkDLT8onrt6cQOK+tpU=;
 b=BS8WxWvKFu4GAAxqm7Whu6m3S6Okp2F5uJvks0rVpbanLceIxIDP72PTgXsVb0wsrl
 NTmCsCzbHhBVnGOPD8+/vyZ8W8SAmiZqlIydrvMKKcYad/k7VDZJfarbJD7k6kOtNUEw
 HVzVMHIe/vayVDhHyc8Kseq85RPJ4mei/MEhBFOVWLxCkoZx0OAz1UGMRsbdR10Y/doW
 UDsXqyZtiDHgX/ovBz5ID8yER5DpLzU7Jkssxa3xuR4u+aeIEEzkFoldxoU+Q++/HpKb
 w59AlRebZluzdLP48mVCreeUthWBbw7xiOlrZjS5mdrTNa6IgSwDu1bI3JAEXfLlMkb1
 FusA==
X-Gm-Message-State: AOAM530G3RlW2g2GKBv8Ntr55TlwrBigyim404A+0s9EaDQQQjF3DTIC
 BxJv5FweSY9lIH+daTHyoF0=
X-Google-Smtp-Source: ABdhPJwNFjxzY6l2gyV7Of5lAR90kMH3Bo+Mt5siZzPZTvyQeN2Rf65Xse0SDCVGhieTqMm6RlMyQA==
X-Received: by 2002:a2e:9194:: with SMTP id f20mr16234145ljg.373.1623741035389; 
 Tue, 15 Jun 2021 00:10:35 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d23sm1705500lfe.183.2021.06.15.00.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 00:10:35 -0700 (PDT)
Date: Tue, 15 Jun 2021 10:10:32 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 3/6] dma-buf: Document DMA_BUF_IOCTL_SYNC (v2)
Message-ID: <20210615101032.51bd5ac2@eldfell>
In-Reply-To: <20210610211442.643307-1-jason@jlekstrand.net>
References: <20210610210925.642582-4-jason@jlekstrand.net>
 <20210610211442.643307-1-jason@jlekstrand.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j7jSXYhb9xgTdXUHj.Ogj1h"; protocol="application/pgp-signature"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/j7jSXYhb9xgTdXUHj.Ogj1h
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Jun 2021 16:14:42 -0500
Jason Ekstrand <jason@jlekstrand.net> wrote:

> This adds a new "DMA Buffer ioctls" section to the dma-buf docs and adds
> documentation for DMA_BUF_IOCTL_SYNC.
>=20
> v2 (Daniel Vetter):
>  - Fix a couple typos
>  - Add commentary about synchronization with other devices
>  - Use item list format for describing flags
>=20
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> ---
>  Documentation/driver-api/dma-buf.rst |  8 +++++
>  include/uapi/linux/dma-buf.h         | 46 +++++++++++++++++++++++++++-
>  2 files changed, 53 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-=
api/dma-buf.rst
> index 7f21425d9435a..0d4c13ec1a800 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -88,6 +88,9 @@ consider though:
>  - The DMA buffer FD is also pollable, see `Implicit Fence Poll Support`_=
 below for
>    details.
> =20
> +- The DMA buffer FD also supports a few dma-buf-specific ioctls, see
> +  `DMA Buffer ioctls`_ below for details.
> +
>  Basic Operation and Device DMA Access
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =20
> @@ -106,6 +109,11 @@ Implicit Fence Poll Support
>  .. kernel-doc:: drivers/dma-buf/dma-buf.c
>     :doc: implicit fence polling
> =20
> +DMA Buffer ioctls
> +~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: include/uapi/linux/dma-buf.h
> +
>  Kernel Functions and Structures Reference
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =20
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 7f30393b92c3b..1c131002fe1ee 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -22,8 +22,52 @@
> =20
>  #include <linux/types.h>
> =20
> -/* begin/end dma-buf functions used for userspace mmap. */
> +/**
> + * struct dma_buf_sync - Synchronize with CPU access.
> + *
> + * When a DMA buffer is accessed from the CPU via mmap, it is not always
> + * possible to guarantee coherency between the CPU-visible map and under=
lying
> + * memory.  To manage coherency, DMA_BUF_IOCTL_SYNC must be used to brac=
ket
> + * any CPU access to give the kernel the chance to shuffle memory around=
 if
> + * needed.
> + *
> + * Prior to accessing the map, the client must call DMA_BUF_IOCTL_SYNC
> + * with DMA_BUF_SYNC_START and the appropriate read/write flags.  Once t=
he
> + * access is complete, the client should call DMA_BUF_IOCTL_SYNC with
> + * DMA_BUF_SYNC_END and the same read/write flags.
> + *
> + * The synchronization provided via DMA_BUF_IOCTL_SYNC only provides cac=
he
> + * coherency.  It does not prevent other processes or devices from
> + * accessing the memory at the same time.  If synchronization with a GPU=
 or
> + * other device driver is required, it is the client's responsibility to
> + * wait for buffer to be ready for reading or writing.

... before calling this ioctl.

Maybe that would be worthwhile to add?

Likewise, submit follow-up work to GPU et al. only after calling this
ioctl with SYNC_END?

Anyway, looks nice to me.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

>  If the driver or
> + * API with which the client is interacting uses implicit synchronizatio=
n,
> + * this can be done via poll() on the DMA buffer file descriptor.  If the
> + * driver or API requires explicit synchronization, the client may have =
to
> + * wait on a sync_file or other synchronization primitive outside the sc=
ope
> + * of the DMA buffer API.
> + */
>  struct dma_buf_sync {
> +	/**
> +	 * @flags: Set of access flags
> +	 *
> +	 * DMA_BUF_SYNC_START:
> +	 *     Indicates the start of a map access session.
> +	 *
> +	 * DMA_BUF_SYNC_END:
> +	 *     Indicates the end of a map access session.
> +	 *
> +	 * DMA_BUF_SYNC_READ:
> +	 *     Indicates that the mapped DMA buffer will be read by the
> +	 *     client via the CPU map.
> +	 *
> +	 * DMA_BUF_SYNC_WRITE:
> +	 *     Indicates that the mapped DMA buffer will be written by the
> +	 *     client via the CPU map.
> +	 *
> +	 * DMA_BUF_SYNC_RW:
> +	 *     An alias for DMA_BUF_SYNC_READ | DMA_BUF_SYNC_WRITE.
> +	 */
>  	__u64 flags;
>  };
> =20


--Sig_/j7jSXYhb9xgTdXUHj.Ogj1h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDIUmgACgkQI1/ltBGq
qqf7Dw//Q4gjwMQcrS9Vj2KgFXsK8uFaOCmkGZKfUxHrn3nMnenPxkMh1uC/vyr5
GlNtYIH1kVQpeAnCKns/Qed64+hMEmihUkxSqqzs40y3GSM02JcXe/vo8tH2uriH
eOrG76XfH2MKCxQsd6Vtfwgqc332v/G5BiY1gI8L0LN/mMiUmqCadyosWACk5kkf
aT+fDV5r6IPRi+IHEYLLKdvui0GsUlccntnuQe+iZPvt14GYW5/aO8s5PnSscpSK
awsUfXJE8GmL+X9dDHFEdUXr4bJ3QmfofARWkyCSeJnBF4u3yCcJORVMNb1BJUGQ
ooc1c6wMKe39I04RWaDwzMiTKeQSeLvqfmudEZeQMH9uiCkC2aKHUddFtwfbzcaj
7kIB1Xgw1eiiYjOVFI90z4ABwHtQTiz3RVq9m9veehbDZy7rYPI5EyUyD8jOLqUE
5pOck3NY0g11AKTqAEJQdrmKHwL+bINRg4roEQaOqzfA0BiULqf0GGSlAvu4Q6Uq
gyAHDEOTK1HXlA9Zw43J+q2RNqofLD2B7JHpOORXIYR2BDCZtnJvm5FDieuIGxWo
+vRF/o6fcEabFGZUcqN19VgLRx+Gsy0ZlQx82Vrk7bZB3jzPN0/ynPy2BFM34x3X
mNKzYAh8Pg/1B3EdSlDqDw1H7cyTeBizI4NymPEw/IbWRsPrjlc=
=oa9Q
-----END PGP SIGNATURE-----

--Sig_/j7jSXYhb9xgTdXUHj.Ogj1h--
