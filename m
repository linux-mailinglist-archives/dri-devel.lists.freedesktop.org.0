Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B70026DFC7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 17:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2F36E0D0;
	Thu, 17 Sep 2020 15:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DD76E0D0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 15:37:14 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id m12so2327856otr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 08:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZKdwGNTuB7raHchRws1uZpYC5kiBgIgkW7sRbNdes8U=;
 b=ISCJ5Tw66UvgaeWJoGMvoGpBgdi+Pvh73WzxPCKZycvbr4Kw5zYOwmcCQjHLfF+3da
 CYy+53x/nyxrzX0KXw6ljYFdDcKO3M9i08qHW5NqtLtlz6ZhbasQ8xieyUjx4qmoUfzZ
 Zbi23eh19F5Vb4GtV/XcziMcnv0MJy1iuV014=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZKdwGNTuB7raHchRws1uZpYC5kiBgIgkW7sRbNdes8U=;
 b=BbgyjvDPRhNr6P3ww7eE8wHTd3G8FP3kVfYfwNXcOMtUxhqPqHpF9MbylCk/GVh7Sr
 JNUlhxH4xKzInhp71xsERiV9ayOReC6/UWfY673sN3Uk8PMyxm8ilbuRLRaWEVa3a5WV
 A3hfZN6na1tbeotLgtjFj6hrQwo+k6lWiP2zgOVIUnZXBDWJGxEYH4AUwFF1zUyNtxTU
 7Cv4/hFH5J2TBQial2F0v2PTe+vaUNa08X3QLahA3zZl0ZwHro3yMp+CGX7ZK6cV5ETB
 phpiWZd7oQPoQjH1gPTpbBZQy9Clbfu+9P3RCeLTlGEnknmGWMtX3EIuvhyBrHxLRdrd
 TyPQ==
X-Gm-Message-State: AOAM533nJKq4T60ZE4n4xkfxEuzQrCzX0dUt74mU+AKyZemIN9PUkINI
 AyK1/BLX6zDdDa2PHu7gRpFt1bzsyTrHL6UAer9wVQ==
X-Google-Smtp-Source: ABdhPJzGgOa/Oz2wRUro/hKXS9FrrveYmtnBfxpRy+S4Y7u9DCAavZtFsw1BfFfAu8kbrs7cNgN2/BHLCGrXvdc8BOY=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr21146655otq.188.1600357033519; 
 Thu, 17 Sep 2020 08:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
 <20200917143551.GG8409@ziepe.ca>
 <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
 <20200917152456.GH8409@ziepe.ca>
