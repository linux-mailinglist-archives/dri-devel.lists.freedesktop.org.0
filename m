Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B515474665
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 16:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A000210E55C;
	Tue, 14 Dec 2021 15:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3431010E55C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 15:26:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id l7so28867034lja.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 07:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E1s89Tuk39UOoZlOnaYWQ3Z1+01yfMXbQponNEtbH2M=;
 b=WwgkRYx3+StpmQOX5zWNZea0LTRzvre8BcRBHN+bQETXffydPPalqRgKWQ3fW+eAFI
 KFzK2WFm26VKLSwNLWJGuC39mWkVXz6LUdX/VmLg5SCCbnB+dsBXv5wlewTxhAUmboEF
 6hKcZV6qzTaHqqZb+PkOulHm19BA4/flkL+WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E1s89Tuk39UOoZlOnaYWQ3Z1+01yfMXbQponNEtbH2M=;
 b=D2Fguge+ln3JxtiXkYk/KzR0J2yphsJuo6E6Eo6EZnpLQHLNO1y4Grz6bPmvsFL+lX
 gQM3Kq1FhKmXXbhtuQixIHmPySkqJI4tfiezPnvkV7kl6o8g1oQme3RrstwD7a1rVsc8
 +rZ3kUcatQl71mgDugoudH/ys7jn5+/NDhy9N43HNDyI5RvNVVBlMKLHhz1xRULRAkmW
 gmicv1/6KnUp4ladNiyq6IfhyVVY6W5FrwJoqqcj1IIrkTJxTFGdNPht2gxt5ppW1Buw
 WcSflOoPfVxBIjof5fxEQYNSSBQtS34N1l/ubotmtLwvRkqZtxfaTuR9xCZVrKVNbTTg
 2uXw==
X-Gm-Message-State: AOAM533tFmQ1HaREFuPCYdaJpEdWy2TLlt9yWQjCm9DQw2VaucfG578U
 aOcYG3WKhQg/ar/aVNhBBUutJUdx1Aur/dA43F03zTCM9RznbA==
X-Google-Smtp-Source: ABdhPJxXEMFm5MO03ocP3YbIlaXlGoJzGI5gjZgD3+oeBt+anch+hjrguJ7Q8hdUWyFJf6G1XVFZ07wtaAndgQfCxnM=
X-Received: by 2002:a05:651c:50c:: with SMTP id
 o12mr5639330ljp.88.1639495577542; 
 Tue, 14 Dec 2021 07:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20211027162806.2014022-1-markyacoub@chromium.org>
 <20211213160742.744333-1-markyacoub@chromium.org>
 <CAAOTY_81KaSEWAqTWgzmshDZ9BefO3pNrqQwWbB01E4L0+mqzg@mail.gmail.com>
In-Reply-To: <CAAOTY_81KaSEWAqTWgzmshDZ9BefO3pNrqQwWbB01E4L0+mqzg@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 14 Dec 2021 10:26:06 -0500
Message-ID: <CAJUqKUp_Q39S912_epc3pfT-uc3DN=u4sCSdLm9VetwqdH_Pzw@mail.gmail.com>
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

Thank you so much!

On Mon, Dec 13, 2021 at 6:27 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wro=
te:
>
> Hi, Mark:
>
> Mark Yacoub <markyacoub@chromium.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=881=
4=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:08=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > At the reset hook, call __drm_atomic_helper_plane_reset which is
> > called at the initialization of the plane and sets the default value of
> > rotation on all planes to DRM_MODE_ROTATE_0 which is equal to 1.
>
> Applied to mediatek-drm-next [1], thanks.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.gi=
t/log/?h=3Dmediatek-drm-next
>
> Regards,
> Chun-Kuang.
>
> >
> > Tested on Jacuzzi (MTK).
> > Resolves IGT@kms_properties@plane-properties-{legacy,atomic}
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm=
/mediatek/mtk_drm_plane.c
> > index e6dcb34d30522..accd26481b9fb 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > @@ -44,9 +44,10 @@ static void mtk_plane_reset(struct drm_plane *plane)
> >                 state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> >                 if (!state)
> >                         return;
> > -               plane->state =3D &state->base;
> >         }
> >
> > +       __drm_atomic_helper_plane_reset(plane, &state->base);
> > +
> >         state->base.plane =3D plane;
> >         state->pending.format =3D DRM_FORMAT_RGB565;
> >  }
> > --
> > 2.34.1.173.g76aa8bc2d0-goog
> >
