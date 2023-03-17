Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 327156BF53E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 23:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3151110E288;
	Fri, 17 Mar 2023 22:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6536C10E288
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 22:37:09 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id le6so6787086plb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 15:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679092629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89IA/glQL/mkyqO2PtOcIR/GMtVguXs5H6651qpjFr0=;
 b=a1hvKnRAcL6yeuxTTNNTdRe7zdPmjHQ9SdZB/1BksmzpLtTOR1r1yhe3+r/9oaHFnE
 MIm2Pgue8VbxaKLfbM6rDX8FZ95tDrQLvjRUW0SOmLymdK9pT4JNKjmu6HixoWc2MrsD
 9O+hAPZMUhc0SfKXqRJJsTCQPFKygqXLJy+gMXd5g3d80TADykEbYrqjDyk/kmmb13SP
 /qeAR0HUU5N99HlxsZv/EqXxsjdDNFKmM8hB/220auBhrX70kV3CC3KHeCtIP1TQXkXb
 814r/FPmCKyQEwX9aXqSlw9C8FIWkFY+eB5SeKvslv0hOOdKdl6PUacjoIpJK3ap1aFq
 XypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679092629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=89IA/glQL/mkyqO2PtOcIR/GMtVguXs5H6651qpjFr0=;
 b=MPkJrmGc169iwBa4uYtCt7KfMH3sPxUXI/C1fcpoovekwH1n1yagFNuz3D0yQgr+FW
 7bRpQ8r+pmC7QJLU54LXUZ6Q6PjYMPHgeO3zZOMJ3RjlLzyZnZROdhg6ewUIPQKMLgeP
 0LvXqUrluDc2L6uQvtJi00F5lsr5cUjVaF+X7LRffTTL5fozD90ItUEN8AE2N9YrlU6u
 pO/LG0UgggwHcRbRh7brM+KHHNkftVm5n/i4dFrnx8lK5Ohg80kYkdfhlUj5BY27KlW3
 3pW/5d5NfKiSA8eKJ/c9yuZNdJBGQDiJcT7D2UfCaGdoE91uiVnn9JrcWKCjPUfK0ZV5
 zcRQ==
X-Gm-Message-State: AO0yUKVPaVJzFkiwstf71nDpHGPXkGw2Y0vqleEGLiOowb8nyiA+Yh7q
 +xJmPHxzO6VVdt6N8kRrNbxilHuC2LglTxDt7GUhOQ==
X-Google-Smtp-Source: AK7set9IsIdsAd8E54XvrIjzRVaTAgLrmWV0OeXdr7iRmMsfE4vL74blGLtVGjasOT+mden5hg28q8MJ8UdSBSjITA0=
X-Received: by 2002:a17:902:f686:b0:1a0:535b:22d9 with SMTP id
 l6-20020a170902f68600b001a0535b22d9mr3922083plg.10.1679092628811; Fri, 17 Mar
 2023 15:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230310063910.2474472-1-saravanak@google.com>
 <4737cacc741c939ca1d980a4858d0748faad11f8.camel@puri.sm>
In-Reply-To: <4737cacc741c939ca1d980a4858d0748faad11f8.camel@puri.sm>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 17 Mar 2023 15:36:32 -0700
Message-ID: <CAGETcx_0NaSTFFn34nvax2_pG+_5BJtOD0j0wrqU0NSCqwfKWA@mail.gmail.com>
Subject: Re: [PATCH v1] drm/mipi-dsi: Set the fwnode for mipi_dsi_device
To: Martin Kepplinger <martin.kepplinger@puri.sm>
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

On Sun, Mar 12, 2023 at 7:45=E2=80=AFAM Martin Kepplinger
<martin.kepplinger@puri.sm> wrote:
>
> Am Donnerstag, dem 09.03.2023 um 22:39 -0800 schrieb Saravana Kannan:
> > After commit 3fb16866b51d ("driver core: fw_devlink: Make cycle
> > detection more robust"), fw_devlink prints an error when consumer
> > devices don't have their fwnode set. This used to be ignored
> > silently.
> >
> > Set the fwnode mipi_dsi_device so fw_devlink can find them and
> > properly
> > track their dependencies.
> >
> > This fixes errors like this:
> > [    0.334054] nwl-dsi 30a00000.mipi-dsi: Failed to create device
> > link with regulator-lcd-1v8
> > [    0.346964] nwl-dsi 30a00000.mipi-dsi: Failed to create device
> > link with backlight-dsi
> >
> > Reported-by: Martin Kepplinger <martin.kepplinger@puri.sm>
>
> Reported-and-tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>

Maintainers,

Nudge nudge. Will this be picked up for 6.3-rcX?

-Saravana

>
> thanks,
>                          martin
>
> > Link:
> > https://lore.kernel.org/lkml/2a8e407f4f18c9350f8629a2b5fa18673355b2ae.c=
amel@puri.sm/
> > Fixes: 068a00233969 ("drm: Add MIPI DSI bus support")
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c
> > b/drivers/gpu/drm/drm_mipi_dsi.c
> > index b41aaf2bb9f1..7923cc21b78e 100644
> > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > @@ -221,7 +221,7 @@ mipi_dsi_device_register_full(struct
> > mipi_dsi_host *host,
> >                 return dsi;
> >         }
> >
> > -       dsi->dev.of_node =3D info->node;
> > +       device_set_node(&dsi->dev, of_fwnode_handle(info->node));
> >         dsi->channel =3D info->channel;
> >         strlcpy(dsi->name, info->type, sizeof(dsi->name));
> >
>
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
