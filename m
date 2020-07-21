Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2BB229184
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226726E5BD;
	Wed, 22 Jul 2020 07:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531C66E2DA;
 Tue, 21 Jul 2020 15:27:58 +0000 (UTC)
IronPort-SDR: pSyYa058NNcr73FQltGG6KHoVwnkm0ZOgFwRvaxdj/MFbg+8TsB9+N/33JZydi4s5Fj4SwmMla
 BVAN7nOPOLEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="211697222"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="211697222"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 08:27:42 -0700
IronPort-SDR: m9Yv3szcNnwqnBWnMd6YPHjbliYFF5XJkiXvnqC85+KMTFwgkgyG6ChCE/R2uNGy3aLyySdAzB
 PtjfD4EwWf9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="392383055"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 21 Jul 2020 08:27:38 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 21 Jul 2020 18:27:37 +0300
Date: Tue, 21 Jul 2020 18:27:37 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
Message-ID: <20200721152737.GS5180@lahna.fi.intel.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
 <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 22 Jul 2020 07:02:50 +0000
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

On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
> Sure thing. Also, feel free to let me know if you'd like access to one of the
> systems we saw breaking with this patch - I'm fairly sure I've got one of them
> locally at my apartment and don't mind setting up AMT/KVM/SSH

Probably no need for remote access (thanks for the offer, though). I
attached a test patch to the bug report:

  https://bugzilla.kernel.org/show_bug.cgi?id=208597

that tries to work it around (based on the ->pm_cap == 0). I wonder if
anyone would have time to try it out.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
