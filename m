Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 050C72FB04
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 13:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FB66E157;
	Thu, 30 May 2019 11:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8B06E100
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 13:05:12 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m15so2333773ljg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 06:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=llu8Y5NHzHxxDDbTkC/AtBNhwsX33d/0JdDrLU3ydWI=;
 b=jjk+xsfQbtHfr7WdprejY4iyLxN4mL6/PGYoKDcb+6K4eraEfWIgtvNDaHvzQY9bts
 mFpNzQiiRAzMe0sEwzd9xt7HKhkRzAoGeIQt+d26tQubeBgCYkQLh8blS3svhJpQZZPZ
 96c2DXiyJfv9Od4lzWN5ejxjYc051DHaKBd/G74Qqz7HgTWfFqwU2nlzF+X4toCBkMsj
 16xy+XMqU9uqDl1F8+p52p3WamgMoeeMTezyQHfwGnMsz9eWV2tQxduJhc0GdpNhmv7O
 nMPZvKZ/PchYt/r3HeYRIFrlwLsGzL0f26VubfRgdKzkn4zq1JzpfrcuzBXsHv6vPuxl
 J1Fg==
X-Gm-Message-State: APjAAAV3G5u6fR0lgXiu8yAthuJetGEUsY7Jxz2BZx7/5RamLd6aueFk
 kRYLO/niCpeskkW5zUAlyrJJrA==
X-Google-Smtp-Source: APXvYqxt2dwOYHIBbX5Z9cJdxphQnVjqpWdOeU/6e1nwgO2fpp1hBitzbQOfosdNNh2n4lUif4uuuQ==
X-Received: by 2002:a2e:1284:: with SMTP id 4mr36692793ljs.138.1559135108964; 
 Wed, 29 May 2019 06:05:08 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id v12sm3482366ljv.49.2019.05.29.06.05.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 06:05:08 -0700 (PDT)
Subject: Re: [PATCH 2/5] drm/msm/dpu: Integrate interconnect API in MDSS
To: Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>
References: <20190508204219.31687-1-robdclark@gmail.com>
 <20190508204219.31687-3-robdclark@gmail.com>
 <20190513144722.GO17077@art_vandelay>
From: Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <2ac15174-09f5-7c7f-8ca8-226f8238a115@linaro.org>
Date: Wed, 29 May 2019 16:05:05 +0300
MIME-Version: 1.0
In-Reply-To: <20190513144722.GO17077@art_vandelay>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 30 May 2019 11:39:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=llu8Y5NHzHxxDDbTkC/AtBNhwsX33d/0JdDrLU3ydWI=;
 b=mlbpaSpyBzO+K4QOYeF8DBxVDrmFilPjP+gK5mEeJw1DXRgmXG2ra6KOfay/IlTTHU
 UmrgFp5xJ5LmadTPgN527a8XLY0khtGQd6+tAkAXwwero1copC/91HUbKjXvuTpSqxxM
 ZdIdws4BRpZhEBiRFQCmj4EIzDSKWu2USlEIUrFXW0dolVWxGy4HyhtUkWP2B2r8GFu4
 aiU9LkWKW1kv/0oqoNaRWq08QdHpf64nOQCBjyCMTIPEQkSwp4fvZZu1uEW87w6G3je/
 B+gxkcYmaH//4mI0GuBYq0903rw6NKK6Z4j9XsJjULdXEiv5nDl8VbluCLYiUYX4rS/T
 uafQ==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jayant Shekhar <jshekhar@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8xMy8xOSAxNzo0NywgU2VhbiBQYXVsIHdyb3RlOgo+IE9uIFdlZCwgTWF5IDA4LCAyMDE5
