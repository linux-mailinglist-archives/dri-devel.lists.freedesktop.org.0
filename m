Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9540E455A4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992F6893EB;
	Fri, 14 Jun 2019 07:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7BE897F6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 09:15:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 73D26260CB2
Subject: Re: [PATCH] backlight: pwm_bl: Fix heuristic to determine number of
 brightness levels
To: Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20190612180003.161966-1-mka@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <fd554750-7ec6-73e1-be3a-5bac0749fa0b@collabora.com>
Date: Thu, 13 Jun 2019 11:14:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612180003.161966-1-mka@chromium.org>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF0dGhpYXMsCgpPbiAxMi82LzE5IDIwOjAwLCBNYXR0aGlhcyBLYWVobGNrZSB3cm90ZToK
PiBXaXRoIGNvbW1pdCA4OGJhOTViZWRiNzkgKCJiYWNrbGlnaHQ6IHB3bV9ibDogQ29tcHV0ZSBi
cmlnaHRuZXNzIG9mCj4gTEVEIGxpbmVhcmx5IHRvIGh1bWFuIGV5ZSIpIHRoZSBudW1iZXIgb2Yg
c2V0IGJpdHMgKGFrYSBod2VpZ2h0KCkpCj4gaW4gdGhlIFBXTSBwZXJpb2QgaXMgdXNlZCBpbiB0
aGUgaGV1cmlzdGljIHRvIGRldGVybWluZSB0aGUgbnVtYmVyCj4gb2YgYnJpZ2h0bmVzcyBsZXZl
bHMsIHdoZW4gdGhlIGJyaWdodG5lc3MgdGFibGUgaXNuJ3Qgc3BlY2lmaWVkIGluCj4gdGhlIERU
LiBUaGUgbnVtYmVyIG9mIHNldCBiaXRzIGRvZXNuJ3QgcHJvdmlkZSBhIHJlbGlhYmxlIGNsdWUg
YWJvdXQKPiB0aGUgbGVuZ3RoIG9mIHRoZSBwZXJpb2QsIGluc3RlYWQgY2hhbmdlIHRoZSBoZXVy
aXN0aWMgdG86Cj4gCj4gIG5sZXZlbHMgPSBwZXJpb2QgLyBmbHMocGVyaW9kKQo+IAo+IEFsc28g
bGltaXQgdGhlIG1heGltdW0gbnVtYmVyIG9mIGJyaWdodG5lc3MgbGV2ZWxzIHRvIDQwOTYgdG8g
YXZvaWQKPiBleGNlc3NpdmVseSBsYXJnZSB0YWJsZXMuCj4gCj4gV2l0aCB0aGlzIHRoZSBudW1i
ZXIgb2YgbGV2ZWxzIGluY3JlYXNlcyBtb25vdG9uaWNhbGx5IHdpdGggdGhlIFBXTQo+IHBlcmlv
ZCwgdW50aWwgdGhlIG1heGltdW0gb2YgNDA5NiBsZXZlbHMgaXMgcmVhY2hlZDoKPiAKPiBwZXJp
b2QgKG5zKSAgICAjIGxldmVscwo+IAo+IDEwMCAgICAJICAgICAgIDE2Cj4gNTAwCSAgICAgICA2
Mgo+IDEwMDAJICAgICAgIDExMQo+IDUwMDAJICAgICAgIDQxNgo+IDEwMDAwCSAgICAgICA3NjkK
PiA1MDAwMAkgICAgICAgMzMzMwo+IDEwMDAwMAkgICAgICAgNDA5Ngo+IAo+IEZpeGVzOiA4OGJh
OTViZWRiNzkgKCJiYWNrbGlnaHQ6IHB3bV9ibDogQ29tcHV0ZSBicmlnaHRuZXNzIG9mIExFRCBs
aW5lYXJseSB0byBodW1hbiBleWUiKQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tl
IDxta2FAY2hyb21pdW0ub3JnPgoKVGVzdGVkIG9uIFNhbXN1bmcgQ2hyb21lYm9vayBQbHVzICgx
Ni1iaXQgcHdtKQoKVGVzdGVkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxs
ZXRib0Bjb2xsYWJvcmEuY29tPgoKCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3
bV9ibC5jIHwgMjQgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9i
bC5jCj4gaW5kZXggZmI0NWY4NjZiOTIzLi4wYjcxNTJmYTI0ZjcgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9wd21fYmwuYwo+IEBAIC0xOTQsMjkgKzE5NCwxNyBAQCBpbnQgcHdtX2JhY2tsaWdodF9i
cmlnaHRuZXNzX2RlZmF1bHQoc3RydWN0IGRldmljZSAqZGV2LAo+ICAJCQkJICAgICBzdHJ1Y3Qg
cGxhdGZvcm1fcHdtX2JhY2tsaWdodF9kYXRhICpkYXRhLAo+ICAJCQkJICAgICB1bnNpZ25lZCBp
bnQgcGVyaW9kKQo+ICB7Cj4gLQl1bnNpZ25lZCBpbnQgY291bnRlciA9IDA7Cj4gLQl1bnNpZ25l
ZCBpbnQgaSwgbjsKPiArCXVuc2lnbmVkIGludCBpOwo+ICAJdTY0IHJldHZhbDsKPiAgCj4gIAkv
Kgo+IC0JICogQ291bnQgdGhlIG51bWJlciBvZiBiaXRzIG5lZWRlZCB0byByZXByZXNlbnQgdGhl
IHBlcmlvZCBudW1iZXIuIFRoZQo+IC0JICogbnVtYmVyIG9mIGJpdHMgaXMgdXNlZCB0byBjYWxj
dWxhdGUgdGhlIG51bWJlciBvZiBsZXZlbHMgdXNlZCBmb3IgdGhlCj4gLQkgKiBicmlnaHRuZXNz
LWxldmVscyB0YWJsZSwgdGhlIHB1cnBvc2Ugb2YgdGhpcyBjYWxjdWxhdGlvbiBpcyBoYXZlIGEK
PiAtCSAqIHByZS1jb21wdXRlZCB0YWJsZSB3aXRoIGVub3VnaCBsZXZlbHMgdG8gZ2V0IGxpbmVh
ciBicmlnaHRuZXNzCj4gLQkgKiBwZXJjZXB0aW9uLiBUaGUgcGVyaW9kIGlzIGRpdmlkZWQgYnkg
dGhlIG51bWJlciBvZiBiaXRzIHNvIGZvciBhCj4gLQkgKiA4LWJpdCBQV00gd2UgaGF2ZSAyNTUg
LyA4ID0gMzIgYnJpZ2h0bmVzcyBsZXZlbHMgb3IgZm9yIGEgMTYtYml0IFBXTQo+IC0JICogd2Ug
aGF2ZSA2NTUzNSAvIDE2ID0gNDA5NiBicmlnaHRuZXNzIGxldmVscy4KPiAtCSAqCj4gLQkgKiBO
b3RlIHRoYXQgdGhpcyBtZXRob2QgaXMgYmFzZWQgb24gZW1waXJpY2FsIHRlc3Rpbmcgb24gZGlm
ZmVyZW50Cj4gLQkgKiBkZXZpY2VzIHdpdGggUFdNIG9mIDggYW5kIDE2IGJpdHMgb2YgcmVzb2x1
dGlvbi4KPiArCSAqIE9uY2Ugd2UgaGF2ZSA0MDk2IGxldmVscyB0aGVyZSdzIGxpdHRsZSBwb2lu
dCBnb2luZyBtdWNoIGhpZ2hlci4uLgo+ICsJICogbmVpdGhlciBpbnRlcmFjdGl2ZSBzbGlkZXJz
IG5vciBhbmltYXRpb24gYmVuZWZpdHMgZnJvbSBoYXZpbmcKPiArCSAqIG1vcmUgdmFsdWVzIGlu
IHRoZSB0YWJsZS4KPiAgCSAqLwo+IC0JbiA9IHBlcmlvZDsKPiAtCXdoaWxlIChuKSB7Cj4gLQkJ
Y291bnRlciArPSBuICUgMjsKPiAtCQluID4+PSAxOwo+IC0JfQo+ICsJZGF0YS0+bWF4X2JyaWdo
dG5lc3MgPQo+ICsJCW1pbigoaW50KURJVl9ST1VORF9VUChwZXJpb2QsIGZscyhwZXJpb2QpKSwg
NDA5Nik7Cj4gIAo+IC0JZGF0YS0+bWF4X2JyaWdodG5lc3MgPSBESVZfUk9VTkRfVVAocGVyaW9k
LCBjb3VudGVyKTsKPiAgCWRhdGEtPmxldmVscyA9IGRldm1fa2NhbGxvYyhkZXYsIGRhdGEtPm1h
eF9icmlnaHRuZXNzLAo+ICAJCQkJICAgIHNpemVvZigqZGF0YS0+bGV2ZWxzKSwgR0ZQX0tFUk5F
TCk7Cj4gIAlpZiAoIWRhdGEtPmxldmVscykKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
