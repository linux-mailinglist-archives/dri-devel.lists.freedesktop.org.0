Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E180E2883B2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADB66EC4C;
	Fri,  9 Oct 2020 07:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAA86EC4C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:36:44 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id u8so11724316ejg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=KDyUTK8HE57boREsu/kkQV3gAaTaD15LV09WfHJl7QA=;
 b=kIGXTJl/kOjQKxmgRI69WHaqY7wqG2Iftx5wG5g2WhEIYTHKNVtTW0rZIYWWs4UDho
 DM2mbQx2xiJ0y3D0Py2Dsju2CITpUnRITmBmsIJrS4mTjp5L5oEgPHYvtwRpHreYFZWs
 YQ0GFatuSc7Ed2uFiNpB8CotQXhkN7tvSToTlnE+UsFez1BjvKcNuqrfN2kv80c+LHI+
 tsonF8erzFyfkOUt8NqnsJZLxO0ZL4mzCChcWxnQQrqU2nMKDLWF0PGAygmnFsu8t0+O
 l4x1RBptHp5dY4jISuBlzc9/4LH1UZnUbJHu8lenU1eHd56zkQX0xo8cM2jccYBXTble
 0jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KDyUTK8HE57boREsu/kkQV3gAaTaD15LV09WfHJl7QA=;
 b=LQa53gjk+/EWW5teldkZgJJdf7M38xXJ3zIvaNeTzE/3OgqpbiUzin37ZF/Ld4I036
 kXTFlDql9ss1pkSP9IgdURoJODJTM9lBKAaaecPmpHYPDmOjE905s+0r3BaKlm8HeE92
 Rb7onOJZjI55CTc4cKiYk5J9s1q4wF/GMaaZuUJ2qMB1w8U9hmwefrr5deB9+YRyH2km
 OZWIekXTPP+GLmLv6ji1zw2NYFRpSEadkzNRmvLYGCiWLJGO6rG/B8G+Zv6Eno1F2mBW
 T+UWyXZUpwXPZy0UtgCsO94Ox8C9R0xt07qupzoZi2w0wuboRjvRtNOCKtlsqlvB3dDs
 4Ukg==
X-Gm-Message-State: AOAM533vWlcnZbncBxmbDA026+gw3AlS5C7CObZBlVPl6FKVN0uS1fvF
 SjZRX3GjjQIBkrQ7OyW0r58=
X-Google-Smtp-Source: ABdhPJwmLU0/zFy/biwCWPdlbly4yd8EXZvqkIyBmFwrU0xdwElcWIp7GYrCCXyxceMhCvEZZAAqtw==
X-Received: by 2002:a17:906:68c4:: with SMTP id
 y4mr13159828ejr.197.1602229003288; 
 Fri, 09 Oct 2020 00:36:43 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w25sm5360262ejy.123.2020.10.09.00.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 00:36:42 -0700 (PDT)
Subject: Re: [PATCH 2/4] drm/prime: document that use the page array is
 deprecated
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, chris@chris-wilson.co.uk, airlied@redhat.com,
 akpm@linux-foundation.org, sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008112342.9394-2-christian.koenig@amd.com>
 <20201008140914.GF438822@phenom.ffwll.local>
 <20201008141419.GH438822@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6cc96549-2724-6849-0f38-0de60ed6989c@gmail.com>
