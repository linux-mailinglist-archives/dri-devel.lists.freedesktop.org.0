Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DF0168EB8
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 13:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134886E057;
	Sat, 22 Feb 2020 12:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA516E057
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 12:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582373412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CevzRXErN2zEQ9b2Zyu+CZDJ5DRbPZGXJYEPCN9AQEA=;
 b=Hj5lXo9QpRdLRJsDbClh4QOxrnKL8StwhyN96CektYs7kL9fXCLnampkIuBqcuT2f3X/tM
 tsQ/g1vlkwfdCwPNmTgnbAsgYfqo1E1KezhVjg1ag/DO5ExlY205A56zn9AS3oc6TMIfGj
 i7qF2JwTHDQ/it9mfZNd4nxM5AzgpEE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-iKC7C1k1PRaGcixP9f_QBQ-1; Sat, 22 Feb 2020 07:10:10 -0500
X-MC-Unique: iKC7C1k1PRaGcixP9f_QBQ-1
Received: by mail-wm1-f71.google.com with SMTP id g138so1478971wmg.8
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 04:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ug4aGYpQ+GbkJPu8s5R856wxIte6vJIxE6SbWUO12r0=;
 b=JPBC3Y3ymt3BX+5ZrX6qE1W2v97sh+MJbV/+tngx4KoReZii9/C5rfYHmSGOfsuZBE
 m0jMNpDnsEO6ZG5e7NklemiDiATDapSb0uYK0K53m6yWnuGB1QgdfwO9IYvd0BHcrAkf
 ny0Dg8bGFAIbvtgQiXKkYl+Kti/Cxi/L3qWpK9KdZlQMogSqr80mg9vuZ6i7StNbQ+XO
 DMite14nSoCvGTHZycJxxgKkWqd7HoNjBTE2h5bXbeDnDnOMo7eI9YxJRnmyRnnRMEh1
 +OreJfG+VxyROg3NO6KO8HgM2DYpFV18z4sgc63FHl5CMg97/0HCMeN/jb3mkUUPG3iw
 tjVA==
X-Gm-Message-State: APjAAAUDKi8tRwFihkHKEEGAYLiFIhCB2uU4SyS0Iy2UWQUwBc6twnl5
 e4wQlP1G29VD4JvbIzE8FLU7ZvmZ0Ycseq3bIPGaxvf3R1Wj+i0Gg7dZ79aGBZLBHoD2HKpxurT
 HCAsPpfABgc17CdokWmPL77GhV/gB
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr55999984wrw.187.1582373403358; 
 Sat, 22 Feb 2020 04:10:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqwiusljWsbxncxTlhtoZigjfw0n6EoIgKD8I5dmcwkFYT0a1Y7T6QdxVgujR2TOCBKo/uuThg==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr55999958wrw.187.1582373403092; 
 Sat, 22 Feb 2020 04:10:03 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-7a91-34f6-66f7-d87c.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7a91:34f6:66f7:d87c])
 by smtp.gmail.com with ESMTPSA id u23sm8523729wmu.14.2020.02.22.04.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Feb 2020 04:10:01 -0800 (PST)
Subject: Re: [PATCH 42/51] drm/gm12u320: More drmm_
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
 <20200221210319.2245170-43-daniel.vetter@ffwll.ch>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8bb30a39-a1f0-1624-6a2e-055f2b9a8722@redhat.com>
