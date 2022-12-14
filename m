Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF0064CD86
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 16:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA4A10E415;
	Wed, 14 Dec 2022 15:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341C710E415
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 15:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671033435; x=1702569435;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5LFXBukgQPsSVobJ4TQvaAaS4znUymOqfbKoEQKnuF8=;
 b=Ej4dvI/8JErpDUZ1eP+O1F2jvqrln351aIeobqVTED7uptv7VG1sezb7
 HD23QBKbBTK6aODy+Yw1elscT6OXlwdVU+mhmkSMO3wYNuZQzVKOsb1jW
 sE/A+R8bTen4mOLlVEBxqhI4uicXnoY1C6Slknc8SHBk/yKiMlUoKtPrx
 OT2B7+ORwTKbkr11ImfS9GSSdhGYBF9dt2HmHdHLDzwfvsAJ0AoCij+rV
 1woq1h68v+7bYy9QwW9RrauFvSWPw2Uvxa1RzRcmHl5Zcsn0b3UO72J+4
 gl/zMM3qlt3ihvvzS+IwuI8281nwl8RY1AWXTKHha8loMGhj4PpXHrZDu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="380640652"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="380640652"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 07:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="737738842"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="737738842"
Received: from smile.fi.intel.com ([10.237.72.54])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2022 07:57:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1p5U86-009t4i-01; Wed, 14 Dec 2022 17:57:10 +0200
Date: Wed, 14 Dec 2022 17:57:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH 1/5] Renaming weak prng invocations -
 prandom_bytes_state, prandom_u32_state
Message-ID: <Y5nyVXv1KpX5baQE@smile.fi.intel.com>
References: <cover.1670778651.git.david.keisarschm@mail.huji.ac.il>
 <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
 <Y5c8KLzJFz/XZMiM@zx2c4.com>
 <20221214123358.GA1062210@linux.intel.com>
 <CANn89iJtK4m1cWvCwp=L_rEOEBa+B1kLZJAw0D9_cYPQcAj+Mw@mail.gmail.com>
 <Y5nxjzV0Mio86NU6@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5nxjzV0Mio86NU6@smile.fi.intel.com>
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
Cc: david.keisarschm@mail.huji.ac.il, linux-scsi@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 05:53:52PM +0200, Andy Shevchenko wrote:
> On Wed, Dec 14, 2022 at 04:15:49PM +0100, Eric Dumazet wrote:
> > On Wed, Dec 14, 2022 at 1:34 PM Stanislaw Gruszka
> > <stanislaw.gruszka@linux.intel.com> wrote:
> > > On Mon, Dec 12, 2022 at 03:35:20PM +0100, Jason A. Donenfeld wrote:
> > > > Please CC me on future revisions.
> > > >
> > > > As of 6.2, the prandom namespace is *only* for predictable randomness.
> > > > There's no need to rename anything. So nack on this patch 1/5.
> > >
> > > It is not obvious (for casual developers like me) that p in prandom
> > > stands for predictable. Some renaming would be useful IMHO.
> > 
> > Renaming makes backports more complicated, because stable teams will
> > have to 'undo' name changes.
> > Stable teams are already overwhelmed by the amount of backports, and
> > silly merge conflicts.
> > 
> > Take another example :
> > 
> > u64 timecounter_read(struct timecounter *tc)
> > 
> > You would think this function would read the timecounter, right ?
> > 
> > Well, it _updates_ many fields from @tc, so a 'better name' would also
> > be useful.
> 
> Right, at some point we become into the world of
> 
> #define true 0
> 
> because... (read below)
> 
> > linux kernel is not for casual readers.
> 
> P.S. I believe you applied a common sense and in some cases
>      the renames are necessary.

And before you become to a wrong conclusion by reading between the lines,
no, I'm not taking either side (to rename or not to rename) in this case.

-- 
With Best Regards,
Andy Shevchenko


