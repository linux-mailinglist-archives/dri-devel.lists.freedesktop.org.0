Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9714475E93
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 18:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B71510F2C2;
	Wed, 15 Dec 2021 17:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB27310F2C2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 17:25:15 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id k37so44597368lfv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ru1QL2NBcOaL08U8KTJ8X+cObMY1RMiyv3ZA0fT6+tc=;
 b=NR1IRP7NBuHpjy3NNtMcQtDrQeD4PxJvs2bqCI4hudQOXKBccGAg80rzb7VJTpUgKj
 b7Bp+VIFxZ1rqSd77PsBDV7klG9eUd3MurAAwSlG5r1DquTsvSnoKtfYPeZcEXouJWtA
 G52s1P4JbdQ81xsrDlSW58wYsOKxsMMQ9xqwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ru1QL2NBcOaL08U8KTJ8X+cObMY1RMiyv3ZA0fT6+tc=;
 b=7LKq+3fwRxb/Tp2Wq7Vhqa2H5rJNYHdfoViCpkJeslp1QqV31j8hNWsdstfggLupAX
 Z4bqI//6xeRea5EJrInt6QRAX3KN8lmXv1/5PaaEgCfZWlbeURPY+kHkN9tRFrlA6CB9
 HCfw2tQbt7oCKXyu9Rsiekwz7q/mibgw9GONQfwsOGPCiHDigTs0tMdOFDp9s4TPnmGJ
 J2+AXqqn8xozdGFmuVdjZVlCf+zaVhq2XvHxtgtd1G0XcvEDWUzbAlu8Y+1RZQHeKCyn
 w26MSiPR6i5+u4xI0R/3UuRYHQyk6/rSb1HoCF2/YrPjwbiJvdReTOY2PxY7edVA2Iih
 YJDQ==
X-Gm-Message-State: AOAM5314028OURUKyGIQQUqq8rgjU3Ku1l/GuU1UJOP1ptTBVOEynLES
 Bs/mGWn8a9FlI96h1QDMBbJHIk58UQ593zmEJXdkZg==
X-Google-Smtp-Source: ABdhPJznEJza5b1lb+va724WlFIkZtOElqFWZGL/mIh6Ux79XpFZA9BLaQf0YiyCn/PejWZESk08SwEHLgkNYSPRTxQ=
X-Received: by 2002:a19:7417:: with SMTP id v23mr10778310lfe.19.1639589114100; 
 Wed, 15 Dec 2021 09:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20211022172413.195559-1-markyacoub@chromium.org>
 <20211026011318.GF2515@art_vandelay>
 <CAJUqKUopyQEyLh7w32UnHfUJv0nNUoE_PHAdkEj8JOnkhVqbbQ@mail.gmail.com>
 <CAAOTY_84K_xCQE-H8zxWfBhn4kQF_kPsmaqDuRr8w2E4rti3QA@mail.gmail.com>
In-Reply-To: <CAAOTY_84K_xCQE-H8zxWfBhn4kQF_kPsmaqDuRr8w2E4rti3QA@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 15 Dec 2021 12:25:02 -0500
Message-ID: <CAJUqKUrCibOCjPca_YaLpF2_zsb-85CbKbrs9KyGqWwGrWOGyg@mail.gmail.com>
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

On Wed, Dec 15, 2021 at 11:14 AM Chun-Kuang Hu <chunkuang.hu@kernel.org> wr=
ote:
>
> Hi, Mark:
>
> Mark Yacoub <markyacoub@chromium.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=881=
4=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:13=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > Hey CK, can we have this merged?
> > Thank you!
> >
> > On Mon, Oct 25, 2021 at 9:13 PM Sean Paul <sean@poorly.run> wrote:
> > >
> > > On Fri, Oct 22, 2021 at 01:24:03PM -0400, Mark Yacoub wrote:
> > > > From: Mark Yacoub <markyacoub@chromium.org>
> > > >
> > > > [Why]
> > > > Creating the prop uses UNKNOWN as the initial value, which is not a
> > > > supported value if the props is to be supported.
> > > >
> > > > [How]
> > > > Set the panel orientation default value to NORMAL right after creat=
ing
> > > > the prop.
> > >
> > > Reviewed-by: Sean Paul <seanpaul@chromium.org>
> > >
> > > >
> > > > Tested on Jacuzzi(MTK)
> > > > Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}
> > > >
> > > > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/m=
ediatek/mtk_dsi.c
> > > > index 0ad7157660afa..b7c2528a8f41c 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > @@ -1039,6 +1039,8 @@ static int mtk_dsi_encoder_init(struct drm_de=
vice *drm, struct mtk_dsi *dsi)
> > > >               DRM_ERROR("Unable to init panel orientation\n");
> > > >               goto err_cleanup_encoder;
> > > >       }
> > > > +     drm_connector_set_panel_orientation(dsi->connector,
> > > > +                                         DRM_MODE_PANEL_ORIENTATIO=
N_NORMAL);
>
> In drm_connector_set_panel_orientation() [1], I find that the
> orientation could be set only once. Once you set it to normal, it
> could not be set to other orientation. Right?
>
Hello,
Yeah this looks true, and makes sense according to the documentation:
https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-kms.html#:~:text=3Done%20=
standardized%20property%3A-,panel%20orientation%3A,-On%20some%20devices

Panel orientation has to do with the how the hardware is mounted, in
contrast with the Rotation property. All the HW we have right now has
a normal panel orientation so it makes sense to be set this way. Among
other drivers, panel orientation is always set right after the
property is initialized.

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpu/drm/drm_connector.c?h=3Dv5.16-rc5#n2302
>
> Regards,
> Chun-Kuang.
>
> > > >
> > > >       drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> > > >
> > > > --
> > > > 2.33.0.1079.g6e70778dc9-goog
> > > >
> > >
> > > --
> > > Sean Paul, Software Engineer, Google / Chromium OS
