Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE9F6E9C6E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 21:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0439110E51B;
	Thu, 20 Apr 2023 19:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7E910E51B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 19:24:12 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-54f21cdfadbso55299337b3.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682018650; x=1684610650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CitpErBCs21ceUt0nwXbHOId6v4Tpo7P8KbpX2/VYY=;
 b=dKoTmw8B/k+mmMMG9RDuav358rjii0q6dltc22DHfrbV0jCG+nu7tk1bFkyl166V4D
 oYanohNCAHc1XK3P6MhnqaK7QXxPty2ALB3fuOb1AnjvQKjCnJmQdsPZXaKiWdTVF+GH
 lrC8f4HYnkWXaGwRwfWcZwFwy78UzlRMURSP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682018650; x=1684610650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CitpErBCs21ceUt0nwXbHOId6v4Tpo7P8KbpX2/VYY=;
 b=CIXy3cCIEnPdDBDn+fu5OodZvUkYcObb1zCwom1h52Kmt4/7WWvd73znlhMFzfGdih
 fW1+xJJ9SJnGDWbOzKBywL6EvisOX4ZdrZj1M5PHPhGJy4M5Zz3LU56//4uO8F4RDsh/
 sKeJa6yIpmBBEwhm74PFQtLRF/Npat1fHJvQkpKvTu4FeE8uP+Xu+UWu53bzfkBTC7jC
 g7O0o3mqf3as/n8KDPC6vI+D3OmcPycP0TxxS2nXWi5bXcAqdJkbuZKUeU+rdM2d42dD
 ncici2yZmPQpPu3WfFtjtIJwwfns7ZgLcI7CCEXg1VmKGiaYDIBVE7MzNKLdw9Z2NNTC
 lZKg==
X-Gm-Message-State: AAQBX9cwYvVc+9PQFnl60Yz3I42tMYVqY4FwunXS6Tkb6L72ewQ36IYe
 nNBocAjt5nmZVHWwBPOONMa9gDmcQb/PgLwRR1Q=
X-Google-Smtp-Source: AKy350YwmmcjdnZqzIFeNFEfa6o5XsbTcQxO8LERU+ruBzxEjpqQOQxC14tA+TKWvZgwfr/fLCKnVg==
X-Received: by 2002:a0d:ebc7:0:b0:54f:dfc8:7ff4 with SMTP id
 u190-20020a0debc7000000b0054fdfc87ff4mr1396067ywe.45.1682018650274; 
 Thu, 20 Apr 2023 12:24:10 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 u11-20020a81a50b000000b00545a08184f3sm495665ywg.131.2023.04.20.12.24.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 12:24:09 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-b8ed0d0a33dso870091276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 12:24:09 -0700 (PDT)
X-Received: by 2002:a25:cb96:0:b0:b98:6352:be17 with SMTP id
 b144-20020a25cb96000000b00b986352be17mr119011ybg.0.1682018648700; Thu, 20 Apr
 2023 12:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230408082014.235425-1-nikita@trvn.ru>
 <CAD=FV=XEQS9MB4e52B4yLjiP8ksYmeos_emiH4=-adCOwzfGUA@mail.gmail.com>
 <905403377ec62914a2fbe21a6b4a6c8e@trvn.ru>
 <CAD=FV=X_NUNXgY-9p6CUvNwYte+aPjjZPLV4oZRXR5zdEn0Kjg@mail.gmail.com>
In-Reply-To: <CAD=FV=X_NUNXgY-9p6CUvNwYte+aPjjZPLV4oZRXR5zdEn0Kjg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Apr 2023 12:23:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V3+i51BQ3pE60-e=wU0ehTFx6C6qU7-7ghbyvon7=pCQ@mail.gmail.com>
Message-ID: <CAD=FV=V3+i51BQ3pE60-e=wU0ehTFx6C6qU7-7ghbyvon7=pCQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement wait_hpd_asserted
To: Nikita Travkin <nikita@trvn.ru>
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, andrzej.hajda@intel.com,
 jonas@kwiboo.se, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 13, 2023 at 12:10=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Wed, Apr 12, 2023 at 9:19=E2=80=AFPM Nikita Travkin <nikita@trvn.ru> w=
