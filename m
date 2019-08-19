Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8A39211B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A76789AC0;
	Mon, 19 Aug 2019 10:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488406E0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 09:33:26 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud8.xs4all.net with ESMTPA
 id ze2ThLroiDqPeze2Whnf0x; Mon, 19 Aug 2019 11:33:24 +0200
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
To: Dariusz Marcinkiewicz <darekm@google.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <69d57416-c37f-fab9-6436-ec18212cdcce@xs4all.nl>
Date: Mon, 19 Aug 2019 11:33:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-8-darekm@google.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfGM6lUmGz9zyZWI3fKcX5+QUXQVwnmbtd4ywnTRWlTQfulY8WuvWen/e1C8SBsMw1LyCX49D7z2oxYB5vqlnKSgV5x3DxRRdzZftHXIV2tQbQKFU864X
 xh3YIzVAjS+e0sLnm6w/9N8Bxzu9lcWFraZE63V3m4T0sQNnTj2z3nbEJltVd8leQdTBRPUdpwdgOMnHRDXvXYqIFeggT+L9yh/7+HkGvWzjAIGkoZW3NltW
 lmplfgRNALrIX59V+Dp4+VAsIYezmqUmnRJe2Ah1+3AhOtUG5X+7JnXsSMQ8VwGdigWpnqOUAOOhAsbj/lpcXT2cxi7ZZYs4iAa7S9zepy5H+gCgjksdJZzY
 57FfzLAJfMzM4u/RapiWNwvX/9QURM2MGASCbdIIHoOnno9xRL9hw17QDuVt0IcaSFp40O/NwAlirclhhEbXQ9scgJJaTQ==
