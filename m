Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B6837514A
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 11:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233826E07D;
	Thu,  6 May 2021 09:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBAB6E07D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 09:10:08 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y9so6137743ljn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 02:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=JG0NcmrHvg55uIFapRbNjSc/87uOvJ7IX0rCuIjZLak=;
 b=WtURWdhM56qoorIauo/wzyIfkAaM4cymkOsQ240VRm5fKlwiMewWa2FjEQwjdR62W6
 mMt/NxCkv461AjSF9zFWR5oBmSnGWbMtnogmqCN/0/jzufaNbC6ZoO4rEAmlu3q47jec
 Sx1E1XWinjMlFEhztUzLpk7XJrd2+MmH7++a7hrrUx311xGMrtczMcIjffoVB14VZPfH
 /shkcSs1MJSGYQblXqTeSC3CRTa6LDqQ2w68tUjagglpwfbMUeK/5enlVnuQOR/hAGud
 r5JGzpxUBPsyPciL1I/JJiv5MVG80ck/U5sIehQ658pF5xYbJwc4XsdXwrui9vlmI2/V
 5LnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=JG0NcmrHvg55uIFapRbNjSc/87uOvJ7IX0rCuIjZLak=;
 b=WfeuSKhT/YF7BRx9NdRvjY4pDM+mLIUr/ZL/kbtQ1QbjfosSko/gt4kK2bk4uPTNZf
 l1Q6bmuQDZmoMHjiTFqcgOvbIXyNKdcIXnfXW17PCi66fGKxVEFJnL1e6bSEgiE3IcaJ
 nHCR2q5Q3VwDs8hvyOZnSuvos8Y53eMNmq6Blo6DsTJFYXYxffY0h0kqzbIpSnKehLTX
 JCOWzkd2bcKS5l3+vC7A5axl/SfArMYafx86tRGXEkWb8bWnBKDnWuNa/dr/UWGb5Tf8
 7ZRdbNuHzF6CJ54+RxzIOvu0aPn2vCZBW94LpF+RtDqW9JgEmkIcD3TINYv3EdaOq9zd
 h+ig==
X-Gm-Message-State: AOAM530Nrfh4KWBd6oV7pKUCoPG21lD5AwkUk4YQA9cJXbTo8ZMf6XHu
 Z5R6FYjpv9u2M+RdLNK7HG0=
X-Google-Smtp-Source: ABdhPJxyifDg2K+zN6pp35deluxXT1k0C3REPvRxDN3J6ur/0Tb4ymf0nWsLnlyqgfWGzCElyLJtwg==
X-Received: by 2002:a2e:894e:: with SMTP id b14mr2600364ljk.170.1620292207021; 
 Thu, 06 May 2021 02:10:07 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z39sm527237lfu.35.2021.05.06.02.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 02:10:06 -0700 (PDT)
Date: Thu, 6 May 2021 12:10:03 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH 2/2] drm/doc: document drm_mode_get_plane
Message-ID: <20210506121003.4ab918bb@eldfell>
In-Reply-To: <20210428213651.55467-3-leandro.ribeiro@collabora.com>
References: <20210428213651.55467-1-leandro.ribeiro@collabora.com>
 <20210428213651.55467-3-leandro.ribeiro@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gkOWdlWSq/5LlZtvL9fPJZ."; protocol="application/pgp-signature"
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/gkOWdlWSq/5LlZtvL9fPJZ.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Apr 2021 18:36:51 -0300
Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:

> Add a small description and document struct fields of
> drm_mode_get_plane.
>=20
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>

Hi,

thanks a lot for revising these.

