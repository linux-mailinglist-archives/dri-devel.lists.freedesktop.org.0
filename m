Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 296AD2D5589
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3DC6E3C6;
	Thu, 10 Dec 2020 08:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9D56E3C6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 08:36:17 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y19so6969253lfa.13
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 00:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=8RVVLX8IwywZi/g3omAj+/CAVDG+GqlFU1yFLt+Dqgc=;
 b=Z9Aen4vF9qE2LnLeduZwtqcVHADcaLsSoU+R3s1kylXNlMbwtwA7X0N+68pDr4lYH3
 UZ86l2fjvAZDodVJrUBTqXmQXiofSecl+5qIdT9TZaUYXwUE65TB8gRhzufqRHfSfg9U
 OsrGFjCqlLJbl2rOoN848iDE9IcgB8bZimstl3lWbLk3lVOuhW8qfUMkg5NJhwsgHQSS
 +dTUMW1RF3yZIEpyLuboW5BIaZXgTxLb+IpbbLY/PHUfGlccgWZ95mmrMVfbaRNrq0TP
 Pf15Xi6GmA8IQAqYQrnQ44FQ/kqCKUTajSO2huEsJowifN0/TezLEYqcGWQ/9YQe2dzn
 39bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=8RVVLX8IwywZi/g3omAj+/CAVDG+GqlFU1yFLt+Dqgc=;
 b=nzMyh5wXIujMjP6EafNAmtaaRJTJTVoPgggpZROm8ensPbtHFFsz2ICcwKzEHFXIzy
 p4zjFZL36yvHtgkvCSxA8YSnIaB1HdMuuyTYKpqlW88ECZtIFMBmfXhG2dG6iZXqRJWH
 5fCSTwTCyAFwF0Se8loOcVWs2ue7QyL5FhZYHbowj7NLDaANESuCOx/C3wHJW30hxdF5
 vsiTLR3/BGSzgTmRPB51KaU1lGe5x/B/sWXylvaoz9oe/x9SoOqR3LAQcDe9vq6tDIcs
 yHtCkl/VdOjKLRhYEtILGqyBT1t9ddxKpd1kXmTVg3DstsZtUy1o6Lvr3vN15le3J04w
 3Jog==
X-Gm-Message-State: AOAM531u6iCKIgGSvZNzN18xiIFiThZQoTTBI27T489x9ApRiuRFxwxa
 9901VyexXR/i87CxR4s6wZk=
X-Google-Smtp-Source: ABdhPJz7n8PDQke92Tn3qpiqSwCC/uE36t7CSASTRlrpbBP9S8bNtU+9qKqeZObBkM8ES3w+IEPF4A==
X-Received: by 2002:ac2:5cca:: with SMTP id f10mr2144201lfq.566.1607589376265; 
 Thu, 10 Dec 2020 00:36:16 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 20sm434691lfd.237.2020.12.10.00.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 00:36:15 -0800 (PST)
Date: Thu, 10 Dec 2020 10:35:53 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: James Park <jpark37@lagfreegames.com>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Message-ID: <20201210103553.1ae238d2@eldfell>
In-Reply-To: <1607511790-817-2-git-send-email-jpark37@lagfreegames.com>
References: <VOvpgkJSLSX_nWnr-hgXPJUyndzrUMaHHFos_Smu67du13TLRRPLDpySE45bht1cGd_xTsGoQbJ5gGT4Ofzmji1lXa5eZNCkmUf8QkUyWx0=@emersion.fr>
 <1607511790-817-1-git-send-email-jpark37@lagfreegames.com>
 <1607511790-817-2-git-send-email-jpark37@lagfreegames.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1782919774=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1782919774==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//ihbfYusIagF4nS_4YaDD+r"; protocol="application/pgp-signature"

--Sig_//ihbfYusIagF4nS_4YaDD+r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed,  9 Dec 2020 03:03:10 -0800
James Park <jpark37@lagfreegames.com> wrote:

> Create drm_basic_types.h to define types previously defined by drm.h.
>=20
> Use DRM_FOURCC_STANDALONE to include drm_fourcc.h without drm.h.
>=20
> This will allow Mesa to port code to Windows more easily.
>=20
> Signed-off-by: James Park <jpark37@lagfreegames.com>
> Acked-by: Simon Ser <contact@emersion.fr>

Looks good to me.
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

But with the caveat that I didn't actually test this.


Thanks,
pq

