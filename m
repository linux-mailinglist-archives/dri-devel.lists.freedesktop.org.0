Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B292F4633
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4626E123;
	Wed, 13 Jan 2021 08:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA5BF89C1F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 02:58:09 +0000 (UTC)
Received: from [10.20.41.29] (unknown [10.20.41.29])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxdbyyYf5f+oQDAA--.3457S2;
 Wed, 13 Jan 2021 10:57:54 +0800 (CST)
Subject: Re: [PATCH] drm: Improve the output_poll_changed description
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210112104644.341345-1-zhangzhijie@loongson.cn>
 <X/2wNLjupzAS7O5c@phenom.ffwll.local>
From: "zhangzhijie@loongson.cn" <zhangzhijie@loongson.cn>
Message-ID: <1e9f3753-48b8-ac65-57a8-2c364b5c8fac@loongson.cn>
Date: Wed, 13 Jan 2021 10:57:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <X/2wNLjupzAS7O5c@phenom.ffwll.local>
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxdbyyYf5f+oQDAA--.3457S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4ftw1kGF15Zw17AF18Zrb_yoW8uryUpr
 W3A3yYkr4qgFs09F4xKa4IgF18Jws3JFW8tFsYgw4Ykrn8KrnFvFyDGr15uF9xXrZrJr42
 qayS9F98uw18CrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
 xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
 0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
 r21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
 uYvjxUqEoXUUUUU
X-CM-SenderInfo: x2kd0wx2klyx3h6o00pqjv00gofq/1tbiAQAAAF3QvM14lwABsT
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxLzEyLzIxIDEwOjIwIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFR1ZSwgSmFu
IDEyLCAyMDIxIGF0IDA2OjQ2OjQ0UE0gKzA4MDAsIFpoaUppZS5aaGFuZyB3cm90ZToKPj4gRnJv
bTogemhhbmd6aGlqaWUgPHpoYW5nemhpamllQGxvb25nc29uLmNuPgo+Pgo+PiBjb2RldmlldyB0
aGUgaW1wbGVtZW50YXRpb24gb2YgZmV3IERyaXZlcnMuCj4gCj4gSSdtIG5vdCByZWFsbHkgdW5k
ZXJzdGFuZGluZyB3aGF0IHlvdSdyZSB0cnlpbmcgdG8gc2F5IGhlcmUuCj4gCkkgZXhjICJtYWtl
ICBodG1scyIgYW5kIHJlYWQgdGhlIGdwdSdzIGh0bWwgdmlhIGJyb3dzZXIuCnRoZW4gZm91bmRl
ZCB0aGF0IGRybV9mYl9oZWxwZXJfaG90cGx1Z19jaGFuZ2VkIG5vdCBhIHRhZyBpbiBrZXJuZWwu
CnRoZW4gSSB0b3VjaCB0aGlzIGNhbGxiYWNrIGJlZW4gY2FsbGVkIHZpYSBkcm1fa21zX2hlbHBl
cl9ob3RwbHVnX2V2ZW50KCkuCgpTb3Jyee+8jCBJIHdpbGwgZGVsZXRlIHRoaXMgd29yZHMgYXQg
bmV4dCBwdXNoCgo+PiB0aGlzIGNhbGxiYWNrIHdhcyB1c2VkIGJ5IGRybV9rbXNfaGVscGVyX2hv
dHBsdWdfZXZlbnQoKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiB6aGFuZ3poaWppZSA8emhhbmd6aGlq
aWVAbG9vbmdzb24uY24+Cj4+IC0tLQo+PiAgIGluY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5o
IHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggYi9pbmNs
dWRlL2RybS9kcm1fbW9kZV9jb25maWcuaAo+PiBpbmRleCBhYjQyNGRkZDc2NjUuLmUwMWM0ZDBm
MDdkMSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgKPj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgKPj4gQEAgLTEwNCw3ICsxMDQsNyBAQCBz
dHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIHsKPj4gICAJICogY2hhbmdlcy4KPj4gICAJICoK
Pj4gICAJICogRHJpdmVycyBpbXBsZW1lbnRpbmcgZmJkZXYgZW11bGF0aW9uIHdpdGggdGhlIGhl
bHBlcnMgY2FuIGNhbGwKPj4gLQkgKiBkcm1fZmJfaGVscGVyX2hvdHBsdWdfY2hhbmdlZCBmcm9t
IHRoaXMgaG9vayB0byBpbmZvcm0gdGhlIGZiZGV2Cj4+ICsJICogZHJtX2ttc19oZWxwZXJfaG90
cGx1Z19ldmVudCgpIGZyb20gdGhpcyBob29rIHRvIGluZm9ybSB0aGUgZmJkZXYKPj4gICAJICog
aGVscGVyIG9mIG91dHB1dCBjaGFuZ2VzLgo+IAo+IEkgdGhpbmsgc2luY2Ugd2UgdG91Y2ggdGhp
cywgbWF5YmUgYmV0dGVyIHRvIHJldmFtcCBpdCBjb21wbGV0ZS4gVGhlIGJlc3QKPiB3YXkgdG8g
aGFuZGxlIGFsbCB0aGlzIGlzIGJ5IHJlZ2lzdGVyaW5nIGEgc3RydWN0IGRybV9jbGllbnQsIHNp
bmNlIHRoYXQKPiBwcm92aWRlcyB0aGUgJmRybV9jbGllbnRfZnVuY3MuaG90cGx1ZyBjYWxsYmFj
ay4gQWxzbyBmb3IgZmJkZXYgc3VwcG9ydAo+IGRyaXZlcnMgc2hvdWxkbid0IGV2ZW4gdXNlIHRo
YXQsIGJ1dCBpbnN0ZWFkIHVzZSB0aGUKPiBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgpIGZ1bmN0
aW9uLCB3aGljaCB0YWtlcyBjYXJlIG9mIGV2ZXJ5dGhpbmcuCj4gCj4gSSB0aGluayB3ZSBjYW4g
YWxzbyByZW1vdmUgdGhlIEZJWE1FIGJlbG93LCBzaW5jZSB3aXRoIHRoZSBkcm1fY2xpZW50Cj4g
aW5mcmFzdHJ1Y3R1cmUgYW5kIHRoZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbiB3ZSd2ZSByZXNv
bHZlZCB0aGlzIGFsbAo+IHZlcnkgbmVhdGx5IG5vdy4KPiAKPiBDYW4geW91IHBsZWFzZSByZXNw
aW4gd2l0aCBteSBzdWdnZXN0aW9ucyB0YWtpbmcgaW50byBhY2NvdW50IHNvbWVob3c/Cj4gCj4g
VGhhbmtzLCBEYW5pZWwKPiAKQ291bGQgaSBjb3B5IHRoaXMgd29yZHMgdG8gY29tbWVudCBvZiBv
dXRwdXRfcG9sbF9jaGFuZ2VkPwpJIHdhbnQgYmV0dGVyIHJlYWRpbmcgdGhlIGdwdSdzIGNoYXB0
ZXIgYXQga2VybmVsIGRvYwoKVGhhbmtz77yMWmhpSmllCj4+ICAgCSAqCj4+ICAgCSAqIEZJWE1F
Ogo+PiAtLSAKPj4gMi4yOS4yCj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
