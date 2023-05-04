Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA286F6419
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 06:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B10010E042;
	Thu,  4 May 2023 04:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2280710E042
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 04:40:43 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aae90f5ebcso329325ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 21:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683175243; x=1685767243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H8i47EP8ePoHRL7pxwFpKVB57sm2U0RSBpcP50+Z4MI=;
 b=wINJxjQngMj4N7lNhlO8D83f8HaWZXxf3usgbMommuaTM8eNNO4j2/EEHtFhz1N9pA
 sKTPiRGUmKN3auXfxNUufkzifd8aQ7eEO7oAW9gmaczstYX71/O8z75qgZzd6G1EtSG1
 EzBaxq4TnHmdsNgDGCRo9IuIzQ/KEEGEgKD6hT84srWdNSRGzXPjMBfBVIZB7cKqmWwP
 Hb2CyrrXMeR+MYc4Eg57PK3+lVEhclfCXRBYBE44L36AjZJrJL02habXdmKYOK3zh2ye
 JmKXkFqwjXOY5S2daWyx5cKnF53DE9a/CWJgAEGnUG1P/LUZ66T6G83TSwbPu7zMaHIM
 TbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683175243; x=1685767243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H8i47EP8ePoHRL7pxwFpKVB57sm2U0RSBpcP50+Z4MI=;
 b=LCqQNje8MSVe6QTzfZ6b7eZeeIUiMbakAqcpv4kTNHXkiDFfuU+29cr7nHcznVpGoN
 R97UXweME/o3lXQPXg4S+Mk8pBtanmbZfwxgs/ga+mMu2cl25ydwW3vfBhVtEZybKIMk
 01tOwYptkl4WmSVsE2SKCD6U4eTtlv0TlnFMyXAvFAn/6SBSE7JusOKwowIYddxzAnaW
 siMAszVqBYdK+WNAVCzcaY4OrOXjKI5bmCgEhlSPc5Tca3aJT8tUsDATPC++RfNHDsjs
 r5rh5/FXQOut+ML6c+8+j7f6+vvqmkROv5grT4N1jxRaKNNnQ2XkSaT3x1IiK9Kqht1U
 FXIA==
X-Gm-Message-State: AC+VfDwslYXiQQv3FtNCwRQ0ywSADFrx7QEEcdURjpfM7a7/6lZVhwFy
 eN+feJzL498nm4RAJQnCQQ14jEJ45m9jzqz0SBDxvA==
X-Google-Smtp-Source: ACHHUZ7hVpuWGatGrW2kl5EnK2Wq7mzgiTndTQDxZOaFmGIbyQzPYJLuazpD1Gmb3OeblvjKuSBYNt9Jjo55ST+jsqg=
X-Received: by 2002:a17:902:d507:b0:1a6:c161:37d7 with SMTP id
 b7-20020a170902d50700b001a6c16137d7mr81166plg.5.1683175242784; Wed, 03 May
 2023 21:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230310063910.2474472-1-saravanak@google.com>
 <4737cacc741c939ca1d980a4858d0748faad11f8.camel@puri.sm>
 <CAGETcx_0NaSTFFn34nvax2_pG+_5BJtOD0j0wrqU0NSCqwfKWA@mail.gmail.com>
In-Reply-To: <CAGETcx_0NaSTFFn34nvax2_pG+_5BJtOD0j0wrqU0NSCqwfKWA@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 3 May 2023 21:40:05 -0700
Message-ID: <CAGETcx-CF83Acp5CQ=RMJq9DD6f_Y70c37zSbLq2R6L5VyoKHg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/mipi-dsi: Set the fwnode for mipi_dsi_device
To: Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, kernel-team@android.com,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 3:36=E2=80=AFPM Saravana Kannan <saravanak@google.c=
om> wrote:
>
> On Sun, Mar 12, 2023 at 7:45=E2=80=AFAM Martin Kepplinger
> <martin.kepplinger@puri.sm> wrote:
> >
> > Am Donnerstag, dem 09.03.2023 um 22:39 -0800 schrieb Saravana Kannan:
> > > After commit 3fb16866b51d ("driver core: fw_devlink: Make cycle
> > > detection more robust"), fw_devlink prints an error when consumer
> > > devices don't have their fwnode set. This used to be ignored
> > > silently.
> > >
> > > Set the fwnode mipi_dsi_device so fw_devlink can find them and
> > > properly
> > > track their dependencies.
> > >
> > > This fixes errors like this:
> > > [    0.334054] nwl-dsi 30a00000.mipi-dsi: Failed to create device
> > > link with regulator-lcd-1v8
> > > [    0.346964] nwl-dsi 30a00000.mipi-dsi: Failed to create device
> > > link with backlight-dsi
> > >
> > > Reported-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> >
> > Reported-and-tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>
>
> Maintainers,
>
> Nudge nudge. Will this be picked up for 6.3-rcX?

Greg,

Can you pick this up please? It's a fix that hasn't been picked up for
a few months.

Here's the link to the actual patch for your convenience:
https://lore.kernel.org/lkml/20230310063910.2474472-1-saravanak@google.com/=
#t

-Saravana

>
> -Saravana
>
> >
> > thanks,
> >                          martin
> >
> > > Link:
> > > https://lore.kernel.org/lkml/2a8e407f4f18c9350f8629a2b5fa18673355b2ae=
.camel@puri.sm/
> > > Fixes: 068a00233969 ("drm: Add MIPI DSI bus support")
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > ---
> > >  drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c
> > > b/drivers/gpu/drm/drm_mipi_dsi.c
> > > index b41aaf2bb9f1..7923cc21b78e 100644
> > > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > > @@ -221,7 +221,7 @@ mipi_dsi_device_register_full(struct
> > > mipi_dsi_host *host,
> > >                 return dsi;
> > >         }
> > >
> > > -       dsi->dev.of_node =3D info->node;
> > > +       device_set_node(&dsi->dev, of_fwnode_handle(info->node));
> > >         dsi->channel =3D info->channel;
> > >         strlcpy(dsi->name, info->type, sizeof(dsi->name));
> > >
> >
> >
> > --
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to kernel-team+unsubscribe@android.com.
> >
