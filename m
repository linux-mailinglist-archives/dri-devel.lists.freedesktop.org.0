Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 016731C4DEC
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 07:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FF16E3AC;
	Tue,  5 May 2020 05:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D52B6E3AC;
 Tue,  5 May 2020 05:55:09 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a21so313369ljb.9;
 Mon, 04 May 2020 22:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5Jl8Jj64ibC9mIAmg/Ap6Jj3w1BwlRCCyo3VEMK9xNk=;
 b=FbUX3wWMmYHcjwSRdlYy4lardgWzwLOqBHDjy5LpkkW7NILuTjeFJDm7A0mXyFjQtl
 mJaT9TDGvIrE0jOMLX1wAb46VKaVkhOgkC5EIEjx1kn9oqwJgqTAvIbQOyLSgsLsEc+F
 7weYeDrINH1T4d+ACbCVO7LNc6Hc1Rfn7EgCAQA984az1ORolPCpoqSHmZQlUwMj3pj6
 CMDwsyuCZ3adwDcLuulIypamK2ZpO7tHjw99oP9lKpiLHVMNtlfvB4ogz51E3YH+iN/x
 cD38T+UMnnCjlVepELQrpDcAXzuipkQVgpFKC8VrUNoQTRFlC5oCBoyQsMatAVHw7eJm
 v5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Jl8Jj64ibC9mIAmg/Ap6Jj3w1BwlRCCyo3VEMK9xNk=;
 b=jbO6DTw0Tzo/EuKVEVp8Bfjy4hsdkMJwMhqGGrZ18Mlqa5TS+ykxzfU4GTxs5bRQUo
 V47rAN1RgCDFCrWoShWgbUb3/pSGPnFgT8a/mMTCBq/VnFA/PCT8MIstWsrSKyZ1CPU3
 zuhlX14NGvqB2Ngs0/dN0WiIr+ZIk+IoTdzmUVtcCUdUcCkOvieheXLDL6wrFU6/dhHV
 C10f4dIx4GrNjd79SRezgqkTvNFh1ABi8D9QoEHimhWfuX++7Bde6KZf2YAznrIXDjLm
 WLPiEZGtCbo+MvL+NOlFR1PJMkJFvRCNCmyXy1G51oKUTr4JbCyqLU+bEA965Rz05Cfg
 xhyQ==
X-Gm-Message-State: AGi0Pub0R+ZUIg1kBVgfFL7JjEcCN+uMkuwN7DqqtCJH8q4a7Ls+EAwC
 GJwr6a3AdItOCCJHBHYPl3LaQyjV+5+vzA==
X-Google-Smtp-Source: APiQypKj427kpn++lsVAknyegPhtGV744X0rKkRsUjaI13o2Clu5IZP2HJNkrcmtGSp5f2+iUyb7eA==
X-Received: by 2002:a2e:9791:: with SMTP id y17mr757567lji.174.1588658107094; 
 Mon, 04 May 2020 22:55:07 -0700 (PDT)
Received: from [192.168.0.103] (static-91-225-135-18.devs.futuro.pl.
 [91.225.135.18])
 by smtp.gmail.com with ESMTPSA id a12sm816405ljj.64.2020.05.04.22.55.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 May 2020 22:55:06 -0700 (PDT)
Subject: Re: [PATCH] drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
To: Sean Paul <seanpaul@chromium.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <1588093804-30446-1-git-send-email-michalorzel.eng@gmail.com>
 <875zdiacv2.fsf@intel.com>
 <CAOw6vbK69aWzti9a7MXNmAfVfJXzzC5g74p4ukSE49MhaV_b3g@mail.gmail.com>
 <CAKMK7uEzTn2nKyEaxMcd6602tprwkdnBrmrFYO+_Hi7FY39jAw@mail.gmail.com>
 <520d517e-5e8f-a6c7-1c8a-38d1a368a79f@gmail.com>
 <20200504115309.GJ10381@phenom.ffwll.local>
