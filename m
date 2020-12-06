Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E17B2D0660
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 18:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE9A89D8E;
	Sun,  6 Dec 2020 17:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [96.44.175.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFD589D84;
 Sun,  6 Dec 2020 17:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id CC4AF128007B;
 Sun,  6 Dec 2020 09:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1607276442;
 bh=8ec02T50RHRQ5Id0GXk/fQcLTcNSvBQgNzgeqC9+Bjw=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=rAHcsq13Cn4UZfD5NHBqiEJmFBnNOXkPC5aD87Bus2ENurTDMRYfgDlB1X+xgbCwD
 4jXNZtN2+tyFJdQf0jOiqd6uPPQ8tMgqa05uBkXdE6m2u5kMo10VgrX61rQwL5Vf/3
 sIr4/D+7gQhe89zB1q9PEMHmYbRrM8L5VtABSbzA=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 4ygq4P4DqnvF; Sun,  6 Dec 2020 09:40:42 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D3CC3128003D;
 Sun,  6 Dec 2020 09:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1607276442;
 bh=8ec02T50RHRQ5Id0GXk/fQcLTcNSvBQgNzgeqC9+Bjw=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=rAHcsq13Cn4UZfD5NHBqiEJmFBnNOXkPC5aD87Bus2ENurTDMRYfgDlB1X+xgbCwD
 4jXNZtN2+tyFJdQf0jOiqd6uPPQ8tMgqa05uBkXdE6m2u5kMo10VgrX61rQwL5Vf/3
 sIr4/D+7gQhe89zB1q9PEMHmYbRrM8L5VtABSbzA=
Message-ID: <7fe2d70b5daca57d9cd50d3877376e420658ed71.camel@HansenPartnership.com>
Subject: Re: [PATCH v3 1/4] irq: export kstat_irqs
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jarkko Sakkinen
 <jarkko@kernel.org>,  Jerry Snitselaar <jsnitsel@redhat.com>
Date: Sun, 06 Dec 2020 09:40:40 -0800
In-Reply-To: <87360i99ck.fsf@nanos.tec.linutronix.de>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-2-jsnitsel@redhat.com>
 <20201205103954.GA17088@kernel.org>
 <87360i99ck.fsf@nanos.tec.linutronix.de>
User-Agent: Evolution 3.34.4 
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
Cc: kernel test robot <lkp@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 David Airlie <airlied@linux.ie>, Jiri Kosina <jkosina@suse.cz>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Matthew Garrett <mjg59@google.com>, linux-integrity@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>, Yunfeng Ye <yeyunfeng@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2020-12-06 at 17:40 +0100, Thomas Gleixner wrote:
> On Sat, Dec 05 2020 at 12:39, Jarkko Sakkinen wrote:
> > On Fri, Dec 04, 2020 at 06:43:37PM -0700, Jerry Snitselaar wrote:
> > > To try and detect potential interrupt storms that
> > > have been occurring with tpm_tis devices it was suggested
> > > to use kstat_irqs() to get the number of interrupts.
> > > Since tpm_tis can be built as a module it needs kstat_irqs
> > > exported.
> > 
> > I think you should also have a paragraph explicitly stating that
> > i915_pmu.c contains a duplicate of kstat_irqs() because it is not
> > exported as of today. It adds a lot more weight to this given that
> > there is already existing mainline usage (kind of).
> 
> It's abusage and just the fact that it exists is not an argument by
> itself.

What we want is a count of the interrupts to see if we're having an
interrupt storm from the TPM device (some seem to be wired to fire the
interrupt even when there's no event to warrant it).  Since
kstat_irqs_user() does the correct RCU locking, should we be using that
instead?

James


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
