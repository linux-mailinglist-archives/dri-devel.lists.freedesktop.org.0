Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAB412827
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCC68968D;
	Fri,  3 May 2019 06:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D60089864
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 20:20:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t76so4594895wmt.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 13:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D6KaOQxjWEdUJn+lC5B8dsOZl6YYeeBlExYuaXHd7DU=;
 b=aV0Z/BM/ae3RhwEspVf67QFlQYsblZ2FabwGpVHNNmpE2sotqwut5RJ18Wx/dBkihi
 QNhmfPnulSGaQraWDFjWbvvKICiF6auigdqw4vTWhNDEx7UxLf11f6oQKw+PhbKJvYp3
 UB2oViuyjw91sGvd3+UTqn3Urae5pyCieyjElf0DuiIMzLvjlPZebJ28LtcrzKw62wHz
 CS9F+O7J7smiyMo8dHcBQu+wpZm7dwMkDPjG2Gxc4XYWM2islySUezIiYXT2lf9jNK4d
 2nqf+dWMtbwHHSln5sYaw0twUOQbTEACygeIzH3sH0kq1JQRSCxAyl+f83mYK9Wcyhdk
 szeA==
X-Gm-Message-State: APjAAAVO3Fwf/1Brxafc3FWs1k+tVZmA9ufpqOZcILPIjhmOBXDYHAn8
 P9Z+tdcxbUrZdLxDTmasonxW3ix6DE+JFZChK+Xrcw==
X-Google-Smtp-Source: APXvYqwLhIgdHdK2LL/kPhO2xycS4dYSUUIadl3lplAuc39L7e0CUcVi+NgGSt+9SchPl8G+5KiVvOp9ExczenRjM+k=
X-Received: by 2002:a7b:c954:: with SMTP id i20mr3585911wml.59.1556828406167; 
 Thu, 02 May 2019 13:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190502180346.4769-1-john.stultz@linaro.org>
In-Reply-To: <20190502180346.4769-1-john.stultz@linaro.org>
From: Greg Hartman <ghartman@google.com>
Date: Thu, 2 May 2019 13:19:54 -0700
Message-ID: <CAOvepGk_0UTnXztVgXh6qYGBF_3aQFBqs4HUpwhmfMV0G8TMNQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 0/3] mesa: Initial build fixups for AOSP/master
To: John Stultz <john.stultz@linaro.org>, Dan Willemsen <dwillemsen@google.com>
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=D6KaOQxjWEdUJn+lC5B8dsOZl6YYeeBlExYuaXHd7DU=;
 b=RrE1P4xxYwaTM0m4lwtM+YXbotn9WWCFxkMqZAWGA1ufKQjDHZ4Ovt1WhIyjg8V/qe
 zlKoXS0801/Df+tnPC8Da4J7+zHwGbb7jsfBEA3xXtHG5filqMnFZO0gqQjISFhl41C2
 wjVi5SMX+Yu08+k48eqEpVSz3ym6m0DLzZXW5/qB7x+Ft36jOcEb+LQAom/oQUv9XuWc
 R2cz2mJ3YAUmJPfLH78i9Oi8gjIJ7Eo2DSB7xqiH2h2v4kqe7Yk48kd3q1dZXkI97zVi
 6mwgSkoX1UuImaTsuHyB3Oz7d9wbW3JC/CwRAEcY30MDD1rEx370kZA0133iJ7qzdypr
 8rFw==
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
Cc: Rob Clark <robdclark@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: multipart/mixed; boundary="===============2104868134=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2104868134==
Content-Type: multipart/alternative; boundary="00000000000020909e0587ed5cef"

--00000000000020909e0587ed5cef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ dwillemsen@google.com background on the build changes.

Thanks for doing this. It will be helpful to have fixes to make this build
again.

On Thu, May 2, 2019 at 11:03 AM John Stultz <john.stultz@linaro.org> wrote:

> Somewhat recent changes in the AOSP build system has been made
> which fairly severely restricts the build environment. This has
> made it difficult to test mesa/master w/ AOSP/master.
>
> I'm working with others to try to remedy this, but as a first
> step I used some hacks to temporarily remove the build environment
> restrictions, and unsuprizingly found mesa/master has a few
> build issues when trying to build w/ freedreno.
>
> So this patch set provides only some very basic build fixes
> that are needed to get mesa/master building w/ AOSP/master
> (minus the build restrictions on external tools).
>
> Feedback would be greatly appreciated!
>
> thanks
> -john
>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Alistair Strachan <astrachan@google.com>
> Cc: Greg Hartman <ghartman@google.com>
> Cc: Tapani P=C3=A4lli <tapani.palli@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
>
> Alistair Strachan (1):
>   mesa: android: Remove unnecessary dependency tracking rules
>
> Amit Pundir (1):
>   mesa: android: freedreno: build libfreedreno_{drm,ir3} static libs
>
> John Stultz (1):
>   mesa: android: freedreno: Fix build failure due to path change
>
>  Android.mk                                   |  1 +
>  src/compiler/Android.glsl.gen.mk             |  2 -
>  src/compiler/Android.nir.gen.mk              |  2 -
>  src/freedreno/Android.drm.mk                 | 41 ++++++++++++++++
>  src/freedreno/Android.ir3.mk                 | 51 ++++++++++++++++++++
>  src/freedreno/Android.mk                     | 30 ++++++++++++
>  src/freedreno/Makefile.sources               |  2 +
>  src/gallium/Android.common.mk                |  5 +-
>  src/gallium/drivers/freedreno/Android.gen.mk |  2 +-
>  src/gallium/drivers/freedreno/Android.mk     |  2 +-
>  src/gallium/targets/dri/Android.mk           |  4 ++
>  11 files changed, 135 insertions(+), 7 deletions(-)
>  create mode 100644 src/freedreno/Android.drm.mk
>  create mode 100644 src/freedreno/Android.ir3.mk
>  create mode 100644 src/freedreno/Android.mk
>
> --
> 2.17.1
>
>