In-Reply-To: <20200917152456.GH8409@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 17 Sep 2020 17:37:01 +0200
Message-ID: <CAKMK7uHQLAHXC_aBZZco0e3tbAqnNuW8QdJk=-V-yM2khw5e=Q@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTcsIDIwMjAgYXQgNToyNCBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBUaHUsIFNlcCAxNywgMjAyMCBhdCAwNDo1NDo0NFBNICswMjAw
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4gQW0gMTcuMDkuMjAgdW0gMTY6MzUgc2Nocmll
YiBKYXNvbiBHdW50aG9ycGU6Cj4gPiA+IE9uIFRodSwgU2VwIDE3LCAyMDIwIGF0IDAyOjI0OjI5
UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiA+ID4gQW0gMTcuMDkuMjAgdW0g
MTQ6MTggc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gPiA+ID4gPiBPbiBUaHUsIFNlcCAxNywg
MjAyMCBhdCAwMjowMzo0OFBNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4gPiA+
ID4gPiBBbSAxNy4wOS4yMCB1bSAxMzozMSBzY2hyaWViIEphc29uIEd1bnRob3JwZToKPiA+ID4g
PiA+ID4gPiBPbiBUaHUsIFNlcCAxNywgMjAyMCBhdCAxMDowOToxMkFNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBZZWFoLCBidXQgaXQg
ZG9lc24ndCB3b3JrIHdoZW4gZm9yd2FyZGluZyBmcm9tIHRoZSBkcm0gY2hhcmRldiB0byB0aGUK
PiA+ID4gPiA+ID4gPiA+IGRtYS1idWYgb24gdGhlIGltcG9ydGVyIHNpZGUsIHNpbmNlIHlvdSdk
IG5lZWQgYSB0b24gb2YgZGlmZmVyZW50Cj4gPiA+ID4gPiA+ID4gPiBhZGRyZXNzIHNwYWNlcy4g
QW5kIHlvdSBzdGlsbCByZWx5IG9uIHRoZSBjb3JlIGNvZGUgcGlja2luZyB1cCB5b3VyCj4gPiA+
ID4gPiA+ID4gPiBwZ29mZiBtYW5nbGluZywgd2hpY2ggZmVlbHMgYWJvdXQgYXMgcmlza3kgdG8g
bWUgYXMgdGhlIHZtYSBmaWxlCj4gPiA+ID4gPiA+ID4gPiBwb2ludGVyIHdyYW5nbGluZyAtIGlm
IGl0J3Mgbm90IGNvbnNpc3RlbnRseSBhcHBsaWVkIHRoZSByZXZlcnNlIG1hcAo+ID4gPiA+ID4g
PiA+ID4gaXMgdG9hc3QgYW5kIHVubWFwX21hcHBpbmdfcmFuZ2UgZG9lc24ndCB3b3JrIGNvcnJl
Y3RseSBmb3Igb3VyIG5lZWRzLgo+ID4gPiA+ID4gPiA+IEkgd291bGQgdGhpbmsgdGhlIHBnb2Zm
IGhhcyB0byBiZSB0cmFuc2xhdGVkIGF0IHRoZSBzYW1lIHRpbWUgdGhlCj4gPiA+ID4gPiA+ID4g
dm0tPnZtX2ZpbGUgaXMgY2hhbmdlZD8KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoZSBv
d25lciBvZiB0aGUgZG1hX2J1ZiBzaG91bGQgaGF2ZSBvbmUgdmlydHVhbCBhZGRyZXNzIHNwYWNl
IGFuZCBGRCwKPiA+ID4gPiA+ID4gPiBhbGwgaXRzIGRtYSBidWZzIHNob3VsZCBiZSBsaW5rZWQg
dG8gaXQsIGFuZCBhbGwgcGdvZmZzIHRyYW5zbGF0ZWQgdG8KPiA+ID4gPiA+ID4gPiB0aGF0IHNw
YWNlLgo+ID4gPiA+ID4gPiBZZWFoLCB0aGF0IGlzIGV4YWN0bHkgbGlrZSBhbWRncHUgaXMgZG9p
bmcgaXQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEdvaW5nIHRvIGRvY3VtZW50IHRoYXQgc29t
ZWhvdyB3aGVuIEknbSBkb25lIHdpdGggVFRNIGNsZWFudXBzLgo+ID4gPiA+ID4gQlRXLCB3aGls
ZSBwZW9wbGUgYXJlIGxvb2tpbmcgYXQgdGhpcywgaXMgdGhlcmUgYSB3YXkgdG8gZ28gZnJvbSBh
IFZNQQo+ID4gPiA+ID4gdG8gYSBkbWFfYnVmIHRoYXQgb3ducyBpdD8KPiA+ID4gPiBPbmx5IGEg
ZHJpdmVyIHNwZWNpZmljIG9uZS4KPiA+ID4gU291bmRzIE9LCj4gPiA+Cj4gPiA+ID4gRm9yIFRU
TSBkcml2ZXJzIHZtYS0+dm1fcHJpdmF0ZV9kYXRhIHBvaW50cyB0byB0aGUgYnVmZmVyIG9iamVj
dC4gTm90IHN1cmUKPiA+ID4gPiBhYm91dCB0aGUgZHJpdmVycyB1c2luZyBHRU0gb25seS4KPiA+
ID4gV2h5IGFyZSBkcml2ZXJzIGluIGNvbnRyb2wgb2YgdGhlIHZtYT8gSSB3b3VsZCB0aGluayBk
bWFfYnVmIHNob3VsZCBiZQo+ID4gPiB0aGUgdm1hIG93bmVyLiBJSVJDIG1vZHVsZSBsaWZldGlt
ZSBjb3JyZWN0bmVzcyBlc3NlbnRpYWxseSBoaW5ncyBvbgo+ID4gPiB0aGUgbW9kdWxlIG93bmVy
IG9mIHRoZSBzdHJ1Y3QgZmlsZQo+ID4KPiA+IEJlY2F1c2UgdGhlIHBhZ2UgZmF1bHQgaGFuZGxp
bmcgaXMgY29tcGxldGVseSBkcml2ZXIgc3BlY2lmaWMuCj4gPgo+ID4gV2UgY291bGQgaW5zdGFs
bCBzb21lIERNQS1idWYgdm1vcHMsIGJ1dCB0aGF0IHdvdWxkIGp1c3QgYmUgYW5vdGhlciBsYXll
ciBvZgo+ID4gcmVkaXJlY3Rpb24uCgpVaCBnZWV6IEkgZGlkbid0IGtub3cgYW1kZ3B1IHdhcyBk
b2luZyB0aGF0IDotLwoKU2luY2UgdGhpcyBpcyBvbiwgSSBndWVzcyB0aGUgaW52ZXJzZSBvZiB0
cnlpbmcgdG8gY29udmVydCBhIHVzZXJwdHIKaW50byBhIGRtYS1idWYgaXMgcHJvcGVybHkgcmVq
ZWN0ZWQ/Cgo+IElmIGl0IGlzIGFscmVhZHkgdGFraW5nIGEgcGFnZSBmYXVsdCBJJ20gbm90IHN1
cmUgdGhlIGV4dHJhIGZ1bmN0aW9uCj4gY2FsbCBpbmRpcmVjdGlvbiBpcyBnb2luZyB0byBiZSBh
IGJpZyBkZWFsLiBIYXZpbmcgYSB1bmlmb3JtIFZNQQo+IHNvdW5kcyBzYW5lciB0aGFuIGV2ZXJ5
IGRyaXZlciBjdXN0b20gcm9sbGluZyBzb21ldGhpbmcuCj4KPiBXaGVuIEkgdW53b3VuZCBhIHNp
bWlsYXIgbWVzcyBpbiBSRE1BIGFsbCB0aGUgY3VzdG9tIFZNQSBzdHVmZiBpbiB0aGUKPiBkcml2
ZXJzIHR1cm5lZCBvdXQgdG8gYmUgZ2VuZXJhbGx5IGJ1Z2d5LCBhdCBsZWFzdC4KPgo+IElzIHZt
YS0+dm1fZmlsZS0+cHJpdmF0ZV9kYXRhIHVuaXZlcnNhbGx5IGEgZG1hX2J1ZiBwb2ludGVyIGF0
IGxlYXN0PwoKTm9wZS4gSSB0aGluayBpZiB5b3Ugd2FudCB0aGlzIHdpdGhvdXQgc29tZSBsYXJn
ZSBzY2FsZSByZXdyaXRlIG9mIGEKbG90IG9mIGNvZGUgd2UnZCBuZWVkIGEgdm1vcHMtPmdldF9k
bWFidWYgb3Igc2ltaWxhci4gTm90IHByZXR0eSwgYnV0CndvdWxkIGdldCB0aGUgam9iIGRvbmUu
Cgo+ID4gPiBTbywgdXNlciBWQSAtPiBmaW5kX3ZtYSAtPiBkbWFfYnVmIG9iamVjdCAtPiBkbWFf
YnVmIG9wZXJhdGlvbnMgb24gdGhlCj4gPiA+IG1lbW9yeSBpdCByZXByZXNlbnRzCj4gPgo+ID4g
QWgsIHllcyB3ZSBhcmUgYWxyZWFkeSBkb2luZyB0aGlzIGluIGFtZGdwdSBhcyB3ZWxsLiBCdXQg
b25seSBmb3IgRE1BLWJ1ZnMKPiA+IG9yIG1vcmUgZ2VuZXJhbGx5IGJ1ZmZlcnMgd2hpY2ggYXJl
IG1tYXBlZCBieSB0aGlzIGRyaXZlciBpbnN0YW5jZS4KPgo+IFNvIHRoZXJlIGlzIG5vIGdlbmVy
YWwgZG1hX2J1ZiBzZXJ2aWNlPyBUaGF0IGlzIGEgcmVhbCBidW1tZXIKCk1vc3RseSBoaXN0b3Jp
Y2FsIHJlYXNvbnMgYW5kICJpdCdzIGNvbXBsaWNhdGVkIi4gT25lIHByb2JsZW0gaXMgdGhhdApk
bWEtYnVmIGlzbid0IGEgcG93ZXJmdWwgZW5vdWdoIGludGVyZmFjZSB0aGF0IGRyaXZlcnMgY291
bGQgdXNlIGl0CmZvciBhbGwgdGhlaXIgbmF0aXZlIG9iamVjdHMsIGUuZy4gdXNlcnB0ciBkb2Vz
bid0IHBhc3MgdGhyb3VnaCBpdCwKYW5kIGNsZXZlciBjYWNoZSBmbHVzaGluZyB0cmlja3MgYXJl
bid0IGFsbG93ZWQgYW5kIGEgYnVuY2ggb2Ygb3RoZXIKdGhpbmdzLiBTbyB0aGVyZSdzIHNvbWUg
c2VyaW91cyByb2FkYmxvY2tzIGJlZm9yZSB3ZSBjb3VsZCBoYXZlIGEKY29tbW9uIGFsbG9jYXRv
ciAob3Igc2V0IG9mIGFsbG9jYXRvcnMpIGJlaGluZCBkbWEtYnVmLgotRGFuaWVsCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
