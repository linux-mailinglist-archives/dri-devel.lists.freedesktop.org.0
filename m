Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D08011D3317
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 16:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE12A6EB52;
	Thu, 14 May 2020 14:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE896EB52
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 14:36:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 7C7962A2EDE
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 0/4] dt-bindings: display: ti,tfp410.txt: convert to yaml
Date: Thu, 14 May 2020 16:36:08 +0200
Message-Id: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, tomi.valkeinen@ti.com,
 kernel@collabora.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgY29udmVydHMgdGhlIERUIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhl
IFRJIFRGUDQxMApEUEktdG8tRFZJIGVuY29kZXIgdG8ganNvbi1zY2hlbWEuCgpTb21lIG1pbm9y
IGNoYW5nZXMgd2VyZSBtYWRlIHRvIHR3byBEVHMgaW4gb3JkZXIgdG8gbWFrZSB0aGVtIGNvbXBs
aWFudAp3aXRoIHRoZSBiaW5kaW5nLiBUaGVzZSBjaGFuZ2VzIHNob3VsZG4ndCBoYXZlIGFueSBm
dW5jdGlvbmFsIGVmZmVjdC4KClRoaXMgYWxzbyBmaXhlcyBhIG1pbm9yIGJ1ZyBpbiB0aGUgdGkt
dGZwNDEwIGRyaXZlciB0aGF0IHdvdWxkIGNhdXNlIGEKd3JvbmcgY2FsY3VsYXRpb24gb2YgdGhl
IHNldHVwIGFuZCBob2xkIHRpbWVzIHdoZW4gdGhlIGRlLXNrZXcgZmVhdHVyZQppcyBlbmFibGVk
LiBUaGUgcmV0cmlldmFsIG9mIHRoZSBkZS1za2V3IHZhbHVlIGZyb20gdGhlIERUIGhhcyBhbHNv
IGJlZW4KdXBkYXRlZCB0byByZWZsZWN0IHRoZSBiaW5kaW5nIGNoYW5nZXMuCgpDaGFuZ2VzIGlu
IHYyOgoKICAtIHRpLHRmcDQxMC55YW1sCiAgICAtIFNldCBsaWNlbnNlIGFzIEdQTC0yLjAtb25s
eSAoU2FtIFJhdm5ib3JnKQogICAgLSBDb21wbGV0ZSBwY2xrLXNhbXBsZSBhbmQgYnVzLXdpZHRo
IGNvbW1lbnRzIChTYW0pCiAgICAtIFJlbW92ZSBxdW90ZXMgZnJvbSBjb21wYXRpYmxlIHZhbHVl
IChTYW0pCiAgICAtIFJlbW92ZSB0aGUgYWxsT2Yga2V5d29yZCBmcm9tIHRoZSB0aSxkZXNrZXcg
ZGVmaW5pdGlvbiAoU2FtKQogICAgLSBTZXQgZW5kcG9pbnQgYXMgb3B0aW9uYWwgaW4gcG9ydCBk
ZWZpbml0aW9ucwogICAgLSBTZXQgYSByYW5nZSBmb3IgdGksZGVza2V3CgogIERUcyBmaXhlcyAo
YWRkZWQpOgogICAgLSBkb3ZlLXNiYy1hNTEwLmR0czogcy9wb3dlcmRvd24tZ3Bpby9wb3dlcmRv
d24tZ3Bpb3MgKFNhbSkKICAgIC0gZG92ZS1zYmMtYTUxMC5kdHM6IEFkZCBkdW1teSBwb3J0cyBu
b2RlCiAgICAtIGlteDUzLWN4OTAyMC5kdHM6IEdyb3VwIHRoZSBwb3J0cyBpbiBhIHBvcnRzIG5v
ZGUKCiAgdGktdGZwNDEwLmMgKGFkZGVkKToKICAgIC0gRml4IHNldHVwIHRpbWUgYW5kIGhvbGQg
dGltZSBjYWxjdWxhdGlvbiBiYXNlZCBvbiB0aGUgZGVza2V3IHZhbHVlCiAgICAgIChMYXVyZW50
IFBpbmNoYXJ0KQoKUmljYXJkbyBDYcOxdWVsbyAoNCk6CiAgQVJNOiBkdHM6IGRvdmU6IE1ha2Ug
dGhlIERUIGNvbXBsaWFudCB3aXRoIHRoZSB0aSx0ZnA0MTAgYmluZGluZwogIEFSTTogZHRzOiBp
bXM1MzogR3JvdXAgcG9ydCBkZWZpbml0aW9ucyBmb3IgdGhlIGR2aS1jb252ZXJ0ZXIKICBkdC1i
aW5kaW5nczogZGlzcGxheTogdGksdGZwNDEwLnR4dDogY29udmVydCB0byB5YW1sCiAgZHJtL2Jy
aWRnZTogdGZwNDEwOiBGaXggc2V0dXAgYW5kIGhvbGQgdGltZSBjYWxjdWxhdGlvbgoKIC4uLi9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSx0ZnA0MTAudHh0ICAgICB8ICA2NiAtLS0tLS0tLS0t
CiAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksdGZwNDEwLnlhbWwgICAgfCAxMjQgKysr
KysrKysrKysrKysrKysrCiBhcmNoL2FybS9ib290L2R0cy9kb3ZlLXNiYy1hNTEwLmR0cyAgICAg
ICAgICAgfCAgMTMgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDUzLWN4OTAyMC5kdHMgICAgICAg
ICAgICB8ICAyNSArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jICAgICAg
ICAgICAgfCAgMTAgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTU1IGluc2VydGlvbnMoKyksIDgzIGRl
bGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSx0ZnA0MTAudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLHRmcDQx
MC55YW1sCgotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
