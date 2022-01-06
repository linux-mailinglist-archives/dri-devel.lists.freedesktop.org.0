Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67932485DD9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 02:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B770010E554;
	Thu,  6 Jan 2022 01:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA66810E4D6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 01:11:30 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id u8so1258564iol.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 17:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a8rDtGOwui3BgMQmvK4IGCzpia9Sv6OrYVL/XJmK3+w=;
 b=Zq4w/1gmFLyVNNPfI1TYo8ynj+eL0Mgqn6vex300Q6VAhqlh1iNUrMT7FwmuQHlMCp
 RZp1vzki3RQOZ4erkF+ro/o5lwZOrM+cy//b9E9RW/llD5jbKZNbevI2yuYxQqJv+5Mo
 Vq5kMAGjEidIw54/rHNNKFlkqhb/68a8wRHls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a8rDtGOwui3BgMQmvK4IGCzpia9Sv6OrYVL/XJmK3+w=;
 b=fIFQZ3D+ZpBT8mWA7rk8EeLegUSycThzloJzJ2Df6bB5KIUewD6L38x8koWR7g9CUC
 IyJCsBtqkdM+a67ZB/YhnJ4Uu3Io8IfhuJiRCssvqjOtGtFr3fLdwmeqWyVJdd3vUjHO
 iKA0ROq1hFAolymvGPYyMYiEUZzmaCA9jS+u4OQedDZMM+JStcjOZQMvU2t2feRuNHgQ
 PC9fbMc2hOZ9bzJXELxX6XGev2O35ymqeub/qcloDDP2hHX+95bOMehlJbb2O64Cek7I
 eylz2slWhHbGHPFP35qyD/fIkpvO2L/FkiIsAR7TREcOjPt8mHmmwgakCWOC2OpdTt4M
 eDjQ==
X-Gm-Message-State: AOAM532QPsXFcbBz0fhw3fu8t5xhEsRIwDqabTfINEU8/qY0BwFMqGLx
 S+NFKnrQm1MVJB6jSMj7WST78o9Ba40JRg==
X-Google-Smtp-Source: ABdhPJyqCnl/mb87UEVi5PtRPIHfJgrG0s6VBNp7IXEwMQr1A+pjYWiHPakqz/7DJKJrg1ebb89TlA==
X-Received: by 2002:a02:8482:: with SMTP id f2mr28085892jai.104.1641431489706; 
 Wed, 05 Jan 2022 17:11:29 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id y8sm300336ilu.72.2022.01.05.17.11.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 17:11:29 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id o7so1233158ioo.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 17:11:29 -0800 (PST)
X-Received: by 2002:a5e:9b07:: with SMTP id j7mr26012068iok.136.1641431488725; 
 Wed, 05 Jan 2022 17:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com> <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com> <YcGzO0A/iWzhFjvE@orome>
 <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com> <YcH+Fw9sCzCIzFIx@orome>
 <1bac3b32-ad9b-4d10-c7fb-6aafd353cdd4@gmail.com> <YcIWlOoER16wUyQ/@orome>
 <f8c50f22-ddeb-1805-bfcd-410aa46f869a@gmail.com> <YcMRuE0oVinpJPMq@orome>
 <72465efa-47a9-7f2d-15b4-d71f06cff1ca@gmail.com>
In-Reply-To: <72465efa-47a9-7f2d-15b4-d71f06cff1ca@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Jan 2022 17:11:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XGMBw5NEDAY7BZ7+LqOjYPxjB_hLHYzT7mN6q4PbF56Q@mail.gmail.com>
Message-ID: <CAD=FV=XGMBw5NEDAY7BZ7+LqOjYPxjB_hLHYzT7mN6q4PbF56Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
To: Dmitry Osipenko <digetx@gmail.com>
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Dec 22, 2021 at 11:26 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 22.12.2021 14:53, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Dec 22, 2021 at 06:01:26AM +0300, Dmitry Osipenko wrote:
> >> 21.12.2021 21:01, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Tue, Dec 21, 2021 at 07:45:31PM +0300, Dmitry Osipenko wrote:
> >>>> 21.12.2021 19:17, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>> On Tue, Dec 21, 2021 at 06:47:31PM +0300, Dmitry Osipenko wrote:
> >>>>>> 21.12.2021 13:58, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>> ..
> >>>>>>>>>> The panel->ddc isn't used by the new panel-edp driver unless p=
anel is
> >>>>>>>>>> compatible with "edp-panel". Hence the generic_edp_panel_probe=
() should
> >>>>>>>>>> either fail or crash for a such "edp-panel" since panel->ddc i=
sn't fully
> >>>>>>>>>> instantiated, AFAICS.
> >>>>>>>>>
> >>>>>>>>> I've tested this and it works fine on Venice 2. Since that was =
the
> >>>>>>>>> reference design for Nyan, I suspect that Nyan's will also work=
.
> >>>>>>>>>
> >>>>>>>>> It'd be great if Thomas or anyone else with access to a Nyan co=
uld
> >>>>>>>>> test this to verify that.
> >>>>>>>>
> >>>>>>>> There is no panel-edp driver in the v5.15. The EOL of v5.15 is O=
ct,
> >>>>>>>> 2023, hence we need to either use:
> >>>>>>>
> >>>>>>> All the (at least relevant) functionality that is in panel-edp wa=
s in
> >>>>>>> panel-simple before it was moved to panel-edp. I've backported th=
is set
> >>>>>>> of patches to v5.15 and it works just fine there.
> >>>>>>
> >>>>>> Will we be able to add patch to bypass the panel's DT ddc-i2c-bus =
on
> >>>>>> Nyan to keep the older DTBs working?
> >>>>>
> >>>>> I don't see why we would want to do that. It's quite clear that the=
 DTB
