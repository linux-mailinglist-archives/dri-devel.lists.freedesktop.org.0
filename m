Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B0322A945
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E250B89CA4;
	Thu, 23 Jul 2020 07:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF366E46F;
 Wed, 22 Jul 2020 09:23:52 +0000 (UTC)
IronPort-SDR: 8jCHWVX2WXFIkl4wO4G6Pg01VLVSgNJf1zfzhrVRvGfqBXtoFWHy7eOldvoHQ+n+rFtMWTCYJ2
 RAFUY1dmwZpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="235161295"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="235161295"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 02:23:51 -0700
IronPort-SDR: jP3fe072rBo2wvDbMnJ3ED+rOZ+vIZrkcAANoPNtUQzH2fOUvQUPvZNJPsgGZYCtkksdKGraHC
 BqxRxmFIKIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="392624818"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 22 Jul 2020 02:23:48 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 22 Jul 2020 12:23:47 +0300
Date: Wed, 22 Jul 2020 12:23:47 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
Message-ID: <20200722092347.GB5180@lahna.fi.intel.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
 <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
 <20200721152737.GS5180@lahna.fi.intel.com>
 <dc7a592219f58f9a5df7fa7135fa3fc87d9450f0.camel@redhat.com>
 <a80a591ce61b632503c9ed52adc7c40faad8b068.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a80a591ce61b632503c9ed52adc7c40faad8b068.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Thu, 23 Jul 2020 07:03:14 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Patrick Volkerding <volkerdi@gmail.com>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 02:24:19PM -0400, Lyude Paul wrote:
> On Tue, 2020-07-21 at 12:00 -0400, Lyude Paul wrote:
> > On Tue, 2020-07-21 at 18:27 +0300, Mika Westerberg wrote:
> > > On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
> > > > Sure thing. Also, feel free to let me know if you'd like access to one
> > > > of
> > > > the
> > > > systems we saw breaking with this patch - I'm fairly sure I've got one
> > > > of
> > > > them
> > > > locally at my apartment and don't mind setting up AMT/KVM/SSH
> > > 
> > > Probably no need for remote access (thanks for the offer, though). I
> > > attached a test patch to the bug report:
> > > 
> > >   https://bugzilla.kernel.org/show_bug.cgi?id=208597
> > > 
> > > that tries to work it around (based on the ->pm_cap == 0). I wonder if
> > > anyone would have time to try it out.
> > 
> > Will give it a shot today and let you know the result
> 
> Ahh-actually, I thought the laptop I had locally could reproduce this bug but
> that doesn't appear to be the case whoops. Karol Herbst still has access to a
> machine that can test this though, so they'll likely get to trying the patch
> today or tommorrow

OK sounds good :)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
