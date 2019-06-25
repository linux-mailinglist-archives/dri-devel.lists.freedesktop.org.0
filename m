Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C19A52940
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 12:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB326E0C6;
	Tue, 25 Jun 2019 10:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C376E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 10:17:13 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:58980)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hfiVX-0005kN-9C; Tue, 25 Jun 2019 11:16:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hfiVT-00078Y-Io; Tue, 25 Jun 2019 11:16:55 +0100
Date: Tue, 25 Jun 2019 11:16:55 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH 0/2] Associate ddc adapters with connectors
Message-ID: <20190625101655.n246vbwtupb4eoyz@shell.armlinux.org.uk>
References: <cover.1561452052.git.andrzej.p@collabora.com>
 <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
 <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LzpNVlJKLYzDBWmjft6hb5Lt+w3/1+2+74j5WYoUB5s=; b=OZ27eyAkJKiN5LjA4Mdnw/TaE
 0OSrfP1o5lxTgZZdykcVUq8nEnHcHsj/WlBBnLQKHmGkhu6q0jBVBjFFfAkUboDzBgBa0GAuux22m
 cMlmi8YLB7JVvil+PyiKYH4fiL2FVmMJ1GcPdNAZz1xP9i/ZoUtm6r7/18V2weMVRoaw0eXQgjV4/
 5xsYmluSNKbWCGk1wQpKqwKIi1NTjuJmAwMTonHsoLWk1rWe89Z8IvXSgHlynSHKbs4203ft0h7rv
 DD77iMGbUVY505jGcN1UFV0Ba9p3j6H7WLeR73xcWqtu8kG2mUrSFnq0ctSpcPpbvDAddzgFDvVHF
 uyCJ2qYLg==;
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTI6MTQ6MjdQTSArMDIwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IEhpIFJ1c3NlbGwsCj4gCj4gVyBkbml1IDI1LjA2LjIwMTkgb8KgMTI6
MDMsIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCBhZG1pbiBwaXN6ZToKPiA+IE9uIFR1ZSwgSnVu
IDI1LCAyMDE5IGF0IDExOjQ2OjM0QU0gKzAyMDAsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90
ZToKPiA+ID4gSXQgaXMgZGlmZmljdWx0IGZvciBhIHVzZXIgdG8ga25vdyB3aGljaCBvZiB0aGUg
aTJjIGFkYXB0ZXJzIGlzIGZvciB3aGljaAo+ID4gPiBkcm0gY29ubmVjdG9yLiBUaGlzIHNlcmll
cyBhZGRyZXNzZXMgdGhpcyBwcm9ibGVtLgo+ID4gPiAKPiA+ID4gVGhlIGlkZWEgaXMgdG8gaGF2
ZSBhIHN5bWJvbGljIGxpbmsgaW4gY29ubmVjdG9yJ3Mgc3lzZnMgZGlyZWN0b3J5LCBlLmcuOgo+
ID4gPiAKPiA+ID4gbHMgLWwgL3N5cy9jbGFzcy9kcm0vY2FyZDAtSERNSS1BLTEvaTJjLTIKPiA+
ID4gbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAxMDo0MiAvc3lzL2NsYXNzL2RybS9j
YXJkMC1IRE1JLUEtMS9pMmMtMiBcCj4gPiA+IAktPiAuLi8uLi8uLi8uLi9zb2MvMTM4ODAwMDAu
aTJjL2kyYy0yCj4gPiAKPiA+IERvbid0IHlvdSB3YW50IHRoZSBzeW1saW5rIG5hbWUgdG8gYmUg
ImkyYyIgb3Igc29tZXRoaW5nIGZpeGVkLCByYXRoZXIKPiA+IHRoYW4gdGhlIG5hbWUgb2YgdGhl
IGkyYyBhZGFwdGVyPyAgT3RoZXJ3aXNlLCB5b3Ugc2VlbSB0byBiZSBlbmN1bWJlcmluZwo+ID4g
dXNlcnNwYWNlIHdpdGggc2VhcmNoaW5nIHRoZSBkaXJlY3RvcnkgdG8gdHJ5IGFuZCBmaW5kIHRo
ZSBzeW1saW5rLgo+ID4gCj4gCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnQuIFNvIHlvdSBp
bWFnaW5lIHNvbWV0aGluZyBvbiB0aGUgbGluZXMgb2Y6Cj4gCj4gbHJ3eHJ3eHJ3eCAxIHJvb3Qg
cm9vdCAwIEp1biAyNCAxMDo0MiAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9kZGMgXAo+
ICAJLT4gLi4vLi4vLi4vLi4vc29jLzEzODgwMDAwLmkyYy9pMmMtMgo+IAo+ID8KCkV4YWN0bHku
Cgo+IFRoaXMgbWFrZXMgc2Vuc2UgdG8gbWUsIEkgd2lsbCBzZW5kIGEgdjIuCgpUaGFua3MuCgot
LSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxv
cGVyL3BhdGNoZXMvCkZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6
IHN5bmMgYXQgMTIuMU1icHMgZG93biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3Qu
bmV0OiAxMS45TWJwcyBkb3duIDUwMGticHMgdXAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
