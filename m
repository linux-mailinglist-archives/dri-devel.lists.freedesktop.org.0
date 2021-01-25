Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4DC302C03
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 20:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7581489D2E;
	Mon, 25 Jan 2021 19:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DDD89D2E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 19:53:21 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id n6so16974505edt.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 11:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j8H6e6keC+ETYFc20bGAxKOJDu4ph1xWcNUzqW83XeQ=;
 b=AUCJsZWwKCx8tOui6rF8c+LVMbXqVgiIm2FKxdsbzHAHu8lIZf1kKqhB0cAg6KaT1c
 Kskc6y1+TjnN4eHTNHFnEYfN4TUxKpb8aqOmOxIpwMHyWDfiOgcPLLURcqwVV36DD26+
 NofK+Vx0jhAEFIJ6x9BQkAaXAGYycYU9TazOA5Bo5O09oLYQ0sCIfByTJTY07SoJuXOl
 L4SnAys4FFT5NY+buXRneLWlzFeK8SdCWTKpBwtBA+x55fp1AjyxxV8f9pv28QX8pEDf
 lw2fvI3Gw4UAGyegqc4CotT80PX2t0u3eF/mv1ZHbc4QrwO7x2LNR8+gUmfu8QifLuau
 dj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j8H6e6keC+ETYFc20bGAxKOJDu4ph1xWcNUzqW83XeQ=;
 b=Sivps/VF1xCsTktz20c6hQohbGZIrrxe/rQh5rqFsfSBmwitp/Bz44vBVO14leXuKm
 rm/24fYUt3HRfYlkJUwFfTMgJe+Gd9MbOZ/Aj9kCPJ/mniA5uFAnuW5g3UtEW9f8N1Sa
 zyqSQ+SEOOPnHRvMifEc0S376rpIYbFICcduXMBMSAlkNNPsUlHn/7vX37sV87JQJR3B
 uHYXll9yZd5uzPagWBbkHMnsPRE/VlFF5IxbwJcZY/BxkK6HzBiZZGkB1+0WkC3kk93/
 1v0RCZwxlAsnA+bcdFQosdv6yxClcjga2PmA1ud80/Sdx0q/F+QH0ZSyxaYo1/Z9AC8F
 8SqQ==
X-Gm-Message-State: AOAM531Uc17GrVcI1i+XOD99DJKXT+YlcN2aNOp4F5cp74cbYlbPC7Pi
 ZZWeuVOqCL6VDI7PTYExxgTjyFCsm+hT0hFHcY8=
X-Google-Smtp-Source: ABdhPJxfF6uCKMiMx6tLWK85cDSEtmcTV9+Ty8hFLSwli4vfZ9nFkV9fp0GIUx6/1SEP0gLIGMsTKug7Ov+rwMEEHlY=
X-Received: by 2002:a05:6402:1a57:: with SMTP id
 bf23mr1834884edb.183.1611604400112; 
 Mon, 25 Jan 2021 11:53:20 -0800 (PST)
MIME-Version: 1.0
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <86DkveYU9PqmKT4KfDgHvFG_SytoDc4EyfmehALDIJBt7oH3Arn8O97o-pQ3yRU-kfHi-RuwA9zdI-Kz1aZUQBuOSnqmz1GdrRUNPNRsEu4=@emersion.fr>
 <CAEsyxyj-dHAk0qkkpOsycqfpPi_FW5zh_58hs1gi+6h1M_b8-Q@mail.gmail.com>
 <yEq1_Ipkzm_vP4BD6cKlonRVfMbfGXrlvxOG4XDkk_wg1UkPCdLj95I8pknonGjf2Bs1zYeErr1WXerrQjprE3k1vswj3E2Nzq-imF58ytM=@emersion.fr>
 <CAEsyxyhXhJohDYuDDLoQeg-QqhnWQ953GRO0Kf6Puj=f_NkU4w@mail.gmail.com>
 <YA61Aa07PhDucMyG@intel.com>
 <-NvMjiGAV79IMWvTOWrb2u_SHe2U36XumXbITMgCCqpMVg-FcvGRJbeTHaiUwkBSxZS5XaXYziZnoTdXJENA-JYQWNi-28F01___0SsWvv0=@emersion.fr>
 <CAEsyxyiK+bDyLDsk-jG3GGYWBjkGZeFamutmtDiNYvJSm4qegg@mail.gmail.com>
 <7Zl9uZ-uolN1JkU8Muxro-A5gTSN2SmmxYhs9g2UYfTFCJIoZVMIdkcPBbR6nkTxb3gWSwqTAsCfnlrtNzH133HdIZ9dCYcwZchv0iXZCnA=@emersion.fr>
In-Reply-To: <7Zl9uZ-uolN1JkU8Muxro-A5gTSN2SmmxYhs9g2UYfTFCJIoZVMIdkcPBbR6nkTxb3gWSwqTAsCfnlrtNzH133HdIZ9dCYcwZchv0iXZCnA=@emersion.fr>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Mon, 25 Jan 2021 20:53:05 +0100
Message-ID: <CAEsyxygB-VZHg9a68Qb3XJ+xULwEeCkUFfthN4H+sdoVRXmJ2Q@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
To: Simon Ser <contact@emersion.fr>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0031682290=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0031682290==
Content-Type: multipart/alternative; boundary="000000000000c9854a05b9bee32b"

--000000000000c9854a05b9bee32b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 5:05 PM Simon Ser <contact@emersion.fr> wrote:

