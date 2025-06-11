Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30601AD5B58
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 18:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E8910E6CD;
	Wed, 11 Jun 2025 16:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="atexfKO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F8510E6CD
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 16:01:21 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e733a6ff491so6697228276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749657681; x=1750262481; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X2QKbURlEeqJ8/GZV2o7MhfyviRc020vGJi5w+qfU20=;
 b=atexfKO2UTyluzyRcVHg8Xz4M/zEM/zKrGGhaIS1ovuyucK5A0ym75cVIOyRLo0EQZ
 eMZYTKORITBUK1jV9CxMgsGlPkC8Kaoug8Y9zNeqc6LSfcGOGRHwc0pJqDXv++igR0ZA
 Vgr4aC2QYUR9jYhd0YckF035syL6nT8habsJcpgoT93Bnf1MFB4/cW0bryhjChHj3HMw
 KkeOKvi8QkBROBTZHgjuCaNDWBwez3JfMtDhrXOg9I9VDp168AZ+pUXIUAfeiltsXa1k
 2eiTdnfeAgh/mUtAF3I6qXk8sF8jZ12M3Z2+KovvvGgFk4p2hlpG6TTDOaMJW4Mv3xHz
 6D+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749657681; x=1750262481;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X2QKbURlEeqJ8/GZV2o7MhfyviRc020vGJi5w+qfU20=;
 b=C/UtP7C4IC/BuRsQ1LufUpRVmRJAt8BSnaN5Tg76XQZz7tv6WCXfTj2ZeV03V8t0mE
 6FnC9NVSLbcgFIVYaCjXuYfto6d2mGa4iPn75OoGyFOVQz35lkaWrQpU36i9Pji60uMb
 BVkSr7RE8RWJgwSBBsHZ/d+br1nyfiPNbX39zAxwIqhjgTfB6vfuyYmnVitGnlyQ3b0V
 uz2YGWrpEt9LwyN6JqkXHahGdFBJdBHmstcisI1gm4HUJ6bVV0QjNS6l20JrAeNXunOH
 NzfNcD9qAE2Jso6a7vpQDpK9UzRGJN9nK0iPVqUu6SyLnE55y8chK14Ywl7b3e9Cso+T
 r5pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2bq4m6jPoG/iIVFdTkVDanZfXKo4Sn+IPo5tzRQFPxbGyeya6eGqpHmdu6Qu99qRLkAHoM4WFgVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH99mfxvcNHfkJgS8BG5E9Rfmk53MbhIamkrHCxrg0IjDaU23i
 FAP8/wQbnJa2ARu+vxBqaM6EXCDf50mTQDnvQz/rjBEtrbpB17JFdUFcEBLuyMrKCPVRTuB6xSo
 9cH3uJM3GgvgIBAapWzdaQRU0daij8RU=
X-Gm-Gg: ASbGncuCMCkuxmDgxHXY1dqManaWYSBxBIbfG4K4GdAQGOsn/4kQklVyrUFcQ+qcK6r
 WyMAR8r8bGz47PjRokJQTOvirIq28aw5Hz1ZLaVcqCFXx6QCk7MwqH4L26QhAy2W0QF7tLtkTmB
 /lT6Z3Wo4BvcRLgZ/U3traIAaCUngqhblNFp+cWKnVtJip
X-Google-Smtp-Source: AGHT+IEY3p0VKwRquaUSHsvRS+ozpUXPCvbj4gsp0Qz+jFf4tQiwZf4U7hsAjHFhMSjdAeTau9mnHTCc2NOSiA1ADn0=
X-Received: by 2002:a05:6902:220c:b0:e81:d976:ce25 with SMTP id
 3f1490d57ef6-e820b64c93cmr138436276.3.1749657680571; Wed, 11 Jun 2025
 09:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250607194959.2457473-1-alexguo1023@gmail.com>
 <CAMuHMdW5wU1ForGOGD-+HDUu7wcnBx3jx911nLEqbJ71t4MBsg@mail.gmail.com>
In-Reply-To: <CAMuHMdW5wU1ForGOGD-+HDUu7wcnBx3jx911nLEqbJ71t4MBsg@mail.gmail.com>
From: Jin D <alexguo1023@gmail.com>
Date: Wed, 11 Jun 2025 12:01:09 -0400
X-Gm-Features: AX0GCFtExeJpAnuEuLzAwjlTXzL-hvrFGE6lk8CDt3A7K7uBdSb3cYni7AUSpGc
Message-ID: <CAAi4Z-fypJGSZLBcaudeDOG7AyMfU4ZoaMFqpZKnz-EX2LoXbg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: pm3fb: Fix potential divide by zero
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: deller@gmx.de, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000087745006374dec1c"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000087745006374dec1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greet,

Thanks for your confirmation and suggestions.

I added this patch based on existing checks on var->pixclock in other
drivers, such as savagefb_check_var, nvidiafb_check_var, etc.
Are you suggesting that it is better to replace an invalid value
(var->pixclock =3D=3D 0) with a default valid value, instead of returning
-EINVAL? If so, could you advise what a suitable default value would be for
this case?

Actually, I have found a few similar issues in other functions as well. I
would like to make sure I am addressing them in the correct way.

Best,
Alex

On Tue, Jun 10, 2025 at 3:42=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org>
wrote:

