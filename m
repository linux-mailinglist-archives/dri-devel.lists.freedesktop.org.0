Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE39EA88C74
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 21:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D601210E2E6;
	Mon, 14 Apr 2025 19:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="OKFNLW+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Mon, 14 Apr 2025 19:51:54 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40B110E2E6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 19:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2//YI37gCwEJnWo7XbAl9+oojJRWv9moUx4jBN5YgjE=; b=OKFNLW+vkmj6v9qjccZiLLFMgf
 ahhqabsAexbgPEievMAp9Hu/1LCpC1eJCrvYcapZJvKAVKbq47kpKcGUPtoeVAd0f+B2O60t6M0FK
 vRCeXSSLjN27fF0SWa0Fr7QXxvTRBQ/eWQZ+r8/2cTozGUM6uf5h8zSAov6dB70FFoQQgd0pJMkDp
 VLUkjb7I+OtCnnVoceHzb4ap14cVVacy0ymoS79Q6Ja0QLZTX8lr2N20OZGPo9zACJKER8PgVHpRl
 wg9Y4HvnR8OkeUdXKL8yRGr8fCD41PwCH+zWee/P6SRhyGDDUdpCxo/p55rkGgBTKYvQX62WyxCVC
 Lnoe67Vg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56924)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u4PlE-00072D-1b;
 Mon, 14 Apr 2025 20:46:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u4PlB-00081U-0U;
 Mon, 14 Apr 2025 20:46:25 +0100
Date: Mon, 14 Apr 2025 20:46:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
Message-ID: <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
 <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 14, 2025 at 09:21:42PM +0200, Christian Schrefl wrote:
> Hi Miguel,
> 
> On 14.04.25 8:14 PM, Miguel Ojeda wrote:
> > Hi Jocelyn, Christian,
> > 
> > I started build-testing arm 32-bit within my other usual routine
> > tests, and I hit:
> > 
> >     ld.lld: error: undefined symbol: __aeabi_uldivmod
> >     >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
> >     >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
> > as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
> > 
> > which comes from both these `u64` by `u64`:
> > 
> >     let out = (self.carry / pow) as u16;
> >     self.carry = self.carry % pow;
> > 
> > Christian: I guess we can offer a set of `div64` functions using the C
> > ones, at least for the time being, and eventually wire the actual
> > operator with some support from upstream Rust. Or do you have
> > something else in mind? (i.e. I think you have been discussing
> > intrinsics lately)
> 
> I think using the C implementations is fine. Not sure how much the
> FFI is going to matter for performance, but it should be rare enough
> that is shouldn't matter (and hopefully we will get cross lang LTO 
> or something similar at some point).
> 
> We could also just implement the intrinsic(s) ourselves, but then 
> the u64 divisions would be implicit which is probably undesired.
> We could also rename the intrinsics so they are only usable from 
> specific crates. 
> 
> I think we need the opinion of the some arm people here.
> 
> CC Russell King and Linus Walleij.

The kernel has had the general position that u64 by u64 division is
silly and isn't supported. Several 32-bit architectures including
32-bit ARM don't support it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