> ---
>  include/uapi/drm/drm.h             | 12 ++-------
>  include/uapi/drm/drm_basic_types.h | 52 ++++++++++++++++++++++++++++++++=
++++++
>  include/uapi/drm/drm_fourcc.h      |  4 +++
>  3 files changed, 58 insertions(+), 10 deletions(-)
>  create mode 100644 include/uapi/drm/drm_basic_types.h
>=20
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 808b48a..d9ba922 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -36,6 +36,8 @@
>  #ifndef _DRM_H_
>  #define _DRM_H_
> =20
> +#include "drm_basic_types.h"
> +
>  #if defined(__KERNEL__)
> =20
>  #include <linux/types.h>
> @@ -50,18 +52,8 @@ typedef unsigned int drm_handle_t;
> =20
>  #else /* One of the BSDs */
> =20
> -#include <stdint.h>
>  #include <sys/ioccom.h>
>  #include <sys/types.h>
> -typedef int8_t   __s8;
> -typedef uint8_t  __u8;
> -typedef int16_t  __s16;
> -typedef uint16_t __u16;
> -typedef int32_t  __s32;
> -typedef uint32_t __u32;
> -typedef int64_t  __s64;
> -typedef uint64_t __u64;
> -typedef size_t   __kernel_size_t;
>  typedef unsigned long drm_handle_t;
> =20
>  #endif
> diff --git a/include/uapi/drm/drm_basic_types.h b/include/uapi/drm/drm_ba=
sic_types.h
> new file mode 100644
> index 0000000..da1f2c0
> --- /dev/null
> +++ b/include/uapi/drm/drm_basic_types.h
> @@ -0,0 +1,52 @@
> +/*
> + * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
> + * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
> + * All rights reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGE=
S OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef _DRM_BASIC_TYPES_H_
> +#define _DRM_BASIC_TYPES_H_
> +
> +#if defined(__KERNEL__)
> +
> +#include <linux/types.h>
> +
> +#elif defined(__linux__)
> +
> +#include <linux/types.h>
> +
> +#else /* Not Linux */
> +
> +#include <stdint.h>
> +typedef int8_t   __s8;
> +typedef uint8_t  __u8;
> +typedef int16_t  __s16;
> +typedef uint16_t __u16;
> +typedef int32_t  __s32;
> +typedef uint32_t __u32;
> +typedef int64_t  __s64;
> +typedef uint64_t __u64;
> +typedef size_t   __kernel_size_t;
> +
> +#endif
> +
> +#endif
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 82f3278..539870f 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -24,7 +24,11 @@
>  #ifndef DRM_FOURCC_H
>  #define DRM_FOURCC_H
> =20
> +#include "drm_basic_types.h"
> +
> +#ifndef DRM_FOURCC_STANDALONE
>  #include "drm.h"
> +#endif
> =20
>  #if defined(__cplusplus)
>  extern "C" {


--Sig_//ihbfYusIagF4nS_4YaDD+r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/R3ekACgkQI1/ltBGq
qqeZcw//bBEbntc5qkBwZ1pkiNDj7HCDLy3PaapAI+/+K4Vx5XkuwmmagwRzUrWo
D2z4Rsiyoe8VwHYGVttNXkzr8e9Qdb24Fw4NYTO6UyGeBuyoXCXJv97w6DEPa6n1
x+VdHUjoZJ38TEi9YsKCdhWrcINh6GspInoV5/gjrXMfe5rNjU7rtccZdftDWABI
J0hnpPv8tYNE5FlLyU/scl2lCRhdZX0B1PZzn3rY8IO22lXQtYj8wokSmvZU+mNh
6rfhSjGLirks1pHvbqwXfyLGgoAmBQ85WV/Azv4RREJtwsb6e3HJjaISERT1uHvE
Qgclit8EGYgD87S//2Fk3mbwZ2/dNyJBw7ZGiTvtjP+1Wnv30aQUZCReekYqemMR
OnqAw4KzhUxM2Ws3twYNUV+jXdPgFM8osjIJmjFZaIYWioFrF1yOXacl0S+nYEPX
HxmVSskTfoqj34L5LFLj0koB/4C1PbKvVW8dLSvr9BpSa05GdyvVUefb0UnD+5AP
es0i+W9o2QrvZgwekrkxW7gYgRMu/AT9N1pUFyQHHQ961jXnW3/aUa9mmD5pJ9TT
zudcrhnCFivSnIQ6fwgy9ynuCOpOS2SxLagl6Jv3Wt2c8Wjbb6jtsOUfv3zKHvQj
G0dr4BdHGVU9rm1SoagoADSH7b970FNV3YD0x/S5J3IxBl9iWTc=
=vDD3
-----END PGP SIGNATURE-----

--Sig_//ihbfYusIagF4nS_4YaDD+r--

--===============1782919774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1782919774==--
