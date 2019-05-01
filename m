Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38DC107BB
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 14:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E680D8938F;
	Wed,  1 May 2019 12:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962DE8938F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 12:01:17 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id c35so19726485qtk.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2019 05:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=94vcth9UsZR0cgFW76HxxnwKMZsF1Fe0nnhfHQXDz4E=;
 b=adlZ/DQ3nwz10t/sHYQ0KBo4V+fYn8zr9dyhyH/nTSVSEX4hazGIPWnkJRjtbiAR0E
 S1XJqE7qvX+GyRnU5cagPindtIn5jodK2DN+KmzwAvE475fOoJMg9uJfVY6kZvB/327g
 uRqcKgI39ueWSQSiW77hfyL7iOI/k+O2Mo67nA960O12kemKgcJO0pTHF/jAP6YTCmMr
 oLiWnAFT1lXLwn+Ij/uJnn8BfxkXDmHez/d2aBX9ACBm9nhHWg683kOEZXoZ9DUZPDdo
 M3skd8aIlbUglWTIsDXb3XB5q9CWNXFqFuo0EtLUUiZGfgU10MLfz14CBxK6xbx64CY8
 D+yw==
X-Gm-Message-State: APjAAAWRplq5gW533BuWiui8UEdcLwsPpRXLCX8pfen4lmwXMh2Zai8f
 57lsCce/EO72bunpyYp/trrhPeiupfiHVua5oSo=
X-Google-Smtp-Source: APXvYqyonkKFa+kCh4a9YCAO/FE7q50BRSdk32bnly8YSCFMWm0ixHRThs4eCASWSMoEVE0LuHW277NT6+YTYDa5040=
X-Received: by 2002:ac8:2556:: with SMTP id 22mr698225qtn.356.1556712075409;
 Wed, 01 May 2019 05:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <5cb28694-943e-473a-a81c-a81b7e896509@email.android.com>
In-Reply-To: <5cb28694-943e-473a-a81c-a81b7e896509@email.android.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 1 May 2019 22:01:05 +1000
Message-ID: <CAPM=9tzpPT5JvFH+Kpc7zXuW12rvmoL-QsHsPq8vaBBRBG=g6w@mail.gmail.com>
Subject: Re: [PATCH v2] drm: introduce a capability flag for syncobj timeline
 support
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=94vcth9UsZR0cgFW76HxxnwKMZsF1Fe0nnhfHQXDz4E=;
 b=HIT0vEaqfHKMOEunRKttAkGYQ/ODfqbvEAL4hnDeTUTmVCsXgD7WjKyUJ2SdHNTYxt
 sYwdEH6zMAVTGwPc1BaVIjaC7U/9oLXhsJ45SsvNAEcY6y1E9trEcwwxG4T9IA9pzX8R
 vYImZ+GD/n9bdhSuA0XxPypc+7VCJiS+2djXClhP8f9bb6hEd4kejdUnctUhE0yDF9/q
 khiue9ID6lyzRT0untqZaBJXTkbdxiHaYa8hahiHzJnwRTTUSZnX1ms0DZCxvtlUdjwC
 YOnFdKABJzqN3SJuG7kXXdp5GRX8r9A1ttT2BonqwNQL/Zc5SPA45HTrnt0dW0RfZ7te
 M4Cg==
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============0448823731=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0448823731==
Content-Type: multipart/alternative; boundary="00000000000045c0b60587d246c1"

--00000000000045c0b60587d246c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 1 May 2019, 19:24 Koenig, Christian, <Christian.Koenig@amd.com>
wrote:

>
>
> Am 01.05.2019 11:00 schrieb Lionel Landwerlin <
> lionel.g.landwerlin@intel.com>:
>
> [CAUTION: External Email]
>
> On 16/04/2019 20:53, Dave Airlie wrote:
> > On Tue, 16 Apr 2019 at 22:58, Lionel Landwerlin
> > <lionel.g.landwerlin@intel.com> wrote:
> >> Unfortunately userspace users of this API cannot be publicly disclosed
> >> yet.
> >>
> >> This commit effectively disables timeline syncobj ioctls for all
> >> drivers. Each driver wishing to support this feature will need to
> >> expose DRIVER_SYNCOBJ_TIMELINE.
> >>
> >> v2: Add uAPI capability check (Christian)
> >>
> >> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> >> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> (v1)
> >> Cc: Dave Airlie <airlied@redhat.com>
> >> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Cc: Chunming Zhou <david1.zhou@amd.com>
> > LGTM,
> >
> > Reviewed-by: Dave Airlie <airlied@redhat.com>
> >
> > Not sure if I'm due anymore misc-next pulls, if so would be good to
> > have it go that way, but otherwise I can pull it into -next when I get
> > some time.
> >
> > Dave.
> >
> Christian, Dave,
>
> Who should pull these patches in?
>
>
> I was assuming Dave does this.
>
> I could do it tomorrow, but today is a holiday here and I am not even
> close to my laptop.
>

