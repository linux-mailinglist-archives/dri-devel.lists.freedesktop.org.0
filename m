Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E44B8745
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 13:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B87D10E755;
	Wed, 16 Feb 2022 12:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FF310E755;
 Wed, 16 Feb 2022 12:00:44 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id x3so1814582qvd.8;
 Wed, 16 Feb 2022 04:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cQvOjIROjp4zDNuMZYbqh86L4m+vxJGvKJ604jfTJTw=;
 b=N9wnl8+At1bfN/IgY71qE/9enXNC/I0uomEOiyCqHs1huRf80v1vPyf1KPwTBtuuMY
 ySRrLpd/13BnMtPnT7dsgCj7vksrB9Vnz5k521h31u402pz97WT/nQvNlr7HCmrEk5Jd
 S8QvmdldTCng6bBWqBb9wbHuEGB687ESAVndbnYFA3Ic7aaUpeTGW3Pil6EbgJ3yw84R
 GILrnTSmsLHTiUVrt79J9hMQqfjtojnyiim9lpVXK9cSf9sUTip3OqGYZkBMxYDh03yi
 MJ3IwWCRgjUyTDySrE7H66awu/k+u62bEdMul20Kqp+EOUn6qGgKHBaI99awmFHe8Cc0
 3n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cQvOjIROjp4zDNuMZYbqh86L4m+vxJGvKJ604jfTJTw=;
 b=CWBASinIw0MmljSmhu/mCA1aDcnsnp8YSoD2oNg+vA/Opxd0z/aR/7pnJHNR0zBNlv
 G3yC1TXELJf4jKP2pgrcKU6AGF+vVNPn/yA4KKAnpJ91FsgUc/eWa6AQvfcxbLHBSEFg
 EhZiLwPKjlf+JsbONelF/Zhz6ZWJwrDn5gTQujM+5/6heJWJJokVa/3Ig7yKaNGo1IrE
 x5mvR2KY4DkIpwIykBfuylz4pnl8iMi4UU6ORD0xtU8Jv+UBwxvq6WLLRHTmFiGPZQ5m
 glIrBP2AaaTX26adUvIcLMnC/jWgsJv/FZx+Mnj7usKF4SNsW/aaMTvs9DoxznGUWAIc
 lsAQ==
X-Gm-Message-State: AOAM531gBIzVsnm+i2N63v7LYZt+gtiBUmYuRLtk4cHfiFxm3GxnL1QE
 IkbLw/Wo+qzd3yltBhKjsY7gH6ypjbVTG31Tq34=
X-Google-Smtp-Source: ABdhPJwg7yjA4t72Kpkib54Bk/3LZCXg5ZKFnD3VS3sB64mSjOVkkzuHZ7deSjR6ZyjiByrca9BkgKOtd/mBXxfw0Cc=
X-Received: by 2002:ad4:58af:0:b0:42c:33e5:ddda with SMTP id
 ea15-20020ad458af000000b0042c33e5dddamr1483996qvb.27.1645012843985; Wed, 16
 Feb 2022 04:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
 <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
 <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
In-Reply-To: <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 16 Feb 2022 12:00:32 +0000
Message-ID: <CACvgo52+o9_ETC+1RKzqKkyw3ZJ28RjH0BqC9DfmNAKqByud8Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: Simon Ser <contact@emersion.fr>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Feb 2022 at 16:37, Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, February 15th, 2022 at 15:38, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > On Tue, 15 Feb 2022 at 13:55, Simon Ser <contact@emersion.fr> wrote:
> > >
> > > On Tuesday, February 15th, 2022 at 13:04, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > >
> > > > Greetings everyone,
> > > >
> > > > Padron for joining in so late o/
> > > >
> > > > On Tue, 8 Feb 2022 at 08:42, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > > > >
> > > > > drm_dev_register() sets connector->registration_state to
> > > > > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> > > > > drm_connector_set_panel_orientation() is first called after
> > > > > drm_dev_register(), it will fail several checks and results in following
> > > > > warning.
> > > > >
> > > > > Add a function to create panel orientation property and set default value
> > > > > to UNKNOWN, so drivers can call this function to init the property earlier
> > > > > , and let the panel set the real value later.
> > > > >
> > > >
> > > > The warning illustrates a genuine race condition, where userspace will
> > > > read the old/invalid property value/state. So this patch masks away
> > > > the WARNING without addressing the actual issue.
> > > > Instead can we fix the respective drivers, so that no properties are
> > > > created after drm_dev_register()?
> > > >
> > > > Longer version:
> > > > As we look into drm_dev_register() it's in charge of creating the
> > > > dev/sysfs nodes (et al). Note that connectors cannot disappear at
> > > > runtime.
> > > > For panel orientation, we are creating an immutable connector
> > > > properly, meaning that as soon as drm_dev_register() is called we must
> > > > ensure that the property is available (if applicable) and set to the
> > > > correct value.
> > >
> > > Unfortunately we can't quite do this. To apply the panel orientation quirks we
> > > need to grab the EDID of the eDP connector, and this happened too late in my
> > > testing.
> > >
> > > What we can do is create the prop early during module load, and update it when
> > > we read the EDID (at the place where we create it right now). User-space will
> > > receive a hotplug event after the EDID is read, so will be able to pick up the
> > > new value if any.
> >
> > Didn't quite get that, are you saying that a GETPROPERTY for the EDID,
> > the ioctl blocks or that we get an empty EDID?
>
> I'm not referring to GETPROPERTY, I'm referring to the driver getting the EDID
> from the sink (here, the eDP panel). In my experimentations with amdgpu I
> noticed that the driver module load finished before the EDID was available to
> the driver. Maybe other drivers behave differently and probe connectors when
> loaded, not sure.
>
I see thanks.

> > The EDID hotplug even thing is neat - sounds like it also signals on
> > panel orientation, correct?
> > On such an event, which properties userspace should be re-fetching -
> > everything or guess randomly?
> >
> > Looking through the documentation, I cannot see a clear answer :-\
>
> User-space should re-fetch *all* properties. In practice some user-space may
> only be fetching some properties, but that should get fixed in user-space.
>
> Also the kernel can indicate that only a single connector changed via the
> "CONNECTOR" uevent prop, or even a single connector property via "PROPERTY".
> See [1] for a user-space implementation. But all of this is purely an optional
> optimization. Re-fetching all properties is a bit slower (especially if some
> drmModeGetConnector calls force-probe connectors) but works perfectly fine.
>
Looking at KDE/kwin (the one I'm running) - doesn't seem like it
handles any of the three "HOTPLUG", "PROPERTY" or "CONNECTOR" uevents
:-\
Skimming through GNOME/mutter - it handles "HOTPLUG", but not the optional ones.

Guess we're in the clear wrt potential races, even though the
documentation on the topic is lacklustre.

> It would be nice to document, if you have the time feel free to send a patch
> and CC danvet, pq and me.
>

Doubt I will have the time in the upcoming weeks, but I'll add it to
my ever-growing TODO list :-P

Thanks
Emil
