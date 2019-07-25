Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8669675158
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 16:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E896E6E2;
	Thu, 25 Jul 2019 14:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0194.hostedemail.com
 [216.40.44.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFAB6E70D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:37:19 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 68FA18047AB9;
 Thu, 25 Jul 2019 14:37:18 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::::::,
 RULES_HIT:41:355:379:599:800:960:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2110:2198:2199:2393:2553:2559:2562:2828:2911:3138:3139:3140:3141:3142:3354:3622:3865:3867:3868:3871:3872:4250:4321:4425:4605:5007:6119:7903:8784:9121:10004:10400:10848:11026:11232:11233:11473:11657:11658:11914:12043:12296:12297:12438:12555:12663:12740:12760:12895:12986:13069:13161:13229:13311:13357:13439:14096:14097:14181:14659:14721:21080:21451:21611:21627:30054:30060:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:25,
 LUA_SUMMARY:none
X-HE-Tag: mist49_3f8efb7ea8d42
X-Filterd-Recvd-Size: 3266
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Thu, 25 Jul 2019 14:37:16 +0000 (UTC)
Message-ID: <cc582041ad4a33780a7101b3df9d03bf36a2a280.camel@perches.com>
Subject: Re: [PATCH 03/12] drm: aspeed_gfx: Fix misuse of GENMASK macro
From: Joe Perches <joe@perches.com>
To: Joel Stanley <joel@jms.id.au>
Date: Thu, 25 Jul 2019 07:37:14 -0700
In-Reply-To: <CACPK8Xd3+iwkuw-Ofwf+Hy1Ez5-1pBvnk_G4xT72ZQdOVd7Sag@mail.gmail.com>
References: <cover.1562734889.git.joe@perches.com>
 <cddd7ad7e9f81dec1e86c106f04229d21fc21920.1562734889.git.joe@perches.com>
 <2a0c5ef5c7e20b190156908991e4c964a501d80a.camel@perches.com>
 <4f6709f8-381f-415c-8569-798b074b66c5@www.fastmail.com>
 <4e5bc8d61436024a30a8fb6a1516e29e23a75ede.camel@perches.com>
 <CACPK8Xd3+iwkuw-Ofwf+Hy1Ez5-1pBvnk_G4xT72ZQdOVd7Sag@mail.gmail.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA3LTI1IGF0IDAyOjUyICswMDAwLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4g
T24gVGh1LCAyNSBKdWwgMjAxOSBhdCAwMToxOCwgSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNv
bT4gd3JvdGU6Cj4gPiBPbiBUaHUsIDIwMTktMDctMjUgYXQgMTA6NDAgKzA5MzAsIEFuZHJldyBK
ZWZmZXJ5IHdyb3RlOgo+ID4gPiBPbiBUaHUsIDI1IEp1bCAyMDE5LCBhdCAwMjo0NiwgSm9lIFBl
cmNoZXMgd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCAyMDE5LTA3LTA5IGF0IDIyOjA0IC0wNzAwLCBK
b2UgUGVyY2hlcyB3cm90ZToKPiA+ID4gPiA+IEFyZ3VtZW50cyBhcmUgc3VwcG9zZWQgdG8gYmUg
b3JkZXJlZCBoaWdoIHRoZW4gbG93Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAg
ZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4LmggfCAyICstCj4gPiA+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4gPiAKPiA+
ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnguaCBi
L2RyaXZlcnMvZ3B1L2RybS9hc3BlZWQvYXNwZWVkX2dmeC5oCj4gPiA+ID4gPiBpbmRleCBhMTAz
NThiYjYxZWMuLjA5NWVhMDNlNTgzMyAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hc3BlZWQvYXNwZWVkX2dmeC5oCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXNwZWVkL2FzcGVlZF9nZnguaAo+ID4gPiA+ID4gQEAgLTc0LDcgKzc0LDcgQEAgaW50IGFzcGVl
ZF9nZnhfY3JlYXRlX291dHB1dChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKTsKPiA+ID4gPiA+ICAv
KiBDVFJMMiAqLwo+ID4gPiA+ID4gICNkZWZpbmUgQ1JUX0NUUkxfREFDX0VOICAgICAgICAgICAg
ICAgICAgQklUKDApCj4gPiA+ID4gPiAgI2RlZmluZSBDUlRfQ1RSTF9WQkxBTktfTElORSh4KSAg
ICAgICAgICAoKCh4KSA8PCAyMCkgJiBDUlRfQ1RSTF9WQkxBTktfTElORV9NQVNLKQo+ID4gPiA+
ID4gLSNkZWZpbmUgQ1JUX0NUUkxfVkJMQU5LX0xJTkVfTUFTSyAgICAgICAgR0VOTUFTSygyMCwg
MzEpCj4gPiA+ID4gPiArI2RlZmluZSBDUlRfQ1RSTF9WQkxBTktfTElORV9NQVNLICAgICAgICBH
RU5NQVNLKDMxLCAyMCkKPiA+ID4gCj4gPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSmVmZmVyeSA8
YW5kcmV3QGFqLmlkLmF1Pgo+ID4gCj4gPiBUaGlzIGhhcmRseSBuZWVkcyBhIHJldmlldywgaXQg
bmVlZHMgdG8gYmUgYXBwbGllZC4KPiA+IFRoZXJlJ3MgYSBub21pbmFsIGdpdCB0cmVlIGZvciBh
c3BlZWQgaGVyZToKPiA+IAo+ID4gVDogICAgICBnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2pvZWwvYXNwZWVkLmdpdAo+ID4gCj4gPiBCdXQgd2hvJ3Mg
Z29pbmcgdG8gZG8gYXBwbHkgdGhpcz8KPiAKPiBUaGlzIGlzIGEgRFJNIHBhdGNoLCBzbyBpdCBn
b2VzIHRocm91Z2ggdGhlIERSTSB0cmVlLiBJIGFtIGEKPiBjby1tYWludGFpbmVyIHRoZXJlIGFu
ZCBjYW4gYXBwbHkgaXQgb25jZSBJIHJlbWVtYmVyIGhvdyB0byBkcml2ZSB0aGUKPiB0b29scy4K
PiAKPiAoRllJLCB0aGlzIG1hY3JvIGlzIG5vdCB1c2VkIGJ5IHRoZSBjdXJyZW50IGRyaXZlciku
CgpUaGVuIHBlcmhhcHMgQ1JUX0NUUkxfVkJMQU5LIGFuZCBfTUFTSyBkZWZpbmVzCnNob3VsZCBi
ZSByZW1vdmVkIGluc3RlYWQuCgpjaGVlcnMsIEpvZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
