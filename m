Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B514177138
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0F96E4EC;
	Tue,  3 Mar 2020 08:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740FB6E4EC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 08:26:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 143so2496082ljj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 00:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=+QU6RXQo1P/2OCmr+2NuwBvY/LL5dWND9aTgayHtBpA=;
 b=GAZq8MHnfsqgONvwWSbxIh4/uHHYCS9uN5OTN0UmwKKyFDKTZp4MKQ4cgmCAMUOEL7
 2O5ntIen0OCJUhQE68qkVUmqZm9Sm04zj+aT9UH3xfS6KX5HCivUJksyuKj0AXWjuDgw
 08FiJcqQ+ozmoXuodyxQPCowDC1M/2Hr9OCBSm+v8exslW4evvOknj6752K4TrXynkAk
 tqAI7tyLdvRmw4OLrcOLRbzcrRylhFroRf+kn4/FTrCpCc60QUw9BMQsFVGxeVU3KpeC
 ge+YHtjVDONE+XeNX1ewbpO7EHFELRoti7W64MiA/oCltFZRY82sJ2IkyBBTfEaArZOi
 fS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=+QU6RXQo1P/2OCmr+2NuwBvY/LL5dWND9aTgayHtBpA=;
 b=Xy2rBZw8ikyEqjvg6P3RD8yJkGQ0OaxnPvJUS57U175CXJql2Dg/Jyc3BTAlulrgzP
 xcccdb+QDvqx2pNOgeZ4ENspU9eEYLcFISRN8g8tIZ2bvT138h7DUhDUjMuPqt7w9fOz
 Y+sSUx+Dav7d2Hw0sD1eU6eWWI2XgjXvzx1gQ736eppgzyr4sy8/yAToe/n3R3ml21C6
 PtJlrgazhEC6gRbPlWxSG8qfBGCfE0A4449zOJUAEtlGNduXS90KOc3UCr+0N7v7XeGB
 o0Ui4F9QSdsIFPLMSqDg5GSGB3H8HdwUxZ9K9gFlQH8XY36mZDjazQagX6el+/i0g1Ru
 p7Dw==
X-Gm-Message-State: ANhLgQ2gQpDdrrYhpON8cm5OpzJzJumOHOuDVml6LiryHzLR877JeOPG
 0IeelNJ8yp7McpnuK0ZQs/s=
X-Google-Smtp-Source: ADFU+vtcCMpZcJVYpuMhqCf+R4hXJ2ymAqzvgr7Cov+h6vbWT36bfQb2os7fYfW+BbbaZOzvEhD46A==
X-Received: by 2002:a2e:9395:: with SMTP id g21mr1722186ljh.167.1583223998999; 
 Tue, 03 Mar 2020 00:26:38 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x18sm11637099lfc.42.2020.03.03.00.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 00:26:38 -0800 (PST)
Date: Tue, 3 Mar 2020 10:26:27 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] drm/fourcc: Add bayer formats and modifiers
Message-ID: <20200303102627.2b726d83@eldfell.localdomain>
In-Reply-To: <20200228163135.524882-1-niklas.soderlund@ragnatech.se>
References: <20200228163135.524882-1-niklas.soderlund@ragnatech.se>
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
Cc: libcamera-devel@lists.libcamera.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1344648901=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1344648901==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0mRuWl3=/EdOQuZs34/QxxB"; protocol="application/pgp-signature"

--Sig_/0mRuWl3=/EdOQuZs34/QxxB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Feb 2020 17:31:35 +0100
Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se> wrote:

> Bayer formats are used with cameras and contain green, red and blue
> components, with alternating lines of red and green, and blue and green
> pixels in different orders. For each block of 2x2 pixels there is one
> pixel with a red filter, two with a green filter, and one with a blue
> filter. The filters can be arranged in different patterns.
>=20
> Add DRM fourcc formats to describe the most common Bayer formats. Also
> add a modifiers to describe the custom packing layouts used by the Intel
> IPU3 and in the MIPI (Mobile Industry Processor Interface) CSI-2
> specification.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> ---
>  include/uapi/drm/drm_fourcc.h | 95 +++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)

Hi,

here are some by-stander comments.

