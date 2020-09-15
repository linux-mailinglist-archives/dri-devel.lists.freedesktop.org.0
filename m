Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA39626A3CA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 13:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7CE89FE8;
	Tue, 15 Sep 2020 11:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2E389FE8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 11:03:42 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id lo4so4397931ejb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tf9aVEsdXq4hvSPyIfdqowWXQx44PZPondYe5kmz/4k=;
 b=opnPO/r49FBHXTZplwVibG1zx7WYGIg0k+7HzzemOWXPDTJAPb5OaPiQofB6VKHYOx
 ZWmCKlUgo/+KApsc/iM6Oyr4UPU+GkFsE1rxiRcjVFtsKyclzVS7L2eDdFUTpqHIZqYr
 tcrG+95v6XQBOR5ouXG6EKOILLHlseliNnS4GFlamKMXnY6Hd9PfygI9TdpOShLPoWCj
 XjxK8ROzbHIFXcOM1WGnatlEBXSKtkwCTunXSooQ9yv0kiF07dJpWLVw0p8Jx9SWdPhn
 HoXYJLSHNaN5AAz5V5Iao4eX4tBfm4tc98ouvb12ri5RA8DAjAKotawpUjfV3h6JHuYB
 gBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=tf9aVEsdXq4hvSPyIfdqowWXQx44PZPondYe5kmz/4k=;
 b=V5sIYUKL22rSY73aOAobgPaBJsJe1Cr8Me0S793+9jBgKzJzhnjKWMWC1tXGyJpdz9
 bmQg0pRSqjbWOtUV0u5kol9somnkIoBRWyhNH1/Z5tqEqORwijUMU+bMZwfzDTvtsIEv
 DRNdh4gBPwT2gotleH9Y1LOmykB/xWYNwjAbNDwlszbJO7t3XDA5uFyUMlMsV5kwVynF
 pe+ggAUNzZ3m5X2dxavLwSL6rrcfkIiJ7SVKDtHDBpa+Dk/ZaDlWowXdfd88IYnDbjo8
 8YayyzsfvBhrTGzuWZcPUrcBUV4nEpHXxe9MHTqGhI+n2NCIg9IQYFgdLV1SYWyyiZqI
 hTwg==
X-Gm-Message-State: AOAM533pvGNg5LWrympOsE0lIIhpWlkUPzolmVbnUtyrR9lQ7OMV/m1Y
 bUia8blZEbM+A44G2BVDHKg=
X-Google-Smtp-Source: ABdhPJxfW0HVgypcFl09FE5Qg1TZt4Ht/6KefSB8Cm0t+kwNcgrEBFWDZzSO/WzygzmfhzF4uCiGjg==
X-Received: by 2002:a17:906:9491:: with SMTP id
 t17mr20156636ejx.253.1600167821140; 
 Tue, 15 Sep 2020 04:03:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id ks21sm9916283ejb.63.2020.09.15.04.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 04:03:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/shmem-helpers: revert "Redirect mmap for imported
 dma-buf"
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <20200914132920.59183-2-christian.koenig@amd.com>
 <CAKMK7uHnZgCBUBQ-5D7gCj1v3Z4wKkeO91tefAoJE1B49JFtww@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <92b77d29-ae9b-b9cd-4e03-f193aa386cae@gmail.com>
Date: Tue, 15 Sep 2020 13:03:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHnZgCBUBQ-5D7gCj1v3Z4wKkeO91tefAoJE1B49JFtww@mail.gmail.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDkuMjAgdW0gMTI6Mzkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgU2Vw
IDE0LCAyMDIwIGF0IDM6MjkgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMjZkM2FjM2Ni
MDRkMTcxYTg2MTk1MmU4OTMyNGUzNDc1OThhMzQ3Zi4KPj4KPj4gV2UgbmVlZCB0byBmaWd1cmUg
b3V0IGlmIGRtYV9idWZfbW1hcCgpIGlzIHZhbGlkIG9yIG5vdCBmaXJzdC4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IFRo
ZSB0cm91YmxlIGlzIHRoYXQgZG9pbmcgZG1hLWJ1ZiBtbWFwIGJ5IGxvb2tpbmcgYXQgdGhlIHN0
cnVjdCBwYWdlcwo+IGJlaGluZCB0aGUgc2cgbGlzdCBhbmQganVzdCBpbnNlcnRpbmcgdGhvc2Ug
aW50byB1c2Vyc3BhY2UgZG9lc24ndAo+IHJlYWxseSB3b3JrIGFueSBiZXR0ZXIuIFlvdSBzdGls
bCB3b24ndCBnZXQgdGhlIHVubWFwX21hcHBpbmdfcmFuZ2UKPiBhbmQgaGVuY2UgcHRlIHNob290
LWRvd24uIFNvIG1heWJlIGRtYV9idWZfbW1hcCBmb3J3YXJkaW5nIGRvZXNuJ3QKPiB3b3JrLCBi
dXQgdGhpcyBkb2Vzbid0IG1ha2UgaXQgYW55IGJldHRlci4KCkdvb2QgcG9pbnQuIFF1ZXN0aW9u
IGlzIHdoYXQgc2hvdWxkIHdlIGRvPyBSZXR1cm4gLUVQRVJNPwoKPgo+IEFsc28gY29tbWl0IG1l
c3NhZ2Ugc2hvdWxkIHByb2JhYmx5IGV4cGxhaW4gYSBiaXQgdGhlIGNvbnRleHQgaGVyZSwKPiBu
b3QgYSBsb3Qgb2YgcGVvcGxlIGhhdmUgYmVlbiBpbiBvdXIgcHJpdmF0ZSBkaXNjdXNzaW9uIG9u
IHRoaXMuCgpXZWxsLCB0aGF0J3MgY2VydGFpbiB0cnVlLgoKQ2hyaXN0aWFuLgoKPiAtRGFuaWVs
Cj4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgfCAz
IC0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+PiBpbmRleCAwYTk1MmYyN2MxODQuLmNkNzI3MzQz
ZjcyYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVy
LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPj4gQEAg
LTU5NCw5ICs1OTQsNiBAQCBpbnQgZHJtX2dlbV9zaG1lbV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPj4gICAgICAgICAgLyogUmVt
b3ZlIHRoZSBmYWtlIG9mZnNldCAqLwo+PiAgICAgICAgICB2bWEtPnZtX3Bnb2ZmIC09IGRybV92
bWFfbm9kZV9zdGFydCgmb2JqLT52bWFfbm9kZSk7Cj4+Cj4+IC0gICAgICAgaWYgKG9iai0+aW1w
b3J0X2F0dGFjaCkKPj4gLSAgICAgICAgICAgICAgIHJldHVybiBkbWFfYnVmX21tYXAob2JqLT5k
bWFfYnVmLCB2bWEsIDApOwo+PiAtCj4+ICAgICAgICAgIHNobWVtID0gdG9fZHJtX2dlbV9zaG1l
bV9vYmoob2JqKTsKPj4KPj4gICAgICAgICAgcmV0ID0gZHJtX2dlbV9zaG1lbV9nZXRfcGFnZXMo
c2htZW0pOwo+PiAtLQo+PiAyLjE3LjEKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
