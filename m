Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4223B537B16
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E08910E608;
	Mon, 30 May 2022 13:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51AD10E3A2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653916217; x=1685452217;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yR4CvAYEHnhJy9L0L3rshOUShjBlml110o6x0DwIo1A=;
 b=bNJnMaN128o2MDfFBoSJHSHSkB7Bkc0rDOCb0YBD4XB4pM2+PomCkTFV
 RVW3RR0qhQzoWU4GxO8ih2qlYGWtX/ZWjouTSHNF5rhnpx0n6jPJ80LQ3
 kjE+IiVGrjcRGVUSs7iVBUrBpEM2KBhFYycStnunNt1bW23OyhfPiPX3h
 55Zye64RkL1KIs6miznd/+t4ktu9twZq1BzbS+Lg+PXa05Q0I9NV68DQx
 AUMg8HhlMEfRTkCXh20CKUS336bE8kR473MFxoPkWJ7qHR/zn+S4mh6dF
 xAbhJMpFdd63dWz2mvZ+L60Xv5gL9rl3IdnSQRPRmUhAngzdVjKJu0oKe A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="361374142"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="361374142"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 06:10:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; d="scan'208";a="605183061"
Received: from jkuna-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.150.228])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 06:10:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
In-Reply-To: <CAK8P3a0-S77QLR1dK3NT6ot7JTAD5AdojAZJr-Xi112-v5EOdw@mail.gmail.com>
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
 <87a6aztli2.fsf@intel.com> <877d63tleq.fsf@intel.com>
 <CAK8P3a0-S77QLR1dK3NT6ot7JTAD5AdojAZJr-Xi112-v5EOdw@mail.gmail.com>
Date: Mon, 30 May 2022 16:10:08 +0300
Message-ID: <87czfvrwsv.fsf@intel.com>
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
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <vireshk@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 May 2022, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, May 30, 2022 at 11:33 AM Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> That is, for EDID. Makes you wonder about all the other packed structs
>> with enum members across the kernel.
>
> It is not the 'enum' that is special here, it's the 'union' having
> unpacked members,

Obviously meant union not enum, that was just a -ENOCOFFEE on my part.

> and the same thing happens when you have nested structs: both the inner
> and the outer aggregate need to be packed, either with __packed at the
> end, or on each individual member that is not fully aligned to
> max(sizeof(member), 4)).
>
> I think in general, most __packed annotations we have in the kernel are
> completely pointless because they do not change the structure layout on
> any architecture but instead just make member access slower on

Please explain.

They are used quite a bit for parsing blob data, or
serialization/deserialization, like in the EDID case at hand. Try
removing __attribute__((packed)) from include/drm/drm_edid.h and see the
sizeof(struct edid) on any architecture.

BR,
Jani.

> architectures that lack unaligned load/store instructions. There have
> definitely been other cases though where a __packed annotation is
> not needed on any sane architecture but is needed for OABI ARM.
>
> Overall I'm not that worried because the only machines running OABI
> kernels would be on really old hardware that runs a limited set of
> driver code.
>
> A completely different matter are the extraneous __packed annotations
> that lead to possible problems when accessed through a misaligned
> pointer. We ignore -Waddress-of-packed-member and -Wcast-align
> in the kernel, so these never get caught at build time, but we have
> seen bugs from gcc making incorrect assumptions about alignment
> even on architectures that have unaligned load/store instructions.
>
>       Arnd

-- 
Jani Nikula, Intel Open Source Graphics Center
