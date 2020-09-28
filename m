Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9920B27BDB2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A7D89E63;
	Tue, 29 Sep 2020 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF4689DFE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 14:43:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 5769329A5CD
Subject: Re: [PATCH v1 2/2] drm/rockchip: fix warning from cdn_dp_resume
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Heiko Stuebner <heiko@sntech.de>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20200925215524.2899527-1-sam@ravnborg.org>
 <20200925215524.2899527-3-sam@ravnborg.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <dcc5d70e-5c95-be50-a6bf-cee62bed6bf6@collabora.com>
Date: Mon, 28 Sep 2020 16:42:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200925215524.2899527-3-sam@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: linux-rockchip@lists.infradead.org, stable@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLgoKT24gMjUvOS8yMCAyMzo1NSwgU2Ft
IFJhdm5ib3JnIHdyb3RlOgo+IENvbW1pdCA3YzQ5YWJiNGMyZjggKCJkcm0vcm9ja2NoaXA6IGNk
bi1kcC1jb3JlOiBNYWtlIGNkbl9kcF9jb3JlX3N1c3BlbmQvcmVzdW1lIHN0YXRpYyIpCj4gaW50
cm9kdWNlZCB0aGUgZm9sbG93aW5nIHdhcm5pbmcgaW4gc29tZSBidWlsZHM6Cj4gCj4gY2RuLWRw
LWNvcmUuYzoxMTI0OjEyOiB3YXJuaW5nOiDigJhjZG5fZHBfcmVzdW1l4oCZIGRlZmluZWQgYnV0
IG5vdCB1c2VkCj4gIDExMjQgfCBzdGF0aWMgaW50IGNkbl9kcF9yZXN1bWUoc3RydWN0IGRldmlj
ZSAqZGV2KQo+ICAgICAgIHwgICAgICAgICAgICBefn5+fn5+fn5+fn5+Cj4gCj4gRml4IHRoaXMg
YnkgZGVmaW5pbmcgY2RuX2RwX3Jlc3VtZSBfX21heWJlX3VudXNlZAo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBGaXhlczogN2M0OWFiYjRjMmY4
ICgiZHJtL3JvY2tjaGlwOiBjZG4tZHAtY29yZTogTWFrZSBjZG5fZHBfY29yZV9zdXNwZW5kL3Jl
c3VtZSBzdGF0aWMiKQo+IENjOiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRi
b0Bjb2xsYWJvcmEuY29tPgo+IENjOiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+
IENjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgo+IENjOiBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS44Kwo+IC0tLQoKSG9w
ZWZ1bGx5IHRoaXMgdGltZSB0aGlzIGNoYW5nZSBsYW5kcyA7LSkgU2ltaWxhciBwYXRjaGVzIFsx
XSwgWzJdLCBbM10sIHdlcmUKc2VudCBpbiB0aGUgcGFzdCBieSBkaWZmZXJlbnQgYXV0aG9ycyBi
dXQgZm9yIHNvbWUgcmVhc29uIG5ldmVyIHJlYWNoZWQgdXBzdHJlYW0uCgpbMV0gaHR0cHM6Ly9s
a21sLm9yZy9sa21sLzIwMjAvNC8yOC8xNzAzClsyXSBodHRwczovL3d3dy5zcGluaWNzLm5ldC9s
aXN0cy9kcmktZGV2ZWwvbXNnMjY4ODE4Lmh0bWwKWzNdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8y
MDIwLzgvMTAvMTQxMgoKPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5jCj4gaW5kZXggYTRhNDVkYWY5
M2YyLi4xMTYyZTMyMWFhZWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2Nkbi1kcC1jb3JlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNv
cmUuYwo+IEBAIC0xMTIxLDcgKzExMjEsNyBAQCBzdGF0aWMgaW50IGNkbl9kcF9zdXNwZW5kKHN0
cnVjdCBkZXZpY2UgKmRldikKClNob3VsZG4ndCBjZG5fZHBfc3VzcGVuZCBhbHNvIGhhdmUgYSBf
X21heWJlX3VudXNlZD8KCldpdGggdGhhdCwKClJldmlld2VkLWJ5OiBFbnJpYyBCYWxsZXRibyBp
IFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgoKPiAgCXJldHVybiByZXQ7Cj4g
IH0KPiAgCj4gLXN0YXRpYyBpbnQgY2RuX2RwX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4g
K3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgY2RuX2RwX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4gIHsKPiAgCXN0cnVjdCBjZG5fZHBfZGV2aWNlICpkcCA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOwo+ICAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
