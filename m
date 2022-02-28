Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FF24C7D6D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 23:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFC910E938;
	Mon, 28 Feb 2022 22:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9402F10E934;
 Mon, 28 Feb 2022 22:32:48 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id 9468D100D9417;
 Mon, 28 Feb 2022 23:32:46 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 72198110CA; Mon, 28 Feb 2022 23:32:46 +0100 (CET)
Date: Mon, 28 Feb 2022 23:32:46 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
Message-ID: <20220228223246.GA11428@wunner.de>
References: <BL1PR12MB5157004F38E3FEFF046D9BE4E2019@BL1PR12MB5157.namprd12.prod.outlook.com>
 <20220228221344.GA529289@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228221344.GA529289@bhelgaas>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 04:13:44PM -0600, Bjorn Helgaas wrote:
> On Mon, Feb 28, 2022 at 03:33:13PM +0000, Limonciello, Mario wrote:
> > > On Fri, Feb 25, 2022 at 11:42:24AM -0600, Bjorn Helgaas wrote:
> > > > That would just leave the "PCI_VSEC_ID_INTEL_TBT implies external-
> > > facing"
> > > > assumption above.  Not having a Thunderbolt spec, I have no idea how
> > > > you deal with that.
> > > 
> > > You can download the spec here:
[...]
> > > Inside the archive there is also the DVSEC spec with name "USB4 DVSEC
> > > Version 1.0.pdf".
> > 
> > The spec has Host_Router_indication (bits 18-19) as meaning external facing.
> > I'll respin the patch 3 for using that.
> 
> Thanks, please include the spec citation when you do.  And probably
> the URL, because it's not at all obvious how the casual reader would
> get from "is_thunderbolt" to a recent add-on to the USB4 spec.

PCI_VSEC_ID_INTEL_TBT is not mentioned at all in the USB4 spec,
hence there's no connection between "is_thunderbolt" and the USB4 spec.

It's a proprietary VSEC used by Intel and the only way to recognize
pre-USB4 Thunderbolt devices that I know of.  Its ID is also
different from the DVSEC IDs given in the above-mentioned spec.

Thanks,

Lukas
