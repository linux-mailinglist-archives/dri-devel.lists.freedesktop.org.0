Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A7070E7C0
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 23:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E33710E4E5;
	Tue, 23 May 2023 21:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F7210E4E5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 21:46:45 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-3f38a7c5d45so25597601cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 14:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684878404; x=1687470404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0SLng/+57yNacAyFcfk9MHo3CzpuHHJKyzuH5DOnbs=;
 b=Uz9Pah/zTvsmYDSpGZz3RBTNuUByhLxjaCX3v6ogXZrGzDSUiLw7bE/09MrFJVjlCC
 1cg+zHprfU/yYEp0+kM7r7yizISHat4ZVnNMYdxcqCtOnTLy0+VX+38sksIRcnjPi2Wn
 eX0wfuu08UQJ2NMLxb/yt6lePFIka52GBc2VfXvmYA25BmHPiw+UPze6CgJXU4cM3i84
 6NXfd4JKbkjVQLH7UIYhGVDe4AuTcaFhw6kqBl5iZVq7+jpwjc3nzpcCaImHNjh+tw7R
 Adhlpuj5n+WE3xgDaAjetyDT70TGhu7soC+uvPZRL70+PNeVSP7fSqgXwiwWOJusC/E3
 0Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684878404; x=1687470404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0SLng/+57yNacAyFcfk9MHo3CzpuHHJKyzuH5DOnbs=;
 b=YJzYNPSKGG8WpCZtAL+O9WYjSfTzSPmwzifqtkIwEF/MPA27tgNJe/DQ/7vos7esxJ
 SzLNELSzSJ3X7qWFVmqkjRz91Rm5g/GRAcQtIf4gNsdZJTu6Q+vldujZYdldAbw1AgXE
 F7kC632zanEo8Vd8mWgBdCVOZMAuqYhW5RoPCKJaoZbn3XQmAdO6PW9uxbmqXPStldkk
 yJqdQvdK1V/8bJ+LZ9XDYyOKGJQDDQ0TPMiGt4NDiX66WGCJyx+g2ApYP2E9lwW5P+Rm
 dIfGbiaGAb35oe9bm/BlgBXeVhzjX4NTa8Q/XVt1DSD8kB/mI9YmDdt4USqZ+C3RDfx0
 GGxw==
X-Gm-Message-State: AC+VfDysskl1xDIVugwp+aOV5+NYV8eeSbY5hE+XvikkeTRTGKKtLWj3
 ZMnodp5bV5IFPSXtFzZXEL7Ajezs0niDIlFHVMCMxA==
X-Google-Smtp-Source: ACHHUZ6PC+6gMkHsqVYqsVb/1RBmIyHiDzul4UAhu0pxfc/7Yd/DNsG2O4pCqDr9tjNxljKCUP3o62/kFGxVNi+fzyo=
X-Received: by 2002:a05:622a:51:b0:3f6:c202:b011 with SMTP id
 y17-20020a05622a005100b003f6c202b011mr1350410qtw.3.1684878404036; Tue, 23 May
 2023 14:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230523212050.9970-1-aweber.kernel@gmail.com>
 <CAKwvOd=00s_MMQcnbyQkEsUE8HwhSCw+=KyzckKpdTrivQ3N-w@mail.gmail.com>
In-Reply-To: <CAKwvOd=00s_MMQcnbyQkEsUE8HwhSCw+=KyzckKpdTrivQ3N-w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 23 May 2023 14:46:32 -0700
Message-ID: <CAKwvOdkQ87Bd0ep_c4qdd0TjGgsUmFq-ng1nqewZNsoR3Afc3A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: samsung-s6d7aa0: use pointer for drm_mode in
 panel desc struct
