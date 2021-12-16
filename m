Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990FA477B84
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 19:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F2C10ED5F;
	Thu, 16 Dec 2021 18:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409FB10ED79
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 18:29:28 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id b19so38039526ljr.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 10:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KVa7XRjdQTQQ+NHVe7KA6uaTzA6Zt7dgnU51Cr/arDU=;
 b=DvqnCNlGIVWTdXMQTfWTbX+P7/GCCoWVTp336sZp9LGWx1XowYFz2wjhc/+tgOZguA
 Tr6GSml0dR1myMW/Ve2wcssnvMkmO+JVg3lFnZmM9CZR3mszPyp9stqC4dG5ejrEf8WL
 pW1+yz10ocQOKxKRb6VMOLDZUNRFHBUd1iDsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KVa7XRjdQTQQ+NHVe7KA6uaTzA6Zt7dgnU51Cr/arDU=;
 b=oLQeIlDnIDlMgqG+MYV76rbzXRLABgmefKTpUVSv4XwzCc44yFSzuSx51CfGEq0iWC
 QgJ6+VxgN3RpHrxYGBEBRNntoFCY/rQtWUKNwXm4yimo9xaOZpZ8mZoz59iI9Wtvh7xL
 HLJwurAepOEb5OmX4aozYeUCV12r1jgFE1P2fBYuXBnapAYV+8iEsihPWVMSk8nws0ZN
 gqMJD2bpilyIsvwKfGZA/86ciOtG9oA/kH0vPMPTHgTNKsklJk25HZeCfW3iazktl/JZ
 4zbG52pbI0qn8zt5jXTSwzpgWXbzc5N4sIOw/GJiDDTJEjD/A2bP/FRNVLrFmDlQOht3
 DGjg==
X-Gm-Message-State: AOAM532h+zApvbqJlvC75eFEj6a90aoonMF3wGlaEjdVCHM8mNgcNtUu
 VWeYKnYjjEm5bvkbUYTJ237IlX+Yf0Mu3xMGlhGEfw==
X-Google-Smtp-Source: ABdhPJw6LfqHGyB0ofB0fkrEV7zVM3ILMEfGUIWtLIfHpPovC9NhM0H8L41hVX+jM18mzDXtiFkEVi2hYqEMvJ1vqQU=
X-Received: by 2002:a2e:b947:: with SMTP id 7mr16919685ljs.89.1639679366471;
 Thu, 16 Dec 2021 10:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20211022172413.195559-1-markyacoub@chromium.org>
 <20211026011318.GF2515@art_vandelay>
 <CAJUqKUopyQEyLh7w32UnHfUJv0nNUoE_PHAdkEj8JOnkhVqbbQ@mail.gmail.com>
 <CAAOTY_84K_xCQE-H8zxWfBhn4kQF_kPsmaqDuRr8w2E4rti3QA@mail.gmail.com>
 <CAJUqKUrCibOCjPca_YaLpF2_zsb-85CbKbrs9KyGqWwGrWOGyg@mail.gmail.com>
 <CAAOTY_-b=F+moHec9sx_o5jv7XhfSd9A2crHsWGtzBdRSoiwHw@mail.gmail.com>
In-Reply-To: <CAAOTY_-b=F+moHec9sx_o5jv7XhfSd9A2crHsWGtzBdRSoiwHw@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 16 Dec 2021 13:29:15 -0500
Message-ID: <CAJUqKUo2JzASTeVbiP7bAzDKqMYsJGQ5h9=b=9Y8D9z3Xj-YMw@mail.gmail.com>
Subject: Re: [PATCH] mediatek: Set default value for Panel Orientation
 connector prop.
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes sense. Thanks for pointing that out I wasn't aware of it.
I'll take a closer look and try to come up with something better.

Thanks Chun-Kuang!

On Thu, Dec 16, 2021 at 11:53 AM Chun-Kuang Hu <chunkuang.hu@kernel.org> wr=
ote:
>
> Hi, Mark:
>
> Mark Yacoub <markyacoub@chromium.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=881=
6=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:25=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > On Wed, Dec 15, 2021 at 11:14 AM Chun-Kuang Hu <chunkuang.hu@kernel.org=
> wrote:
> > >
> > > Hi, Mark:
> > >
> > > Mark Yacoub <markyacoub@chromium.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=
=8814=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:13=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > >
> > > > Hey CK, can we have this merged?
> > > > Thank you!
> > > >
> > > > On Mon, Oct 25, 2021 at 9:13 PM Sean Paul <sean@poorly.run> wrote:
> > > > >
> > > > > On Fri, Oct 22, 2021 at 01:24:03PM -0400, Mark Yacoub wrote:
> > > > > > From: Mark Yacoub <markyacoub@chromium.org>
> > > > > >
> > > > > > [Why]
> > > > > > Creating the prop uses UNKNOWN as the initial value, which is n=
ot a
> > > > > > supported value if the props is to be supported.
> > > > > >
> > > > > > [How]
> > > > > > Set the panel orientation default value to NORMAL right after c=
reating
> > > > > > the prop.
> > > > >
> > > > > Reviewed-by: Sean Paul <seanpaul@chromium.org>
> > > > >
> > > > > >
> > > > > > Tested on Jacuzzi(MTK)
> > > > > > Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atom=
ic}
> > > > > >
> > > > > > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
> > > > > >  1 file changed, 2 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/d=
rm/mediatek/mtk_dsi.c
> > > > > > index 0ad7157660afa..b7c2528a8f41c 100644
> > > > > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > > > @@ -1039,6 +1039,8 @@ static int mtk_dsi_encoder_init(struct dr=
m_device *drm, struct mtk_dsi *dsi)
> > > > > >               DRM_ERROR("Unable to init panel orientation\n");
> > > > > >               goto err_cleanup_encoder;
> > > > > >       }
> > > > > > +     drm_connector_set_panel_orientation(dsi->connector,
> > > > > > +                                         DRM_MODE_PANEL_ORIENT=
ATION_NORMAL);
> > >
> > > In drm_connector_set_panel_orientation() [1], I find that the
> > > orientation could be set only once. Once you set it to normal, it
> > > could not be set to other orientation. Right?
> > >
> > Hello,
> > Yeah this looks true, and makes sense according to the documentation:
> > https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-kms.html#:~:text=3Don=
e%20standardized%20property%3A-,panel%20orientation%3A,-On%20some%20devices
> >
> > Panel orientation has to do with the how the hardware is mounted, in
> > contrast with the Rotation property. All the HW we have right now has
> > a normal panel orientation so it makes sense to be set this way. Among
>
> Many evidence [1], [2], [3], show that Chromebook plan to have other
> orientation on mt8183, so I think you should consider this.
>
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210409045=
314.3420733-2-hsinyi@chromium.org/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c?h=3Dv5.16-rc5#n1474
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts?h=3Dv5.16-rc5=
#n22
>
> Regards,
> Chun-Kuang.
>
>
>
> > other drivers, panel orientation is always set right after the
> > property is initialized.
> >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/drivers/gpu/drm/drm_connector.c?h=3Dv5.16-rc5#n2302
> > >
> > > Regards,
> > > Chun-Kuang.
> > >
> > > > > >
> > > > > >       drm_connector_attach_encoder(dsi->connector, &dsi->encode=
r);
> > > > > >
> > > > > > --
> > > > > > 2.33.0.1079.g6e70778dc9-goog
> > > > > >
> > > > >
> > > > > --
> > > > > Sean Paul, Software Engineer, Google / Chromium OS
