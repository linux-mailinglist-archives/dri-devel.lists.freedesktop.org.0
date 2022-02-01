Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9587D4A6813
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 23:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7823710E17F;
	Tue,  1 Feb 2022 22:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx5.ucr.edu (mx.ucr.edu [138.23.62.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D6610E17F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 22:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1643755037; x=1675291037;
 h=mime-version:references:in-reply-to:from:date:message-id:
 subject:to:cc; bh=9FGFQSH1ohy4YX/lw1KMFa7Q1oXzBblq3MZvKkGHLMs=;
 b=tyAGbSmjtBJLRnhy+x1c6WRshVr4BSNXp/N5SATO9XBYSWCYdVDDfKPu
 SrY77pqcw1IZnd9JLxeZ4r0ge7qinNc7WCkPedebjSn8AOhk/CIyZYTwL
 p/ae+8TrK2cDKrfdGqOeMEAp+uNy7jsI05GrQ8XK/Zc46K+UikAShjsOS
 4gLwdHKvc4leEJMCQEPK78zSewJfldpDOPE82Ac6Auc1KynXx7LYPNpV7
 8g6ZnRL9EOSktgatT/8CqIztTncBUOZ2DsGo687ku1+luvOfAyJTxa6On
 xTmYLU1D0qMX+aPtK+nAtt+QZNE7LtiIQftgrdm/+fmpCQtvc0/2eV/xz g==;
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
 d="scan'208,217";a="273142866"
Received: from mail-yb1-f199.google.com ([209.85.219.199])
 by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Feb 2022 14:37:16 -0800
Received: by mail-yb1-f199.google.com with SMTP id
 127-20020a250f85000000b00611ab6484abso36010167ybp.23
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 14:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZCxDb0CydtG7ibErZFrZwNhWotl0dZtH/WOoGbnF67A=;
 b=QcBm0/WjFHHD86gNfAXhotZ4aBOIQJRhe3J/z+AFtguybue+FfJoMZ8usmFk2TGPxY
 sFO0Cc3hi2B/o31qwVMlmzqdBR0EM7OhUvRL1v0eGYa+qIpgY6Kh5PtKg/YKqf4HUTcf
 IM1qkXn+5Th6utNnLkfs8ulWirA09Ni2meOhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZCxDb0CydtG7ibErZFrZwNhWotl0dZtH/WOoGbnF67A=;
 b=jdrKLfyHDSHP1DmORaM5m79efm+ya5I360SO7u8IGvsboc2ZVcHt3BuDGFT5cPhe/Y
 lQsL3+JgK2wt8mSf9dT9o0K68imea4SKhJ7kKxCXBGHDiQV95vfTUs3LMINKggnOClZw
 V5xtJrP0Mjz3oDra45CjLtSXlJEt0L6YHWlb2692fzgWHyqMiLthJat/sBs7iuSQ5R8O
 JERPcXr25pF3Qu0W42PiGCoSd0TJ3J3JY24xGSHI9w3Sb3tOCJdFo3GkhLcQHcH5gIKu
 RedeQB3X01jZfZp5KRXgnQXf+f4CjcTvmbpEVx27VXeuZNDkxmXQg/pCu/nn4o3vFkfU
 Jhvw==
X-Gm-Message-State: AOAM532k1KANJseDThmttJFCj2eOAm0EfbtxZxGLRvLhgChuBExeNEzH
 fCL5ZHtpK8RVcd1XovdcrbhYs/3pmq7GbdsCQVBrSTIUXJdFthPdBSGUfPxqRWvQHHRPoQsI0mL
 ClLagY6AdyP3hWEi4C2yxu/uscKz50Ijyl4hwpSq/te7vmA==
X-Received: by 2002:a5b:ec6:: with SMTP id a6mr38595590ybs.379.1643755034785; 
 Tue, 01 Feb 2022 14:37:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz06hvS2fwK0VWZJ8P+zceVfdbDSrDZvkk+ikuCRRFJfONHDKSQAhQjIBQWJvmLzqpFHx46E5giQInKzlmW5Po=
X-Received: by 2002:a5b:ec6:: with SMTP id a6mr38595568ybs.379.1643755034603; 
 Tue, 01 Feb 2022 14:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20220131065719.1552958-1-yzhai003@ucr.edu>
 <b1c1f68d-4620-2429-66bd-33d806d31457@gmx.de>
In-Reply-To: <b1c1f68d-4620-2429-66bd-33d806d31457@gmx.de>
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Tue, 1 Feb 2022 14:37:03 -0800
Message-ID: <CABvMjLSDMTZ2GQS9M=PqWkv1xrLC1s8FRXeS9kNdY_e3o5mf1g@mail.gmail.com>
Subject: Re: [PATCH] fbdev: fbmem: Fix the implicit type casting
To: Helge Deller <deller@gmx.de>
Content-Type: multipart/alternative; boundary="000000000000ef827805d6fc8a29"
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
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Zheyu Ma <zheyuma97@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000ef827805d6fc8a29
Content-Type: text/plain; charset="UTF-8"

Hi Helge:
I shipped a new patch which moves the check before the function call,
please take a look and see if this one makes sense to you.
Modifying the type of function argument is a bit risky because fb_blank()
has more than one caller and some of them passed in an integer.

Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
---
 drivers/video/fbdev/core/fbmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c
b/drivers/video/fbdev/core/fbmem.c
index 0fa7ede94fa6..991711bfd647 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1162,6 +1162,8 @@ static long do_fb_ioctl(struct fb_info *info,
unsigned int cmd,
        case FBIOBLANK:
                console_lock();
                lock_fb_info(info);
+               if (arg > FB_BLANK_POWERDOWN)
+                       arg = FB_BLANK_POWERDOWN;
                ret = fb_blank(info, arg);
                /* might again call into fb_blank */
                fbcon_fb_blanked(info, arg);
-- 
2.25.1

On Tue, Feb 1, 2022 at 7:03 AM Helge Deller <deller@gmx.de> wrote:

> On 1/31/22 07:57, Yizhuo Zhai wrote:
> > In function do_fb_ioctl(), the "arg" is the type of unsigned long,
>
> yes, because it comes from the ioctl framework...
>
> > and in "case FBIOBLANK:" this argument is casted into an int before
> > passig to fb_blank().
>
> which makes sense IMHO.
>
> > In fb_blank(), the comparision if (blank > FB_BLANK_POWERDOWN) would
> > be bypass if the original "arg" is a large number, which is possible
> > because it comes from the user input.
>
> The main problem I see with your patch is that you change the behaviour.
> Let's assume someone passes in -1UL.
> With your patch applied, this means the -1 (which is e.g. 0xffffffff on
> 32bit)
> is converted to a positive integer and will be capped to
> FB_BLANK_POWERDOWN.
> Since most blank functions just check and react on specific values, you
> changed
> the behaviour that the screen now gets blanked at -1, while it wasn't
> before.
>
> One could now argue, that it's undefined behaviour if people
> pass in wrong values, but anyway, it's different now.
>
> So, your patch isn't wrong. I'm just not sure if this is what we want...
>
> Helge
>
>
> > Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> > ---
> >  drivers/video/fbdev/core/fbmem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/video/fbdev/core/fbmem.c
> b/drivers/video/fbdev/core/fbmem.c
> > index 0fa7ede94fa6..a5f71c191122 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -1064,7 +1064,7 @@ fb_set_var(struct fb_info *info, struct
> fb_var_screeninfo *var)
> >  EXPORT_SYMBOL(fb_set_var);
> >
> >  int
> > -fb_blank(struct fb_info *info, int blank)
> > +fb_blank(struct fb_info *info, unsigned long blank)
> >  {
>


-- 
Kind Regards,

*Yizhuo Zhai*

*Computer Science, Graduate Student*
*University of California, Riverside *

--000000000000ef827805d6fc8a29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Helge:<div>I shipped a new patch which moves the check =
before the function call, please take a look and see if this one makes sens=
e to you.</div><div>Modifying the type of function argument is a bit risky =
because fb_blank() has more than one caller and some of them passed in an i=
nteger.</div><div><br></div><div>Signed-off-by: Yizhuo Zhai &lt;<a href=3D"=
mailto:yzhai003@ucr.edu" target=3D"_blank">yzhai003@ucr.edu</a>&gt;<br>---<=
br>=C2=A0drivers/video/fbdev/core/fbmem.c | 2 ++<br>=C2=A01 file changed, 2=
 insertions(+)<br><br>diff --git a/drivers/video/fbdev/core/fbmem.c b/drive=
rs/video/fbdev/core/fbmem.c<br>index 0fa7ede94fa6..991711bfd647 100644<br>-=
-- a/drivers/video/fbdev/core/fbmem.c<br>+++ b/drivers/video/fbdev/core/fbm=
em.c<br>@@ -1162,6 +1162,8 @@ static long do_fb_ioctl(struct fb_info *info,=
 unsigned int cmd,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 case FBIOBLANK:<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 console_lock();<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock_fb_info(info);<br>+=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (arg &gt; FB_BLAN=
K_POWERDOWN)<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0arg =3D FB_BLANK_POWERDOWN;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fb_blank(info, arg);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* might again call in=
to fb_blank */<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
bcon_fb_blanked(info, arg);<font color=3D"#888888"><br>--<span class=3D"gma=
il-Apple-converted-space">=C2=A0</span><br>2.25.1</font><br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, F=
eb 1, 2022 at 7:03 AM Helge Deller &lt;<a href=3D"mailto:deller@gmx.de">del=
ler@gmx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">On 1/31/22 07:57, Yizh=
uo Zhai wrote:<br>
&gt; In function do_fb_ioctl(), the &quot;arg&quot; is the type of unsigned=
 long,<br>
<br>
yes, because it comes from the ioctl framework...<br>
<br>
&gt; and in &quot;case FBIOBLANK:&quot; this argument is casted into an int=
 before<br>
&gt; passig to fb_blank().<br>
<br>
which makes sense IMHO.<br>
<br>
&gt; In fb_blank(), the comparision if (blank &gt; FB_BLANK_POWERDOWN) woul=
d<br>
&gt; be bypass if the original &quot;arg&quot; is a large number, which is =
possible<br>
&gt; because it comes from the user input.<br>
<br>
The main problem I see with your patch is that you change the behaviour.<br=
>
Let&#39;s assume someone passes in -1UL.<br>
With your patch applied, this means the -1 (which is e.g. 0xffffffff on 32b=
it)<br>
is converted to a positive integer and will be capped to FB_BLANK_POWERDOWN=
.<br>
Since most blank functions just check and react on specific values, you cha=
nged<br>
the behaviour that the screen now gets blanked at -1, while it wasn&#39;t b=
efore.<br>
<br>
One could now argue, that it&#39;s undefined behaviour if people<br>
pass in wrong values, but anyway, it&#39;s different now.<br>
<br>
So, your patch isn&#39;t wrong. I&#39;m just not sure if this is what we wa=
nt...<br>
<br>
Helge<br>
<br>
<br>
&gt; Signed-off-by: Yizhuo Zhai &lt;<a href=3D"mailto:yzhai003@ucr.edu" tar=
get=3D"_blank">yzhai003@ucr.edu</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/video/fbdev/core/fbmem.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/co=
re/fbmem.c<br>
&gt; index 0fa7ede94fa6..a5f71c191122 100644<br>
&gt; --- a/drivers/video/fbdev/core/fbmem.c<br>
&gt; +++ b/drivers/video/fbdev/core/fbmem.c<br>
&gt; @@ -1064,7 +1064,7 @@ fb_set_var(struct fb_info *info, struct fb_var_s=
creeninfo *var)<br>
&gt;=C2=A0 EXPORT_SYMBOL(fb_set_var);<br>
&gt;<br>
&gt;=C2=A0 int<br>
&gt; -fb_blank(struct fb_info *info, int blank)<br>
&gt; +fb_blank(struct fb_info *info, unsigned long blank)<br>
&gt;=C2=A0 {<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><span style=3D"font-size:14px">=
Kind Regards,</span><div style=3D"font-size:14px"><br><div><font face=3D"ar=
ial, helvetica, sans-serif" size=3D"2"><b>Yizhuo Zhai</b></font></div></div=
><div style=3D"font-size:14px"><br></div><div style=3D"font-size:14px"><b>C=
omputer Science, Graduate Student</b></div><div style=3D"font-size:14px"><b=
>University of California, Riverside=C2=A0</b></div></div></div>

--000000000000ef827805d6fc8a29--
