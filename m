Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF57D31433C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 23:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349A96EA18;
	Mon,  8 Feb 2021 22:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4EE6EA16
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 22:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612824779;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwSgKoFMmz2hEMDffaiSXcUZfxxpYX7wJnDttStXp3s=;
 b=SZSZtCXJhHIzW/g7IGS2pW6aYEUv3UVCQQJhFXzsEuW4tm5KMseUXvvFcSZ6ZsK4OQqy4H
 oHLyqJ9eI2eCdfje/Jn6ZDd/BKW7TiIpbNLTt+yIJFc18dGEFKyZFnS3TExYCCNNTDE7yC
 dNRTgn2xwrDBU+B/lAIBHi4DJjQZqFQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-sIXmb31gNue4pQ-aXudFVQ-1; Mon, 08 Feb 2021 17:52:55 -0500
X-MC-Unique: sIXmb31gNue4pQ-aXudFVQ-1
Received: by mail-qv1-f71.google.com with SMTP id v1so11792115qvb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 14:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=wwSgKoFMmz2hEMDffaiSXcUZfxxpYX7wJnDttStXp3s=;
 b=jdZv7GtzVxqH7/2Tbe2gj8v3zY+cg7TtGDawWSUneu6SKNnuLRXIO6c7vormjmBsiI
 s0ycOa75oPwaS69fuxvhFKro5nzyO/gso1Wpd0TK86OMSEM/uUzn/afAyg6pfQGAEAC9
 Umg1Vg1y0hCGiYaGqA94MNTa95LrDkad1P7WGurO5s/iblq1APvfn6WiXjUFoBfsmFOc
 qfvxDRaWRK/mr3/3e5fnDF5T6iNDhK7N0pBOX133GFWTGHq1mRkE4HLk0axw2nnLw2p6
 4+ISh8m52k56V4bJ0JSPRwMowSQcFiLayourvCUdT5ajdm9T8ih4pJ4mBgz6GSd17t24
 27bA==
X-Gm-Message-State: AOAM531OBD91qexh8NGj0N3stq4K1bXvVXzNk1PDr6DUxQ/+XvOyiZBA
 eSZt2+Ub5Tnk5TjMeD9UpEFnqYb5NNmY6QK9xMdPaMahRGxwdqB99cP1PxaJEsK6IwGWGfEOIeo
 tA3AHMnE+v+4ouRLh1KlImPgPLCcDaBJyhG5bJQJOm/1fGTwVR6koRfnq+KsGhmJL64yZv//l/Z
 Pw
X-Received: by 2002:a37:7cc5:: with SMTP id
 x188mr18936284qkc.130.1612824774563; 
 Mon, 08 Feb 2021 14:52:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXKvFl9C2N9HglRDTFfok57irTmryp2OkxDvnMaOvTtSA7Yf2rbPnlFKfcK3ZTzaJUudtqFA==
X-Received: by 2002:a37:7cc5:: with SMTP id
 x188mr18936265qkc.130.1612824774269; 
 Mon, 08 Feb 2021 14:52:54 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id p6sm3094119qkg.36.2021.02.08.14.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 14:52:53 -0800 (PST)
