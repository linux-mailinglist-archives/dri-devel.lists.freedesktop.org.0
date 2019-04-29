Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70674F0E8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 09:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662DC893DB;
	Tue, 30 Apr 2019 07:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E385A891FB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 14:23:44 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id k19so5245820pgh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 07:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qKPVtvBLmfJTI551qLHl53aFN3OBlNxxZnEj1HXg4SU=;
 b=ldwgWQk8n2jiETFuTt9g9tQXN4sN1emMzawBcEu3/nO7C8OOAhcM+7lHSmNKEa7uUJ
 bdBMJ4iM6t34PVH26AwyVluxAx+GQIoWAyDZJbK3Yq7xXCfzAvZKFfUIdkJWdsmngJfw
 NCzBzzvP9wuFlshzGFJMWcu6ti5emGO7kmONlylzIb25f3xUIydesQumu1hmOl8He5wD
 ka3OSfG41P4oJt1ylrjd3jmphmgzFU2RA2Oob28hWI+qX3m1H1EeQWC4fi1dGeXzgCtH
 Wlwy1LGGspF+tv1DdPoEi1YtGjhjiJtyB2MyKhEnaSyi3ves4qnmdLGiIJkMXyeGQHC/
 UCRQ==
X-Gm-Message-State: APjAAAU4WzxvtgUczcRJbrXUcPdPcbH1Cj/jI8akALwVNdk0ZWjrjTSs
 Hp2wh4+NQdVf0O3beZwvWlZWtDI1NvGKmNnNlgDHOw==
X-Google-Smtp-Source: APXvYqwNMvYFFeiINAACBgd15gIPA6I5dddxP32CV6EfFFyTAnzcwTm5aQToA3fIAOsP2G0SI3a10snMId1MJawTiS0=
X-Received: by 2002:a65:5148:: with SMTP id g8mr17015283pgq.168.1556547824181; 
 Mon, 29 Apr 2019 07:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553093420.git.andreyknvl@google.com>
 <76f96eb9162b3a7fa5949d71af38bf8fdf6924c4.1553093421.git.andreyknvl@google.com>
 <20190322154136.GP13384@arrakis.emea.arm.com>
 <CAAeHK+yHp27eT+wTE3Uy4DkN8XN3ZjHATE+=HgjgRjrHjiXs3Q@mail.gmail.com>
 <20190426145024.GC54863@arrakis.emea.arm.com>
In-Reply-To: <20190426145024.GC54863@arrakis.emea.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 29 Apr 2019 16:23:32 +0200
Message-ID: <CAAeHK+ww=6-fTnHN_33EEiKdMqXq5bNU4oW9oOMcfz1N_+Kisw@mail.gmail.com>
Subject: Re: [PATCH v13 10/20] kernel,
 arm64: untag user pointers in prctl_set_mm*
To: Catalin Marinas <catalin.marinas@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailman-Approved-At: Tue, 30 Apr 2019 07:09:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qKPVtvBLmfJTI551qLHl53aFN3OBlNxxZnEj1HXg4SU=;
 b=mXWeCrBWyjjnfCR+3xz3X8593mLELxvrtE9kbO3YLUgcV7Wqby69B/+ldDxq8f4xl4
 /tTrmdSEaTmiV+1Hdh7RcsYCdfKXkBJdbVh2fW+oGSbBNoeNmuIBUa+NsGp54/DhlLBA
 rz7gs1efJGn2cXXq0bcAjGjW/XyNdZhfUlH+/8EXiLGpfR49fVX7WDRYuAt2jCgbxK81
 24BD+f68rZAntAlkG8MIC8V/K+0hvA5aq3l657ckbvvPMyNmI/xfEZiisfgmyrZAt9Zl
 r3WPzCH+6LgqHMMuFnAFeU6QVVkYDfyerDreawMVW498T/ltPC8yuFhBMUXTK7Iu/rRz
 7uIg==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Eric Dumazet <edumazet@google.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Chintan Pandya <cpandya@codeaurora.org>, Shuah Khan <shuah@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Daniel Borkmann <daniel@iogearbox.net>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Lee Smith <Lee.Smith@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf <bpf@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>, Jens Wiklander <jens.wiklander@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 netdev <netdev@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgNDo1MCBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgQXByIDAxLCAyMDE5IGF0IDA2OjQ0
