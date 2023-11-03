Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 054627E094D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 20:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA39C10EA6C;
	Fri,  3 Nov 2023 19:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E04910EA6C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 19:12:10 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1f03d9ad89fso1273732fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 12:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699038729; x=1699643529;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqSGG3PRTCl3pCDwU0Cdv8eHz8EUQW+Q1dGS28H6GdE=;
 b=OU1nOGAjVlcL4sFSWIDU5co5zQrp5Hek6nRmZWfOu3HhLAkXQ26WimJFrwRuSBVnuo
 +1rB60ZLEUvA0G71xz4y5j52aHbouLL67jyHS1KcPaNjyE2wUgNDt/OUmur9z4kARYvk
 UDglDUO5VjHDVI7YkxDo49qvst59s59uuD0DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699038729; x=1699643529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqSGG3PRTCl3pCDwU0Cdv8eHz8EUQW+Q1dGS28H6GdE=;
 b=Ixaa6yWpktzm0BhkBkrIB3qcWtAEHPGdVJVgt9TmMtKjOWB33XiWsZR1dpJboGV15z
 H/B0yMfWC2JXugbXhZoBFTEwY1HxY/9VMuSzvseuWC9J7sB3XJ54CqSS2GTUg+0rto1o
 6anEmjQuSbPadxfDLNpZsIQC9khM1ljwxBhP5dZWg6CHT2Xm7nnurU/UM8XYefhEdoLj
 HlUruh8Krutf2KuOIRYl++BGvT0oaGDAoUNNcOctLicZivpAZZ2iT8ndQQWzt6GflXmS
 5LsP0ViYczovl4TDCKX5KaC/N4qjdnF+tzgxq7hxCUmvfQY/r7zq/P08g5GMLvitfMob
 RWuQ==
X-Gm-Message-State: AOJu0YxuL474sWgALg/oKP3ZXZmCFRZ/zlUAEkV5ZN252GyIQRlxqo5z
 FHg4NmzULmyhsmuuNaupAqDg6fg0jNEuctD84DQoYA==
X-Google-Smtp-Source: AGHT+IGqbK/V1TFPWC+GZWHd8DsHefVvVcJBqIIffQ9V8MHnIqoMT1/bZZiL4fQUPgaB9pqcXAtmKZaWZU+GjbyLhGc=
X-Received: by 2002:a05:6870:4202:b0:1ea:7bd1:c48d with SMTP id
 u2-20020a056870420200b001ea7bd1c48dmr28837428oac.49.1699038729662; Fri, 03
 Nov 2023 12:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231102221309.1971910-1-hsinyi@chromium.org>
 <20231102221309.1971910-2-hsinyi@chromium.org>
 <CAD=FV=Unv+PtHd=QoFOgY_4tjxPGWeU7-hzp3YHfc2DjWu3wcQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Unv+PtHd=QoFOgY_4tjxPGWeU7-hzp3YHfc2DjWu3wcQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 3 Nov 2023 12:11:43 -0700
Message-ID: <CAJMQK-gpn+AWQQG9i=Oa2qvZ+9jJ1oVCFv7F7UpFFMco7C88Fw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/panel-edp: Add several AUO/BOE panels
To: Doug Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 3, 2023 at 9:02=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 2, 2023 at 3:13=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org>=
 wrote:
> >
> > Add a few generic edp panels used by mt8186 chromebooks.
> > Besides, modify the following panel:
> > - AUO 0x235c B116XTN02 renamed to B116XTN02.3.
> > - AUO 0x405c B116XAK01 adjust the timing of auo_b116xak01. According
> > to the datasheet: T3=3D200, T12=3D500, T7_max =3D 50.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v1->v2: Address comments: update delay for auo_b116xak01, sort entries.
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 57 +++++++++++++++++++++++++++++--
> >  1 file changed, 55 insertions(+), 2 deletions(-)
>
> This seems good to me now. I guess a tiny nit is that the ${SUBJECT}
> mentions AUO/BOE panels but a few other model panels are also added,
> but it's not a huge issue for me.
>
Yeah, it should be "drm/panel-edp: Add several generic edp panels",
the same as v1. If there are more comments that I need to send a v3,
I'll fix that in v3.


> Normally I apply patches to this table near-instantly, but since it's
> Friday and this touches a lot of panels, I'll probably wait until
> sometime next week.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
