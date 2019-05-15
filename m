Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B8920029
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 09:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A476A89358;
	Thu, 16 May 2019 07:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEC189257;
 Wed, 15 May 2019 14:35:54 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60938
 helo=[192.168.10.178])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <post@tronnes.org>)
 id 1hQv0a-0001Py-9q; Wed, 15 May 2019 16:35:52 +0200
Subject: Re: [PATCH v5 05/11] drm/fb-helper: Remove drm_fb_helper_crtc
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190506180139.6913-1-noralf@tronnes.org>
 <20190506180139.6913-6-noralf@tronnes.org>
 <20190515090432.GA31712@ravnborg.org>
From: =?UTF-8?Q?Familien_Tr=c3=b8nnes?= <post@tronnes.org>
Message-ID: <618412bb-a4ed-d96b-f062-374ccc69992b@tronnes.org>
Date: Wed, 15 May 2019 16:35:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515090432.GA31712@ravnborg.org>
X-Mailman-Approved-At: Thu, 16 May 2019 07:22:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=8mmcH3/0hF2hfRf7fkdwAhB9p1Dypg8hIxEZuUwRkT8=; 
 b=kBZDjlEgzkjwEvuvTlP4hX/LmnarJmQGAA/dHj2ScQCAkplZj2tp8ff9ok8zWWOMnPTtwwbTwaGSYUzUx5gg9tkAxQ91hhZ8SXH486PY764Ooktt3QpGpW3DuKrGx8gJPA+1yQuh8Rj3mjJ1ZdUZNoIp/LoXR8tsBtApP3NRT1XIJr9OumnnZH3dbA0JcXFQL5sN3ctbKfINUt52VpZGhAqBEQ/iOVLsPtDrjZ/PpwFZEMWKclesvqm31zdEjWHpZol7fYGHJ+/FSk0FFGBRnoRvwTVYIw3Qf0AYLq2vHsDmBM3lzP6qE/mNPA2q/blb/Xw2YLu61cFSH3kS+QJ51g==;
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKRGVuIDE1LjA1LjIwMTkgMTEuMDQsIHNrcmV2IFNhbSBSYXZuYm9yZzoKPiBIaSBO
b3JhbGYuCj4gCj4gSSBoYXZlIHJlYWQgdGhyb3VnaCB0aGUgY2FobmVzIGEgY29wdXBsZSBvZiB0
aW1lcyBub3QgYW5kIGZlZWwgY29uZmlkZW50Cj4gdG8gYWRkIG15IHItYiBpZiB0aGUgY29tbWVu
dHMgYXJlIGNvbnNpZGVyZWQuCj4gCj4gT24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDg6MDE6MzNQ
TSArMDIwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+PiBJdCBub3cgb25seSBjb250YWlucyB0
aGUgbW9kZXNldCBzbyB1c2UgdGhhdCBkaXJlY3RseSBpbnN0ZWFkIGFuZCBhdHRhY2gKPj4gYSBt
b2Rlc2V0IGFycmF5IHRvIGRybV9jbGllbnRfZGV2LiBkcm1fZmJfaGVscGVyIHdpbGwgdXNlIHRo
aXMgYXJyYXkuCj4+IENvZGUgd2lsbCBsYXRlciBiZSBtb3ZlZCB0byBkcm1fY2xpZW50LCBzbyBh
ZGQgY29kZSB0aGVyZSBpbiBhIG5ldyBmaWxlCj4+IGRybV9jbGllbnRfbW9kZXNldC5jIHdpdGgg
TUlUIGxpY2Vuc2UgdG8gbWF0Y2ggZHJtX2ZiX2hlbHBlci5jLgo+IAo+IFRoZSBmaXJzdCBwYXJ0
IG9mIHRoaXMgY29tbWl0IGxvZyBjb3VsZCB1c2Ugc29tZSByZS1waGFyc2luZy4KPiBXaGF0IGlz
ICJJdCIgZXRjLgo+IAoKSSBjb3VsZCBkbyB0aGlzOgoKc3RydWN0IGRybV9mYl9oZWxwZXJfY3J0
YyBpcyBub3cganVzdCBhIHdyYXBwZXIgYXJvdW5kIGRybV9tb2RlX3NldCBzbwp1c2UgdGhhdCBk
aXJlY3RseSBpbnN0ZWFkIGFuZCBhdHRhY2ggaXQgYXMgYSBtb2Rlc2V0IGFycmF5IG9udG8KZHJt
X2NsaWVudF9kZXYuIGRybV9mYl9oZWxwZXIgd2lsbCB1c2UgdGhpcyBhcnJheSB0byBzdG9yZSBp
dHMgbW9kZXNldHMKd2hpY2ggbWVhbnMgaXQgd2lsbCBhbHdheXMgaW5pdGlhbGl6ZSBhIGRybV9j
bGllbnQsIGJ1dCBpdCB3aWxsIG5vdApyZWdpc3RlciB0aGUgY2xpZW50IChjYWxsYmFja3MpIHVu
bGVzcyBpdCdzIHRoZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbi4KCj4+IEBAIC01MzIsOCArNTM1
LDcgQEAgc3RhdGljIGludCByZXN0b3JlX2ZiZGV2X21vZGVfbGVnYWN5KHN0cnVjdCBkcm1fZmJf
aGVscGVyICpmYl9oZWxwZXIpCj4+ICAJCQkJCQkgICAgRFJNX01PREVfUk9UQVRFXzApOwo+PiAg
CX0KPj4gIAo+PiAtCWZvciAoaSA9IDA7IGkgPCBmYl9oZWxwZXItPmNydGNfY291bnQ7IGkrKykg
ewo+PiAtCQlzdHJ1Y3QgZHJtX21vZGVfc2V0ICptb2RlX3NldCA9ICZmYl9oZWxwZXItPmNydGNf
aW5mb1tpXS5tb2RlX3NldDsKPj4gKwlkcm1fY2xpZW50X2Zvcl9lYWNoX21vZGVzZXQobW9kZV9z
ZXQsIGNsaWVudCkgewo+PiAgCQlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSBtb2RlX3NldC0+Y3J0
YzsKPj4gIAo+PiAgCQlpZiAoY3J0Yy0+ZnVuY3MtPmN1cnNvcl9zZXQyKSB7Cj4gVGhpcyBmdW5j
dGlvbiByZXF1aXJlcyBtb2Rlc2V0X211dGV4IHRvIGJlIGhlbGQuIE1heWJlIGFkZCBjb21tZW50
Pwo+IAoKZHJtX2NsaWVudF9mb3JfZWFjaF9tb2Rlc2V0KCkgd2FybnMgaWYgaXQncyBub3QgaGVs
ZCAoY291cnRlc3kgb2YgRGFuaWVsClZldHRlcik6CgojZGVmaW5lIGRybV9jbGllbnRfZm9yX2Vh
Y2hfbW9kZXNldChtb2Rlc2V0LCBjbGllbnQpIFwKCWZvciAoKHsgbG9ja2RlcF9hc3NlcnRfaGVs
ZCgmKGNsaWVudCktPm1vZGVzZXRfbXV0ZXgpOyB9KSwgXAoJICAgICBtb2Rlc2V0ID0gKGNsaWVu
dCktPm1vZGVzZXRzOyBtb2Rlc2V0LT5jcnRjOyBtb2Rlc2V0KyspCgo+PiBAQCAtMTg0Miw3ICsx
ODA1LDcgQEAgc3RhdGljIGludCBwYW5fZGlzcGxheV9hdG9taWMoc3RydWN0IGZiX3Zhcl9zY3Jl
ZW5pbmZvICp2YXIsCj4+ICAKPj4gIAlwYW5fc2V0KGZiX2hlbHBlciwgdmFyLT54b2Zmc2V0LCB2
YXItPnlvZmZzZXQpOwo+PiAgCj4+IC0JcmV0ID0gcmVzdG9yZV9mYmRldl9tb2RlX2F0b21pYyhm
Yl9oZWxwZXIsIHRydWUpOwo+PiArCXJldCA9IHJlc3RvcmVfZmJkZXZfbW9kZV9mb3JjZShmYl9o
ZWxwZXIpOwo+IFRoaXMgY2hhbmdlIGxvb2tzIGFsaWVuIGNvbXBhcmVkIHRvIG90aGVyIGNoYW5n
ZXMuCj4gRG9lcyBpdCBiZWxvbmcgdG8gdGhpcyBwYXRjaHNldD8KPiAKCkl0J3MgZXhwbGFpbmVk
IGluIHRoZSBjb21taXQgbWVzc2FnZToKCkluIHBhbl9kaXNwbGF5X2F0b21pYygpIHJlc3RvcmVf
ZmJkZXZfbW9kZV9mb3JjZSgpIGlzIHVzZWQgaW5zdGVhZCBvZgpyZXN0b3JlX2ZiZGV2X21vZGVf
YXRvbWljKCkgYmVjYXVzZSB0aGF0IG9uZSB3aWxsIGxhdGVyIGJlY29tZSBpbnRlcm5hbAp0byBk
cm1fY2xpZW50X21vZGVzZXQuCgpOb3JhbGYuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
