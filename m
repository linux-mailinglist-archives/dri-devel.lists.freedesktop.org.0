Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF6834254C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 19:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B736EA85;
	Fri, 19 Mar 2021 18:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A326EA84;
 Fri, 19 Mar 2021 18:53:50 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id l4so11342520ejc.10;
 Fri, 19 Mar 2021 11:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2afuHDDVuaTrWaw3vpeoWgrFKesjzY7I04gkKJvgMy8=;
 b=R9xYUdBfBZZB1MSw+E4L1JoB5HxuoDpcOBKginUh86zfPL6WsS7ow5edOYD63Me9RR
 u7PUBoeIn0W+Y6RRt4bhQVgqzyeOn4LMwhNVdDdk1H89K5/MhBxN9JX4nu7ramJWdzb2
 0utfP62Wr5LOm41Jwv9U4N9kPeTX2qggxj7G87R4pBuQwPlkRw1dAgfdapR0Pz/dmhNb
 emR4rNi8Nn83v/Q/Rx+nwOLsR2dzROtKBL106L00HP70eLV0OAuTJwL7yrOFZC7LaBEx
 xPG1VgW8fLV0mgioyWc7rY/y0PZHG3o9dLlPgRwQ3FV8PfRlCw5n9aJiarQEWOGGpFZg
 Y2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2afuHDDVuaTrWaw3vpeoWgrFKesjzY7I04gkKJvgMy8=;
 b=ZtwCjyJlLTStaQ9JRZfayY0YcULs9pd8UnuO04HXhxJzs5br6m0xO1BuuxzquTwJYB
 H07Lo9Snchu93cTn2aVcJPqp9A+dYAv6O92B+BgxJ+SIDizm/4SsJyuWzSMJ1UFCvOtO
 LzPdWDaYJ5zwvqRn7kLXPx68Y79JyH4SjdkNHdPKrwcd18whKQc/HmtW8J6oTLKPTvdG
 De/D3pZlyvH0F9et9UUSck1xOUiHuyJa1XogUlZhrIBxODtjfE7lGa1zZYjWBN7SJ4c6
 29l3dgySimOLyVJ3JXgy0e29cfDPfbDvcjByFryLMe0K7M1HdwwGZEwfQjJxPUOaWnkm
 bDVQ==
X-Gm-Message-State: AOAM530xqwaWGyeTQchk6eQWzKehh39NFjHqUqpk8VkY9ZJuhABbuAK4
 GTIPeUHSSPRfpdvJGz15M8XD3xUwQwI=
X-Google-Smtp-Source: ABdhPJzbl+2HNn+tcB27sI7QKpgaJ5C0fB/JETnQvf01F91NVRE4TFbnkJ1YJv1f9cvlWEi5eus6og==
X-Received: by 2002:a17:906:39cf:: with SMTP id
 i15mr6044030eje.534.1616180029579; 
 Fri, 19 Mar 2021 11:53:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3d17:e42d:64f0:733a?
 ([2a02:908:1252:fb60:3d17:e42d:64f0:733a])
 by smtp.gmail.com with ESMTPSA id s11sm4602765edt.27.2021.03.19.11.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 11:53:49 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210319140857.2262-1-christian.koenig@amd.com>
 <YFTk1GSaUDI3wcWt@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2831bfcc-140e-dade-1f50-a6431e495e9d@gmail.com>
