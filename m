Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07350528F0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 12:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0C66E0BB;
	Tue, 25 Jun 2019 10:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24F16E0BB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 10:04:20 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:58978)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hfiIw-0005g7-K5; Tue, 25 Jun 2019 11:03:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hfiIq-00077V-3W; Tue, 25 Jun 2019 11:03:52 +0100
Date: Tue, 25 Jun 2019 11:03:52 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH 0/2] Associate ddc adapters with connectors
Message-ID: <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
References: <cover.1561452052.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1561452052.git.andrzej.p@collabora.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4yfZs4/ThCrYgiLeGh1TAYd7N0nWcLtcO65UGF7jKL8=; b=oq9m6q3Kox2FooWO0Am5oLHJe
 PMDVQvjbOGmV6+EYXqlzy8VtHHsxUohQbJxIq+DHgSBclpN7gExON5bgBKujZ0sI7rvjDkU3UY887
 OZDcLMu3WE6t4afKI08sesNCKe0LUFC6/t47IwTf/2iuKdIKA9jsDU3wcomZnjvha2ol8p+haHlU7
 /dT8CmadCWsevk94t4cKTN5Zr1GANzIWDzJ97URuA3SdVn8l4nBr+SNmDzMByaxdVJ4dFbxrwOyek
 WojKMosB8ZZmGVBTZPB9jxzmH0f4OtSpeFO44AohUYXHvUsxQC5adtmJbSPGXnZ2eKLbzdwb0Vflr
 Oo6B1aEiA==;
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
 Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@linux.ie>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTE6NDY6MzRBTSArMDIwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IEl0IGlzIGRpZmZpY3VsdCBmb3IgYSB1c2VyIHRvIGtub3cgd2hpY2gg
b2YgdGhlIGkyYyBhZGFwdGVycyBpcyBmb3Igd2hpY2gKPiBkcm0gY29ubmVjdG9yLiBUaGlzIHNl
cmllcyBhZGRyZXNzZXMgdGhpcyBwcm9ibGVtLgo+IAo+IFRoZSBpZGVhIGlzIHRvIGhhdmUgYSBz
eW1ib2xpYyBsaW5rIGluIGNvbm5lY3RvcidzIHN5c2ZzIGRpcmVjdG9yeSwgZS5nLjoKPiAKPiBs
cyAtbCAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9pMmMtMgo+IGxyd3hyd3hyd3ggMSBy
b290IHJvb3QgMCBKdW4gMjQgMTA6NDIgL3N5cy9jbGFzcy9kcm0vY2FyZDAtSERNSS1BLTEvaTJj
LTIgXAo+IAktPiAuLi8uLi8uLi8uLi9zb2MvMTM4ODAwMDAuaTJjL2kyYy0yCgpEb24ndCB5b3Ug
d2FudCB0aGUgc3ltbGluayBuYW1lIHRvIGJlICJpMmMiIG9yIHNvbWV0aGluZyBmaXhlZCwgcmF0
aGVyCnRoYW4gdGhlIG5hbWUgb2YgdGhlIGkyYyBhZGFwdGVyPyAgT3RoZXJ3aXNlLCB5b3Ugc2Vl
bSB0byBiZSBlbmN1bWJlcmluZwp1c2Vyc3BhY2Ugd2l0aCBzZWFyY2hpbmcgdGhlIGRpcmVjdG9y
eSB0byB0cnkgYW5kIGZpbmQgdGhlIHN5bWxpbmsuCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBo
dHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVEMgYnJvYWRi
YW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5bmMgYXQgMTIuMU1icHMgZG93biA2
MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45TWJwcyBkb3duIDUwMGti
cHMgdXAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
