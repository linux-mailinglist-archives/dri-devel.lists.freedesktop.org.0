Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F280A6F9FC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD20E89B9F;
	Mon, 22 Jul 2019 07:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from chill.innovation.ch (chill.innovation.ch
 [IPv6:2001:470:1:5ba:222:15ff:fecf:4ca5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4695F89B57
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 07:22:14 +0000 (UTC)
Date: Sun, 21 Jul 2019 00:22:11 -0700
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch F0A56640132
From: "Life is hard, and then you die" <ronald@innovation.ch>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm: bridge: DRM_SIL_SII8620 should depend on, not
 select INPUT
Message-ID: <20190721072211.GB7992@innovation.ch>
References: <CGME20190701033927epcas2p2d7d0b611a0d32b7b208acc787069a83a@epcas2p2.samsung.com>
 <8baa25c0-498b-d321-4e6a-fe987a4989ba@infradead.org>
 <a7edece4-fec4-5811-27a9-ca6c275a4c40@samsung.com>
 <d01a9ad5-edcd-81ec-6528-9b6a4e9a8754@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d01a9ad5-edcd-81ec-6528-9b6a4e9a8754@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 22 Jul 2019 07:08:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=innovation.ch; s=default; t=1563693731;
 bh=N+DAdWoheHn2b/cFIDXbfLsH1bX5Od7/izI9Zu/NVbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nj9KSuzhGp7+oX7JgCKiiahCdEOnbp5cqo+ObVuqcoHKYc9EeCL5J4aAgDuWwYAVC
 KV0kTCx6IIKf/saxRnfJvExIBM11LzJJjB1dAtFzf1XGgpmdR/ERu8+o+Otxsj+KWE
 CiMiZE3iQhXuZXb/hkwy0xxHp6yXL9uYwhPabMCH5l7l8WsMMs4xucXcF61MUVlDPQ
 XJnuoZipfPSDJODibTAMTh4thhLX5IYW+aoXzKevIdUMx/zt1kXIOQf6GC/rzr5U+R
 tkiSrjstYJVB6U5dZiUqnTJNCv/7fifupgueFEUKmhJ1odCtgMFFyBReizqocF0ByA
 14Ckbj7SMG2fw==
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CiAgSGkgQW5kcnplaiwKCk9uIE1vbiwgSnVsIDAxLCAyMDE5IGF0IDExOjI2OjI1QU0gKzAyMDAs
IEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4gT24gMDEuMDcuMjAxOSAxMToyMywgQW5kcnplaiBIYWpk
YSB3cm90ZToKPiA+IE9uIDAxLjA3LjIwMTkgMDU6MzksIFJhbmR5IER1bmxhcCB3cm90ZToKPiA+
PiBGcm9tOiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KPiA+Pgo+ID4+IEEg
c2luZ2xlIGRyaXZlciBzaG91bGQgbm90IGVuYWJsZSAoc2VsZWN0KSBhbiBlbnRpcmUgc3Vic3lz
dGVtLAo+ID4+IHN1Y2ggYXMgSU5QVVQsIHNvIGNoYW5nZSB0aGUgJ3NlbGVjdCcgdG8gImRlcGVu
ZHMgb24iLgo+ID4+Cj4gPj4gRml4ZXM6IGQ2YWJlNmRmNzA2YyAoImRybS9icmlkZ2U6IHNpbF9z
aWk4NjIwOiBkbyBub3QgaGF2ZSBhIGRlcGVuZGVuY3kgb2YgUkNfQ09SRSIpCj4gPj4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KPiA+PiBD
YzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgo+ID4+IENjOiBBbmRyemVqIEhhamRh
IDxhLmhhamRhQHNhbXN1bmcuY29tPgo+ID4+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiA+PiAtLS0KPiA+PiBMaW51cyBoYXMgd3JpdHRlbiB0aGlzIGEgY291cGxl
IG9mIHRpbWVzIGluIHRoZSBsYXN0IDE1IHllYXJzIG9yIHNvLAo+ID4+IGJ1dCBteSBzZWFyY2gg
ZnUgY2Fubm90IGZpbmQgaXQuICBBbmQgdGhlcmUgYXJlIGEgZmV3IGRyaXZlcnMgaW4gdGhlCj4g
Pj4ga2VybmVsIHRyZWUgdGhhdCBkbyB0aGlzLCBidXQgd2Ugc2hvdWxkbid0IGJlIGFkZGluZyBt
b3JlIHRoYXQgZG8gc28uCj4gPgo+ID4gVGhlIHByb3BlciBzb2x1dGlvbiBoYXMgYmVlbiBhbHJl
YWR5IHBvc3RlZCBbMV0sIGJ1dCBpdCBoYXMgbm90IGJlZW4KPiA+IGFwcGxpZWQgeWV0IHRvIGlu
cHV0IHRyZWU/Cj4gPgo+ID4gUmFuZHkgYXJlIHRoZXJlIGNoYW5jZXMgeW91ciBwYXRjaHNldCB3
aWxsIGFwcGVhciBpbiBNTCBpbiBuZWFyIGZ1dHVyZSwKPiA+IG9yIHNob3VsZCBJIG1lcmdlIHlv
dXIgc2lpODYyMCBwYXRjaCBhbG9uZT8KPiAKPiAKPiBVcHMsIEkgdXNlZCB3cm9uZyBzdXJuYW1l
LCBJIG1lYW50IFJvbmFsZCwgYWRkZWQgaGltIGlucHV0IE1MIHRvIGNjLgoKTG9va3MgbGlrZSB0
aGUgYXBwbGVzcGkgcGF0Y2hlcyBnb3QgbWVyZ2VkLCBidXQgdGhleSB3ZXJlIGNoYW5nZWQgYXQK
dGhlIGxhc3QgbWludXRlIHRvIHJlbW92ZSB0aGUgaW1wbHkncyB0aGF0IGxlYWQgdG8gdGhlIEtj
b25maWcKZGVwZW5kZW5jeSBvbiB0aGUgY2hhbmdlcyBoZXJlLiBBbmQgSSdtIGd1ZXNzaW5nIGZv
ciB0aGF0IHJlYXNvbiB0aGUKcGF0Y2ggWzFdIHdhcyBub3Qgc2VudCB3aXRoIHRoYXQgcHVsbCBy
ZXF1ZXN0IGluIHRoZSBlbmQuCgpJbiBzaG9ydCBpdCBzZWVtcyB0byBtZSB0aGF0IGl0IHdvdWxk
IGJlIGJlc3Qgbm93IGlmIHlvdSBzZW50IGEgcHVsbApyZXF1ZXN0IGZvciBwYXRjaCBbMV0gYW5k
IEFybmQgQmVyZ21hbm4ncyBmb2xsb3d1cCBwYXRjaCB0aGF0IHdhcwpkaXNjdXNzZWQgaW4gdGhl
IGxhc3QgZmV3IGRheXMgWzJdLiBTb3JyeSBmb3IgYWxsIHRoZSBkZWxheS4KCgogIENoZWVycywK
CiAgUm9uYWxkCgoKPiA+IFsxXToKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAx
OTA0MTkwODE5MjYuMTM1NjctMi1yb25hbGRAaW5ub3ZhdGlvbi5jaC8KClsyXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzIwMTkwNzE4MTM0MjQwLjIyNjU3MjQtMS1hcm5kQGFybmRiLmRl
LwoKCj4gPiBSZWdhcmRzCj4gPgo+ID4gQW5kcnplago+ID4KPiA+Cj4gPgo+ID4+ICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL0tjb25maWcgfCAgICAzICstLQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiAtLS0gbG54LTUyLXJjNy5v
cmlnL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+ID4+ICsrKyBsbngtNTItcmM3L2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+ID4+IEBAIC04MywxMCArODMsOSBAQCBjb25m
aWcgRFJNX1BBUkFERV9QUzg2MjIKPiA+PiAgCj4gPj4gIGNvbmZpZyBEUk1fU0lMX1NJSTg2MjAK
PiA+PiAgCXRyaXN0YXRlICJTaWxpY29uIEltYWdlIFNJSTg2MjAgSERNSS9NSEwgYnJpZGdlIgo+
ID4+IC0JZGVwZW5kcyBvbiBPRgo+ID4+ICsJZGVwZW5kcyBvbiBPRiAmJiBJTlBVVAo+ID4+ICAJ
c2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gPj4gIAlpbXBseSBFWFRDT04KPiA+PiAtCXNlbGVjdCBJ
TlBVVAo+ID4+ICAJc2VsZWN0IFJDX0NPUkUKPiA+PiAgCWhlbHAKPiA+PiAgCSAgU2lsaWNvbiBJ
bWFnZSBTSUk4NjIwIEhETUkvTUhMIGJyaWRnZSBjaGlwIGRyaXZlci4KPiA+Pgo+ID4+Cj4gPj4K
PiA+Pgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
