Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BA824AFF8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91176E917;
	Thu, 20 Aug 2020 07:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3363C6E8B2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 06:36:39 +0000 (UTC)
Received: by ajax-webmail-mail-app3 (Coremail) ; Thu, 20 Aug 2020 14:36:35
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.85.18]
Date: Thu, 20 Aug 2020 14:36:35 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Lee Jones" <lee.jones@linaro.org>
Subject: Re: Re: Re: [PATCH] video: backlight: sky81452-backlight: Fix
 reference count imbalance on error
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <20200820062301.GD3248864@dell>
References: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
 <20200819165702.GC3248864@dell>
 <217e3c0c.b58c.17409fd7496.Coremail.dinghao.liu@zju.edu.cn>
 <20200820062301.GD3248864@dell>
MIME-Version: 1.0
Message-ID: <3f9fbdb1.bc96.1740a9560d5.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgA3Ut7zGT5fQkbuAg--.44418W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoSBlZdtPnBhAAUsL
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbAvS07vEb7Iv0x
 C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
 bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
 CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
 xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
 07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
 AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
 6r4UMIAIbVACI402YVCY1x02628vn2kIc2xKxwCS07vE7I0Y64k_MIAIbVCY0x0Ix7I2Y4
 AK64vIr41lV2xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY
 6xC20s026xCaFVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s
 026x8GjcxK67AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUtVW8ZwCS07vEIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIAIbV
 CI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lV2xY6IIF0xvEx4A2jsIE14v26r1j6r4U
 MIAIbVCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73U
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:48 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Gyungoh Yoo <jack.yoo@skyworksinc.com>, Bryan Wu <cooloney@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Elfring <Markus.Elfring@web.de>,
 Jingoo Han <jingoohan1@gmail.com>, Kangjie Lu <kjlu@umn.edu>,
 Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiBUaHUsIDIwIEF1ZyAyMDIwLCBkaW5naGFvLmxpdUB6anUuZWR1LmNuIHdyb3RlOgo+IAo+
ID4gPiBPbiBXZWQsIDE5IEF1ZyAyMDIwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToKPiA+ID4gCj4g
PiA+ID4gPiBXaGVuIG9mX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KCkgcmV0dXJucyBhbiBlcnJv
ciBjb2RlLAo+ID4gPiA+ID4gYSBwYWlyaW5nIHJlZmNvdW50IGRlY3JlbWVudCBpcyBuZWVkZWQg
dG8ga2VlcCBucCdzIHJlZmNvdW50IGJhbGFuY2VkLgo+ID4gPiA+IAo+ID4gPiA+IENhbiBhbm90
aGVyIGltcGVyYXRpdmUgd29yZGluZyBiZSBoZWxwZnVsIGZvciB0aGUgY2hhbmdlIGRlc2NyaXB0
aW9uPwo+ID4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0
aW5nLXBhdGNoZXMucnN0P2lkPTE4NDQ1YmY0MDVjYjMzMTExN2JjOTg0MjdiMWJhNmYxMjQxOGFk
MTcjbjE1MQo+ID4gPiA+IAo+ID4gPiA+IFdvdWxkIGFuIG90aGVyIGNvbW1pdCBtZXNzYWdlIGJl
IGEgYml0IG5pY2VyPwo+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IOKApgo+ID4gPiA+ID4gKysr
IGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvc2t5ODE0NTItYmFja2xpZ2h0LmMKPiA+ID4gPiA+
IEBAIC0yMTcsNiArMjE3LDcgQEAgc3RhdGljIHN0cnVjdCBza3k4MTQ1Ml9ibF9wbGF0Zm9ybV9k
YXRhICpza3k4MTQ1Ml9ibF9wYXJzZV9kdCgKPiA+ID4gPiA+ICAJCQkJCW51bV9lbnRyeSk7Cj4g
PiA+ID4gPiAgCQlpZiAocmV0IDwgMCkgewo+ID4gPiA+ID4gIAkJCWRldl9lcnIoZGV2LCAibGVk
LXNvdXJjZXMgbm9kZSBpcyBpbnZhbGlkLlxuIik7Cj4gPiA+ID4gPiArCQkJb2Zfbm9kZV9wdXQo
bnApOwo+ID4gPiA+ID4gIAkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+ID4gPiA+ID4gIAkJ
fQo+ID4gPiA+IAo+ID4gPiA+IEkgcHJvcG9zZSB0byBhZGQgdGhlIGp1bXAgdGFyZ2V0IOKAnHB1
dF9ub2Rl4oCdIHNvIHRoYXQgYSBiaXQgb2YgY29tbW9uIGV4Y2VwdGlvbgo+ID4gPiA+IGhhbmRs
aW5nIGNvZGUgY2FuIGJlIGJldHRlciByZXVzZWQgYXQgdGhlIGVuZCBvZiB0aGlzIGZ1bmN0aW9u
IGltcGxlbWVudGF0aW9uLgo+ID4gPiA+IAo+ID4gPiA+IFJlZ2FyZHMsCj4gPiA+ID4gTWFya3Vz
Cj4gPiA+IAo+ID4gPiBZb3UgY2FuIHNhZmVseSBpZ25vcmUgYW55IHJldmlldyBjb21tZW50cyBm
cm9tIE1hcmt1cyEKPiA+ID4gCj4gPiA+IEhvd2V2ZXIsIHRoaXMgcGF0Y2ggZG9lc24ndCBhcHBl
YXIgdG8gYmUgaW4gbXkgaW5ib3guCj4gPiA+IAo+ID4gPiBBbnkgaWRlYXMgYXMgdG8gd2h5Pwo+
ID4gPiAKPiA+IAo+ID4gVGhhbmsgeW91IGZvciB5b3VyIGFkdmljZS4gTXkgb3V0Ym94IHNob3dz
IHRoYXQgdGhpcyBwYXRjaAo+ID4gaGFzIHJlYWNoZWQgeW91ciBlbWFpbCBzZXJ2ZXIgc3VjY2Vz
c2Z1bGx5LiBNYXliZSB0aGlzCj4gPiBlbmRlZCB1cCBpbiB5b3VyIGp1bmsgbWFpbCBmaWxlPwo+
IAo+IFRoaXMgaGFzIGhhcHBlbmVkIHJlY2VudGx5LCBzbyBJIHdhcyBzdXJlIHRvIGNoZWNrLgo+
IAo+IE5vdCB0aGVyZSBlaXRoZXIgdW5mb3J0dW5hdGVseS4KPiAKPiBXb3VsZCB5b3UgYmUga2lu
ZCBlbm91Z2ggdG8gYm91bmNlL3Jlc2VuZCBwbGVhc2U/Cj4gCgpTdXJlLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
