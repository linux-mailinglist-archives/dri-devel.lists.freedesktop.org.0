Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12F7CB543
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760FE6EABF;
	Fri,  4 Oct 2019 07:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21D96E0F1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 19:47:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q17so338406wrx.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 12:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=XC7LA55iHiUITo+83QzxAVmoetQd0JqQF8Gg112JjJQ=;
 b=iB410dZHOyebn1rKmsy+N1yk/FWKFmzixbAvW0pIIlZie1lYQIRT0D/p89ZtfWubBc
 NbINrb0H6RNZo09XSEauNSfELs1Tq9o+4GucFFFJkN17Bz+1HKVhMhS4NZIOzATTEh5I
 74e92kyfzm3KTWinwfQeH0UlE9r7VO79lVtRhhQ32A3RWnMDvDSYn+iCHJcY0h5QVmiz
 SJjC2zB1+lPG8r7rgIf7cugs1NJAdbjIDpFb3lGmDEIKgWUK52sMbc01Q96q7ecuzKMy
 5PVE3iUgXcQJ6OtA7TTYJ4kJHrZfx3O/IwHyetP3R3piHWYWh9vx6b7M7jsziMHh50N1
 Bf2g==
X-Gm-Message-State: APjAAAVnyeJ6wd8mluS1llO/I9K6mbLpY/DWYk5aHOVzsMVGBeAxvJQC
 A+369pAavansndjN7F2e6IAEDeb+
X-Google-Smtp-Source: APXvYqxmXlFoHspoGGfhtQtVCMlMyjp0i+wHw/MOyFzuuPKkitH7WZnXt1PsKKhwB8WE33W/gSqlXw==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr3954548wrq.165.1570045641581; 
 Wed, 02 Oct 2019 12:47:21 -0700 (PDT)
Received: from [192.168.1.19] (ckh198.neoplus.adsl.tpnet.pl. [83.31.83.198])
 by smtp.gmail.com with ESMTPSA id m62sm141201wmm.35.2019.10.02.12.47.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Oct 2019 12:47:20 -0700 (PDT)
Subject: Re: [PATCH v7 1/5] leds: populate the device's of_node when possible
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz, robh+dt@kernel.org,
 mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-2-jjhiblot@ti.com>
 <f543e757-e000-6de4-694b-e75f388e5908@gmail.com>
 <e9588e03-20d4-7e6d-e514-0b79dae12cce@ti.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b7b3409b-97bd-79b4-a712-6c03c6eabd56@gmail.com>
