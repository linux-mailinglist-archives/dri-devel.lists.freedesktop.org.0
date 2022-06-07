Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F6153F4C0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 05:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1A0112A8A;
	Tue,  7 Jun 2022 03:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5150A112A8A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 03:55:11 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id fd25so21288116edb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 20:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+rF3WnKoDiq9d0J5JTo2dbHB29qndpGa9NLM7gHMjks=;
 b=dOTd7bOssfnug98baEiau/IHu9iQgmO17eKfDY/Bah2lZ9CfdHsZQVDOuAxtfFOjt6
 OfMgThkcO291HJnaSUEMg8Th8FQnPhCGiKp27GaI/cmwZ2T3IA2Pv/VH1MCx4C5srtdM
 KSQa6JTtjCr3JKGym2k92cRDgRRlctuhUe8L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+rF3WnKoDiq9d0J5JTo2dbHB29qndpGa9NLM7gHMjks=;
 b=2B4iSOUUVIQeDNLlyoA/m/jb5hgWtkLLhcLzCcTEdJQTZpp7PEYPpsPZrbZzwK7Ty2
 M0OhTpeaeCgvp12j8Q60pmPRC9Xg338fRYMpqVu+noSgpUG6zBq+mY3GUX+1fAIW2tby
 Pn41v04nmB/iU9vRk2ckYZ2/rRDkbtotTqPN72D7X9qC6MquRhNH6W1iOyQJ9qMu61dc
 bAMl96+lVNO5wjM1M/QZ9llBadm6jRrbGjrxIX1i0aAh9nJm6KB9LEuAYpahhpDdd8HE
 M+C3gb7RegzhCHyNZf3/Yb4jBWcYzg8gvass/uUSF3aLzQ+pbw1mX5vmqTJp/DFC3HeJ
 yKYQ==
X-Gm-Message-State: AOAM532aauNdXcQ4KbKepo/h50Ug8BJzhcmp26prLYT3As6JlUZPAsQ5
 96p4ZFHu/tRrbDZTiPc7kqPUlzdbFuX3eMj33ruPeA==
X-Google-Smtp-Source: ABdhPJxseST/bQW8I4wOtFU0k3sfPx8cJKe63oJ9hcqGlssDuTJQdN8hOFSR1H0gQ/VzLuzmJyaFXgWaoQDXWguxXK8=
X-Received: by 2002:a05:6402:84a:b0:423:fe99:8c53 with SMTP id
 b10-20020a056402084a00b00423fe998c53mr30452834edz.195.1654574109792; Mon, 06
 Jun 2022 20:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-6-hsinyi@chromium.org>
 <Yp5Ul/ODUB/sQ0Jf@ravnborg.org>
In-Reply-To: <Yp5Ul/ODUB/sQ0Jf@ravnborg.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 7 Jun 2022 11:54:43 +0800
Message-ID: <CAJMQK-huAnvamC318FhHoBSTTnMB489PWsH6tZu3r9Ah990Gzw@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] drm/panel: panel-simple: Implement
 .get_orientation callback
To: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 7, 2022 at 3:25 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Hsin-Yi,
>
> On Mon, Jun 06, 2022 at 11:24:28PM +0800, Hsin-Yi Wang wrote:
> > To return the orientation property to drm/kms driver.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 4a2e580a2f7b..f232b8cf4075 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -411,7 +411,12 @@ static int panel_simple_get_modes(struct drm_panel *panel,
> >       /* add hard-coded panel modes */
> >       num += panel_simple_get_non_edid_modes(p, connector);
> >
> > -     /* set up connector's "panel orientation" property */
> > +     /*
> > +      * drm drivers are expected to call drm_panel_get_orientation() to get
> > +      * panel's orientation then drm_connector_set_panel_orientation() to
> > +      * set the property before drm_dev_register(). Otherwise there will be
> > +      * a WARN_ON if orientation is set after drm is registered.
> > +      */
>
> This comment is not really relevant here. If we need to explain this
> then put it in drm_panel.c/h - as this applies for all panels and not
> just the panel_simple.
> Keep in mind, this is the source new panels often use a inspiration and
> no need to have this copied around.
>
Will update this.

> >       drm_connector_set_panel_orientation(connector, p->orientation);
> >
> >       return num;
> > @@ -434,6 +439,14 @@ static int panel_simple_get_timings(struct drm_panel *panel,
> >       return p->desc->num_timings;
> >  }
> >
> > +static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
> > +{
> > +       struct panel_simple *p = to_panel_simple(panel);
> > +
> > +       return p->orientation;
> > +}
> > +
> > +
> >  static const struct drm_panel_funcs panel_simple_funcs = {
> >       .disable = panel_simple_disable,
> >       .unprepare = panel_simple_unprepare,
> > @@ -441,6 +454,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
> >       .enable = panel_simple_enable,
> >       .get_modes = panel_simple_get_modes,
> >       .get_timings = panel_simple_get_timings,
> > +     .get_orientation = panel_simple_get_orientation,
>
> I like the order in this list to match the order in the .h file.
> So my OCD would like you to move it up right after get_modes,
> but feel free to ignore this.
>
Sure.

> With the suggested changes:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> >  };
> >
> >  static struct panel_desc panel_dpi;
> > --
> > 2.36.1.255.ge46751e96f-goog
