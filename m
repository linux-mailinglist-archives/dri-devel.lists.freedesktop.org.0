Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC70092112
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A699898AF;
	Mon, 19 Aug 2019 10:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFAE6E0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 09:34:12 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud8.xs4all.net with ESMTPA
 id ze3DhLs6jDqPeze3GhnfCm; Mon, 19 Aug 2019 11:34:10 +0200
Subject: Re: [PATCH v7 6/9] drm: sti: use cec_notifier_conn_(un)register
To: Dariusz Marcinkiewicz <darekm@google.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-7-darekm@google.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a15b1e04-eba2-355f-f6d5-63423adbfd14@xs4all.nl>
Date: Mon, 19 Aug 2019 11:34:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-7-darekm@google.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfF5nU5CXxglhzuGYwjufLWfPOgbSfyYE/gndi9jVx2tCpYIozKdpDsFYFZ2nAi0rZdszCIRbxFJJrNizXr+nMkETwyZyxw8mD2l/+571x1WYVMOuL3Cq
 x0yiL5yfhbWUW8ihNYlAYHHosB3kZ4v4mhWDEzBrDhg5B7XOb6l7oHr+TeqHFtbh+cW5T6E6MihIbmVfGbC6+iyR322yz+wQnIHJuXAFAEAE8pV2J0XVY2LF
 PPmAIeBklwOOOSfM/4KzlaosU2kbRsJCKGAVOQumDRQh28Lv6bxIccGRYeUASBYjXzzHiDRWjob3sv/gELXXwVmMZGV35vWucTcV736WpxYBRR7p7Ha1Wken
 M5/KfEE+
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
Cc: David Airlie <airlied@linux.ie>, Vincent Abriou <vincent.abriou@st.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xNC8xOSAxMjo0NSBQTSwgRGFyaXVzeiBNYXJjaW5raWV3aWN6IHdyb3RlOgo+IFVzZSB0
aGUgbmV3IGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3RlcigpIGZ1bmN0aW9ucyB0bwo+ICh1
bilyZWdpc3RlciB0aGUgbm90aWZpZXIgZm9yIHRoZSBIRE1JIGNvbm5lY3RvciwgYW5kIGZpbGwK
PiBpbiB0aGUgY2VjX2Nvbm5lY3Rvcl9pbmZvLgo+IAo+IENoYW5nZXMgc2luY2UgdjI6Cj4gCURv
bid0IGludmFsaWRhdGUgcGh5c2ljYWwgYWRkcmVzcyBiZWZvcmUgdW5yZWdpc3RlcmluZyB0aGUK
PiAJbm90aWZpZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFyaXVzeiBNYXJjaW5raWV3aWN6IDxk
YXJla21AZ29vZ2xlLmNvbT4KCkFja2VkLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2Nv
QHhzNGFsbC5ubD4KClJlZ2FyZHMsCgoJSGFucwoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3N0
aS9zdGlfaGRtaS5jIHwgMTkgKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5j
Cj4gaW5kZXggOTg2MmMzMjJmMGM0YS4uYmQxNTkwMmI4MjVhZCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0
aV9oZG1pLmMKPiBAQCAtMTI1Niw2ICsxMjU2LDcgQEAgc3RhdGljIGludCBzdGlfaGRtaV9iaW5k
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+
ICAJc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBkYXRhOwo+ICAJc3RydWN0IGRybV9lbmNv
ZGVyICplbmNvZGVyOwo+ICAJc3RydWN0IHN0aV9oZG1pX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+
ICsJc3RydWN0IGNlY19jb25uZWN0b3JfaW5mbyBjb25uX2luZm87Cj4gIAlzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqZHJtX2Nvbm5lY3RvcjsKPiAgCXN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2U7Cj4g
IAlpbnQgZXJyOwo+IEBAIC0xMzE4LDYgKzEzMTksMTQgQEAgc3RhdGljIGludCBzdGlfaGRtaV9i
aW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRh
KQo+ICAJCWdvdG8gZXJyX3N5c2ZzOwo+ICAJfQo+ICAKPiArCWNlY19maWxsX2Nvbm5faW5mb19m
cm9tX2RybSgmY29ubl9pbmZvLCBkcm1fY29ubmVjdG9yKTsKPiArCWhkbWktPm5vdGlmaWVyID0g
Y2VjX25vdGlmaWVyX2Nvbm5fcmVnaXN0ZXIoJmhkbWktPmRldiwgTlVMTCwKPiArCQkJCQkJICAg
ICZjb25uX2luZm8pOwo+ICsJaWYgKCFoZG1pLT5ub3RpZmllcikgewo+ICsJCWhkbWktPmRybV9j
b25uZWN0b3IgPSBOVUxMOwo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsJfQo+ICsKPiAgCS8qIEVu
YWJsZSBkZWZhdWx0IGludGVycnVwdHMgKi8KPiAgCWhkbWlfd3JpdGUoaGRtaSwgSERNSV9ERUZB
VUxUX0lOVCwgSERNSV9JTlRfRU4pOwo+ICAKPiBAQCAtMTMzMSw2ICsxMzQwLDkgQEAgc3RhdGlj
IGludCBzdGlfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFz
dGVyLCB2b2lkICpkYXRhKQo+ICBzdGF0aWMgdm9pZCBzdGlfaGRtaV91bmJpbmQoc3RydWN0IGRl
dmljZSAqZGV2LAo+ICAJCXN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgewo+
ICsJc3RydWN0IHN0aV9oZG1pICpoZG1pID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gKwo+ICsJ
Y2VjX25vdGlmaWVyX2Nvbm5fdW5yZWdpc3RlcihoZG1pLT5ub3RpZmllcik7Cj4gIH0KPiAgCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgY29tcG9uZW50X29wcyBzdGlfaGRtaV9vcHMgPSB7Cj4gQEAg
LTE0MzYsMTAgKzE0NDgsNiBAQCBzdGF0aWMgaW50IHN0aV9oZG1pX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJZ290byByZWxlYXNlX2FkYXB0ZXI7Cj4gIAl9Cj4gIAo+
IC0JaGRtaS0+bm90aWZpZXIgPSBjZWNfbm90aWZpZXJfZ2V0KCZwZGV2LT5kZXYpOwo+IC0JaWYg
KCFoZG1pLT5ub3RpZmllcikKPiAtCQlnb3RvIHJlbGVhc2VfYWRhcHRlcjsKPiAtCj4gIAloZG1p
LT5yZXNldCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXQoZGV2LCAiaGRtaSIpOwo+ICAJLyogVGFr
ZSBoZG1pIG91dCBvZiByZXNldCAqLwo+ICAJaWYgKCFJU19FUlIoaGRtaS0+cmVzZXQpKQo+IEBA
IC0xNDU5LDE0ICsxNDY3LDExIEBAIHN0YXRpYyBpbnQgc3RpX2hkbWlfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgCXN0cnVjdCBzdGlfaGRtaSAqaGRtaSA9IGRl
dl9nZXRfZHJ2ZGF0YSgmcGRldi0+ZGV2KTsKPiAgCj4gLQljZWNfbm90aWZpZXJfc2V0X3BoeXNf
YWRkcihoZG1pLT5ub3RpZmllciwgQ0VDX1BIWVNfQUREUl9JTlZBTElEKTsKPiAtCj4gIAlpMmNf
cHV0X2FkYXB0ZXIoaGRtaS0+ZGRjX2FkYXB0KTsKPiAgCWlmIChoZG1pLT5hdWRpb19wZGV2KQo+
ICAJCXBsYXRmb3JtX2RldmljZV91bnJlZ2lzdGVyKGhkbWktPmF1ZGlvX3BkZXYpOwo+ICAJY29t
cG9uZW50X2RlbCgmcGRldi0+ZGV2LCAmc3RpX2hkbWlfb3BzKTsKPiAgCj4gLQljZWNfbm90aWZp
ZXJfcHV0KGhkbWktPm5vdGlmaWVyKTsKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
