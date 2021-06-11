Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D64F3A3CE4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 09:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5608D6EE36;
	Fri, 11 Jun 2021 07:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7E26EE36
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:19:57 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id bp38so7197598lfb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 00:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=XYMI4AE2wmRGfJTDbOvGRozIv4ox6M6Hjnu/MEHyoFg=;
 b=VQ2ExDEZJ2CDm9fomEN9zfEFi/QNi6QTo4UzuTRdPb+OWu/KFMmfu2c9+dymLFuXVm
 +DWr7v9MTNBp9JsiA0KZbyq90tLiXmljflW9vPD5kgJBIkGwSDvnhUJ7nlz+MRIKJ1FZ
 sc5Op9+hyVNWeN23LfxaXIayIXJeQh4UFgreaP65GJA2uAWMQ/5W7fs82Ay3egK+6wRy
 2DgSuXaGWmegfkQAjiRX058oweIk7Cj22tnY37yGTFpRpj3O7UkP4fFS2/UbQtp6RmPm
 cME6a14lyOkDlSQQ5lejOj9VOs0CoHesVEO1+anvvrcYD0c/vzYWZniqDQYv2kkYJWJW
 T60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=XYMI4AE2wmRGfJTDbOvGRozIv4ox6M6Hjnu/MEHyoFg=;
 b=FwJ+8/Vz7UCbLeC5IR2F67j4CnTwvYbFUZhY/i7Aaa/vtWO9Z6O0BczPaSLMP2gJJB
 9KT8OLZziLRd84iXPRy60TLFUV6LIKHWxwGyQ4upGj/6T+48YD0TzunfKlgLCdsDaszx
 WHluQ4L+NuZ/CaZ1jG2wZFcv37WgvtxU1RTGwlecn5gG8oRN0WINj7xODwYI9Tnq4SLM
 0rQrefs84ugjmiRtOlpT77OdiW3Ot06loYjWaHDNNt14U/tzTRW8LJOMg+fvIVLpp6wS
 Y6BVVq7H3ScF+F57hJRCCuTOfGgRPt5CgY6I8RyMeJzSD34Ov5Wh8HwJ03/eQq9MaCov
 fgLA==
X-Gm-Message-State: AOAM533LLbtHv5liUgGOAxt64BSfs0Uhi2mU58yZtqW5KaxfZd2zHZO+
 KbdW2tGBpUTs2dZjX0z+Uw4=
X-Google-Smtp-Source: ABdhPJynWEHgDM0R0JSs6RE4KFlH8YrXmukNAeH7vEnANe/ss1rusH2haQt0puxnEWh439HT8NpmrQ==
X-Received: by 2002:a19:4949:: with SMTP id l9mr1728997lfj.642.1623395996225; 
 Fri, 11 Jun 2021 00:19:56 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d4sm507360lfk.295.2021.06.11.00.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 00:19:55 -0700 (PDT)
Date: Fri, 11 Jun 2021 10:19:45 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH v5 1/1] drm/doc: document drm_mode_get_plane
Message-ID: <20210611101945.2e7ef9e4@eldfell>
In-Reply-To: <20210610203824.50965-2-leandro.ribeiro@collabora.com>
References: <20210610203824.50965-1-leandro.ribeiro@collabora.com>
 <20210610203824.50965-2-leandro.ribeiro@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OMB.81+4eGQo88LaFjGYtxH"; protocol="application/pgp-signature"
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

--Sig_/OMB.81+4eGQo88LaFjGYtxH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Jun 2021 17:38:24 -0300
Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:

> Add a small description and document struct fields of
> drm_mode_get_plane.
>=20
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> ---
>  include/uapi/drm/drm_mode.h | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 9b6722d45f36..698559d9336b 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -312,16 +312,51 @@ struct drm_mode_set_plane {
>  	__u32 src_w;
>  };
>=20
> +/**
> + * struct drm_mode_get_plane - Get plane metadata.
> + *
> + * Userspace can perform a GETPLANE ioctl to retrieve information about a
> + * plane.
> + *
> + * To retrieve the number of formats supported, set @count_format_types =
to zero
> + * and call the ioctl. @count_format_types will be updated with the valu=
e.
> + *
> + * To retrieve these formats, allocate an array with the memory needed t=
o store
> + * @count_format_types formats. Point @format_type_ptr to this array and=
 call
> + * the ioctl again (with @count_format_types still set to the value retu=
rned in
> + * the first ioctl call).
> + */
>  struct drm_mode_get_plane {
> +	/**
> +	 * @plane_id: Object ID of the plane whose information should be
> +	 * retrieved. Set by caller.
> +	 */
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
> +	 * position in the bitmask. Bit N corresponds to
> +	 * :ref:`CRTC index<crtc_index>` N.
> +	 */
>  	__u32 possible_crtcs;
> +	/**
> +	 * @gamma_size: Number of entries of the legacy gamma lookup table.
> +	 * Deprecated.
> +	 */
>  	__u32 gamma_size;

Hi,

I wonder, has this field ever been used?

"The legacy gamma" refers to CRTC gamma LUT AFAIK, but this here is
about planes. I forgot that at first, so didn't see anything funny.

Anyway, whether the doc for this field is as is, or is changed to
"never used" or "unused" or "reserved" or whatever, you have my:

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

With the caveat that I didn't actually build the docs to see how they
look.


Thanks,
pq

>=20
> +	/** @count_format_types: Number of formats. */
>  	__u32 count_format_types;
> +	/**
> +	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
> +	 * supported by the plane. These formats do not require modifiers.
> +	 */
>  	__u64 format_type_ptr;
>  };
>=20
> --
> 2.31.1
>=20


--Sig_/OMB.81+4eGQo88LaFjGYtxH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDDDpEACgkQI1/ltBGq
qqeqyQ/+PMLXm33B2pSoUDVS3Tr83eZTOuJNhbQNVHedl46gq6KP4/lGdJIIbEEV
kDHQ45kfZ53T2q6SPbHoedd9BEeCo4USmPfv8MWbgQfTBd8iVBrSmVpl2TDHMvNa
Cl71Mz9D3W+PmkJ1XeydppYFOU8VA8xH53vqDMrUd0qhUjbIhoJ8K0zLUOBVj1hT
tce15omfXbyEW2fjUj0/cARKXZAMGFYEaaTJsqa3T5qaWM7uIN6BFVlTFcTWIYIB
eFBIlHKjL3FTMbzlzxzVdEryGWehfQNO69doqzmdPzaWA5kTceRZ259tIOODEzIT
G72ych2FXi0+IP01gL74s1yjYqDJ8r9woO8m2AGlpiYDbu+Aj9Q10l8WoB59P91W
InX1TnFHwBy9Fvm0uwHVGiBMXLAw5KSOBzIo+7WnSNn6OijfaFhJxFqrV+fNbdkb
fm/NitNOpycA5An9WEUcsrPmG1bR3bhUxcXmD6SVewCOtBs04CXdd3Mfzs/xywWt
/FS4yymfag8ztoHVyTeyjuICbboOpJB1exN6QFn3F1t6pWIzk8WmIHjOnfPw59zv
iq61vMgFVF13x/GWKSLIpDrL3rknzn2DGfXL6FW2e9oo8uHHIuEtKA0LPdyzPAiO
5pFGFXTjFw+t8yrrel0eOykk5GFxvETBwj00u8vh8wopnqrrAQw=
=HDXl
-----END PGP SIGNATURE-----

--Sig_/OMB.81+4eGQo88LaFjGYtxH--
