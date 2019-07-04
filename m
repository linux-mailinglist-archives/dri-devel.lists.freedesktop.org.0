Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48A45F1E0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 05:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188246E24E;
	Thu,  4 Jul 2019 03:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D221D6E24E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 03:46:09 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id r185so9922113iod.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 20:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NeV1gVgGnvlzZ0dc0nC+4bmAgJPDIIP89boskWme6k8=;
 b=iQ6b1B2KecMnD9cqzz3mRpJerhLlND+sG84kJor+kuo9y6vWzinFLiCD79G1lbDKJ5
 bIAV4LBR/t8BRaa+14rO35cKL25x1vuPbXXPv/we74YZhORgusxwyHePPZ6zrXh5lw55
 Y6095tESqhwl5gJS3H+tzD9hLM/qMZDsgDsYJCQajafggbGs7ULlrOBtjtckPtJpan0C
 MKluRR8YBUBTgA+nU7rTbAsxemdOjDZWKFty2TyqFyUcM3SRKJ1V3u2lmddZDb7xzrur
 Ddw8eQqzqq9bEByiE/P4copBqG4IIAtrG//Lf3ZdKEJ5lmLDoRjfWbY/4fDQFMe3NMOf
 D6JA==
X-Gm-Message-State: APjAAAUtzHwTjJaJFmzxwF9hrT5F7vjAhcGAzqJVUi4eM+5KeriffFbU
 jKRKPFtdhq+qqFoPaj1RrsLT0PbWE/9qnD+odkE=
X-Google-Smtp-Source: APXvYqz1fV41gXd8GfT0QNe2kS21alo9E7w87vV7pIsTSuaRh6B84CZN6J9fiw55kcO9Zy8XoDXifBlegBs3NDh8QMw=
X-Received: by 2002:a5d:8890:: with SMTP id d16mr11764856ioo.274.1562211969158; 
 Wed, 03 Jul 2019 20:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190703231038.73097-1-john.stultz@linaro.org>
In-Reply-To: <20190703231038.73097-1-john.stultz@linaro.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 3 Jul 2019 23:45:32 -0400
Message-ID: <CAAxE2A6CEWPXRF+bLUvuhSgu3Pa49s12y=FuZk39bp74p1A1gQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mesa: Fix clang build error w/
 util_blitter_get_color_format_for_zs()
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NeV1gVgGnvlzZ0dc0nC+4bmAgJPDIIP89boskWme6k8=;
 b=r++yn9fpTraYMfwTasYQ2MqvrtffT70diBg5Jd3sAVg9Bce0ROJtzUZgfNfzfUyLk2
 XHog71RzbQSXyDaDG/oKVi6Vyw9kbxzBRM9zfcnRXSTnUkb1e9WZ5sxgfPupVLY/bmtF
 9WX49La/utyajFqr4Ly2PtbMxOPcscUqb5bOKRP4BYBFlHI5C+9SxvaNcd1+20+3J4j8
 PfihXYUoDcKGKA/7f3S4eL8WqJriEwS07coJ3UsFvECmxGSAV3sA7FQPE3oUWCasUjyN
 nI7QYOxlYCozdpDW5iNv2gWpkMdgwUBaORne4JYiCYbBPzOeSyeGueSbtgjozyxRqaNb
 5OpQ==
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
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Greg Hartman <ghartman@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1918178539=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1918178539==
Content-Type: multipart/alternative; boundary="0000000000007c7b7c058cd2d1cc"

--0000000000007c7b7c058cd2d1cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the notice. I had already had a fix for this, but forgot to push
it. It's pushed now.

Marek

On Wed, Jul 3, 2019 at 7:10 PM John Stultz <john.stultz@linaro.org> wrote:

> Building with clang, I'm seeing
>  u_blitter.h:627:1: error: control may reach end of non-void function
> [-Werror,-Wreturn-type]
>
> The util_blitter_get_color_format_for_zs() asserts for any
> unhandled types, so we do not expect to reach the end of the
> function here.
>
> But provide a dummy return with an explicit assert above
> to ensure we don't hit it with any future changes to the logic.
>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Alistair Strachan <astrachan@google.com>
> Cc: Greg Hartman <ghartman@google.com>
> Cc: Tapani P=C3=A4lli <tapani.palli@intel.com>
> Cc: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  src/gallium/auxiliary/util/u_blitter.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/src/gallium/auxiliary/util/u_blitter.h
> b/src/gallium/auxiliary/util/u_blitter.h
> index 9e3fa55e648..7d6c3db64da 100644
> --- a/src/gallium/auxiliary/util/u_blitter.h
> +++ b/src/gallium/auxiliary/util/u_blitter.h
> @@ -624,6 +624,9 @@ util_blitter_get_color_format_for_zs(enum pipe_format
> format)
>     default:
>        assert(0);
>     }
> +   assert(0);
> +   /*XXX NEVER GET HERE*/
> +   return PIPE_FORMAT_R32G32_UINT;
>  }
>
>  #ifdef __cplusplus
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--0000000000007c7b7c058cd2d1cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the notice. I had already had a fix for th=
is, but forgot to push it. It&#39;s pushed now.</div><div><br></div><div>Ma=
rek<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, Jul 3, 2019 at 7:10 PM John Stultz &lt;<a href=3D"mail=
to:john.stultz@linaro.org">john.stultz@linaro.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Building with clang, I&#39=
;m seeing<br>
=C2=A0u_blitter.h:627:1: error: control may reach end of non-void function =
[-Werror,-Wreturn-type]<br>
<br>
The util_blitter_get_color_format_for_zs() asserts for any<br>
unhandled types, so we do not expect to reach the end of the<br>
function here.<br>
<br>
But provide a dummy return with an explicit assert above<br>
to ensure we don&#39;t hit it with any future changes to the logic.<br>
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
Cc: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak@amd.com" target=
=3D"_blank">marek.olsak@amd.com</a>&gt;<br>
Signed-off-by: John Stultz &lt;<a href=3D"mailto:john.stultz@linaro.org" ta=
rget=3D"_blank">john.stultz@linaro.org</a>&gt;<br>
---<br>
=C2=A0src/gallium/auxiliary/util/u_blitter.h | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/src/gallium/auxiliary/util/u_blitter.h b/src/gallium/auxiliary=
/util/u_blitter.h<br>
index 9e3fa55e648..7d6c3db64da 100644<br>
--- a/src/gallium/auxiliary/util/u_blitter.h<br>
+++ b/src/gallium/auxiliary/util/u_blitter.h<br>
@@ -624,6 +624,9 @@ util_blitter_get_color_format_for_zs(enum pipe_format f=
ormat)<br>
=C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(0);<br>
=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0assert(0);<br>
+=C2=A0 =C2=A0/*XXX NEVER GET HERE*/<br>
+=C2=A0 =C2=A0return PIPE_FORMAT_R32G32_UINT;<br>
=C2=A0}<br>
<br>
=C2=A0#ifdef __cplusplus<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a></blockquote></div>

--0000000000007c7b7c058cd2d1cc--

--===============1918178539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1918178539==--
