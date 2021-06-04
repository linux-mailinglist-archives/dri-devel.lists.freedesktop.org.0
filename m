Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4387739B8E6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 14:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8656E14B;
	Fri,  4 Jun 2021 12:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7926B6E14B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 12:20:38 +0000 (UTC)
IronPort-SDR: D1ic3TqMzCZcd9BrB/bxAA5+zYRje5ORPJfJh2Mx/5879UDcTysaPi16lVfsfY98fbk8ikRDJY
 VeW95Io+3Gbw==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="225594306"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="225594306"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 05:20:38 -0700
IronPort-SDR: AGlM//WAh+lpVCM4aRH1hnrwQgFdAbSh2rj7vAmQz8mIKBMLga+jhQbkLCDA/VtNYfybwnYiZh
 mbR5k6SRjDfQ==
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="551147019"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 05:20:37 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lp8oU-00HDad-2B; Fri, 04 Jun 2021 15:20:34 +0300
Date: Fri, 4 Jun 2021 15:20:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 0/2] allow simple{fb,drm} drivers to be used on
 non-x86 EFI platforms
Message-ID: <YLoakvzpKwL4gVFQ@smile.fi.intel.com>
References: <20210601145912.774054-1-javierm@redhat.com>
 <YLk7HjX2OnLhMt4V@zn.tnic>
 <c48c6261-c9e5-29cd-8d43-6dbbcb2034ff@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c48c6261-c9e5-29cd-8d43-6dbbcb2034ff@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 11:41:29AM +0200, Javier Martinez Canillas wrote:
> On 6/3/21 10:27 PM, Borislav Petkov wrote:
> > On Tue, Jun 01, 2021 at 04:59:10PM +0200, Javier Martinez Canillas wrote:

...

> > Btw, for the future, please CC everyone on the whole patchset - I had to
> > go look at your 2/2 on lore to see what it does because I had only 1/2
> > in my mbox.
> 
> Yes, sorry about that. I just used what get_maintainer.pl --git-fallback
> suggested me, I'll make sure to include all people in Cc the next time.

For myself I wrote a script to try being smart [1]. At least it works for me in
99% of the cases. Otherwise I add manually --cc or other related options.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

Feel free to modify (patches also are warmly welcome!).

-- 
With Best Regards,
Andy Shevchenko