To: Artur Weber <aweber.kernel@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 llvm@lists.linux.dev, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 thierry.reding@gmail.com, Nikita Travkin <nikita@trvn.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 2:29=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, May 23, 2023 at 2:20=E2=80=AFPM Artur Weber <aweber.kernel@gmail.=
com> wrote:
> >
> > Fixes compilation errors on older GCC versions (before 8.x) and Clang
> > after changes introduced in commit 6810bb390282 ("drm/panel: Add
> > Samsung S6D7AA0 panel controller driver"). Tested with GCC 13.1.1,
> > GCC 6.4.0 and Clang 16.0.3.
>
> Hi Artur,
> Thanks for the patch! Mind sending a v2 with the diagnostic added to
> the commit message? This gives reviewers much more context as to what
> issue you are fixing.

Perhaps it was these errors:
https://lore.kernel.org/llvm/646c6def.a70a0220.58c1a.903d@mx.google.com/T/#=
u

?
If so, please add

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/llvm/646c6def.a70a0220.58c1a.903d@mx.google.c=
om

To the v2 commit message as well.

>
> >
> > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gp=
u/drm/panel/panel-samsung-s6d7aa0.c
> > index f532aa018428..102e1fc7ee38 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> > @@ -37,7 +37,7 @@ struct s6d7aa0_panel_desc {
> >         unsigned int panel_type;
> >         int (*init_func)(struct s6d7aa0 *ctx);
> >         int (*off_func)(struct s6d7aa0 *ctx);
> > -       const struct drm_display_mode drm_mode;
> > +       const struct drm_display_mode *drm_mode;
> >         unsigned long mode_flags;
> >         u32 bus_flags;
> >         bool has_backlight;
> > @@ -309,7 +309,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl0=
80al02_desc =3D {
> >         .panel_type =3D S6D7AA0_PANEL_LSL080AL02,
> >         .init_func =3D s6d7aa0_lsl080al02_init,
> >         .off_func =3D s6d7aa0_lsl080al02_off,
> > -       .drm_mode =3D s6d7aa0_lsl080al02_mode,
> > +       .drm_mode =3D &s6d7aa0_lsl080al02_mode,
> >         .mode_flags =3D MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO=
_NO_HFP,
> >         .bus_flags =3D DRM_BUS_FLAG_DE_HIGH,
> >
> > @@ -412,7 +412,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl0=
80al03_desc =3D {
> >         .panel_type =3D S6D7AA0_PANEL_LSL080AL03,
> >         .init_func =3D s6d7aa0_lsl080al03_init,
> >         .off_func =3D s6d7aa0_lsl080al03_off,
> > -       .drm_mode =3D s6d7aa0_lsl080al03_mode,
> > +       .drm_mode =3D &s6d7aa0_lsl080al03_mode,
> >         .mode_flags =3D MIPI_DSI_MODE_NO_EOT_PACKET,
> >         .bus_flags =3D 0,
> >
> > @@ -440,7 +440,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_ltl1=
01at01_desc =3D {
> >         .panel_type =3D S6D7AA0_PANEL_LTL101AT01,
> >         .init_func =3D s6d7aa0_lsl080al03_init, /* Similar init to LSL0=
80AL03 */
> >         .off_func =3D s6d7aa0_lsl080al03_off,
> > -       .drm_mode =3D s6d7aa0_ltl101at01_mode,
> > +       .drm_mode =3D &s6d7aa0_ltl101at01_mode,
> >         .mode_flags =3D MIPI_DSI_MODE_NO_EOT_PACKET,
> >         .bus_flags =3D 0,
> >
> > @@ -458,7 +458,7 @@ static int s6d7aa0_get_modes(struct drm_panel *pane=
l,
> >         if (!ctx)
> >                 return -EINVAL;
> >
> > -       mode =3D drm_mode_duplicate(connector->dev, &ctx->desc->drm_mod=
e);
> > +       mode =3D drm_mode_duplicate(connector->dev, ctx->desc->drm_mode=
);
> >         if (!mode)
> >                 return -ENOMEM;
> >
> >
> > base-commit: 37cee4876a45a5c3da79a83d34ed4f3c68548aef
> > --
> > 2.40.1
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
