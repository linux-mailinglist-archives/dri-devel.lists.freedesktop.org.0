Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A657F7AB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 14:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64C86EDF9;
	Fri,  2 Aug 2019 12:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413016EDF9;
 Fri,  2 Aug 2019 12:58:44 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17817131-1500050 for multiple; Fri, 02 Aug 2019 13:58:38 +0100
MIME-Version: 1.0
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190802123956.2450-2-sergey.senozhatsky@gmail.com>
References: <20190802123956.2450-1-sergey.senozhatsky@gmail.com>
 <20190802123956.2450-2-sergey.senozhatsky@gmail.com>
Message-ID: <156475071634.6598.8668583907388398632@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 2/2] i915: do not leak module ref counter
Date: Fri, 02 Aug 2019 13:58:36 +0100
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBTZXJnZXkgU2Vub3poYXRza3kgKDIwMTktMDgtMDIgMTM6Mzk6NTYpCj4gcHV0X2Zp
bGVzeXN0ZW0oKSBiZWZvcmUgaTkxNV9nZW1mc19pbml0KCkgZGVhbHMgd2l0aAo+IGtlcm5fbW91
bnQoKSBlcnJvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgU2Vub3poYXRza3kgPHNlcmdl
eS5zZW5vemhhdHNreUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbWZzLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
ZW0vaTkxNV9nZW1mcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtZnMuYwo+
IGluZGV4IGNmMDViYTcyZGY5ZC4uZDQzNzE4OGQxNzM2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1mcy5jCj4gQEAgLTI0LDggKzI0LDEwIEBAIGludCBpOTE1X2dlbWZzX2lu
aXQoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpCj4gICAgICAgICAgICAgICAgIHJldHVy
biAtRU5PREVWOwo+ICAKPiAgICAgICAgIGdlbWZzID0ga2Vybl9tb3VudCh0eXBlKTsKCkxvb2tp
bmcgYXJvdW5kLCBpdCBsb29rcyBsaWtlIHdlIGFsd2F5cyBuZWVkIHRvIGRyb3AgdHlwZSBhZnRl
cgptb3VudGluZy4gU2hvdWxkIHRoZQoJcHV0X2ZpbGVzeXN0ZW0odHlwZSk7CmJlIGhlcmUgaW5z
dGVhZD8KCkFueXdheSwgbmljZSBjYXRjaC4KCj4gLSAgICAgICBpZiAoSVNfRVJSKGdlbWZzKSkK
PiArICAgICAgIGlmIChJU19FUlIoZ2VtZnMpKSB7Cj4gKyAgICAgICAgICAgICAgIHB1dF9maWxl
c3lzdGVtKHR5cGUpOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihnZW1mcyk7Cj4g
KyAgICAgICB9Cj4gIAo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIEVuYWJsZSBodWdlLXBhZ2Vz
IGZvciBvYmplY3RzIHRoYXQgYXJlIGF0IGxlYXN0IEhQQUdFX1BNRF9TSVpFLCBtb3N0Cj4gLS0g
Cj4gMi4yMi4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