> Hi Alex,
>
> On Sat, 7 Jun 2025 at 22:14, Alex Guo <alexguo1023@gmail.com> wrote:
> > variable var->pixclock can be set by user. In case it equals to
> >  zero, divide by zero would occur in pm3fb_check_var. Similar
> > crashes have happened in other fbdev drivers. There is no check
> > and modification on var->pixclock along the call chain to
> > pm3fb_check_var. So we fix this by checking whether 'pixclock'
> > is zero.
> >
> > Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
> > Error out if 'pixclock' equals zero")
> >
> > Signed-off-by: Alex Guo <alexguo1023@gmail.com>
>
> Thanks for your patch, which is now commit 59d1fc7b3e1ae9d4
> ("fbdev: pm3fb: fix potential divide by zero") in fbdev/for-next.
>
> > --- a/drivers/video/fbdev/pm3fb.c
> > +++ b/drivers/video/fbdev/pm3fb.c
> > @@ -998,6 +998,9 @@ static int pm3fb_check_var(struct fb_var_screeninfo
> *var, struct fb_info *info)
> >                 return -EINVAL;
> >         }
> >
> > +       if (!var->pixclock)
> > +               return -EINVAL;
>
> While this fixes the crash, this is correct behavior for an fbdev driver.
> When a value is invalid, it should be rounded up to a valid value instead=
,
> if possible.
>
> > +
> >         if (PICOS2KHZ(var->pixclock) > PM3_MAX_PIXCLOCK) {
> >                 DPRINTK("pixclock too high (%ldKHz)\n",
> >                         PICOS2KHZ(var->pixclock));
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker.
> But
> when I'm talking to journalists I just say "programmer" or something like
> that.
>                                 -- Linus Torvalds
>

--00000000000087745006374dec1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Greet,</div><div><br></div><div>Thanks for your co=
nfirmation and suggestions.<br><br>I added this patch based on existing che=
cks on var-&gt;pixclock in other drivers, such as savagefb_check_var, nvidi=
afb_check_var, etc.<br>Are you suggesting that it is better to replace an i=
nvalid value (var-&gt;pixclock =3D=3D 0) with a default valid value, instea=
d of returning -EINVAL? If so, could you advise what a suitable default val=
ue would be for this case?<br><br>Actually, I have found a few similar issu=
es in other=C2=A0functions as well. I would like to make sure I am addressi=
ng them in the correct way.<br><br>Best,<br>Alex</div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, Jun 10, 2025 at 3:42=E2=80=AFAM Geert Uytterhoeven &lt;<a href=3D"mailto=
:geert@linux-m68k.org">geert@linux-m68k.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi Alex,<br>
<br>
On Sat, 7 Jun 2025 at 22:14, Alex Guo &lt;<a href=3D"mailto:alexguo1023@gma=
il.com" target=3D"_blank">alexguo1023@gmail.com</a>&gt; wrote:<br>
&gt; variable var-&gt;pixclock can be set by user. In case it equals to<br>
&gt;=C2=A0 zero, divide by zero would occur in pm3fb_check_var. Similar<br>
&gt; crashes have happened in other fbdev drivers. There is no check<br>
&gt; and modification on var-&gt;pixclock along the call chain to<br>
&gt; pm3fb_check_var. So we fix this by checking whether &#39;pixclock&#39;=
<br>
&gt; is zero.<br>
&gt;<br>
&gt; Similar commit: commit 16844e58704 (&quot;video: fbdev: tridentfb:<br>
&gt; Error out if &#39;pixclock&#39; equals zero&quot;)<br>
&gt;<br>
&gt; Signed-off-by: Alex Guo &lt;<a href=3D"mailto:alexguo1023@gmail.com" t=
arget=3D"_blank">alexguo1023@gmail.com</a>&gt;<br>
<br>
Thanks for your patch, which is now commit 59d1fc7b3e1ae9d4<br>
(&quot;fbdev: pm3fb: fix potential divide by zero&quot;) in fbdev/for-next.=
<br>
<br>
&gt; --- a/drivers/video/fbdev/pm3fb.c<br>
&gt; +++ b/drivers/video/fbdev/pm3fb.c<br>
&gt; @@ -998,6 +998,9 @@ static int pm3fb_check_var(struct fb_var_screeninf=
o *var, struct fb_info *info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
INVAL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!var-&gt;pixclock)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
<br>
While this fixes the crash, this is correct behavior for an fbdev driver.<b=
r>
When a value is invalid, it should be rounded up to a valid value instead,<=
br>
if possible.<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (PICOS2KHZ(var-&gt;pixclock) &gt; =
PM3_MAX_PIXCLOCK) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPRINTK(&=
quot;pixclock too high (%ldKHz)\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0PICOS2KHZ(var-&gt;pixclock));<br>
<br>
Gr{oetje,eeting}s,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert<br>
<br>
-- <br>
Geert Uytterhoeven -- There&#39;s lots of Linux beyond ia32 -- <a href=3D"m=
ailto:geert@linux-m68k.org" target=3D"_blank">geert@linux-m68k.org</a><br>
<br>
In personal conversations with technical people, I call myself a hacker. Bu=
t<br>
when I&#39;m talking to journalists I just say &quot;programmer&quot; or so=
mething like that.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -- Linus Torvalds<br>
</blockquote></div></div>

--00000000000087745006374dec1c--
