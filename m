Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F0DCFBC6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 16:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8087789B3C;
	Tue,  8 Oct 2019 14:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0108.hostedemail.com
 [216.40.44.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E506A898CC;
 Tue,  8 Oct 2019 14:00:18 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 49ACD8368F00;
 Tue,  8 Oct 2019 14:00:17 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3350:3622:3865:3871:3873:3874:4321:5007:6737:10004:10400:10450:10455:10848:11026:11232:11473:11657:11658:11914:12043:12048:12296:12297:12438:12740:12760:12895:13069:13255:13311:13357:13439:14659:14721:19904:19999:21080:21627:30054:30091,
 0,
 RBL:47.151.152.152:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:455,
 LUA_SUMMARY:none
X-HE-Tag: year93_1f3b28f822a23
X-Filterd-Recvd-Size: 2066
Received: from XPS-9350.home (unknown [47.151.152.152])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Tue,  8 Oct 2019 14:00:14 +0000 (UTC)
Message-ID: <05e9cf0254790321433fd7d2c19129ec952bb3ac.camel@perches.com>
Subject: Re: [PATCH] drm/amdgpu/display: make various arrays static, makes
 object smaller
From: Joe Perches <joe@perches.com>
To: Harry Wentland <hwentlan@amd.com>, Colin King
 <colin.king@canonical.com>,  "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>,  "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Date: Tue, 08 Oct 2019 07:00:13 -0700
In-Reply-To: <9579bfae-1db5-d282-79ea-df1966f4c123@amd.com>
References: <20191007215857.14720-1-colin.king@canonical.com>
 <9579bfae-1db5-d282-79ea-df1966f4c123@amd.com>
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTEwLTA4IGF0IDEzOjU2ICswMDAwLCBIYXJyeSBXZW50bGFuZCB3cm90ZToK
W10KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9i
aW9zX3BhcnNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19w
YXJzZXIuYwo+IFtdCj4gPiBAQCAtMjc0NSw3ICsyNzQ1LDcgQEAgc3RhdGljIGVudW0gYnBfcmVz
dWx0IGJpb3NfZ2V0X2JvYXJkX2xheW91dF9pbmZvKAo+ID4gIAlzdHJ1Y3QgYmlvc19wYXJzZXIg
KmJwOwo+ID4gIAllbnVtIGJwX3Jlc3VsdCByZWNvcmRfcmVzdWx0Owo+ID4gIAo+ID4gLQljb25z
dCB1bnNpZ25lZCBpbnQgc2xvdF9pbmRleF90b192Ymlvc19pZFtNQVhfQk9BUkRfU0xPVFNdID0g
ewo+ID4gKwlzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHNsb3RfaW5kZXhfdG9fdmJpb3NfaWRb
TUFYX0JPQVJEX1NMT1RTXSA9IHsKPiAKPiBXb24ndCB0aGlzIGJyZWFrIHRoZSBtdWx0aS1HUFUg
Y2FzZSB3aGVyZSB5b3UnbGwgaGF2ZSBtdWx0aXBsZSBkcml2ZXIKPiBpbnN0YW5jZXMgd2l0aCBk
aWZmZXJlbnQgbGF5b3V0PwoKQXMgdGhlIGFycmF5IGlzIHJlYWQtb25seSwgaG93IGNvdWxkIHRo
YXQgaGFwcGVuPwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
