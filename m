Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A372D260F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DFE6E986;
	Tue,  8 Dec 2020 08:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652946E5D4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 11:01:26 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id m19so18807523ejj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 03:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6tq2o4sa5hLN2r6d4fCn+BmFtMaeNUlGvPbBI2jFxHQ=;
 b=KijTzQGsP1YdeiwElpanaOko/WfQWUWnGLvhB8ap2Z1gbu87GbfGDnZxIvmx/5aGqZ
 pydIx5tEzbOWsgbbxoec7rcNYnq1Dfi4adTuf7f8cLRxXmU/vvlFWpaq827uJyJY02YL
 UQB+0CQ8TEnd8+ZhQuOjrHverrv02tvKmLWeSRUcJIFRXLTUgQ620NHnqrYHd2/ObUM0
 6HBwqMbMy875Rkv95OilyPMWVuDCcVvZhCBzAPloCIWW1+rN6lM/wzpUWzioCO+m9BQW
 5Wm4+ja2tYxQjyuDul5qh96Y5wppC7nNC1jraNsXUf28DhnL39NqsQVSk4LchZcZHTzM
 OtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6tq2o4sa5hLN2r6d4fCn+BmFtMaeNUlGvPbBI2jFxHQ=;
 b=NiybBnroiMUCtvxB4euFERlQeE1JBlVyVGNh5asX+ijHwwEpze5QzcoFye330OBVCl
 Spab33zUJ8T07jSTq7GEzQnvBFa3BzTwX3P0cHEiQgKp57W0nPLTDEME2/gf+4dsjgOO
 ZSBtbNKyVIQ2Fnm+Oz3LXjwfb9EikO8Xsz2Cpkb0t/rh2GypPvopGiQIbsnuVeGIeLSV
 gubjeudL10rPqQcEpjDgERNcoWtpZSFdi7v7NroUmp1vc14WJKUmdi7HrRQlxP6AoS4z
 PnLJIO2bhshevELlIJWPKMXsku0ULQ3CIcvdysAdbPOWaN+6VSVBfC/2FY9Nm5fOoCEr
 5hfw==
X-Gm-Message-State: AOAM531zijZYKR7WrpzizaWfelIjJG2fFxsP07tmPmhuukoMnHQaDWcd
 QoHYnKxQWfmSpAt5v6dlWI1yvNxizXYkc4eO8c2x2A==
X-Google-Smtp-Source: ABdhPJxyWVv94IV0ZPrW+AKPlx+AkK5xtRe+INlgyZKQgq5akY5wwg99dYjUdDalfdzmkIA3hEYmkt71TWgr+8qVFv8=
X-Received: by 2002:a17:906:1e0c:: with SMTP id
 g12mr18730751ejj.115.1607338884640; 
 Mon, 07 Dec 2020 03:01:24 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
 <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <20201207105109.599273be@eldfell>
 <CABjik9c+TVMK3685bkYp43PbqxoAosTxXEeQvH6hmfBD0YSz6A@mail.gmail.com>
 <20201207123514.65e4b868@eldfell> <20201207124454.42b87186@eldfell>
 <EdWYHKD3WXh4_hWSW633I_O9leJ7ib3vLux7KuDhdcl-3vhSphWQnDALaATh_HVU97nzVuDWf5j4pp1d9tnHCelC7ogUjBcqxzW7Z_erfIs=@emersion.fr>
 <CABjik9cd_NWOSH79Y1x7Hj5iW6nqoP44XrNSDr+o5am07Suzbg@mail.gmail.com>
 <CE57r-xvcKbKT0LCtCjasef7m8hy4jgYOsQ5_ntH16VGrzEFksPwVs2wL-gBdWHAhYrIDhXF2WmNIHvGd3bWhkqtUJvAakLI7vcgForuxM4=@emersion.fr>
