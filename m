Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527694E4945
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 23:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2517610E581;
	Tue, 22 Mar 2022 22:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95A010E582
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 22:42:41 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so2561529pjo.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 15:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zzdneHxq4SaLJqCgu2nB61PVc+nexA0+nC4/oEmI0gs=;
 b=HoJAhN8F2ZPdzbdrZd252ccLMaWy0BzcJCNUdFExtl3bWE4h47PUt6fMZkod7jajd4
 AcJGlU/R3poSKRFR0BuJQOq5XFXLIflvSvfVB9ge6P/ZboGhvtMFz9rnHQclW7SgYwWW
 vHZ3QskCpxvHiDVAFcGA4Cko1tmbE1ycZE9Cnwer8dRWGvShwslVWeEmGmRRze5ehqH/
 8Al7BTtLj1rdAKVGkE/22TmrwTzRak3FONirQdDrPoURY3jtjhvDoB2TXXVP80/Wh2RK
 Gr5U525VDsXQN9lAHbQKhudURIE11kQf6n3FLIG73yISMg8a4ClQPNAfrzHnzt4VbOPy
 XZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zzdneHxq4SaLJqCgu2nB61PVc+nexA0+nC4/oEmI0gs=;
 b=HuQ56P+Ip22xPMNrTqtqWJjpFZ1CHUgTklK6VIPRsgmKho8phQGBweZVYWEvY7FTxr
 3/tJwWdACBRkIAQaOMOT+M4jNV+fAA4SJjOKxzn/+gI+/6mcQuFHrc9uniZFimEtnfjD
 +6PHWXLP5bCnf8h8iVR0bi+ngmGVna5JEbIdzloymNMdAGdFGMco4Dr+umf1Kr/WJmZ6
 dYTyC5Jw+BCUH9R1i6Vxd6qZx9uIvlgOHyQ6tRAf7uREnVH0ZXnHmyGXqhkKacZSFGKr
 JqLRtUD0xWwPmo/IyAqGiuv9EP/1t8u/XU6P1R7bkGx1ajwf0BmVlZC1zlVozSW6aSdK
 7PcQ==
X-Gm-Message-State: AOAM532PMMchrwz+qMY85GBLnw7117DtB9aI6XXmW1oq9iiGb2nxkoP7
 9exmfEIdgpwtWxKDhI6I3xEDcCnQEx28Fi3oRsUkDW0K
X-Google-Smtp-Source: ABdhPJy/7wBC7zZ/ckjajgHmzuchX3tlxI0u4Iv42DDHIwzPKzpAvkUmVAtPrQdPhFie4WfrkiKLMf9ecNr/iWu3FpE=
X-Received: by 2002:a17:902:70c1:b0:154:667f:e361 with SMTP id
 l1-20020a17090270c100b00154667fe361mr10769356plt.148.1647988961123; Tue, 22
 Mar 2022 15:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
 <3186b184-fa62-9bc4-7531-8ad4eac139ef@suse.de>
 <c3c00675-cb9b-277f-88a7-0b01455ef0f3@suse.de>
In-Reply-To: <c3c00675-cb9b-277f-88a7-0b01455ef0f3@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 22 Mar 2022 23:42:29 +0100
Message-ID: <CAMeQTsbgYRb7cc-A1Mx5FD1FM=AsVG9CKNOZM_D=D2Afr6uYLw@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/gma500: Use managed drmm_mode_config_init()
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 8:32 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
>
>
> Am 22.03.22 um 20:30 schrieb Thomas Zimmermann:
> > Hi Patrik
> >
> > Am 22.03.22 um 14:17 schrieb Patrik Jakobsson:
> >> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> >> ---
> >>   drivers/gpu/drm/gma500/framebuffer.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/gma500/framebuffer.c
> >> b/drivers/gpu/drm/gma500/framebuffer.c
> >> index 45df9de22007..2b99c996fdc2 100644
> >> --- a/drivers/gpu/drm/gma500/framebuffer.c
> >> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> >> @@ -514,7 +514,8 @@ void psb_modeset_init(struct drm_device *dev)
> >>       struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> >>       int i;
> >> -    drm_mode_config_init(dev);
> >> +    if (drmm_mode_config_init(dev))
> >> +        return;
> >
> > This will fail without any notice. I suggest to return an error here or
> > at let psb_driver_load() fail.
>
> 'and let psb_driver_load() fail'

Hi Thomas,
I did consider it but there are more places where psb_driver_load()
can fail so I think it deserves its own patch.

I'll send a follow-up.

-Patrik

>
> >
> > Best regards
> > Thomas
> >
> >>       dev->mode_config.min_width =3D 0;
> >>       dev->mode_config.min_height =3D 0;
> >> @@ -546,6 +547,5 @@ void psb_modeset_cleanup(struct drm_device *dev)
> >>       if (dev_priv->modeset) {
> >>           drm_kms_helper_poll_fini(dev);
> >>           psb_fbdev_fini(dev);
> >> -        drm_mode_config_cleanup(dev);
> >>       }
> >>   }
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