Date: Wed, 2 Oct 2019 21:47:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e9588e03-20d4-7e6d-e514-0b79dae12cce@ti.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XC7LA55iHiUITo+83QzxAVmoetQd0JqQF8Gg112JjJQ=;
 b=TVI8bgL+0zY79i9zDnmSeL3V5D3k8c5dUaQlFSw+o+Pl+hcTUJmnd/icqybX32e1dh
 TORtaW8b7jSpFTeXHCb2O1HtYNoOXm3HbH8iXiujD7iNP1ccqJJSffjeIT0xlusq635f
 cfA8deGNzjEjZq/o4NIiSJJFaxcvGmRcH78w7sCYW7GXST4NXMahA+baJEkX4d8TklGU
 mheCkQdLzryCbjRmYTqzE7hcUOMxGFPWhm7QEJMQ6iAizHChiRlAxyvbuPaakkIpiOIG
 AUZscZUFBJWJim7yRKvDQ2g7++Fsj/guprIlQwbbPVvSOxPy6tQII9qIzAAYuH3kVHy7
 L9TQ==
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
Cc: dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, dmurphy@ti.com,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmVhbiwKCk9uIDEwLzIvMTkgMzo1OCBQTSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToK
PiBIaSBKYWNlaywKPiAKPiBPbiAyNC8wOS8yMDE5IDIzOjAzLCBKYWNlayBBbmFzemV3c2tpIHdy
b3RlOgo+PiBIaSBKZWFuLAo+Pgo+PiBUaGFuayB5b3UgZm9yIHJlYmFzaW5nIHRoZSBzZXQKPj4K
Pj4gT24gOS8xOC8xOSA0OjU3IFBNLCBKZWFuLUphY3F1ZXMgSGlibG90IHdyb3RlOgo+Pj4gSWYg
aW5pdGlhbGl6YXRpb24gZGF0YSBpcyBhdmFpbGFibGUgYW5kIGl0cyBmd25vZGUgaXMgYWN0dWFs
bHkgYQo+Pj4gb2Zfbm9kZSwKPj4+IHN0b3JlIHRoaXMgaW5mb3JtYXRpb24gaW4gdGhlIGxlZCBk
ZXZpY2UncyBzdHJ1Y3R1cmUuIFRoaXMgd2lsbCBhbGxvdwo+Pj4gdGhlCj4+PiBkZXZpY2UgdG8g
dXNlIG9yIHByb3ZpZGUgT0YtYmFzZWQgQVBJIHN1Y2ggKGRldm1feHh4KS4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+Cj4+PiAtLS0K
Pj4+IMKgIGRyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYyB8IDUgKysrKy0KPj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jIGIvZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jCj4+
PiBpbmRleCA2NDdiMTI2M2M1NzkuLmMyMTY3YjY2YjYxZiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZl
cnMvbGVkcy9sZWQtY2xhc3MuYwo+Pj4gKysrIGIvZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jCj4+
PiBAQCAtMjc2LDggKzI3NiwxMSBAQCBpbnQgbGVkX2NsYXNzZGV2X3JlZ2lzdGVyX2V4dChzdHJ1
Y3QgZGV2aWNlCj4+PiAqcGFyZW50LAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIG11dGV4X3VubG9j
aygmbGVkX2NkZXYtPmxlZF9hY2Nlc3MpOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQ
VFJfRVJSKGxlZF9jZGV2LT5kZXYpOwo+Pj4gwqDCoMKgwqDCoCB9Cj4+PiAtwqDCoMKgIGlmIChp
bml0X2RhdGEgJiYgaW5pdF9kYXRhLT5md25vZGUpCj4+PiArwqDCoMKgIGlmIChpbml0X2RhdGEg
JiYgaW5pdF9kYXRhLT5md25vZGUpIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBsZWRfY2Rldi0+
ZGV2LT5md25vZGUgPSBpbml0X2RhdGEtPmZ3bm9kZTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAo
aXNfb2Zfbm9kZShpbml0X2RhdGEtPmZ3bm9kZSkpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBsZWRfY2Rldi0+ZGV2LT5vZl9ub2RlID0gdG9fb2Zfbm9kZShpbml0X2RhdGEtPmZ3bm9kZSk7
Cj4+IEl0IHdvdWxkIGJlIHN0ZXAgYmFja3dhcmRzLiBZb3UgY2FuIGRvIHRoZSBjb252ZXJzaW9u
IGluIHRoZSBwbGFjZSBvZgo+PiB1c2UgaS5lLiBpbiBkZXZtX2xlZF9nZXQoKS4KPiAKPiBDb3Vs
ZCBiZSBkb25lLiBCdXQgaXQgd291bGQgYnJlYWsgYW5vdGhlciB1c2UgY2FzZSBJIGhhdmUuIEkn
bSBhbHNvCj4gd29ya2luZyBvbiB0aGUgcmVndWxhdG9yIHN1cHBvcnQgYW5kIGZvciB0aGlzIG9u
ZSwgb2Zfbm9kZSBuZWVkcyB0byBiZQo+IHBvcHVsYXRlZC4KCkkgdGhvdWdodCB0aGF0IHJlZ3Vs
YXRvciBjb3JlIGNhbiBkbyB0aGUgY29udmVyc2lvbiB0byBvZl9ub2RlIGl0c2VsZiwKYnV0IHRo
aXMgc2VlbXMgbm90IHRvIGJlIHRoZSBjYXNlLgoKPiBJcyB0aGVyZSBhIHByb2JsZW0gcG9wdWxh
dGluZyBvZl9ub2RlIGlmIHRoZSBMRUQgaXMgaW5kZWVkIGRlc2NyaWJlZCBpbgo+IHRoZSBEVCA/
CgpObywgaWYgaXQgaXMgbm90IHBvc3NpYmxlIHRvIGRvIGl0IG90aGVyd2lzZS4KCi0tIApCZXN0
IHJlZ2FyZHMsCkphY2VrIEFuYXN6ZXdza2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
