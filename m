Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA3E4779C3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 17:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA8D10E1E3;
	Thu, 16 Dec 2021 16:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97A710E1E3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:53:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 568F0B82521
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E8AC36AEA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639673626;
 bh=9HY2Gr+HhTGXlOap7cbaob8w2cXKS9jFtehhh4izEG8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WRgOo96UY32jO7LJaVjCqsDPFKI9+wDI56L1Mgwf6Zky2BpMKtlbpxJHnu1oHxkqY
 ihoWx3qwypRP/jKX59AFSQI0n+O0ZYqwD9TvgqyoHE7KfvLhGvZc4n/i74G5bc9Ymk
 mcRfIc9jBk3zFEmOKt0c+fxoCHVlNalW5cqoHij0ZaDlGZ57v2Nno/HtgQFVHpoZpQ
 /AEm7jJUfpw5f9ot6nk3p+viPFBLG+gjGEY6MJpCFhif25HCWxyGJLV+qFktGriSFG
 KP5ZLveIYXCUrLLcnn99HtSPaGTBT7gxS8oDAlsVX8x4PLb5H+GG4adzkdQzBaDwwL
 78mQOSHipMF9A==
Received: by mail-ed1-f50.google.com with SMTP id o20so89622701eds.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 08:53:46 -0800 (PST)
X-Gm-Message-State: AOAM533fSjXQsn0MIEJMU+3IUApmhgmcbucgy3XLtsZsp2RCBW+w5LtF
 18zHS92aaMupPRCb74+Ae9jgWtFLHA7vUD7dEA==
X-Google-Smtp-Source: ABdhPJxzD4lGwKbHzDmj/sZXRpKpudELV5UmRGTSzZLUVIZoScj+A0c3yEr8k9wRu+mnTBdtU4+OtRxzKcLNMh5ObfI=
X-Received: by 2002:a50:ef02:: with SMTP id m2mr21289306eds.172.1639673624750; 
 Thu, 16 Dec 2021 08:53:44 -0800 (PST)
MIME-Version: 1.0
References: <20211022172413.195559-1-markyacoub@chromium.org>
 <20211026011318.GF2515@art_vandelay>
 <CAJUqKUopyQEyLh7w32UnHfUJv0nNUoE_PHAdkEj8JOnkhVqbbQ@mail.gmail.com>
 <CAAOTY_84K_xCQE-H8zxWfBhn4kQF_kPsmaqDuRr8w2E4rti3QA@mail.gmail.com>
 <CAJUqKUrCibOCjPca_YaLpF2_zsb-85CbKbrs9KyGqWwGrWOGyg@mail.gmail.com>
In-Reply-To: <CAJUqKUrCibOCjPca_YaLpF2_zsb-85CbKbrs9KyGqWwGrWOGyg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 17 Dec 2021 00:53:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-b=F+moHec9sx_o5jv7XhfSd9A2crHsWGtzBdRSoiwHw@mail.gmail.com>
Message-ID: <CAAOTY_-b=F+moHec9sx_o5jv7XhfSd9A2crHsWGtzBdRSoiwHw@mail.gmail.com>
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

Mark Yacoub <markyacoub@chromium.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8816=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:25=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Wed, Dec 15, 2021 at 11:14 AM Chun-Kuang Hu <chunkuang.hu@kernel.org> =
wrote:
> >
> > Hi, Mark:
> >
> > Mark Yacoub <markyacoub@chromium.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=
=8814=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:13=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > >
> > > Hey CK, can we have this merged?
> > > Thank you!
> > >
> > > On Mon, Oct 25, 2021 at 9:13 PM Sean Paul <sean@poorly.run> wrote:
> > > >
> > > > On Fri, Oct 22, 2021 at 01:24:03PM -0400, Mark Yacoub wrote:
> > > > > From: Mark Yacoub <markyacoub@chromium.org>
> > > > >
> > > > > [Why]
> > > > > Creating the prop uses UNKNOWN as the initial value, which is not=
 a
> > > > > supported value if the props is to be supported.
> > > > >
> > > > > [How]
> > > > > Set the panel orientation default value to NORMAL right after cre=
ating
> > > > > the prop.
> > > >
> > > > Reviewed-by: Sean Paul <seanpaul@chromium.org>
> > > >
> > > > >
> > > > > Tested on Jacuzzi(MTK)
> > > > > Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic=
}
> > > > >
> > > > > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm=
/mediatek/mtk_dsi.c
> > > > > index 0ad7157660afa..b7c2528a8f41c 100644
> > > > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > > @@ -1039,6 +1039,8 @@ static int mtk_dsi_encoder_init(struct drm_=
device *drm, struct mtk_dsi *dsi)
> > > > >               DRM_ERROR("Unable to init panel orientation\n");
> > > > >               goto err_cleanup_encoder;
> > > > >       }
> > > > > +     drm_connector_set_panel_orientation(dsi->connector,
> > > > > +                                         DRM_MODE_PANEL_ORIENTAT=
ION_NORMAL);
> >
> > In drm_connector_set_panel_orientation() [1], I find that the
> > orientation could be set only once. Once you set it to normal, it
> > could not be set to other orientation. Right?
> >
> Hello,
> Yeah this looks true, and makes sense according to the documentation:
> https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-kms.html#:~:text=3Done%=
20standardized%20property%3A-,panel%20orientation%3A,-On%20some%20devices
>
> Panel orientation has to do with the how the hardware is mounted, in
> contrast with the Rotation property. All the HW we have right now has
> a normal panel orientation so it makes sense to be set this way. Among

Many evidence [1], [2], [3], show that Chromebook plan to have other
orientation on mt8183, so I think you should consider this.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/2021040904531=
4.3420733-2-hsinyi@chromium.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c?h=3Dv5.16-rc5#n1474
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts?h=3Dv5.16-rc5#n=
22

Regards,
Chun-Kuang.



> other drivers, panel orientation is always set right after the
> property is initialized.
>
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/gpu/drm/drm_connector.c?h=3Dv5.16-rc5#n2302
> >
> > Regards,
> > Chun-Kuang.
> >
> > > > >
> > > > >       drm_connector_attach_encoder(dsi->connector, &dsi->encoder)=
;
> > > > >
> > > > > --
> > > > > 2.33.0.1079.g6e70778dc9-goog
> > > > >
> > > >
> > > > --
> > > > Sean Paul, Software Engineer, Google / Chromium OS