> =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original =
Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
>
> On Monday, January 25th, 2021 at 5:00 PM, Mario Kleiner <
> mario.kleiner.de@gmail.com> wrote:
>
> > On Mon, Jan 25, 2021 at 1:14 PM Simon Ser <contact@emersion.fr> wrote:
> >
> > > > This is not an uapi defintion anyway so fixing should be fine.
> > >
> > > Oh, my bad, I thought this was in drm_mode.h, but it's not. Then yeah
> > >
> > > should be completely fine to fix it.
> >
> > Good! The beginning of the end of a sad story ;). So i guess i can
> > get your r-b's for it?
>
> Sorry, I haven't verified that this wouldn't break the world, so I'm
> not comfortable giving a R-b.
>
>
Breaking the world is pretty unlikely for an unused #define, but I
understand.

I guess Ville will have access to the relevant spec to verify: It is the
CTA-861-G spec, table 44 in section 6.9 and also specifically section 6.9.1=
.


> > Will this fix propagate into igt and libdrm? Or are separate fixup
> patches needed?
>
> No, since this is not part of UAPI.
>

Ok. I'll submit patches once this one landed in the kernel.


>
> > Simon, could you let the Kodi devs know in case you have a line to
> > them? I didn't know that there is even one more real-world HDR client
> > for Linux, apart from AMD's amdvlk Vulkan driver, which does things
> > right and doesn't need fixing.
>
> Seems like Kodi hardcodes the bad version:
>
>
> https://github.com/xbmc/xbmc/blob/aa5c2e79c069ba7d0ab1d8ad930e4294bf55468=
0/xbmc/cores/VideoPlayer/Buffers/VideoBufferDRMPRIME.h#L24
>
>
Thanks. I've filed an issue to them under:

https://github.com/xbmc/xbmc/issues/19122


> Maybe we should add the good version in UAPI header?
>

I'm scared that future HDR definitions would be as carefully done and
reviewed as this one, given how much harder it would be to fix them :/
But maybe that's just exhausted me who spent too many weeks dealing with
HDR bugs everywhere.

-mario

--000000000000c9854a05b9bee32b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 25, 2021 at 5:05 PM Simon=
 Ser &lt;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=E2=80=
=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Message =
=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90<br>
<br>
On Monday, January 25th, 2021 at 5:00 PM, Mario Kleiner &lt;<a href=3D"mail=
to:mario.kleiner.de@gmail.com" target=3D"_blank">mario.kleiner.de@gmail.com=
</a>&gt; wrote:<br>
<br>
&gt; On Mon, Jan 25, 2021 at 1:14 PM Simon Ser &lt;<a href=3D"mailto:contac=
t@emersion.fr" target=3D"_blank">contact@emersion.fr</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; &gt; This is not an uapi defintion anyway so fixing should be fin=
e.<br>
&gt; &gt;<br>
&gt; &gt; Oh, my bad, I thought this was in drm_mode.h, but it&#39;s not. T=
hen yeah<br>
&gt; &gt;<br>
&gt; &gt; should be completely fine to fix it.<br>
&gt;<br>
&gt; Good! The beginning of the end of a sad story ;). So i guess i can<br>
&gt; get your r-b&#39;s for it?<br>
<br>
Sorry, I haven&#39;t verified that this wouldn&#39;t break the world, so I&=
#39;m<br>
not comfortable giving a R-b.<br>
<br></blockquote><div><br></div><div>Breaking the world is pretty unlikely =
for an unused #define, but I understand.</div><div><br></div><div>I guess V=
ille will have access to the relevant spec to verify: It is the CTA-861-G s=
pec, table 44 in section 6.9 and also specifically section 6.9.1.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Will this fix propagate into igt and libdrm? Or are separate fixup pat=
ches needed?<br>
<br>
No, since this is not part of UAPI.<br></blockquote><div><br></div><div>Ok.=
 I&#39;ll submit patches once this one landed in the kernel.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Simon, could you let the Kodi devs know in case you have a line to<br>
&gt; them? I didn&#39;t know that there is even one more real-world HDR cli=
ent<br>
&gt; for Linux, apart from AMD&#39;s amdvlk Vulkan driver, which does thing=
s<br>
&gt; right and doesn&#39;t need fixing.<br>
<br>
Seems like Kodi hardcodes the bad version:<br>
<br>
<a href=3D"https://github.com/xbmc/xbmc/blob/aa5c2e79c069ba7d0ab1d8ad930e42=
94bf554680/xbmc/cores/VideoPlayer/Buffers/VideoBufferDRMPRIME.h#L24" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/xbmc/xbmc/blob/aa5c2e79c0=
69ba7d0ab1d8ad930e4294bf554680/xbmc/cores/VideoPlayer/Buffers/VideoBufferDR=
MPRIME.h#L24</a><br>
<br></blockquote><div><br></div><div>Thanks. I&#39;ve filed an issue to the=
m under:</div><div><br></div><div><a href=3D"https://github.com/xbmc/xbmc/i=
ssues/19122">https://github.com/xbmc/xbmc/issues/19122</a></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
Maybe we should add the good version in UAPI header?<br></blockquote><div><=
br></div><div>I&#39;m scared that future HDR definitions would be as carefu=
lly done and reviewed as this one, given how much harder it would be to fix=
 them :/<br></div><div>But maybe that&#39;s just exhausted me who spent too=
 many weeks dealing with HDR bugs everywhere.</div><div><br></div><div>-mar=
io</div><div><br></div></div></div>

--000000000000c9854a05b9bee32b--

--===============0031682290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0031682290==--
