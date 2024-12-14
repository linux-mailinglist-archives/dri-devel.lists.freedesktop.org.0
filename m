Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFC99F1F8A
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 16:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986DA10E105;
	Sat, 14 Dec 2024 15:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.b="BmmTcKaK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D38710E25D
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 01:27:33 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so23412711fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 17:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=is.s.u-tokyo.ac.jp; s=google; t=1734139652; x=1734744452;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pO06v13Uiw8iatkOQL0s6oFQWIrzzFBZui8EePC7Q/M=;
 b=BmmTcKaKfUnK0QOs+3WdjLkkfLZzNgCQKK83JxCzd4lDa2wmxfpZ9+QF3VxYk4b6uF
 cu913ShL+J93TZq10PyfQYfTFMXsiTDEgP8MnMizLcb7FRtRAhhHRiESGxlsOg4QzFVn
 vXsqGvW5Fjw/JmLoOc9jaM3VAPc4P4b0vi1buWREMz80lm0/y00szugbKB/eyjhYkU8C
 KBAZBD03FDKSSTHNag7suZnQU5QEZLBgWjJcEQVn9FRHuzR0mBi1g5LOFmpcNbRfFYr+
 aE8MFB4r6/uwgee0iQtCY50CnhKH9XfYQ2JjqtDVny+y+GdY+fFDDb7ELdFR4xzgw1pE
 TmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734139652; x=1734744452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pO06v13Uiw8iatkOQL0s6oFQWIrzzFBZui8EePC7Q/M=;
 b=Jl+WMgtrDgRCpwKBzoN7UKKkoFFritCAuaDJqE9FxevTlP61w2SfHQm/s5BBj0DzM+
 HMy3PgL3Th2Z8V4Yf4YE6rbJN7aC6YwDMaVetMhvaUkyHHpHr1iubrdE9D8jmV8A7Ves
 Ka54dgpi4TYYN+pe0deQGjl3F17srJpZIq8LDUD9/maIZWAr26RFawyOYgJZg9OE2mH+
 4l917AMLH/gG4bzTufEswLFOaWpMT1kGkk7XAuxvhrwykp+Vapy/h2wxQAy1Imj8vgJ1
 rU2uQtBEca1bywJhpdcp0OSTftQyK0duN3Joy6L/CVsuxFA/Wioa5iOHPQzE+TR5WAPj
 uSQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvHP93+kFZQY1zATyIcBG1LItuvODWr1Mg28CeCe5GqCJilT8OD63gz0seKmRkkESSylvZeGOoG08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yweu5puBY2obUsGdR5f4NelTAzZbwFQVLhoT6u/Hkf9N0sTDNqA
 brqh8Wn35Ixu3HcbWuXMlnxjlftolXtwUTYBQLIAPeZjKrR0PUSu6jMWhaBP1J0Vh7v1zaz+cpC
 JsMNiBJYVDaFlqK9NKIvxyoKeYXIMgxz1W+xL1Q==
X-Gm-Gg: ASbGncuDWX8+PJjpV4EWDi38ZV4VCUSJqHFJb/rD+1FvCIS+b6lfePI99KoFHEx8x/9
 OpxUDI1eP9ln1FYn72dG1Kcs1VIFFeOGZ0BbxwzTLaR7cj8O9B7Wfqkb+jKF5hfXa6K1B7A==
X-Google-Smtp-Source: AGHT+IGL4m0ma1qTzmjK/fqZXL7kDXiwPoEd350GHpfBdglFI8UJMg8bjHqJGELcH8vX1516ohuFTvgcaivoC446AE0=
X-Received: by 2002:a05:6512:a94:b0:53e:383c:dfa9 with SMTP id
 2adb3069b0e04-54090567fbemr1697519e87.30.1734139651629; Fri, 13 Dec 2024
 17:27:31 -0800 (PST)
MIME-Version: 1.0
References: <20241213081550.3388074-1-joe@pf.is.s.u-tokyo.ac.jp>
 <20241213093250.GA19755@pendragon.ideasonboard.com>
