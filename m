Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AFED7709
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 15:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6446E249;
	Tue, 15 Oct 2019 13:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AFD6E249
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 13:04:52 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A42B324;
 Tue, 15 Oct 2019 15:04:50 +0200 (CEST)
Subject: Re: [PATCH v5 8/8] drm: rcar-du: kms: Expand comment in vsps parsing
 routine
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com, geert@linux-m68k.org, horms@verge.net.au,
 uli+renesas@fpond.eu, VenkataRajesh.Kalakodima@in.bosch.com
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20191015104621.62514-9-jacopo+renesas@jmondi.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <76efb926-7315-cd29-0a49-9284bc1bd5e6@ideasonboard.com>
Date: Tue, 15 Oct 2019 14:04:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015104621.62514-9-jacopo+renesas@jmondi.org>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1571144691;
 bh=ImVQfwXpK2+yZayUnOEJztLA7Et2bLnw2dxEra8Ts1A=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bt7WIdiURvECjFCmmgBPoCT2Wju/m6oOj35+k2aHqB6gcElOeetbp6UEEPc6WPddx
 ASxW1PdiJCOXdFFX5VViPY5m5DlI1fiJq1xhgos+z+q9/Oe5V8vL0PSl0Q35W+/b0y
 F4CuWUB4+S49Q36Pn4Gjs9O/5vr3LGXjBwFZj2Rs=
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: muroya@ksk.co.jp, airlied@linux.ie, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, seanpaul@chromium.org,
 Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gMTUvMTAvMjAxOSAxMTo0NiwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+IEV4
cGFuZCBjb21tZW50IGluIHRoZSAndnNwcycgcGFyc2luZyByb3V0aW5lIHRvIHNwZWNpZnkgdGhl
IExJRgo+IGNoYW5uZWwgaW5kZXggZGVmYXVsdHMgdG8gMCBpbiBjYXNlIHRoZSBzZWNvbmQgY2Vs
bCBvZiB0aGUgcHJvcGVydHkKPiBpcyBub3Qgc3BlY2lmaWVkIHRvIHJlbWFpbiBjb21wYXRpYmxl
IHdpdGggb2xkZXIgRFQgYmluZGluZ3MuCgpSZXZpZXdlZC1ieTogS2llcmFuIEJpbmdoYW0gPGtp
ZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KCj4gUmV2aWV3ZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgfCA2ICsrKysrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jCj4gaW5kZXggN2M5ZmI1ODYwZTU0Li4xODY0MjJh
YzU1MmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKPiBAQCAtNTg3
LDcgKzU4NywxMSBAQCBzdGF0aWMgaW50IHJjYXJfZHVfdnNwc19pbml0KHN0cnVjdCByY2FyX2R1
X2RldmljZSAqcmNkdSkKPiAgCj4gIAkJdnNwc1tqXS5jcnRjc19tYXNrIHw9IEJJVChpKTsKPiAg
Cj4gLQkJLyogU3RvcmUgdGhlIFZTUCBwb2ludGVyIGFuZCBwaXBlIGluZGV4IGluIHRoZSBDUlRD
LiAqLwo+ICsJCS8qCj4gKwkJICogU3RvcmUgdGhlIFZTUCBwb2ludGVyIGFuZCBwaXBlIGluZGV4
IGluIHRoZSBDUlRDLiBJZiB0aGUKPiArCQkgKiBzZWNvbmQgY2VsbCBvZiB0aGUgJ3ZzcHMnIHNw
ZWNpZmllciBpc24ndCBwcmVzZW50LCBkZWZhdWx0Cj4gKwkJICogdG8gMCB0byByZW1haW4gY29t
cGF0aWJsZSB3aXRoIG9sZGVyIERUIGJpbmRpbmdzLgo+ICsJCSAqLwo+ICAJCXJjZHUtPmNydGNz
W2ldLnZzcCA9ICZyY2R1LT52c3BzW2pdOwo+ICAJCXJjZHUtPmNydGNzW2ldLnZzcF9waXBlID0g
Y2VsbHMgPj0gMSA/IGFyZ3MuYXJnc1swXSA6IDA7Cj4gIAl9Cj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
