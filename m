Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BA82C0F49
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 16:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D43E6E03D;
	Mon, 23 Nov 2020 15:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB0C6E039;
 Mon, 23 Nov 2020 15:52:36 +0000 (UTC)
IronPort-SDR: jnldBEe1/4DdxIOfk+kie1UjOB6U2WOtL9A7QQV78SgVG+99T8kU1ZiprTk4G6RCpeTIQLhlin
 JBbSt7ky1pPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235929106"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="235929106"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 07:52:35 -0800
IronPort-SDR: o6LRPZSLFHblJ72nLIxI7QtuEJsSPQd11jVZTPC9b01xjBsR6V5ML2IOh4GsWUUm1pKbyVJ0KQ
 V9qBxJqg/0zw==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="546463497"
Received: from suygunge-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.40.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 07:52:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, trix@redhat.com,
 joe@perches.com, clang-built-linux@googlegroups.com
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
In-Reply-To: <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201121165058.1644182-1-trix@redhat.com>
 <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
Date: Mon, 23 Nov 2020 17:52:20 +0200
Message-ID: <87y2ism5or.fsf@intel.com>
MIME-Version: 1.0
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
 tboot-devel@lists.sourceforge.net, coreteam@netfilter.org,
 xen-devel@lists.xenproject.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 21 Nov 2020, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
>> A difficult part of automating commits is composing the subsystem
>> preamble in the commit log.  For the ongoing effort of a fixer
>> producing
>> one or two fixes a release the use of 'treewide:' does not seem
>> appropriate.
>> 
>> It would be better if the normal prefix was used.  Unfortunately
>> normal is
>> not consistent across the tree.
>> 
>> 
>> 	D: Commit subsystem prefix
>> 
>> ex/ for FPGA DFL DRIVERS
>> 
>> 	D: fpga: dfl:
>> 
>
> I've got to bet this is going to cause more issues than it solves.

Agreed.

> SCSI uses scsi: <driver>: for drivers but not every driver has a
> MAINTAINERS entry.  We use either scsi: or scsi: core: for mid layer
> things, but we're not consistent.  Block uses blk-<something>: for all
> of it's stuff but almost no <somtehing>s have a MAINTAINERS entry.  So
> the next thing you're going to cause is an explosion of suggested
> MAINTAINERs entries.

On the one hand, adoption of new MAINTAINERS entries has been really
slow. Look at B, C, or P, for instance. On the other hand, if this were
to get adopted, you'll potentially get conflicting prefixes for patches
touching multiple files. Then what?

I'm guessing a script looking at git log could come up with better
suggestions for prefixes via popularity contest than manually maintained
MAINTAINERS entries. It might not always get it right, but then human
outsiders aren't going to always get it right either.

Now you'll only need Someone(tm) to write the script. ;)

Something quick like this:

git log --since={1year} --pretty=format:%s -- <FILES> |\
	grep -v "^\(Merge\|Revert\)" |\
        sed 's/:[^:]*$//' |\
        sort | uniq -c | sort -rn | head -5

already gives me results that really aren't worse than some of the
prefixes invented by drive-by contributors.

> Has anyone actually complained about treewide:?

As Joe said, I'd feel silly applying patches to drivers with that
prefix. If it gets applied by someone else higher up, literally
treewide, then no complaints.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
