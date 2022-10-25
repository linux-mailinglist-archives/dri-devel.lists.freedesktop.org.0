Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA38760D751
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 00:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26E710E13B;
	Tue, 25 Oct 2022 22:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED67510E13B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 22:43:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00A03B81F4D;
 Tue, 25 Oct 2022 22:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A9CC433D6;
 Tue, 25 Oct 2022 22:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666737816;
 bh=VzotCHER+4tJmGewDcfbWpt7XoYpGbd1YkpPo+U5NQo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=EpHcLnsL+gZtYIDpAyeoyqfxBTPc2AwdkPujIrcind2CrETjd399N1hfJHz5yw2D9
 JjL27F5gKSmyC24qG1JX5qnOJY8OIdrrvd1GjfKDq8PGH5BXxPr6tDybKzGDUJUhu/
 Ew3B2VZcE/NxmscjdbWp15Pv7Mgu+2yWr17g5R9z9AwyH9ccrmW+UlWW86PwTjWrJ1
 uxHWihZp8tJI1D6Y5VF4lwmFHVm/B64n05inTiZeaFBDNtnR8Etrbx8x4D5sDfY12N
 THe/9naax49Z1z8OVpAwvrzxOKY85gEnfFT4U1FayeyZ597/CP2AoTatEfRw4GCpae
 DVfUHgbKwmxhA==
Date: Tue, 25 Oct 2022 17:43:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 0/8] agp: Convert to generic power management
Message-ID: <20221025224334.GA694255@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9twkfjHh4SR2aQdB9WTRYEhTdWZG4A-f0n8oB8yw=dZgyw@mail.gmail.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 26, 2022 at 08:17:47AM +1000, Dave Airlie wrote:
> On Wed, 26 Oct 2022 at 06:39, Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > From: Bjorn Helgaas <bhelgaas@google.com>
> >
> > Vaibhav converted several AGP drivers from legacy PCI power management to
> > generic power management [1].  This series converts the rest of them.
> 
> Do you want to merge through the PCI tree?
> 
> Acked-by: Dave Airlie <airlied@redhat.com>

Sure, will be happy to.  Thanks!

> > v1 posted at [2].
> >
> > Changes from v1 to v2:
> >   - Convert from SIMPLE_DEV_PM_OPS() (which is deprecated) to
> >     DEFINE_SIMPLE_DEV_PM_OPS() and remove __maybe_unused annotations.
> >
> > [1] https://lore.kernel.org/all/20210112080924.1038907-1-vaibhavgupta40@gmail.com/#t
> > [2] https://lore.kernel.org/all/20220607034340.307318-1-helgaas@kernel.org/
> >
> > Bjorn Helgaas (8):
> >   agp/efficeon: Convert to generic power management
> >   agp/intel: Convert to generic power management
> >   agp/amd-k7: Convert to generic power management
> >   agp/ati: Convert to generic power management
> >   agp/nvidia: Convert to generic power management
> >   agp/amd64: Update to DEFINE_SIMPLE_DEV_PM_OPS()
> >   agp/sis: Update to DEFINE_SIMPLE_DEV_PM_OPS()
> >   agp/via: Update to DEFINE_SIMPLE_DEV_PM_OPS()
> >
> >  drivers/char/agp/amd-k7-agp.c   | 24 ++++--------------------
> >  drivers/char/agp/amd64-agp.c    |  6 ++----
> >  drivers/char/agp/ati-agp.c      | 22 ++++------------------
> >  drivers/char/agp/efficeon-agp.c | 16 ++++------------
> >  drivers/char/agp/intel-agp.c    | 11 +++++------
> >  drivers/char/agp/nvidia-agp.c   | 24 ++++--------------------
> >  drivers/char/agp/sis-agp.c      |  7 ++-----
> >  drivers/char/agp/via-agp.c      |  6 ++----
> >  8 files changed, 27 insertions(+), 89 deletions(-)
> >
> > --
> > 2.25.1
> >
