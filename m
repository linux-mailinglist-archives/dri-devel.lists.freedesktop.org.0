Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D8F33C6D1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 20:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A1A899C4;
	Mon, 15 Mar 2021 19:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6DA899C4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 19:27:40 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bm21so68226075ejb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 12:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QlNz+C2POrE1xsn1HIxiKoqNUj6xsTJw2CQZpMMOtFI=;
 b=N5eH32r+TR4vl3imENIjOz6IhwIBzDT8s7fDJBtf4ogXoPUdbNZ+ZzKeirF08hYH4F
 NgJLVU5eA9z3nWsaOwyncJ465s67ipDB4E/p195IL27KWrpg00KWlxFZPf6LUW4dsmsR
 30+Y7nQcuUIgLPKE6hcCT2Ak0ryq/7qmrQx6Cd75IS8Tc3jOkZw9tBhotDjIutWsFmby
 faZ9eVJWpMgvGyb7wWDQoMBRVXCyB2u8xbxj+CgQXasYVNcpl9Tp3mDcXBmi83/iuDRG
 iBtuzbaTwaZQzt5IODcEQihiXl9082XwEK3liGxmqTNb9xIcgtxJopemD64+K8x/mnJT
 PKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QlNz+C2POrE1xsn1HIxiKoqNUj6xsTJw2CQZpMMOtFI=;
 b=X7vHMNQccZFQp7ON4Pnyw2bU2mpbs/p4ZUCdJ8sE4hatAxDVIIIbfcU/QF3uWUlCnx
 wG0nfEKqAL5PQ5dpE2sLXGOeUPs2oot2vVy7OZV7A00oI86d1Hr4WfnEUFpa3V+gFooN
 Vi5iEmlOAjEim/W9pUkhvQSbmGW7r/aU+pHJCmEldI4n7hWfGoSz3PcE0RXCBWt93Yj8
 AEQ3fKb05Fe3NrpnCY+EHixG0N1mM4H7cxkZ09tgI4KYXXuqAR85+p9EBK9TisVhTYEB
 I8lldug8mO2pcIDqKSjgUODM3PcH5tSslb1uJekylwgBgAUNYR5Rlx87UV6AEZhqZ15U
 UhZA==
X-Gm-Message-State: AOAM530IduuBQOh4EicJM1f4R7VbNxQygv9PgxOSLbXQBzw/maobk3XK
 /H6FS+RztJSsG117p81udeS8ZXHcrbQ=
X-Google-Smtp-Source: ABdhPJxb/iUf+YO8FoPKwSNaLva6boJbLQBr9ZSzEC9gk0MBETzJyDlK/VFH2AaKLdY9BT4QmDKMog==
X-Received: by 2002:a17:906:70d:: with SMTP id
 y13mr14653902ejb.170.1615836459578; 
 Mon, 15 Mar 2021 12:27:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:dd5e:327:8807:376f?
 ([2a02:908:1252:fb60:dd5e:327:8807:376f])
 by smtp.gmail.com with ESMTPSA id cb17sm8712821edb.10.2021.03.15.12.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 12:27:39 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/ttm: remove swap LRU v2
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210315160422.152528-1-christian.koenig@amd.com>
 <20210315160422.152528-2-christian.koenig@amd.com>
 <CAM0jSHO6L+t8fK_2Ww94vhc0+AZ9KA-9j7razmo92UZKoa1_Lg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b9ad5546-da53-7a32-8f4d-030e8e4b8c25@gmail.com>
