Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F030D4E4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186586E9E7;
	Wed,  3 Feb 2021 08:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A356E9A6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 21:26:01 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id i8so15793110ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 13:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MW8j/Cg6t4rQW2k5H8J8SpE484rDSpVBMKo9v3n9lzE=;
 b=YGYWH25yhthdudFvdVkZqJtmlVAwYgBww1T1k/0UQx8SGJKqSHXPrPYFnt5TtOud29
 eH767KdtLGkmo1lLy17lAvijVXiTH33N97Gwu8sYdZVzUw7jKUNmFX3zt24W99sM+LG3
 96uxUMQQ7JzMuT2jIDIDuw/muYLywbpiCyMCnVImLDESEBU9m9cFBexAETDDfhLboOmB
 0TZGtHvZPGkLJWWR/jT4QwGWKbhf1UAbP8mDbBv4He6tAWucNzArV1TGk46BM7Hi8M6B
 6W8XSX3mM01TN6ypyT5ePNaFzD7b4p5FoS7vHWPiEsTuJ+UEoec7q/jPm4gnKrgg+oqp
 Kr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MW8j/Cg6t4rQW2k5H8J8SpE484rDSpVBMKo9v3n9lzE=;
 b=d4GN2zTvJk5hHqFS+Can2G+tyljZSV40HyXHboNCU97SMMDTpPjQi6FyamQ3Bc+uHP
 D91nMg34tgzpwbfdITNpklUdrMJNGVG0HZsy3kKgHa36l1C1nyotI0Eyl0YGZ0AtcTca
 VRdNf9VCct678AE9D8tkvPYGp+MCJlCz7q++EzVtZLHdRoFAVJUNffd3BpyeWseQtp4E
 sAGXrgML6rSF2FZvLLzG7XG6zz6UUs3ynpbjR1I6Xv/hii7h5LXM4eCVIGNaXe1gw91B
 smWNEE9akwuArDKstlAckrwwzs0M+Dyn6tL8ZJlYalDSemdY04vLngkx5exyOsk0gK2R
 i/Lw==
X-Gm-Message-State: AOAM532ScmdV1tB+WiEttzi5aGra/OqxSADq85eeS20vXXUPfHwrfmdA
 udF3bePX28iWxr5nqAvLR+/ePbWTcjhLFysBwIM=
X-Google-Smtp-Source: ABdhPJxoL/Iksc98t5h+cYhB1WnyzaqV4Pk0MpohKn3S54bLMBTWSUAMSikmPX7UfJLRn/uDWdkG6vArI+U8/DT0z3M=
X-Received: by 2002:a17:907:a059:: with SMTP id
 gz25mr11979802ejc.400.1612301160390; 
 Tue, 02 Feb 2021 13:26:00 -0800 (PST)
MIME-Version: 1.0
References: <1612190499-73818-1-git-send-email-driverfuzzing@gmail.com>
 <20210202092541.2wvzpe53mavrd47x@maple.lan>
In-Reply-To: <20210202092541.2wvzpe53mavrd47x@maple.lan>
From: FUZZ DR <driverfuzzing@gmail.com>
Date: Tue, 2 Feb 2021 15:25:49 -0600
Message-ID: <CABF6pWFar726YKG9y_wVZoX9fd7DxBQce0AZKAibmmzU9qZpMA@mail.gmail.com>
Subject: Re: [PATCH] backlight: pcf50633: pdata may be a null pointer, null
 pointer dereference cause crash
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============0808503724=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0808503724==
Content-Type: multipart/alternative; boundary="000000000000efa41705ba611d65"

--000000000000efa41705ba611d65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry about the missing description, I have a description at my local
commit. But the commit description disappeared when I used git send-email
to submit this patch.

backlight: pcf50633: pdata may be a null pointer, null pointer dereference
causes crash
pdata has been checked  at line 120 before dereference. However, it is used
without check at line 130. So just add the check,

 Signed-off-by: Wenjia Zhao <driverfuzzing@gmail.com>
---
 drivers/video/backlight/pcf50633-backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/pcf50633-backlight.c
b/drivers/video/backlight/pcf50633-backlight.c
index 540dd338..43267af 100644
--- a/drivers/video/backlight/pcf50633-backlight.c
+++ b/drivers/video/backlight/pcf50633-backlight.c
@@ -127,7 +127,8 @@ static int pcf50633_bl_probe(struct platform_device
*pdev)

        platform_set_drvdata(pdev, pcf_bl);

