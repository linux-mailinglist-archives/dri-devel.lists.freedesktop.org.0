Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5346C53C07D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 23:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B350113179;
	Thu,  2 Jun 2022 21:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D56113169
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 21:49:26 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id v1so1780701ejg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 14:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XGSI2I0W6obVN72SR94f17TgsNITtbd3TUyps87cem0=;
 b=I8AbK3106c0NrpQBVIg8yCXzXJPrksGELjkTUDJqqYSxzU9eZC8iQ/NMFM/geGRG67
 73F09t9HkHA/VKsA38Qhq4yt4s8Y5hjkDE5abmeqFTz7RgSZJick4aW5MxbxrGHkX0JB
 p1/OipPLgx9HSZ0DWFbl37ExGobwR46qdR7iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XGSI2I0W6obVN72SR94f17TgsNITtbd3TUyps87cem0=;
 b=ISKTDMzKR95gqpVneGqQr9yisuQaHA4mVD8/PocncYP+dnNIXmKDjd26geaTIGLimO
 i0sa2jAbmAGIuVP8YalSIRex6rcVkgflmDJ8gAis8O8kseK4+rS9ivzNMwIr2Omf0hcl
 5HCK+hYOBdKsOYAilfOoUOPTZSsGgE4fMZkj/z5tw84cMtiYfqKDeswgsslfPO24flOJ
 IKgolmWhkoBe+0gGJwNTuY5KyjHKG8FO9RDrP9kzIzeC+KoARz8o05NYMMHvSwwDR/Gr
 mVKIg7OyMe2yQMZGfs4PHtuIQTbQYAFmDr9dkwI/vK3xte2xOL9k9WAkLy3rm9gVv4Uu
 me4w==
X-Gm-Message-State: AOAM530ClWFgKIUsLUN0CV1iqp4o8b0Fd9T6Cdbrl2YBDiiZPLhQ4Fun
 /Xhmh1tf9fvgPbWnf8Y6NqysTygOsMfdH0Oh
X-Google-Smtp-Source: ABdhPJzR6Vfpl46X1X8qZl+AGt2MbU5wUxlwEJ1Ytt2PVc4Dt5ed115olUsCc7GnKFQxr7TjaAGeBg==
X-Received: by 2002:a17:907:8686:b0:708:1282:cbe6 with SMTP id
 qa6-20020a170907868600b007081282cbe6mr6112668ejc.288.1654206564790; 
 Thu, 02 Jun 2022 14:49:24 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 f3-20020a056402150300b0042dd3bf1403sm2988460edw.54.2022.06.02.14.49.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 14:49:24 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id o9so3210485wmd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 14:49:24 -0700 (PDT)
X-Received: by 2002:a05:600c:2e53:b0:397:4730:ee7a with SMTP id
 q19-20020a05600c2e5300b003974730ee7amr34358678wmf.118.1654206213425; Thu, 02
 Jun 2022 14:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220601094637.1200634-1-hsinyi@chromium.org>
 <20220601094637.1200634-4-hsinyi@chromium.org>
In-Reply-To: <20220601094637.1200634-4-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Jun 2022 14:43:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XnA80P7BoaAX6JD9Q4ggnk4g4M3wmJFEDNij3+10aL4g@mail.gmail.com>
Message-ID: <CAD=FV=XnA80P7BoaAX6JD9Q4ggnk4g4M3wmJFEDNij3+10aL4g@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm/panel: panel-edp: Implement .get_orientation
 callback
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 1, 2022 at 2:46 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 1732b4f56e38..a2133581a72d 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -609,6 +609,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
>         return p->desc->num_timings;
>  }
>
> +static enum drm_panel_orientation panel_edp_get_orientation(struct drm_panel *panel)
> +{
> +       struct panel_edp *p = to_panel_edp(panel);
> +
> +       return p->orientation;
> +}
> +
>  static int detected_panel_show(struct seq_file *s, void *data)
>  {
>         struct drm_panel *panel = s->private;
> @@ -637,6 +644,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
>         .prepare = panel_edp_prepare,
>         .enable = panel_edp_enable,
>         .get_modes = panel_edp_get_modes,
> +       .get_orientation = panel_edp_get_orientation,
>         .get_timings = panel_edp_get_timings,
>         .debugfs_init = panel_edp_debugfs_init,
>  };

I'm curious: should we be removing the old
drm_connector_set_panel_orientation() from panel_edp_get_modes()?
...or maybe you want to keep it for now because you're only adding
support to the mediatek driver and for other drivers the WARN_ON is
better than no orientation support at all?

Maybe you could put a comment next to the old
drm_connector_set_panel_orientation() saying that it's deprecated and
that drm drivers are expected to add a call to get_orientation()? Then
when people see the WARN_ON splat they'll quickly figure out how to
fix it. ...and eventually we can probably remove all the old calls
from get_modes() ?

-Doug
