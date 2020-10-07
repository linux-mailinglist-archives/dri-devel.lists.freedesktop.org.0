Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A828285E65
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 13:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6D16E8BD;
	Wed,  7 Oct 2020 11:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5186E8BD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 11:45:01 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id e22so2499963ejr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YaRp+3Wir7oprxdCA9DfFZtrcuEENNVe3A++xCpB3s8=;
 b=VeexFY93VrPAu2aMBzax3uKfn4T2wICcujcT4ra2hfaz7iR7SHveiXO5CCLP5UeXyE
 5S+mYhzoaxgt8yrcWgIipM19v1I42JEYtH5v6zsMiHGvZkBdRGaldildbccaM+5jtQm5
 6PkKMT3JpD/JRPMh3CSdu8YfAnxqCHEHjWsZmdAintPBRc4E23UmDG8zJBjPEi2c+fgf
 AbC4IQxN2xcnyckEjTm4eLWgCt3aFhi2KLuMYC39jBrRG8YEB6u0KmTBZElooaBWJe6Z
 DvrKWecmvYM7MIKK/PGtjQK+McgTAr9y1QFYtPPijldR71iNaKt7DN+OcJ6wP7XAO4Ah
 mOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YaRp+3Wir7oprxdCA9DfFZtrcuEENNVe3A++xCpB3s8=;
 b=ujwrYnuhhZYAtnBQKQz7feeC+voVjzwhjYKDqlIQsSEVHNgAKwWa03JtK2GLDgPhbY
 7yAvf7X9n7VEGbWO/B0fdYdKWGGy56WHwG04y7mocSuwwvfHgX23dqbGjwRPu606b4LX
 HDsHc2iSjllT6/RVHMfIi+9LEWA9e72RSjUSd2M2EXTXuML7c00UiiRHGfG8YI7DyATm
 0ipaPyvw9jS7IvY5UTDZXqxjX5bhqXqAX8W1CqbNZVsHDO9X5rMGW1ruOWVhba3soyUv
 tFqUaRtq+vSvfoCa2r4fL1lVc5LzeUet38bUeh4dMGBvBf6Q7Rod4r2xzXPF8X85/sVP
 KvtQ==
X-Gm-Message-State: AOAM531Y87TntRuYG17kBCN0K+n5UuART9YUpQKAANaidkYJsOEv7y2p
 tUeHdiUawndEmUrOtstEOfJZAsOc2K0=
X-Google-Smtp-Source: ABdhPJz+pD9LACf30F30boKt4vc9ejaCJ+rGx9zZZhQdTjqbBfivXLRGALHxOxHzpCQ+CGMPXF/nuw==
X-Received: by 2002:a17:906:5593:: with SMTP id
 y19mr2807238ejp.369.1602071100100; 
 Wed, 07 Oct 2020 04:45:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id nu20sm1328954ejb.109.2020.10.07.04.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 04:44:59 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: remove ttm_bo_unmap_virtual_locked declaration
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>
References: <20201007085222.16586-1-christian.koenig@amd.com>
 <cb699f27e94f491db3e38f674815cbda@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b19fad31-9468-0924-787b-e9cc0771e38e@gmail.com>
Date: Wed, 7 Oct 2020 13:44:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cb699f27e94f491db3e38f674815cbda@intel.com>
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

QW0gMDcuMTAuMjAgdW0gMTM6NDMgc2NocmllYiBSdWhsLCBNaWNoYWVsIEo6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVp
Y2h0enVtZXJrZW5AZ21haWwuY29tPgo+PiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgNywgMjAy
MCA0OjUyIEFNCj4+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhaXJsaWVk
QGdtYWlsLmNvbTsKPj4gcmF5Lmh1YW5nQGFtZC5jb207IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFl
bC5qLnJ1aGxAaW50ZWwuY29tPgo+PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS90dG06IHJlbW92ZSB0
dG1fYm9fdW5tYXBfdmlydHVhbF9sb2NrZWQKPj4gZGVjbGFyYXRpb24KPj4KPj4gVGhhdCB3YXMg
bWlzc2VkIGR1cmluZyB0aGUgY2xlYW51cC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+PiAtLS0KPj4gaW5jbHVkZS9kcm0v
dHRtL3R0bV9ib19kcml2ZXIuaCB8IDkgLS0tLS0tLS0tCj4+IDEgZmlsZSBjaGFuZ2VkLCA5IGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2
ZXIuaAo+PiBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPj4gaW5kZXggOTg5N2Ex
NmMwYTlkLi5iNThkZWRjZTcwNzkgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1f
Ym9fZHJpdmVyLmgKPj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+PiBA
QCAtNDQ5LDE1ICs0NDksNiBAQCBpbnQgdHRtX2JvX2RldmljZV9pbml0KHN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2LAo+PiAgICovCj4+IHZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWwoc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7Cj4+Cj4+IC0vKioKPj4gLSAqIHR0bV9ib191bm1hcF92
aXJ0dWFsCj4+IC0gKgo+PiAtICogQGJvOiB0ZWFyIGRvd24gdGhlIHZpcnR1YWwgbWFwcGluZ3Mg
Zm9yIHRoaXMgQk8KPj4gLSAqCj4+IC0gKiBUaGUgY2FsbGVyIG11c3QgdGFrZSB0dG1fbWVtX2lv
X2xvY2sgYmVmb3JlIGNhbGxpbmcgdGhpcyBmdW5jdGlvbi4KPj4gLSAqLwo+PiAtdm9pZCB0dG1f
Ym9fdW5tYXBfdmlydHVhbF9sb2NrZWQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7Cj4g
Z3JlcGluZyBmb3IgdHRtX2JvX3VubWFwX3ZpcnR1YWxfbG9ja2VkIHJldmVhbGVkIHRoaXM6Cj4K
PiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9wYWdlX2RpcnR5LmM6ICogVGhpcyBpcyBz
aW1pbGFyIHRvIHR0bV9ib191bm1hcF92aXJ0dWFsX2xvY2tlZCgpIGV4Y2VwdCBpdCB0YWtlcyBh
IHN1YnJhbmdlLgo+IGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmg6dm9pZCB0dG1fYm9f
dW5tYXBfdmlydHVhbF9sb2NrZWQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7Cj4KPiBT
aG91bGQgeW91IGNsZWFuIHVwIHRoZSB2bXdndnggY29tbWVudCB0byBhdm9pZCBjb25mdXNpb24/
IPCfmIoKCk9oIGdvb2QgcG9pbnQsIHRoYW5rcy4gRGlkbid0IGtub3cgdGhhdCB0aGUgZnVuY3Rp
b24gd2FzIHJlZmVyZW5jZWQgCm91dHNpZGUgb2YgVFRNIGFueXdoZXJlIGFueW1vcmUuCgpDaHJp
c3RpYW4uCgo+Cj4gUmV2aWV3ZWQtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxA
aW50ZWwuY29tPgo+Cj4gbQo+Cj4+IC0KPj4gLyoqCj4+ICAgKiB0dG1fYm9fcmVzZXJ2ZToKPj4g
ICAqCj4+IC0tCj4+IDIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