Date: Fri, 19 Mar 2021 19:53:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFTk1GSaUDI3wcWt@phenom.ffwll.local>
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
Cc: Leo.Liu@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMDMuMjEgdW0gMTg6NTIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgTWFy
IDE5LCAyMDIxIGF0IDAzOjA4OjU3UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IERvbid0IHByaW50IGEgd2FybmluZyB3aGVuIHdlIGZhaWwgdG8gYWxsb2NhdGUgYSBwYWdlIGZv
ciBzd2FwcGluZyB0aGluZ3Mgb3V0Lgo+Pgo+PiBBbHNvIHJlbHkgb24gbWVtYWxsb2Nfbm9mc19z
YXZlL21lbWFsbG9jX25vZnNfcmVzdG9yZSBpbnN0ZWFkIG9mIEdGUF9OT0ZTLgo+IFVoIHRoaXMg
cGFydCBkb2Vzbid0IG1ha2Ugc2Vuc2UuIEVzcGVjaWFsbHkgc2luY2UgeW91IG9ubHkgZG8gaXQg
Zm9yIHRoZQo+IGRlYnVnZnMgZmlsZSwgbm90IGluIGdlbmVyYWwuIFdoaWNoIG1lYW5zIHlvdSd2
ZSBqdXN0IGNvbXBsZXRlbHkgYnJva2VuCj4gdGhlIHNocmlua2VyLgoKQXJlIHlvdSBzdXJlPyBN
eSBpbXByZXNzaW9uIGlzIHRoYXQgR0ZQX05PRlMgc2hvdWxkIG5vdyB3b3JrIG11Y2ggbW9yZSAK
b3V0IG9mIHRoZSBib3ggd2l0aCB0aGUgbWVtYWxsb2Nfbm9mc19zYXZlKCkvbWVtYWxsb2Nfbm9m
c19yZXN0b3JlKCkuCgo+IElmIHRoaXMgaXMganVzdCB0byBwYXBlciBvdmVyIHRoZSBzZXFfcHJp
bnRmIGRvaW5nIHRoZSB3cm9uZyBhbGxvY2F0aW9ucywKPiB0aGVuIGp1c3QgbW92ZSB0aGF0IG91
dCBmcm9tIHVuZGVyIHRoZSBmc19yZWNsYWltX2FjcXVpcmUvcmVsZWFzZSBwYXJ0LgoKTm8sIHRo
YXQgd2Fzbid0IHRoZSBwcm9ibGVtLgoKV2UgaGF2ZSBqdXN0IHNlZW4gdG8gbWFueSBmYWlsdXJl
cyB0byBhbGxvY2F0ZSBwYWdlcyBmb3Igc3dhcG91dCBhbmQgSSAKdGhpbmsgdGhhdCB3b3VsZCBp
bXByb3ZlIHRoaXMgYmVjYXVzZSBpbiBhIGxvdCBvZiBjYXNlcyB3ZSBjYW4gdGhlbiAKaW1tZWRp
YXRlbHkgc3dhcCB0aGluZ3Mgb3V0IGluc3RlYWQgb2YgaGF2aW5nIHRvIHJlbHkgb24gdXBwZXIg
bGF5ZXJzLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKCj4KPiBfX0dGUF9OT1dBUk4gc2hvdWxkIGJl
IHRoZXJlIGluZGVlZCBJIHRoaW5rLgo+IC1EYW5pZWwKPgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgfCA1ICsrKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fdHQuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPj4gaW5k
ZXggMmYwODMzYzk4ZDJjLi44NmZhM2U4MmRhY2MgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX3R0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+
PiBAQCAtMzY5LDcgKzM2OSw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHR0bV90dF9zaHJpbmtl
cl9zY2FuKHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rLAo+PiAgIAl9Owo+PiAgIAlpbnQgcmV0Owo+
PiAgIAo+PiAtCXJldCA9IHR0bV9ib19zd2Fwb3V0KCZjdHgsIEdGUF9OT0ZTKTsKPj4gKwlyZXQg
PSB0dG1fYm9fc3dhcG91dCgmY3R4LCBHRlBfS0VSTkVMIHwgX19HRlBfTk9XQVJOKTsKPj4gICAJ
cmV0dXJuIHJldCA8IDAgPyBTSFJJTktfRU1QVFkgOiByZXQ7Cj4+ICAgfQo+PiAgIAo+PiBAQCAt
Mzg5LDEwICszODksMTMgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgdHRtX3R0X3Nocmlua2VyX2Nv
dW50KHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rLAo+PiAgIHN0YXRpYyBpbnQgdHRtX3R0X2RlYnVn
ZnNfc2hyaW5rX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQo+PiAgIHsKPj4g
ICAJc3RydWN0IHNocmlua19jb250cm9sIHNjID0geyAuZ2ZwX21hc2sgPSBHRlBfS0VSTkVMIH07
Cj4+ICsJdW5zaWduZWQgaW50IGZsYWdzOwo+PiAgIAo+PiAgIAlmc19yZWNsYWltX2FjcXVpcmUo
R0ZQX0tFUk5FTCk7Cj4+ICsJZmxhZ3MgPSBtZW1hbGxvY19ub2ZzX3NhdmUoKTsKPj4gICAJc2Vx
X3ByaW50ZihtLCAiJWx1LyVsdVxuIiwgdHRtX3R0X3Nocmlua2VyX2NvdW50KCZtbV9zaHJpbmtl
ciwgJnNjKSwKPj4gICAJCSAgIHR0bV90dF9zaHJpbmtlcl9zY2FuKCZtbV9zaHJpbmtlciwgJnNj
KSk7Cj4+ICsJbWVtYWxsb2Nfbm9mc19yZXN0b3JlKGZsYWdzKTsKPj4gICAJZnNfcmVjbGFpbV9y
ZWxlYXNlKEdGUF9LRVJORUwpOwo+PiAgIAo+PiAgIAlyZXR1cm4gMDsKPj4gLS0gCj4+IDIuMjUu
MQo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
