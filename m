Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44CF10E9FC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 13:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944B589415;
	Mon,  2 Dec 2019 12:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDA789415
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 12:19:24 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so10176634wmi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 04:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qcdSiJtJa2r1hOY/UmPkr5XNRItjfrnnqMwfORdQntw=;
 b=jykd7zBf8fn6TLoe6mHlDtMS66FKfr8owhkoYO0JaW3D1WrOZWKAe5kBwtV9pLMDTM
 V4eeZCCBVe6+uYA72HuFcOqXA0CI7e1FhFHI30kQZyfoL04yCDT5BdXk4crMLBXI4Bhx
 OAUij49I79qNw8mlX/9z9K7QXOOG8KMcE5LTgtReMPWJMME7q4s65p7z+ypkq4/qb351
 1qBFfYgoriE5kDzEeIxqxJEKV4iOwdgQ/XH9nF/8ntCkYyehxMVGmQiC5e/nt0PZcllo
 CzAzXDvGhsrQKFlP+bIwnWTmxJ+gP1j2u4LpgOl+tJoVjxGY0wZZ/KLZXrFKQ2hcu52G
 JSNg==
X-Gm-Message-State: APjAAAXpidQ+5OSWT+JwpVd36YnNNztQiL0GmEpUZPWBNOm8tMOwXx/i
 1yjF1fJrSfkrwDRSu1zfre8ALQ==
X-Google-Smtp-Source: APXvYqxEgWprdeJ4DzSsOX3LCekn8ey0QXM5KAuxeoD+oR+/wvmVobRy73JK2VhKMKDp5FilFzeRqg==
X-Received: by 2002:a1c:6456:: with SMTP id y83mr28125485wmb.48.1575289163069; 
 Mon, 02 Dec 2019 04:19:23 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 16sm22001774wmf.0.2019.12.02.04.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 04:19:22 -0800 (PST)
