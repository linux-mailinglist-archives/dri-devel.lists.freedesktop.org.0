Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8074539ABB
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 06:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F91689226;
	Sat,  8 Jun 2019 04:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC06289226
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 04:03:45 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id t16so2222785pfe.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 21:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2OBpahu1EQjx5jm6yrfBCMrimRWI/S6HKVQllmyKwms=;
 b=o3FI2DdgoG4vzDTNZC1ccnwySMlf//9pyeGeC0PHROz1vks6OWTcUUGSnJklIpNRgz
 hgjzlM4ufmFrufQlk0Ih8LdZPf4rlXdRhB8wuFpqOwBfuUHbVyOyD6iWBSWgkmXNq2MM
 QPGP+wvonjLOQLxG5hGRS7tGdaCsjrbtRlsw+a029mclbWnrinfPgZ9MhfeGkzRRAmTh
 u7zJ+XNTvjBgkixN/PDgsirx/+mWly3y3yqgeF+DvuNqG0ENnu/efmM2s0xH8fQVjhem
 2ZUcrcO01OqOV1g24acIWzENyACjRBSJGnNGm87/r3JEtCKGtzSV7d7Zdrgo71uWaEZv
 K8TQ==
X-Gm-Message-State: APjAAAUeYvHTXpcMNh3K6Q9AB4qOc1PzkktZjDBzHHUUNKHYuA3Smuv6
 REoVK3ycvd5QcfzPzJjHiduXLQ==
X-Google-Smtp-Source: APXvYqyWrZDig2mXPzxoViG3lFlq1Wog/XberFCBwcpmN8vyxrNB4Pcdt7BQoh0EWedzEWISCi/OFA==
X-Received: by 2002:a63:5a4b:: with SMTP id k11mr5562393pgm.143.1559966625274; 
 Fri, 07 Jun 2019 21:03:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m1sm3115007pjv.22.2019.06.07.21.03.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 21:03:44 -0700 (PDT)
Date: Fri, 7 Jun 2019 21:03:43 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 09/16] fs, arm64: untag user pointers in
 fs/userfaultfd.c
