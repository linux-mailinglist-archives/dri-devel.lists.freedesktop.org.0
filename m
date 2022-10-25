Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3D60D755
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 00:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A972710E155;
	Tue, 25 Oct 2022 22:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5930310E155
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 22:44:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D93CA61BA3;
 Tue, 25 Oct 2022 22:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F21C433C1;
 Tue, 25 Oct 2022 22:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666737889;
 bh=fCUG0YsjLHoNvkMm52vxSui0PhkbCAXk7xTAaJFc6fE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=C2q0PH1T757hyxwmb+kLorokK0biJQUuTZxCL0tnec0d5ITIAAVMI9cm4v1HgRNic
 yQOT4uUHyiSHhsflQ3YPy/RZDVa6AG4Yv2zhDzlr15Rz7RFrpBu3TfSVN/DmDr2z3G
 nTuVk0clVNFsoZR+0EBa0APMVOBx6CJVnBtgfHt1dTRNRbZ88VTqJ6Erq75rEqhdB3
 Eg2iYkNtxDcBtIXl9fbOXq0aoqc1tPHyKw4oLFfuJLYh2kagebz2rWQK0/CsJh98Wx
 WWDFIKEleWLIBV+6+qXd/HwTY8UodMccacittMOv0gLsoUUYeEEFnWthlKUYtxzo/t
 WO4UwQXSKOWKw==
Date: Tue, 25 Oct 2022 17:44:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@redhat.com>
Subject: Re: [PATCH v2 0/8] agp: Convert to generic power management
Message-ID: <20221025224447.GA694653@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025203852.681822-1-helgaas@kernel.org>
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
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 03:38:44PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Vaibhav converted several AGP drivers from legacy PCI power management to
> generic power management [1].  This series converts the rest of them.
> 
> v1 posted at [2].
> 
> Changes from v1 to v2:
>   - Convert from SIMPLE_DEV_PM_OPS() (which is deprecated) to
>     DEFINE_SIMPLE_DEV_PM_OPS() and remove __maybe_unused annotations.
> 
> [1] https://lore.kernel.org/all/20210112080924.1038907-1-vaibhavgupta40@gmail.com/#t
> [2] https://lore.kernel.org/all/20220607034340.307318-1-helgaas@kernel.org/
> 
> Bjorn Helgaas (8):
>   agp/efficeon: Convert to generic power management
>   agp/intel: Convert to generic power management
>   agp/amd-k7: Convert to generic power management
>   agp/ati: Convert to generic power management
>   agp/nvidia: Convert to generic power management
>   agp/amd64: Update to DEFINE_SIMPLE_DEV_PM_OPS()
>   agp/sis: Update to DEFINE_SIMPLE_DEV_PM_OPS()
>   agp/via: Update to DEFINE_SIMPLE_DEV_PM_OPS()
> 
>  drivers/char/agp/amd-k7-agp.c   | 24 ++++--------------------
>  drivers/char/agp/amd64-agp.c    |  6 ++----
>  drivers/char/agp/ati-agp.c      | 22 ++++------------------
>  drivers/char/agp/efficeon-agp.c | 16 ++++------------
>  drivers/char/agp/intel-agp.c    | 11 +++++------
>  drivers/char/agp/nvidia-agp.c   | 24 ++++--------------------
>  drivers/char/agp/sis-agp.c      |  7 ++-----
>  drivers/char/agp/via-agp.c      |  6 ++----
>  8 files changed, 27 insertions(+), 89 deletions(-)

Applied with Dave's ack to pci/pm-agp for v6.2.
