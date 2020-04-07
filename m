Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D2B1A0E50
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 15:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EFB6E871;
	Tue,  7 Apr 2020 13:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FD96E871
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 13:26:37 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z5so3049260oth.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=chd5WzCy0W5BZwZMM5n5siOhfZK7euPR7nF8zWDeFKg=;
 b=de06OTPjR8XQn557+eG8TJFSc2cmK5ZXvu3hkZ/51UvlISseAXqJcWlh4n3jupOgug
 JbmcwNB8WQ/LP5DNePw7HGRnEH+y/l7ZxsTFDPJ2q1S8/CyjWMt1+y1prk0vHZIXUl/D
 46tXIf8fo9m1uFv3yA2xtyCikAPviSXgWrz8p9jlOuiBnVMVjagm8rnyLiSwpFXm91UI
 TGDjW1vyHIg0CVVzn94GA8ja75Nenr9GMkuW5A12+WLm7p8Pn0lRNgM5urrXepv96557
 knql0La/884zBwDExkSzw9/P3413EzeL6j/kTr4JM4qZnqaeoTkQPVtvYh/pzX+vDLK3
 Ka7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=chd5WzCy0W5BZwZMM5n5siOhfZK7euPR7nF8zWDeFKg=;
 b=OyKL3nI2n9CSKSHRSljXOQ5NLTAsbLVUc7KCbilDFDQpkeZFWuKMYu7DI1GgV67JZB
 Ec3D3pDSns3v/RuY8qLr5z0464jKqdRumOneRZ3tSgF59BAYmTaz5JCuAhQyNTrDSPN1
 NE6BnQSh/AfZUlMuxyfljwGwkW12ais1uU3B6dBVJikDgd2RRYBFK4j2HAV93eU9XFSx
 IiVdy8zVyE8OsEiEY1IsstHILDQr8AgItqsEUtL+x2x4T9ASxGm89b1ddYDcOsjIzxuI
 E16oJRYTZIM5iARkSposFlMuqh1puCKffepENGVh97DmQLxjPKOXFMQaa95PSJP4f/OL
 MQrw==
X-Gm-Message-State: AGi0PuYxmDcOhEJ9iK4EVKwVeMj4iIx5KVD0hU0SW9OJnuKM3Bgewm+A
 F0KRwVWJnbtoZLzhYIQ0dx2XvXkKamvOiWsWKYxLvA==
X-Google-Smtp-Source: APiQypJZWdNWLCr8c7kvNmiyUNyP8+q2DylC9N8N3tNEL0K144FrAEg+MPdooShGhw/fVijitpe8PMglbX8QxeHfbSU=
X-Received: by 2002:a9d:6c19:: with SMTP id f25mr1553187otq.371.1586265997194; 
 Tue, 07 Apr 2020 06:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200114134101.159194-1-liumartin@google.com>
 <20200224033941.GB211610@google.com>
In-Reply-To: <20200224033941.GB211610@google.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 7 Apr 2020 18:56:25 +0530
Message-ID: <CAO_48GEPKk64uepCqZEc=6XGiv4tZnPHv=RZdwzKPuUqOxjpow@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: support 32bit DMA_BUF_SET_NAME ioctl
To: Martin Liu <liumartin@google.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>, minchan@kernel.org,
 jenhaochen@google.com, wvw@google.com, surenb@google.com,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpEYW5pZWwsIHlvdXIgY29tbWVudHMgaGVyZSwgcGxlYXNlPwoKT24gTW9uLCAyNCBG