Date: Sat, 22 Feb 2020 13:10:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221210319.2245170-43-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyLzIxLzIwIDEwOjAzIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFRoZSBkcm1f
bW9kZV9jb25maWdfY2xlYW51cCBjYWxsIHdlIGNhbiBkcm9wLCBhbmQgYWxsIHRoZSBhbGxvY2F0
aW9ucwo+IHdlIGNhbiBzd2l0Y2ggb3ZlciB0byBkcm1tX2t6YWxsb2MuIFVuZm9ydHVuYXRlbHkg
dGhlIHdvcmsgcXVldWUgaXMKPiBzdGlsbCBwcmVzZW50LCBzbyBjYW4ndCBnZXQgcmlkIG9mIHRo
ZSBkcm1fZHJpdmVyLT5yZWxlYXNlIGZ1bmN0aW9uCj4gb3V0cmlnaHQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEhhbnMg
ZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gQ2M6ICJOb3JhbGYgVHLDuG5uZXMiIDxu
b3JhbGZAdHJvbm5lcy5vcmc+CgpQYXRjaCBsb29rcyBnb29kIHRvIG1lOgoKUmV2aWV3ZWQtYnk6
IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CgpSZWdhcmRzLAoKSGFucwoKCgo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAuYyB8IDE4ICsrKysrKystLS0t
LS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5jCj4gaW5kZXggMzkyOGY2OWJiZDNkLi41YmQy
NmZjNmZhZmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMKPiBAQCAtMTYwLDcgKzE2MCw3
IEBAIHN0YXRpYyBpbnQgZ20xMnUzMjBfdXNiX2FsbG9jKHN0cnVjdCBnbTEydTMyMF9kZXZpY2Ug
KmdtMTJ1MzIwKQo+ICAgCWludCBpLCBibG9ja19zaXplOwo+ICAgCWNvbnN0IGNoYXIgKmhkcjsK
PiAgIAo+IC0JZ20xMnUzMjAtPmNtZF9idWYgPSBrbWFsbG9jKENNRF9TSVpFLCBHRlBfS0VSTkVM
KTsKPiArCWdtMTJ1MzIwLT5jbWRfYnVmID0gZHJtbV9rbWFsbG9jKCZnbTEydTMyMC0+ZGV2LCBD
TURfU0laRSwgR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKCFnbTEydTMyMC0+Y21kX2J1ZikKPiAgIAkJ
cmV0dXJuIC1FTk9NRU07Cj4gICAKPiBAQCAtMTczLDcgKzE3Myw4IEBAIHN0YXRpYyBpbnQgZ20x
MnUzMjBfdXNiX2FsbG9jKHN0cnVjdCBnbTEydTMyMF9kZXZpY2UgKmdtMTJ1MzIwKQo+ICAgCQkJ
aGRyID0gZGF0YV9ibG9ja19oZWFkZXI7Cj4gICAJCX0KPiAgIAo+IC0JCWdtMTJ1MzIwLT5kYXRh
X2J1ZltpXSA9IGt6YWxsb2MoYmxvY2tfc2l6ZSwgR0ZQX0tFUk5FTCk7Cj4gKwkJZ20xMnUzMjAt
PmRhdGFfYnVmW2ldID0gZHJtbV9remFsbG9jKCZnbTEydTMyMC0+ZGV2LAo+ICsJCQkJCQkgICAg
IGJsb2NrX3NpemUsIEdGUF9LRVJORUwpOwo+ICAgCQlpZiAoIWdtMTJ1MzIwLT5kYXRhX2J1Zltp
XSkKPiAgIAkJCXJldHVybiAtRU5PTUVNOwo+ICAgCj4gQEAgLTE5MiwxNSArMTkzLDggQEAgc3Rh
dGljIGludCBnbTEydTMyMF91c2JfYWxsb2Moc3RydWN0IGdtMTJ1MzIwX2RldmljZSAqZ20xMnUz
MjApCj4gICAKPiAgIHN0YXRpYyB2b2lkIGdtMTJ1MzIwX3VzYl9mcmVlKHN0cnVjdCBnbTEydTMy
MF9kZXZpY2UgKmdtMTJ1MzIwKQo+ICAgewo+IC0JaW50IGk7Cj4gLQo+ICAgCWlmIChnbTEydTMy
MC0+ZmJfdXBkYXRlLndvcmtxKQo+ICAgCQlkZXN0cm95X3dvcmtxdWV1ZShnbTEydTMyMC0+ZmJf
dXBkYXRlLndvcmtxKTsKPiAtCj4gLQlmb3IgKGkgPSAwOyBpIDwgR00xMlUzMjBfQkxPQ0tfQ09V
TlQ7IGkrKykKPiAtCQlrZnJlZShnbTEydTMyMC0+ZGF0YV9idWZbaV0pOwo+IC0KPiAtCWtmcmVl
KGdtMTJ1MzIwLT5jbWRfYnVmKTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGludCBnbTEydTMyMF9t
aXNjX3JlcXVlc3Qoc3RydWN0IGdtMTJ1MzIwX2RldmljZSAqZ20xMnUzMjAsCj4gQEAgLTYzNiw3
ICs2MzAsNiBAQCBzdGF0aWMgdm9pZCBnbTEydTMyMF9kcml2ZXJfcmVsZWFzZShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KQo+ICAgCXN0cnVjdCBnbTEydTMyMF9kZXZpY2UgKmdtMTJ1MzIwID0gZGV2
LT5kZXZfcHJpdmF0ZTsKPiAgIAo+ICAgCWdtMTJ1MzIwX3VzYl9mcmVlKGdtMTJ1MzIwKTsKPiAt
CWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRldik7Cj4gICB9Cj4gICAKPiAgIERFRklORV9EUk1f
R0VNX0ZPUFMoZ20xMnUzMjBfZm9wcyk7Cj4gQEAgLTY5Myw3ICs2ODYsMTAgQEAgc3RhdGljIGlu
dCBnbTEydTMyMF91c2JfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFjZSwKPiAg
IAlkZXYtPmRldl9wcml2YXRlID0gZ20xMnUzMjA7Cj4gICAJZHJtbV9hZGRfZmluYWxfa2ZyZWUo
ZGV2LCBnbTEydTMyMCk7Cj4gICAKPiAtCWRybV9tb2RlX2NvbmZpZ19pbml0KGRldik7Cj4gKwly
ZXQgPSBkcm1fbW9kZV9jb25maWdfaW5pdChkZXYpOwo+ICsJaWYgKHJldCkKPiArCQlnb3RvIGVy
cl9wdXQ7Cj4gKwo+ICAgCWRldi0+bW9kZV9jb25maWcubWluX3dpZHRoID0gR00xMlUzMjBfVVNF
Ul9XSURUSDsKPiAgIAlkZXYtPm1vZGVfY29uZmlnLm1heF93aWR0aCA9IEdNMTJVMzIwX1VTRVJf
V0lEVEg7Cj4gICAJZGV2LT5tb2RlX2NvbmZpZy5taW5faGVpZ2h0ID0gR00xMlUzMjBfSEVJR0hU
Owo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
