Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078DD2870D8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 10:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678976EA4E;
	Thu,  8 Oct 2020 08:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393A76EA4E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 08:40:14 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id dg9so2619268edb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TgzaBzvs1GCz2bmrgzrxs2LjdUr5Ijy5ufsci/KO0Jw=;
 b=e775l55ZUM5qToTihq2qfPu0EX1SmFeQ2BOkY3fFKab9xUJ0D/xlH2yzzSbHXPGt3Q
 aj47owbSmST9PexI1b8R+0c4DPGD5dV69c5NA7kekmnGYCtb64p+ciJ+JatcO36k8lFl
 UmA9Sbz7NoTN38ab3MNTM14cSpZFUSGqmqWcJB9dItFZr1TWHJ38eIbt0BzTCGRrGSdd
 HEBK5OjnPSXxgP0xvI/663naeQEZnz31JiUw5mnukS4aWLyfx3QhIktCGx7qNSsUf7Wn
 sTamJLU9Z/FCalsswujkQm0ho1nrDMig/czL55FWYteVpE5VcKHCajaLCWu90gcskqYV
 Efaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=TgzaBzvs1GCz2bmrgzrxs2LjdUr5Ijy5ufsci/KO0Jw=;
 b=EsfTcu5B7pBh7QxvYktQWqkdP7icYrweaJvBuHPrq9oHv0V3jvnSNtKnzz219AlokH
 9OlzcJdTjzcd13JHzpEwJOQU6niVE/x68hh8ENAit78dShOtf9kWhyYElgQZCKNkYDrY
 RkvJezxl5XDRAHmZoNzb3/g2QPzL2DqSUJHU3GBxRrbJ0FZPFu01xUPBoa3N8lPSP0tl
 h604o5MDneRvoOO32ggbJXsny8jMHs75RiczL6hOMw6Fq+95gSlATjCgXJ/0XcUem4xv
 7dK+1GVn3fGdAtOgtRvNvzlov5apzZ8GImtt8H2qgrspBdkV0LuEni7fGqN2BN4wtBoD
 5kqQ==
X-Gm-Message-State: AOAM5319wl/IgxkiwRg3MLdH8NI4DGWKmwCD1WXRHSHZLyouQX82qi3O
 U2AEB0bPTYNtnR+UNpDYFEZMQ4C1BL0=
X-Google-Smtp-Source: ABdhPJzdY7lb5ZYBc3Q2fxIrVL0FdEStqcwIpr+d5h1d8y6Qo1GJILbaYkOwjCx49v7dwjH1vW0/+A==
X-Received: by 2002:a05:6402:1d13:: with SMTP id
 dg19mr7912673edb.217.1602146412430; 
 Thu, 08 Oct 2020 01:40:12 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b13sm3471972ejk.116.2020.10.08.01.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 01:40:11 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: use struct_size macro
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201008081013.27384-1-christian.koenig@amd.com>
 <CAKMK7uHj4TEkXqiKmeU9x5m85ynPLoCaYR+GSWV6ZwZrSBbEog@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5d1b3405-64d4-0e69-7337-caa456abcb78@gmail.com>
Date: Thu, 8 Oct 2020 10:40:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHj4TEkXqiKmeU9x5m85ynPLoCaYR+GSWV6ZwZrSBbEog@mail.gmail.com>
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
Cc: gustavoars@kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMTAuMjAgdW0gMTA6MTcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgT2N0
IDgsIDIwMjAgYXQgMTA6MTAgQU0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEluc3RlYWQgb2YgbWFudWFsbHkgY2FsY3VsYXRp
bmcgdGhlIHN0cnVjdHVyZSBzaXplLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CgpUaGFua3MsIGNvdWxkIGFueWJvZHkgKG5vdCBt
ZSkgY29tZSB1cCB3aXRoIGEgY29jY2kgc2NyaXB0IGZvciB0aGlzPwoKSSdtIHByZXR0eSBzdXJl
IHdlIGhhdmUgdXNlZCB0aGlzIHBhdHRlcm4gbW9yZSB0aGFuIG9uY2UgaW4gdGhlIGtlcm5lbC4K
ClRoYW5rcywKQ2hyaXN0aWFuLgoKPgo+PiAtLS0KPj4gICBkcml2ZXJzL2RtYS1idWYvZG1hLXJl
c3YuYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jIGIvZHJp
dmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPj4gaW5kZXggMWM4ZjI1ODFjYjA5Li5iYjVhNDJiMTBj
MjkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4+ICsrKyBiL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4+IEBAIC02Myw3ICs2Myw3IEBAIHN0YXRpYyBzdHJ1
Y3QgZG1hX3Jlc3ZfbGlzdCAqZG1hX3Jlc3ZfbGlzdF9hbGxvYyh1bnNpZ25lZCBpbnQgc2hhcmVk
X21heCkKPj4gICB7Cj4+ICAgICAgICAgIHN0cnVjdCBkbWFfcmVzdl9saXN0ICpsaXN0Owo+Pgo+
PiAtICAgICAgIGxpc3QgPSBrbWFsbG9jKG9mZnNldG9mKHR5cGVvZigqbGlzdCksIHNoYXJlZFtz
aGFyZWRfbWF4XSksIEdGUF9LRVJORUwpOwo+PiArICAgICAgIGxpc3QgPSBrbWFsbG9jKHN0cnVj
dF9zaXplKGxpc3QsIHNoYXJlZCwgc2hhcmVkX21heCksIEdGUF9LRVJORUwpOwo+PiAgICAgICAg
ICBpZiAoIWxpc3QpCj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4+Cj4+IC0tCj4+
IDIuMTcuMQo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
