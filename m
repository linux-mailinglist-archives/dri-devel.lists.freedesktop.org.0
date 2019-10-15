Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5850DD6F50
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 07:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BF36E0C0;
	Tue, 15 Oct 2019 05:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DCE6E0C0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 05:48:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 501C8B48C;
 Tue, 15 Oct 2019 05:48:55 +0000 (UTC)
Subject: Re: [PATCH v2 05/15] drm/fbconv: Add DRM <-> fbdev pixel-format
 conversion
To: Sam Ravnborg <sam@ravnborg.org>
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-6-tzimmermann@suse.de>
 <20191014203007.GA4373@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9f0e6195-eac3-7055-c1ec-5157f8411e15@suse.de>
Date: Tue, 15 Oct 2019 07:48:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191014203007.GA4373@ravnborg.org>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, corbet@lwn.net, airlied@linux.ie,
 gregkh@linuxfoundation.org, michel@daenzer.net, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, malat@debian.org, sean@poorly.run
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDE0LjEwLjE5IHVtIDIyOjMwIHNjaHJpZWIgU2FtIFJhdm5ib3JnOgo+IEhpIFRob21h
cy4KPiAKPiBPbiBNb24sIE9jdCAxNCwgMjAxOSBhdCAwNDowNDowNlBNICswMjAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToKPj4gRFJNIHVzZXMgRk9VUkNDIGNvbnN0YW50cyB0byBkZXNjcmli
ZSBwaXhlbCBmb3JtYXRzLCBmYmRldiB1c2VzIGEKPj4gcGVyLWNvbXBvbmVudCBiaXRmaWVsZCBz
dHJ1Y3R1cmUuIFRoZSBmdW5jdGlvbnMgaW4gdGhpcyBwYXRjaCBjb252ZXJ0Cj4+IGJldHdlZW4g
dGhlIHR3by4KPj4KPiAKPiBBIGZldyBuaXRzIGJlbG93Lgo+IAo+IAo+PiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPj4gLS0tCj4+ICAgZHJp
dmVycy9ncHUvZHJtL2RybV9mYmNvbnZfaGVscGVyLmMgfCA0MzUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+PiAgIGluY2x1ZGUvZHJtL2RybV9mYmNvbnZfaGVscGVyLmggICAgIHwgIDIz
ICsrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NTggaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2RybS9kcm1fZmJjb252X2hlbHBlci5oCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiY29udl9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmJjb252X2hlbHBlci5jCj4+IGluZGV4IDBjYjQ2ZDJjOThjMy4uYWY0NTM1OGExNTZh
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiY29udl9oZWxwZXIuYwo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiY29udl9oZWxwZXIuYwo+PiBAQCAtMSArMSw0MzYg
QEAKPj4gICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+PiAr
Cj4+ICsjaW5jbHVkZSA8YXNtL2J5dGVvcmRlci5oPgo+PiArCj4+ICsjaW5jbHVkZSA8bGludXgv
ZmIuaD4KPiAKPiA8YXNtLyo+IGFmdGVyIDxsaW51eC8qPgo+IFNvIHdlIGluIHRoaXMgd2F5IHBp
Y2sgdGhlIG1vcmUgZ2VuZXJhbCBpbmNsdWRlIGZpbGUgZmlyc3QuCgpPay4KCj4+ICsKPj4gK3N0
cnVjdCBmb3JtYXRfbWFwIHsKPj4gKwlib29sICgqaXNfZm9ybWF0KShjb25zdCBzdHJ1Y3QgZmJf
dmFyX3NjcmVlbmluZm8gKmZiX3Zhcik7Cj4+ICsJdWludDMyX3QgZm9ybWF0Owo+PiArfTsKPiBX
ZSBhcmUgaW4gdGhlIGtlcm5lbCAtIHdoZXJlIEkgdGhpbmsgdTMyIGlzIHByZWZlcnJlZCBvdmVy
IHRoZSBsb25nZXIKPiB1aW50MzJfdC4KPiBJZiBJIGdyZXAgaW4gZHJtLyogdGhlbiB0aGV5IHNl
ZW1zIGJlIGJlIGVxdWFsbHkgcG9wdWxhciwgc28gZmVlbCBmcmVlCj4gdG8gaWdub3JlIHRoaXMg
Y29tbWVudC4KCkkgZ2VuZXJhbGx5IHVzZSB0eXBlcyB0aGF0IGFyZSB1c2VkIGJ5IHJlbGF0ZWQg
aW50ZXJmYWNlcy4gSGVyZSBpdCdzIAp1aW50MzJfdCBiZWNhdXNlIG1vc3Qgb3RoZXIgcGxhY2Vz
IHVzZSB1aW50MzJfdCBmb3Igc3RvcmluZyBEUk1fRk9STUFUIApjb25zdGFudHMuCgo+IAo+PiAr
c3RhdGljIHZvaWQgc2V0X2ZiX2JpdGZpZWxkKHN0cnVjdCBmYl9iaXRmaWVsZCAqYml0cywgX191
MzIgb2Zmc2V0LAo+PiArCQkJICAgIF9fdTMyIGxlbmd0aCkKPiAKPiBUaGlzIGlzIG5vdCB1YXBp
IC0gc28gdTMyIGlzIHByZWZlcnJlZC4KClNhbWUgYXMgYWJvdmUuIFRoZSBfX3UzMiBjb21lcyBm
cm9tIHRoZSBmYl9iaXRmaWVsZCBzdHJ1Y3R1cmUuCgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgo+IEJv
dGggY29tbWVudHMgYXBwbHkgdG8gdGhlIHdob2xlIGZpbGUuCj4gCj4gSSBkaWQgbm90IHNlZSB0
aGF0IHRoaXMgd2FzIHdpcmVkIGludG8gdGhlIGtlcm5lbC1kb2MgaW4gRG9jdW1lbnRhdGlvbi8K
PiBidXQgbWF5YmUgSSBqdXN0IG1pc3NlZCBpdC4KPiAKPiBXaXRoIG15IGNvbW1lbnRzIGNvbnNp
ZGVyZWQgeW91IGNhbiBhZGQ6Cj4gQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KPiAKPiBBbGwgY29kZSBsb29rcyBzYW5lLCBidXQgYXMgSSBoYXZlIG5vdCBncmFzcGVk
IHRoZSBiaWdnZXIgcGljdHVyZQo+IHRoaXMgY2FuIGhhcmRseSBiZSBhIHJldmlldy4KPiAKPiAJ
U2FtCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cj4gCgotLSAKVGhvbWFzIFppbW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNF
IExpbnV4IEdtYkgsIE1heGZlbGRzdHJhc3NlIDUsIDkwNDA5IE51ZXJuYmVyZywgR2VybWFueQpH
RjogRmVsaXggSW1lbmTDtnJmZmVyLCBNYXJ5IEhpZ2dpbnMsIFNyaSBSYXNpYWgKSFJCIDIxMjg0
IChBRyBOw7xybmJlcmcpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
