Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3C763C5D6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 17:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE9488867;
	Tue, 29 Nov 2022 16:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DFC10E059
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 16:58:47 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-141ca09c2fbso17759033fac.6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 08:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NDCEJ8MtsSrGnFzSJ2QsS4ewiP1eUO+hWxDdtF/1ZeM=;
 b=C0Yy9a7ovNze7RTz2ZD/VrSjTHesa7ChIlzgYseTiAlYh38+iXjc72z0+hi4WWCg22
 fZ0OyQ9qTYtiV8tuuXvtr+JwE7rFdERgN4nQu5WYLTR+PKMfqBl/e+UCTMl2tnCnDO3T
 Gwta1LnpA3rqZP8FY+ZmJPhCBWjP3FOPDch1GNWEgyYfna9kIuvt6QurkWTsKeGd2NMx
 8lJgbDt54+HZgqYW9PEJlRFYYgMpjabOtk6EvfrjHqxOMsoIk8C2kpULiDjsW5Eqs+VH
 POs50boBxa4nW30n9GvtwhwFQDlbScVVDJV6Gp6O6UE1BhU2s9Z499AENEaf4F3SyPCC
 DLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NDCEJ8MtsSrGnFzSJ2QsS4ewiP1eUO+hWxDdtF/1ZeM=;
 b=zijtW2jui+zS9kob1QHVYl9TsM4fZ7XXLgH/ArdNsJQQiFXlnt8/PFFfrCFYmy3Ge6
 XMKRa+2DkX97+hnmkJwspAuGdEfrv8WSjRPTN2jKeI26MO/+c2kMV2oHATWTz4KN+BFC
 iCCdaywdC7zTayGcgHr9LAGrFRy96MwrMMjOACfYoqQvefArAWu/kynwQK+YohoN0fE8
 Fy7o4jUd39b8Fg16A0my1LoAYw0WQu8wNipxTp3g4AJdj6+ChIe7A5sOeRRsbSL4H5qO
 1krWjXSEEWru+Zgi3ylSwmm4Ji737of3Eo+Z4aHJ1SRx8FSo2u4p/LJv1q8BvmBjr1IV
 uefg==
X-Gm-Message-State: ANoB5pnW3amZRYe8za6s32cvjUI+J/jfxfefSW2ypUxSgREggpDG1xPR
 g7mZhd1/sGyHmLKmUnZVLgYL73Q6MgUoTy8xKQwEnw==
X-Google-Smtp-Source: AA0mqf64R9k+dGqKk0zXELlMiTgXLEetr/9SmX7uiDOvQg19cqM7R56b/QO/qctguZIPNMGvXMnUaTqbebksFJQTKLQ=
X-Received: by 2002:a05:6870:7988:b0:13c:84e6:96d2 with SMTP id
 he8-20020a056870798800b0013c84e696d2mr36782703oab.72.1669741126654; Tue, 29
 Nov 2022 08:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20221108091226.114524-1-yuancan@huawei.com>
 <20221123064017.GA4408@zoo6.em.health.ge.com>
In-Reply-To: <20221123064017.GA4408@zoo6.em.health.ge.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 17:58:36 +0100
Message-ID: <CAG3jFyuQFNaxa+gvD4k5Wp0tho-q5wKDX0TZn=G3=k3Fj6Snog@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: megachips: Fix error handling in
 i2c_register_driver()
To: Ian Ray <ian.ray@ge.com>
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
Cc: neil.armstrong@linaro.org, architt@codeaurora.org,
 martyn.welch@collabora.co.uk, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 peter.senna@gmail.com, Yuan Can <yuancan@huawei.com>, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 martin.donnelly@ge.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Nov 2022 at 07:40, Ian Ray <ian.ray@ge.com> wrote:
>
> On Tue, Nov 08, 2022 at 09:12:26AM +0000, Yuan Can wrote:
> >
> > A problem about insmod megachips-stdpxxxx-ge-b850v3-fw.ko failed is
> > triggered with the following log given:
> >
> > [ 4497.981497] Error: Driver 'stdp4028-ge-b850v3-fw' is already registered, aborting...
> > insmod: ERROR: could not insert module megachips-stdpxxxx-ge-b850v3-fw.ko: Device or resource busy
> >
> > The reason is that stdpxxxx_ge_b850v3_init() returns i2c_add_driver()
> > directly without checking its return value, if i2c_add_driver() failed,
> > it returns without calling i2c_del_driver() on the previous i2c driver,
> > resulting the megachips-stdpxxxx-ge-b850v3-fw can never be installed
> > later.
> > A simple call graph is shown as below:
> >
> >  stdpxxxx_ge_b850v3_init()
> >    i2c_add_driver(&stdp4028_ge_b850v3_fw_driver)
> >    i2c_add_driver(&stdp2690_ge_b850v3_fw_driver)
> >      i2c_register_driver()
> >        driver_register()
> >          bus_add_driver()
> >            priv = kzalloc(...) # OOM happened
> >    # return without delete stdp4028_ge_b850v3_fw_driver
> >
> > Fix by calling i2c_del_driver() on stdp4028_ge_b850v3_fw_driver when
> > i2c_add_driver() returns error.
> >
>
> Thank you!
>
> > Fixes: fcfa0ddc18ed ("drm/bridge: Drivers for megachips-stdpxxxx-ge-b850v3-fw (LVDS-DP++)")
> > Signed-off-by: Yuan Can <yuancan@huawei.com>
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>
> Tested-by: Ian Ray <ian.ray@ge.com>
>
> > ---
> > Changes in v2:
> > - Add Andrzej's Reviewed-by
> > - Change to the new error return style suggested by Andrzej
> >
> >  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > index 97359f807bfc..cbfa05a6767b 100644
> > --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > @@ -440,7 +440,11 @@ static int __init stdpxxxx_ge_b850v3_init(void)
> >       if (ret)
> >               return ret;
> >
> > -     return i2c_add_driver(&stdp2690_ge_b850v3_fw_driver);
> > +     ret = i2c_add_driver(&stdp2690_ge_b850v3_fw_driver);
> > +     if (ret)
> > +             i2c_del_driver(&stdp4028_ge_b850v3_fw_driver);
> > +
> > +     return ret;
> >  }
> >  module_init(stdpxxxx_ge_b850v3_init);
> >
> > --
> > 2.17.1
> >

Applied to drm-misc-next.