OjM0UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBPbiBGcmksIE1hciAyMiwg
MjAxOSBhdCA0OjQxIFBNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+
IHdyb3RlOgo+ID4gPiBPbiBXZWQsIE1hciAyMCwgMjAxOSBhdCAwMzo1MToyNFBNICswMTAwLCBB
bmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiA+IEBAIC0yMTIwLDEzICsyMTM1LDE0IEBAIHN0
YXRpYyBpbnQgcHJjdGxfc2V0X21tKGludCBvcHQsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiA+ID4g
PiAgICAgICBpZiAob3B0ID09IFBSX1NFVF9NTV9BVVhWKQo+ID4gPiA+ICAgICAgICAgICAgICAg
cmV0dXJuIHByY3RsX3NldF9hdXh2KG1tLCBhZGRyLCBhcmc0KTsKPiA+ID4gPgo+ID4gPiA+IC0g
ICAgIGlmIChhZGRyID49IFRBU0tfU0laRSB8fCBhZGRyIDwgbW1hcF9taW5fYWRkcikKPiA+ID4g
PiArICAgICBpZiAodW50YWdnZWRfYWRkcihhZGRyKSA+PSBUQVNLX1NJWkUgfHwKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgdW50YWdnZWRfYWRkcihhZGRyKSA8IG1tYXBfbWluX2FkZHIp
Cj4gPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPgo+ID4gPiA+ICAg
ICAgIGVycm9yID0gLUVJTlZBTDsKPiA+ID4gPgo+ID4gPiA+ICAgICAgIGRvd25fd3JpdGUoJm1t
LT5tbWFwX3NlbSk7Cj4gPiA+ID4gLSAgICAgdm1hID0gZmluZF92bWEobW0sIGFkZHIpOwo+ID4g
PiA+ICsgICAgIHZtYSA9IGZpbmRfdm1hKG1tLCB1bnRhZ2dlZF9hZGRyKGFkZHIpKTsKPiA+ID4g
Pgo+ID4gPiA+ICAgICAgIHByY3RsX21hcC5zdGFydF9jb2RlICAgID0gbW0tPnN0YXJ0X2NvZGU7
Cj4gPiA+ID4gICAgICAgcHJjdGxfbWFwLmVuZF9jb2RlICAgICAgPSBtbS0+ZW5kX2NvZGU7Cj4g
PiA+Cj4gPiA+IERvZXMgdGhpcyBtZWFuIHRoYXQgd2UgYXJlIGxlZnQgd2l0aCB0YWdnZWQgYWRk
cmVzc2VzIGZvciB0aGUKPiA+ID4gbW0tPnN0YXJ0X2NvZGUgZXRjLiB2YWx1ZXM/IEkgcmVhbGx5
IGRvbid0IHRoaW5rIHdlIHNob3VsZCBhbGxvdyB0aGlzLAo+ID4gPiBJJ20gbm90IHN1cmUgd2hh
dCB0aGUgaW1wbGljYXRpb25zIGFyZSBpbiBvdGhlciBwYXJ0cyBvZiB0aGUga2VybmVsLgo+ID4g
Pgo+ID4gPiBBcmd1YWJseSwgdGhlc2UgYXJlIG5vdCBldmVuIHBvaW50ZXIgdmFsdWVzIGJ1dCBz
b21lIGFkZHJlc3MgcmFuZ2VzLiBJCj4gPiA+IGtub3cgd2UgZGVjaWRlZCB0byByZWxheCB0aGlz
IG5vdGlvbiBmb3IgbW1hcC9tcHJvdGVjdC9tYWR2aXNlKCkgc2luY2UKPiA+ID4gdGhlIHVzZXIg
ZnVuY3Rpb24gcHJvdG90eXBlcyB0YWtlIHBvaW50ZXIgYXMgYXJndW1lbnRzIGJ1dCBpdCBmZWVs
cyBsaWtlCj4gPiA+IHdlIGFyZSBvdmVyZG9pbmcgaXQgaGVyZSAoc3RydWN0IHByY3RsX21tX21h
cCBkb2Vzbid0IGV2ZW4gaGF2ZQo+ID4gPiBwb2ludGVycykuCj4gPiA+Cj4gPiA+IFdoYXQgaXMg
dGhlIHVzZS1jYXNlIGZvciBhbGxvd2luZyB0YWdnZWQgYWRkcmVzc2VzIGhlcmU/IENhbiB1c2Vy
IHNwYWNlCj4gPiA+IGhhbmRsZSB1bnRhZ2dpbmc/Cj4gPgo+ID4gSSBkb24ndCBrbm93IGFueSB1
c2UgY2FzZXMgZm9yIHRoaXMuIEkgZGlkIGl0IGJlY2F1c2UgaXQgc2VlbXMgdG8gYmUKPiA+IGNv
dmVyZWQgYnkgdGhlIHJlbGF4ZWQgQUJJLiBJJ20gbm90IGVudGlyZWx5IHN1cmUgd2hhdCB0byBk
byBoZXJlLAo+ID4gc2hvdWxkIEkganVzdCBkcm9wIHRoaXMgcGF0Y2g/Cj4KPiBJZiB3ZSBhbGxv
dyB0YWdnZWQgYWRkcmVzc2VzIHRvIGJlIHBhc3NlZCBoZXJlLCB3ZSdkIGhhdmUgdG8gdW50YWcg
dGhlbQo+IGJlZm9yZSB0aGV5IGVuZCB1cCBpbiB0aGUgbW0tPnN0YXJ0X2NvZGUgZXRjLiBtZW1i
ZXJzLgo+Cj4gSSBrbm93IHdlIGFyZSB0cnlpbmcgdG8gcmVsYXggdGhlIEFCSSBoZXJlIHcuci50
LiBhZGRyZXNzIHJhbmdlcyBidXQKPiBtb3N0bHkgYmVjYXVzZSB3ZSBjb3VsZG4ndCBmaWd1cmUg
b3V0IGEgd2F5IHRvIGRvY3VtZW50IHVuYW1iaWd1b3VzbHkKPiB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIGEgdXNlciBwb2ludGVyIHRoYXQgbWF5IGJlIGRlcmVmZXJlbmNlZCBieSB0aGUKPiBrZXJu
ZWwgKHRhZ3MgYWxsb3dlZCkgYW5kIGFuIGFkZHJlc3MgdHlwaWNhbGx5IHVzZWQgZm9yIG1hbmFn
aW5nIHRoZQo+IGFkZHJlc3Mgc3BhY2UgbGF5b3V0LiBTdWdnZXN0aW9ucyB3ZWxjb21lZC4KPgo+
IEknZCBzYXkganVzdCBkcm9wIHRoaXMgcGF0Y2ggYW5kIGNhcHR1cmUgaXQgaW4gdGhlIEFCSSBk
b2N1bWVudC4KCk9LLCB3aWxsIGRvIGluIHYxNC4KClZpbmNlbnpvLCBjb3VsZCB5b3UgYWRkIGEg
bm90ZSBhYm91dCB0aGlzIGludG8gdG91ciBwYXRjaHNldD8KCj4KPiAtLQo+IENhdGFsaW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
