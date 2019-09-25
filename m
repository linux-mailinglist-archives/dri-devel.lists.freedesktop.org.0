Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA44DBDE10
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 14:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84326EBA3;
	Wed, 25 Sep 2019 12:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B236EBA4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 12:30:34 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v17so4747953wml.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 05:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=TIa7GqUtD6iFnscs1CDh4VYxurn5ckUHhvXHSTJZj+g=;
 b=qax4RDsBmCcO4j5q0LOUB3HFlRZ6DoLLVtpuSbONVcXxQdhb9oB/AgHfBmsp3t1zgz
 kAxf9NPeaoZwnpu5UyYkxThLoOCDYIVpka0mDEsJMX2CqKt3XY73wfsm8eC4NDbr0Vnm
 uSC19THAljsK8g23hPnF7fwQgubq9AjHYU5XGjn/LReglsJgOfGzR1PP7O3tl9ZOXPbq
 VqZxUi5MfG2xWAkZp3zKWb8fl+a2araQW/0jsUEI/Nbm1+RMwvo0plenL302QYUm9qSy
 YfnKrD7bJeryKVTky4y4oaFgYURufKfOE2CKdHpuiMlUvT0N2cRfoXyaNxVLOFMmmaII
 x6Dg==
X-Gm-Message-State: APjAAAVwLrpR8u4jUNIgre/4fqlD/kiwecp48xG8gzBJv97zoyeZFa89
 gYExLt9CTUX0lLlqbrDMmzSk8tlU
X-Google-Smtp-Source: APXvYqw7NZyaqHvAkj3yBZ7lLfUinA6GrF6s8UPV/fZ0b2162fat+g7t2fJr8aPLxoJAg5eCxw28bA==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr7524908wmi.103.1569414632779; 
 Wed, 25 Sep 2019 05:30:32 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r18sm4648062wme.48.2019.09.25.05.30.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 05:30:32 -0700 (PDT)
Subject: Re: Re-review? WAS [PATCH 2/7] drm/ttm: Remove explicit typecasts of
 vm_private_data
To: Thomas Hellstrom <thellstrom@vmware.com>
References: <20190918125914.38497-1-thomas_os@shipmail.org>
 <20190918125914.38497-3-thomas_os@shipmail.org>
 <5e4546771edfd92291538612676c64e47d139cc2.camel@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <97f96346-9954-ae43-8687-acdc5723777b@gmail.com>
