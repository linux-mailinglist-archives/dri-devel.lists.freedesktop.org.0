Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1DC53C5CE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 09:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AC110E765;
	Fri,  3 Jun 2022 07:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0397810E765
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 07:16:23 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id a67so1571227qkc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 00:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=dIJZ7XsK+jUGLZjZMwQas9x7LlLeZtDPahCJOQk733E=;
 b=jkyBTOxxEkc5EnW3kRRScGh7EhoEvpA+BVddYFEzXQfPdZsvrkd7HA26dG0iBYT7xJ
 5TFos+OhidJKPZJSley/1Kzprhptn+qGCJ8tLF5rnz24g+LM8fcSXLe/1BKy8f9mqCDn
 7rB68U2s0KqnAsp8+emdCPCEA8j/dea+a+PtHqUYJxWlbM1lsDwJhobYHUY3HR6FMj7J
 gqI4fUkcBQ//TQjlMEiiAEwGsbPiXUpC/t/W4TyDquUD5OKnlYSoBbADKWXOrw3zYZNV
 89iJsBtwq+W/zgn6uACJ8+FvGQJiaCCv4qSlUC1OXfG2cDy3aHd3Fe4CmO+Ew6fbIJ2r
 uS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=dIJZ7XsK+jUGLZjZMwQas9x7LlLeZtDPahCJOQk733E=;
 b=hmevdK1yfIu/EMvY1bQWcLgHQP6YQALlzgsk7Yaam0D6RuowqckcMI/LZAojdgdWwa
 qb/fsBwLg9HEewlCpN7uY/NscWrMVgCQHAqx2AMarQufaQbL7weW1aJwMSuk+vFsS0GE
 p0FyC9OlICkKHdclkIuPR9KeRtokTBmgmf8u76X5g2VUaJwo6sKXGetCEMQmhhSDOzku
 affWRGNkBI9V8nV0USVpCHRTi1XFDy/ThpP23fnckl1eVUcL8/ndAhkMXYgP8ZfYzaZv
 4f0STlWmXzssHhwEIMAUOWBcHd5cJwqHT7f/eDZtB8zv17bH6CxMqYq7kiJSfYdHiWi5
 DiKA==
X-Gm-Message-State: AOAM53250UJQp1gpyJV+XYqdkxXmPXZgFCJuwsoJyLipP57UD+n2HesD
 bi3enVPi+/WGTi5KK2ml4aryKBAPAFdEzJbquDk=
X-Google-Smtp-Source: ABdhPJxLklb9YOxqu1LA4iqFWnJRA+XMTO74MesTEr15+f/AR/nlQ1zJT5hXJQzMOrzM/08dFX7OGLPAVBbtwbRBH4Q=
X-Received: by 2002:a05:620a:11b6:b0:6a3:2569:7a4f with SMTP id
 c22-20020a05620a11b600b006a325697a4fmr5527968qkk.666.1654240582110; Fri, 03
 Jun 2022 00:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220602180118.66170-1-r.stratiienko@gmail.com>
 <20220602215547.scsabzbeztgduaj3@core>
In-Reply-To: <20220602215547.scsabzbeztgduaj3@core>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Fri, 3 Jun 2022 10:16:10 +0300
Message-ID: <CAGphcdk0gybTVZzgqSQDna_D-eEUtJO+Xe_2Of1vVObm_z8tZw@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: sun8i: Add the ability to keep scaler enabled
 for VI layer
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>, 
 Roman Stratiienko <r.stratiienko@gmail.com>, mripard@kernel.org, wens@csie.org,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, airlied@linux.ie, 
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ondrej,

