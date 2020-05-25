Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC891E12D6
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 18:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F336089F75;
	Mon, 25 May 2020 16:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5C889F6D;
 Mon, 25 May 2020 16:39:46 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id e16so8239074qtg.0;
 Mon, 25 May 2020 09:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Cg2nDRJSSUtoQ+YOk98ik1cf6mNrgI8hNMZYbJeGRk=;
 b=kue8Cw6FK5fuAKJCgM6KIK665iUt1XyvX+yxeTDMVlDD+5j0ZgU++9Ru9JjNkKc6BY
 WjEuWiUOqRFdAvSa8KjOEFmltAIjZmFEI5kJl6ppyNa3RtdXN9yi2LjNaj5FNdArOm+s
 CV5w6AEfNGbWvYkHkn8DE9TC8eNpwK8HTibFDu8DJLugEPX/+eUtNhm6hmDnwpC5809y
 BvDNp2kjI9hJd9XTmHinPpFsI+jRAYMss5N7TY7VSgUTuCK+4OCn48C7PlMbKCBWsijP
 ZKc6MynFpvHwo3RPiAZQb2ngh7zU6DjhJJe1IO9TD4I2b3v+QQSbO5jGOB1bgAS/yBvk
 U0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Cg2nDRJSSUtoQ+YOk98ik1cf6mNrgI8hNMZYbJeGRk=;
 b=FUB5xhT/JLN1z4JThRFUEJca+2S6EqzCt8iM0ZHwEFTMfoQS17k9HGEjLl/YsXF0fB
 cMaqGiw/57KjsgdFr6VjWhMCtTngYZ2L02s1NA2XOuqnyC3FcahZgV30c4jsLJc9kQpe
 mzjpOvDs2VZpBDqV6FyK948P/oMyBpr26e3FgomJj91OUgvKR/+Nxq/oCUnKhfMJxCeM
 pio7w6SaxGDHeh6KSwBYoTNAirGGU8bJHQBDzMpbfxnY5dsjJ63k2/wIV2dYZYy98LV9
 Qz7rrIjBWkTUxE+9Oj9QlSZcAuEdCnBWNKQMp9QzVOgvUKtqPihFRIKWJfOAxjLveUM9
 GElA==
X-Gm-Message-State: AOAM533cW8sjf90dCPMPKDY8DUP+W7zbg0VOJlu7eI3gxdqbTfIPt/W+
 08AsNfbCUnG/bjhtjQduIlHOje8l79NkRpKDF2IvFN96JPo=
X-Google-Smtp-Source: ABdhPJwusI15gPZZobD6JX9Xc7VEHPUiiUdgL264U8PM/zt7F1dj+a7yC0pf/XMy0G7W9/W/t1I5eZjSMOVS3HW8MxY=
X-Received: by 2002:aed:2563:: with SMTP id w32mr28770524qtc.189.1590424785108; 
 Mon, 25 May 2020 09:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAGcx_0Yu4D6F2BiPp5CnJhMyrupGsnFnzEH0-Gv=8rFuVtDi+w@mail.gmail.com>
 <53679f9b-4d81-cb46-72bb-02ca05fb303f@daenzer.net>
 <CAGcx_0Z3JhUP_2KpfC0JQZeugd6VfDSYeErMSZMVVA8sogUt+A@mail.gmail.com>
 <f7b36e27-d7de-80e6-c5a7-1aba198c4036@daenzer.net>
In-Reply-To: <f7b36e27-d7de-80e6-c5a7-1aba198c4036@daenzer.net>
From: uday kiran pichika <udaykiran.pichika@gmail.com>
Date: Mon, 25 May 2020 22:09:33 +0530
Message-ID: <CAGcx_0YYxVUXJrVXQHueRi4bw6bePpQGACh2fRmMy_wrt2Y6hQ@mail.gmail.com>
Subject: Re: Adaptive Sync enabling in Xorg Modesetting driver
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1695917386=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1695917386==
Content-Type: multipart/alternative; boundary="0000000000005bc0a605a67ba0e1"

--0000000000005bc0a605a67ba0e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your quick check Michel. I had removed the condition in my local
source in ms_present_check_unflip() method and moved the assignment to
ms_present_check_flip() method. Below is the snippet.

