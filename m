Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EFFA37F5F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 11:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE3310E40B;
	Mon, 17 Feb 2025 10:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="1KIr6EJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7651310E409;
 Mon, 17 Feb 2025 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J3HgEZS9xjoZwWsAzMFMsdKTmMlRwp8+r5kkhG2NhQo=; b=1KIr6EJWy+C1JI9n2eMlapwNni
 +i7xoXso4iCJtJZmNKZxsR5EKpLD5L6dfZjbobfF7m/E9VMFXMa15JLpsCv1b7x1frzhmitpEZYxy
 Ekm8HqR6Oh8gSzdzlpvn3pfVsSBGY9tUfHHTgZfuSUdQiVZbvZCesfY4KMVpWTom+pnZVeIidjk7z
 e0n7sZYAJsFA+hP8xjKUpPk9xZRHJS52JvovEQxwvzuJoehbWLD3afW565/ui9ygreTRe6ZRUKu/w
 I5PchFTjQjQ8pHYZPszHa+s37uNWGT7Ykgz+IJhLVGELPjxuMWyVI2YzmpC5PI7UxYe6iYi4hrv6l
 8kaZzocA==;
Received: from [194.136.85.206] (port=60892 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1tjy2x-00072J-2C;
 Mon, 17 Feb 2025 12:08:15 +0200
Date: Mon, 17 Feb 2025 12:08:08 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, suraj.kandpal@intel.com,
 dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Message-ID: <20250217120808.708b9b4d@eldfell>
In-Reply-To: <20250128-dpst-v8-1-871b94d777f8@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AsDrxAXWUO.oa+H_.Qbn_6a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/AsDrxAXWUO.oa+H_.Qbn_6a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arun,

this whole series seems to be missing all the UAPI docs for the DRM
ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
replacement for them, I would assume both are a requirement.

Without the ReST docs it is really difficult to see how this new UAPI
should be used.


On Tue, 28 Jan 2025 21:21:07 +0530
Arun R Murthy <arun.r.murthy@intel.com> wrote:

> Display Histogram is an array of bins and can be generated in many ways
> referred to as modes.
> Ex: HSV max(RGB), Wighted RGB etc.
>=20
> Understanding the histogram data format(Ex: HSV max(RGB))
> Histogram is just the pixel count.
> For a maximum resolution of 10k (10240 x 4320 =3D 44236800)
> 25 bits should be sufficient to represent this along with a buffer of 7
> bits(future use) u32 is being considered.
> max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
> bits, hence 32 bins.
> Below mentioned algorithm illustrates the histogram generation in
> hardware.
>=20
> hist[32] =3D {0};
> for (i =3D 0; i < resolution; i++) {
> 	bin =3D max(RGB[i]);
> 	bin =3D bin >> 3;	/* consider the most significant bits */
> 	hist[bin]++;
> }
> If the entire image is Red color then max(255,0,0) is 255 so the pixel
> count of each pixels will be placed in the last bin. Hence except
> hist[31] all other bins will have a value zero.
> Generated histogram in this case would be hist[32] =3D {0,0,....44236800}
>=20
> Description of the structures, properties defined are documented in the
> header file include/uapi/drm/drm_mode.h
>=20
> v8: Added doc for HDR planes, removed reserved variables (Dmitry)
>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  include/uapi/drm/drm_mode.h | 65 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 65 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..b8b7b18843ae7224263a9c61b=
20ac6cbf5df69e9 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1355,6 +1355,71 @@ struct drm_mode_closefb {
>  	__u32 pad;
>  };
> =20
> +/**
> + * enum drm_mode_histogram
> + *
> + * @DRM_MODE_HISTOGRAM_HSV_MAX_RGB:
> + * Maximum resolution at present 10k, 10240x4320 =3D 44236800
> + * can be denoted in 25bits. With an additional 7 bits in buffer each bin
> + * can be a u32 value.
> + * For SDL, Maximum value of max(RGB) is 255, so max 255 bins.

I assume s/SDL/SDR/.

This assumption seems false. SDR can be also 10-bit and probably even
more.

> + * If the most significant 5 bits are considered, then bins =3D 2^5
> + * will be 32 bins.
> + * For HDR, maximum value of max(RGB) is 65535, so max 65535 bins.

Does this mean that the histogram is computed on the pixel values
emitted to the cable? What if the cable format is YUV?

> + * For illustration consider a full RED image of 10k resolution consider=
ing all
> + * 8 bits histogram would look like hist[255] =3D {0,0,....44236800} wit=
h SDR
> + * plane similarly with HDR the same would look like hist[65535] =3D
> + * {0,0,0,....44236800}

This SDR vs. HDR is a false dichotomy. I presume the meaningful
difference is bits-per-channel, not the dynamic range.

It would be good to have the pseudocode snippet here instead of the
commit message. The commit message should not contain any UAPI notes
that are not in the UAPI docs. OTOH, repeating UAPI docs in the commit
message is probably not very useful, as the more interesting questions
are why this exists and what it can be used for.

> + */
> +enum drm_mode_histogram {
> +	DRM_MODE_HISTOGRAM_HSV_MAX_RGB =3D 0x01,

What does the HSV stand for?

When talking about pixel values, my first impression is
hue-saturation-value. But there are no hue-saturation-value
computations at all?

> +};
> +
> +/**
> + * struct drm_histogram_caps
> + *
> + * @histogram_mode: histogram generation modes, defined in the
> + *		    enum drm_mode_histogram
> + * @bins_count: number of bins for a chosen histogram mode. For illustra=
tion
> + *		refer the above defined histogram mode.
> + */
> +struct drm_histogram_caps {
> +	__u32 histogram_mode;
> +	__u32 bins_count;
> +};

Patch 3 says:

+ * Property HISTOGRAM_CAPS is a blob pointing to the struct drm_histogram_=
caps
+ * Description of the structure is in include/uapi/drm/drm_mode.h

This is a read-only property, right?

The blob contains one struct drm_histogram_caps. What if more than one
mode is supported?

If the bin count depends on the bits-per-channel of something which
depends on set video mode or other things, how does updating work?
What if userspace uses a stale count? How does userspace ensure it uses
the current count?

> +
> +/**
> + * struct drm_histogram_config
> + *
> + * @hist_mode_data: address to the histogram mode specific data if any

Do I understand correctly that the KMS blob will contain a userspace
virtual memory address (a user pointer)? How does that work? What are
the lifetime requirements for that memory?

I do not remember any precedent of this, and I suspect it's not a good
design. I believe all the data should be contained in the blobs, e.g.
how IN_FORMATS does it. I'm not sure what would be the best UAPI here
for returning histogram data to userspace, but at least all the data
sent to the kernel should be contained in the blob itself since it
seems to be quite small. Variable length is ok for blobs.

> + * @nr_hist_mode_data: number of elements pointed by the address in
> + *		       hist_mode_data
> + * @hist_mode: histogram mode(HSV max(RGB), RGB, LUMA etc)
> + * @enable: flag to enable/disable histogram
> + */
> +struct drm_histogram_config {
> +	__u64 hist_mode_data;
> +	__u32 nr_hist_mode_data;
> +	enum drm_mode_histogram hist_mode;
> +	bool enable;

Don't enum and bool have non-fixed sizes? Hence inappropriate as UABI,
if architecture, build options, or the contents of the enum change the
ABI.

> +};
> +
> +/**
> + * struct drm_histogram
> + *
> + * @config: histogram configuration data pointed by struct drm_histogram=
_config

s/pointed by/defined by/ I presume? That much is obvious from the field
type. What does it mean? Why is struct drm_histogram_config a separate
struct?

> + * @data_ptr: pointer to the array of histogram.
> + *	      Histogram is an array of bins. Data format for each bin depends
> + *	      on the histogram mode. Refer to the above histogram modes for
> + *	      more information.

Another userspace virtual address stored in a KMS blob?

> + * @nr_elements: number of bins in the histogram.
> + */
> +struct drm_histogram {
> +	struct drm_histogram_config config;
> +	__u64 data_ptr;
> +	__u32 nr_elements;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
>=20

Thanks,
pq

--Sig_/AsDrxAXWUO.oa+H_.Qbn_6a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmezCogACgkQI1/ltBGq
qqeVwxAAgOi7rT+0GFCOar6gflXlmT+cUraLzwYWlHZwlCcjFblOslXU1sJ6MlCP
aD7H9NsEXBOPq62GyHEcbT4Nux0Z0zrscR+7FAvf7HPRG/A6XjbfFm2Qs+ECOj++
9FYrfPBrrd0fWNhUoHl6ARO+nR2Vcsqb0uZ4ssywTmY6PDP1hGqplws2BT1KaOoa
rXVlJJytRcBIsEHuyLMYABcD5fnqb+Ymv8wJ9bHZXN5V5QqmQ9KwhyVdQIf76/fV
9t8SqBqbJuAaoCBSNgdkntjiCp56wu3vCA6MgHU2d3aes4EitOkOIJLhzEUS0yTk
TWWGpoZexc3GVmOu2iuFrayQYFTrlkyE5SEhKvHHiPJlEkX2qsXow+kT++8liAGa
Ni4qHq0Pe+lULyUQjyVbSQ6eF8m3icopqJY6gD2g94g56vUTJuoUfMQZ/jFNsDTJ
wkYriDvXZss1HBjzz2Vjl78JWnhglOYj0M9CDS3xU1dC6/LSHRSmh5QPDkZglBzU
gQ389osfFvjVrE+BHWvGj6IuETeUrMsVp9xlA/GgIF3dywZhW7zxL08qwNVQO0pK
E3HECVw4KTvHwqlJJvVtimN+scfynMKcaoAImAoP5YAYy3sqxf46y5gWPzdlsGfu
jBvONI+ktE2Kz96f4UCV9Ry9yYc98uO/iOxFRlle4t+w/KtZTLY=
=Nfrn
-----END PGP SIGNATURE-----

--Sig_/AsDrxAXWUO.oa+H_.Qbn_6a--
