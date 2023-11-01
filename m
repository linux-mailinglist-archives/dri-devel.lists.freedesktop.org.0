Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B62FE7DE0E6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 13:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E9510E6CE;
	Wed,  1 Nov 2023 12:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93E210E6CE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 12:37:00 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-53dd3f169d8so10579162a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 05:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698842219; x=1699447019; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hS2BU2Xy6jRWmRKKb+9DIUtDN+SbabRL5SYoSqJL2BA=;
 b=DufmcPM2O51lVVMlTxFAqN3i7vU4fdBWAp4Ukb+yrtROuhx+8+/OGGM2W1v8q+keiE
 Aoj8aiP2Avz6nz80pRAnjKML4bazEvuRUM+6m+HG7KIsabWz6CTz3hCdmtxhOoEtEaaD
 q+CFQVT/BideOliS50aO6Fgjp6ia84oKjGh1e+Le1j0jdetQtfzJXS9hrkdHHY5LGf8m
 8LOdvtHMRyEbwsGc5G+z79mR9RNi+tMJVvbWn4uJD49zh7/l7WMWlE+pp52xBXdsiOsU
 pJTKpCIRUF9ztxR3O4zp+D7VcHV6L2WObOmh70I468J8huy+F3PLHth4zOqyJRpAj1nr
 DgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698842219; x=1699447019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hS2BU2Xy6jRWmRKKb+9DIUtDN+SbabRL5SYoSqJL2BA=;
 b=tzJdTGIxfhMndmksRYxrO8t7iwWHMCjRbiKdRpd3YVV4eU5QYHkE9d67a9kzwwUF73
 SJO0gdWGDDMLpEjxPT6YEJcHODVynIiZzkDJYyLzJrmuhS/L+nXnLTTUSoVRp5hEaxs6
 cPxMql4YG6irgHKzBjcib4i5e9qtMrCNnSFIBHcyWLv11ya4ACVlxS+u/GMUYnrN/3ty
 MeZDZw6fqpqB1pg5yJifgF/WWlK8Ey3q1a9S91AstyjjTKQzBO2zayYksR6eaCN8GwNP
 r+FSUFCvWFiPtaS721UfQsjH4qV6OXcrzGmFUInKEEwxCkqHKu1m3mXTsv7aN6oBDdl1
 E89Q==
X-Gm-Message-State: AOJu0YwdduANlzRzitcBF5msSin6PWdUVy2aGK09ptmIgm5ZK1Iz3h3O
 +Qz4CsF92zgviE7UKzO0VZp2CDZ/pkcqHFdikjs=
X-Google-Smtp-Source: AGHT+IE+lWrzQFIsry0ZA/uPdSIZVkDFkZbarYB+KPeEVVx38/1YqeYdPo3ycTxfGRczrxt0gxN3wv9M0xlx3rpBG4A=
X-Received: by 2002:a17:906:db0d:b0:9d3:ccd1:a905 with SMTP id
 xj13-20020a170906db0d00b009d3ccd1a905mr1730174ejb.51.1698842219090; Wed, 01
 Nov 2023 05:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20231030230413eucas1p1c061adf636a7e8a58270a00725e1d0a2@eucas1p1.samsung.com>
 <CA+1FSign611=47=xLRucFhDjvs7A_TeFE9b8qO63WXDU8Pnkjg@mail.gmail.com>
 <7a71e348-f892-4fd4-8857-b72f35ab5134@samsung.com>
 <f441508b-736d-4bb4-a7d5-ce2fc2c58fc7@netscape.net>
In-Reply-To: <f441508b-736d-4bb4-a7d5-ce2fc2c58fc7@netscape.net>
From: Mario Marietto <marietto2008@gmail.com>
Date: Wed, 1 Nov 2023 13:36:22 +0100
Message-ID: <CA+1FSigYRqKr3dudUAL4++ckpm_zmDebb-qU0mxx4-h_gPXD2w@mail.gmail.com>
Subject: Re: exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma]
 *ERROR* Device 14450000.mixer lacks support for IOMMU
To: Chuck Zmudzinski <brchuckz@netscape.net>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Julien Grall <julien@xen.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <snawrocki@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stefano Stabellini <sstabellini@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

I would like to recompile and install the kernel 6.6 on my ARM
Chromebook. I would like to know if your patch has been accepted and
included there. Thanks.

