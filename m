Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8DC29A4E8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 07:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F166EB15;
	Tue, 27 Oct 2020 06:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A25D6EB15
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:54:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 24F2CAEFE;
 Tue, 27 Oct 2020 06:54:22 +0000 (UTC)
Subject: Re: [PATCH] matroxfb: avoid -Warray-bounds warning
To: Arnd Bergmann <arnd@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20201026194010.3817166-1-arnd@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <745539ce-52ff-f56f-0f02-41894f366503@suse.de>
Date: Tue, 27 Oct 2020 07:54:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201026194010.3817166-1-arnd@kernel.org>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDI2LjEwLjIwIHVtIDIwOjM5IHNjaHJpZWIgQXJuZCBCZXJnbWFubjoKPiBGcm9tOiBB
cm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IFRoZSBvcGVuLWNvZGVkIGxpc3RfZm9y
X2VhY2hfZW50cnkoKSBjYXVzZXMgYSBoYXJtbGVzcyB3YXJuaW5nOgo+IAo+IGRyaXZlcnMvdmlk
ZW8vZmJkZXYvbWF0cm94L21hdHJveGZiX2Jhc2UuYzogSW4gZnVuY3Rpb24gJ21hdHJveGZiX3Jl
Z2lzdGVyX2RyaXZlcic6Cj4gaW5jbHVkZS9saW51eC9rZXJuZWwuaDo4NTY6Mzogd2FybmluZzog
YXJyYXkgc3Vic2NyaXB0IC05OCBpcyBvdXRzaWRlIGFycmF5IGJvdW5kcyBvZiAnc3RydWN0IGxp
c3RfaGVhZFsxXScgWy1XYXJyYXktYm91bmRzXQo+IAo+IFVzZSB0aGUgbm9ybWFsIGxpc3RfZm9y
X2VhY2hfZW50cnkgaW5zdGVhZC4KPiAKPiBGaXhlczogMWRhMTc3ZTRjM2Y0ICgiTGludXgtMi42
LjEyLXJjMiIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
CkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KCkknbGwg
YWRkIHRoZSBwYXRjaCB0byBkcm0tbWlzYy1uZXh0LiBUaGFua3MhCgpCZXN0IHJlZ2FyZHMKVGhv
bWFzCgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJveC9tYXRyb3hmYl9iYXNlLmMg
fCA4ICsrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbWF0cm94L21hdHJv
eGZiX2Jhc2UuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbWF0cm94L21hdHJveGZiX2Jhc2UuYwo+
IGluZGV4IDU3MDQzOWIzMjY1NS4uYTM4NTM0MjFiMjYzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
dmlkZW8vZmJkZXYvbWF0cm94L21hdHJveGZiX2Jhc2UuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvbWF0cm94L21hdHJveGZiX2Jhc2UuYwo+IEBAIC0xOTcwLDkgKzE5NzAsNyBAQCBpbnQg
bWF0cm94ZmJfcmVnaXN0ZXJfZHJpdmVyKHN0cnVjdCBtYXRyb3hmYl9kcml2ZXIqIGRydikgewo+
ICAJc3RydWN0IG1hdHJveF9mYl9pbmZvKiBtaW5mbzsKPiAgCj4gIAlsaXN0X2FkZCgmZHJ2LT5u
b2RlLCAmbWF0cm94ZmJfZHJpdmVyX2xpc3QpOwo+IC0JZm9yIChtaW5mbyA9IG1hdHJveGZiX2wo
bWF0cm94ZmJfbGlzdC5uZXh0KTsKPiAtCSAgICAgbWluZm8gIT0gbWF0cm94ZmJfbCgmbWF0cm94
ZmJfbGlzdCk7Cj4gLQkgICAgIG1pbmZvID0gbWF0cm94ZmJfbChtaW5mby0+bmV4dF9mYi5uZXh0
KSkgewo+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShtaW5mbywgJm1hdHJveGZiX2xpc3QsIG5leHRf
ZmIpIHsKPiAgCQl2b2lkKiBwOwo+ICAKPiAgCQlpZiAobWluZm8tPmRyaXZlcnNfY291bnQgPT0g
TUFUUk9YRkJfTUFYX0ZCX0RSSVZFUlMpCj4gQEAgLTE5OTAsOSArMTk4OCw3IEBAIHZvaWQgbWF0
cm94ZmJfdW5yZWdpc3Rlcl9kcml2ZXIoc3RydWN0IG1hdHJveGZiX2RyaXZlciogZHJ2KSB7Cj4g
IAlzdHJ1Y3QgbWF0cm94X2ZiX2luZm8qIG1pbmZvOwo+ICAKPiAgCWxpc3RfZGVsKCZkcnYtPm5v
ZGUpOwo+IC0JZm9yIChtaW5mbyA9IG1hdHJveGZiX2wobWF0cm94ZmJfbGlzdC5uZXh0KTsKPiAt
CSAgICAgbWluZm8gIT0gbWF0cm94ZmJfbCgmbWF0cm94ZmJfbGlzdCk7Cj4gLQkgICAgIG1pbmZv
ID0gbWF0cm94ZmJfbChtaW5mby0+bmV4dF9mYi5uZXh0KSkgewo+ICsJbGlzdF9mb3JfZWFjaF9l
bnRyeShtaW5mbywgJm1hdHJveGZiX2xpc3QsIG5leHRfZmIpIHsKPiAgCQlpbnQgaTsKPiAgCj4g
IAkJZm9yIChpID0gMDsgaSA8IG1pbmZvLT5kcml2ZXJzX2NvdW50OyApIHsKPiAKCi0tIApUaG9t
YXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSApNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkKKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQpHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1l
bmTDtnJmZmVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
