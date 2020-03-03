Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 371B9177382
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 11:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89EC6E4B5;
	Tue,  3 Mar 2020 10:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731A16E4B5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 10:10:35 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j11so2224390lfg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 02:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=2lBH94o2PcHIglkC8tdFIZftFpVYeorWUf+G12zJQW4=;
 b=DUixScdOTtavztb6NXfZUx6eofx4PGD5zfvUfbjB4CXGeLO7Ur0s8TwPkEOUgEXvPu
 Ts8rCS9f1rGO1mjaIpUl347NhBjVlbjwofGVA4Nm2NuY6YuUA9XZOXWcAJ/8LyaJDwD6
 o3tqXXJHeLh2zJQTfdGqYj6bYRPkfN7/yjk8bwym/+yQ2bBrjbOaWAomDYXHa5KS4LVE
 XyC4IUhWqzizPlK75qgJKhZquU6yLZkoasT6vhchjnbSCjcVupK5pNqwM6yI43/05uMB
 vDmwbIqhdDtSXyWvSPmEnBkBtQlQiRc9YU7QZ+Rc2g5WeMqpuDNZlS0ZZ3HowXz/pVlv
 n7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=2lBH94o2PcHIglkC8tdFIZftFpVYeorWUf+G12zJQW4=;
 b=ui7U4GujnIoGoORLf2YR7/264soTehFFjbfy9DoerMBHCDgl/mix80ODZAOpbzunom
 etoV3TWxLTwisj9vIr1F9EpO+50/J5vJmweVehwWwetFJhoAwksl+W+j79gXluZpJ+0R
 a/adEcV6RmQc1xl3Dfcki0vX9zZewaa72sUNpLiOX6zrNHn9LB7ALVMtc5TJDakNfB+o
 blzeleJNGVy9y9tHsLS2YqlaEmK+GsOjJwMjnfRphaAUA+LAAZF+sOnsBL8VXE3GZGMC
 MMUBfu4/gFYh95g8JtXoBH3+h6EJa//7IiCCOHc2GVwuTiHko2+s+AxskefzpAM1JwY1
 t6iQ==
X-Gm-Message-State: ANhLgQ0ghsq8v5J79aUWuZ1AwXXRUuj54Ksdxtf0UyGtMULvnbTpBxl4
 PtX/P5DOYAtS0ZNN5RqT0JQ=
X-Google-Smtp-Source: ADFU+vvCK/dhrA0HP90FSZ4H2gM/ZTfYDVGZI2QL86FFvhSRqOivBshJgAGF9V7MeYb1cB5n62gWKQ==
X-Received: by 2002:ac2:48b6:: with SMTP id u22mr2319457lfg.18.1583230233683; 
 Tue, 03 Mar 2020 02:10:33 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z1sm123878ljh.17.2020.03.03.02.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 02:10:33 -0800 (PST)
Date: Tue, 3 Mar 2020 12:10:29 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Message-ID: <20200303121029.5532669d@eldfell.localdomain>
In-Reply-To: <20200221090845.7397-2-narmstrong@baylibre.com>
References: <20200221090845.7397-1-narmstrong@baylibre.com>
 <20200221090845.7397-2-narmstrong@baylibre.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0998012869=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0998012869==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rszd0x.FOSs6mcQm0ZPJOpS"; protocol="application/pgp-signature"

