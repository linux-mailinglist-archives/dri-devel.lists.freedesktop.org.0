Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB4E1FCA1F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 11:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B256E877;
	Wed, 17 Jun 2020 09:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C386E877
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 09:47:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id D0F832A3878
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Laurent.pinchart@ideasonboard.com
Subject: [PATCH v4 2/4] dt-bindings: display: ti, tfp410.yaml: Redefine ti,
 deskew property
Date: Wed, 17 Jun 2020 11:46:31 +0200
Message-Id: <20200617094633.19663-3-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200617094633.19663-1-ricardo.canuelo@collabora.com>
References: <20200617094633.19663-1-ricardo.canuelo@collabora.com>
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
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjaGFuZ2VzIGhvdyB0aGUgJ3RpLGRlc2tldycgcHJvcGVydHkgaXMgZGVmaW5lZC4gSXQn
cyBub3cgYW4KdW5zaWduZWQgdmFsdWUgZnJvbSAwIHRvIDcgaW5zdGVhZCBvZiBhIHNpZ25lZCB2
YWx1ZSBmcm9tIC00IHRvIDMuClVudGlsIHRoZSBkdGMgY2FycmllcyB0aGUgaW50ZWdlciBzaWdu
IHRocm91Z2ggdG8gdGhlIHlhbWwgb3V0cHV0IGl0J3MKZWFzaWVyIHRvIGRlZmluZSBzaWduZWQg
dHlwZXMgYXMgdW5zaWduZWQuCgpTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIENhw7F1ZWxvIDxyaWNh
cmRvLmNhbnVlbG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQg
PGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSx0ZnA0MTAueWFtbCAgICB8IDkgKysrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSx0
ZnA0MTAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS90aSx0ZnA0MTAueWFtbAppbmRleCA1NTY5YTQ5MDc3NjUuLjYwNTgzMWMxZTgzNiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L3RpLHRmcDQxMC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2JyaWRnZS90aSx0ZnA0MTAueWFtbApAQCAtMjMsMTEgKzIzLDEyIEBAIHByb3BlcnRp
ZXM6CiAKICAgdGksZGVza2V3OgogICAgIGRlc2NyaXB0aW9uOgotICAgICAgRGF0YSBkZS1za2V3
IGluIDM1MHBzIGluY3JlbWVudHMsIGZyb20gLTQgdG8gKzMsIGFzIGNvbmZpZ3VyZWQKLSAgICAg
IHRocm91Z2ggdGggREtbMzoxXSBwaW5zLiBUaGlzIHByb3BlcnR5IHNoYWxsIGJlIHByZXNlbnQg
b25seSBpZiB0aGUgVEZQNDEwCi0gICAgICBpcyBub3QgY29ubmVjdGVkIHRocm91Z2ggSTJDLgot
ICAgIG1heEl0ZW1zOiAxCisgICAgICBEYXRhIGRlLXNrZXcgdmFsdWUgaW4gMzUwcHMgaW5jcmVt
ZW50cywgZnJvbSAwIHRvIDcsIGFzIGNvbmZpZ3VyZWQKKyAgICAgIHRocm91Z2ggdGhlIERLWzM6
MV0gcGlucy4gVGhlIGRlLXNrZXcgbXVsdGlwbGllciBpcyBjb21wdXRlZCBhcworICAgICAgKERL
WzM6MV0gLSA0KSwgc28gaXQgcmFuZ2VzIGZyb20gLTQgdG8gMy4KICAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBtaW5pbXVtOiAwCisgICAgbWF4
aW11bTogNwogCiAgIHBvcnRzOgogICAgIGRlc2NyaXB0aW9uOgotLSAKMi4xOC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
