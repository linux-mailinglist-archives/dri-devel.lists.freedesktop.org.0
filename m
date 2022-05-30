Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFCE5377B0
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 11:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2537A10E4AC;
	Mon, 30 May 2022 09:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A2D10E497
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 09:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653903206; x=1685439206;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TBSc0KNGpzSlLLY6lieGvmYQxKAskO2xitesyVYh6/0=;
 b=ey8caMeDwYoSoZtw4NejGYvh84IqetFz8weWxvVDsGM7VoEuRgjLqo/V
 VPFMJM0WIOdl0XjxHHBaFMm0sesCvqfvGjcpr37QATsWUSKjp9P+yhZeg
 BTKToGmrP9DUVYKo2k1WAShYS5ZKMh6sZYaiBDevSjKbswyQ+bhts9+J5
 YgeHWID6aNRJojmzJyKDgSBFTkLuqinErlGxByvyK9yV3ioAhIS2W4y4+
 7QHAqLQ/3A+YzKTfi7nDPBWXMMg55yCQZKZg6U4IALVnB4Qv9/fF1ejei
 4sn25HxKoamYwEaorVd8cZAJU/WivtiMAKtBHCUDO9JikOA/9SILTMyXU A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="254827236"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="254827236"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 02:33:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="529103807"
Received: from jkuna-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.150.228])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 02:33:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann
 <arnd@arndb.de>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
In-Reply-To: <87a6aztli2.fsf@intel.com>
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
 <87a6aztli2.fsf@intel.com>
Date: Mon, 30 May 2022 12:33:17 +0300
Message-ID: <877d63tleq.fsf@intel.com>
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

On Mon, 30 May 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> On Sat, 28 May 2022, Linus Torvalds <torvalds@linux-foundation.org> wrote:
>> On Sat, May 28, 2022 at 11:59 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>>
>>> It's CONFIG_ARM_AEABI, which is normally set everywhere. Without this
>>> option, you the kernel is built for the old 'OABI' that forces all non-packed
>>> struct members to be at least 16-bit aligned.
>>
>> Looks like forced word (32 bit) alignment to me.
>>
>> I wonder how many other structures that messes up, but I committed the
>> EDID fix for now.
>
> Thanks for the fix, and the thorough commit message!
>
>> This has presumably been broken for a long time, but maybe the
>> affected targets don't typically use EDID and kernel modesetting, and
>> only use some fixed display setup instead.
>>
>> Those structure definitions go back a _loong_ time (from a quick 'git
>> blame' I see November 2008).
>>
>> But despite that, I did not mark my fix 'cc:stable' because I don't
>> know if any of those machines affected by this bad arm ABI issue could
>> possibly care.
>>
>> At least my tree hopefully now builds on them, with the BUILD_BUG_ON()
>> that uncovered this.
>
> Indeed the bug is ancient. I just threw in the BUILD_BUG_ON() on a whim
> as an extra sanity check when doing pointer arithmetics on struct edid
> *.
>
> If there are affected machines, buffer overflows are the real danger due
> to edid->extensions indicating the number of extensions.

That is, for EDID. Makes you wonder about all the other packed structs
with enum members across the kernel.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
