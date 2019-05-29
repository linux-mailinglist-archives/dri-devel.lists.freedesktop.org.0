Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6452D7CA
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 10:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4605C6E09A;
	Wed, 29 May 2019 08:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9846E09A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 08:28:29 +0000 (UTC)
X-UUID: 725f9bdff6c840129cdc26316ed95433-20190529
X-UUID: 725f9bdff6c840129cdc26316ed95433-20190529
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1005367912; Wed, 29 May 2019 16:28:18 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 May 2019 16:28:16 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 29 May 2019 16:28:16 +0800
Message-ID: <1559118496.4226.11.camel@mtksdaap41>
Subject: Re: [PATCH 1/3] drm: mediatek: fix unbind functions
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 29 May 2019 16:28:16 +0800
In-Reply-To: <CAJMQK-jDhDNViUA3dpixG=_Pe7x0qH4utBWy3k+D_+oKwEOPig@mail.gmail.com>
References: <20190527045054.113259-1-hsinyi@chromium.org>
 <20190527045054.113259-2-hsinyi@chromium.org>
 <1559093711.11380.6.camel@mtksdaap41>
 <CAJMQK-jDhDNViUA3dpixG=_Pe7x0qH4utBWy3k+D_+oKwEOPig@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A023916AAC1D56E857E7DE6AAAEAA623764789450FCB15420F9FB9F4341CEE5A2000:8
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

SGksIEhzaW4tWWk6CgpPbiBXZWQsIDIwMTktMDUtMjkgYXQgMTU6MDYgKzA4MDAsIEhzaW4tWWkg
V2FuZyB3cm90ZToKPiBPbiBXZWQsIE1heSAyOSwgMjAxOSBhdCA5OjM1IEFNIENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+IHdyb3RlOgo+IAo+ID4KPiA+IEkgdGhpbmsgbXRrX2RzaV9kZXN0cm95
X2Nvbm5fZW5jKCkgaGFzIG11Y2ggdGhpbmcgdG8gZG8gYW5kIEkgd291bGQgbGlrZQo+ID4geW91
IHRvIGRvIG1vcmUuIFlvdSBjb3VsZCByZWZlciB0byBbMl0gZm9yIGNvbXBsZXRlIGltcGxlbWVu
dGF0aW9uLgo+ID4KPiA+IFsyXQo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2RzaS5jP2g9djUuMi1yYzIjbjE1NzUKPiA+Cj4gSGkgQ0ssCj4gCj4g
U2luY2UgZHJtX2VuY29kZXJfY2xlYW51cCgpIHdvdWxkIGFscmVhZHkgY2FsbCBkcm1fYnJpZGdl
X2RldGFjaCgpIHRvCj4gZGV0YWNoIGJyaWRnZSwgSSB0aGluayB3ZSBvbmx5IG5lZWQgdG8gaGFu
ZGxlIHBhbmVsIGNhc2UgaGVyZS4KPiBXZSBkb24ndCBuZWVkIHRvIGNhbGwgbXRrX2RzaV9lbmNv
ZGVyX2Rpc2FibGUoKSBzaW5jZQo+IG10a19vdXRwdXRfZHNpX2Rpc2FibGUoKSBpcyBjYWxsZWQg
aW4gbXRrX2RzaV9yZW1vdmUoKSBhbmQKPiBkc2ktPmVuYWJsZWQgd2lsbCBiZSBzZXQgdG8gZmFs
c2UuIENhbGxpbmcgc2Vjb25kIHRpbWUgd2lsbCBqdXN0Cj4gcmV0dXJucyBpbW1lZGlhdGVseS4K
PiBTbywgYmVzaWRlcyBzZXR0aW5nCj4gCj4gZHNpLT5wYW5lbCA9IE5VTEw7Cj4gZHNpLT5jb25u
LnN0YXR1cyA9IGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVkOwoKU29ycnksIEkgdGhpbmsg
eW91ciBvcmlnaW5hbCBwYXRjaCBpcyBnb29kIGVub3VnaCwgYW5kIHlvdSBuZWVkIG5vdCB0bwpk
byB0aGUgYmVzaWRlcyBzZXR0aW5nLgoKUmVnYXJkcywKQ0sKCj4gCj4gYXJlIHRoZXJlIG90aGVy
IHRoaW5ncyB3ZSBuZWVkIHRvIGRvIGhlcmU/Cj4gCj4gT3JpZ2luYWwgY29kZSBkb2Vzbid0IGhh
dmUgZHJtX2ttc19oZWxwZXJfaG90cGx1Z19ldmVudCgpLCBhbmQgSSdtIG5vdAo+IHN1cmUgaWYg
bXRrIGRzaSB3b3VsZCBuZWVkIHRoaXMuCj4gQWxzbywgbXRrX2RzaV9zdG9wKCkgd291bGQgYWxz
byBzdG9wIGlycS4KPiAKPiBUaGFua3MKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
