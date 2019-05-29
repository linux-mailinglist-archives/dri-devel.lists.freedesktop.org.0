Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 373012D611
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 09:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6280E6E088;
	Wed, 29 May 2019 07:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24A76E088
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 07:17:58 +0000 (UTC)
X-UUID: 73955fc45ed844b99226497a96ed2407-20190529
X-UUID: 73955fc45ed844b99226497a96ed2407-20190529
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1270081599; Wed, 29 May 2019 15:12:37 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 May 2019 15:12:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 29 May 2019 15:12:35 +0800
Message-ID: <1559113955.4226.1.camel@mtksdaap41>
Subject: Re: [PATCH 2/3] drm: mediatek: remove clk_unprepare() in
 mtk_drm_crtc_destroy()
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 29 May 2019 15:12:35 +0800
In-Reply-To: <CAJMQK-gQ_j4ma_EjGbFJOz6WGXy3UZA0F9JZYnFHPZ0F08rXog@mail.gmail.com>
References: <20190527045054.113259-1-hsinyi@chromium.org>
 <20190527045054.113259-3-hsinyi@chromium.org>
 <1559109490.15592.6.camel@mtksdaap41>
 <CAJMQK-gQ_j4ma_EjGbFJOz6WGXy3UZA0F9JZYnFHPZ0F08rXog@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpPbiBXZWQsIDIwMTktMDUtMjkgYXQgMTQ6MDggKzA4MDAsIEhzaW4tWWkg
V2FuZyB3cm90ZToKPiBPbiBXZWQsIE1heSAyOSwgMjAxOSBhdCAxOjU4IFBNIENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+IHdyb3RlOgo+ID4KPiA+IEhpLCBIc2luLVlpOgo+ID4KPiA+IE9uIE1v
biwgMjAxOS0wNS0yNyBhdCAxMjo1MCArMDgwMCwgSHNpbi1ZaSBXYW5nIHdyb3RlOgo+ID4gPiBU
aGVyZSBpcyBubyBjbGtfcHJlcGFyZSgpIGNhbGxlZCBpbiBtdGtfZHJtX2NydGNfcmVzZXQoKSwg
d2hlbiB1bmJpbmRpbmcKPiA+ID4gZHJtIGRldmljZSwgbXRrX2RybV9jcnRjX2Rlc3Ryb3koKSB3
aWxsIGJlIHRyaWdnZXJlZCwgYW5kIHRoZSBjbG9ja3Mgd2lsbAo+ID4gPiBiZSBkaXNhYmxlZCBh
bmQgdW5wcmVwYXJlZCBpbiBtdGtfY3J0Y19kZHBfY2xrX2Rpc2FibGUuIElmIGNsa191bnByZXBh
cmUoKQo+ID4gPiBpcyBjYWxsZWQgaGVyZSwgd2UnbGwgZ2V0IHdhcm5pbmdzWzFdLCBzbyByZW1v
dmUgY2xrX3VucHJlcGFyZSgpIGhlcmUuCj4gPgo+ID4gSW4gb3JpZ2luYWwgY29kZSwgY2xrX3By
ZXBhcmUoKSBpcyBjYWxsZWQgaW4gbXRrX2RybV9jcnRjX2NyZWF0ZSgpIGFuZAo+ID4gY2xrX3Vu
cHJlcGFyZSgpIGlzIGNhbGxlZCBpbiBtdGtfZHJtX2NydGNfZGVzdHJveSgpLiBUaGlzIGxvb2tz
IGNvcnJlY3QuCj4gCj4gY2xrX3ByZXBhcmUoKSBpcyByZW1vdmVkIGluIGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA4NzI3NzcvLgo+IAoKSSB0aGluayB0aGlzIHBhdGNoIGlz
IGEgZml4IG9mIHRoYXQgcGF0Y2gsIGFuZCBJJ3ZlIGFscmVhZHkgYXBwbGllZCB0aGF0CnBhdGNo
LCBzbyBJIG1lcmdlIHRoaXMgcGF0Y2ggd2l0aCB0aGF0IHBhdGNoIGluIG15IHRyZWUgWzFdLCB0
aGFua3MuCgpbMV0KaHR0cHM6Ly9naXRodWIuY29tL2NraHUtbWVkaWF0ZWsvbGludXguZ2l0LXRh
Z3MvY29tbWl0LzkzN2Y4NjFkZWYxYTFkNDlhYmI5MmUwNDFlZmFhNWMyNTkyODFmYmYKClJlZ2Fy
ZHMsCkNLCgo+ID4gSSBkb24ndCBrbm93IHdoeSB3ZSBzaG91bGQgZG8gYW55IHRoaW5nIGFib3V0
IGNsb2NrIGluCj4gPiBtdGtfZHJtX2NydGNfcmVzZXQoKS4gVG8gZGVidWcgdGhpcywgdGhlIGZp
cnN0IHN0ZXAgaXMgdG8gcHJpbnQgbWVzc2FnZQo+ID4gd2hlbiBtZWRpYXRlayBkcm0gY2FsbCBj
bGtfcHJlcGFyZSgpIGFuZCBjbGtfdW5wcmVwYXJlKCkuIElmIHRoZXNlIHR3bwo+ID4gaW50ZXJm
YWNlIGlzIGNhbGxlZCBpbiBwYWlyLCBJIHRoaW5rIHdlIHNob3VsZCBub3QgbW9kaWZ5IG1lZGlh
dGVrIGRybQo+ID4gZHJpdmVyLCB0aGUgYnVnIG1heWJlIGluIGNsb2NrIGRyaXZlci4KPiA+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
