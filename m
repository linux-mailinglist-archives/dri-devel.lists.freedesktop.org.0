Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698079FCFB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED6489AB7;
	Wed, 28 Aug 2019 08:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net
 [194.109.24.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD7F89113
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:09:36 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud9.xs4all.net with ESMTPA
 id 2t1Gi8eHbzaKO2t1KiK1Bx; Wed, 28 Aug 2019 10:09:34 +0200
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
To: Dariusz Marcinkiewicz <darekm@google.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f0e99db8-3329-f272-e139-a7c713f200ea@xs4all.nl>
Date: Wed, 28 Aug 2019 10:09:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-8-darekm@google.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfN2SLzcWSOO1TeYiDuWm3FiX75qjJsGvgXoX1pwPRTKZ/cG5yJC28sXJWwAO+I967Ki1N2UQLkv9Ajgm/7RLCTZ9ACBucApyEtW22Ly1VAyxQ/KV/WCF
 5r5SuQzzIKC3C1WbZjkWinhnRCPWVNAN/cqva4ufTNqnxjdKSi29ppikdazMh+fnPBUReNX2sZq9SGXKw9b3P1Y+MTPOzbpYmWOqW7fLECZDwx22emctIrrd
 I/2RwIBJqahb8GPFnLhxsAVnGjlbZ+nZnkdST6qJ9GIrsvaAneBjPHDFhcuWoFUhV01bwAx5aVyK0VNf8ro7HFUQc6tO4gjQnybN0zq2Q3On14YmJcQiCqkP
 gUjs4Yf9o00VJzP0OpX7ErBDaCqTxjkDMJ2Lgyu4ab+Djk2Pj8qnu67wbh3i3J9c+pHUf7ElNPpSf/MPR32H19IZ+2DDDALRZnS+WRbgyBGt8Yci/GU=
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpZXJyeSwKCkNhbiB5b3UgcmV2aWV3IHRoaXMgcGF0Y2g/CgpUaGFua3MhCgoJSGFucwoKT24g
OC8xNC8xOSAxMjo0NSBQTSwgRGFyaXVzeiBNYXJjaW5raWV3aWN6IHdyb3RlOgo+IFVzZSB0aGUg
bmV3IGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3RlcigpIGZ1bmN0aW9ucyB0bwo+ICh1bily
ZWdpc3RlciB0aGUgbm90aWZpZXIgZm9yIHRoZSBIRE1JIGNvbm5lY3RvciwgYW5kIGZpbGwgaW4K
PiB0aGUgY2VjX2Nvbm5lY3Rvcl9pbmZvLgo+IAo+IENoYW5nZXMgc2luY2UgdjQ6Cj4gCS0gb25s
eSBjcmVhdGUgYSBDRUMgbm90aWZpZXIgZm9yIEhETUkgY29ubmVjdG9ycwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IERhcml1c3ogTWFyY2lua2lld2ljeiA8ZGFyZWttQGdvb2dsZS5jb20+Cj4gVGVzdGVk
LWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jCj4gaW5kZXggYmRjYWE0YzcxNjhjZi4uMzQzNzM3MzRm
ZjY4OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKPiBAQCAtNzAsNiArNzAsMTEgQEAgdGVn
cmFfb3V0cHV0X2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciwgYm9vbCBmb3JjZSkKPiAgCj4gIHZvaWQgdGVncmFfb3V0cHV0X2Nvbm5lY3Rvcl9kZXN0cm95
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIHsKPiArCXN0cnVjdCB0ZWdyYV9v
dXRwdXQgKm91dHB1dCA9IGNvbm5lY3Rvcl90b19vdXRwdXQoY29ubmVjdG9yKTsKPiArCj4gKwlp
ZiAob3V0cHV0LT5jZWMpCj4gKwkJY2VjX25vdGlmaWVyX2Nvbm5fdW5yZWdpc3RlcihvdXRwdXQt
PmNlYyk7Cj4gKwo+ICAJZHJtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyKGNvbm5lY3Rvcik7Cj4gIAlk
cm1fY29ubmVjdG9yX2NsZWFudXAoY29ubmVjdG9yKTsKPiAgfQo+IEBAIC0xNjMsMTggKzE2OCwx
MSBAQCBpbnQgdGVncmFfb3V0cHV0X3Byb2JlKHN0cnVjdCB0ZWdyYV9vdXRwdXQgKm91dHB1dCkK
PiAgCQlkaXNhYmxlX2lycShvdXRwdXQtPmhwZF9pcnEpOwo+ICAJfQo+ICAKPiAtCW91dHB1dC0+
Y2VjID0gY2VjX25vdGlmaWVyX2dldChvdXRwdXQtPmRldik7Cj4gLQlpZiAoIW91dHB1dC0+Y2Vj
KQo+IC0JCXJldHVybiAtRU5PTUVNOwo+IC0KPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICB2b2lk
IHRlZ3JhX291dHB1dF9yZW1vdmUoc3RydWN0IHRlZ3JhX291dHB1dCAqb3V0cHV0KQo+ICB7Cj4g
LQlpZiAob3V0cHV0LT5jZWMpCj4gLQkJY2VjX25vdGlmaWVyX3B1dChvdXRwdXQtPmNlYyk7Cj4g
LQo+ICAJaWYgKG91dHB1dC0+aHBkX2dwaW8pCj4gIAkJZnJlZV9pcnEob3V0cHV0LT5ocGRfaXJx
LCBvdXRwdXQpOwo+ICAKPiBAQCAtMTg0LDYgKzE4Miw3IEBAIHZvaWQgdGVncmFfb3V0cHV0X3Jl
bW92ZShzdHJ1Y3QgdGVncmFfb3V0cHV0ICpvdXRwdXQpCj4gIAo+ICBpbnQgdGVncmFfb3V0cHV0
X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3RydWN0IHRlZ3JhX291dHB1dCAqb3V0cHV0
KQo+ICB7Cj4gKwlpbnQgY29ubmVjdG9yX3R5cGU7Cj4gIAlpbnQgZXJyOwo+ICAKPiAgCWlmIChv
dXRwdXQtPnBhbmVsKSB7Cj4gQEAgLTE5OSw2ICsxOTgsMjEgQEAgaW50IHRlZ3JhX291dHB1dF9p
bml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCB0ZWdyYV9vdXRwdXQgKm91dHB1dCkK
PiAgCWlmIChvdXRwdXQtPmhwZF9ncGlvKQo+ICAJCWVuYWJsZV9pcnEob3V0cHV0LT5ocGRfaXJx
KTsKPiAgCj4gKwljb25uZWN0b3JfdHlwZSA9IG91dHB1dC0+Y29ubmVjdG9yLmNvbm5lY3Rvcl90
eXBlOwo+ICsJLyoKPiArCSAqIENyZWF0ZSBhIENFQyBub3RpZmllciBmb3IgSERNSSBjb25uZWN0
b3IuCj4gKwkgKi8KPiArCWlmIChjb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1Jf
SERNSUEgfHwKPiArCSAgICBjb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfSERN
SUIpIHsKPiArCQlzdHJ1Y3QgY2VjX2Nvbm5lY3Rvcl9pbmZvIGNvbm5faW5mbzsKPiArCj4gKwkJ
Y2VjX2ZpbGxfY29ubl9pbmZvX2Zyb21fZHJtKCZjb25uX2luZm8sICZvdXRwdXQtPmNvbm5lY3Rv
cik7Cj4gKwkJb3V0cHV0LT5jZWMgPSBjZWNfbm90aWZpZXJfY29ubl9yZWdpc3RlcihvdXRwdXQt
PmRldiwgTlVMTCwKPiArCQkJCQkJCSAmY29ubl9pbmZvKTsKPiArCQlpZiAoIW91dHB1dC0+Y2Vj
KQo+ICsJCQlyZXR1cm4gLUVOT01FTTsKPiArCX0KPiArCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
