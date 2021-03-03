Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0731832BA63
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 21:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAFA6E9C4;
	Wed,  3 Mar 2021 20:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6016E9C4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 20:36:50 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id lr13so44846071ejb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 12:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=o2+Q6O0kP3hXVaH6RrOrAT86ZiO5hSSMv+VhixmNO9A=;
 b=ZZFwQ+Z8Dxmao1vKT3pONZXkIyptGIhPeTrY2/JTXq2B0rR23tHJira7qN9AKyupn2
 Z+gEYa3o6PrNxIOanxueJQd4Xhro9AkXoqTBtPeGbx8WT/T/VqViCnSe36EAhdRWDUwk
 kHDP3DRkdAc5YcM0zGM4PmWwXc6YHPEvQCjheQj3N66CizfNOTvD/miCfke0f8YhP4Y7
 lWgJ1UeR2r/+YF9IgyZLG1GbBM/bjwEHvJB3Q7B1moNPP9eyS++CgSvyrSfFp0b66Fd7
 Cs8ETYCRyPrNTCX8oTuD1IXryc+B3OUYAfTZRCleUTWnAOWDX8uFtzDxw3SFx0hwFYdK
 fwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=o2+Q6O0kP3hXVaH6RrOrAT86ZiO5hSSMv+VhixmNO9A=;
 b=jLfkshxHc0VC/WAVyGGAXUZY1+9BtcSf2jWIzh3qiqPtw0uAjfVFx4BlGEtbjYga+C
 zivbRoiayi3lbyZeMqpR12xssV6c4cTBgTAe2aFAEmis3cwJNiiygv3Qwas3e57NeUxv
 1CkDmMaqF3Y6Kv3lth4hgEFpPv8T4hb20OWWxeWdKj9yEw3vg5+DA0fCbj/1W923NyiV
 r5X5uuZdVySI7lwMu7gAQrb8jL35vTsFIOnJ3lAEF4f7IwnUp1kJlfs1YkN1yeUyo0Ox
 XwiZy9UO7DDSEaBg7EfHzAQ5rIaf/TxO63eorGvH6ppxcp47rq8T7HNouXSfczyso35b
 joig==
X-Gm-Message-State: AOAM531ApIltHPAkxQ28CPuBmNCmOvzGqmyPqnKB4UA52YSrAcZzsQFD
 UoLVMu4Zt48lXsmDbPysB27K7GpsvAlaaA==
X-Google-Smtp-Source: ABdhPJy+19wKzSawFzt8iuBoV6ozxRlPdo5K2yy45W9HTwXDF6AmIU4+gOebfqzgNQghhHgDiaGu4g==
X-Received: by 2002:a17:906:29c3:: with SMTP id
 y3mr564731eje.430.1614803809108; 
 Wed, 03 Mar 2021 12:36:49 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:a1be:4bb2:37f3:bf4b?
 ([2a02:908:1252:fb60:a1be:4bb2:37f3:bf4b])
 by smtp.gmail.com with ESMTPSA id c2sm14484106ejn.63.2021.03.03.12.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 12:36:48 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: soften TTM warnings
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210303155757.82497-1-christian.koenig@amd.com>
 <CAKMK7uFgCxZeX3bPzfStdX0LMXc2MVTAZTY_jLJ66k+=Qnvgng@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0636c6e8-4532-20eb-d361-3cfb30d62717@gmail.com>
Date: Wed, 3 Mar 2021 21:36:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFgCxZeX3bPzfStdX0LMXc2MVTAZTY_jLJ66k+=Qnvgng@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwMy4wMy4yMSB1bSAxODoxOSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gT24gV2VkLCBN
YXIgMywgMjAyMSBhdCA0OjU3IFBNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+PiBRWEwgaW5kZWVkIHVucmVmcyBwaW5uZWQgQk9z
IGFuZCB0aGUgd2FybmluZ3MgYXJlIHNwYW1taW5nIHBlb3BsZXMgbG9nIGZpbGVzLgo+Pgo+PiBN
YWtlIHN1cmUgd2Ugd2FybiBvbmx5IG9uY2UgdW50aWwgdGhlIFFYTCBkcml2ZXIgaXMgZml4ZWQu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPiBDYW4geW91IHBscyBhZGQgRklYTUUgY29tbWVudHMgdG8gZWFjaCB0aGF0IHF4
bCBpcyBicm9rZW4gYW5kIG5lZWRzIHRvCj4gYmUgZml4ZWQgZmlyc3Q/IEFsc28gcGxlYXNlIGFk
ZCBhIFJlZmVyZW5jZXM6IGxpbmsgdG8gdGhlIGJ1ZyByZXBvcnQKPiBvbiBsb3JlLmtlcm5lbC5v
cmcgb3Igd2hlcmV2ZXIgaXQgd2FzLgoKV2FzIHRoZXJlIGEgYnVnIHJlcG9ydD8gSSBvbmx5IGdv
dCBub3RpZmljYXRpb25zIGJ5IG1haWwgc28gZmFyLgoKQ2hyaXN0aWFuLgoKPgo+IFdpdGggdGhh
dDogci1iOiBtZQo+IC1EYW5pZWwKPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jIHwgNSArKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiBpbmRleCAyMGEyNTY2MGIzNWIu
LjI0NWZhMmMwNTkyNyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
Ywo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+IEBAIC0xMzYsNyArMTM2
LDggQEAgdm9pZCB0dG1fYm9fbW92ZV90b19scnVfdGFpbChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvLAo+PiAgICAgICAgICBzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiA9IGJvLT5iZGV2
Owo+PiAgICAgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbjsKPj4KPj4gLSAg
ICAgICBkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFzZS5yZXN2KTsKPj4gKyAgICAgICBpZiAo
IWJvLT5kZWxldGVkKQo+PiArICAgICAgICAgICAgICAgZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQoYm8t
PmJhc2UucmVzdik7Cj4+Cj4+ICAgICAgICAgIGlmIChiby0+cGluX2NvdW50KSB7Cj4+ICAgICAg
ICAgICAgICAgICAgdHRtX2JvX2RlbF9mcm9tX2xydShibyk7Cj4+IEBAIC01MDksNyArNTEwLDcg
QEAgc3RhdGljIHZvaWQgdHRtX2JvX3JlbGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYpCj4+ICAgICAg
ICAgICAgICAgICAgICogc2hyaW5rZXJzLCBub3cgdGhhdCB0aGV5IGFyZSBxdWV1ZWQgZm9yCj4+
ICAgICAgICAgICAgICAgICAgICogZGVzdHJ1Y3Rpb24uCj4+ICAgICAgICAgICAgICAgICAgICov
Cj4+IC0gICAgICAgICAgICAgICBpZiAoV0FSTl9PTihiby0+cGluX2NvdW50KSkgewo+PiArICAg
ICAgICAgICAgICAgaWYgKFdBUk5fT05fT05DRShiby0+cGluX2NvdW50KSkgewo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgYm8tPnBpbl9jb3VudCA9IDA7Cj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICB0dG1fYm9fbW92ZV90b19scnVfdGFpbChibywgJmJvLT5tZW0sIE5VTEwpOwo+PiAg
ICAgICAgICAgICAgICAgIH0KPj4gLS0KPj4gMi4yNS4xCj4+Cj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
