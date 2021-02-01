Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F339E30B9B5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2336E949;
	Tue,  2 Feb 2021 08:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52706E882
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 21:46:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id s11so20674519edd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 13:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=AfcJDDwn5kLNZUEZ4Xv3StVrzRnSsE+T390sG7juLfA=;
 b=Kv8omafXo8fx/bhdu3T/Q413fBFM+QtZ2kRitCG46+qNZuyazms/Bu+zRlvHl/uIVN
 aZDiK0pI+HjZrHDYfZQzSgMEOrfTqYUXBoRFKFCknOj/WSb7ZuHg61Gvay57EZZBP8C1
 mb1uUbautjvWDU/RzFlZzluWRsLAPjz4ozBpq1K1IxhuhYTEK/zecpPVcTy0pVc7jCQk
 UsMd3bSiVV3pEM0XBwhOOvIJlI557yj5b02OF0ilh0oehqi8FZAdFYL92f3DNYplsgf1
 REEOZVwM5dok5sCAddoMxCLteXQ2jFD/g8dtVDZP50cyZYHJMk/QgyeSWTgSkiO4ugXY
 awgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=AfcJDDwn5kLNZUEZ4Xv3StVrzRnSsE+T390sG7juLfA=;
 b=TH0IwVLQO8sclSHv4Pncofi56awPd6KGvuT/XgASsE4/4DgaSmtqH25SDoy7Ff9ua+
 Ve2lkvNUE6B2kPqP2e58uyRVftHof0qseTHcL2rHmHHvuy34rSWA5owr8QakHnENsLIZ
 b9L2NHNg6eVT8QZm+fApyU8MGIOEDtKbtsRHRV1e2FyZJmT94TyUO4I3HFre0kie1ube
 9qekG8bOv5//du+DGCjlb0eRQqm0QYlfM3Zq/1bEOhm/g+GiFogGxtH5QI5BY+k+sMdE
 5tn3CscnyXJFB3IOWVIC4NI0c9R6WBVuI4xAXojgt/GsPUKK/QAps7diKR21OCBCqt81
 1LWQ==
X-Gm-Message-State: AOAM531amTAD3ep1xHg0Mma2U3Jlc83t0LXdR57UVcsEOWfRpKV5I790
 3InnnMKvKAiDC20mAqH9tWOtgLNRHPlPoJHy4fbNzfyqai1kfw==
X-Google-Smtp-Source: ABdhPJwSuReNzRzAx1/Ay3lMz//BN2lY/JC3KC6TfpUykgtmqqwgUA9jVW/VkIuCEPxGFzJujAvR3CDUBqgsfK0F2Z8=
X-Received: by 2002:aa7:d511:: with SMTP id y17mr21243776edq.112.1612215974223; 
 Mon, 01 Feb 2021 13:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20201210103553.1ae238d2@eldfell>
 <1607591574-949-1-git-send-email-jpark37@lagfreegames.com>
 <1607591574-949-2-git-send-email-jpark37@lagfreegames.com>
In-Reply-To: <1607591574-949-2-git-send-email-jpark37@lagfreegames.com>
From: James Park <james.park@lagfreegames.com>
Date: Mon, 1 Feb 2021 13:45:42 -0800
Message-ID: <CABjik9eM1JGy42WgSpqVjxakjHMSr_sxpAPAHT5rrMSZ0Kwakg@mail.gmail.com>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
To: dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Content-Type: multipart/mixed; boundary="===============1953650558=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1953650558==
Content-Type: multipart/alternative; boundary="00000000000071f58005ba4d488d"

--00000000000071f58005ba4d488d
Content-Type: text/plain; charset="UTF-8"

Hello,

Is there something I can do to help move this patch along?

Thanks,
James Park

On Thu, Dec 10, 2020 at 1:13 AM James Park <jpark37@lagfreegames.com> wrote:

