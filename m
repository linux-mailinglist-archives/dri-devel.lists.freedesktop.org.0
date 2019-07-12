Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA86732F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 18:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E956D6E2AC;
	Fri, 12 Jul 2019 16:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2C46E2AC
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 16:21:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A5EC480335;
 Fri, 12 Jul 2019 18:21:18 +0200 (CEST)
Date: Fri, 12 Jul 2019 18:21:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Nicolas.Ferre@microchip.com,
 Joshua Henderson <joshua.henderson@microchip.com>
Subject: Re: [PATCH] drm/atmel-hlcdc: set layer REP bit to enable replication
 logic
Message-ID: <20190712162117.GB18990@ravnborg.org>
References: <1562686509-8747-1-git-send-email-joshua.henderson@microchip.com>
 <13aa50e4-a726-3f82-b186-79b452199a02@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13aa50e4-a726-3f82-b186-79b452199a02@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=XYAwZIGsAAAA:8
 a=VwQbUJbxAAAA:8 a=uoxZAW4_gHUsVfBorzEA:9 a=CjuIK1q_8ugA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=AjGcO6oz07-iQ99wixmX:22
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
 Joshua.Henderson@microchip.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9zaHVhLgoKT24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMDQ6MjQ6NDlQTSArMDAwMCwgTmlj
b2xhcy5GZXJyZUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+IE9uIDA5LzA3LzIwMTkgYXQgMTc6MzUs
IEpvc2h1YSBIZW5kZXJzb24gd3JvdGU6Cj4gPiBUaGlzIGJpdCBlbmFibGVzIHJlcGxpY2F0aW9u
IGxvZ2ljIHRvIGV4cGFuZCBhbiBSR0IgY29sb3IgbGVzcyB0aGFuIDI0Cj4gPiBiaXRzLCB0byAy
NCBiaXRzLCB3aGljaCBpcyB1c2VkIGludGVybmFsbHkgZm9yIGFsbCBmb3JtYXRzLiAgT3RoZXJ3
aXNlLAo+ID4gdGhlIGxlYXN0IHNpZ25pZmljYW50IGJpdHMgYXJlIGFsd2F5cyBzZXQgdG8gemVy
byBhbmQgdGhlIGNvbG9yIG1heSBub3QKPiA+IGJlIHdoYXQgaXMgZXhwZWN0ZWQuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IEpvc2h1YSBIZW5kZXJzb24gPGpvc2h1YS5oZW5kZXJzb25AbWljcm9j
aGlwLmNvbT4KPiAKPiBBY2tlZC1ieTogTmljb2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNy
b2NoaXAuY29tPgo+IAo+IEhlcmUgaXMgcGF0Y2h3b3JrIGVudHJ5Ogo+IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEwMzcxNjcvCj4gCj4gVGhhbmtzLCBiZXN0IHJlZ2FyZHMs
Cj4gICAgTmljb2xhcwo+IAo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNk
Yy9hdG1lbF9obGNkY19wbGFuZS5jIHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2F0
bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMKPiA+IGluZGV4IGViN2M0Y2YuLjZmNmNmNjEg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNf
cGxhbmUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2Rj
X3BsYW5lLmMKPiA+IEBAIC0zODksNyArMzg5LDcgQEAgYXRtZWxfaGxjZGNfcGxhbmVfdXBkYXRl
X2dlbmVyYWxfc2V0dGluZ3Moc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFuZSwKPiA+ICAg
CWF0bWVsX2hsY2RjX2xheWVyX3dyaXRlX2NmZygmcGxhbmUtPmxheWVyLCBBVE1FTF9ITENEQ19M
QVlFUl9ETUFfQ0ZHLAo+ID4gICAJCQkJICAgIGNmZyk7Cj4gPiAgIAo+ID4gLQljZmcgPSBBVE1F
TF9ITENEQ19MQVlFUl9ETUE7Cj4gPiArCWNmZyA9IEFUTUVMX0hMQ0RDX0xBWUVSX0RNQSB8IEFU
TUVMX0hMQ0RDX0xBWUVSX1JFUDsKPiA+ICAgCj4gPiAgIAlpZiAocGxhbmUtPmJhc2UudHlwZSAh
PSBEUk1fUExBTkVfVFlQRV9QUklNQVJZKSB7Cj4gPiAgIAkJY2ZnIHw9IEFUTUVMX0hMQ0RDX0xB
WUVSX09WUiB8IEFUTUVMX0hMQ0RDX0xBWUVSX0lURVIyQkwgfAoKVGhhbmtzIC0gdGhpcyBnYXZl
IG1lIGFuIG9wcG9ydHVuaXR5IHRvIHJlYWQgYSBiaXQgbW9yZSBpbiB0aGUgZGF0YXNoZWV0Cm9m
IHRoZSBjb250cm9sbGVyLgpBcHBsaWVkIHRvIGRybS1taXNjLW5leHQgd2l0aCBBY2sgZnJvbSBO
aWNvbGFzLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
