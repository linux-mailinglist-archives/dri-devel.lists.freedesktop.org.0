Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F05340237
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 10:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB0A6E8BA;
	Thu, 18 Mar 2021 09:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E6C6E8BA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 09:38:14 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y6so5800973eds.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 02:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=L4ieSOecKbzJ+YIgxJd+LK3pzlnIZ78qbx4uaLTkW8M=;
 b=OUbla1y9tCCH013X3mCylKb0J/oDun3LVZxNaM1drtBjEg/HA3yXHvu/O94DTY3eZJ
 QYpbAlFhYiXMvOhd2shpZJ1doCv3iygaifpepsIMju6LX6nwWTa2jztgZri4CsnrcLKp
 i66tUqzqTjYVHTZkhK6SkbalG9UrqovlvjaBh2kBSpolmTpDNQViamWfdnV5bi7hhWMm
 kEFjLY6RUg3jd/armib4oZkf1MEqL4x0CsbKJT0piB8pNGr0nsTNzKNSdoriq+vb04ae
 +HQFR8kgTsyfh7EcFMSTfijDf9w+ifEh0CaFC5jVxEq+LmmKIEI/FSnMHtPegG66C8HV
 f/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=L4ieSOecKbzJ+YIgxJd+LK3pzlnIZ78qbx4uaLTkW8M=;
 b=Clawd2zKHJ+JJheq40P/HYuoxPi8zCNKtneDwZuW/hNltMkkKHBaLpNu5zfT7SFR9F
 UvqmwJnYVlJAnWX0Ae7PqDI76NGyESOC0IhuqhAHAQpJ9Nulca0pbetkya6Mf+bH9JVn
 tFmcjUM/FnitdzLL/S2xgCTDkmFlmTdTenQUpMXUYi/6xmOjQK9WQoBefYyGlMnDj57v
 n7OJUZb+1dCcX1oN34twKr3TWcCrVnPJ0OCcjmRcrhrGFlsILJnb7aoU4knSMOX1SI/S
 ACn0KiRwWOXM+b5pD4fK6tVVlOmSpbfIOe2FMbHUupgmCdNoY1NsmAyTRAk6l3H4b3IJ
 wJqQ==
X-Gm-Message-State: AOAM533nVqMa9COR9bMkKh3iBFmq8uieFM2gccOJZczHnGoFfUYpgmBk
 KBNY09uqdgq1VtKIUR3Y+00GF7H1ot0=
X-Google-Smtp-Source: ABdhPJzG0uu4UBm4KdFAm95Fw7Q4UEWLJ5thNkWiLOWEmpeWZ6wP5aC3xUS7gxA5WzBi2mcK9QxgeA==
X-Received: by 2002:a05:6402:48c:: with SMTP id
 k12mr2487494edv.237.1616060293682; 
 Thu, 18 Mar 2021 02:38:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8e08:4786:692c:c729?
 ([2a02:908:1252:fb60:8e08:4786:692c:c729])
 by smtp.gmail.com with ESMTPSA id j1sm1365600ejt.18.2021.03.18.02.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 02:38:13 -0700 (PDT)
Subject: Re: [PATCH 1/3] dma-buf: add dma_fence_array_for_each (v2)
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
References: <20210316045322.2020294-1-jason@jlekstrand.net>
 <20210317221940.2146688-1-jason@jlekstrand.net>
 <20210317221940.2146688-2-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <889da927-d7a1-bcf3-1887-542798863faf@gmail.com>
