Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2399014D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 14:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33E36E33C;
	Fri, 16 Aug 2019 12:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13636E332
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 12:22:38 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AC332AF;
 Fri, 16 Aug 2019 14:22:36 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Fix module name clash with omapdrm and DRM panel modules
Date: Fri, 16 Aug 2019 15:22:26 +0300
Message-Id: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565958156;
 bh=DVmNJEVy/288Y0VSJDuuMhHljnDxZ/s+h3EGyry8org=;
 h=From:To:Cc:Subject:Date:From;
 b=DT/F9BdniWLMD3APoDpoOXCAhDDcr8GFHoAmjP4eeXleIejWuqCqm9FnykpKJ2wyZ
 PxuVsuKDFYObetI0f9c+p6PHQDRrLZ8Is2psTJkJYq3R2hOfotTP4dQz+A4uG6ZrB5
 nxXUY2UbymnBPnQtjOyrWHsWfEqcbE3H29dSWr+8=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpUaGUgcGF0Y2ggc2VyaWVzICJbUEFUQ0ggdjQgMC85XSBEUk0gcGFuZWwgZHJpdmVy
cyBmb3Igb21hcGRybSIgYWRkZWQKbmV3IERSTSBwYW5lbCBkcml2ZXJzIGZvciBhIHNldCBvZiBw
YW5lbHMgdXNlZCBvbiBPTUFQIHBsYXRmb3Jtcywgd2l0aAp0aGUgb21hcGRybSBhbmQgb21hcGZi
MiBkcml2ZXJzLiBCb3RoIHRob3NlIGRyaXZlcnMgY29udGFpbgpvbWFwLXNwZWNpZmljIHBhbmVs
IGRyaXZlcnMsIHdoaWNoIHRoZSBuZXcgRFJNIHBhbmVsIGRyaXZlcnMgYWltcyB0bwpyZXBsYWNl
IGZvciBvbWFwZHJtLiBUaGUgbmV3IGRyaXZlcnMgdXNlIHRoZSBzYW1lIG1vZHVsZSBuYW1lIGFz
IHRoZSBvbGQKb25lcyAod2l0aCBvbmUgZXhjZXB0aW9uKSwgcmVzdWx0aW5nIGluIG1vZHVsZSBu
YW1lIGNsYXNoZXMuCgpUaGlzIG5lZWRzIHRvIGJlIGZpeGVkIHNlcGFyYXRlbHkgZm9yIG9tYXBm
YjIgYW5kIG9tYXBkcm0uCgpGb3Igb21hcGZiMiwgd2UgY2FuIGRpc2FibGUgdGhlIG9tYXBmYjIt
c3BlY2lmaWMgcGFuZWwgZHJpdmVycyBpbgpLY29uZmlnIHdoZW4gdGhlIHN0YW5kYXJkIGRyaXZl
cnMgYXJlIGVuYWJsZWQuIEFzIG9tYXBmYjIgYW5kIG9tYXBkcm0KYXJlIG11dHVhbGx5IGV4Y2x1
c2l2ZSwgdGhlIERSTSBwYW5lbCBkcml2ZXJzIGFyZSBub3QgdXNlZnVsIHdpdGgKb21hcGZiMiBp
biBhbnkgY2FzZS4gVGhpcyBpcyBkb25lIGluIHBhdGNoIDEvMi4KCkZvciBvbWFwZHJtLCB3ZSBj
YW4gc2ltcGx5IGRyb3AgdGhlIG9tYXBkcm0tc3BlY2lmaWMgcGFuZWwgZHJpdmVycywgYXMKdGhl
IG5ldyBkcml2ZXJzIHJlcGxhY2UgdGhlbS4gVGhpcyBpcyBkb25lIGluIHBhdGNoIDIvMiwgd2hp
Y2ggd2FzCmFscmVhZHkgcGFydCBvZiB0aGUgbGFyZ2VyIG9tYXBkcm0gcGF0Y2ggc2VyaWVzICJb
UEFUQ0ggMDAvNjBdIGRybS9vbWFwOgpSZXBsYWNlIGN1c3RvbSBkaXNwbGF5IGRyaXZlcnMgd2l0
aCBkcm1fYnJpZGdlIGFuZCBkcm1fcGFuZWwiLgoKTGF1cmVudCBQaW5jaGFydCAoMik6CiAgdmlk
ZW86IG9tYXBmYjI6IE1ha2Ugc3RhbmRhcmQgYW5kIGN1c3RvbSBwYW5lbCBkcml2ZXJzIG11dHVh
bGx5CiAgICBleGNsdXNpdmUKICBkcm0vb21hcDogZGlzcGxheXM6IFJlbW92ZSB1bnVzZWQgcGFu
ZWwgZHJpdmVycwoKIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL0tjb25maWcgICAg
ICB8ICAzOCAtCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9NYWtlZmlsZSAgICAg
fCAgIDYgLQogLi4uL2Rpc3BsYXlzL3BhbmVsLWxncGhpbGlwcy1sYjAzNXEwMi5jICAgICAgIHwg
MjUxIC0tLS0tLQogLi4uL29tYXBkcm0vZGlzcGxheXMvcGFuZWwtbmVjLW5sODA0OGhsMTEuYyAg
IHwgMjcxIC0tLS0tLS0KIC4uLi9kaXNwbGF5cy9wYW5lbC1zaGFycC1sczAzN3Y3ZHcwMS5jICAg
ICAgICB8IDI2MiAtLS0tLS0KIC4uLi9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLXNvbnktYWN4NTY1
YWttLmMgICB8IDc1NSAtLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9vbWFwZHJtL2Rpc3BsYXlzL3Bh
bmVsLXRwby10ZDAyOHR0ZWMxLmMgICB8IDM5MCAtLS0tLS0tLS0KIC4uLi9vbWFwZHJtL2Rpc3Bs
YXlzL3BhbmVsLXRwby10ZDA0M210ZWExLmMgICB8IDUxMyAtLS0tLS0tLS0tLS0KIC4uLi9ncHUv
ZHJtL29tYXBkcm0vZHNzL29tYXBkc3MtYm9vdC1pbml0LmMgICB8ICAgNyAtCiAuLi4vdmlkZW8v
ZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL0tjb25maWcgfCAgIDUgKwogMTAgZmlsZXMgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAyNDkzIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWxncGhpbGlwcy1sYjAz
NXEwMi5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxh
eXMvcGFuZWwtbmVjLW5sODA0OGhsMTEuYwogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLXNoYXJwLWxzMDM3djdkdzAxLmMKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1zb255LWFj
eDU2NWFrbS5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlz
cGxheXMvcGFuZWwtdHBvLXRkMDI4dHRlYzEuYwogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLXRwby10ZDA0M210ZWExLmMKCi0tIApSZWdh
cmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
