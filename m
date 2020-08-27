Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D8255529
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259D96E2B0;
	Fri, 28 Aug 2020 07:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620A06EB57
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 17:02:19 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r15so6036941wrp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iaDJiDThZeeDEzVlzU4moTVS3qRE8PjuLAm4ANV0fPA=;
 b=QJdS2QFBX5yromQSOgok4Hu/Nj+uS0RxjYDbQ8Ks5RYDnERghNSeoKkMDULiCKRwKg
 AWfhg93e3wtc5bzAU7Oo/RdIFgF70toIKidKT6KxIYu2BYpPw/s/L+ciMfc2Deq5zoR+
 W+sPNlrl/U8NbcydIyjiYuZVlRQnpQooKHV39pSp1gEHTbkm3zWcF8tr95xOUAmRXP06
 uVJnybjpBL8V3c0f7/zNK20dyhF7zpYQf7H5VhEduk1wZ77gcjLHSSZgUWAhhLdddDn6
 Gpi/cic/sDPjxY/5rqFmak/ZIFYW54WjvCeF5+VXTh/NXAzF8msIjTE3hfGwr2hz9sRd
 C/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iaDJiDThZeeDEzVlzU4moTVS3qRE8PjuLAm4ANV0fPA=;
 b=eaLLrl5OgdvDOV3ZILDjV+TBUteMgI9eQxAI8P+umWIZnh/DAvN9irHQBXM2ozw5mJ
 pbbQ41bkXQocHldAugZe2ZZqCkvE6O1oj4hiYQsw44APiXb+PYylu9DDnCOpw41g/jJ/
 /mBoLqgQpKrW5vi00tTYM2TMaC6qax/UkltzmGNY+psI0b/rGkDmqvxN0Msavwuscw9i
 Qrxk3ATsokdQpwycVokLDZtZLYLXkt5r7PNd+I3qCtft1rqdOi2qLyqd+Ofqgo4BDuaE
 YHBbcS9fKlNkzLLjc/q4BLSjIfq4AeqsjhJixA1nK/vCPn3K16AH6MmsvMDW+p/+OUn1
 3oRg==
X-Gm-Message-State: AOAM531BwaZ69WIPjB4VXQds7SmKWgMJCbOx/CVqBH55v62gYdm6a7Li
 FFpkORtBTDUNqkt214oTyNIW9HiZco688gD/D+LPBA==
X-Google-Smtp-Source: ABdhPJx2h4Suq8Q/8FtsNU6SR+9RMB/Kow8o2Jcg/4T455UHRuZ7Oyo36M9mR7aTSczGcHXxhR4Y5Y4E8PwPBYYbluQ=
X-Received: by 2002:adf:9ec1:: with SMTP id b1mr20983425wrf.171.1598547737864; 
 Thu, 27 Aug 2020 10:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200827123627.538189-1-gregkh@linuxfoundation.org>
 <3d8de519-65b3-123b-8ace-e820982884e0@labbott.name>
 <20200827160506.GC684514@kroah.com>
In-Reply-To: <20200827160506.GC684514@kroah.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 27 Aug 2020 22:31:41 +0530
Message-ID: <CAMi1Hd1Ch1RWvOTnON3tsrucaKThTuGQnwNFo94GqUjufVmnOg@mail.gmail.com>
Subject: Re: [PATCH] staging: ion: remove from the tree
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>,
 Christoph Hellwig <hch@infradead.org>,
 Android Kernel Team <kernel-team@android.com>, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Joel Fernandes <joel@joelfernandes.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Suren Baghdasaryan <surenb@google.com>, Hridya Valsaraju <hridya@google.com>,
 Laura Abbott <laura@labbott.name>, Shuah Khan <shuah@kernel.org>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNyBBdWcgMjAyMCBhdCAyMTozNCwgR3JlZyBLcm9haC1IYXJ0bWFuCjxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAyNywgMjAyMCBhdCAw
