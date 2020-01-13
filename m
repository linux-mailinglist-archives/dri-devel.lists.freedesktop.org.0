Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AB61394D8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 16:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C9289330;
	Mon, 13 Jan 2020 15:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A494489131
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 15:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578929563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ugGRc3ZSBpA03LgnAY27K4MxINi4CuEFoptsSyvb9I=;
 b=IQI0GF8gLlN2KalGmdI54eAVK/wV9BfsrkO0cTQ4lI+2WMox4vZAo7f3jSkWBWw4JwkcMB
 CJMjJzG+CWRAXv693nXk4E/NmXuHeXeJFEDKZr8mYQ+yY09XBspvx7OH9J4mb2t6PxyKA8
 8Ml9TJUPSSyLveeMVaYjcpydPBWVNVc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-n5yRsVh1MCK6Boo5pY5epQ-1; Mon, 13 Jan 2020 10:32:40 -0500
Received: by mail-qt1-f197.google.com with SMTP id d9so6741773qtq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 07:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ElsdEkFyMX9PyqBKUyWZEu82iD4Q0YddLseGJka/eAI=;
 b=BmvrD1mgvr4vuu14kSyOkT/uhij857D2Ukh9P9+3di4yo8B0eiMqIcWI4ifAL+580s
 UEKP7Z9ScdH/e8omgn4oXPorpeo3WuennS8MKF5gcBenYP/38W7nOl63dfG0ug/zr2vP
 VmGIDiFqK6Ttts0E+nfDtjazBJqx2OG804SA9MtRnl8nd8q/xAaJi3Rm2TJdfkl6BIFk
 HBckuV1NIGL+KUiTnqZfZeJnEphL33hg7i6SLgiDCO4d8PoGhhrLC1geUxYZPn+l119N
 opH9pzL09bEsyItkn1vuhQxzLNOwfI7WOPKvTUoFQVGfn1c60uiASrFJGNnCQlyABSZz
 blAA==
X-Gm-Message-State: APjAAAVFPJcvGHihDg12DfGolNM4AbmvPeA5OqFEub9S6Kh3GtMl5nus
 fO+P8fPYCTzUYIIJpXARjyXFIoWc0zC6Ttl3Hd7ETS3ZGJ5CTMgwdGU9VfCr10x+nkpb1N6CRws
 0gpkRJQlMMjjjTOOBlAw13nQxr0cvbOaqXuUuqIHSvSTS
X-Received: by 2002:a37:9245:: with SMTP id u66mr12325310qkd.102.1578929560032; 
 Mon, 13 Jan 2020 07:32:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqytL56xMC0vF1glxTM38WsY2Ix40Z1naBdqh2T+YigaQEOs8RJRhNMIOMubvldRvknv5G4xQqo3cppMYY9Rex0=
X-Received: by 2002:a37:9245:: with SMTP id u66mr12325263qkd.102.1578929559700; 
 Mon, 13 Jan 2020 07:32:39 -0800 (PST)
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
 <CACO55tvhSM0aATBOK05-05aOc6LeN67=US2zO2jqXKWGTpUZFw@mail.gmail.com>
In-Reply-To: <CACO55tvhSM0aATBOK05-05aOc6LeN67=US2zO2jqXKWGTpUZFw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 13 Jan 2020 16:31:50 +0100
Message-ID: <CACO55tsCRzSOz4GcLuuvGP3hfbz8gYtYXqtYHy5XCpCi3tmPeA@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Dave Airlie <airlied@gmail.com>
X-MC-Unique: n5yRsVh1MCK6Boo5pY5epQ-1
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

okay.. so checking whatever is the difference with _REV being 5
(meaning the firmware uses the legacy paths) doesn't help in any way.
It's using a different method to turn the link of and the other ACPI
variables touched either point to undocumented registers on the PCI
bridge or internal ACPI memory...

so, anybody with any other ideas? I really wished the nvidia driver
would enable runpm on pre turing GPUs, but that's sadly not the case
and on Turing things seem to be totally different, so it wouldn't help
to check there as well... *sigh*

On Tue, Dec 10, 2019 at 9:49 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Tue, Dec 10, 2019 at 8:58 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Mon, 9 Dec 2019 at 21:39, Rafael J. Wysocki <rafael@kernel.org> wrote:
> > >
> > > On Mon, Dec 9, 2019 at 12:17 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > >
> > > > anybody any other ideas?
> > >
> > > Not yet, but I'm trying to collect some more information.
> > >
> > > > It seems that both patches don't really fix
> > > > the issue and I have no idea left on my side to try out. The only
> > > > thing left I could do to further investigate would be to reverse
> > > > engineer the Nvidia driver as they support runpm on Turing+ GPUs now,
> > > > but I've heard users having similar issues to the one Lyude told us
> > > > about... and I couldn't verify that the patches help there either in a
> > > > reliable way.
> > >
> > > It looks like the newer (8+) versions of Windows expect the GPU driver
> > > to prepare the GPU for power removal in some specific way and the
> > > latter fails if the GPU has not been prepared as expected.
> > >
> > > Because testing indicates that the Windows 7 path in the platform
> > > firmware works, it may be worth trying to do what it does to the PCIe
> > > link before invoking the _OFF method for the power resource
> > > controlling the GPU power.
> > >
> >
> > Remember the pre Win8 path required calling a DSM method to actually
> > power the card down, I think by the time we reach these methods in
> > those cases the card is already gone.
> >
> > Dave.
> >
>
> The point was that the firmware seems to do more in the legacy paths
> and maybe we just have to do those things inside the driver instead
> when using the new method. Also the _DSM call just wraps around the
> interfaces on newer firmware anyway. The OS check is usually what
> makes the difference. I might be wrong about the _DSM call just
> wrapping though, but I think I saw it at least in some firmware at
> some point.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
