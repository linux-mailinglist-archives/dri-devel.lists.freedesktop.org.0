Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B7475D25
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB8F10EED4;
	Wed, 15 Dec 2021 16:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24B010EED4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:14:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C09FB81FDA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2148EC36AE3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639584894;
 bh=wo0crMKVlb7bmqaDIAvITIC848wu5jLZZ67Z80HKcRM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tBehOfNzgivQmMb364NV2XSo/LJLMNYmvFGTh8FToVI9DhZH282ewI8wWvRjyEjWW
 NfWxcfF23YmLVfYjFmZe2mC9LdopIUBNXGuFgh6z+s3cGq6MvbVswabXSqxgmkG18y
 a3VJ/eUc5S9whWr3CXcs2hCOyZStEA+4aOr1JX8q14wCqx49R9pkMX49CGsNUOre0E
 jT9QH4YJgHO3aiZvPPX6oUX/KxshOmcvLn+tJMdZrdvGkTGIi6Wg9wq0rDzg7mBuPS
 aqgzt9dluFpXhb4lrzbCuYH9mO0qKmtg3WJAyPbSkGt6TEN7TkeISY66SeUGiCMxlO
 Q71LfO9jgt6AQ==
Received: by mail-ed1-f49.google.com with SMTP id b7so17393333edd.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 08:14:54 -0800 (PST)
X-Gm-Message-State: AOAM530eJ9FFl52ExkU3Pnz5FVcgt6EEiJNkAdoUTndrtaszIPjzu5lW
 eMA9TEgElDlrWFdmlLc+KwyL6Jjwfs2BXN8fqw==
X-Google-Smtp-Source: ABdhPJwb1dCWZnfzIsxAO7jQHE1+1kUJseuzbpP+YWd9CINPK/i/ENG5c75C9WxsfttHUDoyFH5Gb/7t73WX+PxlWKg=
X-Received: by 2002:a50:ef02:: with SMTP id m2mr15331810eds.172.1639584888656; 
 Wed, 15 Dec 2021 08:14:48 -0800 (PST)
MIME-Version: 1.0
References: <20211022172413.195559-1-markyacoub@chromium.org>
 <20211026011318.GF2515@art_vandelay>
 <CAJUqKUopyQEyLh7w32UnHfUJv0nNUoE_PHAdkEj8JOnkhVqbbQ@mail.gmail.com>
In-Reply-To: <CAJUqKUopyQEyLh7w32UnHfUJv0nNUoE_PHAdkEj8JOnkhVqbbQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 16 Dec 2021 00:14:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_84K_xCQE-H8zxWfBhn4kQF_kPsmaqDuRr8w2E4rti3QA@mail.gmail.com>
Message-ID: <CAAOTY_84K_xCQE-H8zxWfBhn4kQF_kPsmaqDuRr8w2E4rti3QA@mail.gmail.com>
Subject: Re: [PATCH] mediatek: Set default value for Panel Orientation
 connector prop.
To: Mark Yacoub <markyacoub@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Mark:

Mark Yacoub <markyacoub@chromium.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8814=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:13=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hey CK, can we have this merged?
> Thank you!
>
> On Mon, Oct 25, 2021 at 9:13 PM Sean Paul <sean@poorly.run> wrote:
> >
> > On Fri, Oct 22, 2021 at 01:24:03PM -0400, Mark Yacoub wrote:
> > > From: Mark Yacoub <markyacoub@chromium.org>
> > >
> > > [Why]
> > > Creating the prop uses UNKNOWN as the initial value, which is not a
> > > supported value if the props is to be supported.
> > >
> > > [How]
> > > Set the panel orientation default value to NORMAL right after creatin=
g
> > > the prop.
> >
> > Reviewed-by: Sean Paul <seanpaul@chromium.org>
> >
> > >
> > > Tested on Jacuzzi(MTK)
> > > Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}
> > >
> > > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/med=
iatek/mtk_dsi.c
> > > index 0ad7157660afa..b7c2528a8f41c 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > @@ -1039,6 +1039,8 @@ static int mtk_dsi_encoder_init(struct drm_devi=
ce *drm, struct mtk_dsi *dsi)
> > >               DRM_ERROR("Unable to init panel orientation\n");
> > >               goto err_cleanup_encoder;
> > >       }
> > > +     drm_connector_set_panel_orientation(dsi->connector,
> > > +                                         DRM_MODE_PANEL_ORIENTATION_=
NORMAL);

In drm_connector_set_panel_orientation() [1], I find that the
orientation could be set only once. Once you set it to normal, it
could not be set to other orientation. Right?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/drm_connector.c?h=3Dv5.16-rc5#n2302

Regards,
Chun-Kuang.

> > >
> > >       drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> > >
> > > --
> > > 2.33.0.1079.g6e70778dc9-goog
> > >
> >
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