static Bool ms_present_check_flip(RRCrtcPtr crtc,
                      WindowPtr window,
                      PixmapPtr pixmap,
                      Bool sync_flip,
                      PresentFlipReason *reason)
{
    if (ms->drmmode.sprites_visible > 0)
        return FALSE;

    Bool ret =3D ms_present_check_unflip(crtc, window, pixmap, sync_flip,
reason);
    ms->flip_window =3D window;
    return ret;
}

Still the problem exists.

Thanks
Uday Kiran


On Mon, May 25, 2020 at 9:49 PM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:

> On 2020-05-25 4:58 p.m., uday kiran pichika wrote:
> > Thanks Michel..
> >
> > sorry if my description is not clear.
> > Yes I have used with glxgears in fullscreen mode and also a simple glxa=
pp
> > which actually opens in fullscreen by default.
> >
> > In both the cases, the issue is same.
> >
> > Just wanted to know if AMD has done anything different apart from the
> > configurations either in MESA or in its Radeon driver ?
>
> The code you can see in xf86-video-amdgpu and Mesa is working for lots
> of people, most of them outside of AMD.
>
>
> I think I've spotted one bug in your changes, in ms_present_check_unflip:
>
>     if (ms->drmmode.sprites_visible > 0)
>         ms->flip_window =3D window;
>
> ms_present_check_flip has:
>
>     if (ms->drmmode.sprites_visible > 0)
>         return FALSE;
>
>     return ms_present_check_unflip(crtc, window, pixmap, sync_flip,
> reason);
>
> So the condition can never be true in ms_present_check_unflip, and it
> never updates ms->flip_window.
>
>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
>

--0000000000005bc0a605a67ba0e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for your quick check Michel. I had removed the cond=
ition in my local source in ms_present_check_unflip() method and moved the =
assignment to ms_present_check_flip() method. Below is the snippet.<div><br=
></div><div>static Bool ms_present_check_flip(RRCrtcPtr crtc,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WindowPt=
r window,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 PixmapPtr pixmap,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Bool sync_flip,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PresentFlipReas=
on *reason)=C2=A0<br></div><div>{</div><div>=C2=A0 =C2=A0 if (ms-&gt;drmmod=
e.sprites_visible &gt; 0)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br><=
br>=C2=A0 =C2=A0 Bool ret =3D ms_present_check_unflip(crtc, window, pixmap,=
 sync_flip, reason);<br>=C2=A0 =C2=A0 ms-&gt;flip_window =3D window;<br>=C2=
=A0 =C2=A0 return ret;<br></div><div>}</div><div><br></div><div>Still the p=
roblem exists.</div><div><br></div><div>Thanks=C2=A0</div><div>Uday Kiran</=
div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, May 25, 2020 at 9:49 PM Michel D=C3=A4nzer &lt;<=
a href=3D"mailto:michel@daenzer.net">michel@daenzer.net</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On 2020-05-25 4:58 p=
.m., uday kiran pichika wrote:<br>
&gt; Thanks Michel..<br>
&gt; <br>
&gt; sorry if my description is not clear.<br>
&gt; Yes I have used with glxgears in fullscreen mode and also a simple glx=
app<br>
&gt; which actually opens in fullscreen by default.<br>
&gt; <br>
&gt; In both the cases, the issue is same.<br>
&gt; <br>
&gt; Just wanted to know if AMD has done anything different apart from the<=
br>
&gt; configurations either in MESA or in its Radeon driver ?<br>
<br>
The code you can see in xf86-video-amdgpu and Mesa is working for lots<br>
of people, most of them outside of AMD.<br>
<br>
<br>
I think I&#39;ve spotted one bug in your changes, in ms_present_check_unfli=
p:<br>
<br>
=C2=A0 =C2=A0 if (ms-&gt;drmmode.sprites_visible &gt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ms-&gt;flip_window =3D window;<br>
<br>
ms_present_check_flip has:<br>
<br>
=C2=A0 =C2=A0 if (ms-&gt;drmmode.sprites_visible &gt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
<br>
=C2=A0 =C2=A0 return ms_present_check_unflip(crtc, window, pixmap, sync_fli=
p, reason);<br>
<br>
So the condition can never be true in ms_present_check_unflip, and it<br>
never updates ms-&gt;flip_window.<br>
<br>
<br>
-- <br>
Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"https://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://redhat=
.com</a><br>
Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mesa and X developer<br>
</blockquote></div>

--0000000000005bc0a605a67ba0e1--

--===============1695917386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1695917386==--
