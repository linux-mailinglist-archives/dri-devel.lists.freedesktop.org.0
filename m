Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D612B77EF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE7A6E40B;
	Wed, 18 Nov 2020 08:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692926E415
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:02:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0968FABF4;
 Wed, 18 Nov 2020 08:02:09 +0000 (UTC)
Subject: Re: [PATCH] char/agp: Disable frontend without CONFIG_DRM_LEGACY
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201117214029.591896-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f2fa78c0-047e-de26-579e-7c75110005a3@suse.de>
Date: Wed, 18 Nov 2020 09:02:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117214029.591896-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDE3LjExLjIwIHVtIDIyOjQwIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiBJdCdzIHBy
b2JhYmx5IGZ1bGwgb2YgYnVncyByZWFkeSBmb3IgZXhwbG9pdGluZyBieSB1c2Vyc3BhY2UuIEFu
ZAo+IHRoZXJlJ3Mgbm90IGdvaW5nIHRvIGJlIGFueSB1c2Vyc3BhY2UgZm9yIHRoaXMgd2l0aG91
dCBhbnkgb2YgdGhlIGRybQo+IGxlZ2FjeSBkcml2ZXJzIGVuYWJsZWQgdG9vLiBTbyBqdXN0IGNv
dXBsZSBpdCB0b2dldGhlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+IENjOiBBZGFtIEphY2tzb24gPGFqYXhAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9j
aGFyL2FncC9NYWtlZmlsZSB8IDYgKysrKystCj4gIGRyaXZlcnMvY2hhci9hZ3AvYWdwLmggICAg
fCA1ICsrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NoYXIvYWdwL01ha2VmaWxlIGIvZHJpdmVy
cy9jaGFyL2FncC9NYWtlZmlsZQo+IGluZGV4IGNiMjQ5N2QxNTdmNi4uOTBlZDhjNzg5ZTQ4IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvY2hhci9hZ3AvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2No
YXIvYWdwL01ha2VmaWxlCj4gQEAgLTEsNyArMSwxMSBAQAo+ICAjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wCj4gLWFncGdhcnQteSA6PSBiYWNrZW5kLm8gZnJvbnRlbmQubyBnZW5l
cmljLm8gaXNvY2gubwo+ICthZ3BnYXJ0LXkgOj0gYmFja2VuZC5vIGdlbmVyaWMubyBpc29jaC5v
Cj4gIAo+ICtpZmVxICgkKENPTkZJR19EUk1fTEVHQUNZKSx5KQo+ICBhZ3BnYXJ0LSQoQ09ORklH
X0NPTVBBVCkJKz0gY29tcGF0X2lvY3RsLm8KPiArYWdwZ2FydC15CQkJKz0gZnJvbnRlbmQubwo+
ICtlbmRpZgo+ICsKPiAgCj4gIG9iai0kKENPTkZJR19BR1ApCQkrPSBhZ3BnYXJ0Lm8KPiAgb2Jq
LSQoQ09ORklHX0FHUF9BTEkpCQkrPSBhbGktYWdwLm8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
aGFyL2FncC9hZ3AuaCBiL2RyaXZlcnMvY2hhci9hZ3AvYWdwLmgKPiBpbmRleCA0ZWIxYzc3MmRl
ZDcuLmJiMDlkNjRjZDUxZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NoYXIvYWdwL2FncC5oCj4g
KysrIGIvZHJpdmVycy9jaGFyL2FncC9hZ3AuaAo+IEBAIC0xODYsOCArMTg2LDEzIEBAIGludCBh
Z3BfYWRkX2JyaWRnZShzdHJ1Y3QgYWdwX2JyaWRnZV9kYXRhICpicmlkZ2UpOwo+ICB2b2lkIGFn
cF9yZW1vdmVfYnJpZGdlKHN0cnVjdCBhZ3BfYnJpZGdlX2RhdGEgKmJyaWRnZSk7Cj4gIAo+ICAv
KiBGcm9udGVuZCByb3V0aW5lcy4gKi8KPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9MRUdB
Q1kpCj4gIGludCBhZ3BfZnJvbnRlbmRfaW5pdGlhbGl6ZSh2b2lkKTsKPiAgdm9pZCBhZ3BfZnJv
bnRlbmRfY2xlYW51cCh2b2lkKTsKPiArI2Vsc2UKPiArc3RhdGljIGlubGluZSBpbnQgYWdwX2Zy
b250ZW5kX2luaXRpYWxpemUodm9pZCkgeyByZXR1cm4gMDsgfQo+ICtzdGF0aWMgaW5saW5lIHZv
aWQgYWdwX2Zyb250ZW5kX2NsZWFudXAodm9pZCkge30KPiArI2VuZGlmCgpUaGVyZSdzIG9uZSBu
b24tbGVnYWN5IGRyaXZlciB0aGF0IHVzZXMgdGhlc2UgYWdwIHN0cnVjdHVyZXMsIHdoaWNoIGlz
CnJhZGVvbi4gRG9lcyB0aGlzIGNoYW5nZSBhZmZlY3QgcmFkZW9uPwoKQmVzdCByZWdhcmRzClRo
b21hcwoKPiAgCj4gIC8qIEdlbmVyaWMgcm91dGluZXMuICovCj4gIHZvaWQgYWdwX2dlbmVyaWNf
ZW5hYmxlKHN0cnVjdCBhZ3BfYnJpZGdlX2RhdGEgKmJyaWRnZSwgdTMyIG1vZGUpOwo+IAoKLS0g
ClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCkdlc2Now6RmdHNmw7xocmVyOiBGZWxp
eCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
