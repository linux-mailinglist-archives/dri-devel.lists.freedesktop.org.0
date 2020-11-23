Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F41B62C00F4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 09:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4537F89B00;
	Mon, 23 Nov 2020 08:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FF789B00;
 Mon, 23 Nov 2020 08:01:17 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k4so16116053edl.0;
 Mon, 23 Nov 2020 00:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=etRl5/O2EkftYr3ceyjlVLwy1Uw3MT1NlGzNceGUhGY=;
 b=O7RZBdv+yz8X2zLf4jdKeed/p3tQTvHM+j+vgO9Isgs10ZM6nuKdY9bqjw4rCyfqbr
 PG9NCRTrrccFHARINAFLLMP7H8i5U6XJI8j8ZPftw1V8gVciA6k2VJXYTf/VsUyc6fpJ
 KctHV6y+vuwIYJ3249ea+u8eNgPz2WwWBi0O5n3ecM+nteyves9KbB6InQsjdt48hXVL
 Q4ryJ+jIAe2ME6NnggXPozC3/PIrLSmPVzAW49uyS6Z5l+RCy+DB/PSEd6vgiV2dj3MD
 4I5jrjJUp7SdgKe5eU+2VB5J+3AgANntG0h6X/LYrBRiL73Y7yXzh/+rUnV1/H6VJ7zq
 f36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=etRl5/O2EkftYr3ceyjlVLwy1Uw3MT1NlGzNceGUhGY=;
 b=bY9VWf1nVq2oP39lg7xgYcLP/EQPPMopzifb1Djyhl55sruk5IOTpKE/BRgAkVWH0R
 /Tku4PDRAz5mdq09KkM/KNbgoHPYbzVQ19GbZ2Lhgmsnpb9fevLflRI4DSYLKvLZsHuc
 5UpqP1OZ7r2HYhtoc1JyX2iM9D6b6JdPnmsICB+mSTh9nML2tHWc15pELbiYOsLMjdjE
 lwt0tNHF7fyEvdFdOzYZY+YwIYHUJ96fV5nZWOLssMIudjQ3yfu++S4uhduzlsjeffSf
 BMPccSCrxAr9kG6uy5hCvcHUVyrXJ6A9scLoCg6CcF6OOjYVJOaOR68YT9SHT5BNL0Qw
 kymg==
X-Gm-Message-State: AOAM530aWsFWzQVfAj+YxiMjmwuGRMrdwjF0j3TJR6WZk9AbPm7a2kmM
 gnwiZTvnz7EC155zZBmCofw=
X-Google-Smtp-Source: ABdhPJz3WYwCJv6tFGcDG0tE1YQovvX6BHD0ZQCgsMcU6CRdKl9cpnIH4iPxgwuG3suckQpXDfu5tw==
X-Received: by 2002:aa7:ca44:: with SMTP id j4mr47339307edt.354.1606118475885; 
 Mon, 23 Nov 2020 00:01:15 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id n11sm3732101ejy.92.2020.11.23.00.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 00:01:15 -0800 (PST)
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, christian.koenig@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
 <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
 <e6bbd5fa-29b7-c74a-ea70-3979b573901b@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5a61f76a-0b40-941f-8028-37202f296e74@gmail.com>
