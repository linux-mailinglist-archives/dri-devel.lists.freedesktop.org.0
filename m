Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F40296B3D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 10:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3FB6E4DE;
	Fri, 23 Oct 2020 08:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5456E4DE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 08:29:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5491AABF4;
 Fri, 23 Oct 2020 08:29:50 +0000 (UTC)
Subject: Re: [PATCH] gpu/drm/mgag200:remove break after return
To: Bernard <bernard@vivo.com>
References: <ADgA6wAcDbnOQfg3AhKb6KoN.3.1603439329788.Hmail.bernard@vivo.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <44e91fc5-275e-0cd3-b6cd-acc14621a9fd@suse.de>
Date: Fri, 23 Oct 2020 10:29:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <ADgA6wAcDbnOQfg3AhKb6KoN.3.1603439329788.Hmail.bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDIzLjEwLjIwIDA5OjQ4LCBCZXJuYXJkIHdyb3RlOgo+IAo+IAo+IEZyb206IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IERhdGU6IDIwMjAtMTAtMjMgMTU6
MTM6MzAKPiBUbzogIEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4sRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4sRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPixEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+LGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcsbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IENjOiAgb3BlbnNvdXJjZS5rZXJuZWxA
dml2by5jb20KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBncHUvZHJtL21nYWcyMDA6cmVtb3ZlIGJy
ZWFrIGFmdGVyIHJldHVybj5IaQo+Pgo+PiBPbiAyMy4xMC4yMCAwOTowMCwgQmVybmFyZCBaaGFv
IHdyb3RlOgo+Pj4gSW4gZnVuY3Rpb24gbWdhZzIwMF9zZXRfcGNpX3JlZ3MsIHRoZXJlIGFyZSBz
b21lIHN3aXRjaCBjYXNlcwo+Pj4gcmV0dXJuZWQsIHRoZW4gYnJlYWsuIFRoZXNlIGJyZWFrIHdp
bGwgbmV2ZXIgcnVuLgo+Pj4gVGhpcyBwYXRjaCBpcyB0byBtYWtlIHRoZSBjb2RlIGEgYml0IHJl
YWRhYmxlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2aXZv
LmNvbT4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5j
IHwgNSArLS0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlv
bnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwo+Pj4gaW5k
ZXggMzg2NzJmOWU1YzRmLi5kZTg3M2E1ZDI3NmUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9tb2RlLmMKPj4+IEBAIC03OTQsMjAgKzc5NCwxNyBAQCBzdGF0aWMgaW50
IG1nYWcyMDBfY3J0Y19zZXRfcGxscyhzdHJ1Y3QgbWdhX2RldmljZSAqbWRldiwgbG9uZyBjbG9j
aykKPj4+ICAJY2FzZSBHMjAwX1NFX0E6Cj4+PiAgCWNhc2UgRzIwMF9TRV9COgo+Pj4gIAkJcmV0
dXJuIG1nYV9nMjAwc2Vfc2V0X3BsbHMobWRldiwgY2xvY2spOwo+Pj4gLQkJYnJlYWs7Cj4+PiAg
CWNhc2UgRzIwMF9XQjoKPj4+ICAJY2FzZSBHMjAwX0VXMzoKPj4+ICAJCXJldHVybiBtZ2FfZzIw
MHdiX3NldF9wbGxzKG1kZXYsIGNsb2NrKTsKPj4+IC0JCWJyZWFrOwo+Pj4gIAljYXNlIEcyMDBf
RVY6Cj4+PiAgCQlyZXR1cm4gbWdhX2cyMDBldl9zZXRfcGxscyhtZGV2LCBjbG9jayk7Cj4+PiAt
CQlicmVhazsKPj4+ICAJY2FzZSBHMjAwX0VIOgo+Pj4gIAljYXNlIEcyMDBfRUgzOgo+Pj4gIAkJ
cmV0dXJuIG1nYV9nMjAwZWhfc2V0X3BsbHMobWRldiwgY2xvY2spOwo+Pj4gLQkJYnJlYWs7Cj4+
PiAgCWNhc2UgRzIwMF9FUjoKPj4+ICAJCXJldHVybiBtZ2FfZzIwMGVyX3NldF9wbGxzKG1kZXYs
IGNsb2NrKTsKPj4+ICsJZGVmYXVsdDoKPj4KPj4gTm8gZGVmYXVsdCBjYXNlIGhlcmUuIElmIG9u
ZSBvZiB0aGUgZW51bSB2YWx1ZXMgaXMgbm90IGhhbmRsZWQgYnkgdGhlCj4+IHN3aXRjaCwgdGhl
IGNvbXBpbGVyIHNob3VsZCB3YXJuIGFib3V0IGl0Lgo+IAo+IEhpCj4gCj4gRm9yIHRoaXMgcG9p
bnQgSSB3YXMgYSBsaXR0bGUgY29uZnVzZWQsIGFib3V0IHRoaXMgc3dpdGNoIHZhcmlhYmxlICJt
ZGV2LT50eXBlIiwgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoaXMgdmFyaWFibGVgcyB2YWx1
ZSBjYW4gYmUgY2VydGFpbiBvbmx5IHdoZW4gdGhlIGNvZGUgaXMgcnVubmluZy4KPiBIb3cgZG9l
cyB0aGUgY29tcGlsZXIgd2FybiB0aGlzKCJJZiBvbmUgb2YgdGhlIGVudW0gdmFsdWVzIGlzIG5v
dCBoYW5kbGVkIikgYmVmb3JlIHRoZSBjb2RlIHJ1bnM/CgpUaGUgZW51bSBtZ2FfdHlwZSB7fSBo
YXMgdmFsdWVzIChHMjAwX0VSLCBHMjAwX1dCLCBldGMpIHRoYXQgYXJlIGtub3duCnRvIHRoZSBj
b21waWxlci4gSWYgb25lIG9mIHRob3NlIHZhbHVlcyBkb2VzIG5vdCBzaG93IHVwIGluIHRoZSBz
d2l0Y2gKc3RhdGVtZW50LCB0aGUgY29tcGlsZXIgd2FybnMuIEFkZGluZyBkZWZhdWx0IHdvdWxk
IHNpbGVuY2UgdGhpcyB3YXJuaW5nLgoKSW4gcHJpbmNpcGxlLCBtZGV2LT50eXBlIGNvdWxkIGNv
bnRhaW4gYW55IHZhbHVlIHRoYXQgZml0cyBpbnRvIGFuIGludC4KQnV0IGFzc2lnbmluZyBhbnl0
aGluZyB0aGF0IGlzIG5vdCBsaXN0ZWQgaW4gZW51bSBtZ2FfdHlwZSB7fSBpcwpjb25zaWRlcmVk
IGFuIGVycm9yIGFzIHdlbGwuCgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgo+IAo+IEJSLy9CZXJuYXJk
Cj4gCj4+IEJlc3QgcmVnYXJkcwo+PiBUaG9tYXMKPj4KPj4+ICAJCWJyZWFrOwo+Pj4gIAl9Cj4+
PiAgCj4+Pgo+Pgo+PiAtLSAKPj4gVGhvbWFzIFppbW1lcm1hbm4KPj4gR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcgo+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKPj4gTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4+IChIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykKPj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgo+IAo+IAoK
LS0gClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCkdlc2Now6RmdHNmw7xocmVyOiBG
ZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