Date: Thu, 18 Mar 2021 10:38:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210317221940.2146688-2-jason@jlekstrand.net>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDMuMjEgdW0gMjM6MTkgc2NocmllYiBKYXNvbiBFa3N0cmFuZDoKPiBGcm9tOiBDaHJp
c3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4KPgo+IEFkZCBh
IGhlbHBlciB0byBpdGVyYXRlIG92ZXIgYWxsIGZlbmNlcyBpbiBhIGRtYV9mZW5jZV9hcnJheSBv
YmplY3QuCj4KPiB2MiAoSmFzb24gRWtzdHJhbmQpCj4gICAtIFJldHVybiBOVUxMIGZyb20gZG1h
X2ZlbmNlX2FycmF5X2ZpcnN0IGlmIGhlYWQgPT0gTlVMTC4gIFRoaXMgbWF0Y2hlcwo+ICAgICB0
aGUgaXRlcmF0b3IgYmVoYXZpb3Igb2YgZG1hX2ZlbmNlX2NoYWluX2Zvcl9lYWNoIGluIHRoYXQg
aXQgaXRlcmF0ZXMKPiAgICAgemVybyB0aW1lcyBpZiBoZWFkID09IE5VTEwuCj4gICAtIFJldHVy
biBOVUxMIGZyb20gZG1hX2ZlbmNlX2FycmF5X25leHQgaWYgaW5kZXggPiBhcnJheS0+bnVtX2Zl
bmNlcy4KCklzIHRoZXJlIGFueSByZWFzb24geW91IHNlbmQgdGhpcyBwYXRjaCBhbG9uZSBvdXQg
b25jZSBtb3JlPwoKSSBkb24ndCBzZWUgYW55IGNoYW5nZXMgY29tcGFyZWQgdG8gdGhlIGxhc3Qg
dmVyc2lvbi4KCkNocmlzdGlhbi4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBFa3N0cmFuZCA8
amFzb25Aamxla3N0cmFuZC5uZXQ+Cj4gLS0tCj4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LWFycmF5LmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIGluY2x1ZGUvbGlu
dXgvZG1hLWZlbmNlLWFycmF5LmggICB8IDE3ICsrKysrKysrKysrKysrKysrCj4gICAyIGZpbGVz
IGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1i
dWYvZG1hLWZlbmNlLWFycmF5LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMK
PiBpbmRleCBkM2ZiZDk1MGJlOTQ0Li4yYWMxYWZjNjk3ZDBmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYwo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
ZmVuY2UtYXJyYXkuYwo+IEBAIC0yMDEsMyArMjAxLDMwIEBAIGJvb2wgZG1hX2ZlbmNlX21hdGNo
X2NvbnRleHQoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UsIHU2NCBjb250ZXh0KQo+ICAgCXJldHVy
biB0cnVlOwo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTChkbWFfZmVuY2VfbWF0Y2hfY29udGV4dCk7
Cj4gKwo+ICtzdHJ1Y3QgZG1hX2ZlbmNlICpkbWFfZmVuY2VfYXJyYXlfZmlyc3Qoc3RydWN0IGRt
YV9mZW5jZSAqaGVhZCkKPiArewo+ICsJc3RydWN0IGRtYV9mZW5jZV9hcnJheSAqYXJyYXk7Cj4g
Kwo+ICsJaWYgKCFoZWFkKQo+ICsJCXJldHVybiBOVUxMOwo+ICsKPiArCWFycmF5ID0gdG9fZG1h
X2ZlbmNlX2FycmF5KGhlYWQpOwo+ICsJaWYgKCFhcnJheSkKPiArCQlyZXR1cm4gaGVhZDsKPiAr
Cj4gKwlyZXR1cm4gYXJyYXktPmZlbmNlc1swXTsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKGRtYV9m
ZW5jZV9hcnJheV9maXJzdCk7Cj4gKwo+ICtzdHJ1Y3QgZG1hX2ZlbmNlICpkbWFfZmVuY2VfYXJy
YXlfbmV4dChzdHJ1Y3QgZG1hX2ZlbmNlICpoZWFkLAo+ICsJCQkJICAgICAgIHVuc2lnbmVkIGlu
dCBpbmRleCkKPiArewo+ICsJc3RydWN0IGRtYV9mZW5jZV9hcnJheSAqYXJyYXkgPSB0b19kbWFf
ZmVuY2VfYXJyYXkoaGVhZCk7Cj4gKwo+ICsJaWYgKCFhcnJheSB8fCBpbmRleCA+PSBhcnJheS0+
bnVtX2ZlbmNlcykKPiArCQlyZXR1cm4gTlVMTDsKPiArCj4gKwlyZXR1cm4gYXJyYXktPmZlbmNl
c1tpbmRleF07Cj4gK30KPiArRVhQT1JUX1NZTUJPTChkbWFfZmVuY2VfYXJyYXlfbmV4dCk7Cj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLWFycmF5LmggYi9pbmNsdWRlL2xp
bnV4L2RtYS1mZW5jZS1hcnJheS5oCj4gaW5kZXggMzAzZGQ3MTIyMjBmZC4uNTg4YWM4MDg5ZGQ2
MSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5oCj4gKysrIGIv
aW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaAo+IEBAIC03NCw2ICs3NCwxOSBAQCB0b19k
bWFfZmVuY2VfYXJyYXkoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpCj4gICAJcmV0dXJuIGNvbnRh
aW5lcl9vZihmZW5jZSwgc3RydWN0IGRtYV9mZW5jZV9hcnJheSwgYmFzZSk7Cj4gICB9Cj4gICAK
PiArLyoqCj4gKyAqIGRtYV9mZW5jZV9hcnJheV9mb3JfZWFjaCAtIGl0ZXJhdGUgb3ZlciBhbGwg
ZmVuY2VzIGluIGFycmF5Cj4gKyAqIEBmZW5jZTogY3VycmVudCBmZW5jZQo+ICsgKiBAaW5kZXg6
IGluZGV4IGludG8gdGhlIGFycmF5Cj4gKyAqIEBoZWFkOiBwb3RlbnRpYWwgZG1hX2ZlbmNlX2Fy
cmF5IG9iamVjdAo+ICsgKgo+ICsgKiBUZXN0IGlmIEBhcnJheSBpcyBhIGRtYV9mZW5jZV9hcnJh
eSBvYmplY3QgYW5kIGlmIHllcyBpdGVyYXRlIG92ZXIgYWxsIGZlbmNlcwo+ICsgKiBpbiB0aGUg
YXJyYXkuIElmIG5vdCBqdXN0IGl0ZXJhdGUgb3ZlciB0aGUgZmVuY2UgaW4gQGFycmF5IGl0c2Vs
Zi4KPiArICovCj4gKyNkZWZpbmUgZG1hX2ZlbmNlX2FycmF5X2Zvcl9lYWNoKGZlbmNlLCBpbmRl
eCwgaGVhZCkJCQlcCj4gKwlmb3IgKGluZGV4ID0gMCwgZmVuY2UgPSBkbWFfZmVuY2VfYXJyYXlf
Zmlyc3QoaGVhZCk7IGZlbmNlOwlcCj4gKwkgICAgICsrKGluZGV4KSwgZmVuY2UgPSBkbWFfZmVu
Y2VfYXJyYXlfbmV4dChoZWFkLCBpbmRleCkpCj4gKwo+ICAgc3RydWN0IGRtYV9mZW5jZV9hcnJh
eSAqZG1hX2ZlbmNlX2FycmF5X2NyZWF0ZShpbnQgbnVtX2ZlbmNlcywKPiAgIAkJCQkJICAgICAg
IHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZXMsCj4gICAJCQkJCSAgICAgICB1NjQgY29udGV4dCwg
dW5zaWduZWQgc2Vxbm8sCj4gQEAgLTgxLDQgKzk0LDggQEAgc3RydWN0IGRtYV9mZW5jZV9hcnJh
eSAqZG1hX2ZlbmNlX2FycmF5X2NyZWF0ZShpbnQgbnVtX2ZlbmNlcywKPiAgIAo+ICAgYm9vbCBk
bWFfZmVuY2VfbWF0Y2hfY29udGV4dChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwgdTY0IGNvbnRl
eHQpOwo+ICAgCj4gK3N0cnVjdCBkbWFfZmVuY2UgKmRtYV9mZW5jZV9hcnJheV9maXJzdChzdHJ1
Y3QgZG1hX2ZlbmNlICpoZWFkKTsKPiArc3RydWN0IGRtYV9mZW5jZSAqZG1hX2ZlbmNlX2FycmF5
X25leHQoc3RydWN0IGRtYV9mZW5jZSAqaGVhZCwKPiArCQkJCSAgICAgICB1bnNpZ25lZCBpbnQg
aW5kZXgpOwo+ICsKPiAgICNlbmRpZiAvKiBfX0xJTlVYX0RNQV9GRU5DRV9BUlJBWV9IICovCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
