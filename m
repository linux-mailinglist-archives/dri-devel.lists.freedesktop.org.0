Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7962837ED
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 16:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BE989C80;
	Mon,  5 Oct 2020 14:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136B289C80
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:37:44 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e18so3958468wrw.9
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 07:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dLljmbbq2yXW9VNpFIht9ChHqf4H+cCHhKj1SIMUrAw=;
 b=QO7fBlMa/M0PdiDZm5QeQEZaQU5vQ8aX6R1oafSqNEAeJ8hyMqyuvpePbAixDWeJj8
 QV4qPad39ankedtlKnAk72ogTNA1Nsv7KVSjKbNnImQE0DHjbRvc4wofxDSWv7x5PHqa
 sLPfSey8n6f+u7f+BOxHyltlhXprk6vOK+gdWslhYne5CKprf0mVoKlX4sRD8UHpHFXE
 ctkfZjeSO7v28r3Kol3PARBZ0JhOlS5CCkHTse8aOHE3XjGT2wcg0io7vAoPOo516XbF
 u91XEeaCZNwCQMxWQpznTgwIwiNsRKcnlwIAq+Hnw2G5J2ATbz081UGUoeIcmdFWnXGK
 U96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=dLljmbbq2yXW9VNpFIht9ChHqf4H+cCHhKj1SIMUrAw=;
 b=NMmMgpQVG3fY/xDrWdqdBiv9duC9d+uA+b6LnHQmPgzffuV3d1Sln0IcOOWI7YXQr4
 bq1dgkHAEPPM8u+yTRP8gR7ONbgvFJwPUuSUKinzb80bCX/GLU9wcIWYklZPdUcHNY8u
 EwMiXGdsIaNYvh4ovzqcHTTr6E6DfayiEUDGNaCvlAaz8BgZ2ayKT/JJC1sZExJQxGYt
 SVO+W5zOfqfmW6HozUEhLP/bLH2M3lLEEdC5CaNH2cU7oZQVHZfIcdswHJIwmkT2OqEw
 cjdsz+qeCHO3W+PtqLh0RTL7YXD6q8CShzKJxyVHCSVhOM0C4wVlAKUAryCiZdEtim4r
 z+iA==
X-Gm-Message-State: AOAM533hf4GAJ2V+IR7ZmAYtJM8KMeOyBpNXQg2dkN4Jys34wigSvnTr
 VUSt7r44y16evSLmRrWNGcc=
X-Google-Smtp-Source: ABdhPJzuDLWSogtz+A+gCgSzNxlFPG71H0Fpg/v5uJdHlHY9U8aQbGoORcnUM6LvsWge1cTv/oz+Hw==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr6447215wrq.106.1601908662763; 
 Mon, 05 Oct 2020 07:37:42 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e7sm240050wrm.6.2020.10.05.07.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 07:37:41 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/ttm: remove no_retry flag
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201002113121.47823-1-christian.koenig@amd.com>
 <20201002113121.47823-2-christian.koenig@amd.com>
 <CAKMK7uH9RLWqnsU5KKEC3414xfNZgEB7hXVf-f5f3LXsuaNY9w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7eafb431-c6ab-6441-3766-499530ce4c1f@gmail.com>