> Create drm_basic_types.h to define types previously defined by drm.h.
>
> Use DRM_FOURCC_STANDALONE to include drm_fourcc.h without drm.h.
>
> This will allow Mesa to port code to Windows more easily.
>
> Signed-off-by: James Park <jpark37@lagfreegames.com>
> Acked-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>  include/uapi/drm/drm.h             | 12 ++-------
>  include/uapi/drm/drm_basic_types.h | 52
> ++++++++++++++++++++++++++++++++++++++
>  include/uapi/drm/drm_fourcc.h      |  4 +++
>  3 files changed, 58 insertions(+), 10 deletions(-)
>  create mode 100644 include/uapi/drm/drm_basic_types.h
>
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 808b48a..d9ba922 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -36,6 +36,8 @@
>  #ifndef _DRM_H_
>  #define _DRM_H_
>
> +#include "drm_basic_types.h"
> +
>  #if defined(__KERNEL__)
>
>  #include <linux/types.h>
> @@ -50,18 +52,8 @@ typedef unsigned int drm_handle_t;
>
>  #else /* One of the BSDs */
>
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
>
>  #endif
> diff --git a/include/uapi/drm/drm_basic_types.h
> b/include/uapi/drm/drm_basic_types.h
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
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the
> next
> + * paragraph) shall be included in all copies or substantial portions of
> the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
> SHALL
> + * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR
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
>
> +#include "drm_basic_types.h"
> +
> +#ifndef DRM_FOURCC_STANDALONE
>  #include "drm.h"
> +#endif
>
>  #if defined(__cplusplus)
>  extern "C" {
> --
> 2.7.4
>
>

--00000000000071f58005ba4d488d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,<div><br></div><div>Is there someth=
ing I can do to help move this patch along?</div><div><br></div><div>Thanks=
,</div><div>James Park</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Dec 10, 2020 at 1:13 AM James Park &l=
t;<a href=3D"mailto:jpark37@lagfreegames.com">jpark37@lagfreegames.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Creat=
e drm_basic_types.h to define types previously defined by drm.h.<br>
<br>
Use DRM_FOURCC_STANDALONE to include drm_fourcc.h without drm.h.<br>
<br>
This will allow Mesa to port code to Windows more easily.<br>
<br>
Signed-off-by: James Park &lt;<a href=3D"mailto:jpark37@lagfreegames.com" t=
arget=3D"_blank">jpark37@lagfreegames.com</a>&gt;<br>
Acked-by: Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr" target=3D"_b=
lank">contact@emersion.fr</a>&gt;<br>
Reviewed-by: Pekka Paalanen &lt;<a href=3D"mailto:pekka.paalanen@collabora.=
com" target=3D"_blank">pekka.paalanen@collabora.com</a>&gt;<br>
---<br>
=C2=A0include/uapi/drm/drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 12 ++-------<br>
=C2=A0include/uapi/drm/drm_basic_types.h | 52 +++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A0include/uapi/drm/drm_fourcc.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++<br>
=C2=A03 files changed, 58 insertions(+), 10 deletions(-)<br>
=C2=A0create mode 100644 include/uapi/drm/drm_basic_types.h<br>
<br>
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h<br>
index 808b48a..d9ba922 100644<br>
--- a/include/uapi/drm/drm.h<br>
+++ b/include/uapi/drm/drm.h<br>
@@ -36,6 +36,8 @@<br>
=C2=A0#ifndef _DRM_H_<br>
=C2=A0#define _DRM_H_<br>
<br>
+#include &quot;drm_basic_types.h&quot;<br>
+<br>
=C2=A0#if defined(__KERNEL__)<br>
<br>
=C2=A0#include &lt;linux/types.h&gt;<br>
@@ -50,18 +52,8 @@ typedef unsigned int drm_handle_t;<br>
<br>
=C2=A0#else /* One of the BSDs */<br>
<br>
-#include &lt;stdint.h&gt;<br>
=C2=A0#include &lt;sys/ioccom.h&gt;<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
-typedef int8_t=C2=A0 =C2=A0__s8;<br>
-typedef uint8_t=C2=A0 __u8;<br>
-typedef int16_t=C2=A0 __s16;<br>
-typedef uint16_t __u16;<br>
-typedef int32_t=C2=A0 __s32;<br>
-typedef uint32_t __u32;<br>
-typedef int64_t=C2=A0 __s64;<br>
-typedef uint64_t __u64;<br>
-typedef size_t=C2=A0 =C2=A0__kernel_size_t;<br>
=C2=A0typedef unsigned long drm_handle_t;<br>
<br>
=C2=A0#endif<br>
diff --git a/include/uapi/drm/drm_basic_types.h b/include/uapi/drm/drm_basi=
c_types.h<br>
new file mode 100644<br>
index 0000000..da1f2c0<br>
--- /dev/null<br>
+++ b/include/uapi/drm/drm_basic_types.h<br>
@@ -0,0 +1,52 @@<br>
+/*<br>
+ * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.<br>
+ * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.<br>
+ * All rights reserved.<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
<br>
+ * copy of this software and associated documentation files (the &quot;Sof=
tware&quot;),<br>
+ * to deal in the Software without restriction, including without limitati=
on<br>
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,<br>
+ * and/or sell copies of the Software, and to permit persons to whom the<b=
r>
+ * Software is furnished to do so, subject to the following conditions:<br=
>
+ *<br>
+ * The above copyright notice and this permission notice (including the ne=
xt<br>
+ * paragraph) shall be included in all copies or substantial portions of t=
he<br>
+ * Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.=C2=A0 IN NO EVENT=
 SHALL<br>
+ * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR<br>
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,<b=
r>
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR<b=
r>
+ * OTHER DEALINGS IN THE SOFTWARE.<br>
+ */<br>
+<br>
+#ifndef _DRM_BASIC_TYPES_H_<br>
+#define _DRM_BASIC_TYPES_H_<br>
+<br>
+#if defined(__KERNEL__)<br>
+<br>
+#include &lt;linux/types.h&gt;<br>
+<br>
+#elif defined(__linux__)<br>
+<br>
+#include &lt;linux/types.h&gt;<br>
+<br>
+#else /* Not Linux */<br>
+<br>
+#include &lt;stdint.h&gt;<br>
+typedef int8_t=C2=A0 =C2=A0__s8;<br>
+typedef uint8_t=C2=A0 __u8;<br>
+typedef int16_t=C2=A0 __s16;<br>
+typedef uint16_t __u16;<br>
+typedef int32_t=C2=A0 __s32;<br>
+typedef uint32_t __u32;<br>
+typedef int64_t=C2=A0 __s64;<br>
+typedef uint64_t __u64;<br>
+typedef size_t=C2=A0 =C2=A0__kernel_size_t;<br>
+<br>
+#endif<br>
+<br>
+#endif<br>
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h<=
br>
index 82f3278..539870f 100644<br>
--- a/include/uapi/drm/drm_fourcc.h<br>
+++ b/include/uapi/drm/drm_fourcc.h<br>
@@ -24,7 +24,11 @@<br>
=C2=A0#ifndef DRM_FOURCC_H<br>
=C2=A0#define DRM_FOURCC_H<br>
<br>
+#include &quot;drm_basic_types.h&quot;<br>
+<br>
+#ifndef DRM_FOURCC_STANDALONE<br>
=C2=A0#include &quot;drm.h&quot;<br>
+#endif<br>
<br>
=C2=A0#if defined(__cplusplus)<br>
=C2=A0extern &quot;C&quot; {<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div></div>

--00000000000071f58005ba4d488d--

--===============1953650558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1953650558==--
