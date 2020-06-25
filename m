Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F87720AD46
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 09:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885CF6E435;
	Fri, 26 Jun 2020 07:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7404089211;
 Thu, 25 Jun 2020 15:38:03 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id v8so6432109iox.2;
 Thu, 25 Jun 2020 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V4t//RWDrfmncIQnHM6GEAeXVkF6L2a+C0gUwQCVi5I=;
 b=M0SDVpyuxU4tkHROgfkdGqoUcDgnebGq27cMjrEW/OpNKGylMvS2R/weC9tAmF1tTD
 9UwBYPpbNsl8PCzbHhJegodnXYbmSMr97WxlcLE0JAStpbB11/LIQIBAmpvxNTC5f2CU
 CNZ7lNCqiErBqGm1WL//TOGBq0r5OPd2GAvmZd8jJ7aWqowuJ/kdZ+l4/g2SYje2YCz1
 3LEOI8DjDZcKo3HJmGUs8ijTxe4qy9f6ziEiDK/k6Ygrz1S++iMz9Ec3zpo0Jy2xUR0O
 c3/Mg9Q10PHwouCettDRYGi+r+BgnrwXmpG1yVv4ZMLNWxCycSSgxJHjDpi8F6Z41P77
 U/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V4t//RWDrfmncIQnHM6GEAeXVkF6L2a+C0gUwQCVi5I=;
 b=AES7tkMmA8zcQRlM5by/tmnjxXrDsJZ2hDqX7eu1KrM6ujjv3VZvXTv3V3RKsr8P7T
 vDLt3cuOwb+kXrxPrrqifwzIveO27OiREuqv/2dw1gw0ryd8nwxRq4LNhKmwj5BQnkfD
 6me3Dt1iuowKrbPTE2eGkK42IqTELJX/EeIyxa3EFg8DiFvInllqXfspiC3P8r6E3Zj0
 tctJGWMRd7vFmwmnIe1luw023+Ou19KOk/qab6+nYYQ6Cr2CUg3IuDjG6XKTt4Ic0L8n
 Co1E1h/Ww7P78C5jf3Uy9zmsQYH+vqgqXxnRVkAddSxkemSLt3kQrppCPAORt8UybvW+
 z70g==
X-Gm-Message-State: AOAM531ZaSubIsmP0ieM4UkYYWSPtAPkOAQRiB+AQPsY7kCREUp0i4G6
 Wg0k/qo7nsltlVEPvaAYa0miKRW+Fc8kFxIGOoI=
X-Google-Smtp-Source: ABdhPJyr/qPmdVtfpZYzn6RXIk+KLLooRv6C026tLArPHK1qXboP6zX+D9aWd+fiQCsEwKWkUks83XYgLnX9QLMV+24=
X-Received: by 2002:a05:6638:1014:: with SMTP id
 r20mr8744022jab.44.1593099482813; 
 Thu, 25 Jun 2020 08:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583176306.git.agx@sigxcpu.org>
 <4c61fde86c5e0dced249221dbc0a8d4207d5bffa.camel@pengutronix.de>
 <20200625145503.GA48167@bogon.m.sigxcpu.org>
In-Reply-To: <20200625145503.GA48167@bogon.m.sigxcpu.org>
From: Chris Healy <cphealy@gmail.com>
Date: Thu, 25 Jun 2020 08:37:11 -0700
Message-ID: <CAFXsbZpx_YJfnhbsxFGgiiWS6JXNUtKHWKuXGNX73sipEf=2-w@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/etnaviv: Ignore MC bit when checking for runtime
 suspend
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailman-Approved-At: Fri, 26 Jun 2020 07:36:15 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: multipart/mixed; boundary="===============0939394817=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0939394817==
Content-Type: multipart/alternative; boundary="000000000000c3d9df05a8ea6040"

--000000000000c3d9df05a8ea6040
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Would this power difference with the GPU also apply with the GC3000 in the
i.MX6qp or the GC2000 in the i.MX6q?

On Thu, Jun 25, 2020 at 8:04 AM Guido G=C3=BCnther <agx@sigxcpu.org> wrote:

