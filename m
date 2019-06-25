Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36E55131
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 16:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322B66E114;
	Tue, 25 Jun 2019 14:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925EA6E114
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:11:04 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59992)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hfm9e-00070m-UI; Tue, 25 Jun 2019 15:10:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hfm9Y-0007I8-NO; Tue, 25 Jun 2019 15:10:32 +0100
Date: Tue, 25 Jun 2019 15:10:32 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/2] Associate ddc adapters with connectors
Message-ID: <20190625141032.5jiy2oekb3olaejd@shell.armlinux.org.uk>
References: <cover.1561452052.git.andrzej.p@collabora.com>
 <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
 <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
 <20190625133639.GA16031@arch-x1c3>
 <20190625140755.GT12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625140755.GT12905@phenom.ffwll.local>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Xb6HOTG+zlag07avcaujeaLqr4XUzU2qm2bd4UiBIg=; b=ly5b2GEF7t8Xid2fwh5tWxjGk
 1OQja7i/iAxqb5Jch4kWE8/ZkrF+DAJTn+Ggt4YEXMH/7CCxwQpHda7CxEd66NnhWlxzjb0GlOBjH
 DUiFvXDZ42Afh1aFUZ08a7mE4pj1q+LubbfcRpx5Y8yhGAyBUu7jcfm3BkOhWaFHBnjUjgHmlNSQ2
 hfwpr9Hkqswc4UswMJfggxQcwLgzkaXYDAdb+enl1jqT/YDeZB1n4e/G0D6k/XIYDhzrXAvmUXWwQ
 +PjW+sQcMipB2X7tQhitGUFkpttqA9qORJ+qbDyLT4isccDyzr9k9nn/t2M4NMRHba4BPmkrckj//
 bGzf7VnUg==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 m.szyprowski@samsung.com, kernel@collabora.com, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDQ6MDc6NTVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPdGhlcndpc2UgSSBsaWtlIHRoaXMuIEJpZ2dlc3QgcHJvYmxlbSBJJ20gc2VlaW5n
IGhlcmUgaXMgcm9sbGluZyB0aGlzIG91dAo+IGV2ZXJ5d2hlcmUsIHRoaXMgaXMgYSBsb3Qgb2Yg
d29yay4gQW5kIHdpdGhvdXQgd2lkZXNwcmVhZCBhZG9wdGlvbnMgaXQncwo+IG5vdCB0ZXJyaWJs
eSB1c2VmdWwgZm9yIHVzZXJzcGFjZS4KClRoZXJlIHdpbGwgYmUgY2FzZXMgd2hlcmUgaXQncyBu
b3QgcG9zc2libGUsIGJlY2F1c2UgdGhlIEkyQyBidXMgaXMKaGlkZGVuIGJlaGluZCBhIGNoaXAg
dGhhdCBkb2Vzbid0IGdpdmUgeW91IGRpcmVjdCBhY2Nlc3MgdG8gdGhlIEREQwpidXMuCgotLSAK
Uk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVy
L3BhdGNoZXMvCkZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5
bmMgYXQgMTIuMU1icHMgZG93biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0
OiAxMS45TWJwcyBkb3duIDUwMGticHMgdXAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
