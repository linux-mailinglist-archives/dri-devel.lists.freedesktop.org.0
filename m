Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F223D846
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 11:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F866E89F;
	Thu,  6 Aug 2020 09:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 36C9B6E8A1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 09:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 764C82A6042;
 Thu,  6 Aug 2020 11:05:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id qrgwaclRLv9j; Thu,  6 Aug 2020 11:05:13 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 09C882A6016;
 Thu,  6 Aug 2020 11:05:13 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1k3bpo-000PEs-Er; Thu, 06 Aug 2020 11:05:12 +0200
Subject: Re: [2/2] drm/ttm: make TT creation purely optional v3
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20200629151925.2096-2-christian.koenig@amd.com>
 <a1ba1387-1270-32e3-960f-f98495d92c11@daenzer.net>
 <03df2698-293b-2dff-923a-f8c731f55dec@gmail.com>
 <b818b065-50cd-9e8a-3cff-01dd124a04c4@daenzer.net>
 <8d5809be-104d-40e8-e8bb-5186d5b565b5@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <0ee49463-84d7-5150-a68c-57a1da7b5efb@daenzer.net>
Date: Thu, 6 Aug 2020 11:05:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <8d5809be-104d-40e8-e8bb-5186d5b565b5@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOC0wNiAxMDo0MyBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDA2
LjA4LjIwIHVtIDEwOjAxIHNjaHJpZWIgTWljaGVsIETDpG56ZXI6Cj4+IE9uIDIwMjAtMDgtMDYg
OToxMyBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gQW0gMDUuMDguMjAgdW0gMTg6
MTYgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPj4+PiBPbiAyMDIwLTA2LTI5IDU6MTkgcC5tLiwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gV2Ugb25seSBuZWVkIHRoZSBwYWdlIGFycmF5
IHdoZW4gdGhlIEJPIGlzIGFib3V0IHRvIGJlIGFjY2Vzc2VkLgo+Pj4+Pgo+Pj4+PiBTbyBub3Qg
b25seSBwb3B1bGF0ZSwgYnV0IGFsc28gY3JlYXRlIGl0IG9uIGRlbWFuZC4KPj4+Pj4KPj4+Pj4g
djI6IG1vdmUgTlVMTCBjaGVjayBpbnRvIHR0bV90dF9jcmVhdGUoKQo+Pj4+PiB2MzogZml4IHRo
ZSBvY2N1cnJlbmNlIGluIHR0bV9ib19rbWFwX3R0bSBhcyB3ZWxsCj4+Pj4gVGhpcyBicm9rZSBh
bWRncHUgdXNlcnB0ciBmdW5jdGlvbmFsaXR5IGZvciBtZSwgaW4gcGFydGljdWxhciBhbGwKPj4+
PiBHTF9BTURfcGlubmVkX21lbW9yeSBwaWdsaXQgdGVzdHMsIGUuZy4KPj4+Pgo+Pj4+IC4uLi9w
aWdsaXQvYmluL2FtZF9waW5uZWRfbWVtb3J5IGRlY3JlbWVudC1vZmZzZXQgLWF1dG8gLWZibwo+
Pj4+IE9mZnNldCBpcyBkZWNyZW1lbnRlZCwgbm8gd2FpdC4KPj4+PiBNZXNhOiBVc2VyIGVycm9y
OiBHTF9JTlZBTElEX09QRVJBVElPTiBpbiBnbEJ1ZmZlckRhdGEKPj4+PiBbLi4uXQo+Pj4+IFVu
ZXhwZWN0ZWQgR0wgZXJyb3I6IEdMX0lOVkFMSURfT1BFUkFUSU9OIDB4NTAyCj4+Pj4gKEVycm9y
IGF0IHRlc3RzL3NwZWMvYW1kX3Bpbm5lZF9tZW1vcnkvdGVzdC5jOjIxNCkKPj4+PiBQSUdMSVQ6
IHsicmVzdWx0IjogImZhaWwiIH0KPj4+IEJ1dCBubyBjcmFzaGVzPyBJIHdvdWxkIGhhdmUgZXhw
ZWN0ZWQgYSBOVUxMIHBvaW50ZXIgZGVyZWYgaWYgd2UgaGF2ZQo+Pj4gbWlzc2VkIGNhbGwgcGF0
aC4KPj4gTm8gY3Jhc2hlcy4gU2luY2UgYSBHTCBlcnJvciBpcyByYWlzZWQsIG15IGd1ZXNzIHdv
dWxkIGJlIHRoYXQgYW4gaW9jdGwKPj4gd2hpY2ggd2FzIHByZXZpb3VzbHkgc3VjY2VlZGluZyBp
cyBub3cgcmV0dXJuaW5nIGFuIGVycm9yLgo+IAo+IE1obSwgSSBjYW4gcmVwcm9kdWNlIHRoZSBw
cm9ibGVtIHRoYXQgdXNlcnB0cnMgZG9lc24ndCB3b3JrIGFueSBtb3JlLgo+IEJ1dCBldmVuIHdp
dGggdGhlIG1lbnRpb25lZCBwYXRjaCByZXZlcnRlZCB0aGF0IHN0aWxsIGRvZXNuJ3Qgd29yayBv
bgo+IHRoZSB0aXAgb2YgZHJtLW1pc2MtbmV4dC4KCk1heWJlIHRoZXJlIGFyZSBvdGhlciBjaGFu
Z2VzIGFmZmVjdGluZyBpdCBhcyB3ZWxsLCBlLmcuCgplMDRiZTIzMTBiNWUgImRybS90dG06IGZ1
cnRoZXIgY2xlYW51cCB0dG1fbWVtX3JlZyBoYW5kbGluZyIKMWU2OTFlMjQ0NDg3ICJkcm0vYW1k
Z3B1OiBzdG9wIGFsbG9jYXRpbmcgZHVtbXkgR1RUIG5vZGVzIgoKY29tZSB0byBtaW5kLgoKCj4g
QXJlIHlvdSBzdXJlIHlvdXIgYmlzZWN0aW5nIGlzIHJpZ2h0PwoKRmFpcmx5IHN1cmUuIElmIHRo
YXQgY29tbWl0IHdvcmtzIG9yIGl0cyBwYXJlbnQgZG9lc24ndCB3b3JrIGZvciB5b3UsIEkKY2Fu
IHJldHJ5LgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAg
ICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3Qg
ICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
