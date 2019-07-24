Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 897F673DAA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 22:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597A26E652;
	Wed, 24 Jul 2019 20:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DDF6E652
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 20:19:02 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f17so42707654wme.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 13:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uCyHvJVkRZumARLm11LdjYU2wgRDrjk7Xpd2Pm/4CUM=;
 b=K8Xy8MvPN9Ql+c7PrbKYNAcFDnXqAhxVymXyttG20kmji1h7uCKrr8O/FIlWiAanvc
 wm0wdnY2EykWZGpkoW+hVp128OxfBAPH8FNe8kjhaJElyJ8MClrEHV70AbdXeY2rsJz2
 7RZbo0k86T+p9/LLQiStW9tcAz0z/tPFPXm6VWJrlDDdIM2XfZGt4J7m1RJZtLo9x/so
 4moLiCEh930Ii99dHULQXVsUEz/MnJ9jJVdct69akWiTzrpwQD/v7fTHzsip3GqznA/E
 +oy1K2OvUId6bmh53vHIgATXkzfieHh8HlKF2WCALmQ4sYPWm0USC/DtEwfxPCYmbeFI
 StCw==
X-Gm-Message-State: APjAAAV+S3IWzWFyL/JceGVcQBrJShHPBJ6lyaErDO7dGiODZsRM04Sa
 t89oLIuYnj5A8wtQvAhvNCjC9U4Adxo+KFQ8I8XN1+CK/OQ=
X-Google-Smtp-Source: APXvYqzne6wuqU7LConXTs0S6lFIYeqa69IIJz0V4W6ONH7N7hOznm+a/z9PghQX0bLW04gOZC7ziRyCGieZewzto2s=
X-Received: by 2002:a1c:d10c:: with SMTP id i12mr75821649wmg.152.1563999540296; 
 Wed, 24 Jul 2019 13:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <3b922aa4-c6d4-e4a4-766d-f324ff77f7b5@linux.com>
 <40f8b7d8-fafa-ad99-34fb-9c63e34917e2@redhat.com>
In-Reply-To: <40f8b7d8-fafa-ad99-34fb-9c63e34917e2@redhat.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 24 Jul 2019 13:18:47 -0700
Message-ID: <CALAqxLU199ATrMFa2ARmHOZ3K6ZnOuDLSAqNrTfwOWJaYiW7Yg@mail.gmail.com>
Subject: Re: Limits for ION Memory Allocator
To: Laura Abbott <labbott@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uCyHvJVkRZumARLm11LdjYU2wgRDrjk7Xpd2Pm/4CUM=;
 b=MMFhBM5Pt5Bu3rS3QrPnpjTF3l1IJpk1QmQmjGaPFr5PvBQwNLRpzX+5/gr6aNSdCZ
 vvEAbsdi+zHpVh40gCBAf96lB7k/+P16YkMaax7BCa3VCjo20+sJY/pvmfXxP7jDAlzc
 AWhRW16LHsMMAlx9kYR+te6xxCZz9DYQkUb9cIX+Eig3VWNu65JSMjOmny0yf4uDVhLR
 DU2YrYMoOP8itf1qPvplk8lYCeENSprEH141M2gm8iDVRP/7Xr9nbG+sdjrPUHqfrU+6
 3k8U622iHi2XDVcsN54oFxmrEi6aL45ohjJEk/gDD0CN++uyO007eaD6Cs6hCiJ9dklQ
 2oNg==
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Linux-MM <linux-mm@kvack.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 driverdevel <devel@driverdev.osuosl.org>,
 Christian Brauner <christian@brauner.io>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, alex.popov@linux.com,
 Alistair Delva <adelva@google.com>, Todd Kjos <tkjos@android.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Riley Andrews <riandrews@android.com>, syzkaller <syzkaller@googlegroups.com>,
 Martijn Coenen <maco@android.com>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Mark Brown <broonie@kernel.org>, Hridya Valsaraju <hridya@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTI6MzYgUE0gTGF1cmEgQWJib3R0IDxsYWJib3R0QHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gNy8xNy8xOSAxMjozMSBQTSwgQWxleGFuZGVyIFBvcG92
