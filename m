Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9863E7A4212
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C701410E1ED;
	Mon, 18 Sep 2023 07:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB3210E5BD
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 01:58:58 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-565334377d0so1273224a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 18:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694743138; x=1695347938; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7PuSAMxLxInSpL8YXQSiMW4XsaTccFO8KI2y7YfhUos=;
 b=g2FkZzgkv5pec3l9KZbLjSUuiF7a8JO/iAdgJezgKh3FyXVVRWgrWymsXlQ3TPy/3C
 Ht0+zVgU/fJBC4QWx6vqpTAc4IUV/vjprD5cuR3QrQ0oR3/zeUII7dzwZ0ieSo7x2p13
 GMrN1aCzIC1sD7KA3pLaQBv1p9c30ol7qu1wVaBB/g0lBm2maEBhBfuoZVKKAuv2bBJG
 JNV1grV65NIIXW0OQvMBmvG+nXyJOmZyeVLr36lAO2gHYfq0YqrAZGrbQ4NjIouIkRk4
 um5c/x6hcCYetAey47cryU/408Wfx2LLW5EMvs1KWj3NG5mfur7QqvbzeuBmRurhdoWz
 QAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694743138; x=1695347938;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7PuSAMxLxInSpL8YXQSiMW4XsaTccFO8KI2y7YfhUos=;
 b=HB9dgZtZhB/G8+ZRJTGwjo+jWaX+0SY9chwdeYPfYzbwiZ+ReeBb4q8ELsQ6NzuEjq
 E/TzFBoH166pdw0QPiHtBUNxcHYyPLH40XGTAvozt7Z78jfVOuGlmCx2pL687NLbNrNd
 at2zfTYSrluqxw+HQ9Zz2Qm3Vw2r3K1WPSxR5Fl7uUN8lVU6/4/qF06x25olQJpFcTK+
 sqFQwKkjQ6EptzsIUKBD+vy6AAo+iIopVWlqu0S20i4nFKE5Fno7FDoYxNEI64Fe1ZyE
 NjM+QlPUY4QQLlreBuVv0Sh4Xms2msdVpXUCbvVdUQZEFvcR9n37LcIWusSDCcHj6Z+u
 Nvpg==
X-Gm-Message-State: AOJu0YxpgE4SoPCVcCyvBXCWZgA2RB4tvUiMA0VMg5IimlD1CdMY8jnF
 w/fE8yR4sGQIbGlpQsQYqxTPsZqubuupsSuhKf0=
X-Google-Smtp-Source: AGHT+IHQNAchWS1y8Bfiuv26Q7OonB8AE64bpEAjxfpOWXAw4iAo0EQJ+NaSgr39iUPYEN+kUN3u5re6J8cvrv6UD40=
X-Received: by 2002:a17:90a:fb46:b0:274:7725:ed9c with SMTP id
 iq6-20020a17090afb4600b002747725ed9cmr201520pjb.35.1694743138161; Thu, 14 Sep
 2023 18:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <ZQEKFR1OPoXGI2lO@midnight> <ZQERJIGOOeYxgX3E@debian.me>
In-Reply-To: <ZQERJIGOOeYxgX3E@debian.me>
From: angus gardner <angusg778@gmail.com>
Date: Fri, 15 Sep 2023 11:58:47 +1000
Message-ID: <CAC5tM5u8L50fAhReAmP0dqexSmv-PdZJKa_ES2hxZMp41MJjGQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Removed unnecessary parenthesis around
 conditions to comply with the checkpatch coding style.
To: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bc59fc06055c222d"
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000bc59fc06055c222d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback Bagas,

"Then checkpatch is wrong, " lol

Ill double check my SoB.

Angus


On Wed, Sep 13, 2023 at 11:32=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:

> On Wed, Sep 13, 2023 at 11:02:13AM +1000, Angus Gardner wrote:
> > ---
> >  drivers/staging/fbtft/fb_ra8875.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
>
> No patch description and SoB, so Greg can't take this as-is.
>
> > -     if ((par->info->var.xres =3D=3D 320) && (par->info->var.yres =3D=
=3D 240)) {
> > +     if (par->info->var.xres =3D=3D 320 && par->info->var.yres =3D=3D =
240) {
>
> Greg prefers explicit parentheses on complex expressions (see [1] and [2]
> for examples), hence NAK.
>
> Thanks.
>
> [1]: https://lore.kernel.org/linux-staging/ZCWGOZqdH1kWtOEq@kroah.com/
> [2]: https://lore.kernel.org/linux-staging/Y%2FiaYtKk4VSokAFz@kroah.com/
>
> --
> An old man doll... just what I always wanted! - Clara
>

--000000000000bc59fc06055c222d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the feedback Bagas,<br><div><br></div><div><div=
>&quot;Then checkpatch is wrong, &quot; lol<br></div><div><br></div></div><=
div>Ill double check my SoB.</div><div><br></div><div>Angus</div><div><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Sep 13, 2023 at 11:32=E2=80=AFAM Bagas Sanjaya &lt;<a href=3D"=
mailto:bagasdotme@gmail.com">bagasdotme@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Sep 13, 2023 at 11=
:02:13AM +1000, Angus Gardner wrote:<br>
&gt; ---<br>
&gt;=C2=A0 drivers/staging/fbtft/fb_ra8875.c | 11 ++++-------<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 7 deletions(-)<br>
<br>
No patch description and SoB, so Greg can&#39;t take this as-is.<br>
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if ((par-&gt;info-&gt;var.xres =3D=3D 320) &amp;&=
amp; (par-&gt;info-&gt;var.yres =3D=3D 240)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (par-&gt;info-&gt;var.xres =3D=3D 320 &amp;&am=
p; par-&gt;info-&gt;var.yres =3D=3D 240) {<br>
<br>
Greg prefers explicit parentheses on complex expressions (see [1] and [2]<b=
r>
for examples), hence NAK.<br>
<br>
Thanks.<br>
<br>
[1]: <a href=3D"https://lore.kernel.org/linux-staging/ZCWGOZqdH1kWtOEq@kroa=
h.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/linux-=
staging/ZCWGOZqdH1kWtOEq@kroah.com/</a><br>
[2]: <a href=3D"https://lore.kernel.org/linux-staging/Y%2FiaYtKk4VSokAFz@kr=
oah.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/linu=
x-staging/Y%2FiaYtKk4VSokAFz@kroah.com/</a><br>
<br>
-- <br>
An old man doll... just what I always wanted! - Clara<br>
</blockquote></div>

--000000000000bc59fc06055c222d--
