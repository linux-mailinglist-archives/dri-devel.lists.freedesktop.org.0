Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F1AD75C4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 14:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFC26E7BD;
	Tue, 15 Oct 2019 12:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42026E7BD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 12:07:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 305F3B12C;
 Tue, 15 Oct 2019 12:07:06 +0000 (UTC)
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
References: <20191010204823.195540-1-sean@poorly.run>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <242462f0-ac8d-ab8a-e567-74678da3f68f@suse.de>
Date: Tue, 15 Oct 2019 14:07:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191010204823.195540-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sean Paul <seanpaul@chromium.org>
Content-Type: multipart/mixed; boundary="===============1059314769=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1059314769==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="h5M2aBBapi0e0gcZb5qTQbPO1JpuKz88L"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--h5M2aBBapi0e0gcZb5qTQbPO1JpuKz88L
Content-Type: multipart/mixed; boundary="FbHNr0PQ8WPwdRgCNlQEvjAS8MSs1VbOO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <242462f0-ac8d-ab8a-e567-74678da3f68f@suse.de>
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
References: <20191010204823.195540-1-sean@poorly.run>
In-Reply-To: <20191010204823.195540-1-sean@poorly.run>

--FbHNr0PQ8WPwdRgCNlQEvjAS8MSs1VbOO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.10.19 um 22:48 schrieb Sean Paul:
> From: Sean Paul <seanpaul@chromium.org>
>=20
> *Record scratch* You read that subject correctly, I bet you're wonderin=
g
> how we got here. At least hear me out before you flame :-)
>=20
> For a long while now, we (ChromeOS) have been struggling getting any
> value out of user feedback reports of display failures (notably externa=
l
> displays not working). The problem is that all logging, even fatal
> errors (well, fatal in the sense that a display won't light up) are
> logged at DEBUG log level. So in order to extract these logs, you need
> to be able to turn on logging, and reproduce the issue with debug
> enabled. Unfortunately, this isn't really something we can ask CrOS use=
rs
> I spoke with airlied about this and RHEL has similar issues.
>=20
> This is the point where you ask me, "So Sean, why don't you just enable=

> DRM_UT_BLAH?". Good question! Here are the reasons in ascending order o=
f
> severity:
>  1- People aren't consistent with their categories, so we'd have to
>     enable a bunch to get proper coverage
>  2- We don't want to overwhelm syslog with drm spam, others have to use=

>     it too
>  3- Console logging is slow
>=20
> Hopefully you're with me so far. I have a problem that has no existing
> solution. What I really want is a ringbuffer of the most recent logs
> (in the categories I'm interested in) exposed via debugfs so I can
> extract it when users file feedback.

For bug reports, I don't want categories or anything else that users can
switch on/off. All I'd want is a simple way of retrieving the last ~100
messages from DRM (ala: "please attach the content of the file at
/sys/debug...").

> It just so happens that there is something which does _exactly_ this! I=

> can dump the most recent logs into tracepoints, turn them on and off
> depending on which category I want, and pull them from debugfs on deman=
d.
>=20
> "What about trace_printk()?" You'll say. It doesn't give us the control=
 we
> get from using tracepoints and it's not meant to be left sprinkled arou=
nd
> in code.
>=20
> So that is how we got here, now it's time for you to tell me why this i=
s
> a horrible idea :-)

Tracepoints are considered stable uapi, right? As a distro person (SUSE)
I don't want us to have to maintain debugging messages forever.


The problem itself doesn't seem related to DRM. Do other subsystems have
similar requirements?

Best regards
Thomas

> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/drm_print.c      | 143 ++++++++++++++++++++++++++-----=

>  include/trace/events/drm_print.h | 116 +++++++++++++++++++++++++
>  2 files changed, 239 insertions(+), 20 deletions(-)
>  create mode 100644 include/trace/events/drm_print.h
>=20
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 9a25d73c155c..f591292811aa 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -27,11 +27,15 @@
> =20
>  #include <stdarg.h>
> =20
> +#include <linux/bitops.h>
>  #include <linux/io.h>
>  #include <linux/moduleparam.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> =20
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/drm_print.h>
> +
>  #include <drm/drm.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_print.h>
> @@ -241,10 +245,10 @@ void drm_dev_printk(const struct device *dev, con=
st char *level,
>  	struct va_format vaf;
>  	va_list args;
> =20
> -	va_start(args, format);
>  	vaf.fmt =3D format;
>  	vaf.va =3D &args;
> =20
> +	va_start(args, format);
>  	if (dev)
>  		dev_printk(level, dev, "[" DRM_NAME ":%ps] %pV",
>  			   __builtin_return_address(0), &vaf);
> @@ -253,49 +257,145 @@ void drm_dev_printk(const struct device *dev, co=
nst char *level,
>  		       level, __builtin_return_address(0), &vaf);
> =20
>  	va_end(args);
> +
> +	va_start(args, format);
> +	trace_drm_log(level, dev, &vaf);
> +	va_end(args);
>  }
>  EXPORT_SYMBOL(drm_dev_printk);
> =20
> +static unsigned int drm_trace_enabled(unsigned int category)
> +{
> +	unsigned int bit;
> +
> +	for_each_set_bit(bit, (unsigned long*)&category, sizeof(category) * 8=
) {
> +		switch (BIT(bit)) {
> +		case DRM_UT_NONE:
> +			return trace_drm_dbg_none_enabled();
> +		case DRM_UT_CORE:
> +			return trace_drm_dbg_core_enabled();
> +		case DRM_UT_DRIVER:
> +			return trace_drm_dbg_driver_enabled();
> +		case DRM_UT_KMS:
> +			return trace_drm_dbg_kms_enabled();
> +		case DRM_UT_PRIME:
> +			return trace_drm_dbg_prime_enabled();
> +		case DRM_UT_ATOMIC:
> +			return trace_drm_dbg_atomic_enabled();
> +		case DRM_UT_VBL:
> +			return trace_drm_dbg_vbl_enabled();
> +		case DRM_UT_STATE:
> +			return trace_drm_dbg_state_enabled();
> +		case DRM_UT_LEASE:
> +			return trace_drm_dbg_lease_enabled();
> +		case DRM_UT_DP:
> +			return trace_drm_dbg_dp_enabled();
> +		default:
> +			return trace_drm_dbg_unknown_enabled();
> +		}
> +	}
> +	return false;
> +}
> +
> +static void drm_do_trace(const struct device *dev, unsigned int catego=
ry,
> +			 struct va_format *vaf)
> +{
> +	WARN_ON(hweight32(category) > 1);
> +
> +	switch (category) {
> +	case DRM_UT_NONE:
> +		trace_drm_dbg_none(dev, vaf);
> +		break;
> +	case DRM_UT_CORE:
> +		trace_drm_dbg_core(dev, vaf);
> +		break;
> +	case DRM_UT_DRIVER:
> +		trace_drm_dbg_driver(dev, vaf);
> +		break;
> +	case DRM_UT_KMS:
> +		trace_drm_dbg_kms(dev, vaf);
> +		break;
> +	case DRM_UT_PRIME:
> +		trace_drm_dbg_prime(dev, vaf);
> +		break;
> +	case DRM_UT_ATOMIC:
> +		trace_drm_dbg_atomic(dev, vaf);
> +		break;
> +	case DRM_UT_VBL:
> +		trace_drm_dbg_vbl(dev, vaf);
> +		break;
> +	case DRM_UT_STATE:
> +		trace_drm_dbg_state(dev, vaf);
> +		break;
> +	case DRM_UT_LEASE:
> +		trace_drm_dbg_lease(dev, vaf);
> +		break;
> +	case DRM_UT_DP:
> +		trace_drm_dbg_dp(dev, vaf);
> +		break;
> +	default:
> +		trace_drm_dbg_unknown(dev, vaf);
> +		break;
> +	}
> +}
> +
>  void drm_dev_dbg(const struct device *dev, unsigned int category,
>  		 const char *format, ...)
>  {
>  	struct va_format vaf;
> +	unsigned int bit;
>  	va_list args;
> =20
> -	if (!drm_debug_enabled(category))
> -		return;
> -
> -	va_start(args, format);
>  	vaf.fmt =3D format;
>  	vaf.va =3D &args;
> =20
> -	if (dev)
> -		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> -			   __builtin_return_address(0), &vaf);
> -	else
> -		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> -		       __builtin_return_address(0), &vaf);
> +	if (drm_debug_enabled(category)) {
> +		va_start(args, format);
> +		if (dev)
> +			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> +				   __builtin_return_address(0), &vaf);
> +		else
> +			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> +			       __builtin_return_address(0), &vaf);
> +		va_end(args);
> +	}
> +
> +	if (!drm_trace_enabled(category))
> +		return;
> +
> +	for_each_set_bit(bit, (unsigned long*)&category, sizeof(category) * 8=
) {
> +		va_start(args, format);
> +		drm_do_trace(dev, BIT(bit), &vaf);
> +		va_end(args);
> +	}
> =20
> -	va_end(args);
>  }
>  EXPORT_SYMBOL(drm_dev_dbg);
> =20
>  void drm_dbg(unsigned int category, const char *format, ...)
>  {
>  	struct va_format vaf;
> +	unsigned int bit;
>  	va_list args;
> =20
> -	if (!drm_debug_enabled(category))
> -		return;
> -
> -	va_start(args, format);
>  	vaf.fmt =3D format;
>  	vaf.va =3D &args;
> =20
> -	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> -	       __builtin_return_address(0), &vaf);
> +	if (drm_debug_enabled(category)) {
> +		va_start(args, format);
> +		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> +		       __builtin_return_address(0), &vaf);
> +		va_end(args);
> +	}
> =20
> -	va_end(args);
> +	if (!drm_trace_enabled(category))
> +		return;
> +
> +	for_each_set_bit(bit, (unsigned long*)&category, sizeof(category) * 8=
) {
> +		va_start(args, format);
> +		drm_do_trace(NULL, BIT(bit), &vaf);
> +		va_end(args);
> +	}
>  }
>  EXPORT_SYMBOL(drm_dbg);
> =20
> @@ -304,13 +404,16 @@ void drm_err(const char *format, ...)
>  	struct va_format vaf;
>  	va_list args;
> =20
> -	va_start(args, format);
>  	vaf.fmt =3D format;
>  	vaf.va =3D &args;
> =20
> +	va_start(args, format);
>  	printk(KERN_ERR "[" DRM_NAME ":%ps] *ERROR* %pV",
>  	       __builtin_return_address(0), &vaf);
> +	va_end(args);
> =20
> +	va_start(args, format);
> +	trace_drm_err(NULL, &vaf);
>  	va_end(args);
>  }
>  EXPORT_SYMBOL(drm_err);
> diff --git a/include/trace/events/drm_print.h b/include/trace/events/dr=
m_print.h
> new file mode 100644
> index 000000000000..cc93c69f3fe4
> --- /dev/null
> +++ b/include/trace/events/drm_print.h
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (C) 2019 Google, Inc.
> + *
> + * Authors:
> + * Sean Paul <seanpaul@chromium.org>
> + */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM drm_print
> +
> +#if !defined(_TRACE_DRM_PRINT_H) || defined(TRACE_HEADER_MULTI_READ)
> +
> +#include <linux/device.h>
> +#include <linux/tracepoint.h>
> +
> +#define DRM_PRINT_MAX 256
> +
> +#define _TRACE_DRM_PRINT_H
> +
> +TRACE_EVENT(drm_log,
> +	TP_PROTO(const char * level, const struct device *dev,
> +		 struct va_format *vaf),
> +	TP_ARGS(level, dev, vaf),
> +	TP_STRUCT__entry(
> +		__field(const char *,		level			)
> +		__field(const struct device *,	dev			)
> +		__dynamic_array(char,		msg,	DRM_PRINT_MAX	)
> +		__field(int,			len			)
> +	),
> +	TP_fast_assign(
> +		__entry->level =3D level;
> +		__entry->dev =3D dev;
> +		__entry->len =3D vsnprintf(__get_str(msg), DRM_PRINT_MAX,
> +					 vaf->fmt, *vaf->va);
> +		if (__entry->len > 0 &&
> +		    __get_str(msg)[__entry->len - 1] =3D=3D '\n')
> +			__get_str(msg)[--__entry->len] =3D '\0';
> +	),
> +	TP_printk("%s %s %s: %s", __entry->level,
> +		  __entry->dev ? dev_driver_string(__entry->dev) : "(NULL):",
> +		  __entry->dev ? dev_name(__entry->dev) : "", __get_str(msg))
> +);
> +
> +TRACE_EVENT(class_drm_category_log,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf),
> +	TP_STRUCT__entry(
> +		__field(const struct device *,	dev			)
> +		__dynamic_array(char,		msg,	DRM_PRINT_MAX	)
> +		__field(int,			len			)
> +	),
> +	TP_fast_assign(
> +		__entry->dev =3D dev;
> +		__entry->len =3D vsnprintf(__get_str(msg), DRM_PRINT_MAX,
> +					 vaf->fmt, *vaf->va);
> +		if (__entry->len > 0 &&
> +		    __get_str(msg)[__entry->len - 1] =3D=3D '\n')
> +			__get_str(msg)[--__entry->len] =3D '\0';
> +	),
> +	TP_printk("%s %s%s%s",
> +		  __entry->dev ? dev_driver_string(__entry->dev) : "",
> +		  __entry->dev ? dev_name(__entry->dev) : "",
> +		  __entry->dev ? ": " : "", __get_str(msg))
> +);
> +DEFINE_EVENT(class_drm_category_log, drm_err,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf)
> +);
> +DEFINE_EVENT(class_drm_category_log, drm_dbg_none,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf)
> +);
> +DEFINE_EVENT(class_drm_category_log, drm_dbg_core,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf)
> +);
> +DEFINE_EVENT(class_drm_category_log, drm_dbg_driver,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf)
> +);
> +DEFINE_EVENT(class_drm_category_log, drm_dbg_kms,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf)
> +);
> +DEFINE_EVENT(class_drm_category_log, drm_dbg_prime,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf)
> +);
> +DEFINE_EVENT(class_drm_category_log, drm_dbg_atomic,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf)
> +);
> +DEFINE_EVENT(class_drm_category_log, drm_dbg_vbl,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf)
> +);
> +DEFINE_EVENT(class_drm_category_log, drm_dbg_state,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf)
> +);
> +DEFINE_EVENT(class_drm_category_log, drm_dbg_lease,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf)
> +);
> +DEFINE_EVENT(class_drm_category_log, drm_dbg_dp,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf)
> +);
> +DEFINE_EVENT(class_drm_category_log, drm_dbg_unknown,
> +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> +	TP_ARGS(dev, vaf)
> +);
> +#endif
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--FbHNr0PQ8WPwdRgCNlQEvjAS8MSs1VbOO--

--h5M2aBBapi0e0gcZb5qTQbPO1JpuKz88L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2ltmQACgkQaA3BHVML
eiMsjAf+JAP5Qu0C4gmlejJZ/G7rJcqlEal7jaqr2jtt0SuxZiMg6VhUq9QAW9hz
UX32N7GJbfSA//0Ru8oXpz2UQkDb8AafVqYAaDhUTI3YNuPkY5w4+Rfz0iegODNq
bfYL8NNNJWb/MDyfXcBvcjXmt2ZtK76TL5aYoO6VFNG95tMbZP6wi6ee+ntAdPEl
I39RoSgq3gI68jTAXcLlQJNdtK4VF4xO+Un4c9ROi96AXuBEJMOL39xhxkhLAGCg
VhO7MxkNPQ4Nsm0gzzjXKEkDbmTT+aVWk4fVKMeAC4A5Yo2IxHr5fDPChWMl6cm5
IjD6mT1M6u6gNiJLDXhzwY+Ng9wRZQ==
=UhsI
-----END PGP SIGNATURE-----

--h5M2aBBapi0e0gcZb5qTQbPO1JpuKz88L--

--===============1059314769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1059314769==--
