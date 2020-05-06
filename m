Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 726651C6BD4
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 10:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F01C6E82C;
	Wed,  6 May 2020 08:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6646E82C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 08:33:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0468XFKH097065;
 Wed, 6 May 2020 03:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588753995;
 bh=qxLW8zfbMo7VUHjzjBXSAyvs4iufNiJAQThCFJXXZvQ=;
 h=Subject:To:References:CC:From:Date:In-Reply-To;
 b=jJ/j4nzKPGh624uH+vhCYYcGX4/AJAgM1/bbUjdPUz73rjWXg4g7eAeg/4Ctv6Anx
 hiOKrJ36WwiuqVW6cpUOyeiM7WQtX7/Yq2btHXsufvD/7ICGTtAwXVp67sF7Ov2Ru5
 y+g/f59tWMjc3o2pcg5FTqPA2aFul46zdfFQNCQY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0468XF0b100984;
 Wed, 6 May 2020 03:33:15 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 03:33:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 03:33:15 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0468XD6p121387;
 Wed, 6 May 2020 03:33:13 -0500
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506072155.6dmj35zdnr3to5ib@rcn-XPS-13-9360>
 <1cee742a-c16a-fb32-5caa-c6ac71689ab9@ti.com>
 <20200506082843.mkhip2n2uiimcf2z@rcn-XPS-13-9360>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a571c6a8-1b36-10fa-e0e1-c535563c62e9@ti.com>
Date: Wed, 6 May 2020 11:33:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506082843.mkhip2n2uiimcf2z@rcn-XPS-13-9360>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYvMDUvMjAyMCAxMToyOCwgUmljYXJkbyBDYcOxdWVsbyB3cm90ZToKPiBIaSBUb21pLAo+
IAo+IE9uIG1pw6kgMDYtMDUtMjAyMCAxMTowMTowNywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+
IERvZXNuJ3QgYWxsIHRoaXMganVzdCBwb2ludCB0byBhIGJ1ZyBvciBtaXNzaW5nIGZlYXR1cmUg
aW4gZHRfYmluZGluZ19jaGVjaz8KPj4gVGhhdCdzIG5vdCBhIHJlYXNvbiB0byBjaGFuZ2UgdGhl
IEFCSS4KPiAKPiBJIGFncmVlIGFuZCBJJ2Qgdm90ZSBmb3IgIm1pc3NpbmcgZmVhdHVyZSIsIGJ1
dCBzZWVpbmcgdGhhdCB0aGVyZSBhcmVuJ3QKPiBhbnkgb3RoZXIgZXhhbXBsZXMgb2YgdGhpcyB1
c2UgY2FzZSBpbiB0aGUgd2hvbGUga2VybmVsIGR0cyBjb2xsZWN0aW9uCj4gKGF0IGxlYXN0IEkg
Y291bGRuJ3QgZmluZCBhbnkpIEkgdGhvdWdodCB0aGF0IG1heWJlIGl0J3MgdXMgd2hvIGFyZQo+
IGdvaW5nIGFnYWluc3QgdGhlIG5vcm0gaGVyZS4KCkEgdmFsaWQgcG9pbnQuIEknbSBub3QgYXdh
cmUgb2YgYW55b25lIHVzaW5nIHRoZSBkZXNrZXcgcHJvcGVydHkuIE15IGd1ZXNzIGlzIHRoYXQg
TGF1cmVudCBhZGRlZCBpdCAKanVzdCBiZWNhdXNlIGl0IHdhcyBpbiB0aGUgc3BlYywgbm90IGJl
Y2F1c2UgaGUgaGFkIGEgbmVlZCBmb3IgaXQuIFNvIEkgZG9uJ3QgdGhpbmsgY2hhbmdpbmcgdGhl
IApiaW5kaW5nIGlzIHRvdGFsbHkgb3V0IG9mIHRoZSBxdWVzdGlvbi4KCiAgVG9taQoKLS0gClRl
eGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNp
bmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxl
OiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