OTozMToyN0FNIC0wNDAwLCBMYXVyYSBBYmJvdHQgd3JvdGU6Cj4gPiBPbiA4LzI3LzIwIDg6MzYg
QU0sIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+ID4gVGhlIElPTiBhbmRyb2lkIGNvZGUg
aGFzIGxvbmcgYmVlbiBtYXJrZWQgdG8gYmUgcmVtb3ZlZCwgbm93IHRoYXQgd2UKPiA+ID4gZG1h
LWJ1ZiBzdXBwb3J0IG1lcmdlZCBpbnRvIHRoZSByZWFsIHBhcnQgb2YgdGhlIGtlcm5lbC4KPiA+
ID4KPiA+ID4gSXQgd2FzIHRob3VnaHQgdGhhdCB3ZSBjb3VsZCB3YWl0IHRvIHJlbW92ZSB0aGUg
aW9uIGtlcm5lbCBhdCBhIGxhdGVyCj4gPiA+IHRpbWUsIGJ1dCBhcyB0aGUgb3V0LW9mLXRyZWUg
QW5kcm9pZCBmb3JrIG9mIHRoZSBpb24gY29kZSBoYXMgZGl2ZXJnZWQKPiA+ID4gcXVpdGUgYSBi
aXQsIGFuZCBhbnkgQW5kcm9pZCBkZXZpY2UgdXNpbmcgdGhlIGlvbiBpbnRlcmZhY2UgdXNlcyB0
aGF0Cj4gPiA+IGZvcmtlZCB2ZXJzaW9uIGFuZCBub3QgdGhpcyBpbi10cmVlIHZlcnNpb24sIHRo
ZSBpbi10cmVlIGNvcHkgb2YgdGhlCj4gPiA+IGNvZGUgaXMgYWJhbmRvbmRlZCBhbmQgbm90IHVz
ZWQgYnkgYW55b25lLgo+ID4gPgo+ID4gPiBDb21iaW5lIHRoaXMgYWJhbmRvbmVkIGNvZGViYXNl
IHdpdGggdGhlIG5lZWQgdG8gbWFrZSBjaGFuZ2VzIHRvIGl0IGluCj4gPiA+IG9yZGVyIHRvIGtl
ZXAgdGhlIGtlcm5lbCBidWlsZGluZyBwcm9wZXJseSwgd2hpY2ggdGhlbiBjYXVzZXMgbWVyZ2UK
PiA+ID4gaXNzdWVzIHdoZW4gbWVyZ2luZyB0aG9zZSBjaGFuZ2VzIGludG8gdGhlIG91dC1vZi10
cmVlIEFuZHJvaWQgY29kZSwgYW5kCj4gPiA+IHlvdSBlbmQgdXAgd2l0aCB0d28gZGlmZmVyZW50
IGdyb3VwcyBvZiBwZW9wbGUgKHRoZSBpbi1rZXJuZWwtdHJlZQo+ID4gPiBkZXZlbG9wZXJzLCBh
bmQgdGhlIEFuZHJvaWQga2VybmVsIGRldmVsb3BlcnMpIHdobyBhcmUgYm90aCBhbm5veWVkIGF0
Cj4gPiA+IHRoZSBjdXJyZW50IHNpdHVhdGlvbi4gIEJlY2F1c2Ugb2YgdGhpcyBwcm9ibGVtLCBq
dXN0IGRyb3AgdGhlIGluLWtlcm5lbAo+ID4gPiBjb3B5IG9mIHRoZSBpb24gY29kZSBub3csIGFz
IGl0J3Mgbm90IHVzZWQsIGFuZCBpcyBvbmx5IGNhdXNpbmcgcHJvYmxlbXMKPiA+ID4gZm9yIGV2
ZXJ5b25lIGludm9sdmVkLgo+ID4gPgo+ID4gPiBDYzogIkFydmUgSGrDuG5uZXbDpWciIDxhcnZl
QGFuZHJvaWQuY29tPgo+ID4gPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4gPiA+IENjOiBDaHJpc3RpYW4gQnJhdW5lciA8Y2hyaXN0aWFuQGJyYXVu
ZXIuaW8+Cj4gPiA+IENjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+Cj4g
PiA+IENjOiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KPiA+ID4gQ2M6IEpv
ZWwgRmVybmFuZGVzIDxqb2VsQGpvZWxmZXJuYW5kZXMub3JnPgo+ID4gPiBDYzogSm9obiBTdHVs
dHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Cj4gPiA+IENjOiBMYXVyYSBBYmJvdHQgPGxhdXJh
QGxhYmJvdHQubmFtZT4KPiA+ID4gQ2M6IE1hcnRpam4gQ29lbmVuIDxtYWNvQGFuZHJvaWQuY29t
Pgo+ID4gPiBDYzogU2h1YWggS2hhbiA8c2h1YWhAa2VybmVsLm9yZz4KPiA+ID4gQ2M6IFN1bWl0
IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gPiA+IENjOiBTdXJlbiBCYWdoZGFz
YXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgo+ID4gPiBDYzogVG9kZCBLam9zIDx0a2pvc0BhbmRy
b2lkLmNvbT4KPiA+ID4gQ2M6IGRldmVsQGRyaXZlcmRldi5vc3Vvc2wub3JnCj4gPiA+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IENjOiBsaW5hcm8tbW0tc2lnQGxp
c3RzLmxpbmFyby5vcmcKPiA+ID4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxn
cmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiA+Cj4gPiBXZSBkaXNjdXNzZWQgdGhpcyBhdCB0
aGUgQW5kcm9pZCBNQyBvbiBNb25kYXkgYW5kIHRoZSBwbGFuIHdhcyB0bwo+ID4gcmVtb3ZlIGl0
IGFmdGVyIHRoZSBuZXh0IExUUyByZWxlYXNlLgo+Cj4gSSBrbm93IGl0IHdhcyBkaXNjdXNzZWQs
IG15IHBvaW50IGlzIHRoYXQgaXQgaXMgYWN0dWFsbHkgY2F1c2luZwo+IHByb2JsZW1zIG5vdyAo
d2l0aCBkZXZlbG9wZXJzIHdobyB3YW50IHRvIGNoYW5nZSB0aGUgaW50ZXJuYWwga2VybmVsIGFw
aQo+IGhpdHRpbmcgaXNzdWVzLCBhbmQgbmV3YmllcyB0cnlpbmcgdG8gY2xlYW4gdXAgY29kZSBp
biB3YXlzIHRoYXQgaXNuJ3QKPiBleGFjdGx5IG9wdGltYWwgd2FzdGluZyBtYWludGFpbmVyIGN5
Y2xlcyksIGFuZCB0aGF0IGFueW9uZSB3aG8gdXNlcwo+IHRoaXMgY29kZSwgaXMgbm90IGFjdHVh
bGx5IHVzaW5nIHRoaXMgdmVyc2lvbiBvZiB0aGUgY29kZS4gIEV2ZXJ5b25lIHdobwo+IHJlbGll
cyBvbiBpb24gcmlnaHQgbm93LCBpcyB1c2luZyB0aGUgdmVyc2lvbiB0aGF0IGlzIGluIHRoZSBB
bmRyb2lkCj4gY29tbW9uIGtlcm5lbCB0cmVlLCB3aGljaCBoYXMgZGl2ZXJnZWQgZnJvbSB0aGlz
IGluLWtlcm5lbCB3YXkgcXVpdGUgYQo+IGJpdCBub3cgZm9yIHRoZSByZWFzb24gdGhhdCB3ZSBk
aWRuJ3Qgd2FudCB0byB0YWtlIGFueSBvZiB0aG9zZSBuZXcKPiBmZWF0dXJlcyBpbiB0aGUgaW4t
a2VybmVsIHZlcnNpb24uCj4KPiBTbyB0aGlzIGlzIGEgcHJvYmxlbSB0aGF0IHdlIGhhdmUgY2F1
c2VkIGJ5IGp1c3Qgd2FudGluZyB0byB3YWl0LCBubyBvbmUKPiBpcyB1c2luZyB0aGlzIGNvZGUs
IGNvbWJpbmVkIHdpdGggaXQgY2F1c2luZyBwcm9ibGVtcyBmb3IgdGhlIHVwc3RyZWFtCj4gZGV2
ZWxvcGVycy4KPgo+IFRoZXJlIGlzIG5vdGhpbmcgIm1hZ2ljIiBhYm91dCB0aGUgbGFzdCBrZXJu
ZWwgb2YgdGhlIHllYXIgdGhhdCByZXF1aXJlcwo+IHRoaXMgY29kZSB0byBzaXQgaGVyZSB1bnRp
bCB0aGVuLiAgQXQgdGhhdCBwb2ludCBpbiB0aW1lLCBhbGwgdXNlcnMKPiB3aWxsLCBhZ2Fpbiwg
YmUgdXNpbmcgdGhlIGZvcmtlZCBBbmRyb2lkIGtlcm5lbCB2ZXJzaW9uLCBhbmQgaWYgd2UKPiBk
ZWxldGUgdGhpcyBub3cgaGVyZSwgdGhhdCBmb3JrIGNhbiByZW1haW4ganVzdCBmaW5lLCB3aXRo
IHRoZSBhZGRlZAo+IGJlbmlmaXQgb2YgaXQgcmVkdWNpbmcgZGV2ZWxvcGVyIHdvcmtsb2FkcyBo
ZXJlIGluLWtlcm5lbC4KPgo+IFNvIHdoeSB3YWl0PwoKSGksCgpJIGRvbid0IGtub3cgd2hhdCBp
cyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gaGVyZS4gSSBqdXN0IHdhbnQgdG8KaGlnaGxpZ2h0IHRo
YXQgQU9TUCdzIGF1ZGlvIChjb2RlYzIpIEhBTCBkZXBlbmRzIG9uIHRoZSBJT04gc3lzdGVtCmhl
YXAgYW5kIGl0IHdpbGwgYnJlYWsgQU9TUCBmb3IgcGVvcGxlIHdobyBib290IG1haW5saW5lIG9u
IHRoZWlyCmRldmljZXMsIGV2ZW4gZm9yIGp1c3QgdGVzdGluZyBwdXJwb3NlIGxpa2Ugd2UgZG8g
aW4gTGluYXJvLiBSaWdodCBub3cKd2UgbmVlZCBvbmx5IDEgKEFuZHJvaWQgc3BlY2lmaWMgb3V0
LW9mLXRyZWUpIHBhdGNoIHRvIGJvb3QgQU9TUCB3aXRoCm1haW5saW5lIGFuZCBTdW1pdCBpcyBh
bHJlYWR5IHRyeWluZyB0byB1cHN0cmVhbSB0aGF0IHZtYSBuYW1pbmcKcGF0Y2guIFJlbW92YWwg
b2YgaW4ta2VybmVsIElPTiwgd2lsbCBqdXN0IGFkZCBtb3JlIHRvIHRoYXQgZGVsdGEuCgpSZWdh
cmRzLApBbWl0IFB1bmRpcgoKPgo+IHRoYW5rcywKPgo+IGdyZWcgay1oCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
