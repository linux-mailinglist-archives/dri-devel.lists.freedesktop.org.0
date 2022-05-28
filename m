Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EA2536E69
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 22:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F44F10E1BC;
	Sat, 28 May 2022 20:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 514 seconds by postgrey-1.36 at gabe;
 Sat, 28 May 2022 20:41:22 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2584710E1BC
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 20:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sVwMCmxLWsbsfDuisFxMS45pxNxsdph6vk/Q4MCnxVs=; b=svLxRgQOL9LJ6eX13vc1DeR5AC
 7C0eYQF9MVCNok8ATdfWn8yWwjY9ZDAWnPd3UhJLNgQG/kcMhy4N7hynylYbmgz+cMNuuSEBYozlV
 Gusv3XEcuLGJHOQvlAKD0cJ87v8vDUBCneaD1tmgDaFuA7lXYtbeyD9eRNgEOdL4Z2xiN0tJW+YRf
 QW3HUhR3meFNqGRY9fbbGwgvkkVutHvzAn0D7uFK1ss3hdwf/9xvSsJEOqeny70pbjREu3VbjWxN2
 mVS8zjMtfnnKll17XAbcdpAo6crx/N8mMno0Mc6ShDm3dM/TaDVEr/pLYkUjQRG3kDx4jMwgXyfS3
 +K+q/2Kg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60864)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nv36j-0001eB-5u; Sat, 28 May 2022 21:32:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nv36Z-0008Aq-Ix; Sat, 28 May 2022 21:32:11 +0100
Date: Sat, 28 May 2022 21:32:11 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
Message-ID: <YpKGy1YTT3+wWzDI@shell.armlinux.org.uk>
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian>
 <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
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
 Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 Viresh Kumar <vireshk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, SoC Team <soc@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 28, 2022 at 11:08:48AM -0700, Linus Torvalds wrote:
> This smells like a compiler bug triggered by "there's a 16-bit member
> field in that gtf2 structure, and despite it being packed and aligned
> to 1, we somehow still align the size to 2".

It's an age old thing, it's no compiler bug, and it's completely
compliant with the C standards. Implementations are permitted by the
C standard to pad structures and unions how they see fit - and some
do if it makes sense for performance.

The mistake is that people forget this detail, and they expect
structs and unions to be laid out a certain way - because it doesn't
matter to the same extent on x86.

However, as older ARM CPUs could not do unaligned loads, ensuring
that things were naturally aligned made complete sense, even if it
meant that people who assume the world is x86 got tripped up - the
only way around that would be to make every load very expensive.

It's not "align to size of 2" in OABI, it tends to be align to a
multiple of 4, because the underlying architecture is 32-bit.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
