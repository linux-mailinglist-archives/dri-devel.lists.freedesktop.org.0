Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708D30F6D5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 16:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CED6EDFF;
	Thu,  4 Feb 2021 15:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE706EDFF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 15:54:59 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id h192so4196450oib.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 07:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TE+20LCg4P7JDuDi9T+hP1y0ckG6wCABKFlMFLlaYRg=;
 b=I9K7YZxnalNA46Wh5Hx77j97EmE2tjIuMHosJXXvSw3CyZGysR/AJ/IBWQPzW44qW4
 erlX+94l1WSwG+/6XrZWbyZ9arxJmxCnM4PXgEbRYO4Drz109iHQ4dhFQv0R3eH+KETa
 UP/yIQL9L1KgoghJ92Ou9IqHzvzuBjvJZboPtUTdpLOyJEmxsW4InealPG0o0if7HvN0
 JfRVp1+UN2Tc5FI2T5zhrKuqCxBUmGXsIqeDEnTJaNrAj4B/PgDat1cbzb7WGGbUN1Bz
 wJy5inN4ewT1q6TRNC/gLPX5fyIzRFULylh2apOjMENakVXi+96KpaIP9zRmPRTe0BUT
 6U4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TE+20LCg4P7JDuDi9T+hP1y0ckG6wCABKFlMFLlaYRg=;
 b=MaFsO2tSGecqcK98+cb17TS/s72hYCMoJN36UVqryOnPeGPKUarAmyoBbBQ64vKlzM
 pzCZKIiVG9EqF8dsMoBKVOHjtmZXAHuPSPf7QCjadnyXAU0gqNd6qFh9C6v6pXsPsEcV
 p7Lt8pNLGBe1/c4dXumESJMv7y6wod0mDg9fWZ34E5f7F5cpEiBlnR65csXobQ1RZBIj
 X27UwojXXje0O0NOFA6eCFruFuAZIQYO8NYgkb1kzHlBdjDFDRQ5Ie+jqgpilQAZ/JYF
 xDyP5lczM8E+aMWa0g/lvlRQZtTRVbDWAnidqP4FL8bhQoMrupJiKR63hwNDauwwGGAL
 jhKg==
X-Gm-Message-State: AOAM530QIkCvPjpU0IBe6kH9cwIM9qoGx0o+VpW+vdxhVDp/+KWBgISi
 3YkfjoZF2y2Wwjna4CdoJBvRJOd4x9XjyiU3kKc=
X-Google-Smtp-Source: ABdhPJyHWaV6uURhsSn77dEppvf6IL/58QKDwEfT10ywtTObf87RA9Zbd2LVs5T02SCrHGMuhdJx0KX4chS3d+eTHNI=
X-Received: by 2002:aca:1a17:: with SMTP id a23mr50294oia.120.1612454099140;
 Thu, 04 Feb 2021 07:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203015553.GX308988@casper.infradead.org>
 <CAKMK7uHnNdjOYX5Rhj=uGMz7hSz12JhgkZJCfiqgkpjXnMfL4A@mail.gmail.com>
 <CAJuCfpG4GkVbeW=bB+Qrm5GPrZAwg0_rmyG05iwQmL7GrWAYHw@mail.gmail.com>
 <CAKMK7uHi+mG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg@mail.gmail.com>
 <CAKMK7uETu_m+=MHyPmqBbEP__qjMF_wmr4c2BiVTPcwE8c+5Mg@mail.gmail.com>
 <CAJuCfpHC6P5cJh-1hv=vjGHCCkM6mA_p19H6tCZmCDxhTuASkQ@mail.gmail.com>
 <ced1c1be-e731-946e-e9ce-919520fe935a@amd.com>
In-Reply-To: <ced1c1be-e731-946e-e9ce-919520fe935a@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Feb 2021 10:54:48 -0500
Message-ID: <CADnq5_Oi_To=9rpet=Q73FY2_-abV47XtXYVVz5TBnRyzwffng@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] mm: replace BUG_ON in vm_insert_page
 with a return of an error
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 Android Kernel Team <kernel-team@android.com>,
 Sandeep Patil <sspatil@google.com>, Liam Mark <lmark@codeaurora.org>,
 Minchan Kim <minchan@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 James Jones <jajones@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Linux MM <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBGZWIgNCwgMjAyMSBhdCAzOjE2IEFNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBBbSAwMy4wMi4yMSB1bSAyMjo0MSBzY2hyaWVi