>=20
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d80737..561d5a08ffd16b69 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -286,6 +286,62 @@ extern "C" {
>  #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsamp=
led Cr (1) and Cb (2) planes */
> =20
> =20
> +/*
> + * Bayer formats
> + *
> + * Bayer formats contain green, red and blue components, with alternatin=
g lines
> + * of red and green, and blue and green pixels in different orders. For =
each
> + * block of 2x2 pixels there is one pixel with a red filter, two with a =
green
> + * filter, and one with a blue filter. The filters can be arranged in di=
fferent
> + * patterns.
> + *
> + * For example, RGGB:
> + *	row0: RGRGRGRG...
> + *	row1: GBGBGBGB...
> + *	row3: RGRGRGRG...
> + *	row4: GBGBGBGB...
> + *	...
> + *
> + * Vendors have different methods to pack the sampling formats to increa=
se data
> + * density. For this reason the fourcc only describes pixel sample size =
and the
> + * filter pattern for each block of 2x2 pixels. A modifier is needed to
> + * describe the memory layout.
> + *
> + * In addition to vendor modifiers for memory layout DRM_FORMAT_MOD_LINE=
AR may
> + * be used to describe a layout where all samples are placed consecutive=
ly in
> + * memory. If the sample does not fit inside a single byte, the sample s=
torage
> + * is extended to the minimum number of (little endian) bytes that can h=
old the
> + * sample and any unused most-significant bits are defined as padding.

"Minimum number of (little endian) bytes" is probably not quite right,
because you could end up with a 3-byte word for e.g. 18-bit samples,
and for those I don't think endianess is even a defined concept. Yes,
you don't add any >16 bit formats here, but being careful here avoids
having to face the question and confusion when someone does add such
formats.

Alternatively, do not even pretend to define any layout for samples >
16 bits, and leave it for the future to be defined if/when the need
arises.

> + *
> + * For example, SRGGB10:
> + * Each 10-bit sample is contained in 2 consecutive little endian bytes,=
 where
> + * the 6 most-significant bits are unused.

Nitpick: I think you mean "10-bit sample is contained in a uint16 word
(little endian), ..."

"little endian byte" sounds like a strange concept to me, as it seems
to delve into the order of bits in a byte, MSB or LSB first. I suspect
most people would not even think of this, but I've been scarred by
reading the Pixman pixel format definitions.

> + */
> +
> +/* 8-bit Bayer formats */
> +#define DRM_FORMAT_SRGGB8	fourcc_code('R', 'G', 'G', 'B')

The S in SRGGB is quite surprising to me. I saw it mentioned in IRC
that it is easy to read as sRGB and I agree. I would not know to
associate S with Bayer to begin with.

Why not e.g. DRM_FORMAT_BAYER_RGGB8?

> +#define DRM_FORMAT_SGRBG8	fourcc_code('G', 'R', 'B', 'G')
> +#define DRM_FORMAT_SGBRG8	fourcc_code('G', 'B', 'R', 'G')
> +#define DRM_FORMAT_SBGGR8	fourcc_code('B', 'A', '8', '1')
> +
> +/* 10-bit Bayer formats */
> +#define DRM_FORMAT_SRGGB10	fourcc_code('R', 'G', '1', '0')
> +#define DRM_FORMAT_SGRBG10	fourcc_code('B', 'A', '1', '0')
> +#define DRM_FORMAT_SGBRG10	fourcc_code('G', 'B', '1', '0')
> +#define DRM_FORMAT_SBGGR10	fourcc_code('B', 'G', '1', '0')
> +
> +/* 12-bit Bayer formats */
> +#define DRM_FORMAT_SRGGB12	fourcc_code('R', 'G', '1', '2')
> +#define DRM_FORMAT_SGRBG12	fourcc_code('B', 'A', '1', '2')

Conflict:

#define DRM_FORMAT_BGRA4444     fourcc_code('B', 'A', '1', '2') /* [15:0] B=
:G:R:A 4:4:4:4 little endian */

Does the kernel not have a "self-test" that ensures that all format
codes (and why not modifiers as well) are unique?


> +#define DRM_FORMAT_SGBRG12	fourcc_code('G', 'B', '1', '2')
> +#define DRM_FORMAT_SBGGR12	fourcc_code('B', 'G', '1', '2')
> +
> +/* 14-bit Bayer formats */
> +#define DRM_FORMAT_SRGGB14	fourcc_code('R', 'G', '1', '4')
> +#define DRM_FORMAT_SGRBG14	fourcc_code('B', 'A', '1', '4')
> +#define DRM_FORMAT_SGBRG14	fourcc_code('G', 'B', '1', '4')
> +#define DRM_FORMAT_SBGGR14	fourcc_code('B', 'G', '1', '4')
> +
>  /*
>   * Format Modifiers:
>   *
> @@ -309,6 +365,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> +#define DRM_FORMAT_MOD_VENDOR_MIPI 0x0a
> =20
>  /* add more to the end as needed */
> =20
> @@ -434,6 +491,17 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
> =20
> +
> +/*
> + * IPU3 Bayer packing layout
> + *
> + * The IPU3 raw Bayer formats use a custom packing layout where there ar=
e no
> + * gaps between each 10-bit sample. It packs 25 pixels into 32 bytes lea=
ving
> + * the 6 most significant bits in the last byte unused. The format is li=
ttle
> + * endian.

Do I understand that right, that the collection of bytes (not words?)
represents a stream of bits? In which order do you read the bits of a byte
to produce the bits in a 10-bit unit?

I don't think "little endian" specifies that (even less for
non-2/4/8-byte units), and Pixman formats prove that the order could be
specified either way.

Does the "little endian" mean that in the 32 bytes long unit, one needs
to extract in chunks of uint16_t/uint32_t/uint64_t and inspect the bits
of those words, or is the 32-byte unit supposed to be read byte by byte
in which case endianess plays no role?

If possible, it would be good to reword the definition so that these
questions cannot arise.

> + */
> +#define IPU3_FORMAT_MOD_PACKED fourcc_mod_code(INTEL, 8)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> @@ -804,6 +872,33 @@ extern "C" {
>   */
>  #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
> =20
> +/* Mobile Industry Processor Interface (MIPI) modifiers */
> +
> +/*
> + * MIPI CSI-2 packing layout
> + *
> + * The CSI-2 RAW formats (for example Bayer) use a different packing lay=
out
> + * depenindg on the sample size.
> + *
> + * - 10-bits per sample
> + *   Every four consecutive samples are packed into 5 bytes. Each of the=
 first 4
> + *   bytes contain the 8 high order bits of the pixels, and the 5th byte
> + *   contains the 2 least-significant bits of each pixel, in the same or=
der.

...in the same order? So bits 0-1 are the bits 0-1 of the 1st sample, bits
2-3 are the bits 0-1 of the 2nd sample, etc?

> + *
> + * - 12-bits per sample
> + *   Every two consecutive samples are packed into three bytes. Each of =
the
> + *   first two bytes contain the 8 high order bits of the pixels, and th=
e third
> + *   byte contains the four least-significant bits of each pixel, in the=
 same
> + *   order.
> + *
> + * - 14-bits per sample
> + *   Every four consecutive samples are packed into seven bytes. Each of=
 the
> + *   first four bytes contain the eight high order bits of the pixels, a=
nd the
> + *   three following bytes contains the six least-significant bits of ea=
ch
> + *   pixel, in the same order.

How do you count the bits when crossing the byte boundary on the last 3
bytes? Is it an imaginary 24-bit word, or do you take it byte by byte
like this:

byte0 bits 0-5: 1st sample bits 0-5
byte0 bits 6-7: 2nd sample bits 0-1
byte1 bits 0-3: 2nd sample bits 2-5
byte1 bits 4-7: 3rd sample bits 0-3
byte2 bits 0-1: 3rd sample bits 4-5
byte2 bits 2-7: 4th sample bits 0-5

> + */
> +#define MIPI_FORMAT_MOD_CSI2_PACKED fourcc_mod_code(MIPI, 1)
> +
>  #if defined(__cplusplus)
>  }
>  #endif