Date: Mon, 5 Oct 2020 16:37:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH9RLWqnsU5KKEC3414xfNZgEB7hXVf-f5f3LXsuaNY9w@mail.gmail.com>
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
Cc: Huang Rui <ray.huang@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDIuMTAuMjAgdW0gMTQ6MzEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgT2N0
IDIsIDIwMjAgYXQgMTozMSBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVt
ZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4gQW1kZ3B1IHdhcyB0aGUgb25seSB1c2VyIG9mIHRo
aXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBVaCB0aGlzIHNtZWxscyBsaWtlIGEgZmlzaHkgYmFuZC1haWQuIEFuZCB0
aGUgb3JpZ2luYWwgY29tbWl0Cj4gaW50cm9kdWNpbmcgdGhpcyBhbHNvIGRvZXNuJ3Qgc2NoZWQg
YW55IGxpZ2h0IG9uIHdoeSB0aGlzIHNob3VsZAo+IGhhcHBlbiwgYW5kIHdoeSBpdCdzIHNwZWNp
ZmljIHRvIHRoZSBhbWRncHUgZHJpdmVyLiBEbyB5b3UgaGF2ZSBzb21lCj4gbW9yZSBtZW1vcmll
cyBoZXJlPwoKTm9wZSwgSSBicmllZmx5IHJlbWVtYmVyIHRoYXQgd2UgaGFkIGEgY3VzdG9tZXIg
d2hpY2ggcmFuIGludG8gdGhlIE9PTSAKa2lsbGVyIGFuZCBpbnN0ZWFkIHdhbnRlZCB0byBnZXQg
LUVOT01FTS4KCkJ1dCBJIGhvbmVzdGx5IGRvbid0IHJlbWVtYmVyIHdoeSB3ZSBoYXZlIGl0IGFw
cHJvYWNoZWQgbGlrZSB0aGF0LgoKQ2hyaXN0aWFuLgoKPgo+IEkgZ3Vlc3Mgbm8gcmV0cnkgbWFr
ZXMgc2Vuc2UgZm9yIGEgImRvIHlvdSBzdGlsbCBoYXZlIG1lbW9yeT8iIHF1ZXJ5LAo+IGJ1dCBv
bmNlIHdlJ3ZlIGNvbW1pdCB0byBoYXZpbmcgdGhhdCBtZW1vcnksIEknbSBub3Qgc2VlaW5nIHdo
eSB3ZQo+IHNob3VsZCBub3QgdHJ5IHRvIGZpbmQgaXQ/IE1pZ2h0IGFsc28gdGllIGludG8gdGhl
IGxhY2sgb2YgYWN0aXZlCj4gc2hyaW5raW5nIGZvciB0dG0gb2JqZWN0cyBpbiB0aGUgc3lzdGVt
IGRvbWFpbi4KPiAtRGFuaWVsCj4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jIHwgNiArKystLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90
dC5jICAgICAgICAgICAgfCAzIC0tLQo+PiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmgg
ICAgICAgICAgICB8IDIgLS0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Ywo+PiBpbmRleCBjNWYyYjQ5NzFlZjcuLjBhNDIzMzk4NTg3MCAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+PiBAQCAtMTI5OCw2ICsxMjk4LDkgQEAgc3Rh
dGljIHN0cnVjdCB0dG1fdHQgKmFtZGdwdV90dG1fdHRfY3JlYXRlKHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqYm8sCj4+ICAgICAgICAgIH0KPj4gICAgICAgICAgZ3R0LT5nb2JqID0gJmJvLT5i
YXNlOwo+Pgo+PiArICAgICAgIC8qIFdlIG9wdCB0byBhdm9pZCBPT00gb24gc3lzdGVtIHBhZ2Vz
IGFsbG9jYXRpb25zICovCj4+ICsgICAgICAgcGFnZV9mbGFncyB8PSBUVE1fUEFHRV9GTEFHX05P
X1JFVFJZOwo+PiArCj4+ICAgICAgICAgIGlmIChkbWFfYWRkcmVzc2luZ19saW1pdGVkKGFkZXYt
PmRldikpCj4+ICAgICAgICAgICAgICAgICAgcGFnZV9mbGFncyB8PSBUVE1fUEFHRV9GTEFHX0RN
QTMyOwo+Pgo+PiBAQCAtMTg5NSw5ICsxODk4LDYgQEAgaW50IGFtZGdwdV90dG1faW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4gICAgICAgICAgfQo+PiAgICAgICAgICBhZGV2LT5t
bWFuLmluaXRpYWxpemVkID0gdHJ1ZTsKPj4KPj4gLSAgICAgICAvKiBXZSBvcHQgdG8gYXZvaWQg
T09NIG9uIHN5c3RlbSBwYWdlcyBhbGxvY2F0aW9ucyAqLwo+PiAtICAgICAgIGFkZXYtPm1tYW4u
YmRldi5ub19yZXRyeSA9IHRydWU7Cj4+IC0KPj4gICAgICAgICAgLyogSW5pdGlhbGl6ZSBWUkFN
IHBvb2wgd2l0aCBhbGwgb2YgVlJBTSBkaXZpZGVkIGludG8gcGFnZXMgKi8KPj4gICAgICAgICAg
ciA9IGFtZGdwdV92cmFtX21ncl9pbml0KGFkZXYpOwo+PiAgICAgICAgICBpZiAocikgewo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX3R0LmMKPj4gaW5kZXggZTJiMWU2YzUzYTA0Li45ODUxNGFiYWE5MzkgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fdHQuYwo+PiBAQCAtNTIsOSArNTIsNiBAQCBpbnQgdHRtX3R0X2NyZWF0
ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIHplcm9fYWxsb2MpCj4+ICAgICAg
ICAgIGlmIChiby0+dHRtKQo+PiAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Pgo+PiAtICAg
ICAgIGlmIChiZGV2LT5ub19yZXRyeSkKPj4gLSAgICAgICAgICAgICAgIHBhZ2VfZmxhZ3MgfD0g
VFRNX1BBR0VfRkxBR19OT19SRVRSWTsKPj4gLQo+PiAgICAgICAgICBzd2l0Y2ggKGJvLT50eXBl
KSB7Cj4+ICAgICAgICAgIGNhc2UgdHRtX2JvX3R5cGVfZGV2aWNlOgo+PiAgICAgICAgICAgICAg
ICAgIGlmICh6ZXJvX2FsbG9jKQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9k
ZXZpY2UuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmgKPj4gaW5kZXggYmZjNmRkODdm
MmQzLi5lMGViYTM2YzEzMDkgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fZGV2
aWNlLmgKPj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9kZXZpY2UuaAo+PiBAQCAtMzI2LDgg
KzMyNiw2IEBAIHN0cnVjdCB0dG1fZGV2aWNlIHsKPj4gICAgICAgICAgICovCj4+Cj4+ICAgICAg
ICAgIHN0cnVjdCBkZWxheWVkX3dvcmsgd3E7Cj4+IC0KPj4gLSAgICAgICBib29sIG5vX3JldHJ5
Owo+PiAgIH07Cj4+Cj4+ICAgc3RhdGljIGlubGluZSBzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFn
ZXIgKgo+PiAtLQo+PiAyLjE3LjEKPj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
