Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076DE296A1B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E746E497;
	Fri, 23 Oct 2020 07:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BF66E497
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 07:13:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 10B61ABD1;
 Fri, 23 Oct 2020 07:13:31 +0000 (UTC)
Subject: Re: [PATCH] gpu/drm/mgag200:remove break after return
To: Bernard Zhao <bernard@vivo.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201023070004.55105-1-bernard@vivo.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a6eab3c7-f1dd-82db-1cc0-35997c04bd7d@suse.de>
Date: Fri, 23 Oct 2020 09:13:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201023070004.55105-1-bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDIzLjEwLjIwIDA5OjAwLCBCZXJuYXJkIFpoYW8gd3JvdGU6Cj4gSW4gZnVuY3Rpb24g
bWdhZzIwMF9zZXRfcGNpX3JlZ3MsIHRoZXJlIGFyZSBzb21lIHN3aXRjaCBjYXNlcwo+IHJldHVy
bmVkLCB0aGVuIGJyZWFrLiBUaGVzZSBicmVhayB3aWxsIG5ldmVyIHJ1bi4KPiBUaGlzIHBhdGNo
IGlzIHRvIG1ha2UgdGhlIGNvZGUgYSBiaXQgcmVhZGFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QmVybmFyZCBaaGFvIDxiZXJuYXJkQHZpdm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWdhZzIwMC9tZ2FnMjAwX21vZGUuYyB8IDUgKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfbW9kZS5jCj4gaW5kZXggMzg2NzJmOWU1YzRmLi5kZTg3M2E1ZDI3NmUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwo+IEBAIC03OTQsMjAgKzc5NCwxNyBAQCBz
dGF0aWMgaW50IG1nYWcyMDBfY3J0Y19zZXRfcGxscyhzdHJ1Y3QgbWdhX2RldmljZSAqbWRldiwg
bG9uZyBjbG9jaykKPiAgCWNhc2UgRzIwMF9TRV9BOgo+ICAJY2FzZSBHMjAwX1NFX0I6Cj4gIAkJ
cmV0dXJuIG1nYV9nMjAwc2Vfc2V0X3BsbHMobWRldiwgY2xvY2spOwo+IC0JCWJyZWFrOwo+ICAJ
Y2FzZSBHMjAwX1dCOgo+ICAJY2FzZSBHMjAwX0VXMzoKPiAgCQlyZXR1cm4gbWdhX2cyMDB3Yl9z
ZXRfcGxscyhtZGV2LCBjbG9jayk7Cj4gLQkJYnJlYWs7Cj4gIAljYXNlIEcyMDBfRVY6Cj4gIAkJ
cmV0dXJuIG1nYV9nMjAwZXZfc2V0X3BsbHMobWRldiwgY2xvY2spOwo+IC0JCWJyZWFrOwo+ICAJ
Y2FzZSBHMjAwX0VIOgo+ICAJY2FzZSBHMjAwX0VIMzoKPiAgCQlyZXR1cm4gbWdhX2cyMDBlaF9z
ZXRfcGxscyhtZGV2LCBjbG9jayk7Cj4gLQkJYnJlYWs7Cj4gIAljYXNlIEcyMDBfRVI6Cj4gIAkJ
cmV0dXJuIG1nYV9nMjAwZXJfc2V0X3BsbHMobWRldiwgY2xvY2spOwo+ICsJZGVmYXVsdDoKCk5v
IGRlZmF1bHQgY2FzZSBoZXJlLiBJZiBvbmUgb2YgdGhlIGVudW0gdmFsdWVzIGlzIG5vdCBoYW5k
bGVkIGJ5IHRoZQpzd2l0Y2gsIHRoZSBjb21waWxlciBzaG91bGQgd2FybiBhYm91dCBpdC4KCkJl
c3QgcmVnYXJkcwpUaG9tYXMKCj4gIAkJYnJlYWs7Cj4gIAl9Cj4gIAo+IAoKLS0gClRob21hcyBa
aW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2
cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