=D0=BF=D1=82, 3 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 00:55, Ond=C5=99ej =
Jirman <megous@megous.com>:
>
> Hi Roman,
>
> On Thu, Jun 02, 2022 at 06:01:18PM +0000, Roman Stratiienko wrote:
> > According to DE2.0/DE3.0 manual VI scaler enable register is double
> > buffered, but de facto it doesn't, or the hardware has the shadow
> > register latching issues which causes single-frame picture corruption
> > after changing the state of scaler enable register.
> >
> > Allow the user to keep the scaler always enabled, preventing the UI
> > glitches on the transition from scaled to unscaled state.
> >
> > NOTE:
> > UI layer scaler has more registers with double-buffering issue and can'=
t
> > be workarounded in the same manner.
> >
> > You may find a python test and a demo video for this issue at [1]
>
> Isn't this an issue with kernel driver not waiting for DE2 FINISH IRQ, bu=
t
> for VBLANK IRQ from TCON instead, before allowing to write new set of reg=
ister
> values?

No, DE2 FINISH IRQ is triggered just some micro or even nanoseconds
earlier from vblank IRQ
(I have checked it using tracing).

I can guess MISSION FINISH IRQ triggered when the last line is being
sent to the line buffer cache (in between of the mixer output and tcon
input).
But VBLANG IRQ triggers when the last line is being sent to the
display + hfront porch time + hsync time.

I have also tried scheduling the register updates that have
double-buffering issues at VBLANK irq. And such a solution fixes the
test for both VI and UI scalers.
But under high loads there are still glitches happening. This patch
solves the issue for both test and high load conditions. (but for VI
only)
I'll post my solution with a deferred scaling register update soon.

>
> https://megous.com/dl/tmp/4fe35b3fc72ee7de.png
>
> I haven't checked if FINISH flag is set at time of VBLANK interrupt, so m=
aybe
> this is not the issue.
>
> regards,
>         o.
>
> > [1]: https://github.com/GloDroid/glodroid_tests/issues/4
> > Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 12 ++++++++++++
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  4 +++-
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4=
i/sun8i_mixer.c
> > index 71ab0a00b4de..15cad0330f66 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -27,6 +27,18 @@
> >  #include "sun8i_vi_layer.h"
> >  #include "sunxi_engine.h"
> >
> > +/* According to DE2.0/DE3.0 manual VI scaler enable register is double
> > + * buffered, but de facto it doesn't, or the hardware has the shadow
> > + * register latching issues which causes single-frame picture corrupti=
on
> > + * after changing the state of scaler enable register.
> > + * Allow the user to keep the scaler always enabled, preventing the UI
> > + * glitches on the transition from scaled to unscaled state.
> > + */
> > +int sun8i_vi_keep_scaler_enabled;
> > +MODULE_PARM_DESC(keep_vi_scaler_enabled,
> > +              "Keep VI scaler enabled (1 =3D enabled, 0 =3D disabled (=
default))");
> > +module_param_named(keep_vi_scaler_enabled, sun8i_vi_keep_scaler_enable=
d, int, 0644);
> > +
> >  struct de2_fmt_info {
> >       u32     drm_fmt;
> >       u32     de2_fmt;
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/s=
un4i/sun8i_vi_layer.c
> > index 662ba1018cc4..f005ab883503 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > @@ -17,6 +17,8 @@
> >  #include "sun8i_vi_layer.h"
> >  #include "sun8i_vi_scaler.h"
> >
> > +extern int sun8i_vi_keep_scaler_enabled;
> > +
> >  static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int chann=
el,
> >                                 int overlay, bool enable, unsigned int =
zpos)
> >  {
> > @@ -149,7 +151,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i=
_mixer *mixer, int channel,
> >        */
> >       subsampled =3D format->hsub > 1 || format->vsub > 1;
> >
> > -     if (insize !=3D outsize || subsampled || hphase || vphase) {
> > +     if (insize !=3D outsize || subsampled || hphase || vphase || sun8=
i_vi_keep_scaler_enabled) {
> >               unsigned int scanline, required;
> >               struct drm_display_mode *mode;
> >               u32 hscale, vscale, fps;
> > --
> > 2.30.2
> >
