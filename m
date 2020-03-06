Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D77217B678
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 06:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE68F6E418;
	Fri,  6 Mar 2020 05:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17A76E418;
 Fri,  6 Mar 2020 05:40:11 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 21:40:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,520,1574150400"; d="scan'208";a="352663280"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 05 Mar 2020 21:40:07 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 06 Mar 2020 07:40:06 +0200
Date: Fri, 6 Mar 2020 07:40:06 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v6] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20200306054006.GZ2540@lahna.fi.intel.com>
References: <20200303101052.133631-1-kherbst@redhat.com>
 <20200304093324.GI2540@lahna.fi.intel.com>
 <CACO55ts7VGUJoSM_X_huZ0o68+P6SaWgFKbQzkw=-F+Kh5WfcA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55ts7VGUJoSM_X_huZ0o68+P6SaWgFKbQzkw=-F+Kh5WfcA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 05, 2020 at 05:11:57PM +0100, Karol Herbst wrote:
> On Wed, Mar 4, 2020 at 10:33 AM Mika Westerberg
> <mika.westerberg@intel.com> wrote:
> >
> > Hi,
> >
> > On Tue, Mar 03, 2020 at 11:10:52AM +0100, Karol Herbst wrote:
> > > Fixes state transitions of Nvidia Pascal GPUs from D3cold into higher device
> > > states.
> >
> > I think it is good to explain bit more here why this fix is needed.
> >
> 
> is something like this fine?
> 
> Fixes the infamous 'runpm' bug many users are facing on Laptops with Nvidia
> Pascal GPUs by skipping PCI power state changes on the GPU.

I would open up 'runpm' -> runtime PM.

> It's still unknown why this issue exists, but this is a reliable workaround
> and solves a very annoying issue for user having to choose between a
> crashing kernel or higher power consumption of their Laptops.

Also I think it would be good to include a short log snippet how this
manifests and in what kind of scenario it happens.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
