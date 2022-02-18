Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0164BBC9C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 16:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B70610EE22;
	Fri, 18 Feb 2022 15:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF71210EE18;
 Fri, 18 Feb 2022 15:54:31 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso3979735ooa.4; 
 Fri, 18 Feb 2022 07:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QQJnGEvj1IWlzn/kQU3xNdCOUk3mjEmKlzY4/R3+WQI=;
 b=TNwwv5eZMYbFtrgVKrARlarq8w8wALPJqQI5N6JlSz/H2LztXDQbUGRUntS5NXl9vW
 ir3mzNqNOWkGdrrFqsuH9HlzFZ9U2bDym6d1oBn+Amhs89BzlCziudAdOK95f3sHMOze
 8nGeIDsNK0LF7P1NwGyO5I3DNGPk7DRj+kmNHqFOoJssyPr0luIY0KDZZQAGfu/jkHGD
 sMXGXQZPTmxAFQlkkmvluTXy1JUZC6mzV0aXS5IqLTARe3VDOyvwd+Of5jNsdXfDU+Ir
 KgZd53astXMwxGQHcdZgviLNRZLJDBK7gZFTsvf2ygKNykpEaPYYaoWBqwd3cizATuAe
 1y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QQJnGEvj1IWlzn/kQU3xNdCOUk3mjEmKlzY4/R3+WQI=;
 b=C3sVbL6ssuv5/zTrTpC+k072mgLDXNssxDUOxgGVu4tce4o0Ja1CDQc7w2F8Elxef/
 sWh3A3M/O0B5BLgjybqGnd0uEULTrnyo8SJDMtLiGQzE+DxRvGUfqVn0QaEr4jg5NJS4
 QEBhcMHVjBQDmDBu3nyMj9kHQ1AwoYwv0NCcllSyL5JuzxPamoGTMJNtA474Qkf1fPZA
 KqOalFIrb6bpZcwT0nt6XbIWBA82SKuE/uXkf51Jz9albPLguQ+xfrhgIbhQZD26QWJC
 NDbBU4Wjo9KbHdvPNf4lS1f/zy3bDQ/M5j2cZklHxcIMOCz5gzE1iq6xc2M11utG8Nr9
 OoWQ==
X-Gm-Message-State: AOAM532Ul6xIw+IlsV3spNo/V1T7kyc1lM7z1b0/xEd4LgjVjE18ivgJ
 p6XryKZS5payF3m9xcSTFGz/SvblsYy6EdkOlWU=
X-Google-Smtp-Source: ABdhPJxGsbPPh2j3tUTqSAM9h/ZqCs4rSFX4Vk4DD34Y7lIhBx+wmR81nznW19bZa8bsAbjakZMVT9mAGlHVYnsLW8c=
X-Received: by 2002:a05:6870:912c:b0:d3:44be:7256 with SMTP id
 o44-20020a056870912c00b000d344be7256mr3246887oae.73.1645199670906; Fri, 18
 Feb 2022 07:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
 <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
 <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
 <CACvgo52+o9_ETC+1RKzqKkyw3ZJ28RjH0BqC9DfmNAKqByud8Q@mail.gmail.com>
 <d3f0cc20-d226-ee42-cc98-b469949cec9e@redhat.com>
 <YV87l-2XXzmZ2i6GuGd__uf85s2JQkbXt_qTQDYlbBh1kW2COJoNLUDinmLCokKyy-_0ZnIMUcZeW0GdJ8zF690iYi4ThKrjc09omNMe-0g=@emersion.fr>
 <d4f5e101-3dd5-2f3a-6c14-6b32ee37c223@redhat.com>
 <DM7TzJ-fZEHjoGXvMG8XLfJ2VxohRxotL40_0Vb4cAUvrELgV9BvPGbK6HAwOYOBCx8qXtY2LQ0xnZ-nlH_IVCyne7tMKfvkqxtoWI6MkTw=@emersion.fr>
