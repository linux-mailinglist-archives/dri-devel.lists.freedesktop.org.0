Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F1F22A948
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080B56E358;
	Thu, 23 Jul 2020 07:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DCE6E48E;
 Wed, 22 Jul 2020 09:25:12 +0000 (UTC)
IronPort-SDR: 3ho8L9uKwdV7K/Y1+LcnbaxwcNkxMymZp5TykSBt7IggKAK/op+nsBi+0aoSoQ+mBNoitAHB7q
 JOFzGaZnKT8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="130378818"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="130378818"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 02:25:11 -0700
IronPort-SDR: EOpJ7Pi5GhJPrVgrFw+6krLmQuyu24P0i+zE7fQ4EyQQ6sxaEeWwzgKFc7MI/TqfL3+fxGXL1t
 KVkLOW1mG4Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="392625020"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 22 Jul 2020 02:25:08 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 22 Jul 2020 12:25:07 +0300
Date: Wed, 22 Jul 2020 12:25:07 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Patrick Volkerding <volkerdi@gmail.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
Message-ID: <20200722092507.GC5180@lahna.fi.intel.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
 <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
 <20200721152737.GS5180@lahna.fi.intel.com>
 <d3253a47-09ff-8bc7-3ca1-a80bdc09d1c2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3253a47-09ff-8bc7-3ca1-a80bdc09d1c2@gmail.com>
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
 Linux PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 01:37:12PM -0500, Patrick Volkerding wrote:
> On 7/21/20 10:27 AM, Mika Westerberg wrote:
> > On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
> >> Sure thing. Also, feel free to let me know if you'd like access to one of the
> >> systems we saw breaking with this patch - I'm fairly sure I've got one of them
> >> locally at my apartment and don't mind setting up AMT/KVM/SSH
> > Probably no need for remote access (thanks for the offer, though). I
> > attached a test patch to the bug report:
> >
> >   https://bugzilla.kernel.org/show_bug.cgi?id=208597
> >
> > that tries to work it around (based on the ->pm_cap == 0). I wonder if
> > anyone would have time to try it out.
> 
> 
> Hi Mika,
> 
> I can confirm that this patch applied to 5.4.52 fixes the issue with
> hybrid graphics on the Thinkpad X1 Extreme gen2.

Great, thanks for testing!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