I will pick it up tomorrow, jjst need to make my brain work.

Dave.

>
> Christian.
>
>
> Thanks,
>
> -Lionel
>
>
>

--00000000000045c0b60587d246c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 1 May 2019, 19:24 Koenig, Christian, &lt;<a hr=
ef=3D"mailto:Christian.Koenig@amd.com">Christian.Koenig@amd.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">



<div>
<div dir=3D"auto">
<div><br>
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">Am 01.05.2019 11:00 schrieb Lionel Landwerlin &l=
t;<a href=3D"mailto:lionel.g.landwerlin@intel.com" target=3D"_blank" rel=3D=
"noreferrer">lionel.g.landwerlin@intel.com</a>&gt;:<br type=3D"attribution"=
>
<blockquote class=3D"m_4610052506580666388quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>[CAUTION: External Email]<br>
<br>
On 16/04/2019 20:53, Dave Airlie wrote:<br>
&gt; On Tue, 16 Apr 2019 at 22:58, Lionel Landwerlin<br>
&gt; &lt;<a href=3D"mailto:lionel.g.landwerlin@intel.com" target=3D"_blank"=
 rel=3D"noreferrer">lionel.g.landwerlin@intel.com</a>&gt; wrote:<br>
&gt;&gt; Unfortunately userspace users of this API cannot be publicly discl=
osed<br>
&gt;&gt; yet.<br>
&gt;&gt;<br>
&gt;&gt; This commit effectively disables timeline syncobj ioctls for all<b=
r>
&gt;&gt; drivers. Each driver wishing to support this feature will need to<=
br>
&gt;&gt; expose DRIVER_SYNCOBJ_TIMELINE.<br>
&gt;&gt;<br>
&gt;&gt; v2: Add uAPI capability check (Christian)<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Lionel Landwerlin &lt;<a href=3D"mailto:lionel.g.la=
ndwerlin@intel.com" target=3D"_blank" rel=3D"noreferrer">lionel.g.landwerli=
n@intel.com</a>&gt;<br>
&gt;&gt; Reviewed-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.=
koenig@amd.com" target=3D"_blank" rel=3D"noreferrer">christian.koenig@amd.c=
om</a>&gt; (v1)<br>
&gt;&gt; Cc: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">airlied@redhat.com</a>&gt;<br>
&gt;&gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" ta=
rget=3D"_blank" rel=3D"noreferrer">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt;&gt; Cc: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@am=
d.com" target=3D"_blank" rel=3D"noreferrer">christian.koenig@amd.com</a>&gt=
;<br>
&gt;&gt; Cc: Chunming Zhou &lt;<a href=3D"mailto:david1.zhou@amd.com" targe=
t=3D"_blank" rel=3D"noreferrer">david1.zhou@amd.com</a>&gt;<br>
&gt; LGTM,<br>
&gt;<br>
&gt; Reviewed-by: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">airlied@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Not sure if I&#39;m due anymore misc-next pulls, if so would be good t=
o<br>
&gt; have it go that way, but otherwise I can pull it into -next when I get=
<br>
&gt; some time.<br>
&gt;<br>
&gt; Dave.<br>
&gt;<br>
Christian, Dave,<br>
<br>
Who should pull these patches in?<br>
</div>
</span></font></div>
</blockquote>
</div>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I was assuming Dave does this.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I could do it tomorrow, but today is a holiday here and I=
 am not even close to my laptop.</div>
<div dir=3D"auto"></div></div></div></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">I will pick it up tomorrow, jjst need to ma=
ke my brain work.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Dave.<=
/div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div><div dir=3D"auto"><div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Christian.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div class=3D"gmail_extra">
<div class=3D"gmail_quote">
<blockquote class=3D"m_4610052506580666388quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div><br>
Thanks,<br>
<br>
-Lionel<br>
</div>
</span></font></div>
</blockquote>
</div>
<br>
</div>
</div>
</div>
</div>

</blockquote></div></div></div>

--00000000000045c0b60587d246c1--

--===============0448823731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0448823731==--
