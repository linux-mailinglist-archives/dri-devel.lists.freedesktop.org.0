Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F42285A7B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 10:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EC16E235;
	Wed,  7 Oct 2020 08:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C57E6E235
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 08:31:28 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 10so1008291qtx.12
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 01:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=fPoTa/bwdEtOLRZriBVoxaiJzdb3UNhVpDQ6nA4oIZs=;
 b=VPN+t5ewLpmjaTfckMkDuJux+AfWcRTg5q+tlKmZ1iE+YsWmltapmBRmjozke5FDqj
 Fv7OL5G/SgKXXMhhNX7cJ9+WZYg4vXg7008qpWMqAcyVJNpWM0LCJDib6y5+QSJr2k74
 FRohwtiJfNse4n6Hr4Y20QpAQv37eFx21KLBHDmO5udDUFxhoBP93qM8geWCcJ/U+KQ5
 Si3tDWOHg5EN0WsWO8MslPETPleJaNHeCA+gxr63v0AtHh0d4fJJVArVfRXO8rZHHlJy
 7J0wSt8iB/IRqEQmzGP0KiC3Mo8toNcgYS5VktVytJbPvAwjI308kDn0LkTBOGw+a3k0
 5Kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fPoTa/bwdEtOLRZriBVoxaiJzdb3UNhVpDQ6nA4oIZs=;
 b=KLAsLcV8HwNgleZJBL8ksq92sKPHXKZ3AkbcfDJXisSIjgi9yVNQyl0A6zC4STCUfD
 qmQfSbERkeglmRXy8e6S7ahIvmR5JZtOlBHNg8xZjAAxZcsE3cRHcuXSLLYJ7Pui9j3D
 onKCc+Y8dkE7lv+z8FBv2abXvSR12nqFP4/eeHrzjig6BPigRzeawB8I1ArlP+XubPdD
 tm9c/b2MvMymoOy3oFtVXasQ30WUGPkrFta74l7rih9Chsuv03yjv+Bf0Ewazeyofo41
 EdMHd0DJzkg44nkB2N5CNmLqAvu12st2pWAh/1iFTTphEB/1wL3MfSYk9NyKINDs0zVn
 M2gw==
X-Gm-Message-State: AOAM53120yVOkicCdrobmr1lcDVlDNwoRXW/ONYB8u2CcDuGQTB3rrRj
 791lbD41npTK/i1OJqxwizw=
X-Google-Smtp-Source: ABdhPJw7a9AV6bOqswLLlwoLty7hYkAKaxUPSHHT1bLiSiHiONTlLG/hbiqvsMwqaX4SpP4HO8+s/g==
X-Received: by 2002:ac8:5992:: with SMTP id e18mr2088299qte.245.1602059487220; 
 Wed, 07 Oct 2020 01:31:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l6sm889745qkb.56.2020.10.07.01.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 01:31:26 -0700 (PDT)
Subject: Re: [PATCH 2/8] drm/ttm: move ttm_set_memory.h out of include
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ray.huang@amd.com" <ray.huang@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20201001112817.20967-1-christian.koenig@amd.com>
 <20201001112817.20967-2-christian.koenig@amd.com>
 <43090043dbd54c13ab48abd81baea49e@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7c9f8939-55bb-e93d-0ab8-36dbb0c211f1@gmail.com>
Date: Wed, 7 Oct 2020 10:31:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <43090043dbd54c13ab48abd81baea49e@intel.com>
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

