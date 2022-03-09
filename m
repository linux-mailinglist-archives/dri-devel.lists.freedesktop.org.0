Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359514D3092
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E9E10EB99;
	Wed,  9 Mar 2022 13:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B6410EB9B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:53:41 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id f8so2364089pfj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ovut23uayW/dOdtWDs48IgggZZNTYQQls77E5j7ziJo=;
 b=VIbYQAPb5RgoGgeAmm6IcIn34FSd/45TsQD5QpOmlspgU2+VrP96K3dsSWJP8m9JuD
 UxUWdVtN6W+s0x7ONlSzJMnYdQknafc4EYiVvCwGbT85eGhBU3gk7EfC3hghMWzVns8D
 p2JVOEiIgLCFslyAuFCU0ftqrzhHjuFIQzjrC/xzSf/40+ITXctmK1RiQDf0515ROaOp
 K520bIOqwp3w/xIO4U7iMcJhcs6czKueeCQ15Rvl4bIXe5B/ILWxW6J2vB8pHQr2/5mJ
 qeerGdcPbZdA9ESvHdjgZqdkBErURJuwmnD36r0wApRiYNrh4MxRPER65QzEUwhH4ZAf
 43Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ovut23uayW/dOdtWDs48IgggZZNTYQQls77E5j7ziJo=;
 b=2mlXTH4BDYv5c015ldUye7aZEZCTNQUXTj7UhzlzOb2Ssl7b1ozOfzTL8xvVe2wC/Q
 +PZtWyXM01w6GCxwHVT8UPsBakT5glSPiFleCYLE28PynpZXFVZa4aq+JZgBYptqnWwV
 lxJJI/I6FkE9dkiPSdGKoANJ/+rTl2cLDzr2ASMCB6gdqvK9IsbKb23T9Pfvzb9C89yy
 3NLXs1zNZCcIkuC7LtrZCZo3rONiYt2ryA7QCWCHV9NGVXgEAmH++uupcvvgj/7eSZMr
 PWbrX/NxHJIDePlx7rty03mjcZCufHXw5QoM66t3+bosxBYevd1JruraqBqBE/u9iiOc
 FtSQ==
X-Gm-Message-State: AOAM531RmHFDlkdPzsmLkafTaFbpxTwvcwU5Nesf3Jdk3miMVs/q1N+0
 p2ijW1n88U8n/HUXnQZZ2sldDkUfLyXG6csCIEYfHw==
X-Google-Smtp-Source: ABdhPJyjDkbzTtT/IWdlit5fMgUxFD/5gMRctZhnTrPtEVnm6o5Bd+AYivSovav9lczEHpwiGcWbWq4H/k4r+8kqHVI=
X-Received: by 2002:a05:6a00:24cf:b0:4f7:38ea:9fd5 with SMTP id
 d15-20020a056a0024cf00b004f738ea9fd5mr6810052pfv.0.1646834021278; Wed, 09 Mar
 2022 05:53:41 -0800 (PST)
MIME-Version: 1.0
References: <20220228183955.25508-1-jose.exposito89@gmail.com>
 <164609067646.2361501.15747139249939190799@Monstersaurus>
 <20220303183720.GA334969@elementary>
 <164634476693.3683041.3124143336848085499@Monstersaurus>
 <164639597452.3492470.16590890112062103735@Monstersaurus>
In-Reply-To: <164639597452.3492470.16590890112062103735@Monstersaurus>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 9 Mar 2022 14:53:30 +0100
Message-ID: <CAG3jFytLEHbzOHoGSoTk3WSHUBDns64aZWPwUFmhrUrQzncXGg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: switch to devm_drm_of_get_bridge
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-pwm@vger.kernel.org, maxime@cerno.tech, jonas@kwiboo.se,
 airlied@linux.ie, narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 jernej.skrabec@gmail.com, andrzej.hajda@intel.com,
 u.kleine-koenig@pengutronix.de,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 lee.jones@linaro.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Mar 2022 at 13:12, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Hi Jos=C3=A9
>
> Quoting Kieran Bingham (2022-03-03 21:59:26)
> > Quoting Jos=C3=A9 Exp=C3=B3sito (2022-03-03 18:37:20)
> > > On Mon, Feb 28, 2022 at 11:24:36PM +0000, Kieran Bingham wrote:
> > > > Hi Jos=C3=A9
> > > >
> > > > Quoting Jos=C3=A9 Exp=C3=B3sito (2022-02-28 18:39:54)
> > > > > The function "drm_of_find_panel_or_bridge" has been deprecated in
> > > > > favor of "devm_drm_of_get_bridge".
> > > > >
> > > > > Switch to the new function and reduce boilerplate.
> > > > >
> > > > > Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com=
>
> > > > > ---
> > > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 +-------
> > > > >  1 file changed, 1 insertion(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/=
drm/bridge/ti-sn65dsi86.c
> > > > > index dab8f76618f3..fb8e16ed7e90 100644
> > > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > @@ -1232,15 +1232,9 @@ static int ti_sn_bridge_probe(struct auxil=
iary_device *adev,
> > > > >  {
> > > > >         struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.=
parent);
> > > > >         struct device_node *np =3D pdata->dev->of_node;
> > > > > -       struct drm_panel *panel;
> > > > >         int ret;
> > > > >
> > > > > -       ret =3D drm_of_find_panel_or_bridge(np, 1, 0, &panel, NUL=
L);
> > > > > -       if (ret)
> > > > > -               return dev_err_probe(&adev->dev, ret,
> > > > > -                                    "could not find any panel no=
de\n");
> > > > > -
> > > > > -       pdata->next_bridge =3D devm_drm_panel_bridge_add(pdata->d=
ev, panel);
> > > > > +       pdata->next_bridge =3D devm_drm_of_get_bridge(pdata->dev,=
 np, 1, 0);
> > > >
> > > > Yikes, I was about to rely on this panel variable to determine if t=
he
> > > > device is a panel or a display port connector. (Well, I am relying =
on
> > > > it, and patches are hoping to be reposted this week).
> > > >
> > > > Is there expected to be another way to identify if the next connect=
ion
> > > > is a panel or a bridge?
> > > >
> > > > Regards
> > >
> > > Hi Kieran,
> > >
> > > I'm getting started in the DRM subsystem. I couldn't tell if there is=
 a
> > > good way to access the panel pointer... I didn't manage to find it, b=
ut
> > > hopefully someone with more experience can point us to a solution.
> > >
> > > Since you mentioned display port, I'm not sure if in your case checki=
ng
> > > "pdata->next_bridge->type" could be good enough.
>
> Actually, it is. And I think this is actually cleaner (both here, and in
> the series I'm working on).
>
> > > Anyway, if this patch causes you problems, please go ahead and ignore=
 it.
> > > I'm sure the series you are working on are more important than removi=
ng
> > > a deprecated function :)
> >
> > If it's deprecated, I don't want to block it's removal. Hopefully I can
> > resume my work on this tomorrow so I can check to see what I can parse.
> > Thanks for the lead on the bridge type, I'm sure I've seen that around
> > too so hopefully that's enough. If it is, I'll rebase my work on top of
> > your patch and retest.
>
> So - my series is now working with a bit of adaptation to run on top of
> your patch, and I think the overall result is better. So:
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>

Applied to drm-misc-next.
