Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4EA6DE457
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 20:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6214310E612;
	Tue, 11 Apr 2023 18:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D6710E632
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 18:52:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 v14-20020a05600c470e00b003f06520825fso10195562wmo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 11:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681239173; x=1683831173;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dlX5GB/6VyU7aDk+z9ZCkWDR2g+EBJDJyCilYhIFk4Y=;
 b=W8ShJmOrranBwVJX3XSKbLDjxHBq8vJhBijCgc7L4jjwlg2g6LZg+GXeM7mRztXf/U
 ZKVYRs1p00CHF1cn38ax4sIO5XWOY8EngVoOKtLZ3jkRjPquHajLNYCxPkwNa+T48Mjq
 9mMBUNgeylWBYKNdk0F5+ZKjLtRKrC7BeAePFrTlgKsDg0JtOftdh3Q6QkRdYHfghwle
 jtApdt9IEd7ZI3pg0ZrDHrU7mTF7pZYGToUpux2xUSStqkVsUwk+2hBldlWxMhdyjReg
 0kme7KzGOkoTiL8IGpY/VIwwNgrE5P6YmYqBnjDapbi50AHy2zpLxU7RM7FuwczYu8Dy
 aqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681239173; x=1683831173;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dlX5GB/6VyU7aDk+z9ZCkWDR2g+EBJDJyCilYhIFk4Y=;
 b=zDfEtkRpo8C01rLg5QBYLENWazONVwZ5kF9RTX2uqqoGtZ2J9us1tw9ni0CmbiLQSI
 2zcECcbjfwlZuUDyRyHJcnYIZKj6V4vcLsqXmcGhkGv9/Wpb3UmChSgv7+h+Zd1DF6MT
 My7+0SrZwi8dw8ET8BQeTKdp+vxPu+LTAPNNOQU9qRfqZ26lmqtdGSrKZVe+PSUQUvCW
 gtTHVdQSJQatswZ/McXMCtsbqmjvHgECuiI3WGZwTiEmm6G0TvMk6hU43/2jEfr0FHvS
 lMQHogHu5orm1eUrRZXvBcMrGeOHGtpigDNMjWR8AxAeh1OtJKLJ1usHUx1I8PL47cTH
 IjOQ==
X-Gm-Message-State: AAQBX9c4wpS4l6gW4kRib1wDWN6VZKE/NJbku4yKAS9G9n/1UGXUSgFV
 Roc0sYMBFqnjgX8Xr6qOMa2w1vTtU7g6r0v2C5wesw==
X-Google-Smtp-Source: AKy350avcqgtyEtfJTx+rDWfyknXY3joKVtnEOuccyJ8fg2RCwOtWrljTtm/ZHINwoDB1WX5BjrL9rmuJtt0OrNEvi8=
X-Received: by 2002:a1c:7507:0:b0:3f0:8add:2710 with SMTP id
 o7-20020a1c7507000000b003f08add2710mr1431109wmc.6.1681239173160; Tue, 11 Apr
 2023 11:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211225063151.2110878-1-nikita.yoush@cogentembedded.com>
 <Yczy3UYpU2UMFQ6N@pendragon.ideasonboard.com>
 <164563304251.4066078.10022034509552549983@Monstersaurus>
 <YhZf+Fs2AP+btuJj@pendragon.ideasonboard.com>
 <164563575394.4066078.17104997030535169083@Monstersaurus>
 <7163f30b-6496-5762-0d9d-96834fb7452d@ideasonboard.com>
 <a28a4858-c66a-6737-a9fc-502f591ba2d5@ideasonboard.com>
In-Reply-To: <a28a4858-c66a-6737-a9fc-502f591ba2d5@ideasonboard.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Wed, 12 Apr 2023 02:52:40 +0800
Message-ID: <CAMSo37XPdLcVQnRdfL3y4kz82gftg2My0Dvd937GW=N9MiqURA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge_connector: enable HPD by default if supported
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI, All

Just an updated here.
As the commits listed the the following link merged into the
android-mainline kernel:
    https://lore.kernel.org/linux-arm-kernel/20221102180705.459294-1-dmitry.baryshkov@linaro.org/T/
The problem caused by this commit with x15 build is gone now.

Thanks,
Yongqin Liu
On Mon, 5 Sept 2022 at 13:26, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 31/08/2022 16:02, Tomi Valkeinen wrote:
> > Hi,
> >
> > On 23/02/2022 19:02, Kieran Bingham wrote:
> >> Quoting Laurent Pinchart (2022-02-23 16:25:28)
> >>> Hello,
> >>>
> >>> On Wed, Feb 23, 2022 at 04:17:22PM +0000, Kieran Bingham wrote:
> >>>> Quoting Laurent Pinchart (2021-12-29 23:44:29)
> >>>>> On Sat, Dec 25, 2021 at 09:31:51AM +0300, Nikita Yushchenko wrote:
> >>>>>> Hotplug events reported by bridge drivers over
> >>>>>> drm_bridge_hpd_notify()
> >>>>>> get ignored unless somebody calls drm_bridge_hpd_enable(). When the
> >>>>>> connector for the bridge is bridge_connector, such a call is done
> >>>>>> from
> >>>>>> drm_bridge_connector_enable_hpd().
> >>>>>>
> >>>>>> However drm_bridge_connector_enable_hpd() is never called on init
> >>>>>> paths,
> >>>>>> documentation suggests that it is intended for suspend/resume paths.
> >>>>>
> >>>>> Hmmmm... I'm in two minds about this. The problem description is
> >>>>> correct, but I wonder if HPD should be enabled unconditionally
> >>>>> here, or
> >>>>> if this should be left to display drivers to control.
> >>>>> drivers/gpu/drm/imx/dcss/dcss-kms.c enables HPD manually at init time,
> >>>>> other drivers don't.
> >>>>>
> >>>>> It feels like this should be under control of the display controller
> >>>>> driver, but I can't think of a use case for not enabling HPD at init
> >>>>> time. Any second opinion from anyone ?
> >>>>
> >>>> This patch solves an issue I have where I have recently enabled HPD on
> >>>> the SN65DSI86, but without this, I do not get calls to my
> >>>> .hpd_enable or
> >>>> .hpd_disable hooks that I have added to the ti_sn_bridge_funcs.
> >>>>
> >>>> So it needs to be enabled somewhere, and this seems reasonable to me?
> >>>> It's not directly related to the display controller - as it's a factor
> >>>> of the bridge?
> >>>>
> >>>> On Falcon-V3U with HPD additions to SN65DSI86:
> >>>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>>
> >>> If you think this is right, then
> >>>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>
> >> I do, and at the very least it works for me, and fixes Nikita's issue so
> >> to me that's enough for:
> >
> > So who disables the HPD now?
> >
> > Is the drm_bridge_connector_enable_hpd &
> > drm_bridge_connector_disable_hpd documentation now wrong as they talk
> > about suspend/resume handlers?
>
> To give more context, currently omapdrm enables the HPDs at init time
> and disables them at remove time. With this patch, the HPDs are enabled
> twice, leading to a WARN.
>
> imx and msm drivers also seem to call drm_bridge_connector_enable_hpd(),
> so I would guess those also WARN with this patch.
>
> Afaics, this patch alone is broken, as it just disregards the drivers
> that already enable the HPD, and also as it doesn't handle the disabling
> of the HPD, or give any guidelines on how the drivers should now manage
> the HPD.
>
> My suggestion is to revert this one.
>
>   Tomi



-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