X-Mailman-Approved-At: Mon, 19 Aug 2019 10:14:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xNC8xOSAxMjo0NSBQTSwgRGFyaXVzeiBNYXJjaW5raWV3aWN6IHdyb3RlOgo+IFVzZSB0
aGUgbmV3IGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3RlcigpIGZ1bmN0aW9ucyB0bwo+ICh1
bilyZWdpc3RlciB0aGUgbm90aWZpZXIgZm9yIHRoZSBIRE1JIGNvbm5lY3RvciwgYW5kIGZpbGwg
aW4KPiB0aGUgY2VjX2Nvbm5lY3Rvcl9pbmZvLgo+IAo+IENoYW5nZXMgc2luY2UgdjQ6Cj4gCS0g
b25seSBjcmVhdGUgYSBDRUMgbm90aWZpZXIgZm9yIEhETUkgY29ubmVjdG9ycwo+IAo+IFNpZ25l
ZC1vZmYtYnk6IERhcml1c3ogTWFyY2lua2lld2ljeiA8ZGFyZWttQGdvb2dsZS5jb20+Cj4gVGVz
dGVkLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4KCkFja2VkLWJ5
OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4KClJlZ2FyZHMsCgoJSGFu
cwoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jIHwgMjggKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291
dHB1dC5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jCj4gaW5kZXggYmRjYWE0Yzcx
NjhjZi4uMzQzNzM3MzRmZjY4OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
b3V0cHV0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKPiBAQCAtNzAs
NiArNzAsMTEgQEAgdGVncmFfb3V0cHV0X2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvciwgYm9vbCBmb3JjZSkKPiAgCj4gIHZvaWQgdGVncmFfb3V0cHV0X2Nv
bm5lY3Rvcl9kZXN0cm95KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIHsKPiAr
CXN0cnVjdCB0ZWdyYV9vdXRwdXQgKm91dHB1dCA9IGNvbm5lY3Rvcl90b19vdXRwdXQoY29ubmVj
dG9yKTsKPiArCj4gKwlpZiAob3V0cHV0LT5jZWMpCj4gKwkJY2VjX25vdGlmaWVyX2Nvbm5fdW5y
ZWdpc3RlcihvdXRwdXQtPmNlYyk7Cj4gKwo+ICAJZHJtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyKGNv
bm5lY3Rvcik7Cj4gIAlkcm1fY29ubmVjdG9yX2NsZWFudXAoY29ubmVjdG9yKTsKPiAgfQo+IEBA
IC0xNjMsMTggKzE2OCwxMSBAQCBpbnQgdGVncmFfb3V0cHV0X3Byb2JlKHN0cnVjdCB0ZWdyYV9v
dXRwdXQgKm91dHB1dCkKPiAgCQlkaXNhYmxlX2lycShvdXRwdXQtPmhwZF9pcnEpOwo+ICAJfQo+
ICAKPiAtCW91dHB1dC0+Y2VjID0gY2VjX25vdGlmaWVyX2dldChvdXRwdXQtPmRldik7Cj4gLQlp
ZiAoIW91dHB1dC0+Y2VjKQo+IC0JCXJldHVybiAtRU5PTUVNOwo+IC0KPiAgCXJldHVybiAwOwo+
ICB9Cj4gIAo+ICB2b2lkIHRlZ3JhX291dHB1dF9yZW1vdmUoc3RydWN0IHRlZ3JhX291dHB1dCAq
b3V0cHV0KQo+ICB7Cj4gLQlpZiAob3V0cHV0LT5jZWMpCj4gLQkJY2VjX25vdGlmaWVyX3B1dChv
dXRwdXQtPmNlYyk7Cj4gLQo+ICAJaWYgKG91dHB1dC0+aHBkX2dwaW8pCj4gIAkJZnJlZV9pcnEo
b3V0cHV0LT5ocGRfaXJxLCBvdXRwdXQpOwo+ICAKPiBAQCAtMTg0LDYgKzE4Miw3IEBAIHZvaWQg
dGVncmFfb3V0cHV0X3JlbW92ZShzdHJ1Y3QgdGVncmFfb3V0cHV0ICpvdXRwdXQpCj4gIAo+ICBp
bnQgdGVncmFfb3V0cHV0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3RydWN0IHRlZ3Jh
X291dHB1dCAqb3V0cHV0KQo+ICB7Cj4gKwlpbnQgY29ubmVjdG9yX3R5cGU7Cj4gIAlpbnQgZXJy
Owo+ICAKPiAgCWlmIChvdXRwdXQtPnBhbmVsKSB7Cj4gQEAgLTE5OSw2ICsxOTgsMjEgQEAgaW50
IHRlZ3JhX291dHB1dF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCB0ZWdyYV9v
dXRwdXQgKm91dHB1dCkKPiAgCWlmIChvdXRwdXQtPmhwZF9ncGlvKQo+ICAJCWVuYWJsZV9pcnEo
b3V0cHV0LT5ocGRfaXJxKTsKPiAgCj4gKwljb25uZWN0b3JfdHlwZSA9IG91dHB1dC0+Y29ubmVj
dG9yLmNvbm5lY3Rvcl90eXBlOwo+ICsJLyoKPiArCSAqIENyZWF0ZSBhIENFQyBub3RpZmllciBm
b3IgSERNSSBjb25uZWN0b3IuCj4gKwkgKi8KPiArCWlmIChjb25uZWN0b3JfdHlwZSA9PSBEUk1f
TU9ERV9DT05ORUNUT1JfSERNSUEgfHwKPiArCSAgICBjb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9E
RV9DT05ORUNUT1JfSERNSUIpIHsKPiArCQlzdHJ1Y3QgY2VjX2Nvbm5lY3Rvcl9pbmZvIGNvbm5f
aW5mbzsKPiArCj4gKwkJY2VjX2ZpbGxfY29ubl9pbmZvX2Zyb21fZHJtKCZjb25uX2luZm8sICZv
dXRwdXQtPmNvbm5lY3Rvcik7Cj4gKwkJb3V0cHV0LT5jZWMgPSBjZWNfbm90aWZpZXJfY29ubl9y
ZWdpc3RlcihvdXRwdXQtPmRldiwgTlVMTCwKPiArCQkJCQkJCSAmY29ubl9pbmZvKTsKPiArCQlp
ZiAoIW91dHB1dC0+Y2VjKQo+ICsJCQlyZXR1cm4gLUVOT01FTTsKPiArCX0KPiArCj4gIAlyZXR1
cm4gMDsKPiAgfQo+ICAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
