Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE25243488
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB9F6E512;
	Thu, 13 Aug 2020 07:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F846E8C2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 07:36:15 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id k23so1525623iom.10
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 00:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IoWosUMrqCTx2zIWiSt1q8d4gJ7znnfRYJ6dzYZoqvo=;
 b=V/H600jZakKgVsyPX9ZxQa2CDFO10d91q7X5Cq4QBY6fulJ64VjnevknnUV6o60y4x
 RYRLIpFnyWmqAbVdMt/Q7aOY7jvqs6I9MA2yunpCWT0Ri5ILmVX6oIjyUjBFtSFfXW7W
 Jg+MHT8iK6CV1xZSca30sFDX0+gaYSh+//qaw0Mzpd8HcuR2FvxUuTb36YQm/4MYSM9n
 Uof6PhBTLUADHgnWJOSqOviZ+WqfWpkg8LC4Rjtmgh+uISRNPkd0IILVUg3yU6XQmlmG
 gZTF9tqlaAzLJMzrrwTELEiZv/LSBqSASZZASDO/jv5oI4XPUak123wBUOrknSDNodT2
 cq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IoWosUMrqCTx2zIWiSt1q8d4gJ7znnfRYJ6dzYZoqvo=;
 b=ceswwUJ4sE7G4nWckxtMs4HGMsQudqp8LTka9ReL/E1YJ+OIPtsZAktZ1nZAnr+odZ
 phAQifbtOi7XUApGeqhoS+vKr09d1gaCjfGpwDaDrIwUS/JE3ziEabFC44+D3cIeyrBQ
 f1PREusILamG9OZ0cUW+MeiNZuT7rnxlXOZQ648spROXOCRpwW38Iy4Isq1Xv6YxSyW3
 bgMiztL/tZUWeSRWC5KVvIPEFb6cjdthUm9+96QgXwK49FgtMctbVleKlWI4r78zQBZx
 2SYsutn0dURavBLhr2urMMqxLts2QbCks2i3h5QBtQVnSV1oCQOKSgvO2PVYu83jp3il
 i66w==
X-Gm-Message-State: AOAM532FIVFDYZQ7U4gIMlJHBogyUyn50Ms1faYOPexLPzCbTfzcg0Wj
 6Lm34d0AgB5ZRAm5s1NCD38X6BJoiVDU1yQlno4=
X-Google-Smtp-Source: ABdhPJySVLks5s4aT32oocarxaPUHfObJpAW5xAtQsRFmCR8/2B0N8OotSgLFT03V2Ez7/10+yFWNdZ8P/DPrrZ6pnw=
X-Received: by 2002:a05:6602:15d3:: with SMTP id
 f19mr25983960iow.91.1597217774586; 
 Wed, 12 Aug 2020 00:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <1594388491-15129-1-git-send-email-simhavcs@gmail.com>
 <1594388491-15129-2-git-send-email-simhavcs@gmail.com>
 <CAGWqDJ4P9dKzGngkiEtL_X1HRjjtU17WqNFM-qiv16tXwQNZTg@mail.gmail.com>
 <CAGWqDJ4s3x5M7dGMTxYMpDbM4NBS7kfTb6-+7Fdx8Pe=CE58fA@mail.gmail.com>
 <20200808213022.GW6186@pendragon.ideasonboard.com>
 <20200810175440.GC292825@ravnborg.org>
 <20200811101942.GB6054@pendragon.ideasonboard.com>
 <20200811191704.GA524675@ravnborg.org>
 <CAGWqDJ7bAjDyEr03UT-mfyOuD+xkbo9BG4GyWxbiK_c74eESYw@mail.gmail.com>
In-Reply-To: <CAGWqDJ7bAjDyEr03UT-mfyOuD+xkbo9BG4GyWxbiK_c74eESYw@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Wed, 12 Aug 2020 13:06:02 +0530
Message-ID: <CAGWqDJ6O-EdCVeaCdRBtUTmNUFpPQErQzn1ihtVhXmFjPhnr5g@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] display/drm/bridge: TC358775 DSI/LVDS driver
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sam/laurent,

[PATCH] drm/bridge/tc358775: Fixes bus formats read

is on top of drm-misc-next.


On Wed, Aug 12, 2020 at 7:50 AM Vinay Simha B N <simhavcs@gmail.com> wrote:
>
> Sam,
>
> I will look into this and send the patch ASAP.
>
> On Wed, Aug 12, 2020 at 12:47 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>>
>> Hi Vinay.
>>
>> > >
>> > > If Laurent or others identify further things to improve we can take
>> > > it in-tree.
>> >
>> > Just one thing, please see below.
>> >
>> > > > > >> +       d2l_write(tc->i2c, VTIM1, vtime1);
>> > > > > >> +       d2l_write(tc->i2c, HTIM2, htime2);
>> > > > > >> +       d2l_write(tc->i2c, VTIM2, vtime2);
>> > > > > >> +
>> > > > > >> +       d2l_write(tc->i2c, VFUEN, VFUEN_EN);
>> > > > > >> +       d2l_write(tc->i2c, SYSRST, SYS_RST_LCD);
>> > > > > >> +       d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
>> > > > > >> +
>> > > > > >> +       dev_dbg(tc->dev, "bus_formats %04x bpc %d\n",
>> > > > > >> +               connector->display_info.bus_formats[0],
>> > > > > >> +               tc->bpc);
>> > > > > >> +       /*
>> > > > > >> +        * Default hardware register settings of tc358775 configured
>> > > > > >> +        * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24 format
>> > > > > >> +        */
>> > > > > >> +       if (connector->display_info.bus_formats[0] ==
>> > > > > >> +               MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
>> >
>> > This shouldn't come from the connector, but from the
>> > drm_bridge_state.output_bus_cfg.format. The drm_bridge_funcs
>> > .atomic_get_input_bus_fmts() operation likely needs to be implemented.
>>
>> I trust you will look into this and submit a patch on top of
>> drm-misc-next.
>> Please add a proper "Fixes:" tag identifying the commit that introduced
>> this bug - in this case the commit introducing the driver.
>>
>> Do not hesitate to reply to all if you have any questions.
>> We will help you if we can.
>>
>>         Sam
>
>
>
> --
> regards,
> vinaysimha



-- 
regards,
vinaysimha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
