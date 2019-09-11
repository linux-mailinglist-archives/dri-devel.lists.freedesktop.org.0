Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4924CB00E4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 18:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7ED6EB47;
	Wed, 11 Sep 2019 16:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5FF6EB47
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 16:06:39 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF88C33A;
 Wed, 11 Sep 2019 18:06:36 +0200 (CEST)
Subject: Re: [PATCH v4 2/9] dt-bindings: display, renesas,du: Document cmms
 property
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com, geert@linux-m68k.org, horms@verge.net.au,
 uli+renesas@fpond.eu, VenkataRajesh.Kalakodima@in.bosch.com
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-3-jacopo+renesas@jmondi.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2bcbb30c-db36-38a1-dcff-4f4269c11ad6@ideasonboard.com>
Date: Wed, 11 Sep 2019 17:06:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906135436.10622-3-jacopo+renesas@jmondi.org>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568217997;
 bh=F2dlj/MFhkCIb/9CSt/w8Fw5jSo4ioGNSYWJmqdIqPY=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qdsaUQYM6hhd68U1apolZTzXB9co1nILTU0yuAVKimxwB0wlDzP++mspv/miVEfr+
 An2oEmr6fbOzXHdV1hL2ArT97vQ9oQH32eOL8jyob6Pmp8r24Q37cG3PkZrB4R6ECs
 BwWHzNIl91Psdsne5U5s8D+NNwhFBw7ylnvXCuGE=
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
Cc: muroya@ksk.co.jp, devicetree@vger.kernel.org, airlied@linux.ie,
 mark.rutland@arm.com, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gMDYvMDkvMjAxOSAxNDo1NCwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+IERv
Y3VtZW50IHRoZSBuZXdseSBhZGRlZCAnY21tcycgcHJvcGVydHkgd2hpY2ggYWNjZXB0cyBhIGxp
c3Qgb2YgcGhhbmRsZQo+IGFuZCBjaGFubmVsIGluZGV4IHBhaXJzIHRoYXQgcG9pbnQgdG8gdGhl
IENNTSB1bml0cyBhdmFpbGFibGUgZm9yIGVhY2gKPiBEaXNwbGF5IFVuaXQgb3V0cHV0IHZpZGVv
IGNoYW5uZWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNh
c0BqbW9uZGkub3JnPgo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0IHwgNSArKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQKPiBpbmRleCBjOTdkZmFj
YWQyODEuLjE3NzNiMGEyZjU0ZiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0Cj4gQEAgLTQ1LDYgKzQ1
LDEwIEBAIFJlcXVpcmVkIFByb3BlcnRpZXM6Cj4gICAgICBpbnN0YW5jZSB0aGF0IHNlcnZlcyB0
aGUgRFUgY2hhbm5lbCwgYW5kIHRoZSBjaGFubmVsIGluZGV4IGlkZW50aWZpZXMgdGhlCj4gICAg
ICBMSUYgaW5zdGFuY2UgaW4gdGhhdCBWU1AuCj4gCj4gKyAgLSByZW5lc2FzLGNtbXM6IEEgbGlz
dCBvZiBwaGFuZGxlcyB0byB0aGUgQ01NIGluc3RhbmNlcyBwcmVzZW50IGluIHRoZSBTb0MsCj4g
KyAgICBvbmUgZm9yIGVhY2ggYXZhaWxhYmxlIERVIGNoYW5uZWwuIFRoZSBwcm9wZXJ0eSBzaGFs
bCBub3QgYmUgc3BlY2lmaWVkIGZvcgo+ICsgICAgU29DcyB0aGF0IGRvIG5vdCBwcm92aWRlIGFu
eSBDTU0gKHN1Y2ggYXMgVjNNIGFuZCBWM0gpLgo+ICsKPiAgUmVxdWlyZWQgbm9kZXM6Cj4gCj4g
IFRoZSBjb25uZWN0aW9ucyB0byB0aGUgRFUgb3V0cHV0IHZpZGVvIHBvcnRzIGFyZSBtb2RlbGVk
IHVzaW5nIHRoZSBPRiBncmFwaAo+IEBAIC05MSw2ICs5NSw3IEBAIEV4YW1wbGU6IFI4QTc3OTUg
KFItQ2FyIEgzKSBFUzIuMCBEVQo+ICAJCQkgPCZjcGcgQ1BHX01PRCA3MjE+Owo+ICAJCWNsb2Nr
LW5hbWVzID0gImR1LjAiLCAiZHUuMSIsICJkdS4yIiwgImR1LjMiOwo+ICAJCXZzcHMgPSA8JnZz
cGQwIDA+LCA8JnZzcGQxIDA+LCA8JnZzcGQyIDA+LCA8JnZzcGQwIDE+Owo+ICsJCXJlbmVzYXMs
Y21tcyA9IDwmY21tMCAmY21tMSAmY21tMiAmY21tMz47CgpTaG91bGQgdGhlc2UgYmUgY29tbWEg
c2VwYXJhdGVkIGluIHRoZSBzYW1lIGZhc2hpb24gYXMgdGhlIHZzcHMgYXJlCnNlcGFyYXRlZD8K
CkkgZG9uJ3QgcmVhbGx5IG1pbmQgZWl0aGVyIHdheSB0aG91Z2ggLi4uCgpSZXZpZXdlZC1ieTog
S2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4K
Cgo+IAo+ICAJCXBvcnRzIHsKPiAgCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gLS0KPiAyLjIz
LjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
