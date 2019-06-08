Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1651A39A80
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 05:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4514891FB;
	Sat,  8 Jun 2019 03:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5181789202
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 03:52:47 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id k187so1647444pga.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 20:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FvOvhN7lAMb05Jgucbn4i/kkfk6C+xm00bozwGUiDHE=;
 b=XK5z+PJrLqUIhil5HKLw702zpO9Kj8bhY0U/74Knam/L1rwtLTzMrxkFesijtvEgnq
 v8qiovDgCXU3H6CDtlT3L9jonEwux9PMGYNKVlqgYMyfnoCuhqd2P+2JnA8myvfZpZl3
 CdT2B0LbV3WtZU40ZswYjYmX39CgByy8klrWh0/DX4z3CNg/v7Zfa+cL1561/diL0vOE
 eP/I89Iwp9fPrFpB12ucQ7eUici19LP8ugsAN2TO3SgkJ2rVTQrkzjv5//eUNNDPDhV9
 QpKRX/Gq1whPp2JLr+wqBx9mhj4RQJMllrIw1SMBKyjT8CpZdrbn+VrA4gu1/eCNGw0b
 je6w==
X-Gm-Message-State: APjAAAXLliPhE7NsLWGr3qNBsuwmmrtMcv1HfoNHzzOtyp0YWqNJQExJ
 5QSXx+SQtgFl204LjQ3bbobOag==
X-Google-Smtp-Source: APXvYqwjIf2RUpKbV2HVLPuystSV0iOPs0w3Y10dXMrzubhjEtN6FPReOOA3bdEKg814UJFukvJHYg==
X-Received: by 2002:a17:90a:37c8:: with SMTP id
 v66mr9429258pjb.33.1559965966947; 
 Fri, 07 Jun 2019 20:52:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l1sm3510268pgj.67.2019.06.07.20.52.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 20:52:46 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:52:45 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 13/16] media/v4l2-core, arm64: untag user pointers in
 videobuf_dma_contig_user_get
Message-ID: <201906072052.077135B@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <31821f3538ddacb7e57e0248e86a3d28f9789d2f.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31821f3538ddacb7e57e0248e86a3d28f9789d2f.1559580831.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FvOvhN7lAMb05Jgucbn4i/kkfk6C+xm00bozwGUiDHE=;
 b=jSdD6RhFfZkeqgS8TcayMIER7Pkkx++KxJ0VlFLn9BvHk82PjgIJ2PrdItWwSzYW05
 NLhWR71M5RDwErf/bBmmALg5hWrf7JykHz8MqC0HoRPvtnrf7wJZvYnVmInDaDa0hprb
 7Wa5xVFo7VF+cw+RSx/ka7MEiF5SaHkm3s0FY=
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
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MTVQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gdmlkZW9idWZfZG1hX2NvbnRpZ191c2VyX2dl
dCgpIHVzZXMgcHJvdmlkZWQgdXNlciBwb2ludGVycyBmb3Igdm1hCj4gbG9va3Vwcywgd2hpY2gg
Y2FuIG9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgo+IAo+IFVudGFnIHRoZSBw
b2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgo+IAo+IEFja2VkLWJ5OiBNYXVybyBDYXJ2YWxobyBD
aGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
eSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KClJldmlld2VkLWJ5OiBLZWVzIENv
b2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KCi1LZWVzCgo+IC0tLQo+ICBkcml2ZXJzL21lZGlh
L3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMgfCA5ICsrKysrLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMgYi9kcml2ZXJz
L21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKPiBpbmRleCBlMWJmNTBkZjRj
NzAuLjhhMWRkZDE0NmIxNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92
aWRlb2J1Zi1kbWEtY29udGlnLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRl
b2J1Zi1kbWEtY29udGlnLmMKPiBAQCAtMTYwLDYgKzE2MCw3IEBAIHN0YXRpYyB2b2lkIHZpZGVv
YnVmX2RtYV9jb250aWdfdXNlcl9wdXQoc3RydWN0IHZpZGVvYnVmX2RtYV9jb250aWdfbWVtb3J5
ICptZW0pCj4gIHN0YXRpYyBpbnQgdmlkZW9idWZfZG1hX2NvbnRpZ191c2VyX2dldChzdHJ1Y3Qg
dmlkZW9idWZfZG1hX2NvbnRpZ19tZW1vcnkgKm1lbSwKPiAgCQkJCQlzdHJ1Y3QgdmlkZW9idWZf
YnVmZmVyICp2YikKPiAgewo+ICsJdW5zaWduZWQgbG9uZyB1bnRhZ2dlZF9iYWRkciA9IHVudGFn
Z2VkX2FkZHIodmItPmJhZGRyKTsKPiAgCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+
bW07Cj4gIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKPiAgCXVuc2lnbmVkIGxvbmcgcHJl
dl9wZm4sIHRoaXNfcGZuOwo+IEBAIC0xNjcsMjIgKzE2OCwyMiBAQCBzdGF0aWMgaW50IHZpZGVv
YnVmX2RtYV9jb250aWdfdXNlcl9nZXQoc3RydWN0IHZpZGVvYnVmX2RtYV9jb250aWdfbWVtb3J5
ICptZW0sCj4gIAl1bnNpZ25lZCBpbnQgb2Zmc2V0Owo+ICAJaW50IHJldDsKPiAgCj4gLQlvZmZz
ZXQgPSB2Yi0+YmFkZHIgJiB+UEFHRV9NQVNLOwo+ICsJb2Zmc2V0ID0gdW50YWdnZWRfYmFkZHIg
JiB+UEFHRV9NQVNLOwo+ICAJbWVtLT5zaXplID0gUEFHRV9BTElHTih2Yi0+c2l6ZSArIG9mZnNl
dCk7Cj4gIAlyZXQgPSAtRUlOVkFMOwo+ICAKPiAgCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsK
PiAgCj4gLQl2bWEgPSBmaW5kX3ZtYShtbSwgdmItPmJhZGRyKTsKPiArCXZtYSA9IGZpbmRfdm1h
KG1tLCB1bnRhZ2dlZF9iYWRkcik7Cj4gIAlpZiAoIXZtYSkKPiAgCQlnb3RvIG91dF91cDsKPiAg
Cj4gLQlpZiAoKHZiLT5iYWRkciArIG1lbS0+c2l6ZSkgPiB2bWEtPnZtX2VuZCkKPiArCWlmICgo
dW50YWdnZWRfYmFkZHIgKyBtZW0tPnNpemUpID4gdm1hLT52bV9lbmQpCj4gIAkJZ290byBvdXRf
dXA7Cj4gIAo+ICAJcGFnZXNfZG9uZSA9IDA7Cj4gIAlwcmV2X3BmbiA9IDA7IC8qIGtpbGwgd2Fy
bmluZyAqLwo+IC0JdXNlcl9hZGRyZXNzID0gdmItPmJhZGRyOwo+ICsJdXNlcl9hZGRyZXNzID0g
dW50YWdnZWRfYmFkZHI7Cj4gIAo+ICAJd2hpbGUgKHBhZ2VzX2RvbmUgPCAobWVtLT5zaXplID4+
IFBBR0VfU0hJRlQpKSB7Cj4gIAkJcmV0ID0gZm9sbG93X3Bmbih2bWEsIHVzZXJfYWRkcmVzcywg
JnRoaXNfcGZuKTsKPiAtLSAKPiAyLjIyLjAucmMxLjMxMS5nNWQ3NTczYTE1MS1nb29nCj4gCgot
LSAKS2VlcyBDb29rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