--Sig_/rszd0x.FOSs6mcQm0ZPJOpS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Feb 2020 10:08:42 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> Amlogic uses a proprietary lossless image compression protocol and format
> for their hardware video codec accelerators, either video decoders or
> video input encoders.
>=20
> It considerably reduces memory bandwidth while writing and reading
> frames in memory.
>=20
> The underlying storage is considered to be 3 components, 8bit or 10-bit
> per component, YCbCr 420, single plane :
> - DRM_FORMAT_YUV420_8BIT
> - DRM_FORMAT_YUV420_10BIT
>=20
> This modifier will be notably added to DMA-BUF frames imported from the V=
4L2
> Amlogic VDEC decoder.
>=20
> At least two options are supported :
> - Scatter mode: the buffer is filled with a IOMMU scatter table referring
>   to the encoder current memory layout. This mode if more efficient in te=
rms
>   of memory allocation but frames are not dumpable and only valid during =
until
>   the buffer is freed and back in control of the encoder
> - Memory saving: when the pixel bpp is 8b, the size of the superblock can
>   be reduced, thus saving memory.
>=20
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 56 +++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d8..8a6e87bacadb 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -309,6 +309,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> +#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> =20
>  /* add more to the end as needed */
> =20
> @@ -804,6 +805,61 @@ extern "C" {
>   */
>  #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
> =20
> +/*
> + * Amlogic Video Framebuffer Compression modifiers
> + *
> + * Amlogic uses a proprietary lossless image compression protocol and fo=
rmat
> + * for their hardware video codec accelerators, either video decoders or
> + * video input encoders.
> + *
> + * It considerably reduces memory bandwidth while writing and reading
> + * frames in memory.
> + * Implementation details may be platform and SoC specific, and shared
> + * between the producer and the decoder on the same platform.

Hi,

after a lengthy IRC discussion on #dri-devel, this "may be platform and
SoC specific" is a problem.

It can be an issue in two ways:

- If something in the data acts like a sub-modifier, then advertising
  support for one modifier does not really tell if the data layout is
  supported or not.

- If you need to know the platform and/or SoC to be able to interpret
  the data, it means the modifier is ill-defined and cannot be used in
  inter-machine communication (e.g. Pipewire).

Neil mentioned the data contains a "header" that further specifies
things, but there is no specification about the header itself.
Therefore I don't think we can even know if the header contains
something that acts like a sub-modifier or not.

All this sounds like the modifier definitions here are not enough to
fully interpret the data. At the very least I would expect a reference
to a document explaining the "header", or even better, a kernel ReST
doc.

I wonder if this is at all suitable as a DRM format modifier as is. I
have been assuming that a modifier together with all the usual FB
parameters should be enough to interpret the stored data, but in this
case I have doubt it actually is.

I have no problem with proprietary data layouts as long as they are
fully specified.

I do feel like I would not be able to write a software decoder for this
set of modifiers given the details below.


Thanks,
pq

> + *
> + * The underlying storage is considered to be 3 components, 8bit or 10-b=
it
> + * per component YCbCr 420, single plane :
> + * - DRM_FORMAT_YUV420_8BIT
> + * - DRM_FORMAT_YUV420_10BIT
> + *
> + * The classic memory storage is composed of:
> + * - a body content organized in 64x32 superblocks with 4096 bytes per
> + *   superblock in default mode.
> + * - a 32 bytes per 128x64 header block
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_DEFAULT fourcc_mod_code(AMLOGIC, 0)
> +
> +/*
> + * Amlogic Video Framebuffer Compression Options
> + *
> + * Two optional features are available which may not supported/used on e=
very
> + * SoCs and Compressed Framebuffer producers.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __m=
odes)
> +
> +/*
> + * Amlogic FBC Scatter Memory layout
> + *
> + * Indicates the header contains IOMMU references to the compressed
> + * frames content to optimize memory access and layout.
> + * In this mode, only the header memory address is needed, thus the
> + * content memory organization is tied to the current producer
> + * execution and cannot be saved/dumped.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER	(1ULL << 0)
> +
> +/*
> + * Amlogic FBC Memory Saving mode
> + *
> + * Indicates the storage is packed when pixel size is multiple of word
> + * boudaries, i.e. 8bit should be stored in this mode to save allocation
> + * memory.
> + *
> + * This mode reduces body layout to 3072 bytes per 64x32 superblock and
> + * 3200 bytes per 64x32 superblock combined with scatter mode.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING	(1ULL << 1)
> +
>  #if defined(__cplusplus)
>  }
>  #endif


--Sig_/rszd0x.FOSs6mcQm0ZPJOpS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5eLRUACgkQI1/ltBGq
qqdL8xAAjMPK1D1qmrv9Tqdi/ZSw69SGwq6aCR6pDThCLT+q4CVDMg3fbMdA+Evy
4owhcCrMY+SsDWV8wksuyfJSanusmFQjnRz0eiU6gP/Nnp/AhoMw5R0mqePmRen2
XUN0CkTmbNQfaZtYnv3LkLG8/Azz/YPwx2V6iQ2LEbPScnxfsSEd4dvv0pdqynNw
czBQEKLEKDOtLWfS/W3xB8Etc1i+HgBS97vLllbQ1UtEt1L5Q5CU7ZrxdwM3+7XH
IM+uaBh9ud9sZJgyejAAU1e6FiD2KDkpI3A6VKMyhhBqMw8n+8Vo5kL878VvqfZO
ufAwE056wNelfhWuSCpu5zi5cKBs3z7BvS55jdDi+whyorgZAOflPxk3XllWhPby
YK/o5b8yPuL6WvZtYLjJNGx8skJrNpGfRDvpJqIS5803RofPRdYofB7JL45GjsNo
vxD6zDfb8k8jK2rbaWzlSfzklwj422Nw1wkz9qs6qIbzih1n5lOzcqqSJGyQW/mG
0liMnUqg2HvXFCFtvh1tNtO7eD6nI/pjSKaDatji/QPAHEkdYPVUlnWz1bWaweOV
Xd944KvyOIpfMo/RLlgGOKXKF2ego9QG6PeE/lPoxLvznKLui4s4YIwC4cGcqAGb
GZ9ZCw8A/wKOwOlRJwYmnT3eB9GPksMJPTsR/hVMCaNGmvVducM=
=CoFq
-----END PGP SIGNATURE-----

--Sig_/rszd0x.FOSs6mcQm0ZPJOpS--

--===============0998012869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0998012869==--