--00000000000020909e0587ed5cef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+ <a href=3D"mailto:dwillemsen@google.com">dwillemsen@goog=
le.com</a> background on the build changes.<div><br><div>Thanks for doing t=
his. It will be helpful to have fixes to make this build again.</div></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Thu, May 2, 2019 at 11:03 AM John Stultz &lt;<a href=3D"mailto:john.stul=
tz@linaro.org">john.stultz@linaro.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Somewhat recent changes in the AOSP bu=
ild system has been made<br>
which fairly severely restricts the build environment. This has<br>
made it difficult to test mesa/master w/ AOSP/master.<br>
<br>
I&#39;m working with others to try to remedy this, but as a first<br>
step I used some hacks to temporarily remove the build environment<br>
restrictions, and unsuprizingly found mesa/master has a few<br>
build issues when trying to build w/ freedreno.<br>
<br>
So this patch set provides only some very basic build fixes<br>
that are needed to get mesa/master building w/ AOSP/master<br>
(minus the build restrictions on external tools).<br>
<br>
Feedback would be greatly appreciated!<br>
<br>
thanks<br>
-john<br>
<br>
Cc: Rob Clark &lt;<a href=3D"mailto:robdclark@chromium.org" target=3D"_blan=
k">robdclark@chromium.org</a>&gt;<br>
Cc: Emil Velikov &lt;<a href=3D"mailto:emil.l.velikov@gmail.com" target=3D"=
_blank">emil.l.velikov@gmail.com</a>&gt;<br>
Cc: Amit Pundir &lt;<a href=3D"mailto:amit.pundir@linaro.org" target=3D"_bl=
ank">amit.pundir@linaro.org</a>&gt;<br>
Cc: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org" target=3D"_=
blank">sumit.semwal@linaro.org</a>&gt;<br>
Cc: Alistair Strachan &lt;<a href=3D"mailto:astrachan@google.com" target=3D=
"_blank">astrachan@google.com</a>&gt;<br>
Cc: Greg Hartman &lt;<a href=3D"mailto:ghartman@google.com" target=3D"_blan=
k">ghartman@google.com</a>&gt;<br>
Cc: Tapani P=C3=A4lli &lt;<a href=3D"mailto:tapani.palli@intel.com" target=
=3D"_blank">tapani.palli@intel.com</a>&gt;<br>
Cc: Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.net" target=3D"_b=
lank">jason@jlekstrand.net</a>&gt;<br>
<br>
Alistair Strachan (1):<br>
=C2=A0 mesa: android: Remove unnecessary dependency tracking rules<br>
<br>
Amit Pundir (1):<br>
=C2=A0 mesa: android: freedreno: build libfreedreno_{drm,ir3} static libs<b=
r>
<br>
John Stultz (1):<br>
=C2=A0 mesa: android: freedreno: Fix build failure due to path change<br>
<br>
=C2=A0Android.mk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1=
 +<br>
=C2=A0src/compiler/<a href=3D"http://Android.glsl.gen.mk" rel=3D"noreferrer=
" target=3D"_blank">Android.glsl.gen.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 -<br>
=C2=A0src/compiler/<a href=3D"http://Android.nir.gen.mk" rel=3D"noreferrer"=
 target=3D"_blank">Android.nir.gen.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 -<br>
=C2=A0src/freedreno/<a href=3D"http://Android.drm.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">Android.drm.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 41 ++++++++++++++++<br>
=C2=A0src/freedreno/<a href=3D"http://Android.ir3.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">Android.ir3.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 51 ++++++++++++++++++++<br>
=C2=A0src/freedreno/Android.mk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30 ++++++++++++<br>
=C2=A0src/freedreno/Makefile.sources=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0src/gallium/<a href=3D"http://Android.common.mk" rel=3D"noreferrer" t=
arget=3D"_blank">Android.common.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
=C2=A0src/gallium/drivers/freedreno/<a href=3D"http://Android.gen.mk" rel=
=3D"noreferrer" target=3D"_blank">Android.gen.mk</a> |=C2=A0 2 +-<br>
=C2=A0src/gallium/drivers/freedreno/Android.mk=C2=A0 =C2=A0 =C2=A0|=C2=A0 2=
 +-<br>
=C2=A0src/gallium/targets/dri/Android.mk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 4 ++<br>
=C2=A011 files changed, 135 insertions(+), 7 deletions(-)<br>
=C2=A0create mode 100644 src/freedreno/<a href=3D"http://Android.drm.mk" re=
l=3D"noreferrer" target=3D"_blank">Android.drm.mk</a><br>
=C2=A0create mode 100644 src/freedreno/<a href=3D"http://Android.ir3.mk" re=
l=3D"noreferrer" target=3D"_blank">Android.ir3.mk</a><br>
=C2=A0create mode 100644 src/freedreno/Android.mk<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--00000000000020909e0587ed5cef--

--===============2104868134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2104868134==--