In-Reply-To: <DM7TzJ-fZEHjoGXvMG8XLfJ2VxohRxotL40_0Vb4cAUvrELgV9BvPGbK6HAwOYOBCx8qXtY2LQ0xnZ-nlH_IVCyne7tMKfvkqxtoWI6MkTw=@emersion.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Feb 2022 10:54:19 -0500
Message-ID: <CADnq5_N6zqn59VH0nTx34gcfXbCvQAvRjmQZCgc9DDGxhYOS4Q@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 7:13 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Friday, February 18th, 2022 at 12:54, Hans de Goede <hdegoede@redhat.com> wrote:
>
> > On 2/18/22 12:39, Simon Ser wrote:
> > > On Friday, February 18th, 2022 at 11:38, Hans de Goede <hdegoede@redhat.com> wrote:
> > >
> > >> What I'm reading in the above is that it is being considered to allow
> > >> changing the panel-orientation value after the connector has been made
> > >> available to userspace; and let userspace know about this through a uevent.
> > >>
> > >> I believe that this is a bad idea, it is important to keep in mind here
> > >> what userspace (e.g. plymouth) uses this prorty for. This property is
> > >> used to rotate the image being rendered / shown on the framebuffer to
> > >> adjust for the panel orientation.
> > >>
> > >> So now lets assume we apply the correct upside-down orientation later
> > >> on a device with an upside-down mounted LCD panel. Then on boot the
> > >> following could happen:
> > >>
> > >> 1. amdgpu exports a connector for the LCD panel to userspace without
> > >> setting panel-orient=upside-down
> > >> 2. plymouth sees this and renders its splash normally, but since the
> > >> panel is upside-down it will now actually show upside-down
> > >
> > > At this point amdgpu hasn't probed the connector yet. So the connector
> > > will be marked as disconnected, and plymouth shouldn't render anything.
> >
> > If before the initial probe of the connector there is a /dev/dri/card0
> > which plymouth can access, then plymouth may at this point decide
> > to disable any seemingly unused crtcs, which will make the screen go black...
> >
> > I'm not sure if plymouth will actually do this, but AFAICT this would
> > not be invalid behavior for a userspace kms consumer to do and I
> > believe it is likely that mutter will disable unused crtcs.
> >
> > IMHO it is just a bad idea to register /dev/dri/card0 with userspace
> > before the initial connector probe is done. Nothing good can come
> > of that.
> >
> > If all the exposed connectors initially are going to show up as
> > disconnected anyways what is the value in registering /dev/dri/card0
> > with userspace early ?
>
> OK. I'm still unsure how I feel about this, but I think I agree with
> you. That said, the amdgpu architecture is quite involved with multiple
> abstraction levels, so I don't think I'm equipped to write a patch to
> fix this...
>
> cc Daniel Vetter: can you confirm probing all connectors is a good thing
> to do on driver module load?

I don't think it's a big deal to change, but at least my
understanding, albeit this was back in the early KMS days, was that
probing was driven by things outside of the driver.  I.e., there is no
need to probe displays if nothing is going to use them.  If you want
to use the displays, you'd call probe first before trying to use them
so you know what is available.

Alex

>
> > >> I guess the initial modeline is inherited from the video-bios, but
> > >> what about the physical size? Note that you cannot just change the
> > >> physical size later either, that gets used to determine the hidpi
> > >> scaling factor in the bootsplash, and changing that after the initial
> > >> bootsplash dislay will also look ugly
> > >>
> > >> b) Why you need the edid for the panel-orientation property at all,
> > >> typically the edid prom is part of the panel and the panel does not
> > >> know that it is mounted e.g. upside down at all, that is a property
> > >> of the system as a whole not of the panel as a standalone unit so
> > >> in my experience getting panel-orient info is something which comes
> > >> from the firmware /video-bios not from edid ?
> > >
> > > This is an internal DRM thing. The orientation quirks logic uses the
> > > mode size advertised by the EDID.
> >
> > The DMI based quirking does, yes. But e.g. the quirk code directly
> > reading this from the Intel VBT does not rely on the mode.
> >
> > But if you are planning on using a DMI based quirk for the steamdeck
> > then yes that needs the mode.
> >
> > Thee mode check is there for 2 reasons:
> >
> > 1. To avoid also applying the quirk to external displays, but
> > I think that that is also solved in most drivers by only checking for
> > a quirk at all on the eDP connector
> >
> > 2. Some laptop models ship with different panels in different badges
> > some of these are portrait (so need a panel-orient) setting and others
> > are landscape.
>
> That makes sense. So yeah the EDID mode based matching logic needs to
> stay to accomodate for these cases.
>
> > > I agree that at least in the Steam
> > > Deck case it may not make a lot of sense to use any info from the
> > > EDID, but that's needed for the current status quo.
> >
> > We could extend the DMI quirk mechanism to allow quirks which don't
> > do the mode check, for use on devices where we can guarantee neither
> > 1 nor 2 happens, then amdgpu could call the quirk code early simply
> > passing 0x0 as resolution.
>
> Yeah. But per the above amdgpu should maybe probe connectors on module
> load. If/when amdgpu is fixed to do this, then we don't need to disable
> the mode matching logic in panel-orientation quirks anymore.
