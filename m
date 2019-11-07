Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306EAF41B6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31416F868;
	Fri,  8 Nov 2019 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8196E0C1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 19:11:04 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko.stuebner@theobroma-systems.com>)
 id 1iSnBK-0004qp-Rm; Thu, 07 Nov 2019 20:10:58 +0100
From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/3] drm/rockchip: add ability to handle external dphys in
 mipi-dsi
Date: Thu, 07 Nov 2019 20:10:57 +0100
Message-ID: <1772103.UzfIEELiUT@phil>
In-Reply-To: <20191106130557.GF4878@pendragon.ideasonboard.com>
References: <20191106112650.8365-1-heiko.stuebner@theobroma-systems.com>
 <20191106112650.8365-2-heiko.stuebner@theobroma-systems.com>
 <20191106130557.GF4878@pendragon.ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, philippe.cornu@st.com, yannick.fertre@st.com,
 robh+dt@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCkFtIE1pdHR3b2NoLCA2LiBOb3ZlbWJlciAyMDE5LCAxNDowNTo1NyBDRVQg
c2NocmllYiBMYXVyZW50IFBpbmNoYXJ0Ogo+IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDEyOjI2
OjQ5UE0gKzAxMDAsIEhlaWtvIFN0dWVibmVyIHdyb3RlOgo+ID4gV2hpbGUgdGhlIGNvbW1vbiBj
YXNlIGlzIHRoYXQgdGhlIGRzaSBjb250cm9sbGVyIHVzZXMgYW4gaW50ZXJuYWwgZHBoeSwKPiA+
IGFjY2Vzc2VkIHRocm91Z2ggdGhlIHBoeSByZWdpc3RlcnMgaW5zaWRlIHRoZSBkc2kgY29udHJv
bGxlciwgdGhlcmUgaXMKPiA+IGFsc28gdGhlIHBvc3NpYmlsaXR5IHRvIHVzZSBhIHNlcGFyYXRl
IGRwaHkgZnJvbSBhIGRpZmZlcmVudCB2ZW5kb3IuCj4gPiAKPiA+IE9uZSBzdWNoIGNhc2UgaXMg
dGhlIFJvY2tjaGlwIHB4MzAgdGhhdCB1c2VzIGEgSW5ub3NpbGljb24gTWlwaSBkcGh5LAo+ID4g
c28gYWRkIHRoZSBzdXBwb3J0IGZvciBoYW5kbGluZyBzdWNoIGEgY29uc3RlbGxhdGlvbiwgaW5j
bHVkaW5nIHRoZSBwbGwKPiA+IGFsc28gZ2V0dGluZyBnZW5lcmF0ZWQgaW5zaWRlIHRoYXQgZXh0
ZXJuYWwgcGh5Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28u
c3R1ZWJuZXJAdGhlb2Jyb21hLXN5c3RlbXMuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2Rpc3BsYXkv
cm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9ja2NoaXAudHh0IHwgIDcgKystCj4gPiAgLi4uL2dwdS9k
cm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2NoaXAuYyAgIHwgNTQgKysrKysrKysrKysrKysr
KysrLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3JvY2tjaGlwL2R3X21pcGlfZHNpX3JvY2tjaGlwLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X21pcGlfZHNpX3JvY2tj
aGlwLnR4dAo+ID4gaW5kZXggY2U0YzFmYzkxMTZjLi44YjI1MTU2YTlkY2YgMTAwNjQ0Cj4gPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9k
d19taXBpX2RzaV9yb2NrY2hpcC50eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X21pcGlfZHNpX3JvY2tjaGlwLnR4dAo+ID4g
QEAgLTgsOCArOCw5IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gPiAgCSAgICAgICJyb2NrY2hp
cCxyazMzOTktbWlwaS1kc2kiLCAic25wcyxkdy1taXBpLWRzaSIuCj4gPiAgLSByZWc6IFJlcHJl
c2VudCB0aGUgcGh5c2ljYWwgYWRkcmVzcyByYW5nZSBvZiB0aGUgY29udHJvbGxlci4KPiA+ICAt
IGludGVycnVwdHM6IFJlcHJlc2VudCB0aGUgY29udHJvbGxlcidzIGludGVycnVwdCB0byB0aGUg
Q1BVKHMpLgo+ID4gLS0gY2xvY2tzLCBjbG9jay1uYW1lczogUGhhbmRsZXMgdG8gdGhlIGNvbnRy
b2xsZXIncyBwbGwgcmVmZXJlbmNlCj4gPiAtICBjbG9jayhyZWYpIGFuZCBBUEIgY2xvY2socGNs
aykuIEZvciBSSzMzOTksIGEgcGh5IGNvbmZpZyBjbG9jawo+ID4gKy0gY2xvY2tzLCBjbG9jay1u
YW1lczogUGhhbmRsZXMgdG8gdGhlIGNvbnRyb2xsZXIncyBhbmQgQVBCIGNsb2NrKHBjbGspCj4g
PiArICBhbmQgZWl0aGVyIGEgcGxsIHJlZmVyZW5jZSBjbG9jayhyZWYpIChpbnRlcm5hbCBkcGh5
KSBvciBwbGwgY2xvY2socGxsKQo+ID4gKyAgKHdoZW4gY29ubmVjdGVkIHRvIGFuIGV4dGVybmFs
IHBoeSkuIEZvciBSSzMzOTksIGEgcGh5IGNvbmZpZyBjbG9jawo+IAo+IFdoeSBkb2VzIGV4dGVy
bmFsIFBIWSBjbG9jayBuZWVkIHRvIGJlIHNwZWNpZmllZCBoZXJlID8gU2hvdWxkbid0IGl0IGJl
Cj4gaGFuZGxlZCBieSB0aGUgUEhZIGluc3RlYWQgPwoKWW91J3JlIGNvbXBsZXRlbHkgcmlnaHQg
YW5kIGl0IHNlZW1zIEkgZGlkbid0ICJzZWUgdGhlIGZvcmVzdCAgZm9yIHRoZSB0cmVlcyIsCmFz
IHRoZXJlIGFjdHVhbGx5IGV4aXN0cyB0aGUgcGh5X2NvbmZpZ3VyZV8qIHN0cnVjdHMgdG8gdHJh
bnNmZXIgcGFyYW1ldGVycwp0byBhbiBleHRlcm5hbCBwaHkgaW4gYSBjb3JyZWN0IHdheS4KCkkn
bGwgcmV2aXNlIG15IGFwcHJvYWNoIChhbmQgdGhlIHBoeSBkcml2ZXIpIGFjY29yZGluZ2x5LgoK
VGhhbmtzIGZvciB0aGUgcHVzaCBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uIDotKQpIZWlrbwoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