-       pcf50633_reg_write(pcf_bl->pcf, PCF50633_REG_LEDDIM,
pdata->ramp_time);
+  if (pdata)
+    pcf50633_reg_write(pcf_bl->pcf, PCF50633_REG_LEDDIM, pdata->ramp_time)=
;

        /*
         * Should be different from bl_props.brightness, so we do not exit
--

It is better to write a default value to the register if the ramp_time has
a default value. Then it does not need to return -EINVAL. It will keep
consistent with the behavior at line 120.

Daniel Thompson <daniel.thompson@linaro.org> =E4=BA=8E2021=E5=B9=B42=E6=9C=
=882=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=883:25=E5=86=99=E9=81=93=EF=
=BC=9A

> On Mon, Feb 01, 2021 at 08:41:38AM -0600, Wenjia Zhao wrote:
> > Signed-off-by: Wenjia Zhao <driverfuzzing@gmail.com>
>
> There should be a patch description here explaining why the patch
> is needed and how it works.
>
>
> > ---
> >  drivers/video/backlight/pcf50633-backlight.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/video/backlight/pcf50633-backlight.c
> b/drivers/video/backlight/pcf50633-backlight.c
> > index 540dd338..43267af 100644
> > --- a/drivers/video/backlight/pcf50633-backlight.c
> > +++ b/drivers/video/backlight/pcf50633-backlight.c
> > @@ -127,7 +127,8 @@ static int pcf50633_bl_probe(struct platform_device
> *pdev)
> >
> >       platform_set_drvdata(pdev, pcf_bl);
> >
> > -     pcf50633_reg_write(pcf_bl->pcf, PCF50633_REG_LEDDIM,
> pdata->ramp_time);
> > +  if (pdata)
> > +    pcf50633_reg_write(pcf_bl->pcf, PCF50633_REG_LEDDIM,
> pdata->ramp_time);
>
> Assuming you found this issue using a static analyzer then I think it
> might be better to if an "if (!pdata) return -EINVAL" further up the
> file instead.
>
> In other words it is better to "document" (via the return code) that the
> code does not support pdata =3D=3D NULL than to add another untested code
> path.
>
>
> Daniel.
>

--000000000000efa41705ba611d65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry about=C2=A0the=C2=A0missing description, I have a de=
scription at my local commit. But the commit description disappeared when I=
 used git send-email to submit this patch.<div><br></div><div>backlight: pc=
f50633: pdata may be a null pointer, null pointer dereference causes crash<=
/div><div>pdata has been checked=C2=A0 at line 120 before dereference. Howe=
ver, it is used without check at line 130.=C2=A0So just add the check,</div=
><div><br></div><div>=C2=A0Signed-off-by: Wenjia Zhao &lt;<a href=3D"mailto=
:driverfuzzing@gmail.com" target=3D"_blank">driverfuzzing@gmail.com</a>&gt;=
<br>---<br>=C2=A0drivers/video/backlight/pcf50633-backlight.c | 3 ++-<br>=
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br><br>diff --git a/dr=
ivers/video/backlight/pcf50633-backlight.c b/drivers/video/backlight/pcf506=
33-backlight.c<br>index 540dd338..43267af 100644<br>--- a/drivers/video/bac=
klight/pcf50633-backlight.c<br>+++ b/drivers/video/backlight/pcf50633-backl=
ight.c<br>@@ -127,7 +127,8 @@ static int pcf50633_bl_probe(struct platform_=
device *pdev)<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev,=
 pcf_bl);<br><br>-=C2=A0 =C2=A0 =C2=A0 =C2=A0pcf50633_reg_write(pcf_bl-&gt;=
pcf, PCF50633_REG_LEDDIM, pdata-&gt;ramp_time);<br>+=C2=A0 if (pdata)<br>+=
=C2=A0 =C2=A0 pcf50633_reg_write(pcf_bl-&gt;pcf, PCF50633_REG_LEDDIM, pdata=
-&gt;ramp_time);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* Should be different from bl_props.brightness, so we do n=
ot exit<font color=3D"#888888"><br>--</font><br></div><div><br></div><div> =
It is better to write a default value to the register if the ramp_time has =
a default value. Then it does not need to return -EINVAL. It will keep cons=
istent with the behavior at line 120.</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Daniel Thompson &lt;<a href=3D"mailto:=
daniel.thompson@linaro.org" target=3D"_blank">daniel.thompson@linaro.org</a=
>&gt; =E4=BA=8E2021=E5=B9=B42=E6=9C=882=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=
=8A=E5=8D=883:25=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Mon, Feb 01, 2021 at 08:41:38AM -0600, Wenji=
a Zhao wrote:<br>
&gt; Signed-off-by: Wenjia Zhao &lt;<a href=3D"mailto:driverfuzzing@gmail.c=
om" target=3D"_blank">driverfuzzing@gmail.com</a>&gt;<br>
<br>
There should be a patch description here explaining why the patch<br>
is needed and how it works.<br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/video/backlight/pcf50633-backlight.c | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/video/backlight/pcf50633-backlight.c b/drivers/vi=
deo/backlight/pcf50633-backlight.c<br>
&gt; index 540dd338..43267af 100644<br>
&gt; --- a/drivers/video/backlight/pcf50633-backlight.c<br>
&gt; +++ b/drivers/video/backlight/pcf50633-backlight.c<br>
&gt; @@ -127,7 +127,8 @@ static int pcf50633_bl_probe(struct platform_devic=
e *pdev)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, pcf_bl);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0pcf50633_reg_write(pcf_bl-&gt;pcf, PCF50633_REG_L=
EDDIM, pdata-&gt;ramp_time);<br>
&gt; +=C2=A0 if (pdata)<br>
&gt; +=C2=A0 =C2=A0 pcf50633_reg_write(pcf_bl-&gt;pcf, PCF50633_REG_LEDDIM,=
 pdata-&gt;ramp_time);<br>
<br>
Assuming you found this issue using a static analyzer then I think it<br>
might be better to if an &quot;if (!pdata) return -EINVAL&quot; further up =
the<br>
file instead.<br>
<br>
In other words it is better to &quot;document&quot; (via the return code) t=
hat the<br>
code does not support pdata =3D=3D NULL than to add another untested code<b=
r>
path.<br>
<br>
<br>
Daniel.<br>
</blockquote></div></div>

--000000000000efa41705ba611d65--

--===============0808503724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0808503724==--