Date: Mon, 2 Dec 2019 12:19:20 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: bd6107: Convert to use GPIO descriptor
Message-ID: <20191202121920.b2hnu5tk7r6vcsat@holly.lan>
References: <20191202103028.102770-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202103028.102770-1-linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qcdSiJtJa2r1hOY/UmPkr5XNRItjfrnnqMwfORdQntw=;
 b=oSymOv5/4+6dNG/PNWHsoSh4yrlBtA+Ou8NfGfUIy7XQR1ZW03FZRv+phkKGq2FpSi
 K3qp0mnW3nYB4EqK71LUTJ6rQMB9kPBDa7E9ctZTndx3Ln3mrV9LgMVNnBCKHcnP0toM
 3xGKAT5uDnTnBk9h6svoWoiC7nbvo3z7hTPgz69/h1rXpxOJguQlIP0Z1P3nWkwLffsE
 EBDdCPAQ7T1dgF1N+FD275jF7zM3VHZhCsyWveRB5uFZgJy2hRNKTZEmih6ges4LhMdw
 ZF+znJ02PgJBQfiyF6phFga01zcjnnvQbwUQpg326m36pAjFDcMa12n4TXWmyluJ6O0m
 e0Vw==
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMTE6MzA6MjhBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBUaGUgUm9obSBCRDYxMDcgZHJpdmVyIGNhbiBwYXNzIGEgZml4ZWQgR1BJTyBsaW5l
IHVzaW5nIHRoZSBvbGQKPiBHUElPIEFQSSB1c2luZyBwbGF0Zm9ybSBkYXRhLiBBcyB0aGVyZSBh
cmUgbm8gaW4tdHJlZSB1c2VycyBvZiB0aGlzCj4gcGxhdGZvcm0gZGF0YSBzaW5jZSAyMDEzLCB3
ZSBjYW4gY29udmVydCB0aGlzIHRvIHVzZSBhIEdQSU8gZGVzY3JpcHRvcgo+IGFuZCByZXF1aXJl
IGFueSBvdXQtb2YtdHJlZSBjb25zdW1lcnMgdG8gcGFzcyB0aGUgR1BJTyB1c2luZwo+IGEgbWFj
aGluZSBkZXNjcmlwdG9yIHRhYmxlIGluc3RlYWQuCj4gCj4gQ2M6IExhdXJlbnQgUGluY2hhcnQg
PGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMaW51
cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogRGFuaWVs
IFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2JkNjEwNy5jICAgICB8IDI0ICsrKysrKysrKysrKysrKystLS0tLS0t
LQo+ICBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvYmQ2MTA3LmggfCAgMSAtCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYmQ2MTA3LmMgYi9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9iZDYxMDcuYwo+IGluZGV4IGQzNDRmYjAzY2I4Ni4uZDVkNWZiNDU3ZTc4IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2JkNjEwNy5jCj4gKysrIGIvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvYmQ2MTA3LmMKPiBAQCAtMTEsNyArMTEsNyBAQAo+ICAjaW5jbHVk
ZSA8bGludXgvZGVsYXkuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ICAjaW5jbHVkZSA8
bGludXgvZmIuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L2dwaW8uaD4KPiArI2luY2x1ZGUgPGxpbnV4
L2dwaW8vY29uc3VtZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgo+ICAjaW5jbHVkZSA8
bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kYXRhL2JkNjEwNy5o
Pgo+IEBAIC03MSw2ICs3MSw3IEBAIHN0cnVjdCBiZDYxMDcgewo+ICAJc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudDsKPiAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpiYWNrbGlnaHQ7Cj4gIAlz
dHJ1Y3QgYmQ2MTA3X3BsYXRmb3JtX2RhdGEgKnBkYXRhOwo+ICsJc3RydWN0IGdwaW9fZGVzYyAq
cmVzZXQ7Cj4gIH07Cj4gIAo+ICBzdGF0aWMgaW50IGJkNjEwN193cml0ZShzdHJ1Y3QgYmQ2MTA3
ICpiZCwgdTggcmVnLCB1OCBkYXRhKQo+IEBAIC05NCw5ICs5NSwxMCBAQCBzdGF0aWMgaW50IGJk
NjEwN19iYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyhzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmFj
a2xpZ2h0KQo+ICAJCWJkNjEwN193cml0ZShiZCwgQkQ2MTA3X01BSU5DTlQxLCBicmlnaHRuZXNz
KTsKPiAgCQliZDYxMDdfd3JpdGUoYmQsIEJENjEwN19MRURDTlQxLCBCRDYxMDdfTEVEQ05UMV9M
RURPTk9GRjEpOwo+ICAJfSBlbHNlIHsKPiAtCQlncGlvX3NldF92YWx1ZShiZC0+cGRhdGEtPnJl
c2V0LCAwKTsKPiArCQkvKiBBc3NlcnQgdGhlIHJlc2V0IGxpbmUgKGdwaW9saWIgd2lsbCBoYW5k
bGUgYWN0aXZlIGxvdykgKi8KPiArCQlncGlvZF9zZXRfdmFsdWUoYmQtPnJlc2V0LCAxKTsKPiAg
CQltc2xlZXAoMjQpOwo+IC0JCWdwaW9fc2V0X3ZhbHVlKGJkLT5wZGF0YS0+cmVzZXQsIDEpOwo+
ICsJCWdwaW9kX3NldF92YWx1ZShiZC0+cmVzZXQsIDApOwo+ICAJfQo+ICAKPiAgCXJldHVybiAw
Owo+IEBAIC0xMjUsOCArMTI3LDggQEAgc3RhdGljIGludCBiZDYxMDdfcHJvYmUoc3RydWN0IGky
Y19jbGllbnQgKmNsaWVudCwKPiAgCXN0cnVjdCBiZDYxMDcgKmJkOwo+ICAJaW50IHJldDsKPiAg
Cj4gLQlpZiAocGRhdGEgPT0gTlVMTCB8fCAhcGRhdGEtPnJlc2V0KSB7Cj4gLQkJZGV2X2Vycigm
Y2xpZW50LT5kZXYsICJObyByZXNldCBHUElPIGluIHBsYXRmb3JtIGRhdGFcbiIpOwo+ICsJaWYg
KHBkYXRhID09IE5VTEwpIHsKPiArCQlkZXZfZXJyKCZjbGllbnQtPmRldiwgIk5vIHBsYXRmb3Jt
IGRhdGFcbiIpOwo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQo+ICAKPiBAQCAtMTQ0LDEwICsx
NDYsMTYgQEAgc3RhdGljIGludCBiZDYxMDdfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVu
dCwKPiAgCWJkLT5jbGllbnQgPSBjbGllbnQ7Cj4gIAliZC0+cGRhdGEgPSBwZGF0YTsKPiAgCj4g
LQlyZXQgPSBkZXZtX2dwaW9fcmVxdWVzdF9vbmUoJmNsaWVudC0+ZGV2LCBwZGF0YS0+cmVzZXQs
Cj4gLQkJCQkgICAgR1BJT0ZfRElSX09VVCB8IEdQSU9GX0lOSVRfTE9XLCAicmVzZXQiKTsKPiAt
CWlmIChyZXQgPCAwKSB7Cj4gKwkvKgo+ICsJICogUmVxdWVzdCB0aGUgcmVzZXQgR1BJTyBsaW5l
IHdpdGggR1BJT0RfT1VUX0hJR0ggbWVhbmluZyBhc3NlcnRlZCwKPiArCSAqIHNvIGluIHRoZSBt
YWNoaW5lIGRlc2NyaXB0b3IgdGFibGUgKG9yIG90aGVyIGhhcmR3YXJlIGRlc2NyaXB0aW9uKSwK
PiArCSAqIHRoZSBsaW5lIHNob3VsZCBiZSBmbGFnZ2VkIGFzIGFjdGl2ZSBsb3cgc28gdGhpcyB3
aWxsIGFzc2VydAo+ICsJICogdGhlIHJlc2V0Lgo+ICsJICovCj4gKwliZC0+cmVzZXQgPSBkZXZt
X2dwaW9kX2dldCgmY2xpZW50LT5kZXYsICJyZXNldCIsIEdQSU9EX09VVF9ISUdIKTsKPiArCWlm
IChJU19FUlIoYmQtPnJlc2V0KSkgewo+ICAJCWRldl9lcnIoJmNsaWVudC0+ZGV2LCAidW5hYmxl
IHRvIHJlcXVlc3QgcmVzZXQgR1BJT1xuIik7Cj4gKwkJcmV0ID0gUFRSX0VSUihiZC0+cmVzZXQp
Owo+ICAJCXJldHVybiByZXQ7Cj4gIAl9Cj4gIAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L3BsYXRmb3JtX2RhdGEvYmQ2MTA3LmggYi9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvYmQ2
MTA3LmgKPiBpbmRleCAzYmQwMTkwMzdlYjMuLjU0YTA2YTRkMjYxOCAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvYmQ2MTA3LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4
L3BsYXRmb3JtX2RhdGEvYmQ2MTA3LmgKPiBAQCAtOSw3ICs5LDYgQEAgc3RydWN0IGRldmljZTsK
PiAgCj4gIHN0cnVjdCBiZDYxMDdfcGxhdGZvcm1fZGF0YSB7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpm
YmRldjsKPiAtCWludCByZXNldDsJCQkvKiBSZXNldCBHUElPICovCj4gIAl1bnNpZ25lZCBpbnQg
ZGVmX3ZhbHVlOwo+ICB9Owo+ICAKPiAtLSAKPiAyLjIzLjAKPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