QW0gMDUuMTAuMjAgdW0gMTc6MDEgc2NocmllYiBSdWhsLCBNaWNoYWVsIEo6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YKPj4gQ2hyaXN0aWFuIEvDtm5pZwo+
PiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxLCAyMDIwIDc6MjggQU0KPj4gVG86IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IHJheS5odWFuZ0BhbWQuY29tOwo+PiBhaXJsaWVkQGdt
YWlsLmNvbTsgZGFuaWVsQGZmd2xsLmNoCj4+IFN1YmplY3Q6IFtQQVRDSCAyLzhdIGRybS90dG06
IG1vdmUgdHRtX3NldF9tZW1vcnkuaCBvdXQgb2YgaW5jbHVkZQo+Pgo+PiBUaGlzIGlzIG5vdCBz
b21ldGhpbmcgZHJpdmVycyBzaG91bGQgdXNlLgo+IEl0J3Mgbm90PwoKVGhvc2UgYXJlIGhlbHBl
ciBmdW5jdGlvbnMgd2hpY2ggYXJlIHVzZWQgYnkgdGhlIHR3byBkaWZmZXJlbnQgcGFnZSAKcG9v
bHMgdG8gY2hhbmdlIHRoZSBnbG9iYWwgbWFwcGluZyBvZiBwYWdlcyBvbiB4ODYuCgo+IEkgYW0g
bm90IHJlYWxseSBzdXJlIHdoYXQgeW91IGFyZSBkb2luZyBoZXJlLgoKTWFraW5nIHN1cmUgdGhh
dCBubyBkcml2ZXIgdGhpbmdzIHRoYXQgaXQgc2hvdWxkIHRvdWNoIHRoZSBDUFUgY2FjaGluZyAK
YXR0cmlidXRlcyBtYW51YWxseSA6KQoKQ2hyaXN0aWFuLgoKPgo+IE0KPgo+Cj4+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gLS0t
Cj4+IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgfCAz
ICsrLQo+PiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jICAgICAgICAg
IHwgMyArKy0KPj4ge2luY2x1ZGUgPT4gZHJpdmVycy9ncHV9L2RybS90dG0vdHRtX3NldF9tZW1v
cnkuaCB8IDAKPj4gMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4+IHJlbmFtZSB7aW5jbHVkZSA9PiBkcml2ZXJzL2dwdX0vZHJtL3R0bS90dG1fc2V0X21l
bW9yeS5oICgxMDAlKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
cGFnZV9hbGxvYy5jCj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5jCj4+
IGluZGV4IDE0NjYwZjcyM2Y3MS4uOTEyYzMwZGNjOWRiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fcGFnZV9hbGxvYy5jCj4+IEBAIC00Nyw3ICs0Nyw4IEBACj4+Cj4+ICNpbmNsdWRlIDxk
cm0vdHRtL3R0bV9ib19kcml2ZXIuaD4KPj4gI2luY2x1ZGUgPGRybS90dG0vdHRtX3BhZ2VfYWxs
b2MuaD4KPj4gLSNpbmNsdWRlIDxkcm0vdHRtL3R0bV9zZXRfbWVtb3J5Lmg+Cj4+ICsKPj4gKyNp
bmNsdWRlICJ0dG1fc2V0X21lbW9yeS5oIgo+Pgo+PiAjZGVmaW5lIE5VTV9QQUdFU19UT19BTExP
QwkJKFBBR0VfU0laRS9zaXplb2Yoc3RydWN0IHBhZ2UKPj4gKikpCj4+ICNkZWZpbmUgU01BTExf
QUxMT0NBVElPTgkJMTYKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bh
Z2VfYWxsb2NfZG1hLmMKPj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2Rt
YS5jCj4+IGluZGV4IDVlMmRmMTE2ODVlNy4uMTA0NWE1YzI2ZWUzIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMKPj4gQEAgLTQ5LDcgKzQ5LDggQEAKPj4g
I2luY2x1ZGUgPGxpbnV4L2t0aHJlYWQuaD4KPj4gI2luY2x1ZGUgPGRybS90dG0vdHRtX2JvX2Ry
aXZlci5oPgo+PiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5oPgo+PiAtI2luY2x1
ZGUgPGRybS90dG0vdHRtX3NldF9tZW1vcnkuaD4KPj4gKwo+PiArI2luY2x1ZGUgInR0bV9zZXRf
bWVtb3J5LmgiCj4+Cj4+ICNkZWZpbmUgTlVNX1BBR0VTX1RPX0FMTE9DCQkoUEFHRV9TSVpFL3Np
emVvZihzdHJ1Y3QgcGFnZQo+PiAqKSkKPj4gI2RlZmluZSBTTUFMTF9BTExPQ0FUSU9OCQk0Cj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX3NldF9tZW1vcnkuaAo+PiBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX3NldF9tZW1vcnkuaAo+PiBzaW1pbGFyaXR5IGluZGV4IDEwMCUK
Pj4gcmVuYW1lIGZyb20gaW5jbHVkZS9kcm0vdHRtL3R0bV9zZXRfbWVtb3J5LmgKPj4gcmVuYW1l
IHRvIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3NldF9tZW1vcnkuaAo+PiAtLQo+PiAyLjE3LjEK
Pj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