Message-ID: <b8353198b93e9935fb08bd4187f009264210504a.camel@redhat.com>
Subject: Re: [RFC v3 00/10] drm: Extract DPCD backlight helpers from i915,
 add support in nouveau
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
Date: Mon, 08 Feb 2021 17:52:52 -0500
In-Reply-To: <20210205234515.1216538-1-lyude@redhat.com>
References: <20210205234515.1216538-1-lyude@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: Jani Nikula <jani.nikula@intel.com>, greg.depoire@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGhhbmtzIGZvciB0aGUgcmV2aWV3IGNvbW1lbnRzIGV2ZXJ5b25lISBJJ20gZ29pbmcgdGhyb3Vn
aCB0aGVtIG5vdyBidXQgcmVhbGl6ZWQKSSBzaG91bGQgcHJvYmFibHkgcG9pbnQgb3V0IHRoYXQg
SSBzb21laG93IHNlbnQgdGhpcyBwYXRjaCBzZXJpZXMgYW5kIGRpZCBub3QKcmVhbGl6ZSBJIGRp
ZCBzbyBpbiB0aGUgbWlkZGxlIG9mIGEgcmViYXNlLCBhbmQgYXMgc3VjaCBjb21wbGV0ZWx5IGZv
cmdvdCB0aGUKcGFydHMgaGVyZSB0aGF0IGFjdHVhbGx5IHN0YXJ0ZWQgdXNpbmcgdGhlc2UgaGVs
cGVycyBpbiBub3V2ZWF1LiBsb2wuLi4uCgphbnl3YXktd2lsbCBmaXggd2hlbiBJIHNlbnQgb3V0
IHRoZSByZXNwaW4gdG9kYXkKCk9uIEZyaSwgMjAyMS0wMi0wNSBhdCAxODo0NSAtMDUwMCwgTHl1
ZGUgUGF1bCB3cm90ZToKPiBUaGlzIHNlcmllczoKPiAqIENsZWFucyB1cCBpOTE1J3MgRFBDRCBi
YWNrbGlnaHQgY29kZSBhIGxpdHRsZSBiaXQKPiAqIEV4dHJhY3RzIGk5MTUncyBEUENEIGJhY2ts
aWdodCBjb2RlIGludG8gYSBzZXQgb2Ygc2hhcmVkIERSTSBoZWxwZXJzCj4gKiBTdGFydHMgdXNp
bmcgdGhvc2UgaGVscGVycyBpbiBub3V2ZWF1IHRvIGFkZCBzdXBwb3J0IHRvIG5vdXZlYXUgZm9y
Cj4gwqAgRFBDRCBiYWNrbGlnaHQgY29udHJvbAo+IAo+IHYyIHNlcmllcy13aWRlIGNoYW5nZXM6
Cj4gKiBSZWJhc2UKPiB2MyBzZXJpZXMtd2lkZSBjaGFuZ2VzOgo+ICogU3BsaXQgdXAgdGhlIGNo
YW5nZXMgdG8gaW50ZWwncyBiYWNrbGlnaHQgY29kZSBpbnRvIHNlcGFyYXRlIHBhdGNoZXMKPiAK
PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPiBDYzogRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAZ21haWwuY29tPgo+IENjOiBncmVnLmRlcG9pcmVAZ21haWwuY29tCj4gCj4g
THl1ZGUgUGF1bCAoMTApOgo+IMKgIGRybS9ub3V2ZWF1L2ttcy9udjQwLS9iYWNrbGlnaHQ6IEFz
c2lnbiBwcm9wIHR5cGUgb25jZQo+IMKgIGRybS9ub3V2ZWF1L2ttczogRG9uJ3QgcHJvYmUgZURQ
IGNvbm5lY3RvcnMgbW9yZSB0aGVuIG9uY2UKPiDCoCBkcm0vaTkxNS9kcGNkX2JsOiBSZW1vdmUg
cmVkdW5kYW50IEFVWCBiYWNrbGlnaHQgZnJlcXVlbmN5Cj4gwqDCoMKgIGNhbGN1bGF0aW9ucwo+
IMKgIGRybS9pOTE1L2RwY2RfYmw6IEhhbmRsZSBkcm1fZHBjZF9yZWFkL3dyaXRlKCkgcmV0dXJu
IHZhbHVlcyBjb3JyZWN0bHkKPiDCoCBkcm0vaTkxNS9kcGNkX2JsOiBDbGVhbnVwIGludGVsX2Rw
X2F1eF92ZXNhX2VuYWJsZV9iYWNrbGlnaHQoKSBhIGJpdAo+IMKgIGRybS9pOTE1L2RwY2RfYmw6
IENhY2hlIHNvbWUgYmFja2xpZ2h0IGNhcGFiaWxpdGllcyBpbgo+IMKgwqDCoCBpbnRlbF9wYW5l
bC5iYWNrbGlnaHQKPiDCoCBkcm0vaTkxNS9kcGNkX2JsOiBNb3ZlIFZFU0EgYmFja2xpZ2h0IGVu
YWJsaW5nIGNvZGUgY2xvc2VyIHRvZ2V0aGVyCj4gwqAgZHJtL2k5MTUvZHBjZF9ibDogUmV0dXJu
IGVhcmx5IGluIHZlc2FfY2FsY19tYXhfYmFja2xpZ2h0IGlmIHdlIGNhbid0Cj4gwqDCoMKgIHJl
YWQgUFdNR0VOX0JJVF9DT1VOVAo+IMKgIGRybS9pOTE1L2RwY2RfYmw6IFByaW50IHJldHVybiBj
b2RlcyBmb3IgVkVTQSBiYWNrbGlnaHQgZmFpbHVyZXMKPiDCoCBkcm0vZHA6IEV4dHJhY3QgaTkx
NSdzIGVEUCBiYWNrbGlnaHQgY29kZSBpbnRvIERSTSBoZWxwZXJzCj4gCj4gwqBkcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX2hlbHBlci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMzMiAr
KysrKysrKysrKysrKysrKysKPiDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlf
dHlwZXMuaMKgwqDCoCB8wqDCoCAyICstCj4gwqAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cF9hdXhfYmFja2xpZ2h0LmMgfCAzMjkgKysrLS0tLS0tLS0tLS0tLS0KPiDCoGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYmFja2xpZ2h0LmPCoMKgIHzCoMKgIDQgKy0KPiDCoGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmPCoMKgIHzCoMKgIDYgKwo+IMKg
aW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCA0OCArKysKPiDCoDYgZmlsZXMgY2hhbmdlZCwgNDI4IGluc2VydGlvbnMoKyks
IDI5MyBkZWxldGlvbnMoLSkKPiAKCi0tIApTaW5jZXJlbHksCiAgIEx5dWRlIFBhdWwgKHNoZS9o
ZXIpCiAgIFNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKICAgCk5vdGU6IEkgZGVhbCB3aXRo
IGEgbG90IG9mIGVtYWlscyBhbmQgaGF2ZSBhIGxvdCBvZiBidWdzIG9uIG15IHBsYXRlLiBJZiB5
b3UndmUKYXNrZWQgbWUgYSBxdWVzdGlvbiwgYXJlIHdhaXRpbmcgZm9yIGEgcmV2aWV3L21lcmdl
IG9uIGEgcGF0Y2gsIGV0Yy4gYW5kIEkKaGF2ZW4ndCByZXNwb25kZWQgaW4gYSB3aGlsZSwgcGxl
YXNlIGZlZWwgZnJlZSB0byBzZW5kIG1lIGFub3RoZXIgZW1haWwgdG8gY2hlY2sKb24gbXkgc3Rh
dHVzLiBJIGRvbid0IGJpdGUhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