In-Reply-To: <20241213093250.GA19755@pendragon.ideasonboard.com>
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Date: Sat, 14 Dec 2024 10:27:20 +0900
Message-ID: <CAPRGDkgr2P-t8y-5x_7HKU4KirTONk9RoJToX4LNt8jzJvG3cg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: display-connector: implement the error path
 of .probe()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 14 Dec 2024 15:04:01 +0000
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

Hi Laurent,

Thank you for your review.

On Fri, Dec 13, 2024 at 6:33=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Joe,
>
> Thank you for the patch.
>
> On Fri, Dec 13, 2024 at 05:15:50PM +0900, Joe Hattori wrote:
> > Current implementation of .probe() leaks a reference of i2c_adapter.
> > Implement an error path and call put_device() on the obtained
> > i2c_adapter in it to fix this refcount bug.
> >
> > This bug was found by an experimental static analysis tool that I am
> > developing.
> >
> > Fixes: 0c275c30176b ("drm/bridge: Add bridge driver for display connect=
ors")
> > Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> > ---
> >  drivers/gpu/drm/bridge/display-connector.c | 25 ++++++++++++++++------
> >  1 file changed, 19 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/d=
rm/bridge/display-connector.c
> > index 72bc508d4e6e..84f1c3798d32 100644
> > --- a/drivers/gpu/drm/bridge/display-connector.c
> > +++ b/drivers/gpu/drm/bridge/display-connector.c
> > @@ -332,8 +332,11 @@ static int display_connector_probe(struct platform=
_device *pdev)
> >               int ret;
> >
> >               ret =3D display_connector_get_supply(pdev, conn, "dp-pwr"=
);
> > -             if (ret < 0)
> > -                     return dev_err_probe(&pdev->dev, ret, "failed to =
get DP PWR regulator\n");
> > +             if (ret < 0) {
> > +                     ret =3D dev_err_probe(&pdev->dev, ret,
> > +                                         "failed to get DP PWR regulat=
or\n");
> > +                     goto err_put;
> > +             }
> >       }
> >
> >       /* enable DDC */
> > @@ -345,19 +348,24 @@ static int display_connector_probe(struct platfor=
m_device *pdev)
> >
> >               if (IS_ERR(conn->ddc_en)) {
> >                       dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n")=
;
> > -                     return PTR_ERR(conn->ddc_en);
> > +                     ret =3D PTR_ERR(conn->ddc_en);
> > +                     goto err_put;
> >               }
> >
> >               ret =3D display_connector_get_supply(pdev, conn, "hdmi-pw=
r");
> > -             if (ret < 0)
> > -                     return dev_err_probe(&pdev->dev, ret, "failed to =
get HDMI +5V Power regulator\n");
> > +             if (ret < 0) {
> > +                     ret =3D dev_err_probe(
> > +                             &pdev->dev, ret,
> > +                             "failed to get HDMI +5V Power regulator\n=
");
>
>                         ret =3D dev_err_probe(&pdev->dev, ret,
>                                             "failed to get HDMI +5V Power=
 regulator\n");
>
> > +                     goto err_put;
> > +             }
> >       }
> >
> >       if (conn->supply) {
> >               ret =3D regulator_enable(conn->supply);
> >               if (ret) {
> >                       dev_err(&pdev->dev, "failed to enable PWR regulat=
or: %d\n", ret);
> > -                     return ret;
> > +                     goto err_put;
> >               }
> >       }
> >
> > @@ -383,6 +391,11 @@ static int display_connector_probe(struct platform=
_device *pdev)
> >       drm_bridge_add(&conn->bridge);
> >
> >       return 0;
> > +
> > +err_put:
> > +     if (conn->bridge.ddc)
>
> i2c_put_adapter() already has a NULL check.

Yes, fixed in the v2 patch.

>
> > +             i2c_put_adapter(conn->bridge.ddc);
> > +     return ret;
> >  }
> >
> >  static void display_connector_remove(struct platform_device *pdev)
>
> --
> Regards,
>
> Laurent Pinchart

Best,
Joe
