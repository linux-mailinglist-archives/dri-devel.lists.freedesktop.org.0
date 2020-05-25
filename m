Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF321E1287
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 18:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60778980C;
	Mon, 25 May 2020 16:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D07B8980C;
 Mon, 25 May 2020 16:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 8D7B62A6042;
 Mon, 25 May 2020 18:19:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Gzej55Gi-fd4; Mon, 25 May 2020 18:19:36 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 0CB3A2A6016;
 Mon, 25 May 2020 18:19:36 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jdFp9-000RLb-3M; Mon, 25 May 2020 18:19:35 +0200
Subject: Re: Adaptive Sync enabling in Xorg Modesetting driver
To: uday kiran pichika <udaykiran.pichika@gmail.com>
References: <CAGcx_0Yu4D6F2BiPp5CnJhMyrupGsnFnzEH0-Gv=8rFuVtDi+w@mail.gmail.com>
 <53679f9b-4d81-cb46-72bb-02ca05fb303f@daenzer.net>
 <CAGcx_0Z3JhUP_2KpfC0JQZeugd6VfDSYeErMSZMVVA8sogUt+A@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <f7b36e27-d7de-80e6-c5a7-1aba198c4036@daenzer.net>
Date: Mon, 25 May 2020 18:19:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAGcx_0Z3JhUP_2KpfC0JQZeugd6VfDSYeErMSZMVVA8sogUt+A@mail.gmail.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0yNSA0OjU4IHAubS4sIHVkYXkga2lyYW4gcGljaGlrYSB3cm90ZToKPiBUaGFu
a3MgTWljaGVsLi4KPiAKPiBzb3JyeSBpZiBteSBkZXNjcmlwdGlvbiBpcyBub3QgY2xlYXIuCj4g
WWVzIEkgaGF2ZSB1c2VkIHdpdGggZ2x4Z2VhcnMgaW4gZnVsbHNjcmVlbiBtb2RlIGFuZCBhbHNv
IGEgc2ltcGxlIGdseGFwcAo+IHdoaWNoIGFjdHVhbGx5IG9wZW5zIGluIGZ1bGxzY3JlZW4gYnkg
ZGVmYXVsdC4KPiAKPiBJbiBib3RoIHRoZSBjYXNlcywgdGhlIGlzc3VlIGlzIHNhbWUuCj4gCj4g
SnVzdCB3YW50ZWQgdG8ga25vdyBpZiBBTUQgaGFzIGRvbmUgYW55dGhpbmcgZGlmZmVyZW50IGFw
YXJ0IGZyb20gdGhlCj4gY29uZmlndXJhdGlvbnMgZWl0aGVyIGluIE1FU0Egb3IgaW4gaXRzIFJh
ZGVvbiBkcml2ZXIgPwoKVGhlIGNvZGUgeW91IGNhbiBzZWUgaW4geGY4Ni12aWRlby1hbWRncHUg
YW5kIE1lc2EgaXMgd29ya2luZyBmb3IgbG90cwpvZiBwZW9wbGUsIG1vc3Qgb2YgdGhlbSBvdXRz
aWRlIG9mIEFNRC4KCgpJIHRoaW5rIEkndmUgc3BvdHRlZCBvbmUgYnVnIGluIHlvdXIgY2hhbmdl
cywgaW4gbXNfcHJlc2VudF9jaGVja191bmZsaXA6CgogICAgaWYgKG1zLT5kcm1tb2RlLnNwcml0
ZXNfdmlzaWJsZSA+IDApCiAgICAgICAgbXMtPmZsaXBfd2luZG93ID0gd2luZG93OwoKbXNfcHJl
c2VudF9jaGVja19mbGlwIGhhczoKCiAgICBpZiAobXMtPmRybW1vZGUuc3ByaXRlc192aXNpYmxl
ID4gMCkKICAgICAgICByZXR1cm4gRkFMU0U7CgogICAgcmV0dXJuIG1zX3ByZXNlbnRfY2hlY2tf
dW5mbGlwKGNydGMsIHdpbmRvdywgcGl4bWFwLCBzeW5jX2ZsaXAsIHJlYXNvbik7CgpTbyB0aGUg
Y29uZGl0aW9uIGNhbiBuZXZlciBiZSB0cnVlIGluIG1zX3ByZXNlbnRfY2hlY2tfdW5mbGlwLCBh
bmQgaXQKbmV2ZXIgdXBkYXRlcyBtcy0+ZmxpcF93aW5kb3cuCgoKLS0gCkVhcnRobGluZyBNaWNo
ZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5j
b20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1l
c2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