Thanks,
pq

--Sig_/0mRuWl3=/EdOQuZs34/QxxB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5eFLMACgkQI1/ltBGq
qqdzEA//dXO501IvtsqbHOOGbHmH8x39ODRrLNZljp6OxJJCzOuQqbFzPlAekTIA
f02MxWBsxC05fxT0WZrSQOnRQiaaIKDXTMam+yRwbN4IXodaB2Sa+WoYPp9ySQu/
NzIudvDGP+Yr/18qfoZkcHL6E3L0/n6MBeJM0ftnieFisUcUfx+Sv1ZadrjtvD1B
dyAU4dfanZ/XXCuVu6LQXX8XkVM05yWTNoprUfQj4bJbCd1XcDPtWUOkplcZkfOz
7L7UmoOfU10uaTjZEoD6owA8k4xrx4tZU6fpzybJaFZmG/GrsnzwFb8m8KBKAxPL
UW2FVinWfRuz8TAsrfR0ty9EDl1X2DW3ZHaY5fg3RbpznismQbB+qGbIsk3ttyWL
6AupcDNrJ4Ufw8i/kc4sxE5J8QLBPRE27HoMdrEel7c5NNZsMB0+Q+INoEN8jAR1
ySBE+5b7CjurLUD+2jxRn8kWaBFwKRGXKyLgBAFeCuB/WWSAPX2+OYIuDJcsnqvV
2m/QQ/5MdbCbe6fWYeXuN8jqRplrGYITQF+Wkql0rHR7z8MQfVPEtcC43iufca65
Hg9Okxf+nu2mRql2pupz3Ia77mSZcjIcHqWsKgGwI53y0t6M5m6bBnfMfChcW4xV
HhTtAIUMgX0jMCyoMp6n7dTWAomYtWuSq88cFHMhBd2awypeCNs=
=XOjo
-----END PGP SIGNATURE-----

--Sig_/0mRuWl3=/EdOQuZs34/QxxB--

--===============1344648901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1344648901==--