In-Reply-To: <CE57r-xvcKbKT0LCtCjasef7m8hy4jgYOsQ5_ntH16VGrzEFksPwVs2wL-gBdWHAhYrIDhXF2WmNIHvGd3bWhkqtUJvAakLI7vcgForuxM4=@emersion.fr>
From: James Park <james.park@lagfreegames.com>
Date: Mon, 7 Dec 2020 03:01:11 -0800
Message-ID: <CABjik9efy8AkVT6NoPby5rxu0dN4RVh2CU++1F85e-RE_9Tg7g@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: Simon Ser <contact@emersion.fr>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: multipart/mixed; boundary="===============1542838131=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1542838131==
Content-Type: multipart/alternative; boundary="00000000000040cfe005b5ddbfd4"

--00000000000040cfe005b5ddbfd4
Content-Type: text/plain; charset="UTF-8"

Oh, I thought you meant:

#include "drm_basic_types.h"
#include "drm_fourcc.h"

Yours should work too. I don't have a preference vs. what I already have,
so if no one says anything, I can switch over to yours.

Thanks,
James

On Mon, Dec 7, 2020 at 2:53 AM Simon Ser <contact@emersion.fr> wrote:

> On Monday, December 7th, 2020 at 11:49 AM, James Park <
> james.park@lagfreegames.com> wrote:
>
> > That would work, but that's kind of an annoying requirement. I would
> > prefer the header to be self-sufficient.
>
> I don't want to make it more confusing than before, but here Pekka (I
> think) suggests to replace this:
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 82f3278..5eb07a5 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -24,7 +24,11 @@
>  #ifndef DRM_FOURCC_H
>  #define DRM_FOURCC_H
>
> +#ifdef DRM_FOURCC_STANDALONE
> +#include "drm_basic_types.h"
> +#else
>  #include "drm.h"
> +#endif
>
>  #if defined(__cplusplus)
>  extern "C" {
>
> With this:
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 82f3278..5eb07a5 100644
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
>
> That wouldn't change whether the header is self-sufficient or not,
> would it?
>

--00000000000040cfe005b5ddbfd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh, I thought you meant:<div><br></div><div>#include &quot=
;drm_basic_types.h&quot;</div><div>#include &quot;drm_fourcc.h&quot;</div><=
div><br></div><div>Yours should work too. I don&#39;t have a preference vs.=
 what I already=C2=A0have, so if no one says anything, I can switch over to=
 yours.</div><div><br></div><div>Thanks,</div><div>James</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 7=
, 2020 at 2:53 AM Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr">cont=
act@emersion.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Monday, December 7th, 2020 at 11:49 AM, James Park &lt;<a=
 href=3D"mailto:james.park@lagfreegames.com" target=3D"_blank">james.park@l=
agfreegames.com</a>&gt; wrote:<br>
<br>
&gt; That would work, but that&#39;s kind of an annoying requirement. I wou=
ld<br>
&gt; prefer the header to be self-sufficient.<br>
<br>
I don&#39;t want to make it more confusing than before, but here Pekka (I<b=
r>
think) suggests to replace this:<br>
<br>
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h<=
br>
index 82f3278..5eb07a5 100644<br>
--- a/include/uapi/drm/drm_fourcc.h<br>
+++ b/include/uapi/drm/drm_fourcc.h<br>
@@ -24,7 +24,11 @@<br>
=C2=A0#ifndef DRM_FOURCC_H<br>
=C2=A0#define DRM_FOURCC_H<br>
<br>
+#ifdef DRM_FOURCC_STANDALONE<br>
+#include &quot;drm_basic_types.h&quot;<br>
+#else<br>
=C2=A0#include &quot;drm.h&quot;<br>
+#endif<br>
<br>
=C2=A0#if defined(__cplusplus)<br>
=C2=A0extern &quot;C&quot; {<br>
<br>
With this:<br>
<br>
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h<=
br>
index 82f3278..5eb07a5 100644<br>
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
<br>
That wouldn&#39;t change whether the header is self-sufficient or not,<br>
would it?<br>
</blockquote></div>

--00000000000040cfe005b5ddbfd4--

--===============1542838131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1542838131==--