Date: Fri, 9 Oct 2020 09:36:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008141419.GH438822@phenom.ffwll.local>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMTAuMjAgdW0gMTY6MTQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgT2N0
IDA4LCAyMDIwIGF0IDA0OjA5OjE0UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9u
IFRodSwgT2N0IDA4LCAyMDIwIGF0IDAxOjIzOjQwUE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcg
d3JvdGU6Cj4+PiBXZSBoYXZlIHJlb2NjdXJyaW5nIHJlcXVlc3RzIG9uIHRoaXMgc28gYmV0dGVy
IGRvY3VtZW50IHRoYXQKPj4+IHRoaXMgYXBwcm9hY2ggZG9lc24ndCB3b3JrIGFuZCBkbWFfYnVm
X21tYXAoKSBuZWVkcyB0byBiZSB1c2VkIGluc3RlYWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4gLS0tCj4+PiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyB8IDcgKysrKysrLQo+Pj4gICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUu
Ywo+Pj4gaW5kZXggNDkxMGM0NDZkYjgzLi4xNmZhMmJmYzI3MWUgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cHJpbWUuYwo+Pj4gQEAgLTk1Niw3ICs5NTYsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9nZW1fcHJp
bWVfaW1wb3J0KTsKPj4+ICAgLyoqCj4+PiAgICAqIGRybV9wcmltZV9zZ190b19wYWdlX2FkZHJf
YXJyYXlzIC0gY29udmVydCBhbiBzZyB0YWJsZSBpbnRvIGEgcGFnZSBhcnJheQo+Pj4gICAgKiBA
c2d0OiBzY2F0dGVyLWdhdGhlciB0YWJsZSB0byBjb252ZXJ0Cj4+PiAtICogQHBhZ2VzOiBvcHRp
b25hbCBhcnJheSBvZiBwYWdlIHBvaW50ZXJzIHRvIHN0b3JlIHRoZSBwYWdlIGFycmF5IGluCj4+
PiArICogQHBhZ2VzOiBkZXByZWNhdGVkIGFycmF5IG9mIHBhZ2UgcG9pbnRlcnMgdG8gc3RvcmUg
dGhlIHBhZ2UgYXJyYXkgaW4KPj4+ICAgICogQGFkZHJzOiBvcHRpb25hbCBhcnJheSB0byBzdG9y
ZSB0aGUgZG1hIGJ1cyBhZGRyZXNzIG9mIGVhY2ggcGFnZQo+Pj4gICAgKiBAbWF4X2VudHJpZXM6
IHNpemUgb2YgYm90aCB0aGUgcGFzc2VkLWluIGFycmF5cwo+Pj4gICAgKgo+Pj4gQEAgLTk2NSw2
ICs5NjUsMTEgQEAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ByaW1lX2ltcG9ydCk7Cj4+PiAgICAq
Cj4+PiAgICAqIERyaXZlcnMgY2FuIHVzZSB0aGlzIGluIHRoZWlyICZkcm1fZHJpdmVyLmdlbV9w
cmltZV9pbXBvcnRfc2dfdGFibGUKPj4+ICAgICogaW1wbGVtZW50YXRpb24uCj4+PiArICoKPj4+
ICsgKiBTcGVjaWZ5aW5nIHRoZSBwYWdlcyBhcnJheSBpcyBkZXByZWNhdGVkIGFuZCBzdHJvbmds
eSBkaXNjb3VyYWdlZCBmb3IgbmV3Cj4+PiArICogZHJpdmVycy4gVGhlIHBhZ2VzIGFycmF5IGlz
IG9ubHkgdXNlZnVsIGZvciBwYWdlIGZhdWx0cyBhbmQgdGhvc2UgY2FuCj4+PiArICogY29ycnVw
dCBmaWVsZHMgaW4gdGhlIHN0cnVjdCBwYWdlIGlmIHRoZXkgYXJlIG5vdCBoYW5kbGVkIGJ5IHRo
ZSBleHBvcnRpbmcKPj4+ICsgKiBkcml2ZXIuCj4+PiAgICAqLwo+PiBJJ2QgbWFrZSB0aGlzIGEg
X2xvdF8gc3Ryb25nZXI6IEFzaWRlIGZyb20gYW1kZ3B1IGFuZCByYWRlb24gYWxsIGRyaXZlcnMK
Pj4gdXNpbmcgdGhpcyBvbmx5IG5lZWQgaXQgZm9yIHRoZSBwYWdlcyBhcnJheS4gSW1vIGp1c3Qg
b3Blbi1jb2RlIHRoZSBzZwo+PiB0YWJsZSB3YWxraW5nIGxvb3AgaW4gYW1kZ3B1L3JhZGVvbiAo
aXQncyByZWFsbHkgbm90IG11Y2ggY29kZSksIGFuZCB0aGVuCj4+IGRyb3AgdGhlIGRtYV9hZGRy
X3QgcGFyYW1ldGVyIGZyb20gdGhpcyBmdW5jdGlvbiBoZXJlIChpdCdzIHNldCB0byBOVUxMIGJ5
Cj4+IGV2ZXJ5b25lIGVsc2UpLgo+Pgo+PiBBbmQgdGhlbiBkZXByZWNhdGUgdGhpcyBlbnRpcmUg
ZnVuY3Rpb24gaGVyZSB3aXRoIGEgYmlnIHdhcm5pbmcgdGhhdCBhKQo+PiBkbWFfYnVmX21hcF9h
dHRhY2htZW50IGlzIGFsbG93ZWQgdG8gbGVhdmUgdGhlIHN0cnVjdCBwYWdlIHBvaW50ZXJzIE5V
TEwKPj4gYW5kIGIpIHRoaXMgYnJlYWtzIG1tYXAsIHVzZXJzIG11c3QgY2FsbCBkbWFfYnVmX21t
YXAgaW5zdGVhZC4KPj4KPj4gQWxzbyBtYXliZSBtYWtlIGl0IGFuIHVwcGVyY2FzZSBERVBSRUNB
VEVEIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQgOi0pCj4gT0sgSSBqdXN0IHJlYWxpemVkIEkgbWlz
c2VkIG5vdXZlYXUuIFRoYXQgd291bGQgYmUgMyBwbGFjZXMgd2hlcmUgd2UgbmVlZAo+IHRvIHN0
dWZmIHRoZSBkbWFfYWRkcl90IGxpc3QgaW50byBzb21ldGhpbmcgdHRtIGNhbiB0YWtlLiBTdGls
bCBmZWVscwo+IGJldHRlciB0aGFuIHRoaXMgaGFsZi1kZXByZWNhdGVkIGZ1bmN0aW9uIGtsdWRn
ZSAuLi4KCk1obSwgSSBkb24ndCBzZWUgYSByZWFzb24gd2h5IG5vdXZlYXUgd291bGQgbmVlZCB0
aGUgc3RydWN0IHBhZ2UgZWl0aGVyLgoKSG93IGFib3V0IHdlIHNwbGl0IHRoYXQgdXAgaW50byB0
d28gZnVuY3Rpb24/CgpPbmUgZm9yIGNvbnZlcnRpbmcgdGhlIHNnX3RhYmxlIGludG8gYSBsaW5l
YXIgZG1hX2FkZHIgYXJyYXkuCgpBbmQgb25lIGZvciBjb252ZXJ0aW5nIHRoZSBzZ190YWJsZSBp
bnRvIGEgbGluZWFyIHN0cnVjdCBwYWdlIGFycmF5IHdpdGggCmEgX19kZXByZWNhdGVkIGF0dHJp
YnV0ZSBvbiBpdD8KCkNocmlzdGlhbi4KCj4gLURhbmllbAo+Cj4+IC1EYW5pZWwKPj4KPj4+ICAg
aW50IGRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHN0cnVjdCBzZ190YWJsZSAqc2d0
LCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLAo+Pj4gICAJCQkJICAgICBkbWFfYWRkcl90ICphZGRycywg
aW50IG1heF9lbnRyaWVzKQo+Pj4gLS0gCj4+PiAyLjE3LjEKPj4+Cj4+IC0tIAo+PiBEYW5pZWwg
VmV0dGVyCj4+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+PiBodHRwOi8v
YmxvZy5mZndsbC5jaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
