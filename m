Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B34AC39AAD
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 06:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6A98921C;
	Sat,  8 Jun 2019 04:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F177F8921C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 04:02:26 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id a93so1542268pla.7
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 21:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ld9qqur+4qvQ29YBRyUFm2eutAmUIhRNEhUVQshxtq0=;
 b=ciyJr8xXKTv1pxOPllGKzHDJB1H+wj61NRSJ42/YTh0edtuHfynvstB4kc8aYLSb5x
 LF1HN2BmnLmrPklZYM1uHFZ45u63qtJihW+S+FpKozfqkffflQXDtasK6Yhq/DEgPSGY
 8+omqkKwaVAkrwD273dguI8RDwnl64PuMU+Ut7bqHrspqzjh5yoa6DPOtxLSz35fBT8h
 L7Iu5i5mi4Kz1+6pDhGxDTFvtKjsLcJJhRyjA37IRDwqGeHvKXG0D1lLf70wVIoFAy+E
 glQBprAymn59p+Atp+pNveyF/3vv+qN4wrWNBgiNZ9tHXijUml8mt0xz8A2isOiILWaJ
 Syqg==
X-Gm-Message-State: APjAAAXcgAp/VkrcwqatKJygYxE2IFs85dcxlGqMeMc84eQBSTVaMqoo
 m6Wx5QcAmyVxTGmtk4Gcz1Ndag==
X-Google-Smtp-Source: APXvYqyWIU7z0h83s595E4gtAHnTw/dwV2AWdUHb9XfpIujI04l63mQHZIFAtQw1iHXTD7aat4vguA==
X-Received: by 2002:a17:902:8ec3:: with SMTP id
 x3mr57418900plo.340.1559966546670; 
 Fri, 07 Jun 2019 21:02:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b16sm3567551pfd.12.2019.06.07.21.02.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 21:02:25 -0700 (PDT)
Date: Fri, 7 Jun 2019 21:02:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 08/16] fs, arm64: untag user pointers in
 copy_mount_options
Message-ID: <201906072101.58C919E@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <51f44a12c4e81c9edea8dcd268f820f5d1fad87c.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51f44a12c4e81c9edea8dcd268f820f5d1fad87c.1559580831.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ld9qqur+4qvQ29YBRyUFm2eutAmUIhRNEhUVQshxtq0=;
 b=HXvVg9coUo1xEEGS0DwgDUYkxEz6DS1r+bnepiqG47VSO6k+SKaBqi5wnLJUzhKT0Q
 F77v/3inF5WO9KdoxanRYXG9UTvU9WuNvhZbHSnOvkwygp4/KRjUvBwoWTTXrnkExWcy
 ADu9rIK/0BZ8VaknNJsilZ7GGCNNLhX/1899U=
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MTBQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gSW4gY29weV9tb3VudF9vcHRpb25zIGEgdXNl
ciBhZGRyZXNzIGlzIGJlaW5nIHN1YnRyYWN0ZWQgZnJvbSBUQVNLX1NJWkUuCj4gSWYgdGhlIGFk
ZHJlc3MgaXMgbG93ZXIgdGhhbiBUQVNLX1NJWkUsIHRoZSBzaXplIGlzIGNhbGN1bGF0ZWQgdG8g
bm90Cj4gYWxsb3cgdGhlIGV4YWN0X2NvcHlfZnJvbV91c2VyKCkgY2FsbCB0byBjcm9zcyBUQVNL
X1NJWkUgYm91bmRhcnkuCj4gSG93ZXZlciBpZiB0aGUgYWRkcmVzcyBpcyB0YWdnZWQsIHRoZW4g
dGhlIHNpemUgd2lsbCBiZSBjYWxjdWxhdGVkCj4gaW5jb3JyZWN0bHkuCj4gCj4gVW50YWcgdGhl
IGFkZHJlc3MgYmVmb3JlIHN1YnRyYWN0aW5nLgo+IAo+IFJldmlld2VkLWJ5OiBDYXRhbGluIE1h
cmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBL
b25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KCk9uZSB0aGluZyBJIGp1c3Qgbm90aWNl
ZCBpbiB0aGUgY29tbWl0IHRpdGxlcy4uLiAiYXJtNjQiIGlzIGluIHRoZQpwcmVmaXgsIGJ1dCB0
aGVzZSBhcmUgYXJjaC1pbmRlcCBhcmVhcy4gU2hvdWxkIHRoZSAiLCBhcm02NCIgYmUgbGVmdApv
dXQ/CgpJIHdvdWxkIGV4cGVjdCwgaW5zdGVhZDoKCglmcy9uYW1lc3BhY2U6IHVudGFnIHVzZXIg
cG9pbnRlcnMgaW4gY29weV9tb3VudF9vcHRpb25zCgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxr
ZWVzY29va0BjaHJvbWl1bS5vcmc+CgotS2VlcwoKPiAtLS0KPiAgZnMvbmFtZXNwYWNlLmMgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9mcy9uYW1lc3BhY2UuYyBiL2ZzL25hbWVzcGFjZS5jCj4gaW5kZXggYjI2
Nzc4YmRjMjM2Li4yZTg1NzEyYTE5ZWQgMTAwNjQ0Cj4gLS0tIGEvZnMvbmFtZXNwYWNlLmMKPiAr
KysgYi9mcy9uYW1lc3BhY2UuYwo+IEBAIC0yOTkzLDcgKzI5OTMsNyBAQCB2b2lkICpjb3B5X21v
dW50X29wdGlvbnMoY29uc3Qgdm9pZCBfX3VzZXIgKiBkYXRhKQo+ICAJICogdGhlIHJlbWFpbmRl
ciBvZiB0aGUgcGFnZS4KPiAgCSAqLwo+ICAJLyogY29weV9mcm9tX3VzZXIgY2Fubm90IGNyb3Nz
IFRBU0tfU0laRSAhICovCj4gLQlzaXplID0gVEFTS19TSVpFIC0gKHVuc2lnbmVkIGxvbmcpZGF0
YTsKPiArCXNpemUgPSBUQVNLX1NJWkUgLSAodW5zaWduZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKGRh
dGEpOwo+ICAJaWYgKHNpemUgPiBQQUdFX1NJWkUpCj4gIAkJc2l6ZSA9IFBBR0VfU0laRTsKPiAg
Cj4gLS0gCj4gMi4yMi4wLnJjMS4zMTEuZzVkNzU3M2ExNTEtZ29vZwo+IAoKLS0gCktlZXMgQ29v
awpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
