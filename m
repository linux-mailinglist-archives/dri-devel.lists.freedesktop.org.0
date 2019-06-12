Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4F24337E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D3589395;
	Thu, 13 Jun 2019 07:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6A18930B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:36:48 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id d30so8786208pgm.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 04:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MhkB743oojqt0jCijE6DsOt5IqaBpxqgWof9mFxCLr0=;
 b=S4uoWCpY178AImdPSUXxm55nbq9P94e0lEJ/MWsg6JsbFdLAzgLkNnS/WGPDbkmaIu
 2lv/AN06AwK1I1LcSTYVrAdpg/U5x/wr3bZ8U3HRpYbW0/+QAzbqhzBoIYH6i2YSk1E+
 KBz5UmKfojW6kLa7tToi2cjm5AS+VQXVJaznCT9E3NrpoyXhXIL0b6EyeHakjYbb9ncF
 4mzdK+NUVXsDewWd4NC55BAeWRORQzxd6zYCB1+urvp0ACfC8KaOGF4TZCGG80VGwlOk
 z5sWCuafAescZUt7wZu6WYXnF85A4KRwhr8Qep5kNh2zAB5FL7nDEkoWFvneKwPF7J4k
 PsOQ==
X-Gm-Message-State: APjAAAXvQ5pB0PVBbLlKTrUSkfxG9vGJcUqCk49Sd09DUjoykno/cdhn
 RgpQFsgBqgsb3BlEAHPe3jOIwVhOBzhX5kY+eL8rYw==
X-Google-Smtp-Source: APXvYqzGzjPmF8qGtciCMiJ8cvvmFlnWp+2d9nBudQ86r37IgxuDA/rPCLSSJ3M+cA0egqf1SPnYkN9tXts/BubXkpo=
X-Received: by 2002:aa7:97bb:: with SMTP id d27mr18575219pfq.93.1560339407628; 
 Wed, 12 Jun 2019 04:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <51f44a12c4e81c9edea8dcd268f820f5d1fad87c.1559580831.git.andreyknvl@google.com>
 <201906072101.58C919E@keescook>
 <CAAeHK+y8CH4P3vheUDCEnPAuO-2L6mc-sz6wMA_hT=wC1Cy3KQ@mail.gmail.com>
In-Reply-To: <CAAeHK+y8CH4P3vheUDCEnPAuO-2L6mc-sz6wMA_hT=wC1Cy3KQ@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 12 Jun 2019 13:36:36 +0200
Message-ID: <CAAeHK+xCmc-x=Mvs8RC+xJOCw6AnEUgUzXXjjS3NJXeLwJkyqg@mail.gmail.com>
Subject: Re: [PATCH v16 08/16] fs,
 arm64: untag user pointers in copy_mount_options