Date: Mon, 23 Nov 2020 09:01:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e6bbd5fa-29b7-c74a-ea70-3979b573901b@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMTEuMjAgdW0gMDU6NTQgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDEx
LzIxLzIwIDk6MTUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDIxLjExLjIwIHVt
IDA2OjIxIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+PiBXaWxsIGJlIHVzZWQgdG8gcmVy
b3V0ZSBDUFUgbWFwcGVkIEJPJ3MgcGFnZSBmYXVsdHMgb25jZQo+Pj4gZGV2aWNlIGlzIHJlbW92
ZWQuCj4+Cj4+IFVmZiwgb25lIHBhZ2UgZm9yIGVhY2ggZXhwb3J0ZWQgRE1BLWJ1Zj8gVGhhdCdz
IG5vdCBzb21ldGhpbmcgd2UgY2FuIGRvLgo+Pgo+PiBXZSBuZWVkIHRvIGZpbmQgYSBkaWZmZXJl
bnQgYXBwcm9hY2ggaGVyZS4KPj4KPj4gQ2FuJ3Qgd2UgY2FsbCBhbGxvY19wYWdlKCkgb24gZWFj
aCBmYXVsdCBhbmQgbGluayB0aGVtIHRvZ2V0aGVyIHNvIAo+PiB0aGV5IGFyZSBmcmVlZCB3aGVu
IHRoZSBkZXZpY2UgaXMgZmluYWxseSByZWFwZWQ/Cj4KPgo+IEZvciBzdXJlIGJldHRlciB0byBv
cHRpbWl6ZSBhbmQgYWxsb2NhdGUgb24gZGVtYW5kIHdoZW4gd2UgcmVhY2ggdGhpcyAKPiBjb3Ju
ZXIgY2FzZSwgYnV0IHdoeSB0aGUgbGlua2luZyA/Cj4gU2hvdWxkbid0IGRybV9wcmltZV9nZW1f
ZGVzdHJveSBiZSBnb29kIGVub3VnaCBwbGFjZSB0byBmcmVlID8KCkkgd2FudCB0byBhdm9pZCBr
ZWVwaW5nIHRoZSBwYWdlIGluIHRoZSBHRU0gb2JqZWN0LgoKV2hhdCB3ZSBjYW4gZG8gaXMgdG8g
YWxsb2NhdGUgYSBwYWdlIG9uIGRlbWFuZCBmb3IgZWFjaCBmYXVsdCBhbmQgbGluayAKdGhlIHRv
Z2V0aGVyIGluIHRoZSBiZGV2IGluc3RlYWQuCgpBbmQgd2hlbiB0aGUgYmRldiBpcyB0aGVuIGZp
bmFsbHkgZGVzdHJveWVkIGFmdGVyIHRoZSBsYXN0IGFwcGxpY2F0aW9uIApjbG9zZWQgd2UgY2Fu
IGZpbmFsbHkgcmVsZWFzZSBhbGwgb2YgdGhlbS4KCkNocmlzdGlhbi4KCj4KPiBBbmRyZXkKPgo+
Cj4+Cj4+IFJlZ2FyZHMsCj4+IENocmlzdGlhbi4KPj4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+IC0tLQo+Pj4g
wqAgZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmPCoCB8wqAgOCArKysrKysrKwo+Pj4gwqAgZHJp
dmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgMTAgKysrKysrKysrKwo+Pj4gwqAgaW5jbHVkZS9k
cm0vZHJtX2ZpbGUuaMKgwqDCoMKgwqAgfMKgIDIgKysKPj4+IMKgIGluY2x1ZGUvZHJtL2RybV9n
ZW0uaMKgwqDCoMKgwqDCoCB8wqAgMiArKwo+Pj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNl
cnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKPj4+IGluZGV4IDBhYzQ1NjYuLmZmM2QzOWYg
MTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwo+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9maWxlLmMKPj4+IEBAIC0xOTMsNiArMTkzLDEyIEBAIHN0cnVjdCBk
cm1fZmlsZSAqZHJtX2ZpbGVfYWxsb2Moc3RydWN0IAo+Pj4gZHJtX21pbm9yICptaW5vcikKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X3ByaW1lX2Rlc3Ryb3k7Cj4+PiDC
oMKgwqDCoMKgIH0KPj4+IMKgICvCoMKgwqAgZmlsZS0+ZHVtbXlfcGFnZSA9IGFsbG9jX3BhZ2Uo
R0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOwo+Pj4gK8KgwqDCoCBpZiAoIWZpbGUtPmR1bW15X3Bh
Z2UpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSAtRU5PTUVNOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIGdvdG8gb3V0X3ByaW1lX2Rlc3Ryb3k7Cj4+PiArwqDCoMKgIH0KPj4+ICsKPj4+IMKgwqDC
oMKgwqAgcmV0dXJuIGZpbGU7Cj4+PiDCoCDCoCBvdXRfcHJpbWVfZGVzdHJveToKPj4+IEBAIC0y
ODksNiArMjk1LDggQEAgdm9pZCBkcm1fZmlsZV9mcmVlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkK
Pj4+IMKgwqDCoMKgwqAgaWYgKGRldi0+ZHJpdmVyLT5wb3N0Y2xvc2UpCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgZGV2LT5kcml2ZXItPnBvc3RjbG9zZShkZXYsIGZpbGUpOwo+Pj4gwqAgK8KgwqDC
oCBfX2ZyZWVfcGFnZShmaWxlLT5kdW1teV9wYWdlKTsKPj4+ICsKPj4+IMKgwqDCoMKgwqAgZHJt
X3ByaW1lX2Rlc3Ryb3lfZmlsZV9wcml2YXRlKCZmaWxlLT5wcmltZSk7Cj4+PiDCoCDCoMKgwqDC
oMKgIFdBUk5fT04oIWxpc3RfZW1wdHkoJmZpbGUtPmV2ZW50X2xpc3QpKTsKPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3By
aW1lLmMKPj4+IGluZGV4IDE2OTNhYTcuLjk4N2I0NWMgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUu
Ywo+Pj4gQEAgLTMzNSw2ICszMzUsMTMgQEAgaW50IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxl
KHN0cnVjdCAKPj4+IGRybV9kZXZpY2UgKmRldiwKPj4+IMKgIMKgwqDCoMKgwqAgcmV0ID0gZHJt
X3ByaW1lX2FkZF9idWZfaGFuZGxlKCZmaWxlX3ByaXYtPnByaW1lLAo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZG1hX2J1ZiwgKmhhbmRsZSk7Cj4+PiArCj4+PiArwqDCoMKgIGlmICgh
cmV0KSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgb2JqLT5kdW1teV9wYWdlID0gYWxsb2NfcGFnZShH
RlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFvYmotPmR1
bW15X3BhZ2UpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRU5PTUVNOwo+Pj4g
K8KgwqDCoCB9Cj4+PiArCj4+PiDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmZmlsZV9wcml2LT5w
cmltZS5sb2NrKTsKPj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBnb3RvIGZhaWw7Cj4+PiBAQCAtMTAyMCw2ICsxMDI3LDkgQEAgdm9pZCBkcm1fcHJpbWVfZ2Vt
X2Rlc3Ryb3koc3RydWN0IAo+Pj4gZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHNnX3RhYmxl
ICpzZykKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQoYXR0
YWNoLCBzZywgRE1BX0JJRElSRUNUSU9OQUwpOwo+Pj4gwqDCoMKgwqDCoCBkbWFfYnVmID0gYXR0
YWNoLT5kbWFidWY7Cj4+PiDCoMKgwqDCoMKgIGRtYV9idWZfZGV0YWNoKGF0dGFjaC0+ZG1hYnVm
LCBhdHRhY2gpOwo+Pj4gKwo+Pj4gK8KgwqDCoCBfX2ZyZWVfcGFnZShvYmotPmR1bW15X3BhZ2Up
Owo+Pj4gKwo+Pj4gwqDCoMKgwqDCoCAvKiByZW1vdmUgdGhlIHJlZmVyZW5jZSAqLwo+Pj4gwqDC
oMKgwqDCoCBkbWFfYnVmX3B1dChkbWFfYnVmKTsKPj4+IMKgIH0KPj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fZmlsZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaAo+Pj4gaW5kZXgg
NzE2OTkwYi4uMmEwMTFmYyAxMDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9maWxlLmgK
Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9maWxlLmgKPj4+IEBAIC0zNDYsNiArMzQ2LDggQEAg
c3RydWN0IGRybV9maWxlIHsKPj4+IMKgwqDCoMKgwqDCoCAqLwo+Pj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgZHJtX3ByaW1lX2ZpbGVfcHJpdmF0ZSBwcmltZTsKPj4+IMKgICvCoMKgwqAgc3RydWN0IHBh
Z2UgKmR1bW15X3BhZ2U7Cj4+PiArCj4+PiDCoMKgwqDCoMKgIC8qIHByaXZhdGU6ICovCj4+PiDC
oCAjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX0xFR0FDWSkKPj4+IMKgwqDCoMKgwqAgdW5zaWdu
ZWQgbG9uZyBsb2NrX2NvdW50OyAvKiBEUkkxIGxlZ2FjeSBsb2NrIGNvdW50ICovCj4+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4+
PiBpbmRleCAzMzdhNDgzLi43NmE5N2EzIDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X2dlbS5oCj4+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKPj4+IEBAIC0zMTEsNiArMzEx
LDggQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0IHsKPj4+IMKgwqDCoMKgwqDCoCAqCj4+PiDCoMKg
wqDCoMKgwqAgKi8KPj4+IMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1
bmNzICpmdW5jczsKPj4+ICsKPj4+ICvCoMKgwqAgc3RydWN0IHBhZ2UgKmR1bW15X3BhZ2U7Cj4+
PiDCoCB9Owo+Pj4gwqAgwqAgLyoqCj4+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
