Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A3F38553
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E52D89B0C;
	Fri,  7 Jun 2019 07:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D009899B3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 05:33:50 +0000 (UTC)
Received: by mail-it1-x141.google.com with SMTP id l21so959451ita.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 22:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I1Ohgac363EioDxzXpyXf7UN1ZgVyShBjggu94kceQ8=;
 b=JGAo5DzWUcxrfbCIcUln0f5xD4dMja9DM6NJZT/Vb9LcsT4ZErYBm8/Ytv/PMRIZMi
 Q/xGN7J/QHO1sl+gofBzIM8SXwrXJMYlhbhuccFihEQGYfKENXhJNmd2UijcEWykEkbS
 esS/p2aNFO13hyf6b6lib3i3htPBz7jopYXRm/yZYwEXff4bjaxx7o7+iZTnhPJZDE3W
 q0QlCjg7fHMAmxU3M0N5vJyqrzsCe3a1tntlXznr81fWgIshvFcwqO5sIlB7YvzZIx6f
 lDqMFMDdDoqGIPEAgNRFVgLZnFfyLSKDSxgo5DDCeTzMirkz89lT5IUgmng0zprYytq7
 acIg==
X-Gm-Message-State: APjAAAWo4OKu7qC2DhKsdmCReBW9k4xA1cY2DX1Z76WnUbWmihap4cF/
 fvB96Ly3iewccTLCMCaUa/ryNkTqNZuw8rHIGZCYwg==
X-Google-Smtp-Source: APXvYqzO76FNbL4lc2mT5nAI8664+vPAEC2qxggUSScGxp/b2eT89TkEwyH+hzeEqr8qRCV6LZQ9VkHcX6jY2/9nElY=
X-Received: by 2002:a05:660c:752:: with SMTP id
 a18mr2789419itl.63.1559885629583; 
 Thu, 06 Jun 2019 22:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <dc3f3092abbc0d48e51b2e2a2ca8f4c4f69fa0f4.1559580831.git.andreyknvl@google.com>
In-Reply-To: <dc3f3092abbc0d48e51b2e2a2ca8f4c4f69fa0f4.1559580831.git.andreyknvl@google.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 7 Jun 2019 07:33:38 +0200
Message-ID: <CAHUa44E+g3YTcja+7qgx+iABVd48DbrMMOm0sbyMwf0U6F5NPw@mail.gmail.com>
Subject: Re: [PATCH v16 14/16] tee,
 arm64: untag user pointers in tee_shm_register
To: Andrey Konovalov <andreyknvl@google.com>
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=I1Ohgac363EioDxzXpyXf7UN1ZgVyShBjggu94kceQ8=;
 b=k/GR7joJNJJ6Ve9R/aFsDJRsptZAid18wqkAKiXzRB6NlE5r0KsuMRDWBQiDjQE71p
 daD8j4DSrVfI6HVAkD5vCpZj39PQaq9fApbZACjRC0RDDKZIBpn7/PLmAhGU1uSNjV36
 ZPpnk1tioX9M+1EYWJoeTvWylBd+vbf5sKkC6jEafyQKFEFkOanMnEF7whEz4Nqwt4hG
 bE4l9bBTG0ogocOQzuioUmmPSF5w+Ho92/o1cceuVe444tHP69yQxu8DSewMXHLCqg4l
 Ja6TZAP9vQDDI+y+jUJx9i8y337VPVjbLYX5aoIkmB6O4W9ByhkvQ0wvmaFU4t1VIu/d
 h8DQ==
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
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lee Smith <Lee.Smith@arm.com>, Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCA2OjU2IFBNIEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtu
dmxAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmll
cyB0aGF0IGV4dGVuZHMgYXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2Vk
IHVzZXIgcG9pbnRlcnMgKHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBv
dGhlcgo+IHRoYW4gMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4KPiB0ZWVfc2htX3JlZ2lz
dGVyKCktPm9wdGVlX3NobV91bnJlZ2lzdGVyKCktPmNoZWNrX21lbV90eXBlKCkgdXNlcyBwcm92
aWRlZAo+IHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBsb29rdXBzICh2aWEgX19jaGVja19tZW1fdHlw
ZSgpKSwgd2hpY2ggY2FuIG9ubHkgYnkKPiBkb25lIHdpdGggdW50YWdnZWQgcG9pbnRlcnMuCj4K
PiBVbnRhZyB1c2VyIHBvaW50ZXJzIGluIHRoaXMgZnVuY3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+CgpBY2tlZC1ieTogSmVu
cyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+Cgo+IC0tLQo+ICBkcml2ZXJz
L3RlZS90ZWVfc2htLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90ZWUvdGVlX3NobS5jIGIvZHJpdmVycy90ZWUvdGVlX3No
bS5jCj4gaW5kZXggNDlmZDczMTJlMmFhLi45Njk0NWY0Y2VmYjggMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy90ZWUvdGVlX3NobS5jCj4gKysrIGIvZHJpdmVycy90ZWUvdGVlX3NobS5jCj4gQEAgLTI2
Myw2ICsyNjMsNyBAQCBzdHJ1Y3QgdGVlX3NobSAqdGVlX3NobV9yZWdpc3RlcihzdHJ1Y3QgdGVl
X2NvbnRleHQgKmN0eCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICAgICAgICAgc2htLT50ZWVkZXYg
PSB0ZWVkZXY7Cj4gICAgICAgICBzaG0tPmN0eCA9IGN0eDsKPiAgICAgICAgIHNobS0+aWQgPSAt
MTsKPiArICAgICAgIGFkZHIgPSB1bnRhZ2dlZF9hZGRyKGFkZHIpOwo+ICAgICAgICAgc3RhcnQg
PSByb3VuZGRvd24oYWRkciwgUEFHRV9TSVpFKTsKPiAgICAgICAgIHNobS0+b2Zmc2V0ID0gYWRk
ciAtIHN0YXJ0Owo+ICAgICAgICAgc2htLT5zaXplID0gbGVuZ3RoOwo+IC0tCj4gMi4yMi4wLnJj
MS4zMTEuZzVkNzU3M2ExNTEtZ29vZwo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
