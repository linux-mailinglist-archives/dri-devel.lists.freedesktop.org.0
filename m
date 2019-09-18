Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C4AB6F35
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 00:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA1C7AAA6;
	Wed, 18 Sep 2019 22:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066617AAA6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 22:08:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 33F1928E137
Message-ID: <047d50be66382b0c9dd14a6918140e033237a917.camel@collabora.com>
Subject: Re: [PATCH libdrm 1/2] modetest: Fix segmentation fault
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Wed, 18 Sep 2019 19:08:45 -0300
In-Reply-To: <ea4f6c860d9dc60504d81c00350cabb7effab496.camel@collabora.com>
References: <20190722160823.26668-1-ezequiel@collabora.com>
 <ea4f6c860d9dc60504d81c00350cabb7effab496.camel@collabora.com>
Organization: Collabora
User-Agent: Evolution 3.30.5-1.1 
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
Cc: rohan.garg@collabora.com, Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA4LTE1IGF0IDA5OjA3IC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3JvdGU6
Cj4gT24gTW9uLCAyMDE5LTA3LTIyIGF0IDEzOjA4IC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3Jv
dGU6Cj4gPiBXaGVuIGEgbW9kZSBpcyBzZXQgd2l0aCBqdXN0IGEgY29ubmVjdG9yICItcyBmb28i
LAo+ID4gd2UgZ2V0IGEgbmFzdHkgc2VnbWVudGF0aW9uIGZhdWx0LiBGaXggaXQuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4K
PiAKPiBUaGVyZSdzIG5vIHJ1c2gsIGJ1dCBzdGlsbCwgaGVyZSBnb2VzIGEgcmVtaW5kZXIKPiBv
ZiB0aGlzIGFuZCB0aGUgbmV4dCBwYXRjaC4gOi0pCj4gCgpTdGlsbCBubyBydXNoLCBidXQgYSBy
ZW1pbmRlciB0byBwcmV2ZW50IHRoZXNlIHBhdGNoZXMKZnJvbSB2YW5pc2hpbmcgaW50byB0aGlu
IGFpci4KCj4gPiAtLS0KPiA+ICB0ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jIHwgMiArKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rl
c3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMgYi90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCj4gPiBp
bmRleCBlNjZiZTY2MDdlMDAuLjVlNjI4MTI3YTEzMCAxMDA2NDQKPiA+IC0tLSBhL3Rlc3RzL21v
ZGV0ZXN0L21vZGV0ZXN0LmMKPiA+ICsrKyBiL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMKPiA+
IEBAIC0xNjk1LDYgKzE2OTUsOCBAQCBzdGF0aWMgaW50IHBhcnNlX2Nvbm5lY3RvcihzdHJ1Y3Qg
cGlwZV9hcmcgKnBpcGUsIGNvbnN0IGNoYXIgKmFyZykKPiA+ICAJCXJldHVybiAtMTsKPiA+ICAK
PiA+ICAJLyogUGFyc2UgdGhlIHJlbWFpbmluZyBwYXJhbWV0ZXJzLiAqLwo+ID4gKwlpZiAoIWVu
ZHApCj4gPiArCQlyZXR1cm4gLTE7Cj4gPiAgCWlmICgqZW5kcCA9PSAnQCcpIHsKPiA+ICAJCWFy
ZyA9IGVuZHAgKyAxOwo+ID4gIAkJcGlwZS0+Y3J0Y19pZCA9IHN0cnRvdWwoYXJnLCAmZW5kcCwg
MTApOwo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
