Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891DDDD5ED
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2019 03:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8BC6E077;
	Sat, 19 Oct 2019 01:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0254.hostedemail.com
 [216.40.44.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3596E077
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 01:19:20 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 268FB182CED28;
 Sat, 19 Oct 2019 01:19:19 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::,
 RULES_HIT:41:355:379:599:857:960:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2196:2198:2199:2200:2393:2553:2559:2562:2693:2828:2899:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:4385:5007:6119:7903:7904:8603:10004:10400:10848:11026:11232:11658:11914:12043:12297:12438:12555:12740:12760:12895:12986:13439:14096:14097:14659:21080:21433:21627:21773:21795:30012:30051:30054:30090:30091,
 0,
 RBL:47.151.135.224:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:542,
 LUA_SUMMARY:none
X-HE-Tag: books16_8b4f00402920f
X-Filterd-Recvd-Size: 3041
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Sat, 19 Oct 2019 01:19:17 +0000 (UTC)
Message-ID: <184cdd47d4064420b05c16f10588595c65f789e5.camel@perches.com>
Subject: Re: [PATCH] omapfb: reduce stack usage
From: Joe Perches <joe@perches.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Ladislav Michl
 <ladis@linux-mips.org>
Date: Fri, 18 Oct 2019 18:19:15 -0700
In-Reply-To: <20191018223012.tkpwbo3mg5mthlnz@debian>
References: <20191018163004.23498-1-sudipm.mukherjee@gmail.com>
 <20191018172728.GA11857@lenoch> <20191018223012.tkpwbo3mg5mthlnz@debian>
User-Agent: Evolution 3.32.1-2 
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTEwLTE4IGF0IDIzOjMwICswMTAwLCBTdWRpcCBNdWtoZXJqZWUgd3JvdGU6
Cj4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDc6Mjc6MjhQTSArMDIwMCwgTGFkaXNsYXYgTWlj
aGwgd3JvdGU6Cj4gPiBPbiBGcmksIE9jdCAxOCwgMjAxOSBhdCAwNTozMDowNFBNICswMTAwLCBT
dWRpcCBNdWtoZXJqZWUgd3JvdGU6Cj4gPiA+IFRoZSBidWlsZCBvZiB4dGVuc2EgYWxsbW9kY29u
ZmlnIGlzIGdpdmluZyBhIHdhcm5pbmcgb2Y6Cj4gPiA+IEluIGZ1bmN0aW9uICdkc2lfZHVtcF9k
c2lkZXZfaXJxcyc6Cj4gPiA+IHdhcm5pbmc6IHRoZSBmcmFtZSBzaXplIG9mIDExMjAgYnl0ZXMg
aXMgbGFyZ2VyIHRoYW4gMTAyNCBieXRlcwo+ID4gPiAKPiA+ID4gQWxsb2NhdGUgdGhlIG1lbW9y
eSBmb3IgJ3N0cnVjdCBkc2lfaXJxX3N0YXRzJyBkeW5hbWljYWxseSBpbnN0ZWFkCj4gPiA+IG9m
IGFzc2lnbmluZyBpdCBpbiBzdGFjay4KPiA+IAo+ID4gU28gbm93IGZ1bmN0aW9uIGNhbiBmYWls
IHNpbGVudGx5LCBleGVjdXRlcyBsb25nZXIsIGNvZGUgaXMgc2xpZ3RobHkKPiA+IGJpZ2dlci4u
LiBBbmQgYWxsIHRoYXQgdG8gc2lsZW50IHdhcm5pbmcgYWJvdXQgZXhjZWVkaW5nIGZyYW1lIHNp
emUuCj4gPiBJcyBpdCByZWFsbHkgd29ydGggImZpeGluZyI/CgpEZXBlbmRzIGlmIGl0IGNvdWxk
IGZhaWwgaW4gcHJhY3RpY2UgZHVlIHRvIGEgc3RhY2sgb3ZlcnJ1bi4KCj4gVGhlIG9ubHkgcG9p
bnQgb2YgZmFpbHVyZSBpcyBpZiBrbWFsbG9jKCkgZmFpbHMgYW5kIGlmIGttYWxsb2MoKSBmYWls
cyB0aGVuCj4gdGhlcmUgd2lsbCBiZSBlcnJvciBwcmludHMgaW4gZG1lc2cgdG8gdGVsbCB0aGUg
dXNlciB0aGF0IHRoZXJlIGlzIG5vCj4gbWVtb3J5IGxlZnQgaW4gdGhlIHN5c3RlbS4gQWJvdXQg
dGhlIHNpemUgYmlnZ2VyLCBpdCBzZWVtcwo+IHRoZSBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAy
L29tYXBmYi9kc3MvZHNpLm8gZmlsZSBpcyBzbWFsbGVyIHdpdGggdGhlCj4gcGF0Y2guCj4gVGhp
cyBpcyB3aXRob3V0IHRoZSBwYXRjaDoKPiAtcnctci0tci0tIDEgc3VkaXAgc3VkaXAgMzE2ODU2
IE9jdCAxOCAyMjoyNyBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvZHNpLm8K
PiBBbmQgdGhpcyBpcyB3aXRoIHRoZSBwYXRjaDoKPiAtcnctci0tci0tIDEgc3VkaXAgc3VkaXAg
MzE2NDM2IE9jdCAxOCAyMDowOSBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3Mv
ZHNpLm8KPiAKPiBBbmQgYWxzbywgb2JqZHVtcCBzaG93cyBtZSB0aGF0IDxkc2lfZHVtcF9kc2lk
ZXZfaXJxcz4gd2FzIHRha2luZyB1cCAweEQ3RAo+IGJ5dGVzLCBhbmQgbm93IHdpdGggdGhlIHBh
dGNoIGl0IGlzIHRha2luZyB1cCAweEJFRCBieXRlcywgdGhhdHMgYSBzYXZpbmcKPiBvZiA0MDAg
Ynl0ZXMuIElmIGl0IGhhcyA0MDAgYnl0ZXMgb2YgbGVzcyBjb2RlIHRvIGV4ZWN1dGUgd2lsbCBp
dCBub3QgYmUKPiBmYXN0ZXIgbm93PwoKWW91IHNob3VsZCB0cnkgY29tcGlsaW5nIHdpdGhvdXQg
YWxsIHRoZSBkZWJ1Z2dpbmcgc3ltYm9scyAoZGVmY29uZmlnKQoKPiBCdXQsIEkgbWF5IGJlIHRv
dGFsbHkgd3JvbmcgaW4gbXkgdGhpbmtpbmcsIGFuZCBpbiB0aGF0IGNhc2UsIHBsZWFzZSBmZWVs
Cj4gZnJlZSB0byByZWplY3QgdGhlIHBhdGNoLgoKV2l0aG91dCB5b3VyIHBhdGNoOgoKJCBvYmpk
dW1wIC14IGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy9kc2kubyB8IGdyZXAg
ZHNpX2R1bXBfZHNpZGV2X2lycXMKMDAwMDBkMjAgbCAgICAgRiAudGV4dAkwMDAwMDYxYyBkc2lf
ZHVtcF9kc2lkZXZfaXJxcwoKV2l0aCB5b3VyIHBhdGNoOgoKJCBvYmpkdW1wIC14IGRyaXZlcnMv
dmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy9kc2kubyB8IGdyZXAgZHNpX2R1bXBfZHNpZGV2
X2lycXMKMDAwMDBkMjAgbCAgICAgRiAudGV4dAkwMDAwMDYzOCBkc2lfZHVtcF9kc2lkZXZfaXJx
cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
