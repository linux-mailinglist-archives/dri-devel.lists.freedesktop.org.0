Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635726CCDC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 12:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956946E37C;
	Thu, 18 Jul 2019 10:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EB46E373;
 Thu, 18 Jul 2019 10:37:32 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0121980335;
 Thu, 18 Jul 2019 12:37:27 +0200 (CEST)
Date: Thu, 18 Jul 2019 12:37:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] vt: Grab console_lock around con_is_bound in show_bind
Message-ID: <20190718103726.GA17341@ravnborg.org>
References: <20190718080903.22622-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718080903.22622-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=ag1SF4gXAAAA:8
 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8 a=II7inwo8ijMyP0ieMOUA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=cvBusfyB2V15izCimMoJ:22
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
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, linux-s390@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Adam Borowski <kilobyte@angband.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Hostettler <textshell@uchuujin.de>,
 Mikulas Patocka <mpatocka@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Jens Remus <jremus@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKUGF0Y2ggbG9va3MgZ29vZC4gWW91IGNhbiBhZGQgbXk6CkFja2VkLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgpGb3IgZ29vZCBtZWFzdXJlIEkgY2hlY2tl
ZCBhbGwgb3RoZXIgdXNlcnMgb2YgY29uX2lzX2JvdW5kKCkKYW5kIHRoZXkgbG9va2VkIGdvb2Qg
ZnJvbSBhIGxvY2tpbmcgcGVyc3BlY3RpdmUuClRoZW4gSSBsb29rZWQgYSBiaXQgbW9yZSBmb3Ig
bWlzc2luZyBsb2NraW5nIGFuZCBsb3N0CnRoZSBvdmVydmlldy4KCk9uIFRodSwgSnVsIDE4LCAy
MDE5IGF0IDEwOjA5OjAzQU0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gTm90IHJlYWxs
eSBoYXJtZnVsIG5vdCB0bywgYnV0IGFsc28gbm90IGhhcm0gaW4gZ3JhYmJpbmcgdGhlIGxvY2su
IEFuZAo+IHRoaXMgc2h1dHMgdXAgYSBuZXcgV0FSTklORyBJIGludHJvZHVjZWQgaW4gY29tbWl0
IGRkZGUzYzE4YjcwMCAoInZ0Ogo+IE1vcmUgbG9ja2luZyBjaGVja3MiKS4KCk1heWJlIGFkZCB0
aGUgd2FybmluZyB0aGF0IEplbnMgcmVwb3J0ZWQgdG8gdGhlIGNoYW5nZWxvZywgaW4gY2FzZQpz
b21lb25lIGhpdHMgc29tZXRoaW5nIHRoYXQgbG9va3MgbGlrZSB0aGlzIHdhcm5pbmcuCk1haW5s
eSBmb3IgZ29vZ2xlIGZvZGRlciwgYnV0IGFsc28gaW4gY2FzZSBjaGFuZ2Vsb2dzIGFyZSBzZWFy
Y2hlZC4KCglTYW0KPiAKPiBSZXBvcnRlZC1ieTogSmVucyBSZW11cyA8anJlbXVzQGxpbnV4Lmli
bS5jb20+Cj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcK
PiBDYzogbGludXgtczM5MEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFu
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBDYzogTmljb2xhcyBQaXRyZSA8bmljb2xh
cy5waXRyZUBsaW5hcm8ub3JnPgo+IENjOiBNYXJ0aW4gSG9zdGV0dGxlciA8dGV4dHNoZWxsQHVj
aHV1amluLmRlPgo+IENjOiBBZGFtIEJvcm93c2tpIDxraWxvYnl0ZUBhbmdiYW5kLnBsPgo+IENj
OiBNaWt1bGFzIFBhdG9ja2EgPG1wYXRvY2thQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KPiAtLS0KPiAgZHJpdmVycy90dHkvdnQvdnQuYyB8IDYgKysrKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy90dHkvdnQvdnQuYyBiL2RyaXZlcnMvdHR5L3Z0L3Z0LmMKPiBpbmRleCBlYzky
ZjM2YWI1YzQuLjM0YWEzOWQxYWVkOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3R0eS92dC92dC5j
Cj4gKysrIGIvZHJpdmVycy90dHkvdnQvdnQuYwo+IEBAIC0zNzcxLDcgKzM3NzEsMTEgQEAgc3Rh
dGljIHNzaXplX3Qgc2hvd19iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9h
dHRyaWJ1dGUgKmF0dHIsCj4gIAkJCSBjaGFyICpidWYpCj4gIHsKPiAgCXN0cnVjdCBjb25fZHJp
dmVyICpjb24gPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiAtCWludCBiaW5kID0gY29uX2lzX2Jv
dW5kKGNvbi0+Y29uKTsKPiArCWludCBiaW5kOwo+ICsKPiArCWNvbnNvbGVfbG9jaygpOwo+ICsJ
YmluZCA9IGNvbl9pc19ib3VuZChjb24tPmNvbik7Cj4gKwljb25zb2xlX3VubG9jaygpOwo+ICAK
PiAgCXJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIiVpXG4iLCBiaW5kKTsKPiAgfQo+
IC0tIAo+IDIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