> ---
>  include/uapi/drm/drm_mode.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index a5e76aa06ad5..8fa6495cd948 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -312,16 +312,38 @@ struct drm_mode_set_plane {
>  	__u32 src_w;
>  };
>=20
> +/**
> + * struct drm_mode_get_plane - Get plane metadata.
> + *
> + * Userspace can perform a GETPLANE ioctl to retrieve information about a
> + * plane.
> + */
>  struct drm_mode_get_plane {
> +	/** @plane_id: Object ID of the plane. */

This is an "in" field, right?

"in" meaning that userspace sets it to the ID of the plane it wants
information on.

"out" field is a field written by the kernel as a response.

I'm not sure if the kernel has a habit of documenting these, because we
use libdrm to abstract this so users do not need to care, but I think
it would be nice.

>  	__u32 plane_id;
>=20
> +	/** @crtc_id: Object ID of the current CRTC. */
>  	__u32 crtc_id;
> +	/** @fb_id: Object ID of the current fb. */
>  	__u32 fb_id;
>=20
> +	/**
> +	 * @possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's
> +	 * are created and they receive an index, which corresponds to their
> +	 * position in the bitmask. CRTC with index 0 will be in bit 0, and so
> +	 * on. To learn how to find out the index of a certain CRTC, please see
> +	 * :ref:`crtc_index`.

This could be shortened to something like bit N corresponds to CRTC
index N, and make "CRTC index N" a hyperlink.

> +	 */
>  	__u32 possible_crtcs;
> +	/** @gamma_size: Number of entries of the legacy gamma lookup table. */
>  	__u32 gamma_size;
>=20
> +	/** @count_format_types: Number of formats. */
>  	__u32 count_format_types;
> +	/**
> +	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
> +	 * supported by the plane. These formats do not require modifiers.
> +	 */
>  	__u64 format_type_ptr;

The count/ptr fields have an interesting usage pattern, which I suppose
is common for all DRM ioctls. Makes me wonder if it should be documented.

AFAIU, count is in+out field: when set to 0, the kernel uses it to
return the count needed. Then userspace allocates space and calls the
ioctl again with the right count and ptr set to point to the allocated
array of count elements. This is so that kernel never allocates memory
on behalf of userspace for the return data, making things much simpler
at the cost of maybe needing to call the ioctl twice to first figure
out long the array should be.

This can be seen in libdrm code for drmModeGetPlane().

There is certainly no point in explaining all that here, that is too
much. But if there was a way to annotate the count member as in+out,
that would be nice. And the ptr member as "in".


Thanks,
pq

>  };
>=20
> --
> 2.31.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


--Sig_/gkOWdlWSq/5LlZtvL9fPJZ.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCTsmsACgkQI1/ltBGq
qqflDg/+N5/SPT3+6aJS1ltA4xyacckKvA46ZVVm0O7gHLlGiHQK7UJ9Uo0WTkA6
vDJbRxGGCj4wNDh/AGuKT5CRJxK8i8rAfWXTIzX5fQVV2k1o8LYpBOjkG1V6bI+L
fgMqGhTY/a4hpxJsI5aiWdZzIotIqGNV6qSHTbVK4Mj8A0eDJ48w6+vkt0tu3ZXt
Egp+2n++5oeEkWgQ8cBYWCN04c1vJ+YwrrJJtM5s1JOT+kt5TJLWQaRrdPijxt+/
ZaU4MCCyJSbny9ijuotvCyaWYovZNJv/mf39OSNN+tXeZYNPqwVbYFFVHIdHfgSH
TbBItVtbp+wtsAmp+jsm3MdkOo/LFGMLLoDuwloq1+0IHwDL+FJuiQuSYAX0momN
6hInfZ02bZlYp2bwghKKovHnIS2MiLi7lY9pVNmKIZ0wUD55bfwKDKkLrWvwqDna
+OIbsSq0MkSHpo4ThqLKENDvvWWxgMKOGvNyyaY7Doxruq2M+gnohffRC1EA24A3
guOYDq90bcj8o4YYsnNhuPoQCe+AGGI0m/PFHGSpBe5YPucyZjTiVtyUNQ7488yg
cs5EJcewf0pxo5j4xwqRUvI24dpnHPAyjAmxlKOj+WHaWF+NfUEAft8LJdhh4GY+
340GY3qSxIM7ulH2R+3My8rLaPkrVEz8pdY9KpEC7crP4NpGhaQ=
=1gOB
-----END PGP SIGNATURE-----

--Sig_/gkOWdlWSq/5LlZtvL9fPJZ.--
