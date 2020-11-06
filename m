Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D592A9761
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 15:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40D06EA88;
	Fri,  6 Nov 2020 14:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CFB6EA88
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 14:03:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6E3EUv127757;
 Fri, 6 Nov 2020 08:03:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604671394;
 bh=5+kSDz856W1qx9cgvwWKSlzBi71LyL62j0NDBZaEQl0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=O2WSFqsFIMe0Q1RSP2MCw3LBR7/jynlpK8Bsc0sn52XZ1/TE1GpkdpB/jGG6FCXwG
 FD8n4kIsQ5cc/B9YoO1p4ojNYkzCjcmQdXynVKkXU/Rf2ZX5NkkdRLNgkRQ+oRt8v+
 gEXlCrvoznkcWRUKnYGCEnXKMZoPnbPke7DNPvao=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6E3E6n100939
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 6 Nov 2020 08:03:14 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 08:03:13 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 08:03:13 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6E3BJf004038;
 Fri, 6 Nov 2020 08:03:12 -0600
Subject: Re: [PATCH 08/19] gpu: drm: omapdrm: dss: dsi: Rework and remove a
 few unused variables
To: Lee Jones <lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-9-lee.jones@linaro.org>
 <74399fab-6af5-77d3-e0eb-749774eb2837@ti.com> <20201105180725.GO4488@dell>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <e48964e6-4a94-4495-0217-90db19fff629@ti.com>
Date: Fri, 6 Nov 2020 16:03:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105180725.GO4488@dell>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUvMTEvMjAyMCAyMDowNywgTGVlIEpvbmVzIHdyb3RlOgo+IE9uIFRodSwgMDUgTm92IDIw
MjAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+IAo+PiBPbiAwNS8xMS8yMDIwIDE2OjQ1LCBMZWUg
Sm9uZXMgd3JvdGU6Cj4+PiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2Fy
bmluZyhzKToKPj4+Cj4+PiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jOiBJbiBm
dW5jdGlvbiDigJhfZHNpX3ByaW50X3Jlc2V0X3N0YXR1c+KAmToKPj4+ICBkcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9kc3MvZHNpLmM6MTEzMTo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhs4oCZIHNl
dCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4+PiAgZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jOiBJbiBmdW5jdGlvbiDigJhkc2lfdXBkYXRl4oCZOgo+
Pj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYzozOTQzOjEwOiB3YXJuaW5nOiB2
YXJpYWJsZSDigJhkaOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlXQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYzozOTQzOjY6IHdhcm5p
bmc6IHZhcmlhYmxlIOKAmGR34oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCj4+Pgo+Pj4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5j
b20+Cj4+PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+Pj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPj4+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+Pj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYyB8
IDkgKystLS0tLS0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKPj4KPj4gSSdkIHVzZSAiZHJtL29tYXA6IGRzaTogIiBzdWJqZWN0IHByZWZpeCwg
dGhlIGN1cnJlbnQgb25lIGlzIGZpbmUgdG9vOgo+Pgo+PiBSZXZpZXdlZC1ieTogVG9taSBWYWxr
ZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPj4KPj4gU2hvdWxkIEkgcGljayB0aGlzIHVw
IG9yIGRvIHlvdSB3YW50IHRvIGtlZXAgdGhlIHNlcmllcyBpbnRhY3Q/Cj4gCj4gSWYgeW91IGFy
ZSBpbiBhIHBvc2l0aW9uIHRvIHRha2UgaXQsIHBsZWFzZSBkbyBzby4KPiAKPiBJIHJlYmFzZSBl
dmVyeSBkYXksIHNvIGl0IHdpbGwganVzdCB2YW5pc2ggZnJvbSBteSB3b3JraW5nIHNldC4KCkkg
aGF2ZSBhIDU2IHBhdGNoIHNlcmllcyBvbiBkc2kuYyB0aGF0IEkgc2VudCB5ZXN0ZXJkYXksIGFu
ZCBpdCBjb25mbGljdHMgd2l0aCB0aGlzIG9uZS4gSSdsbCBwaWNrCnRoaXMgb25lIG9uIHRvcCBv
ZiBteSBzZXJpZXMuCgogVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBv
cmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYx
NTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
