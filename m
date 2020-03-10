Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B2D180C7F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9126E8F4;
	Tue, 10 Mar 2020 23:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCD989FE8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 10:04:06 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id D3FF73ABB4B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 09:53:34 +0000 (UTC)
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9661B1C0012;
 Tue, 10 Mar 2020 09:53:08 +0000 (UTC)
Date: Tue, 10 Mar 2020 10:53:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] drm/rockchip: rgb: don't count non-existent devices
 when determining subdrivers
Message-ID: <20200310105308.1c5fadf9@xps13>
In-Reply-To: <20200121224828.4070067-1-heiko@sntech.de>
References: <20200121224828.4070067-1-heiko@sntech.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGVpa28sCgpIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZSBvbiBUdWUs
IDIxIEphbiAyMDIwIDIzOjQ4OjI4CiswMTAwOgoKPiBGcm9tOiBIZWlrbyBTdHVlYm5lciA8aGVp
a28uc3R1ZWJuZXJAdGhlb2Jyb21hLXN5c3RlbXMuY29tPgo+IAo+IHJvY2tjaGlwX2RybV9lbmRw
b2ludF9pc19zdWJkcml2ZXIoKSBtYXkgYWxzbyByZXR1cm4gZXJyb3IgY29kZXMuCj4gRm9yIGV4
YW1wbGUgaWYgdGhlIHRhcmdldC1ub2RlIGlzIGluIHRoZSBkaXNhYmxlZCBzdGF0ZSwgc28gbm8K
PiBwbGF0Zm9ybS1kZXZpY2UgaXMgZ2V0dGluZyBjcmVhdGVkIGZvciBpdC4KPiAKPiBJbiB0aGF0
IGNhc2UgY3VycmVudCBjb2RlIHdvdWxkIGNvdW50IHRoYXQgYXMgZXh0ZXJuYWwgcmdiIGRldmlj
ZSwKPiB3aGljaCBpbiB0dXJuIHdvdWxkIG1ha2UgcHJvYmluZyB0aGUgcm9ja2NoaXAtZHJtIGRl
dmljZSBmYWlsLgo+IAo+IFNvIG9ubHkgY291bnQgdGhlIHRhcmdldCBhcyByZ2IgZGV2aWNlIGlm
IHRoZSBmdW5jdGlvbiBhY3R1YWxseQo+IHJldHVybnMgMC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBI
ZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdGhlb2Jyb21hLXN5c3RlbXMuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfcmdiLmMgfCAzICsrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9yZ2IuYyBiL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9yZ2IuYwo+IGluZGV4IGFlNzMwMjc1YTM0Zi4uNzlh
N2U2MDYzM2UwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9yZ2IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9yZ2IuYwo+
IEBAIC05OCw3ICs5OCw4IEBAIHN0cnVjdCByb2NrY2hpcF9yZ2IgKnJvY2tjaGlwX3JnYl9pbml0
KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgCQlpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIoZW5kcG9p
bnQsICJyZWciLCAmZW5kcG9pbnRfaWQpKQo+ICAJCQllbmRwb2ludF9pZCA9IDA7Cj4gIAo+IC0J
CWlmIChyb2NrY2hpcF9kcm1fZW5kcG9pbnRfaXNfc3ViZHJpdmVyKGVuZHBvaW50KSA+IDApCj4g
KwkJLyogaWYgc3ViZHJpdmVyICg+IDApIG9yIGVycm9yIGNhc2UgKDwgMCksIGlnbm9yZSBlbnRy
eSAqLwo+ICsJCWlmIChyb2NrY2hpcF9kcm1fZW5kcG9pbnRfaXNfc3ViZHJpdmVyKGVuZHBvaW50
KSAhPSAwKQo+ICAJCQljb250aW51ZTsKPiAgCj4gIAkJY2hpbGRfY291bnQrKzsKClJldmlld2Vk
LWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApN
aXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
