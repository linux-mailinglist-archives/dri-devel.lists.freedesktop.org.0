Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE0F4E5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 12:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA6989187;
	Tue, 30 Apr 2019 10:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39845891D6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 10:59:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b10so3286761wmj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 03:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=pj6RTybz4LxskxBegWovoSsZdO1q2RxkiWp0hyauG9c=;
 b=R4sVBGoHPaCuw4vpdx1JoMXRd0dddomO9RoENDIdWVoR4usmGKFKdtSpGq4HIQhUCe
 t+GmBu12J0SYrYw4vl2j0NVY2OE7hl2CtphAz3m1bH9RFvI6pa4QvK9ywWoD653WxVke
 R6tJ6IBfPMpw6j/0rkBm+wngcsTmSSTe0aI1YCx1ARvsScTTcjJS23459XCScDPQV+YD
 bbd/HXt3Y/GX/awTmvM12FpTzNE9CEGEFfmgJmlvtSVaA5Cwr57i4Pqubm4OgyE+VPbT
 1P5QgVKPyagi1nPbT6bo+QjLr6aB6kUh26Q5q/wSTUyEW5ZvgGKM4zHEthicdCr8WXkX
 6rMQ==
X-Gm-Message-State: APjAAAVPfTZl0It95v8FhfRWo2sUDe3/R6ThYlJaM2rDwMxab3QDteHx
 DO1GkOxFzjSIDPdNNqscmZ8=
X-Google-Smtp-Source: APXvYqwZAx2VyP2JEZatZub5PmzhfVpb/QaKs/Difd0IX+gXtaPPsUum6KqPjQGqA2b0l9JrshIu/w==
X-Received: by 2002:a1c:a509:: with SMTP id o9mr2879109wme.6.1556621958919;
 Tue, 30 Apr 2019 03:59:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h16sm17119710wrb.31.2019.04.30.03.59.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 03:59:18 -0700 (PDT)
Subject: Re: [PATCH] amdgpu: Query uvd handles info
To: "Sahu, Satyajit" <Satyajit.Sahu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190430104904.23140-1-satyajit.sahu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ce0c18ac-0ca5-cbc3-1478-491cc93ddda5@gmail.com>
Date: Tue, 30 Apr 2019 12:59:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430104904.23140-1-satyajit.sahu@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=pj6RTybz4LxskxBegWovoSsZdO1q2RxkiWp0hyauG9c=;
 b=EORrMG11SXQKxbi5EomEU1zZ9WP4ph7Fh2Vw36i7ixuKtSMSMWI9JDcIm7oBqRtC3i
 XPjycSw19YFXRlMAK1nzZcKXEnaNykrhG+dS8I70HG04I3T13mCNaoA53AVCxoUIZnPt
 uijvY0Pj74IxE7XuuSxWjMp663WhTl9HH6nw5Ygy2RatAUQeCmG7slEm9KZdRfhhWL+y
 e9M7NPspGqpSJd4aIfOfp/Osu4MRJ7/8es2LAnrpmKyU0QGzpzR7X/7lLyRIcBcTi8px
 9pLLllIcCmsn2g2pPRNPdGzVVHl0xWHLCFfeiLHgu8AGbq1/v9G9/1FPNEZZi0GHZR/q
 pIrA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Sharma, Deepak" <Deepak.Sharma@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMTkgdW0gMTI6NTEgc2NocmllYiBTYWh1LCBTYXR5YWppdDoKPiBRdWVyeSB0aGUg
