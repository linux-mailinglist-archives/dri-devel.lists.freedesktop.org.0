Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB5A6734F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 18:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120566E27F;
	Fri, 12 Jul 2019 16:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA20F6E27F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 16:32:39 +0000 (UTC)
Received: from pc-381.home
 (2a01cb0c80061e00e835b5cf688fec09.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb0c:8006:1e00:e835:b5cf:688f:ec09])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3D11028BBD0;
 Fri, 12 Jul 2019 17:32:38 +0100 (BST)
Date: Fri, 12 Jul 2019 18:32:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/atmel-hlcdc: set layer REP bit to enable
 replication logic
Message-ID: <20190712183234.35427352@pc-381.home>
In-Reply-To: <20190712162117.GB18990@ravnborg.org>
References: <1562686509-8747-1-git-send-email-joshua.henderson@microchip.com>
 <13aa50e4-a726-3f82-b186-79b452199a02@microchip.com>
 <20190712162117.GB18990@ravnborg.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org, airlied@linux.ie,
 Joshua Henderson <joshua.henderson@microchip.com>, Nicolas.Ferre@microchip.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMiBKdWwgMjAxOSAxODoyMToxNyArMDIwMApTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+IHdyb3RlOgoKPiBIaSBKb3NodWEuCj4gCj4gT24gVHVlLCBKdWwgMDksIDIwMTkg
YXQgMDQ6MjQ6NDlQTSArMDAwMCwgTmljb2xhcy5GZXJyZUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+
ID4gT24gMDkvMDcvMjAxOSBhdCAxNzozNSwgSm9zaHVhIEhlbmRlcnNvbiB3cm90ZTogIAo+ID4g
PiBUaGlzIGJpdCBlbmFibGVzIHJlcGxpY2F0aW9uIGxvZ2ljIHRvIGV4cGFuZCBhbiBSR0IgY29s
b3IgbGVzcyB0aGFuIDI0Cj4gPiA+IGJpdHMsIHRvIDI0IGJpdHMsIHdoaWNoIGlzIHVzZWQgaW50
ZXJuYWxseSBmb3IgYWxsIGZvcm1hdHMuICBPdGhlcndpc2UsCj4gPiA+IHRoZSBsZWFzdCBzaWdu
aWZpY2FudCBiaXRzIGFyZSBhbHdheXMgc2V0IHRvIHplcm8gYW5kIHRoZSBjb2xvciBtYXkgbm90
Cj4gPiA+IGJlIHdoYXQgaXMgZXhwZWN0ZWQuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBK
b3NodWEgSGVuZGVyc29uIDxqb3NodWEuaGVuZGVyc29uQG1pY3JvY2hpcC5jb20+ICAKPiA+IAo+
ID4gQWNrZWQtYnk6IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT4K
PiA+IAo+ID4gSGVyZSBpcyBwYXRjaHdvcmsgZW50cnk6Cj4gPiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzExMDM3MTY3Lwo+ID4gCj4gPiBUaGFua3MsIGJlc3QgcmVnYXJkcywK
PiA+ICAgIE5pY29sYXMKPiA+ICAgCj4gPiA+IC0tLQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9h
dG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jIHwgMiArLQo+ID4gPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMKPiA+ID4gaW5kZXgg
ZWI3YzRjZi4uNmY2Y2Y2MSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2F0bWVs
LWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2F0
bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMKPiA+ID4gQEAgLTM4OSw3ICszODksNyBAQCBh
dG1lbF9obGNkY19wbGFuZV91cGRhdGVfZ2VuZXJhbF9zZXR0aW5ncyhzdHJ1Y3QgYXRtZWxfaGxj
ZGNfcGxhbmUgKnBsYW5lLAo+ID4gPiAgIAlhdG1lbF9obGNkY19sYXllcl93cml0ZV9jZmcoJnBs
YW5lLT5sYXllciwgQVRNRUxfSExDRENfTEFZRVJfRE1BX0NGRywKPiA+ID4gICAJCQkJICAgIGNm
Zyk7Cj4gPiA+ICAgCj4gPiA+IC0JY2ZnID0gQVRNRUxfSExDRENfTEFZRVJfRE1BOwo+ID4gPiAr
CWNmZyA9IEFUTUVMX0hMQ0RDX0xBWUVSX0RNQSB8IEFUTUVMX0hMQ0RDX0xBWUVSX1JFUDsKPiA+
ID4gICAKPiA+ID4gICAJaWYgKHBsYW5lLT5iYXNlLnR5cGUgIT0gRFJNX1BMQU5FX1RZUEVfUFJJ
TUFSWSkgewo+ID4gPiAgIAkJY2ZnIHw9IEFUTUVMX0hMQ0RDX0xBWUVSX09WUiB8IEFUTUVMX0hM
Q0RDX0xBWUVSX0lURVIyQkwgfCAgCj4gCj4gVGhhbmtzIC0gdGhpcyBnYXZlIG1lIGFuIG9wcG9y
dHVuaXR5IHRvIHJlYWQgYSBiaXQgbW9yZSBpbiB0aGUgZGF0YXNoZWV0Cj4gb2YgdGhlIGNvbnRy
b2xsZXIuCj4gQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0IHdpdGggQWNrIGZyb20gTmljb2xhcy4K
CldhcyBhYm91dCB0byBhZGQgbXkgUi1iIGFuZCBhc2sgeW91IHRvIGFwcGx5IHRoZSBwYXRjaC4g
SSdtIGdsYWQgeW91CmRpZG4ndCB3YWl0IGZvciBteSBmZWVkYmFjayB0aG91Z2gsIHRoYXQgbWVh
bnMgSSdsbCBzb29uIGJlIGFibGUgdG8KcmVtb3ZlIG15IG5hbWUgZnJvbSB0aGUgQXRtZWwgSExD
REMgZW50cnkgaW4gTUFJTlRBSU5FUlMgOy0pLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