rote:
> >
> > Doug Anderson =D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0) 13.04.2023 01:22:
> > > Hi,
> > >
> > > On Sat, Apr 8, 2023 at 1:20=E2=80=AFAM Nikita Travkin <nikita@trvn.ru=
> wrote:
> > >>
> > >> This bridge doesn't actually implement HPD due to it being way too s=
low
> > >> but instead expects the panel driver to wait enough to assume HPD is
> > >> asserted. However some panels (such as the generic 'edp-panel') expe=
ct
> > >> the bridge to deal with the delay and pass maximum delay to the aux
> > >> instead.
> > >>
> > >> In order to support such panels, add a dummy implementation of wait
> > >> that would just sleep the maximum delay and assume no failure has
> > >> happened.
> > >>
> > >> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> > >> ---
> > >> This was suggested in [1] to make sure DT users can be semantically
> > >> correct (not adding no-hpd when the line is actually there) while
> > >> still using a hard delay to be faster than waiting the long debounce
> > >> time.
> > >>
> > >> [1] - https://lore.kernel.org/all/CAD=3DFV=3DVR7sKsquE25eF7joc7gPApu=
-vqwduZzjE=3DwFCoXjMYnQ@mail.gmail.com/
> > >> ---
> > >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 19 +++++++++++++++++++
> > >>  1 file changed, 19 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm=
/bridge/ti-sn65dsi86.c
> > >> index 7a748785c545..260cad1fd1da 100644
> > >> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > >> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > >> @@ -618,6 +618,24 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp=
_aux *aux,
> > >>         return len;
> > >>  }
> > >>
> > >> +static int ti_sn_aux_wait_hpd_asserted(struct drm_dp_aux *aux, unsi=
gned long wait_us)
> > >> +{
> > >> +       /*
> > >> +        * The HPD in this chip is a bit useless (See comment in
> > >> +        * ti_sn65dsi86_enable_comms) so if our driver is expected t=
o wait
> > >> +        * for HPD, we just assume it's asserted after the wait_us d=
elay.
> > >> +        *
> > >> +        * In case we are asked to wait forever (wait_us=3D0) take c=
onservative
> > >> +        * 500ms delay.
> > >> +        */
> > >> +       if (wait_us =3D=3D 0)
> > >> +               wait_us =3D 500000;
> > >> +
> > >> +       usleep_range(wait_us, wait_us + 1000);
> > >> +
> > >> +       return 0;
> > >> +}
> > >> +
> > >>  static int ti_sn_aux_probe(struct auxiliary_device *adev,
> > >>                            const struct auxiliary_device_id *id)
> > >>  {
> > >> @@ -627,6 +645,7 @@ static int ti_sn_aux_probe(struct auxiliary_devi=
ce *adev,
> > >>         pdata->aux.name =3D "ti-sn65dsi86-aux";
> > >>         pdata->aux.dev =3D &adev->dev;
> > >>         pdata->aux.transfer =3D ti_sn_aux_transfer;
> > >> +       pdata->aux.wait_hpd_asserted =3D ti_sn_aux_wait_hpd_asserted=
;
> > >
> > > This looks reasonable to me, but I think you only want this
> > > implementation if the "no-hpd" property _isn't_ present. In other
> > > words:
> > >
> > > if (!of_property_read_bool(np, "no-hpd"))
> > >   pdata->aux.wait_hpd_asserted =3D ti_sn_aux_wait_hpd_asserted;
> > >
> > > Essentially:
> > >
> > > * If "no-hpd" is present in ti-sn65dsi86 then we'll assume that HPD i=
s
> > > handled by the panel driver via a GPIO or a "no-hpd" there (which wil=
l
> > > cause the panel driver to wait the maximum duration).
> > >
> > > * If "no-hpd" isn't present in ti-sn65dsi86 then HPD is actually
> > > hooked up and thus the panel driver _won't_ handle it.
> > >
> > > Does that seem right? Presumably this should be explained by comments=
.
> > >
> >
> > This does sound reasonable indeed, I didn't think to add it
> > conditionally because, looking at the current users of
> > wait_hpd_asserted, they will first try the "no-hpd" paths
> > and will only call the bridge when they think it's on the
> > bridge to wait.
> >
> > Thus, if DT is modeled properly - Panel has no-hpd or a gpio,
> > wait_hpd_asserted will never be called anyway. Other bridges
> > seem to also unconditionally enable the method.
> >
> > For this to be a trouble, a panel driver has to be "broken"
> > with some form of calling wait_hpd_asserted despite knowing
> > the HPD line is not hooked up...
> >
> > So I feel like guarding the wait_hpd_asserted for no-hpd
> > users should not actually change much, but if you think
> > I should add the check anyway, please let me know.
>
> Ah, true, it shouldn't actually matter. I guess I still like it
> slightly better with the extra check but not enough that I'll insist
> on it. Thus:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I can commit this to drm-misc-next, but I'll plan to wait ~1 week to
> see if anyone else has any comments about it.

Landed to drm-misc-next:

34c1aeb579dd drm/bridge: ti-sn65dsi86: Implement wait_hpd_asserted
