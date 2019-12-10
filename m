Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0622511928F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 21:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FFB6E938;
	Tue, 10 Dec 2019 20:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 379 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2019 20:56:35 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F766E938
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 20:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576011394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QKUGte0LJJOC+2J/QTsxMNBL/KSTWmiIxFV3NdoEcMk=;
 b=dVSP/D+jAZj6LpCwKMoTwdGdU0PvuX4ySGd3BfAwhKcC/bWWUELiGAcy0Vn82jKVz79Jqs
 EDZ6JHzloTLd8xrxBBaW2pUv6weIjr6eRTTzuejOMeVlgQP69/tBeG5c7xkLbXDAd7pyZI
 ZmfIaUNQf6fc2vYEecfW03vbpAJzs0k=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-WeuZeIVxPWCm0sF-_ZOWug-1; Tue, 10 Dec 2019 15:50:11 -0500
Received: by mail-qv1-f71.google.com with SMTP id x22so6260456qvc.18
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 12:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L2m4Tv+vpahKKFm5uAjvOrE573uy1RkQak8WAblX7g4=;
 b=rnFKTWO6CrnTRT6Z6TVUHss+tFt3akb5cGxYrkiLMWhTzKsLoGJL2BuMsAedddM2Ke
 nafs0r56altphvxx1iGoEJZqvvkeW0m0CnTjbxS0UkIq8I4j/89U1PE2b+P0g1J1NUbh
 egE49m3HU0mkwO1XfHjWBER3D4dH2jYAtOgF2lohVZlloRdyJpYAxEI4rTrcUyKHEHXP
 nZQOlX5jHflPiDUvwpuodk4FsbjOl0riY+DaxmWeWBIG2xu330hTVIu/+oSFzktezlcu
 R7pUbv5Ikjy8bAfRZ9HbMe4tRvL3L7/phRUr55koC59zFyUw/Sms5BhwzGgmPWAYWUa9
 8a0A==
X-Gm-Message-State: APjAAAU9gjybyOZGDlHQoS6Tl1Ttyw/YELvRFgGGv8NfdEzvU03fZNC3
 q6PDjdSWunBJP1v6ikI91S096J/xIyTh0wl8zEySHoWTP2Y3UXTocWB6CCm/Sktqk1N4V24TkKk
 jRm7FfLMkT7nraUjNibYeqdkRihfCUvS7m97fMC6jkEjF
X-Received: by 2002:a0c:baad:: with SMTP id x45mr29886303qvf.230.1576011010492; 
 Tue, 10 Dec 2019 12:50:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqyIAonngUfW9uC+kmuZAs4RSR2w6CHMt+zmLNoDWoivMcdar5w1+a+QgsrZGu/DH2I2RocsrHyDBA/p4a7IrDU=
X-Received: by 2002:a0c:baad:: with SMTP id x45mr29886279qvf.230.1576011010089; 
 Tue, 10 Dec 2019 12:50:10 -0800 (PST)
MIME-Version: 1.0
References: <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
 <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
 <CAJZ5v0jbh7jz+YQcw-gC5ztmMOc4E9+KFBCy4VGRsRFxBw-gnw@mail.gmail.com>
 <e0eeddf4214f54dfac08e428dfb30cbd39f20680.camel@redhat.com>
 <20191127114856.GZ11621@lahna.fi.intel.com>
 <CACO55tt5SAf24vk0XrKguhh2J=WuKirDsdY7T+u7PsGFCpnFxg@mail.gmail.com>
 <e7aec10d789b322ca98f4b250923b0f14f2b8226.camel@redhat.com>
 <CACO55tu+hT1WGbBn_nxLR=A-X6YWmeuz-UztJKw0QAFQDDV_xg@mail.gmail.com>
 <CAJZ5v0hcONxiWD+jpBe62H1SZ-84iNxT+QCn8mcesB1C7SVWjw@mail.gmail.com>
 <CAPM=9txefUg9_EO82an3b313mZz7J7-ydTuJtWD-hOQwE4QXkQ@mail.gmail.com>
In-Reply-To: <CAPM=9txefUg9_EO82an3b313mZz7J7-ydTuJtWD-hOQwE4QXkQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 10 Dec 2019 21:49:58 +0100
Message-ID: <CACO55tvhSM0aATBOK05-05aOc6LeN67=US2zO2jqXKWGTpUZFw@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Dave Airlie <airlied@gmail.com>
X-MC-Unique: WeuZeIVxPWCm0sF-_ZOWug-1
X-Mimecast-Spam-Score: 0
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 8:58 PM Dave Airlie <airlied@gmail.com> wrote:
>
> On Mon, 9 Dec 2019 at 21:39, Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Mon, Dec 9, 2019 at 12:17 PM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > anybody any other ideas?
> >
> > Not yet, but I'm trying to collect some more information.
> >
> > > It seems that both patches don't really fix
> > > the issue and I have no idea left on my side to try out. The only
> > > thing left I could do to further investigate would be to reverse
> > > engineer the Nvidia driver as they support runpm on Turing+ GPUs now,
> > > but I've heard users having similar issues to the one Lyude told us
> > > about... and I couldn't verify that the patches help there either in a
> > > reliable way.
> >
> > It looks like the newer (8+) versions of Windows expect the GPU driver
> > to prepare the GPU for power removal in some specific way and the
> > latter fails if the GPU has not been prepared as expected.
> >
> > Because testing indicates that the Windows 7 path in the platform
> > firmware works, it may be worth trying to do what it does to the PCIe
> > link before invoking the _OFF method for the power resource
> > controlling the GPU power.
> >
>
> Remember the pre Win8 path required calling a DSM method to actually
> power the card down, I think by the time we reach these methods in
> those cases the card is already gone.
>
> Dave.
>

The point was that the firmware seems to do more in the legacy paths
and maybe we just have to do those things inside the driver instead
when using the new method. Also the _DSM call just wraps around the
interfaces on newer firmware anyway. The OS check is usually what
makes the difference. I might be wrong about the _DSM call just
wrapping though, but I think I saw it at least in some firmware at
some point.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
