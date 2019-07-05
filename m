Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9994A5FF57
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 03:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B416E3EF;
	Fri,  5 Jul 2019 01:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [216.200.240.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9528D6E3EE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 01:35:38 +0000 (UTC)
X-UUID: 27620e949d0c4445b1dce6282ae5c56c-20190704
X-UUID: 27620e949d0c4445b1dce6282ae5c56c-20190704
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1737695922; Thu, 04 Jul 2019 17:35:33 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 4 Jul 2019 18:35:32 -0700
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 5 Jul 2019 09:35:30 +0800
Message-ID: <1562290530.10428.6.camel@mtksdaap41>
Subject: Re: [PATCH v5 08/12] dt-bindings: mediatek: Change the binding for
 mmsys clocks
From: CK Hu <ck.hu@mediatek.com>
To: Ulrich Hecht <uli@fpond.eu>
Date: Fri, 5 Jul 2019 09:35:30 +0800
In-Reply-To: <100944512.353257.1562254420397@webmail.strato.com>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
 <20181116125449.23581-9-matthias.bgg@kernel.org>
 <20181116231522.GA18006@bogus>
 <2a23e407-4cd4-2e2b-97a5-4e2bb96846e0@gmail.com>
 <CAL_JsqKJQwfDJbpmwW+oCxiDkSp5+6mG-uoURmCQVEMP_jFOEg@mail.gmail.com>
 <154281878765.88331.10581984256202566195@swboyd.mtv.corp.google.com>
 <458178ac-c0fc-9671-7fc8-ed2d6f61424c@suse.com>
 <154356023767.88331.18401188808548429052@swboyd.mtv.corp.google.com>
 <a229bfc7-683f-5b0d-7b71-54f934de6214@suse.com>
 <1561953318.25914.9.camel@mtksdaap41>
 <84d1c444-d6cb-9537-1bf5-b4e736443239@gmail.com>
 <100944512.353257.1562254420397@webmail.strato.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>,
 David Airlie <airlied@linux.ie>, Michael
 Turquette <mturquette@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 devicetree@vger.kernel.org, Sean Wang <Sean.Wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX /
 MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <mbrugger@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 Sean Wang <sean.wang@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFVsaToKCk9uIFRodSwgMjAxOS0wNy0wNCBhdCAxNzozMyArMDIwMCwgVWxyaWNoIEhlY2h0
IHdyb3RlOgo+ID4gT24gSnVseSA0LCAyMDE5IGF0IDExOjA4IEFNIE1hdHRoaWFzIEJydWdnZXIg
PG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gWW91IGFyZSByaWdodCwgaXQgdG9v
ayBmYXIgdG9vIGxvbmcgZm9yIG1lIHRvIHJlc3BvbmQgd2l0aCBhIG5ldyB2ZXJzaW9uIG9mIHRo
ZQo+ID4gc2VyaWVzLiBUaGUgcHJvYmxlbSBJIGZhY2UgaXMsIHRoYXQgSSB1c2UgbXkgbXQ4MTcz
IGJhc2VkIGNocm9tZWJvb2sgZm9yCj4gPiB0ZXN0aW5nLiBJdCBuZWVkcyBzb21lIGRvd25zdHJl
YW0gcGF0Y2hlcyBhbmQgYnJva2Ugc29tZXdoZXJlIGJldHdlZW4gbXkgbGFzdAo+ID4gZW1haWwg
YW5kIGEgZmV3IG1vbnRoIGFnby4KPiAKPiBJZiB0aGF0IENocm9tZWJvb2sgaXMgYW4gQWNlciBS
MTMgYW5kIHlvdSBuZWVkIGEgd29ya2luZyBrZXJuZWwsIHlvdSBtYXkgd2FudCB0byBoYXZlIGEg
bG9vayBhdCBodHRwczovL2dpdGh1Yi5jb20vdWxpL2tlcm5lbC90cmVlL2VsbS13b3JraW5nLTUu
MiAuCgpUaGFua3MgZm9yIHlvdXIgc2FtcGxlIGNvZGUsIGFuZCB5b3VyIGltcGxlbWVudGF0aW9u
IGlzIGRpZmZlcmVudCB0aGFuCk1hdHRoaWFzJyB2ZXJzaW9uLiBJbiB5b3VyIHZlcnNpb24sIG1t
c3lzIGlzIGEgc2luZ2xlIGRldmljZSB3aGljaCBoYXMKY2xvY2sgZnVuY3Rpb24gYW5kIGRpc3Bs
YXkgZnVuY3Rpb24sIHRoZSBjbG9jayBmdW5jdGlvbiBpcyBwbGFjZWQgaW4KY2xvY2sgZHJpdmVy
IGZvbGRlciBhbmQgZGlzcGxheSBmdW5jdGlvbiBpcyBwbGFjZWQgaW4gZHJtIGRyaXZlciBmb2xk
ZXIuCkluIE1hdHRoaWFzJyB2ZXJzaW9uLCBjbG9jayBmdW5jdGlvbiBpcyBhIHN1YiBkZXZpY2Ug
b2YgbW1zeXMuIEkndmUgbm8KaWRlYSBvZiB3aGljaCBvbmUgaXMgYmV0dGVyLiBJIHdvdWxkIGdl
dCBtb3JlIGluZm9ybWF0aW9uIHRvIG1ha2UgYmV0dGVyCmRlY2lzaW9uLgoKUmVnYXJkcywKQ0sK
Cj4gCj4gQ1UKPiBVbGkKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