IGF0IDAxOjQyOjEyUE0gLTA3MDAsIFJvYiBDbGFyayB3cm90ZToKPj4gRnJvbTogSmF5YW50IFNo
ZWtoYXIgPGpzaGVraGFyQGNvZGVhdXJvcmEub3JnPgo+Pgo+PiBUaGUgaW50ZXJjb25uZWN0IGZy
YW1ld29yayBpcyBkZXNpZ25lZCB0byBwcm92aWRlIGEKPj4gc3RhbmRhcmQga2VybmVsIGludGVy
ZmFjZSB0byBjb250cm9sIHRoZSBzZXR0aW5ncyBvZgo+PiB0aGUgaW50ZXJjb25uZWN0cyBvbiBh
IFNvQy4KPj4KPj4gVGhlIGludGVyY29ubmVjdCBBUEkgdXNlcyBhIGNvbnN1bWVyL3Byb3ZpZGVy
LWJhc2VkIG1vZGVsLAo+PiB3aGVyZSB0aGUgcHJvdmlkZXJzIGFyZSB0aGUgaW50ZXJjb25uZWN0
IGJ1c2VzIGFuZCB0aGUKPj4gY29uc3VtZXJzIGNvdWxkIGJlIHZhcmlvdXMgZHJpdmVycy4KPj4K
Pj4gTURTUyBpcyBvbmUgb2YgdGhlIGludGVyY29ubmVjdCBjb25zdW1lcnMgd2hpY2ggdXNlcyB0
aGUKPj4gaW50ZXJjb25uZWN0IEFQSXMgdG8gZ2V0IHRoZSBwYXRoIGJldHdlZW4gZW5kcG9pbnRz
IGFuZAo+PiBzZXQgaXRzIGJhbmR3aWR0aCByZXF1aXJlbWVudCBmb3IgdGhlIGdpdmVuIGludGVy
Y29ubmVjdGVkCj4+IHBhdGguCj4+Cj4+IENoYW5nZXMgaW4gdjI6Cj4+IAktIFJlbW92ZSBlcnJv
ciBsb2cgYW5kIHVubmVjZXNzYXJ5IGNoZWNrIChKb3JkYW4gQ3JvdXNlKQo+Pgo+PiBDaGFuZ2Vz
IGluIHYzOgo+PiAJLSBDb2RlIGNsZWFuIGludm9sdmluZyB2YXJpYWJsZSBuYW1lIGNoYW5nZSwg
cmVtb3ZhbAo+PiAJICBvZiBleHRyYSBwYXJhbnRoZXNpcyBhbmQgdmFyaWFibGVzIChNYXR0aGlh
cyBLYWVobGNrZSkKPj4KPj4gQ2hhbmdlcyBpbiB2NDoKPj4gCS0gQWRkIGNvbW1lbnRzLCBzcGFj
aW5ncywgdGFicywgcHJvcGVyIHBvcnQgbmFtZQo+PiAJICBhbmQgaWNjIG1hY3JvIChHZW9yZ2kg
RGpha292KQo+Pgo+PiBDaGFuZ2VzIGluIHY1Ogo+PiAJLSBDb21taXQgdGV4dCBhbmQgcGFyZW50
aGVzaXMgYWxpZ25tZW50IChHZW9yZ2kgRGpha292KQo+Pgo+PiBDaGFuZ2VzIGluIHY2Ogo+PiAJ
LSBDaGFuZ2UgdG8gbmV3IGljY19zZXQgQVBJJ3MgKERvdWcgQW5kZXJzb24pCj4+Cj4+IENoYW5n
ZXMgaW4gdjc6Cj4+IAktIEZpeGVkIGEgdHlwbwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTcmF2YW50
aGkgS29sbHVrdWR1cnUgPHNrb2xsdWt1QGNvZGVhdXJvcmEub3JnPgo+PiBTaWduZWQtb2ZmLWJ5
OiBKYXlhbnQgU2hla2hhciA8anNoZWtoYXJAY29kZWF1cm9yYS5vcmc+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPj4gLS0tCj4+ICBkcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jIHwgNDkgKysrKysrKysrKysrKysrKysr
KysrKy0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9t
ZHNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jCj4+IGluZGV4
IDczMTZiNGFiMWI4NS4uZTNjNTZjY2Q3MzU3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9tZHNzLmMKPj4gQEAgLTQsMTEgKzQsMTUgQEAKPj4gICAqLwo+PiAgCj4+
ICAjaW5jbHVkZSAiZHB1X2ttcy5oIgo+PiArI2luY2x1ZGUgPGxpbnV4L2ludGVyY29ubmVjdC5o
Pgo+PiAgCj4+ICAjZGVmaW5lIHRvX2RwdV9tZHNzKHgpIGNvbnRhaW5lcl9vZih4LCBzdHJ1Y3Qg
ZHB1X21kc3MsIGJhc2UpCj4+ICAKPj4gICNkZWZpbmUgSFdfSU5UUl9TVEFUVVMJCQkweDAwMTAK
Pj4gIAo+PiArLyogTWF4IEJXIGRlZmluZWQgaW4gS0JwcyAqLwo+PiArI2RlZmluZSBNQVhfQlcJ
CQkJNjgwMDAwMAo+PiArCj4+ICBzdHJ1Y3QgZHB1X2lycV9jb250cm9sbGVyIHsKPj4gIAl1bnNp
Z25lZCBsb25nIGVuYWJsZWRfbWFzazsKPj4gIAlzdHJ1Y3QgaXJxX2RvbWFpbiAqZG9tYWluOwo+
PiBAQCAtMjEsOCArMjUsMzAgQEAgc3RydWN0IGRwdV9tZHNzIHsKPj4gIAl1MzIgaHd2ZXJzaW9u
Owo+PiAgCXN0cnVjdCBkc3NfbW9kdWxlX3Bvd2VyIG1wOwo+PiAgCXN0cnVjdCBkcHVfaXJxX2Nv
bnRyb2xsZXIgaXJxX2NvbnRyb2xsZXI7Cj4+ICsJc3RydWN0IGljY19wYXRoICpwYXRoWzJdOwo+
PiArCXUzMiBudW1fcGF0aHM7Cj4+ICB9Owo+PiAgCj4+ICtzdGF0aWMgaW50IGRwdV9tZHNzX3Bh
cnNlX2RhdGFfYnVzX2ljY19wYXRoKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4+ICsJCQkJCQlz
dHJ1Y3QgZHB1X21kc3MgKmRwdV9tZHNzKQo+PiArewo+PiArCXN0cnVjdCBpY2NfcGF0aCAqcGF0
aDAgPSBvZl9pY2NfZ2V0KGRldi0+ZGV2LCAibWRwMC1tZW0iKTsKPj4gKwlzdHJ1Y3QgaWNjX3Bh
dGggKnBhdGgxID0gb2ZfaWNjX2dldChkZXYtPmRldiwgIm1kcDEtbWVtIik7Cj4+ICsKPj4gKwlp
ZiAoSVNfRVJSKHBhdGgwKSkKPiAKPiBvZl9pY2NfZ2V0IGNhbiBhbHNvIHJldHVybiBOVUxMLCBp
dCBsb29rcyBsaWtlIHdlIGFsc28gd2FudCB0byBndWFyZCBhZ2FpbnN0Cj4gdGhpcyBjYXNlIGFu
ZCBrZWVwIG51bV9wYXRocyA9PSAwLgoKb2ZfaWNjX2dldCgpIHJldHVybnMgTlVMTCB3aGVuIHRo
ZSBpbnRlcmNvbm5lY3QgQVBJIGlzIG5vdCBlbmFibGVkIG9yIHRoZSBEVApwcm9wZXJ0aWVzIGFy
ZSBub3QgcHJlc2VudC4gSW4gdGhpcyBjYXNlLCBwYXNzaW5nIGEgTlVMTCBwYXRoIHRvIHRoZSBp
Y2MKZnVuY3Rpb25zIGlzIGp1c3QgYSBub3AuIFNvIGl0IHNob3VsZCBiZSBmaW5lIGVpdGhlciB3
YXkuCgpBY2tlZC1ieTogR2VvcmdpIERqYWtvdiA8Z2VvcmdpLmRqYWtvdkBsaW5hcm8ub3JnPgoK
VGhhbmtzLApHZW9yZ2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