Date: Mon, 15 Mar 2021 20:27:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHO6L+t8fK_2Ww94vhc0+AZ9KA-9j7razmo92UZKoa1_Lg@mail.gmail.com>
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
Cc: ray.huang@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDMuMjEgdW0gMTk6NTQgc2NocmllYiBNYXR0aGV3IEF1bGQ6Cj4gT24gTW9uLCAxNSBN
YXIgMjAyMSBhdCAxNjowNCwgQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1bWVy
a2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IFtTTklQXQo+PiBAQCAtMTE5Myw2ICsxMTY0LDEwIEBA
IGludCB0dG1fYm9fc3dhcG91dChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBzdHJ1Y3Qg
dHRtX29wZXJhdGlvbl9jdHggKmN0eCwKPj4gICAgICAgICAgYm9vbCBsb2NrZWQ7Cj4+ICAgICAg
ICAgIGludCByZXQ7Cj4+Cj4+ICsgICAgICAgaWYgKCFiby0+dHRtIHx8IGJvLT50dG0tPnBhZ2Vf
ZmxhZ3MgJiAoVFRNX1BBR0VfRkxBR19TRyB8Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgVFRNX1BBR0VfRkxBR19TV0FQUEVEKSkKPj4gKyAgICAgICAg
ICAgICAgIHJldHVybiBmYWxzZTsKPj4gKwo+IHJldHVybiAwOyA/Cj4KPiBTZWVtcyBpbmNvbnNp
c3RlbnQgdG8gcmV0dXJuIHplcm8gaGVyZSBhbmQgbm90IGRyb3AgdGhlIGxydSBsb2NrPyBPcgo+
IG1heWJlIHR1cm4gdGhpcyBpbnRvIGEgcHJvZ3JhbW1lciBlcnJvciwgc2luY2UgdGhlIGN1cnJl
bnQgY2FsbGVyCj4gYWxyZWFkeSBjaGVja3MgZm9yIHRoZSBhYm92ZT8KClRoYW5rcywgdGhhdCBp
cyBqdXN0IGFuIGFydGlmYWN0IGZyb20gcmViYXNpbmcgYW5kIHNob3VsZCBiZSByZW1vdmVkLgoK
Pj4gW1NOSVBdCj4+Cj4+IEBAIC0xMDksMjcgKzEwNiw2MCBAQCBzdGF0aWMgaW50IHR0bV9nbG9i
YWxfaW5pdCh2b2lkKQo+PiAgIGxvbmcgdHRtX2dsb2JhbF9zd2Fwb3V0KHN0cnVjdCB0dG1fb3Bl
cmF0aW9uX2N0eCAqY3R4LCBnZnBfdCBnZnBfZmxhZ3MpCj4+ICAgewo+PiAgICAgICAgICBzdHJ1
Y3QgdHRtX2dsb2JhbCAqZ2xvYiA9ICZ0dG1fZ2xvYjsKPj4gKyAgICAgICBzdHJ1Y3QgdHRtX2Rl
dmljZSAqYmRldjsKPj4gKyAgICAgICBpbnQgcmV0ID0gLUVCVVNZOwo+PiArCj4+ICsgICAgICAg
bXV0ZXhfbG9jaygmdHRtX2dsb2JhbF9tdXRleCk7Cj4+ICsgICAgICAgbGlzdF9mb3JfZWFjaF9l
bnRyeShiZGV2LCAmZ2xvYi0+ZGV2aWNlX2xpc3QsIGRldmljZV9saXN0KSB7Cj4+ICsgICAgICAg
ICAgICAgICByZXQgPSB0dG1fZGV2aWNlX3N3YXBvdXQoYmRldiwgY3R4LCBnZnBfZmxhZ3MpOwo+
IE1peGluZyBpbnQgYW5kIGxvbmcgZm9yIG51bV9wYWdlcy4KPgo+IERvZXMgdHRtIGVuZm9yY2Ug
YSBtYXhpbXVtIHBhZ2UgY291bnQgc29tZXdoZXJlIGZvciBvYmplY3Qgc2l6ZXM/CgpXZSBzaG91
bGQgdXNlIDMyIGJpdCB2YWx1ZXMgZm9yIHRoZSBudW1iZXIgb2YgcGFnZXMgaW4gVFRNLCBldmVu
IHNpZ25lZCAKdmFsdWVzIGFsbG93IGZvciA4VEIgbGFyZ2UgQk9zLgoKQW5kIEkgcmVhbGx5IGhv
cGUgdGhhdCB3ZSBjYW4gZ2V0IHJpZCBvZiB0aGUgQk8gYXBwcm9hY2ggaW4gZ2VuZXJhbCAKYmVm
b3JlIHdlIGV2ZXIgY29tZSBjbG9zZSB0byB0aGF0IGxpbWl0LgoKPiBTb21ldGhpbmcgbGlrZSBJ
TlRfTUFYLCBzaW5jZSBpdCBkb2Vzbid0IGxvb2sgbGlrZSB0dG0gaXMgY29uc2lzdGVudGx5Cj4g
dXNpbmcgdGhlIHNhbWUgdHlwZSh1bnNpZ25lZCBsb25nPykgd2hlbiByZXByZXNlbnRpbmcgdGhl
IG51bWJlciBvZgo+IHBhZ2VzIGZvciBhbiBvYmplY3Q/CgpJIHNob3VsZCBwcm9iYWJseSBhZGQg
YSBjaGVjayBmb3IgdGhhdCBpbiB0aGUgdHQgY29kZSwgeWVzLgoKPiBbU05JUF0KPiAgIHN0YXRp
YyB2b2lkIHR0bV9pbml0X3N5c21hbihzdHJ1Y3QgdHRtX2RldmljZSAqYmRldikKPiAgIHsKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwo+IGluZGV4IGI5OTE0MjJlMTU2Yy4uMGU4MmIw
NjYyZDllIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKPiBAQCAtMTM3MSw3
ICsxMzcxLDcgQEAgc3RhdGljIGludCB2bXdfcG1fZnJlZXplKHN0cnVjdCBkZXZpY2UgKmtkZXYp
Cj4gICAgICAgICAgdm13X2V4ZWNidWZfcmVsZWFzZV9waW5uZWRfYm8oZGV2X3ByaXYpOwo+ICAg
ICAgICAgIHZtd19yZXNvdXJjZV9ldmljdF9hbGwoZGV2X3ByaXYpOwo+ICAgICAgICAgIHZtd19y
ZWxlYXNlX2RldmljZV9lYXJseShkZXZfcHJpdik7Cj4gLSAgICAgICB3aGlsZSAodHRtX2dsb2Jh
bF9zd2Fwb3V0KCZjdHgsIEdGUF9LRVJORUwpID4gMCk7Cj4gKyAgICAgICB3aGlsZSAodHRtX2Rl
dmljZV9zd2Fwb3V0KCZkZXZfcHJpdi0+YmRldiwgJmN0eCwgR0ZQX0tFUk5FTCkgPT0gMCk7Cj4g
SXMgdGhpcyB0aGUgaW50ZW5kZWQgYmVoYXZpb3VyPyB0dG1fZGV2aWNlX3N3YXBvdXQoKSBzdGls
bCBqdXN0Cj4gcmV0dXJucyBudW1fcGFnZXMgaWYgaXQgc3dhcHBlZCBzb21ldGhpbmcgb3V0LiBJ
IGFzc3VtZSB0aGlzIHdhbnRzIHRvCj4ga2VlcCBzd2FwcGluZyBzdHVmZiBvdXQsIHVudGlsIGl0
IGNhbid0IGFueW1vcmUuIE9yIGFtIEkgbWlzc2luZwo+IHNvbWV0aGluZz8KCkluZGVlZCB0aGF0
J3MgYSBtaXggdXAuIFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQuCgpDaHJpc3RpYW4uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
