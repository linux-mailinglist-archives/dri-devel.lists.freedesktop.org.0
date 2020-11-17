Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8392B6A65
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 17:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8B689B22;
	Tue, 17 Nov 2020 16:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id F38AA89B22
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 16:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id DF4002A6045;
 Tue, 17 Nov 2020 17:38:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id WGGLmpG98QEg; Tue, 17 Nov 2020 17:38:25 +0100 (CET)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 3BD5E2A6042;
 Tue, 17 Nov 2020 17:38:25 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kf3zs-000h5S-DP; Tue, 17 Nov 2020 17:38:24 +0100
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20201117140615.255887-1-christian.koenig@amd.com>
 <20201117140615.255887-3-christian.koenig@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH 3/3] drm/ttm: make up to 90% of system memory available
Message-ID: <3ac0fdcd-9e2e-fcfa-aba2-e3840801f25d@daenzer.net>
Date: Tue, 17 Nov 2020 17:38:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201117140615.255887-3-christian.koenig@amd.com>
Content-Language: en-CA
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, sroland@vmware.com,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMS0xNyAzOjA2IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gSW5jcmVh
c2UgdGhlIGFtbW91bnQgb2Ygc3lzdGVtIG1lbW9yeSBkcml2ZXJzIGNhbiB1c2UgdG8gYWJvdXQg
OTAlIG9mCj4gdGhlIHRvdGFsIGF2YWlsYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggYTk1ODEzNWNi
M2ZlLi4wYTkzZGY5M2RiYTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtMTI2Nyw3ICsx
MjY3LDcgQEAgc3RhdGljIGludCB0dG1fYm9fZ2xvYmFsX2luaXQodm9pZCkKPiAgIAkgKiB0aGUg
YXZhaWxhYmxlIHN5c3RlbSBtZW1vcnkuCj4gICAJICovCj4gICAJbnVtX3BhZ2VzID0gKHU2NClz
aS50b3RhbHJhbSAqIHNpLm1lbV91bml0Owo+IC0JbnVtX3BhZ2VzID0gKG51bV9wYWdlcyAqIDUw
IC8gMTAwKSA+PiBQQUdFX1NISUZUOwo+ICsJbnVtX3BhZ2VzID0gKG51bV9wYWdlcyAqIDkwIC8g
MTAwKSA+PiBQQUdFX1NISUZUOwo+ICAgCj4gICAJLyogQnV0IGZvciBETUEzMiB3ZSBsaW1pdCBv
dXJzZWxmIHRvIG9ubHkgdXNlIDJHaUIgbWF4aW11bS4gKi8KPiAgIAludW1fZG1hMzJfcGFnZXMg
PSAodTY0KShzaS50b3RhbHJhbSAtIHNpLnRvdGFsaGlnaCkgKiBzaS5tZW1fdW5pdDsKPiAKClRo
aXMgc2hvdWxkIHVwZGF0ZSB0aGUgY29tbWVudCBhZGRlZCBpbiBwYXRjaCAxLgoKCi0tIApFYXJ0
aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6
Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAg
ICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