Date: Wed, 25 Sep 2019 14:30:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5e4546771edfd92291538612676c64e47d139cc2.camel@vmware.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TIa7GqUtD6iFnscs1CDh4VYxurn5ckUHhvXHSTJZj+g=;
 b=mgTvhrKMmFkTb+UxMWwIm/QJIrMhs17rzx6BpVa/CZ4Ermv4Oze3xHE8eVUs80XknI
 5rJF4HINcAMFyCc24BwtEJSpVbw9mJvzlQGOqAgCTKaoZZjS37wdXWLswBblVTAKphKD
 892/iTPRJCQyZ5EUo9ZxHUeUNLKGxqIGSTJznBGcyqI96R7WKb5+1iM61fK9fqMmC6VC
 85v4YiF84coc+RvhpNuEh0FWLdda3rLK5xiNwB8DAhqF+0L2j2kXiYkTDzHqipLu1OLw
 bcGAFQm2cpNGRKhEsQKNfEAVGKw2ae169a8n5EvCMz1q5I9iCRawmeNDEd+Y7gRunPVm
 /+1g==
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
Reply-To: christian.koenig@amd.com
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKdGhpcyBvbmUgYW5kIHBhdGNoICMzIGFyZSBzdGlsbCBSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyAKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCkFueSBvYmplY3Rp
b25zIHRoYXQgSSBjaGVycnkgcGljayB0aGVtIG92ZXIgaW50byBvdXIgYnJhbmNoPyBVcHN0cmVh
bWluZyAKdGhhdCBzdHVmZiBnb3QgZGVsYXllZCBxdWl0ZSBhIGJpdCBhbmQgSSB3YW50IHRvIGJh
c2UgYSBjbGVhbnVwIG9uIHRoaXMuCgpUaGFua3MsCkNocmlzdGlhbi4KCkFtIDE4LjA5LjE5IHVt
IDE1OjIwIHNjaHJpZWIgVGhvbWFzIEhlbGxzdHJvbToKPiBIaSwgQ2hyaXN0aWFuIQo+Cj4gU2lu
Y2UgSSBpbnRyb2R1Y2VkIHRoaXMgcGF0Y2ggYW5kIGNoYW5nZWQgdGhlIFRUTSBWTSBoZWxwZXIg
cGF0Y2gKPiBlbm91Z2ggdG8gbW90aXZhdGUgcmVtb3ZpbmcgeW91ciBSLUIsIEkgd29uZGVyIHdo
ZXRoZXIgeW91IGNvdWxkIGRvIGEKPiBxdWljayByZXZpZXcgb24gdGhlc2UgdHdvIGFuZCBpZiBP
SyBhbHNvIGFjayBtZXJnaW5nIHRocm91Z2ggdm13Z2Z4Pwo+Cj4gVGhhbmtzLAo+IFRob21hcwo+
Cj4KPiBPbiBXZWQsIDIwMTktMDktMTggYXQgMTQ6NTkgKzAyMDAsIFRob21hcyBIZWxsc3Ryw7Zt
IChWTXdhcmUpIHdyb3RlOgo+PiBGcm9tOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZt
d2FyZS5jb20+Cj4+Cj4+IFRoZSBleHBsaWNpdCB0eXBjYXN0cyBhcmUgbWVhbmluZ2xlc3MsIHNv
IHJlbW92ZSB0aGVtLgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0
cm9tQHZtd2FyZS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3Zt
LmMgfCA4ICsrKy0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3ZtLmMKPj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4+IGluZGV4IDc2ZWVk
Yjk2MzY5My4uODk2MzU0NmJmMjQ1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9ib192bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPj4g
QEAgLTEwOSw4ICsxMDksNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyB0dG1fYm9faW9fbWVtX3Bm
bihzdHJ1Y3QKPj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiAgIHN0YXRpYyB2bV9mYXVsdF90
IHR0bV9ib192bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPj4gICB7Cj4+ICAgCXN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gdm1mLT52bWE7Cj4+IC0Jc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibyA9IChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKikKPj4gLQkgICAgdm1hLT52
bV9wcml2YXRlX2RhdGE7Cj4+ICsJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZtYS0+
dm1fcHJpdmF0ZV9kYXRhOwo+PiAgIAlzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiA9IGJvLT5i
ZGV2Owo+PiAgIAl1bnNpZ25lZCBsb25nIHBhZ2Vfb2Zmc2V0Owo+PiAgIAl1bnNpZ25lZCBsb25n
IHBhZ2VfbGFzdDsKPj4gQEAgLTMwMiw4ICszMDEsNyBAQCBzdGF0aWMgdm1fZmF1bHRfdCB0dG1f
Ym9fdm1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0Cj4+ICp2bWYpCj4+ICAgCj4+ICAgc3RhdGljIHZv
aWQgdHRtX2JvX3ZtX29wZW4oc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4+ICAgewo+PiAt
CXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPQo+PiAtCSAgICAoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICopdm1hLT52bV9wcml2YXRlX2RhdGE7Cj4+ICsJc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibyA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOwo+PiAgIAo+PiAgIAlXQVJOX09OKGJv
LT5iZGV2LT5kZXZfbWFwcGluZyAhPSB2bWEtPnZtX2ZpbGUtPmZfbWFwcGluZyk7Cj4+ICAgCj4+
IEBAIC0zMTIsNyArMzEwLDcgQEAgc3RhdGljIHZvaWQgdHRtX2JvX3ZtX29wZW4oc3RydWN0IHZt
X2FyZWFfc3RydWN0Cj4+ICp2bWEpCj4+ICAgCj4+ICAgc3RhdGljIHZvaWQgdHRtX2JvX3ZtX2Ns
b3NlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+PiAgIHsKPj4gLQlzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvID0gKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqKXZtYS0KPj4+IHZt
X3ByaXZhdGVfZGF0YTsKPj4gKwlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gdm1hLT52
bV9wcml2YXRlX2RhdGE7Cj4+ICAgCj4+ICAgCXR0bV9ib19wdXQoYm8pOwo+PiAgIAl2bWEtPnZt
X3ByaXZhdGVfZGF0YSA9IE5VTEw7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