On Wed, Nov 1, 2023 at 8:48=E2=80=AFAM Chuck Zmudzinski <brchuckz@netscape.=
net> wrote:
>
> On 10/31/2023 8:08 AM, Marek Szyprowski wrote:
> > Hi,
> >
> > On 31.10.2023 00:03, Mario Marietto wrote:
> >> We are a team of linux enthusiasts who are trying to boot Xen on a
> >> Samsung XE303C12 Chromebook aka "snow" following the suggestions in
> >> the slide show presentation here:
> >> https://www.slideshare.net/xen_com_mgr/xpds16-porting-xen-on-arm-to-a-=
new-soc-julien-grall-arm
> >> This device uses an exynos5250 SOC dual core 1.7 GHz with 2 MB RAM, it
> >> is a Samsung armv7 chip with virtualization extensions. In particular,
> >> we have it working fairly well both on the bare metal with a recent
> >> 6.1.59 Linux LTS kernel and also with a recent 5.4.257 LTS kernel with
> >> KVM, the older LTS kernel version is used to test KVM because support
> >> for KVM on arm v7 was removed from Linux around kernel version 5.7. So
> >> we know we have the hypervisor mode enabled because we were able to
> >> use it with KVM. For Xen, we are using the latest Debian build of Xen
> >> 4.17 for the Debian armhf architecture: (XEN) Xen version 4.17.2-pre
> >> (Debian 4.17.1+2-gb773c48e36-1)
> >> (pkg-xen-devel@xxxxxxxxxxxxxxxxxxxxxxx) (arm-linux-gnueabihf-gcc
> >> (Debian 12.2.0-14) 12.2.0) debug=3Dn Thu May 18 19:26:30 UTC 2023 The
> >> Linux kernel is a custom build that adds the Xen config kernel options
> >> (CONFIG_XEN_DOM0, etc) on top of a kernel that works well on the same
> >> Chromebook model on the bare metal. I can provide the config options
> >> of the kernel that was used if that is helpful. Our method of booting
> >> is to have u-boot boot the Xen hypervisor and load the device tree
> >> after adding the dom0 to the otherwise unaltered device tree from the
> >> Linux kernel using u-boot fdt commands to add a /chosen node, as
> >> described on the Xen wiki and in the pages linked from there. We have
> >> also tried adding and loading an initrd.img using the device tree
> >> /chosen node but that made no difference in our tests. We actually
> >> have the Linux LTS kernel version 6.1.59 working as dom0 with Xen
> >> using the same version of u-boot that we used for KVM, but with a big
> >> problem. The problem we see is that when booting the 6.1.59 kernel
> >> version as dom0 with Xen, the screen is totally dark and the only way
> >> to access the system is remotely through ssh. Logs indicate most
> >> everything else is working, such as the wifi card so we can access it
> >> remotely via ssh and a USB optical mouse lights up when connected so
> >> USB is also working. Obviously, the disk is also working. The
> >> Chromebook is configured to boot from the device's SD card slot by
> >> turning on Chrome OS developer mode options to enable booting from the
> >> SD card slot. The mystery is that when booting the exact same 6.1.59
> >> kernel on the bare metal instead of booting it as dom0 on Xen, it
> >> boots up with full access to the screen and we can interact with the
> >> system using the X.org windows system. But booting as dom0 with Xen,
> >> the screen is totally dark and the only access we have to the system
> >> is through the network via ssh. Also, when booting the 5.4.257 kernel
> >> with KVM in hypervisor mode, the screen works and we can interact with
> >> the system through the X.org windows system. Exploring the log file,we
> >> have seen the errors below :
> >>
> >> Without Xen (or in bare metal):
> >>
> >> devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for
> >> DMA mapping operations
> >> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops
> >> 0xc0d96354)
> >> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14450000.mixer (ops
> >> 0xc0d97554)
> >> devuan-bunsen kernel: exynos-drm exynos-drm: bound
> >> 145b0000.dp-controller (ops 0xc0d97278)
> >> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14530000.hdmi (ops
> >> 0xc0d97bd0)
> >> ...
> >> devuan-bunsen kernel: Console: switching to colour frame buffer device
> >> 170x48
> >> devuan-bunsen kernel: exynos-drm exynos-drm: [drm] fb0: exynosdrmfb
> >> frame buffer device
> >> devuan-bunsen kernel: [drm] Initialized exynos 1.1.0 20180330 for
> >> exynos-drm on minor 0
> >>
> >> In this case,the kernel is able to use the exynos-drm kernel to start
> >> the fb0 device. But with Xen we get this error with exynos-drm:
> >>
> >> devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for
> >> DMA mapping operations
> >> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops
> >> 0xc0d96354)
> >> devuan-bunsen kernel: exynos-mixer 14450000.mixer:
> >> [drm:exynos_drm_register_dma] *ERROR* Device 14450000.mixer lacks
> >> support for IOMMU
> >> devuan-bunsen kernel: exynos-drm exynos-drm: failed to bind
> >> 14450000.mixer (ops 0xc0d97554): -22
> >> devuan-bunsen kernel: exynos-drm exynos-drm: adev bind failed: -22
> >> devuan-bunsen kernel: exynos-dp: probe of 145b0000.dp-controller
> >> failed with error -22
> >>
> >> I'm trying to find for a solution and I've googled a little bit and I
> >> found this web site :
> >> https://lore.kernel.org/linux-arm-kernel/20220208171823.226211-8-krzys=
ztof.kozlowski@canonical.com/
> >> with your email address and I tried to ask for some help for fixing
> >> the bug. Any ideas why booting the same Linux kernel that results in a
> >> working X.org display on the bare metal instead as dom0 on Xen would
> >> cause the display to remain dark, but most other basic functions would
> >> work, such as network, disk, and USB ? thanks.
> >
> >
> > Thanks for the detailed description! Good to hear that those boards are
> > still being used for various projects. I also have Snow Chromebook and
> > use it for daily tests of linux-next branch.
>
> Adding Julien Grall and Stefano Stabellini
>
> Hi Marek,
>
> Thanks for responding to Mario's question. I also have been doing these
> experiments with a Chromebook Snow, and I am the one who reported this
> problem on the xen-users ML here:
>
> https://lists.xenproject.org/archives/html/xen-users/2023-10/msg00021.htm=
l
>
> You might find that thread interesting, especially here with some additio=
nal
> log messages from the exynos_drm driver (exynos_drm_dma.c, I believe):
>
> https://lists.xenproject.org/archives/html/xen-users/2023-10/msg00032.htm=
l
>
> This issue is also discussed some on the xen-devel ML here:
>
> https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00003.htm=
l
>
> >
> > Frankly speaking I have no idea what might happen wrong. There have bee=
n
> > some changes recently in the Exynos IOMMU driver related to
> > initialization, maybe your changes related to Xen enabling changed
> > somehow the order of device initialization during boot. I assume that
> > the device-tree you use for the bare metal run and Xen enabled run
> > doesn't differ in the areas describing the hardware blocks.
> >
> > Please check if cherry-picking the commit
> > https://github.com/torvalds/linux/commit/bbc4d205d93f52ee18dfa7858d5148=
9c0506547f
> > to your v6.1.59 based kernel helps anyhow.
>
> I tried adding that fix of the exynos IOMMU initialization from
> Linux > 6.2 on top of the 6.1.59 kernel I used for the original report,
> but that made no difference on Xen - it still failed with the mixer lacks
> support for IOMMU message and the screen is totally dark.
>
> >
> > If not, then as a temporary workaround please disable
> > CONFIG_DRM_EXYNOS_MIXER and CONFIG_DRM_EXYNOS_HDMI in your kernel confi=
g
> > and check what will happen (You will lose the HDMI output, but maybe
> > this won't a big issue).
>
> This change causes the GPU to work fairly well AFAICS. Removing the mixer
> and HDMI allowed the GPU to initialize, and the display manager started
> normally and enabled logging into an ordinary X11 session. Based on the l=
og
> messages I was seeing, this was an obvious thing to try. Thanks for
> suggesting it.
>
> But I have a question:
>
> How are the mixer and HDMI devices related to the main drm device? The pr=
oblem
> in the exynos_drm_dma driver was that on Xen, the main drm device wanted =
to
> use IOMMU version of dma_ops, but the mixer (and probably also the HDMI i=
f
> it wouldn't have exited first) wanted to use the Xen swiotlb version of d=
ma_ops,
> but on bare metal all three devices want to use the IOMMU version of dma_=
ops.
>
> The problem obviously has something to do with the fact that Xen does not
> expose the same IOMMU capability to Linux as is available when running on
> the bare metal.
>
> Cheers,
>
> >
> >
> > Best regards
>


--=20
Mario.