> Hi,
> On Tue, Mar 03, 2020 at 12:55:04PM +0100, Lucas Stach wrote:
> > On Mo, 2020-03-02 at 20:13 +0100, Guido G=C3=BCnther wrote:
> > > At least GC7000 fails to enter runtime suspend for long periods of
> time since
> > > the MC becomes busy again even when the FE is idle. The rest of the
> series
> > > makes detecting similar issues easier to debug in the future by
> checking
> > > all known bits in debugfs and also warning in the EBUSY case.
> >
> > Thanks, series applied to etnaviv/next.
> >
> > > Tested on GC7000 with a reduced runtime delay of 50ms. Patches are
> > > against next-20200226.
> >
> > I've already wondered if 200ms is too long, 50ms sounds more
> > reasonable. Do you have any numbers on the power draw on the i.MX8M
> > with idle GPU, vs. being fully power gated?
>
> The difference is at least 250mW. It makes a huge difference over here.
> We hit
>
> https://lore.kernel.org/dri-devel/20200614064601.7872-1-navid.emamdoost@g=
mail.com/
> recently and you notice instantly when that happens when looking at the
> SoC temperature.
>
> Cheers,
>  -- Guido
> >
> > Regards,
> > Lucas
> >
> > > Thanks to Lucas Stach for pointing me in the right direction.
> > >
> > > Guido G=C3=BCnther (5):
> > >   drm/etnaviv: Fix typo in comment
> > >   drm/etnaviv: Update idle bits
> > >   drm/etnaviv: Consider all kwnown idle bits in debugfs
> > >   drm/etnaviv: Ignore MC when checking runtime suspend idleness
> > >   drm/etnaviv: Warn when GPU doesn't idle fast enough
> > >
> > >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 26 ++++++++++++++++++++++--=
--
> > >  drivers/gpu/drm/etnaviv/state_hi.xml.h |  7 +++++++
> > >  2 files changed, 29 insertions(+), 4 deletions(-)
> > >
> >
> _______________________________________________
> etnaviv mailing list
> etnaviv@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/etnaviv
>

--000000000000c3d9df05a8ea6040
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Would this power difference with the GPU also apply with t=
he GC3000 in the i.MX6qp or the GC2000 in the i.MX6q?<br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 25, 20=
20 at 8:04 AM Guido G=C3=BCnther &lt;<a href=3D"mailto:agx@sigxcpu.org">agx=
@sigxcpu.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi,<br>
On Tue, Mar 03, 2020 at 12:55:04PM +0100, Lucas Stach wrote:<br>
&gt; On Mo, 2020-03-02 at 20:13 +0100, Guido G=C3=BCnther wrote:<br>
&gt; &gt; At least GC7000 fails to enter runtime suspend for long periods o=
f time since<br>
&gt; &gt; the MC becomes busy again even when the FE is idle. The rest of t=
he series<br>
&gt; &gt; makes detecting similar issues easier to debug in the future by c=
hecking<br>
&gt; &gt; all known bits in debugfs and also warning in the EBUSY case.<br>
&gt; <br>
&gt; Thanks, series applied to etnaviv/next.<br>
&gt; <br>
&gt; &gt; Tested on GC7000 with a reduced runtime delay of 50ms. Patches ar=
e<br>
&gt; &gt; against next-20200226.<br>
&gt; <br>
&gt; I&#39;ve already wondered if 200ms is too long, 50ms sounds more<br>
&gt; reasonable. Do you have any numbers on the power draw on the i.MX8M<br=
>
&gt; with idle GPU, vs. being fully power gated?<br>
<br>
The difference is at least 250mW. It makes a huge difference over here.<br>
We hit<br>
<a href=3D"https://lore.kernel.org/dri-devel/20200614064601.7872-1-navid.em=
amdoost@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kerne=
l.org/dri-devel/20200614064601.7872-1-navid.emamdoost@gmail.com/</a><br>
recently and you notice instantly when that happens when looking at the<br>
SoC temperature.<br>
<br>
Cheers,<br>
=C2=A0-- Guido<br>
&gt; <br>
&gt; Regards,<br>
&gt; Lucas<br>
&gt; <br>
&gt; &gt; Thanks to Lucas Stach for pointing me in the right direction.<br>
&gt; &gt; <br>
&gt; &gt; Guido G=C3=BCnther (5):<br>
&gt; &gt;=C2=A0 =C2=A0drm/etnaviv: Fix typo in comment<br>
&gt; &gt;=C2=A0 =C2=A0drm/etnaviv: Update idle bits<br>
&gt; &gt;=C2=A0 =C2=A0drm/etnaviv: Consider all kwnown idle bits in debugfs=
<br>
&gt; &gt;=C2=A0 =C2=A0drm/etnaviv: Ignore MC when checking runtime suspend =
idleness<br>
&gt; &gt;=C2=A0 =C2=A0drm/etnaviv: Warn when GPU doesn&#39;t idle fast enou=
gh<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 drivers/gpu/drm/etnaviv/etnaviv_gpu.c=C2=A0 | 26 ++++++++++=
++++++++++++----<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/etnaviv/state_hi.xml.h |=C2=A0 7 +++++++<br=
>
&gt; &gt;=C2=A0 2 files changed, 29 insertions(+), 4 deletions(-)<br>
&gt; &gt; <br>
&gt; <br>
_______________________________________________<br>
etnaviv mailing list<br>
<a href=3D"mailto:etnaviv@lists.freedesktop.org" target=3D"_blank">etnaviv@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/etnaviv" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/etnaviv</a><br>
</blockquote></div>

--000000000000c3d9df05a8ea6040--

--===============0939394817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0939394817==--