To: Kees Cook <keescook@chromium.org>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MhkB743oojqt0jCijE6DsOt5IqaBpxqgWof9mFxCLr0=;
 b=GDzbgDhOafy14R/X43UkUN/+wf8bZdqGlFyPynLyOoG20vlQgN7zE9jZaanLyn3zx5
 qQhhso2gb34OxP/u3xHSg6zS8JjJRY1rM9k4rX+82IiHVqiDxz7X2a893Yf4graw7TMN
 nSUF/2Gtu0ZiA9FjJgluVZwCMm/sY7nIvA/8cwZyNRO0pWttZ9rn4SJm4NDG5Og1LJ7q
 69ebVQ9hxBQQPUib1nigJuccodsU3NmYrSrnehuErfe4YWQQvRoySvoE3IbFgIm+u5mm
 oszynkP2bKoPt4/Zv/VgvQYlSIXKjNdvA3RFAgK5OHTEZyvWErx96s2gVUjdKfd7KRLc
 uonQ==
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
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNDozOCBQTSBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlr
bnZsQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBKdW4gOCwgMjAxOSBhdCA2OjAyIEFN
IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24s
IEp1biAwMywgMjAxOSBhdCAwNjo1NToxMFBNICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3Rl
Ogo+ID4gPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMgYXJt
NjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+ID4gPiBwYXNzIHRhZ2dlZCB1c2VyIHBvaW50ZXJz
ICh3aXRoIHRoZSB0b3AgYnl0ZSBzZXQgdG8gc29tZXRoaW5nIGVsc2Ugb3RoZXIKPiA+ID4gdGhh
biAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50cy4KPiA+ID4KPiA+ID4gSW4gY29weV9tb3VudF9v
cHRpb25zIGEgdXNlciBhZGRyZXNzIGlzIGJlaW5nIHN1YnRyYWN0ZWQgZnJvbSBUQVNLX1NJWkUu
Cj4gPiA+IElmIHRoZSBhZGRyZXNzIGlzIGxvd2VyIHRoYW4gVEFTS19TSVpFLCB0aGUgc2l6ZSBp
cyBjYWxjdWxhdGVkIHRvIG5vdAo+ID4gPiBhbGxvdyB0aGUgZXhhY3RfY29weV9mcm9tX3VzZXIo
KSBjYWxsIHRvIGNyb3NzIFRBU0tfU0laRSBib3VuZGFyeS4KPiA+ID4gSG93ZXZlciBpZiB0aGUg
YWRkcmVzcyBpcyB0YWdnZWQsIHRoZW4gdGhlIHNpemUgd2lsbCBiZSBjYWxjdWxhdGVkCj4gPiA+
IGluY29ycmVjdGx5Lgo+ID4gPgo+ID4gPiBVbnRhZyB0aGUgYWRkcmVzcyBiZWZvcmUgc3VidHJh
Y3RpbmcuCj4gPiA+Cj4gPiA+IFJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxh
bmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gPgo+ID4gT25lIHRoaW5nIEkganVzdCBub3RpY2VkIGlu
IHRoZSBjb21taXQgdGl0bGVzLi4uICJhcm02NCIgaXMgaW4gdGhlCj4gPiBwcmVmaXgsIGJ1dCB0
aGVzZSBhcmUgYXJjaC1pbmRlcCBhcmVhcy4gU2hvdWxkIHRoZSAiLCBhcm02NCIgYmUgbGVmdAo+
ID4gb3V0Pwo+ID4KPiA+IEkgd291bGQgZXhwZWN0LCBpbnN0ZWFkOgo+ID4KPiA+ICAgICAgICAg
ZnMvbmFtZXNwYWNlOiB1bnRhZyB1c2VyIHBvaW50ZXJzIGluIGNvcHlfbW91bnRfb3B0aW9ucwo+
Cj4gSG0sIEkndmUgYWRkZWQgdGhlIGFybTY0IHRhZyBpbiBhbGwgb2YgdGhlIHBhdGNoZXMgYmVj
YXVzZSB0aGV5IGFyZQo+IHJlbGF0ZWQgdG8gY2hhbmdlcyBpbiBhcm02NCBrZXJuZWwgQUJJLiBJ
IGNhbiByZW1vdmUgaXQgZnJvbSBhbGwgdGhlCj4gcGF0Y2hlcyB0aGF0IG9ubHkgdG91Y2ggY29t
bW9uIGNvZGUgaWYgeW91IHRoaW5rIHRoYXQgaXQgbWFrZXMgc2Vuc2UuCgpJJ2xsIGtlZXAgdGhl
IGFybTY0IHRhZ3MgaW4gY29tbWl0IHRpdGxlcyBmb3IgdjE3LiBQbGVhc2UgcmVwbHkKZXhwbGlj
aXRseSBpZiB5b3UgdGhpbmsgSSBzaG91bGQgcmVtb3ZlIHRoZW0uIFRoYW5rcyEgOikKCj4KPiBU
aGFua3MhCj4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1
bS5vcmc+Cj4gPgo+ID4gLUtlZXMKPiA+Cj4gPiA+IC0tLQo+ID4gPiAgZnMvbmFtZXNwYWNlLmMg
fCAyICstCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL25hbWVzcGFjZS5jIGIvZnMvbmFtZXNwYWNl
LmMKPiA+ID4gaW5kZXggYjI2Nzc4YmRjMjM2Li4yZTg1NzEyYTE5ZWQgMTAwNjQ0Cj4gPiA+IC0t
LSBhL2ZzL25hbWVzcGFjZS5jCj4gPiA+ICsrKyBiL2ZzL25hbWVzcGFjZS5jCj4gPiA+IEBAIC0y
OTkzLDcgKzI5OTMsNyBAQCB2b2lkICpjb3B5X21vdW50X29wdGlvbnMoY29uc3Qgdm9pZCBfX3Vz
ZXIgKiBkYXRhKQo+ID4gPiAgICAgICAgKiB0aGUgcmVtYWluZGVyIG9mIHRoZSBwYWdlLgo+ID4g
PiAgICAgICAgKi8KPiA+ID4gICAgICAgLyogY29weV9mcm9tX3VzZXIgY2Fubm90IGNyb3NzIFRB
U0tfU0laRSAhICovCj4gPiA+IC0gICAgIHNpemUgPSBUQVNLX1NJWkUgLSAodW5zaWduZWQgbG9u
ZylkYXRhOwo+ID4gPiArICAgICBzaXplID0gVEFTS19TSVpFIC0gKHVuc2lnbmVkIGxvbmcpdW50
YWdnZWRfYWRkcihkYXRhKTsKPiA+ID4gICAgICAgaWYgKHNpemUgPiBQQUdFX1NJWkUpCj4gPiA+
ICAgICAgICAgICAgICAgc2l6ZSA9IFBBR0VfU0laRTsKPiA+ID4KPiA+ID4gLS0KPiA+ID4gMi4y
Mi4wLnJjMS4zMTEuZzVkNzU3M2ExNTEtZ29vZwo+ID4gPgo+ID4KPiA+IC0tCj4gPiBLZWVzIENv
b2sKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
