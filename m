Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F2911913F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 20:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61326E91B;
	Tue, 10 Dec 2019 19:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4346E91B;
 Tue, 10 Dec 2019 19:58:39 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v201so14705650lfa.11;
 Tue, 10 Dec 2019 11:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cvLA6SLf2bKE07yg0HKaHP2/grDfEpmexDJw0d9Uy8g=;
 b=gTFrwZsVodvFApTjCQmw3UiTwNJ+4OItpxaDmYfpRqtVGCIb4WveT1bk/NpTgTqhac
 4SDFeIxJGigGukw4OGlS+H4wren3Gw63Z17mzs7TBwuL9gsmvsxcRsIZyvS52fLCAPd5
 5IKavCuFDp806MC+KUdTcxif4p6xKxqgk+8Kpsy0tZio7VaENp7w1xHR+8oZpx550IKq
 4vAr5Loh8y1RuFUzv1ESwItchuI1DbAm00vd9+2KXWIHrAd6uSDNKM6IWLwRVPnOpsqB
 3om4eNnUmaoGUfe8/CGlIDsWyptKHl8xHk2+6ldvCa36hR3HWlx+zL6j5JIIs1iUueuh
 bD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cvLA6SLf2bKE07yg0HKaHP2/grDfEpmexDJw0d9Uy8g=;
 b=uXid7zc+s6rdfnZun1SmWfC/bQCaFjf0MBkxRrYx2x2IxiWEybeV+cMwQD6R4t4MKE
 fNidHH2z12qGFf9YuFZqM84iYZywyoMV3j7Jl0d5NfyQiExrC0Di6iej5Cev3M1hsQHL
 +75kB9RaBgnI7rfaleLw8Z4aiWuC/TMipR7mdmBmwvc1gqX4T3ILXg/FMCOYpimigwjw
 ++MB5lmMPfKcq1ID6znSGPsFA5Kvp2ixzexSK5gwK2BX0KZ2SHGOXzG96sYG7McSgWXJ
 fe2fS8Tzm2yk7hVDdW3WGN6YWhYPAwzeVTZJHP3pnAyA11KZp0FxKpCz5mMs8UfYqhw6
 3AJQ==
X-Gm-Message-State: APjAAAWeoBoC46Pf5embgdCbnUwMI7WW+witn2kzlFjXv90WCzWNKIeA
 6oeWxhH9oD+Ulwudxq6b3B31ak2HCR2sARWcaTk=
X-Google-Smtp-Source: APXvYqzYgV7pLzv9dyjVa9JvPpCT5tZXDSo5dUz5fNuTjRw5r8yUo3wM6afiUBHEPOCG5oAOE7kVEqUbErxmp2QLR6g=
X-Received: by 2002:a19:784:: with SMTP id 126mr13582955lfh.191.1576007918112; 
 Tue, 10 Dec 2019 11:58:38 -0800 (PST)
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
In-Reply-To: <CAJZ5v0hcONxiWD+jpBe62H1SZ-84iNxT+QCn8mcesB1C7SVWjw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 11 Dec 2019 05:58:26 +1000
Message-ID: <CAPM=9txefUg9_EO82an3b313mZz7J7-ydTuJtWD-hOQwE4QXkQ@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: "Rafael J. Wysocki" <rafael@kernel.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, Linux PM <linux-pm@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Dec 2019 at 21:39, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Dec 9, 2019 at 12:17 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > anybody any other ideas?
>
> Not yet, but I'm trying to collect some more information.
>
> > It seems that both patches don't really fix
> > the issue and I have no idea left on my side to try out. The only
> > thing left I could do to further investigate would be to reverse
> > engineer the Nvidia driver as they support runpm on Turing+ GPUs now,
> > but I've heard users having similar issues to the one Lyude told us
> > about... and I couldn't verify that the patches help there either in a
> > reliable way.
>
> It looks like the newer (8+) versions of Windows expect the GPU driver
> to prepare the GPU for power removal in some specific way and the
> latter fails if the GPU has not been prepared as expected.
>
> Because testing indicates that the Windows 7 path in the platform
> firmware works, it may be worth trying to do what it does to the PCIe
> link before invoking the _OFF method for the power resource
> controlling the GPU power.
>

Remember the pre Win8 path required calling a DSM method to actually
power the card down, I think by the time we reach these methods in
those cases the card is already gone.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