ZWIgMjAyMCBhdCAwOTowOSwgTWFydGluIExpdSA8bGl1bWFydGluQGdvb2dsZS5jb20+IHdyb3Rl
Ogo+Cj4gT24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMDk6NDE6MDFQTSArMDgwMCwgTWFydGluIExp
dSB3cm90ZToKPgo+IENDIG1vcmUgTUxzIGZvciB3aW5kZXIgcmV2aWV3Lgo+Cj4gPiBUaGlzIGNv
bW1pdCBhZGRzIFNFVF9OQU1FIGlvY3RsIGNvdmVyc2lvbiB0bwo+ID4gc3VwcG9ydCAzMiBiaXQg
aW9jdGwuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTWFydGluIExpdSA8bGl1bWFydGluQGdvb2ds
ZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgMjIgKysrKysr
KysrKysrKysrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVm
LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gPiBpbmRleCBjZTQxY2Q5Yjc1OGEuLmE3
MzA0OGIzNDg0MyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiA+
ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiA+IEBAIC0yNSw2ICsyNSw3IEBACj4g
PiAgI2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vdW50Lmg+Cj4g
PiAgI2luY2x1ZGUgPGxpbnV4L3BzZXVkb19mcy5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9jb21w
YXQuaD4KPiA+Cj4gPiAgI2luY2x1ZGUgPHVhcGkvbGludXgvZG1hLWJ1Zi5oPgo+ID4gICNpbmNs
dWRlIDx1YXBpL2xpbnV4L21hZ2ljLmg+Cj4gPiBAQCAtNDA5LDEzICs0MTAsMzIgQEAgc3RhdGlj
IHZvaWQgZG1hX2J1Zl9zaG93X2ZkaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHN0cnVjdCBmaWxl
ICpmaWxlKQo+ID4gICAgICAgZG1hX3Jlc3ZfdW5sb2NrKGRtYWJ1Zi0+cmVzdik7Cj4gPiAgfQo+
ID4KPiA+ICsjaWZkZWYgQ09ORklHX0NPTVBBVAo+ID4gK3N0YXRpYyBsb25nIGRtYV9idWZfaW9j
dGxfY29tcGF0KHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBpbnQgY21kLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4gK3sKPiA+ICsg
ICAgIHN3aXRjaCAoX0lPQ19OUihjbWQpKSB7Cj4gPiArICAgICBjYXNlIF9JT0NfTlIoRE1BX0JV
Rl9TRVRfTkFNRSk6Cj4gPiArICAgICAgICAgICAgIC8qIEZpeCB1cCBwb2ludGVyIHNpemUqLwo+
ID4gKyAgICAgICAgICAgICBpZiAoX0lPQ19TSVpFKGNtZCkgPT0gc2l6ZW9mKGNvbXBhdF91cHRy
X3QpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgY21kICY9IH5JT0NTSVpFX01BU0s7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgY21kIHw9IHNpemVvZih2b2lkICopIDw8IElPQ1NJWkVf
U0hJRlQ7Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgYnJlYWs7Cj4gPiAr
ICAgICB9Cj4gPiArICAgICByZXR1cm4gZG1hX2J1Zl9pb2N0bChmaWxlLCBjbWQsICh1bnNpZ25l
ZCBsb25nKWNvbXBhdF9wdHIoYXJnKSk7Cj4gPiArfQo+ID4gKyNlbmRpZgo+ID4gKwo+ID4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGRtYV9idWZfZm9wcyA9IHsKPiA+ICAg
ICAgIC5yZWxlYXNlICAgICAgICA9IGRtYV9idWZfcmVsZWFzZSwKPiA+ICAgICAgIC5tbWFwICAg
ICAgICAgICA9IGRtYV9idWZfbW1hcF9pbnRlcm5hbCwKPiA+ICAgICAgIC5sbHNlZWsgICAgICAg
ICA9IGRtYV9idWZfbGxzZWVrLAo+ID4gICAgICAgLnBvbGwgICAgICAgICAgID0gZG1hX2J1Zl9w
b2xsLAo+ID4gICAgICAgLnVubG9ja2VkX2lvY3RsID0gZG1hX2J1Zl9pb2N0bCwKPiA+IC0gICAg
IC5jb21wYXRfaW9jdGwgICA9IGNvbXBhdF9wdHJfaW9jdGwsCj4gPiArI2lmZGVmIENPTkZJR19D
T01QQVQKPiA+ICsgICAgIC5jb21wYXRfaW9jdGwgICA9IGRtYV9idWZfaW9jdGxfY29tcGF0LAo+
ID4gKyNlbmRpZgo+ID4gICAgICAgLnNob3dfZmRpbmZvICAgID0gZG1hX2J1Zl9zaG93X2ZkaW5m
bywKPiA+ICB9Owo+ID4KPiA+IC0tCj4gPiAyLjI1LjAucmMxLjI4My5nODhkZmRjNDE5My1nb29n
Cj4gPgoKCgotLSAKVGhhbmtzIGFuZCByZWdhcmRzLAoKU3VtaXQgU2Vtd2FsCkxpbmFybyBDb25z
dW1lciBHcm91cCAtIEtlcm5lbCBUZWFtIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFSTSBTb0NzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
