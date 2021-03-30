Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB3A34F632
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 03:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269EA6E09F;
	Wed, 31 Mar 2021 01:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E756E0FF
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 01:25:00 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id v10so8027043pfn.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 18:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0k9lXRJTS1Wy+xaZrJOGXgNw1l0SEWX+Tl4Aywnp+T4=;
 b=jPaKtFx3zVY3hunovhRFR7mAKTjxioFYYJz8ouQey1m/QZHIbE8r0UmNMsV/8iGYfc
 0/FuXL7+dB1kML92yA39BODXyPt2DfhzshN2EOrBODRpeCa/eaeaOA1MjIEK+DxkDfVZ
 1xPMp0c9VTla0hrve04OkC0s7rFbkWfQ8AUeh3L1QfJg2EcG7xMs1/8ctsxoWJDQg46A
 217zPVR2nZ3z3Hqn/iUWe4RELzzTuWBl/KK/wSrZNEddi+Gt+oGtLW/dPrbC/SuClDXn
 dGPq+SwFU4SArs4y/+YB1eeFHMqFjTa51Hc/gOnQ82W6L8Lqn5900PJjV969wvSfmJDE
 tqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0k9lXRJTS1Wy+xaZrJOGXgNw1l0SEWX+Tl4Aywnp+T4=;
 b=VbnLo9cchWPO4PH+0YgOrJObcYICKaID2MBE5rd7jgdkPuRAvo54qNl2+NgK97EMOM
 wLWQM70yLZTT4UQ7cniwvV0vSdTteLOIAcTVDGoSUL1TVk6TxqHOCj2wl254pUUW7u5K
 EVBC3kgrLVUif8ZAWqufhemELhmTWxIWqYWaDHtgiPHR/QUK/q8KI9xE+lq+GrOLqgoC
 68e4GuP5ggZ8uc1RdEzlktofqN6LTQLYvTs0O9RVvJAtyv4GUmspVkv4GymfiyXxy0fT
 w+Ns596lzmmKTvivqplI0VlgtN7wyCKZXsLcMZapSk/foRo5eXtQe4dMSQar01RpfsfO
 1r9w==
X-Gm-Message-State: AOAM533mJ7fg+ofa8zNWZhtRxK4M+YA242dBpPOqn7cGtCervDgpmVWN
 OhQ3hFvbmj0dCh8Al6CC45U=
X-Google-Smtp-Source: ABdhPJzJpXSDBGi7T4t0K1MYRPr9nB4Lvl1izl8/SJM3atEN25F66hzr5wrgQrrWu330B2dCQ9DbaQ==
X-Received: by 2002:a63:175c:: with SMTP id 28mr826053pgx.376.1617153900123;
 Tue, 30 Mar 2021 18:25:00 -0700 (PDT)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id 11sm236828pfn.146.2021.03.30.18.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 18:24:59 -0700 (PDT)
Date: Tue, 30 Mar 2021 16:18:29 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3 0/1] drm/tiny: add support for Waveshare 2inch LCD
 module
Message-ID: <20210330161829.00002263@gmail.com>
In-Reply-To: <ee78a788-3a69-164d-95da-6482e05f8603@lechnology.com>
References: <20210330080846.116223-1-zhangxuezhi3@gmail.com>
 <ee78a788-3a69-164d-95da-6482e05f8603@lechnology.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, tzimmermann@suse.de,
 zhangxuezhi1@yulong.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Mar 2021 09:17:19 -0500
David Lechner <david@lechnology.com> wrote:

> On 3/30/21 3:08 AM, Carlis wrote:
> > From: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> > 
> > This adds a new module for the ST7789V controller with parameters
> > for the Waveshare 2inch LCD module.
> > 
> > Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> > ---
> > v2:change compatible value.
> > v3:change author name.
> > ---
> >   MAINTAINERS                    |   8 +
> >   drivers/gpu/drm/tiny/Kconfig   |  14 ++
> >   drivers/gpu/drm/tiny/Makefile  |   1 +
> >   drivers/gpu/drm/tiny/st7789v.c | 269
> > +++++++++++++++++++++++++++++++++ 4 files changed, 292 insertions(+)
> >   create mode 100644 drivers/gpu/drm/tiny/st7789v.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d92f85ca831d..df25e8e0deb1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5769,6 +5769,14 @@ T:	git
> > git://anongit.freedesktop.org/drm/drm-misc F:
> > Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> > F:	drivers/gpu/drm/tiny/st7735r.c 
> > +DRM DRIVER FOR SITRONIX ST7789V PANELS
> > +M:	David Lechner <david@lechnology.com>  
> 
OK, i will remove this in the next patch.
> I should not be added here. I don't have one of these displays.
> 
> > +M:	Xuezhi Zhang <zhangxuezhi1@yulong.com>
> > +S:	Maintained
> > +T:	git git://anongit.freedesktop.org/drm/drm-misc
> > +F:
> > Documentation/devicetree/bindings/display/sitronix,st7789v-dbi.yaml
> > +F:	drivers/gpu/drm/tiny/st7789v.c +
> >   DRM DRIVER FOR SONY ACX424AKP PANELS
> >   M:	Linus Walleij <linus.walleij@linaro.org>
> >   S:	Maintained  
thanks,
Xuezhi Zhang

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