IFN1cmVuIEJhZ2hkYXNhcnlhbjoKPiA+IFtTTklQXQo+ID4+PiBIb3cgbWFueSBzZW1pLXVucmVs
YXRlZCBidWZmZXIgYWNjb3VudGluZyBzY2hlbWVzIGRvZXMgZ29vZ2xlIGNvbWUgdXAgd2l0aD8K
PiA+Pj4KPiA+Pj4gV2UncmUgYXQgdGhyZWUgd2l0aCB0aGlzIG9uZS4KPiA+Pj4KPiA+Pj4gQW5k
IGFsc28gd2UgX2Nhbm5vdF8gcmVxdWlyZWQgdGhhdCBhbGwgZG1hLWJ1ZnMgYXJlIGJhY2tlZCBi
eSBzdHJ1Y3QKPiA+Pj4gcGFnZSwgc28gcmVxdWlyaW5nIHN0cnVjdCBwYWdlIHRvIG1ha2UgdGhp
cyB3b3JrIGlzIGEgbm8tZ28uCj4gPj4+Cj4gPj4+IFNlY29uZCwgd2UgZG8gbm90IHdhbnQgdG8g
YWxsIGdldF91c2VyX3BhZ2VzIGFuZCBmcmllbmRzIHRvIHdvcmsgb24KPiA+Pj4gZG1hLWJ1Ziwg
aXQgY2F1c2VzIGFsbCBraW5kcyBvZiBwYWluLiBZZXMgb24gU29DIHdoZXJlIGRtYS1idWYgYXJl
Cj4gPj4+IGV4Y2x1c2l2ZWx5IGluIHN5c3RlbSBtZW1vcnkgeW91IGNhbiBtYXliZSBnZXQgYXdh
eSB3aXRoIHRoaXMsIGJ1dAo+ID4+PiBkbWEtYnVmIGlzIHN1cHBvc2VkIHRvIHdvcmsgaW4gbW9y
ZSBwbGFjZXMgdGhhbiBqdXN0IEFuZHJvaWQgU29Dcy4KPiA+PiBJIGp1c3QgcmVhbGl6ZWQgdGhh
dCB2bV9pbnNlcl9wYWdlIGRvZXNuJ3QgZXZlbiB3b3JrIGZvciBDTUEsIGl0IHdvdWxkCj4gPj4g
dXBzZXQgZ2V0X3VzZXJfcGFnZXMgcHJldHR5IGJhZGx5IC0geW91J3JlIHRyeWluZyB0byBwaW4g
YSBwYWdlIGluCj4gPj4gWk9ORV9NT1ZFQUJMRSBidXQgeW91IGNhbid0IG1vdmUgaXQgYmVjYXVz
ZSBpdCdzIHJhdGhlciBzcGVjaWFsLgo+ID4+IFZNX1NQRUNJQUwgaXMgZXhhY3RseSBtZWFudCB0
byBjYXRjaCB0aGlzIHN0dWZmLgo+ID4gVGhhbmtzIGZvciB0aGUgaW5wdXQsIERhbmllbCEgTGV0
IG1lIHRoaW5rIGFib3V0IHRoZSBjYXNlcyB5b3UgcG9pbnRlZCBvdXQuCj4gPgo+ID4gSU1ITywg
dGhlIGlzc3VlIHdpdGggUFNTIGlzIHRoZSBkaWZmaWN1bHR5IG9mIGNhbGN1bGF0aW5nIHRoaXMg
bWV0cmljCj4gPiB3aXRob3V0IHN0cnVjdCBwYWdlIHVzYWdlLiBJIGRvbid0IHRoaW5rIHRoYXQg
cHJvYmxlbSBiZWNvbWVzIGVhc2llcgo+ID4gaWYgd2UgdXNlIGNncm91cHMgb3IgYW55IG90aGVy
IEFQSS4gSSB3YW50ZWQgdG8gZW5hYmxlIGV4aXN0aW5nIFBTUwo+ID4gY2FsY3VsYXRpb24gbWVj
aGFuaXNtcyBmb3IgdGhlIGRtYWJ1ZnMga25vd24gdG8gYmUgYmFja2VkIGJ5IHN0cnVjdAo+ID4g
cGFnZXMgKHNpbmNlIHdlIGtub3cgaG93IHRoZSBoZWFwIGFsbG9jYXRlZCB0aGF0IG1lbW9yeSks
IGJ1dCBzb3VuZHMKPiA+IGxpa2UgdGhpcyB3b3VsZCBsZWFkIHRvIHByb2JsZW1zIHRoYXQgSSBk
aWQgbm90IGNvbnNpZGVyLgo+Cj4gWWVhaCwgdXNpbmcgc3RydWN0IHBhZ2UgaW5kZWVkIHdvbid0
IHdvcmsuIFdlIGRpc2N1c3NlZCB0aGF0IG11bHRpcGxlCj4gdGltZXMgbm93IGFuZCBEYW5pZWwg
ZXZlbiBoYXMgYSBwYXRjaCB0byBtYW5nbGUgdGhlIHN0cnVjdCBwYWdlIHBvaW50ZXJzCj4gaW5z
aWRlIHRoZSBzZ190YWJsZSBvYmplY3QgdG8gcHJldmVudCBhYnVzZSBpbiB0aGF0IGRpcmVjdGlv
bi4KPgo+IE9uIHRoZSBvdGhlciBoYW5kIEkgdG90YWxseSBhZ3JlZSB0aGF0IHdlIG5lZWQgdG8g
ZG8gc29tZXRoaW5nIG9uIHRoaXMKPiBzaWRlIHdoaWNoIGdvZXMgYmV5b25nIHdoYXQgY2dyb3Vw
cyBwcm92aWRlLgo+Cj4gQSBmZXcgeWVhcnMgYWdvIEkgY2FtZSB1cCB3aXRoIHBhdGNoZXMgdG8g
aW1wcm92ZSB0aGUgT09NIGtpbGxlciB0bwo+IGluY2x1ZGUgcmVzb3VyY2VzIGJvdW5kIHRvIHRo
ZSBwcm9jZXNzZXMgdGhyb3VnaCBmaWxlIGRlc2NyaXB0b3JzLiBJCj4gdW5mb3J0dW5hdGVseSBj
YW4ndCBmaW5kIHRoZW0gb2YgaGFuZCBhbnkgbW9yZSBhbmQgSSdtIGN1cnJlbnRseSB0byBidXN5
Cj4gdG8gZGlnIHRoZW0gdXAuCgpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZl
cy9kcmktZGV2ZWwvMjAxNS1TZXB0ZW1iZXIvMDg5Nzc4Lmh0bWwKSSB0aGluayB0aGVyZSB3YXMg
YSBtb3JlIHJlY2VudCBkaXNjdXNzaW9uLCBidXQgSSBjYW4ndCBzZWVtIHRvIGZpbmQgaXQuCgpB
bGV4Cgo+Cj4gSW4gZ2VuZXJhbCBJIHRoaW5rIHdlIG5lZWQgdG8gbWFrZSBpdCBwb3NzaWJsZSB0
aGF0IGJvdGggdGhlIGluIGtlcm5lbAo+IE9PTSBraWxsZXIgYXMgd2VsbCBhcyB1c2Vyc3BhY2Ug
cHJvY2Vzc2VzIGFuZCBoYW5kbGVycyBoYXZlIGFjY2VzcyB0bwo+IHRoYXQga2luZCBvZiBkYXRh
Lgo+Cj4gVGhlIGZkaW5mbyBhcHByb2FjaCBhcyBzdWdnZXN0ZWQgaW4gdGhlIG90aGVyIHRocmVh
ZCBzb3VuZHMgbGlrZSB0aGUKPiBlYXNpZXN0IHNvbHV0aW9uIHRvIG1lLgo+Cj4gUmVnYXJkcywK
PiBDaHJpc3RpYW4uCj4KPiA+IFRoYW5rcywKPiA+IFN1cmVuLgo+ID4KPiA+Cj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