From: =?UTF-8?B?TWljaGHFgiBPcnplxYI=?= <michalorzel.eng@gmail.com>
Message-ID: <9cd2487b-c6a8-b057-e53c-b3dd1e7141aa@gmail.com>
Date: Tue, 5 May 2020 07:55:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200504115309.GJ10381@phenom.ffwll.local>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAwNC4wNS4yMDIwIDEzOjUzLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIEZyaSwgTWF5
IDAxLCAyMDIwIGF0IDA1OjQ5OjMzUE0gKzAyMDAsIE1pY2hhxYIgT3J6ZcWCIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAzMC4wNC4yMDIwIDIwOjMwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4gT24gVGh1
LCBBcHIgMzAsIDIwMjAgYXQgNTozOCBQTSBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9y
Zz4gd3JvdGU6Cj4+Pj4KPj4+PiBPbiBXZWQsIEFwciAyOSwgMjAyMCBhdCA0OjU3IEFNIEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBP
biBUdWUsIDI4IEFwciAyMDIwLCBNaWNoYWwgT3J6ZWwgPG1pY2hhbG9yemVsLmVuZ0BnbWFpbC5j
b20+IHdyb3RlOgo+Pj4+Pj4gQXMgc3VnZ2VzdGVkIGJ5IHRoZSBUT0RPIGxpc3QgZm9yIHRoZSBr
ZXJuZWwgRFJNIHN1YnN5c3RlbSwgcmVwbGFjZQo+Pj4+Pj4gdGhlIGRlcHJlY2F0ZWQgZnVuY3Rp
b25zIHRoYXQgdGFrZS9kcm9wIG1vZGVzZXQgbG9ja3Mgd2l0aCBuZXcgaGVscGVycy4KPj4+Pj4+
Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbG9yemVsLmVuZ0BnbWFp
bC5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfb2JqZWN0
LmMgfCAxMCArKysrKystLS0tCj4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9tb2RlX29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX29iamVjdC5j
Cj4+Pj4+PiBpbmRleCAzNWMyNzE5Li45MDFiMDc4IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9tb2RlX29iamVjdC5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX21vZGVfb2JqZWN0LmMKPj4+Pj4+IEBAIC00MDIsMTIgKzQwMiwxMyBAQCBpbnQgZHJtX21v
ZGVfb2JqX2dldF9wcm9wZXJ0aWVzX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsCj4+Pj4+PiAgewo+Pj4+Pj4gICAgICAgc3RydWN0IGRybV9tb2RlX29ial9nZXRfcHJv
cGVydGllcyAqYXJnID0gZGF0YTsKPj4+Pj4+ICAgICAgIHN0cnVjdCBkcm1fbW9kZV9vYmplY3Qg
Km9iajsKPj4+Pj4+ICsgICAgIHN0cnVjdCBkcm1fbW9kZXNldF9hY3F1aXJlX2N0eCBjdHg7Cj4+
Pj4+PiAgICAgICBpbnQgcmV0ID0gMDsKPj4+Pj4+Cj4+Pj4+PiAgICAgICBpZiAoIWRybV9jb3Jl
X2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfTU9ERVNFVCkpCj4+Pj4+PiAgICAgICAgICAgICAg
IHJldHVybiAtRU9QTk9UU1VQUDsKPj4+Pj4+Cj4+Pj4+PiAtICAgICBkcm1fbW9kZXNldF9sb2Nr
X2FsbChkZXYpOwo+Pj4+Pj4gKyAgICAgRFJNX01PREVTRVRfTE9DS19BTExfQkVHSU4oZGV2LCBj
dHgsIDAsIHJldCk7Cj4+Pj4+Cj4+Pj4+IEkgY3J5IGEgbGl0dGxlIGV2ZXJ5IHRpbWUgSSBsb29r
IGF0IHRoZSBEUk1fTU9ERVNFVF9MT0NLX0FMTF9CRUdJTiBhbmQKPj4+Pj4gRFJNX01PREVTRVRf
TE9DS19BTExfRU5EIG1hY3Jvcy4gOigKPj4+Pj4KPj4+Pj4gQ3VycmVudGx5IG9ubHkgc2l4IHVz
ZXJzLi4uIGJ1dCB0aGVyZSBhcmUgfjYwIGNhbGxzIHRvCj4+Pj4+IGRybV9tb2Rlc2V0X2xvY2tf
YWxseyxfY3R4fSB0aGF0IEkgcHJlc3VtZSBhcmUgdG8gYmUgcmVwbGFjZWQuIEkgd29uZGVyCj4+
Pj4+IGlmIHRoaXMgd2lsbCBjb21lIGJhY2sgYW5kIGhhdW50IHVzLgo+Pj4+Pgo+Pj4+Cj4+Pj4g
V2hhdCdzIHRoZSBhbHRlcm5hdGl2ZT8gU2VlbXMgbGlrZSB0aGUgb3B0aW9ucyB3aXRob3V0IHRo
ZSBtYWNyb3MgaXMKPj4+PiB0byB1c2UgaW5jb3JyZWN0IHNjb3BlIG9yIGhhdmUgYSBidW5jaCBv
ZiByZXRyeS9iYWNrb2ZmIGNhcmdvLWN1bHQKPj4+PiBldmVyeXdoZXJlIChhbmQgaG9wZSB0aGUg
Y29weSBzb3VyY2UgaXMgZG9uZSBjb3JyZWN0bHkpLgo+Pj4KPj4+IFllYWggU2VhbiAmIG1lIGhh
ZCBhIGJ1bmNoIG9mIGJpa2VzaGVkcyBhbmQgdGhpcyBpcyB0aGUgbGVhc3Qgd29yc3QKPj4+IG9w
dGlvbiB3ZSBjb3VsZCBjb21lIHVwIHdpdGguIFlvdSBjYW4ndCBtYWtlIGl0IGEgZnVuY3Rpb24g
YmVjYXVzZSBvZgo+Pj4gdGhlIGNvbnRyb2wgZmxvdy4gWW91IGRvbid0IHdhbnQgdG8gb3BlbiBj
b2RlIHRoaXMgYmVjYXVzZSBpdCdzIHRyaWNreQo+Pj4gdG8gZ2V0IHJpZ2h0LCBpZiBhbGwgeW91
IHdhbnQgaXMgdG8ganVzdCBncmFiIGFsbCBsb2Nrcy4gQnV0IGl0IGlzCj4+PiBtYWdpYyBoaWRk
ZW4gYmVoaW5kIGEgbWFjcm8sIHdoaWNoIG9jY2FzaW9uYWxseSBlbmRzIHVwIGh1cnRpbmcuCj4+
PiAtRGFuaWVsCj4+IFNvIHdoYXQgYXJlIHdlIGRvaW5nIHdpdGggdGhpcyBwcm9ibGVtPyBTaG91
bGQgd2UgcmVwbGFjZSBhdCBvbmNlIGFwcHJveC4gNjAgY2FsbHM/Cj4gCj4gSSdtIGNvbmZ1c2Vk
IGJ5IHlvdXIgcXVlc3Rpb24gLSBkcmFkdWFsIGNvbnZlcnNpb24gaXMgZW50aXJlbHkgb3J0aG9n
b25hbAo+IHRvIHdoYXQgZXhhY3RseSB3ZSdyZSBjb252ZXJ0aW5nIHRvby4gQWxsIEkgYWRkZWQg
aGVyZSBpcyB0aGF0IHdlJ3ZlCj4gZGlzY3Vzc2VkIHRoaXMgYXQgbGVuZ3RoLCBhbmQgdGhlIG1h
Y3JvIGlzIHRoZSBiZXN0IHRoaW5nIHdlJ3ZlIGNvbWUgdXAKPiB3aXRoLiBJIHN0aWxsIHRoaW5r
IGl0J3MgdGhlIGJlc3QgY29tcHJvbWlzZS4KPiAKPiBGbGFnLWRheSBjb252ZXJzaW9uIGZvciBv
dmVyIDYwIGNhbGxzIGRvZXNuJ3Qgd29yaywgbm8gbWF0dGVyIHdoYXQuCj4gLURhbmllbAo+IApJ
IGFncmVlIHdpdGggdGhhdC4gQWxsIEkgd2FudGVkIHRvIGFzayB3YXMgd2hldGhlciBJIHNob3Vs
ZCBhZGQgc29tZXRoaW5nIGFkZGl0aW9uYWwgdG8gdGhpcyBwYXRjaCBvciBub3QuCgpUaGFua3Ms
Ck1pY2hhbAo+Pgo+PiBNaWNoYWwKPj4+Cj4+Pj4gU2Vhbgo+Pj4+Cj4+Pj4+IEJSLAo+Pj4+PiBK
YW5pLgo+Pj4+Pgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+ICAgICAgIG9iaiA9IGRybV9tb2RlX29iamVj
dF9maW5kKGRldiwgZmlsZV9wcml2LCBhcmctPm9ial9pZCwgYXJnLT5vYmpfdHlwZSk7Cj4+Pj4+
PiAgICAgICBpZiAoIW9iaikgewo+Pj4+Pj4gQEAgLTQyNyw3ICs0MjgsNyBAQCBpbnQgZHJtX21v
ZGVfb2JqX2dldF9wcm9wZXJ0aWVzX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsCj4+Pj4+PiAgb3V0X3VucmVmOgo+Pj4+Pj4gICAgICAgZHJtX21vZGVfb2JqZWN0X3B1
dChvYmopOwo+Pj4+Pj4gIG91dDoKPj4+Pj4+IC0gICAgIGRybV9tb2Rlc2V0X3VubG9ja19hbGwo
ZGV2KTsKPj4+Pj4+ICsgICAgIERSTV9NT0RFU0VUX0xPQ0tfQUxMX0VORChjdHgsIHJldCk7Cj4+
Pj4+PiAgICAgICByZXR1cm4gcmV0Owo+Pj4+Pj4gIH0KPj4+Pj4+Cj4+Pj4+PiBAQCAtNDQ5LDEy
ICs0NTAsMTMgQEAgc3RhdGljIGludCBzZXRfcHJvcGVydHlfbGVnYWN5KHN0cnVjdCBkcm1fbW9k
ZV9vYmplY3QgKm9iaiwKPj4+Pj4+ICB7Cj4+Pj4+PiAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2ID0gcHJvcC0+ZGV2Owo+Pj4+Pj4gICAgICAgc3RydWN0IGRybV9tb2RlX29iamVjdCAqcmVm
Owo+Pj4+Pj4gKyAgICAgc3RydWN0IGRybV9tb2Rlc2V0X2FjcXVpcmVfY3R4IGN0eDsKPj4+Pj4+
ICAgICAgIGludCByZXQgPSAtRUlOVkFMOwo+Pj4+Pj4KPj4+Pj4+ICAgICAgIGlmICghZHJtX3By
b3BlcnR5X2NoYW5nZV92YWxpZF9nZXQocHJvcCwgcHJvcF92YWx1ZSwgJnJlZikpCj4+Pj4+PiAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4KPj4+Pj4+IC0gICAgIGRybV9tb2Rl
c2V0X2xvY2tfYWxsKGRldik7Cj4+Pj4+PiArICAgICBEUk1fTU9ERVNFVF9MT0NLX0FMTF9CRUdJ
TihkZXYsIGN0eCwgMCwgcmV0KTsKPj4+Pj4+ICAgICAgIHN3aXRjaCAob2JqLT50eXBlKSB7Cj4+
Pj4+PiAgICAgICBjYXNlIERSTV9NT0RFX09CSkVDVF9DT05ORUNUT1I6Cj4+Pj4+PiAgICAgICAg
ICAgICAgIHJldCA9IGRybV9jb25uZWN0b3Jfc2V0X29ial9wcm9wKG9iaiwgcHJvcCwgcHJvcF92
YWx1ZSk7Cj4+Pj4+PiBAQCAtNDY4LDcgKzQ3MCw3IEBAIHN0YXRpYyBpbnQgc2V0X3Byb3BlcnR5
X2xlZ2FjeShzdHJ1Y3QgZHJtX21vZGVfb2JqZWN0ICpvYmosCj4+Pj4+PiAgICAgICAgICAgICAg
IGJyZWFrOwo+Pj4+Pj4gICAgICAgfQo+Pj4+Pj4gICAgICAgZHJtX3Byb3BlcnR5X2NoYW5nZV92
YWxpZF9wdXQocHJvcCwgcmVmKTsKPj4+Pj4+IC0gICAgIGRybV9tb2Rlc2V0X3VubG9ja19hbGwo
ZGV2KTsKPj4+Pj4+ICsgICAgIERSTV9NT0RFU0VUX0xPQ0tfQUxMX0VORChjdHgsIHJldCk7Cj4+
Pj4+Pgo+Pj4+Pj4gICAgICAgcmV0dXJuIHJldDsKPj4+Pj4+ICB9Cj4+Pj4+Cj4+Pj4+IC0tCj4+
Pj4+IEphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKPj4+Cj4+
Pgo+Pj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
