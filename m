Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB58F292E75
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 21:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8617A6EA50;
	Mon, 19 Oct 2020 19:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 309 seconds by postgrey-1.36 at gabe;
 Mon, 19 Oct 2020 03:49:17 UTC
Received: from smtphy.263.net (syd-smtp02.263.net [13.237.61.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBC26E5BD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 03:49:17 +0000 (UTC)
Received: from smtp.263.net (unknown [211.157.147.163])
 by smtphy.263.net (Postfix) with ESMTPS id 7693812017C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 11:44:04 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.185])
 by smtp.263.net (Postfix) with ESMTP id 2D65D245
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 11:44:02 +0800 (CST)
Received: from localhost (unknown [192.168.167.13])
 by regular1.263xmail.com (Postfix) with ESMTP id E2E2B2BA;
 Mon, 19 Oct 2020 11:43:56 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.120] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P1665T140084967511808S1603079033410318_; 
 Mon, 19 Oct 2020 11:43:54 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f99b6cdefa6c3a4763585ece9ed9a3cc>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-kernel@vger.kernel.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v2] drm/of: Consider the state in which the ep is disabled
To: Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, huangtao@rock-chips.com,
 andy.yan@rock-chips.com, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200707112526.18438-1-hjc@rock-chips.com>
 <5c0cdb9d-8e35-fa0c-35b3-adfa7770fb30@rock-chips.com>
 <20201015152301.GE438822@phenom.ffwll.local>
From: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <e016801a-61aa-de6c-cb90-c62e03bdd067@rock-chips.com>
Date: Mon, 19 Oct 2020 11:43:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015152301.GE438822@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 19 Oct 2020 19:28:29 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gMjAyMC8xMC8xNSDkuIvljYgxMToyMywgRGFuaWVsIFZldHRlciB3cm90
ZToKPiBPbiBXZWQsIE9jdCAxNCwgMjAyMCBhdCAwOTo0ODo0M0FNICswODAwLCBLZXZlciBZYW5n
IHdyb3RlOgo+PiBIaSBNYWludGFpbmVycywKPj4KPj4gIMKgwqDCoCBEb2VzIHRoaXMgcGF0Y2gg
cmVhZHkgdG8gbWVyZ2U/Cj4gV291bGQgbWF5YmUgYmUgZ29vZCB0byBnZXQgc29tZSBhY2tzIGZy
b20gb3RoZXIgZHJpdmVycyB1c2luZyB0aGlzLCB0aGVuCj4gU2FuZHkgY2FuIHB1c2ggdG8gZHJt
LW1pc2MtbmV4dC4KClRoYW5rcyBmb3IgeW91ciByZXBseSwgSSBjYW4gdW5kZXJzdGFuZCBtb3Jl
ICdhY2tzJyB3aWxsIGJlIGJldHRlciwgYnV0IAp0aGVyZSBpcyBubyBjb21tZW50cyBvYmplY3Qg
dG8gdGhpcyBwYXRjaAoKb3IgYW55ICdOQUsnIGNvbW1vbiBmb3IgbW9yZSB0aGVuIDMgbW9udGhz
LCBtYWludGFpbmVycyBzaG91bGQgbW92ZSB0byAKbmV4dCBzdGVwLgoKClRoYW5rcywKCi0gS2V2
ZXIKCj4gLURhbmllbAo+PiBPbiAyMDIwLzcvNyDkuIvljYg3OjI1LCBTYW5keSBIdWFuZyB3cm90
ZToKPj4+IGRvbid0IG1hc2sgcG9zc2libGVfY3J0Y3MgaWYgcmVtb3RlLXBvaW50IGlzIGRpc2Fi
bGVkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFNhbmR5IEh1YW5nIDxoamNAcm9jay1jaGlwcy5j
b20+Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYyB8IDMgKysrCj4+PiAg
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fb2YuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYwo+Pj4gaW5k
ZXggZmRiMDVmYmY3MmEwLi41NjVmMDVmNWYxMWIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX29mLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYwo+Pj4gQEAg
LTY2LDYgKzY2LDkgQEAgdWludDMyX3QgZHJtX29mX2ZpbmRfcG9zc2libGVfY3J0Y3Moc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKPj4+ICAgIAl1aW50MzJfdCBwb3NzaWJsZV9jcnRjcyA9IDA7Cj4+
PiAgICAJZm9yX2VhY2hfZW5kcG9pbnRfb2Zfbm9kZShwb3J0LCBlcCkgewo+Pj4gKwkJaWYgKCFv
Zl9kZXZpY2VfaXNfYXZhaWxhYmxlKGVwKSkKPj4+ICsJCQljb250aW51ZTsKPj4+ICsKPj4+ICAg
IAkJcmVtb3RlX3BvcnQgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnQoZXApOwo+Pj4gICAgCQlp
ZiAoIXJlbW90ZV9wb3J0KSB7Cj4+PiAgICAJCQlvZl9ub2RlX3B1dChlcCk7Cj4+IExvb2tzIGdv
b2QgdG8gbWUuCj4+Cj4+Cj4+IFJldmlld2VkLWJ5OiBLZXZlciBZYW5nIDxrZXZlci55YW5nQHJv
Y2stY2hpcHMuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
