Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEEE5377AD
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 11:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CC810E48D;
	Mon, 30 May 2022 09:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B621A10E48D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 09:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653903086; x=1685439086;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RNo1VFn9TNhcSAwdGqSc/kbrNGzlnlE99QCowyLqR4c=;
 b=QdzTZAuWxkmY5K5sRLkwYkYQyUGYKwdw1FeqZL61F4y0z+n4iUE1Vdny
 Wv6S/nHg7FAstK1OthiSUzBQRDQp1/QiDxTX1OJWVhD3jUQpYQrY240yb
 mPREj2jEJYJwC0vujhKFkvPhgY1NWzi4sgcoPxO4cW1LjXbiaIGS4bSJn
 BusZOOH21ABLDJPIQcHcs4bRCh708KB9ySwXLpeujwlnCoMo5RYrmPtlB
 pu9GjLSC82cgmADg6gAkYIYe76pEi/g8w0hps53omrH+4YICgHkgj+8A7
 UOH7PypfYUvg9br8yC32tLQBdyRps7Lg14rJkGwfJkXiOp4U4Xs1Gfo11 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274668022"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="274668022"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 02:31:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="706083847"
Received: from jkuna-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.150.228])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 02:31:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann
 <arnd@arndb.de>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
In-Reply-To: <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian>
 <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
 <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
 <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
Date: Mon, 30 May 2022 12:31:17 +0300
Message-ID: <87a6aztli2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <vireshk@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 28 May 2022, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Sat, May 28, 2022 at 11:59 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> It's CONFIG_ARM_AEABI, which is normally set everywhere. Without this
>> option, you the kernel is built for the old 'OABI' that forces all non-packed
>> struct members to be at least 16-bit aligned.
>
> Looks like forced word (32 bit) alignment to me.
>
> I wonder how many other structures that messes up, but I committed the
> EDID fix for now.

Thanks for the fix, and the thorough commit message!

> This has presumably been broken for a long time, but maybe the
> affected targets don't typically use EDID and kernel modesetting, and
> only use some fixed display setup instead.
>
> Those structure definitions go back a _loong_ time (from a quick 'git
> blame' I see November 2008).
>
> But despite that, I did not mark my fix 'cc:stable' because I don't
> know if any of those machines affected by this bad arm ABI issue could
> possibly care.
>
> At least my tree hopefully now builds on them, with the BUILD_BUG_ON()
> that uncovered this.

Indeed the bug is ancient. I just threw in the BUILD_BUG_ON() on a whim
as an extra sanity check when doing pointer arithmetics on struct edid
*.

If there are affected machines, buffer overflows are the real danger due
to edid->extensions indicating the number of extensions.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