> >>>>> is buggy in this case and we have a more accurate way to describe w=
hat's
> >>>>> really there in hardware. In addition that more accurate representa=
tion
> >>>>> also gets rid of a bug. Obviously because the bug is caused by the
> >>>>> previous representation that was not accurate.
> >>>>>
> >>>>> Given that we can easily replace the DTBs on these devices there's =
no
> >>>>> reason to make this any more complicated than it has to be.
> >>>>
> >>>> Don't you care about normal people at all? Do you assume that everyo=
ne
> >>>> must to be a kernel developer to be able to use Tegra devices? :/
> >>>
> >>> If you know how to install a custom kernel you also know how to repla=
ce
> >>> the DTB on these devices.
> >>>
> >>> For everyone else, once these patches are merged upstream and
> >>> distributions start shipping the new version, they will get this
> >>> automatically by updating their kernel package since most distributio=
ns
> >>> actually ship the DTB files as part of that.
> >>>
> >>>> It's not a problem for you to figure out why display is broken, for
> >>>> other people it's a problem. Usually nobody will update DTB without =
a
> >>>> well known reason, instead device will be dusted on a shelf. In the =
end
> >>>> you won't have any users at all.
> >>>
> >>> Most "normal" people aren't even going to notice that their DTB is go=
ing
> >>> to be updated. They would actually have to do extra work *not* to upd=
ate
> >>> it.
> >>
> >> My past experience tells that your assumption is incorrect. There are
> >> quite a lot of people who will update kernel, but not DTB.
> >
> > People that do this will have to do it manually because most
> > distributions I know of will actually ship the DTBs. If they know how t=
o
> > update the kernel separately, I'm sure they will manage to update the
> > DTB as well. It's really not more complicated that updating the kernel
> > image.
> >
> >> ARM devices have endless variations of bootloaders and individual quir=
ks
> >> required for a successful installation of a kernel. Kernel update by
> >> distro usually isn't a thing on ARM.
> >
> > I'm not sure what distribution you have been using, but the ones that
> > I'm familiar with all install the DTBs along with the kernel. Most Tegr=
a
> > devices (newer ones at least) do also support booting with U-Boot which
> > supports standard ways to boot a system (which were co-developed with
> > distributions precisely so that it would become easier for users to kee=
p
> > their systems up-to-date), so there's really nothing magical anyone
> > should need to do in order to get an updated DTB along with the updated
> > kernel.
> >
> > It's a simple fact that sometimes a DTB contains a bug and we have to
> > fix it.
> >
> > In general we try to fix things up in the driver code when reasonable s=
o
> > that people don't have to update the DTB. This is for the (mostly hypo-
> > thetical) case where updating the DTB is not possible or very
> > complicated.
> >
> > However, that's not the case on the Venice 2 or Nyan boards. And lookin=
g
> > at the alternative in this case, I don't think it's reasonable compared
> > to just fixing the problem at the root, which is in the DTB.
>
> My understanding that U-Boot isn't the only available bootloader option
> for Nyan. I don't feel happy about the ABI breakage, but in the same
> time don't feel very strong about the need to care about it in the case
> of Nyan since its DT already had a preexisting problem with the wrong
> panel model used for the FHD model. The decision will be on your
> conscience :)

Maybe I should stand back to avoid getting hit by tomatoes, but IMO
it's a terrible idea to try to update devices trees separately from
kernels for any sufficiently complicated device. I won't stop you from
shooting yourself in the foot, but I also certainly wouldn't encourage
it. I've always said that I'll accept that this is something to really
worry about when we land chunk of "device tree fixup" code that runs
in early boot to fix all the broken device trees out there. All ARM
Chrome OS devices that have ever shipped all bundle device trees
together with the kernel (they bundle a whole pile of them and the
bootloader picks the right one based on model). Sure, someone could
decide to bake one into their bootloader but, even aside from this
case, there are sometimes bugs in device trees and they need to get
fixed. Updating your kernel without your device tree is just bad juju
IMO.

I'll let you and Thierry figure out what you want to do for 5.15. In
the Chrome OS 5.15 kernel tree we simply backported all the edp-panel
stuff, which was fairly clean. I even backported all that stuff to
5.4, but it was decidedly more complex...

-Doug