bWF4IHV2ZCBoYW5kbGVzIGFuZCB1c2VkIHV2ZCBoYW5kbGVzLgoKTkFLLCBwbGVhc2UgdXNlIHRo
ZSBnZW5lcmljIGFtZGdwdV9xdWVyeV9pbmZvKCkgZnVuY3Rpb24gZm9yIHRoaXMuCgpSZWdhcmRz
LApDaHJpc3RpYW4uCgo+Cj4gU2lnbmVkLW9mZi1ieTogU2F0eWFqaXQgU2FodSA8c2F0eWFqaXQu
c2FodUBhbWQuY29tPgo+IC0tLQo+ICAgYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgIHwgMTQgKysr
KysrKysrKysrKysKPiAgIGFtZGdwdS9hbWRncHVfZ3B1X2luZm8uYyB8IDE1ICsrKysrKysrKysr
KysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvYW1kZ3B1L2FtZGdwdS5oIGIvYW1kZ3B1L2FtZGdwdS5oCj4gaW5kZXggYzQ0YTQ5NWEuLjQw
N2I1ZmFlIDEwMDY0NAo+IC0tLSBhL2FtZGdwdS9hbWRncHUuaAo+ICsrKyBiL2FtZGdwdS9hbWRn
cHUuaAo+IEBAIC0xMTc0LDYgKzExNzQsMjAgQEAgaW50IGFtZGdwdV9xdWVyeV9ncHVfaW5mbyhh
bWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCj4gICBpbnQgYW1kZ3B1X3F1ZXJ5X2luZm8oYW1kZ3B1
X2RldmljZV9oYW5kbGUgZGV2LCB1bnNpZ25lZCBpbmZvX2lkLAo+ICAgCQkgICAgICB1bnNpZ25l
ZCBzaXplLCB2b2lkICp2YWx1ZSk7Cj4gICAKPiArLyoqCj4gKyAqIFF1ZXJ5IHV2ZCBoYW5kbGVz
IGluZm8uCj4gKyAqCj4gKyAqCj4gKyAqIFxwYXJhbSAgIGRldiAgICAgLSBcYyBbaW5dIERldmlj
ZSBoYW5kbGUuIFNlZSAjYW1kZ3B1X2RldmljZV9pbml0aWFsaXplKCkKPiArICogXHBhcmFtICAg
c2l6ZSAgICAtIFxjIFtpbl0gU2l6ZSBvZiB0aGUgcmV0dXJuZWQgdmFsdWUuCj4gKyAqIFxwYXJh
bSAgIHZhbHVlICAgLSBcYyBbb3V0XSBQb2ludGVyIHRvIHRoZSByZXR1cm4gdmFsdWUuCj4gKyAq
Cj4gKyAqIFxyZXR1cm4gICAwIG9uIHN1Y2Nlc3Ncbgo+ICsgKiAgICAgICAgICA8MCAtIE5lZ2F0
aXZlIFBPU0lYIGVycm9yIGNvZGUKPiArICoKPiArKi8KPiAraW50IGFtZGdwdV9xdWVyeV91dmRf
aGFuZGxlcyhhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBzaXplLCB2b2lkICp2YWx1ZSk7Cj4gICAvKioKPiAgICAqIFF1ZXJ5IGhhcmR3
YXJlIG9yIGRyaXZlciBpbmZvcm1hdGlvbi4KPiAgICAqCj4gZGlmZiAtLWdpdCBhL2FtZGdwdS9h
bWRncHVfZ3B1X2luZm8uYyBiL2FtZGdwdS9hbWRncHVfZ3B1X2luZm8uYwo+IGluZGV4IDc3NzA4
N2YyLi4yNTNjNGRhNyAxMDA2NDQKPiAtLS0gYS9hbWRncHUvYW1kZ3B1X2dwdV9pbmZvLmMKPiAr
KysgYi9hbWRncHUvYW1kZ3B1X2dwdV9pbmZvLmMKPiBAQCAtNDQsNiArNDQsMjEgQEAgZHJtX3B1
YmxpYyBpbnQgYW1kZ3B1X3F1ZXJ5X2luZm8oYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LCB1bnNp
Z25lZCBpbmZvX2lkLAo+ICAgCQkJICAgICAgIHNpemVvZihzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZv
KSk7Cj4gICB9Cj4gICAKPiArZHJtX3B1YmxpYyBpbnQgYW1kZ3B1X3F1ZXJ5X3V2ZF9oYW5kbGVz
KGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIHNpemUsIHZvaWQgKnZhbHVlKQo+ICt7Cj4gKwlzdHJ1Y3Qg
ZHJtX2FtZGdwdV9pbmZvIHJlcXVlc3Q7Cj4gKwo+ICsJbWVtc2V0KCZyZXF1ZXN0LCAwLCBzaXpl
b2YocmVxdWVzdCkpOwo+ICsJcmVxdWVzdC5yZXR1cm5fcG9pbnRlciA9ICh1aW50cHRyX3QpdmFs
dWU7Cj4gKwlyZXF1ZXN0LnJldHVybl9zaXplID0gc2l6ZTsKPiArCXJlcXVlc3QucXVlcnkgPSBB
TURHUFVfSU5GT19OVU1fSEFORExFUzsKPiArCXJlcXVlc3QucXVlcnlfaHdfaXAudHlwZSA9IEFN
REdQVV9IV19JUF9VVkQ7Cj4gKwo+ICsJcmV0dXJuIGRybUNvbW1hbmRXcml0ZShkZXYtPmZkLCBE
Uk1fQU1ER1BVX0lORk8sICZyZXF1ZXN0LAo+ICsJCQkgICAgICAgc2l6ZW9mKHN0cnVjdCBkcm1f
YW1kZ3B1X2luZm8pKTsKPiArfQo+ICsKPiAgIGRybV9wdWJsaWMgaW50IGFtZGdwdV9xdWVyeV9j
cnRjX2Zyb21faWQoYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LCB1bnNpZ25lZCBpZCwKPiAgIAkJ
CQkJIGludDMyX3QgKnJlc3VsdCkKPiAgIHsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
