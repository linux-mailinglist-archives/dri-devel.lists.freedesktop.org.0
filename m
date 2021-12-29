Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBF648164A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 20:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C0B10E295;
	Wed, 29 Dec 2021 19:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D78010E295
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 19:31:01 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bp20so50006937lfb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 11:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1kHntLzhFY+6b33xnFFNKov/UMw0bRniYoNkFNeokK0=;
 b=VSjxFJl0ahNzSM4KdKAVBXj5nnx2ycIMd7oLJm/8VxX+Pq6pIoD8+pfYySEqs9u56K
 LZHUP6bC5wDh2ncQuNiEtxqdC3D9djsXFIsf4IhA3WH/TflZOAhhv+/u3u0/rkJcYAYK
 scuGR2/og7UWys1KX+BarneWj1b5qHACUAEIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1kHntLzhFY+6b33xnFFNKov/UMw0bRniYoNkFNeokK0=;
 b=203aPKE4jGPaKJpEUjPB34m81HDZ9YZ5iz+wW4aSNpN8/Bw5PadatkTW4c2ma5fdW2
 q7zlnC845tYcT46/wNQGG9McEScVhMdlSBMf+SDvetR1AWqkID8HypbvJpMOIhQLyhiG
 sP+jteFmx40/ufgwJ0Qb49zOWcEUk0lgl0e1jP2RqgylLeTa6vzIbne4iDR0MIhRkH7I
 65FBSvPkV6hEzDVk5ANfZTXkeA2mdXLTbSUzcPsp1RTzWJIlqYIJ20wixm489HHmGlLQ
 0UwNIrt36z/4e8LyMy7GLCT3BcZ2vnbFKaOtVJOTWY6ZTblP7Ds+ZMqal00GAlQ6vNL6
 wWmw==
X-Gm-Message-State: AOAM533XzwUiHFUL9lluaEC/+BqU3BeUiW3X1BTFLfOfSg4J9DhezMAd
 DvnxBDF8pYh3XkON0x2qn7/CzxMoKKpMGPzifYbv8A==
X-Google-Smtp-Source: ABdhPJzwWydnD66E+ihuzo5xAOnXhWkKsM56kOjwps/BnPwXqQ5sutKmn1B8gZog1GVGDZslne50Xc8xO2HM/LSJsoU=
X-Received: by 2002:ac2:4c54:: with SMTP id o20mr25563858lfk.369.1640806259586; 
 Wed, 29 Dec 2021 11:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20211027162806.2014022-1-markyacoub@chromium.org>
 <20211213160742.744333-1-markyacoub@chromium.org>
 <CAAOTY_81KaSEWAqTWgzmshDZ9BefO3pNrqQwWbB01E4L0+mqzg@mail.gmail.com>
 <CAJUqKUp_Q39S912_epc3pfT-uc3DN=u4sCSdLm9VetwqdH_Pzw@mail.gmail.com>
In-Reply-To: <CAJUqKUp_Q39S912_epc3pfT-uc3DN=u4sCSdLm9VetwqdH_Pzw@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 29 Dec 2021 14:30:48 -0500
Message-ID: <CAJUqKUrrr-QRG1L-+rOV=PGR6LozP=H_SMe+u0V+rGF-OPDtcw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Set the default value of rotation to
 DRM_MODE_ROTATE_0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, tzungbi@google.com,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hey - uploaded v2 that takes care of the panel:
https://patchwork.kernel.org/project/linux-mediatek/patch/20211229184420.79=
3234-1-markyacoub@chromium.org/

Thanks!

On Tue, Dec 14, 2021 at 10:26 AM Mark Yacoub <markyacoub@chromium.org> wrot=
e:
>
> Thank you so much!
>
> On Mon, Dec 13, 2021 at 6:27 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> w=
rote:
> >
> > Hi, Mark:
> >
> > Mark Yacoub <markyacoub@chromium.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=
=8814=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:08=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > >
> > > At the reset hook, call __drm_atomic_helper_plane_reset which is
> > > called at the initialization of the plane and sets the default value =
of
> > > rotation on all planes to DRM_MODE_ROTATE_0 which is equal to 1.
> >
> > Applied to mediatek-drm-next [1], thanks.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next
> >
> > Regards,
> > Chun-Kuang.
> >
> > >
> > > Tested on Jacuzzi (MTK).
> > > Resolves IGT@kms_properties@plane-properties-{legacy,atomic}
> > >
> > > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/d=
rm/mediatek/mtk_drm_plane.c
> > > index e6dcb34d30522..accd26481b9fb 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > > @@ -44,9 +44,10 @@ static void mtk_plane_reset(struct drm_plane *plan=
e)
> > >                 state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> > >                 if (!state)
> > >                         return;
> > > -               plane->state =3D &state->base;
> > >         }
> > >
> > > +       __drm_atomic_helper_plane_reset(plane, &state->base);
> > > +
> > >         state->base.plane =3D plane;
> > >         state->pending.format =3D DRM_FORMAT_RGB565;
> > >  }
> > > --
> > > 2.34.1.173.g76aa8bc2d0-goog
> > >