Message-ID: <201906072102.B58E6A609C@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <7d6fef00d7daf647b5069101da8cf5a202da75b0.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d6fef00d7daf647b5069101da8cf5a202da75b0.1559580831.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2OBpahu1EQjx5jm6yrfBCMrimRWI/S6HKVQllmyKwms=;
 b=fLmt71olPLiQkxDGGLQPrvCgYkZj1mqoJ4PBg/f8Tk54bfcewYSZXr//1iYtcLODaG
 AZveCJmWVDOJ368vf6zoV+293mE/hykWvD1eLbEkiRUKR99tKynL4WvEtWLecnVqE/K5
 NXI3dW3eaM1dHfIA1jf7g8U4v53Yd/wL4GPXA=
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MTFQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gdXNlcmZhdWx0ZmQgY29kZSB1c2UgcHJvdmlk
ZWQgdXNlciBwb2ludGVycyBmb3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+IG9ubHkgYnkgZG9u
ZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgo+IAo+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdmFs
aWRhdGVfcmFuZ2UoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRy
ZXlrbnZsQGdvb2dsZS5jb20+CgoidXNlcmZhdWx0ZmQ6IHVudGFnIHVzZXIgcG9pbnRlcnMiCgpS
ZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CgotS2VlcwoKPiAt
LS0KPiAgZnMvdXNlcmZhdWx0ZmQuYyB8IDIyICsrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9mcy91c2VyZmF1bHRmZC5jIGIvZnMvdXNlcmZhdWx0ZmQuYwo+IGluZGV4IDNiMzAz
MDFjOTBlYy4uMjRkNjhjM2I1ZWUyIDEwMDY0NAo+IC0tLSBhL2ZzL3VzZXJmYXVsdGZkLmMKPiAr
KysgYi9mcy91c2VyZmF1bHRmZC5jCj4gQEAgLTEyNjMsMjEgKzEyNjMsMjMgQEAgc3RhdGljIF9f
YWx3YXlzX2lubGluZSB2b2lkIHdha2VfdXNlcmZhdWx0KHN0cnVjdCB1c2VyZmF1bHRmZF9jdHgg
KmN0eCwKPiAgfQo+ICAKPiAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQgdmFsaWRhdGVfcmFu
Z2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gLQkJCQkJICBfX3U2NCBzdGFydCwgX191NjQgbGVu
KQo+ICsJCQkJCSAgX191NjQgKnN0YXJ0LCBfX3U2NCBsZW4pCj4gIHsKPiAgCV9fdTY0IHRhc2tf
c2l6ZSA9IG1tLT50YXNrX3NpemU7Cj4gIAo+IC0JaWYgKHN0YXJ0ICYgflBBR0VfTUFTSykKPiAr
CSpzdGFydCA9IHVudGFnZ2VkX2FkZHIoKnN0YXJ0KTsKPiArCj4gKwlpZiAoKnN0YXJ0ICYgflBB
R0VfTUFTSykKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCWlmIChsZW4gJiB+UEFHRV9NQVNLKQo+
ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJaWYgKCFsZW4pCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4g
LQlpZiAoc3RhcnQgPCBtbWFwX21pbl9hZGRyKQo+ICsJaWYgKCpzdGFydCA8IG1tYXBfbWluX2Fk
ZHIpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gLQlpZiAoc3RhcnQgPj0gdGFza19zaXplKQo+ICsJ
aWYgKCpzdGFydCA+PSB0YXNrX3NpemUpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gLQlpZiAobGVu
ID4gdGFza19zaXplIC0gc3RhcnQpCj4gKwlpZiAobGVuID4gdGFza19zaXplIC0gKnN0YXJ0KQo+
ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJcmV0dXJuIDA7Cj4gIH0KPiBAQCAtMTMyNyw3ICsxMzI5
LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF9yZWdpc3RlcihzdHJ1Y3QgdXNlcmZhdWx0ZmRf
Y3R4ICpjdHgsCj4gIAkJZ290byBvdXQ7Cj4gIAl9Cj4gIAo+IC0JcmV0ID0gdmFsaWRhdGVfcmFu
Z2UobW0sIHVmZmRpb19yZWdpc3Rlci5yYW5nZS5zdGFydCwKPiArCXJldCA9IHZhbGlkYXRlX3Jh
bmdlKG1tLCAmdWZmZGlvX3JlZ2lzdGVyLnJhbmdlLnN0YXJ0LAo+ICAJCQkgICAgIHVmZmRpb19y
ZWdpc3Rlci5yYW5nZS5sZW4pOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIG91dDsKPiBAQCAtMTUx
Niw3ICsxNTE4LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF91bnJlZ2lzdGVyKHN0cnVjdCB1
c2VyZmF1bHRmZF9jdHggKmN0eCwKPiAgCWlmIChjb3B5X2Zyb21fdXNlcigmdWZmZGlvX3VucmVn
aXN0ZXIsIGJ1Ziwgc2l6ZW9mKHVmZmRpb191bnJlZ2lzdGVyKSkpCj4gIAkJZ290byBvdXQ7Cj4g
IAo+IC0JcmV0ID0gdmFsaWRhdGVfcmFuZ2UobW0sIHVmZmRpb191bnJlZ2lzdGVyLnN0YXJ0LAo+
ICsJcmV0ID0gdmFsaWRhdGVfcmFuZ2UobW0sICZ1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCwKPiAg
CQkJICAgICB1ZmZkaW9fdW5yZWdpc3Rlci5sZW4pOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIG91
dDsKPiBAQCAtMTY2Nyw3ICsxNjY5LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF93YWtlKHN0
cnVjdCB1c2VyZmF1bHRmZF9jdHggKmN0eCwKPiAgCWlmIChjb3B5X2Zyb21fdXNlcigmdWZmZGlv
X3dha2UsIGJ1Ziwgc2l6ZW9mKHVmZmRpb193YWtlKSkpCj4gIAkJZ290byBvdXQ7Cj4gIAo+IC0J
cmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5tbSwgdWZmZGlvX3dha2Uuc3RhcnQsIHVmZmRpb193
YWtlLmxlbik7Cj4gKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlvX3dha2Uu
c3RhcnQsIHVmZmRpb193YWtlLmxlbik7Cj4gIAlpZiAocmV0KQo+ICAJCWdvdG8gb3V0Owo+ICAK
PiBAQCAtMTcwNyw3ICsxNzA5LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF9jb3B5KHN0cnVj
dCB1c2VyZmF1bHRmZF9jdHggKmN0eCwKPiAgCQkJICAgc2l6ZW9mKHVmZmRpb19jb3B5KS1zaXpl
b2YoX19zNjQpKSkKPiAgCQlnb3RvIG91dDsKPiAgCj4gLQlyZXQgPSB2YWxpZGF0ZV9yYW5nZShj
dHgtPm1tLCB1ZmZkaW9fY29weS5kc3QsIHVmZmRpb19jb3B5Lmxlbik7Cj4gKwlyZXQgPSB2YWxp
ZGF0ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlvX2NvcHkuZHN0LCB1ZmZkaW9fY29weS5sZW4pOwo+
ICAJaWYgKHJldCkKPiAgCQlnb3RvIG91dDsKPiAgCS8qCj4gQEAgLTE3NjMsNyArMTc2NSw3IEBA
IHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfemVyb3BhZ2Uoc3RydWN0IHVzZXJmYXVsdGZkX2N0eCAq
Y3R4LAo+ICAJCQkgICBzaXplb2YodWZmZGlvX3plcm9wYWdlKS1zaXplb2YoX19zNjQpKSkKPiAg
CQlnb3RvIG91dDsKPiAgCj4gLQlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCB1ZmZkaW9f
emVyb3BhZ2UucmFuZ2Uuc3RhcnQsCj4gKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAm
dWZmZGlvX3plcm9wYWdlLnJhbmdlLnN0YXJ0LAo+ICAJCQkgICAgIHVmZmRpb196ZXJvcGFnZS5y
YW5nZS5sZW4pOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIG91dDsKPiAtLSAKPiAyLjIyLjAucmMx
LjMxMS5nNWQ3NTczYTE1MS1nb29nCj4gCgotLSAKS2VlcyBDb29rCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
