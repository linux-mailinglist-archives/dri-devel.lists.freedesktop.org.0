Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECB92CCA9
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0882B6E268;
	Tue, 28 May 2019 16:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBB46E268
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 16:51:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-139-52-nat.elisa-mobile.fi
 [85.76.139.52])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEB03FA6;
 Tue, 28 May 2019 18:51:12 +0200 (CEST)
Date: Tue, 28 May 2019 19:50:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when
 using dual-link LVDS mode
Message-ID: <20190528165052.GB17874@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-8-laurent.pinchart+renesas@ideasonboard.com>
 <20190528164213.GB9610@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528164213.GB9610@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559062273;
 bh=Cu7qwr8iVSvHU3iF7trDV2hyNHcZ7hO7GlIDCSQOIKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=njKN6GdU5iTMeMdz6yBTnp3/5fSj/i22xmJ/P9zXhFjd37LULke7q+D5gD4gb5Jtz
 9bTPy3eDi7bWY36LJX3Z2cyQebUoM8vz/ClFpOzRvQrxVgTTEq3i+Pe/cFCnbFZn3N
 s6vm4A2++cRsAPnGpzI+D1V0cYbzGla9a5cMZOCc=
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDY6NDI6MTNQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDA1OjEyOjMxUE0gKzAzMDAs
IExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBJbiBkdWFsLWxpbmsgTFZEUyBtb2RlLCB0aGUg
TFZEUzEgZW5jb2RlciBpcyB1c2VkIGFzIGEgY29tcGFuaW9uIGZvcgo+ID4gTFZEUzAsIGFuZCBi
b3RoIGVuY29kZXJzIHRyYW5zbWl0IGRhdGEgZnJvbSBEVTAuIFRoZSBMVkRTMSBvdXRwdXQgb2Yg
RFUxCj4gPiBjYW4ndCBiZSB1c2VkIGluIHRoYXQgY2FzZSwgZG9uJ3QgY3JlYXRlIGFuIGVuY29k
ZXIgYW5kIGNvbm5lY3RvciBmb3IKPiA+IGl0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4K
PiA+IFJldmlld2VkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+
Cj4gPiBUZXN0ZWQtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4K
PiA+IC0tLQo+ID4gQ2hhbmdlc3Mgc2luY2UgdjI6Cj4gPiAKPiA+IC0gUmVtb3ZlIHVubmVlZGVk
IGJyaWRnZSBOVUxMIGNoZWNrCj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
Y2FyX2R1X2VuY29kZXIuYyB8IDEyICsrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfa21zLmMgICAgIHwgIDIgKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvcmNhcl9kdV9lbmNvZGVyLmMKPiA+IGluZGV4IDZjOTE3NTNhZjdiYy4uMGYwMGJkZmUy
MzY2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9lbmNv
ZGVyLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZW5jb2Rlci5j
Cj4gPiBAQCAtMTYsNiArMTYsNyBAQAo+ID4gICNpbmNsdWRlICJyY2FyX2R1X2Rydi5oIgo+ID4g
ICNpbmNsdWRlICJyY2FyX2R1X2VuY29kZXIuaCIKPiA+ICAjaW5jbHVkZSAicmNhcl9kdV9rbXMu
aCIKPiA+ICsjaW5jbHVkZSAicmNhcl9sdmRzLmgiCj4gPiAgCj4gPiAgLyogLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiA+ICAgKiBFbmNvZGVyCj4gPiBAQCAtOTcsNiArOTgsMTcgQEAgaW50IHJjYXJf
ZHVfZW5jb2Rlcl9pbml0KHN0cnVjdCByY2FyX2R1X2RldmljZSAqcmNkdSwKPiA+ICAJCX0KPiA+
ICAJfQo+ID4gIAo+ID4gKwkvKgo+ID4gKwkgKiBPbiBHZW4zIHNraXAgdGhlIExWRFMxIG91dHB1
dCBpZiB0aGUgTFZEUzEgZW5jb2RlciBpcyB1c2VkIGFzIGEKPiA+ICsJICogY29tcGFuaW9uIGZv
ciBMVkRTMCBpbiBkdWFsLWxpbmsgbW9kZS4KPiA+ICsJICovCj4gPiArCWlmIChyY2R1LT5pbmZv
LT5nZW4gPj0gMyAmJiBvdXRwdXQgPT0gUkNBUl9EVV9PVVRQVVRfTFZEUzEpIHsKPiAKPiBCb3Ro
IHN1YmplY3QgYW5kIGNvbW1lbnQgYWJvdmUgc2F5cyAiT24gR2VuMyIsIGJ1dCB0aGUgY29kZSBs
b29rcyBsaWtlCj4gaXQgaW1wbGVtZW50cyAiT24gR2VuMyBvciBuZXdlciIgLSBkdWUgdG8gdXNl
IG9mICI+PSIuCj4gTG9va3Mgd3JvbmcgdG8gbWUuCgpHZW4zIGlzIHRoZSBuZXdlc3QgZ2VuZXJh
dGlvbiA6LSkgV2UgdGh1cyB1c2UgPj0gdGhyb3VnaCB0aGUgRFUgYW5kIExWRFMKZHJpdmVycyB0
byBwcmVwYXJlIGZvciBzdXBwb3J0IG9mIEdlbjQsIGp1c3QgaW4gY2FzZS4KCi0tIApSZWdhcmRz
LAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
