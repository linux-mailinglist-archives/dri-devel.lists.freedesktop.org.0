Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F74B18DE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6361C6EEA3;
	Fri, 13 Sep 2019 07:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AB26ECE7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 11:40:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdpeK074141;
 Thu, 12 Sep 2019 06:39:51 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CBdpqu008220
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Sep 2019 06:39:51 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 06:39:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 06:39:50 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdoVV107454;
 Thu, 12 Sep 2019 06:39:50 -0500
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
To: Andreas Kemnade <andreas@kemnade.info>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>,
 <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <b.zolnierkie@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-leds@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fbdev@vger.kernel.org>, "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20190911172106.12843-1-andreas@kemnade.info>
 <20190911172106.12843-2-andreas@kemnade.info>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <ff410d6c-e1e8-7c96-e8f7-0a0deb816f6a@ti.com>
Date: Thu, 12 Sep 2019 06:39:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911172106.12843-2-andreas@kemnade.info>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568288391;
 bh=S3Uw7YV4iduTm2oKlG6534ijPPVci6yUlAzgg9rmfq8=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=GeL8p8ROhUPfObNUFk/PLBiwXl4tBAb2eJPfeob4pLukY7J5A74Wet9FPQ604ClwE
 rpAL1zeAz19IimtEarFIGg8wkgxTmJXiAhsoH6QHTlRvWXoYz+tCcVIP6HuZq0wpV6
 Lr956nAtEz5pNjR6KzKPBoZ6ilx+yMGFpWnRn6As=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kcmVhcwoKT24gOS8xMS8xOSAxMjoyMSBQTSwgQW5kcmVhcyBLZW1uYWRlIHdyb3RlOgo+IGFk
ZCBlbmFibGUtZ3Bpb3MgdG8gZGVzY3JpYmUgSFdFTiBwaW4KPgo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJlYXMgS2VtbmFkZSA8YW5kcmVhc0BrZW1uYWRlLmluZm8+Cj4gQWNrZWQtYnk6IERhbmllbCBU
aG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4gY2hhbmdlcyBpbiB2
MjogYWRkZWQgZXhhbXBsZQo+IGNoYW5nZXMgaW4gdjM6IGFkZGVkIEFja2VkLWJ5Cj4gICAuLi4v
YmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbCAgICAgICAgICAg
fCA1ICsrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xt
MzYzMGEtYmFja2xpZ2h0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbAo+IGluZGV4IGRjMTI5ZDlhMzI5
ZS4uMWZhODNmZWZmZTE2IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55YW1sCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFj
a2xpZ2h0LnlhbWwKPiBAQCAtMjksNiArMjksMTAgQEAgcHJvcGVydGllczoKPiAgICAgJyNzaXpl
LWNlbGxzJzoKPiAgICAgICBjb25zdDogMAo+ICAgCj4gKyAgZW5hYmxlLWdwaW9zOgo+ICsgICAg
ZGVzY3JpcHRpb246IEdQSU8gdG8gdXNlIHRvIGVuYWJsZS9kaXNhYmxlIHRoZSBiYWNrbGlnaHQg
KEhXRU4gcGluKS4KPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICAgcmVxdWlyZWQ6Cj4gICAgIC0g
Y29tcGF0aWJsZQo+ICAgICAtIHJlZwo+IEBAIC05Miw2ICs5Niw3IEBAIGV4YW1wbGVzOgo+ICAg
ICAgIGkyYyB7Cj4gICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAgICAgICAgICAj
c2l6ZS1jZWxscyA9IDwwPjsKPiArICAgICAgICBlbmFibGUtZ3Bpb3MgPSA8JmdwaW8yIDUgR1BJ
T19BQ1RJVkVfSElHSD47Cj4gICAKPiAgICAgICAgICAgbGVkLWNvbnRyb2xsZXJAMzggewo+ICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGksbG0zNjMwYSI7CgpMb29rcyBnb29kIHRv
IG1lCgpSZXZpZXdlZC1ieTogRGFuIE11cnBoeSA8ZG11cnBoeUB0aS5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