IHdyb3RlOgo+ID4gSGVsbG8hCj4gPgo+ID4gVGhlIHN5emthbGxlciBbMV0gaGFzIGEgdHJvdWJs
ZSB3aXRoIGZ1enppbmcgdGhlIExpbnV4IGtlcm5lbCB3aXRoIElPTiBNZW1vcnkKPiA+IEFsbG9j
YXRvci4KPiA+Cj4gPiBTeXprYWxsZXIgdXNlcyBzZXZlcmFsIG1ldGhvZHMgWzJdIHRvIGxpbWl0
IG1lbW9yeSBjb25zdW1wdGlvbiBvZiB0aGUgdXNlcnNwYWNlCj4gPiBwcm9jZXNzZXMgY2FsbGlu
ZyB0aGUgc3lzY2FsbHMgZm9yIHRlc3RpbmcgdGhlIGtlcm5lbDoKPiA+ICAgLSBzZXRybGltaXQo
KSwKPiA+ICAgLSBjZ3JvdXBzLAo+ID4gICAtIHZhcmlvdXMgc3lzY3RsLgo+ID4gQnV0IHRoZXNl
IG1ldGhvZHMgZG9uJ3Qgd29yayBmb3IgSU9OIE1lbW9yeSBBbGxvY2F0b3IsIHNvIGFueSB1c2Vy
c3BhY2UgcHJvY2Vzcwo+ID4gdGhhdCBoYXMgYWNjZXNzIHRvIC9kZXYvaW9uIGNhbiBicmluZyB0
aGUgc3lzdGVtIHRvIHRoZSBvdXQtb2YtbWVtb3J5IHN0YXRlLgo+ID4KPiA+IEFuIGV4YW1wbGUg
b2YgYSBwcm9ncmFtIGRvaW5nIHRoYXQ6Cj4gPgo+ID4KPiA+ICNpbmNsdWRlIDxzeXMvdHlwZXMu
aD4KPiA+ICNpbmNsdWRlIDxzeXMvc3RhdC5oPgo+ID4gI2luY2x1ZGUgPGZjbnRsLmg+Cj4gPiAj
aW5jbHVkZSA8c3RkaW8uaD4KPiA+ICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ID4gI2luY2x1
ZGUgPHN5cy9pb2N0bC5oPgo+ID4KPiA+ICNkZWZpbmUgSU9OX0lPQ19NQUdJQyAgICAgICAgICdJ
Jwo+ID4gI2RlZmluZSBJT05fSU9DX0FMTE9DICAgICAgICAgX0lPV1IoSU9OX0lPQ19NQUdJQywg
MCwgXAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGlvbl9h
bGxvY2F0aW9uX2RhdGEpCj4gPgo+ID4gc3RydWN0IGlvbl9hbGxvY2F0aW9uX2RhdGEgewo+ID4g
ICAgICAgX191NjQgbGVuOwo+ID4gICAgICAgX191MzIgaGVhcF9pZF9tYXNrOwo+ID4gICAgICAg
X191MzIgZmxhZ3M7Cj4gPiAgICAgICBfX3UzMiBmZDsKPiA+ICAgICAgIF9fdTMyIHVudXNlZDsK
PiA+IH07Cj4gPgo+ID4gaW50IG1haW4odm9pZCkKPiA+IHsKPiA+ICAgICAgIHVuc2lnbmVkIGxv
bmcgaSA9IDA7Cj4gPiAgICAgICBpbnQgZmQgPSAtMTsKPiA+ICAgICAgIHN0cnVjdCBpb25fYWxs
b2NhdGlvbl9kYXRhIGRhdGEgPSB7Cj4gPiAgICAgICAgICAgICAgIC5sZW4gPSAweDEzZjY1ZDhj
LAo+ID4gICAgICAgICAgICAgICAuaGVhcF9pZF9tYXNrID0gMSwKPiA+ICAgICAgICAgICAgICAg
LmZsYWdzID0gMCwKPiA+ICAgICAgICAgICAgICAgLmZkID0gLTEsCj4gPiAgICAgICAgICAgICAg
IC51bnVzZWQgPSAwCj4gPiAgICAgICB9Owo+ID4KPiA+ICAgICAgIGZkID0gb3BlbigiL2Rldi9p
b24iLCAwKTsKPiA+ICAgICAgIGlmIChmZCA9PSAtMSkgewo+ID4gICAgICAgICAgICAgICBwZXJy
b3IoIlstXSBvcGVuIC9kZXYvaW9uIik7Cj4gPiAgICAgICAgICAgICAgIHJldHVybiAxOwo+ID4g
ICAgICAgfQo+ID4KPiA+ICAgICAgIHdoaWxlICgxKSB7Cj4gPiAgICAgICAgICAgICAgIHByaW50
ZigiaXRlciAlbHVcbiIsIGkpOwo+ID4gICAgICAgICAgICAgICBpb2N0bChmZCwgSU9OX0lPQ19B
TExPQywgJmRhdGEpOwo+ID4gICAgICAgICAgICAgICBpKys7Cj4gPiAgICAgICB9Cj4gPgo+ID4g
ICAgICAgcmV0dXJuIDA7Cj4gPiB9Cj4gPgo+ID4KPiA+IEkgbG9va2VkIHRocm91Z2ggdGhlIGNv
ZGUgb2YgaW9uX2FsbG9jKCkgYW5kIGRpZG4ndCBmaW5kIGFueSBsaW1pdCBjaGVja3MuCj4gPiBJ
cyBpdCBjdXJyZW50bHkgcG9zc2libGUgdG8gbGltaXQgSU9OIGtlcm5lbCBhbGxvY2F0aW9ucyBm
b3Igc29tZSBwcm9jZXNzPwo+ID4KPiA+IElmIG5vdCwgaXMgaXQgYSByaWdodCBpZGVhIHRvIGRv
IHRoYXQ/Cj4gPiBUaGFua3MhCj4gPgo+Cj4gWWVzLCBJIGRvIHRoaW5rIHRoYXQncyB0aGUgcmln
aHQgYXBwcm9hY2guIFdlJ3JlIHdvcmtpbmcgb24gbW92aW5nIElvbgo+IG91dCBvZiBzdGFnaW5n
IGFuZCB0aGlzIGlzIHNvbWV0aGluZyBJIG1lbnRpb25lZCB0byBKb2huIFN0dWx0ei4gSSBkb24n
dAo+IHRoaW5rIHdlJ3ZlIHRob3VnaHQgdG9vIGhhcmQgYWJvdXQgaG93IHRvIGRvIHRoZSBhY3R1
YWwgbGltaXRpbmcgc28KPiBzdWdnZXN0aW9ucyBhcmUgd2VsY29tZS4KCkluIHBhcnQgdGhlIGRt
YWJ1ZiBoZWFwcyBhbGxvdyBmb3Igc2VwYXJhdGUgaGVhcCBkZXZpY2VzLCBzbyB3ZSBjYW4KaGF2
ZSBmaW5lciBncmFpbmVkIHBlcm1pc3Npb25zIHRvIHRoZSBzcGVjaWZpYyBoZWFwcy4gIEJ1dCB0
aGF0CmRvZXNuJ3QgcHJvdmlkZSBhbnkgY29udHJvbHMgb24gaG93IG11Y2ggbWVtb3J5IG9uZSBw
cm9jZXNzIGNvdWxkCmFsbG9jYXRlIHVzaW5nIHRoZSBkZXZpY2UgaWYgaXQgaGFzIHBlcm1pc3Np
b24uCgpJIHN1c3BlY3QgdGhlIHNhbWUgaXNzdWUgaXMgcHJlc2VudCB3aXRoIGFueSBvZiB0aGUg
ZG1hYnVmIGV4cG9ydGVycwooZ3B1L2Rpc3BsYXkgZHJpdmVycywgZXRjKSwgc28gdGhpcyBpcyBs
ZXNzIG9mIGFuIElPTi9kbWFidWYgaGVhcAppc3N1ZSBhbmQgbW9yZSBvZiBhIGRtYWJ1ZiBjb3Jl
IGFjY291bnRpbmcgaXNzdWUuCgpBbm90aGVyIHByYWN0aWNhbCBjb21wbGljYXRpb24gaXMgdGhh
dCB3aXRoIEFuZHJvaWQgdGhlc2UgZGF5cywgSQpiZWxpZXZlIHRoZSBncmFsbG9jIGNvZGUgbGl2
ZXMgaW4gdGhlIEhJREwtaXplZAphbmRyb2lkLmhhcmR3YXJlLmdyYXBoaWNzLmFsbG9jYXRvckAy
LjAtc2VydmljZSBIQUwsIHdoaWNoIGRvZXMgdGhlCmJ1ZmZlciBhbGxvY2F0aW9ucyBvbiBiZWhh
bGYgb2YgcmVxdWVzdHMgc2VudCBvdmVyIHRoZSBiaW5kZXIgSVBDCmludGVyZmFjZS4gU28gd2l0
aCBhbGwgZG1hLWJ1ZiBhbGxvY2F0aW9ucyBlZmZlY3RpdmVseSBnb2luZyB0aHJvdWdoCnRoYXQg
c2luZ2xlIHByb2Nlc3MsIEknbSBub3Qgc3VyZSB3ZSB3b3VsZCB3YW50IHRvIHB1dCBwZXItcHJv
Y2VzcwpsaW1pdHMgb24gdGhlIGFsbG9jYXRvci4gIEluc3RlYWQsIEkgc3VzcGVjdCB3ZSdkIHdh
bnQgdGhlIG1lbW9yeQpjb3ZlcmVkIGJ5IHRoZSBkbWFidWYgdG8gYmUgYWNjb3VudGVkIGFnYWlu
c3QgcHJvY2Vzc2VzIHRoYXQgaGF2ZSB0aGUKZG1hYnVmIGZkIHN0aWxsIG9wZW4/CgpJIGtub3cg
QW5kcm9pZCBoYXMgc29tZSBsb2dpYyB3aXRoIHRoZWlyIG1lbXRyYWNrIEhBTCB0byBJIGJlbGll
dmUgdHJ5CnRvIGRvIGFjY291bnRpbmcgb2YgZ3B1IG1lbW9yeSBhZ2FpbnN0IHZhcmlvdXMgcHJv
Y2Vzc2VzLCBidXQgSSd2ZSBub3QKbG9va2VkIGF0IHRoYXQgaW4gZGV0YWlsIHJlY2VudGx5LgoK
VG9kZC9Kb2VsOiBBbnkgaW5wdXQgaGVyZT8KCnRoYW5rcwotam9obgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
