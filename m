Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E276D41
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 17:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B62D6EDA9;
	Fri, 26 Jul 2019 15:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F35F6EDA9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 15:32:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 276842002D;
 Fri, 26 Jul 2019 17:32:54 +0200 (CEST)
Date: Fri, 26 Jul 2019 17:32:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: Demote panel timing not found error message
Message-ID: <20190726153252.GA24229@ravnborg.org>
References: <20190726101849.27322-1-thierry.reding@gmail.com>
 <CGME20190726113631epcas1p4159fcc746f1409b6b16c7912968b65d2@epcas1p4.samsung.com>
 <20190726113625.GC20065@ravnborg.org>
 <e9bf4cf5-f4de-0a3b-52f4-67f1ae7af5b9@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9bf4cf5-f4de-0a3b-52f4-67f1ae7af5b9@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Ikd4Dj_1AAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=7L-i-rEwBvqOcbVinyQA:9
 a=CjuIK1q_8ugA:10 a=4TTD80GP_VEA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmFydGxvbWllaiBab2xuaWVya2lld2ljego+IAo+IEhpIFNhbSwKPiAKPiBPbiA3LzI2LzE5
IDE6MzYgUE0sIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+IEhpIFRoaWVycnkuCj4gPiAKPiA+IE9u
IEZyaSwgSnVsIDI2LCAyMDE5IGF0IDEyOjE4OjQ5UE0gKzAyMDAsIFRoaWVycnkgUmVkaW5nIHdy
b3RlOgo+ID4+IEZyb206IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gPj4K
PiA+PiBGYWlsaW5nIHRvIGZpbmQgYSBwYW5lbC10aW1pbmcgbm9kZSBpcyBub3QgYW4gZXJyb3Ig
aW4gYWxsIGNhc2VzLCBzbyBkbwo+ID4+IG5vdCBvdXRwdXQgYW4gZXJyb3IgbWVzc2FnZSBpbiB0
aGF0IGNhc2UuIEluc3RlYWQgdHVybiBpdCBpbnRvIGEgZGVidWcKPiA+PiBtZXNzYWdlIGFuZCBt
YWtlIHRoZSBkcml2ZXJzIHRoYXQgY2FyZSBhYm91dCBpdCBvdXRwdXQgYW4gZXJyb3IgbWVzc2Fn
ZQo+ID4+IG9mIHRoZWlyIG93bi4KPiA+IAo+ID4gVGhpcyBpcyBtb3JlIG9yIGxlc3MgdGhlIHNh
bWUgYXMgYWxyZWFkeSBpbXBsbWVudGVkIGJ5IERvdWdsYXMgaGVyZToKPiA+IGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTEwNTMyNDMvCj4gPiAKPiA+IERvdWcncyBoYXMgYW4g
ZXh0cmEgYnVnLWZpeCB0aGF0IHdlIHNoYWxsIG5vdCBtaXNzLgo+ID4gCj4gPiBJIGFtIHdhaXRp
bmcgZm9yIGZlZWRiYWNrIGZyb20gQmFydGxvbWllaiBiZWZvcmUgcHJvY2VlZGluZy4KPiAKPiBU
aGUgcGF0Y2hzZXQgaXMgaW4gZHJtLW1pc2MtbmV4dCB0cmVlIG5vdy4KPiAKPiA+IEkgZ3Vlc3Mg
aGUgaXMgb24gaG9saWRheSBzb21ld2hlcmUgYW5kIHdpbGwgcmV0dXJuIHNvb24uCj4gCj4gSSB3
aXNoIGl0IHdhcyB0aGUgY2FzZS4gOy0pCldlbGwsIHRvbyBob3QgaGVyZSBmb3Igd29yayBhdG0u
IEJ1dCB0aGUgZmFybWVycyBhcmUgaGFwcHkuCgpDYW4geW91IG1heWJlIGZpbmQgdGltZSB0byBy
ZXNwb25kIHRvIHRoaXMgcGF0Y2g6Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hp
dmVzL2RyaS1kZXZlbC8yMDE5LUp1bHkvMjI4MDUxLmh0bWwKCkl0IGFscmVhZHkgZ290IGFjayBm
cm9tIGJhY2tsaWd0IHBlb3BsZSwgYnV0IGFzIGl0IHRvdWNoZXMgZmJkZXYKeW91ciBmZWVkYmFj
ayBpcyByZXF1aXJlZCB0b28uCgpUaGFua3MsCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
