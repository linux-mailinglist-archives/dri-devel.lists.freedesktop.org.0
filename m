Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204D168087
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 15:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AE76F461;
	Fri, 21 Feb 2020 14:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CED36F461
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 14:43:08 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id r137so1779469oie.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 06:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZHMsAfOo1o7x5MRiVUZtkpLZaK6MTsqL/9lr+DEhsvI=;
 b=el2f/KTFxe961EaU2kuYAfcxZYg8Q8Yer6ZUKMeEQ334xEa455bgaG1jBPKU/DaAR4
 DXBGkyOJhWwq6CJPsDCpwCZJu+kd8/+NyooPhFPtPuOLMdRhumTJufjMfkZXXib7tY04
 BV73sF/LO1c3AQAAGc0w4Zwhkkxt/LbOqmnR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZHMsAfOo1o7x5MRiVUZtkpLZaK6MTsqL/9lr+DEhsvI=;
 b=KcVYjXWVVBxN3WaMaWQnpu5UdRVmdqTk4rzS7ZuB1k1F1Z+s1NiiIE33u+dtcuOWP6
 rw7Lfx6hzd1T4GywO9bHPPnV4JdC88G+yyPPo6aAVN5kifCX5hIc6Lcy+r/U7pIAo0Gc
 rnIy9hTp6ngmYOWz3xdVRPPzTWnGTkb2owtw+/+LEutwzUjJUHAenjDGEwf5YoUg9ft7
 Jfc/ITOPffdSYeo5LiifkOKnZiLmMxUcmcf9urrzLJH+v7hNlXisoSZHekixgafiOngJ
 tkJzjc0QmVIJdMxnuY6pyDSwCr1+caFvn7kbi4vTT0afZ2e9spyMBXX69B/ciw1Vqu2W
 KiyA==
X-Gm-Message-State: APjAAAVJNRENcOT7w8xsxuCnHck9mcV3ycNdcRULjkSnwQMSK8pn+a70
 6Wf/zJLw5/7GjZtEiXMPYk3MilVqz3SSq/aFH9GLWw==
X-Google-Smtp-Source: APXvYqymizZi/dUeDqlmrxb0W9cAlTvQs99yiTAoVGBCbSaprG7a4bC37p7cPO5B6hlFV71sQELkzqLrJbCMi2ds08I=
X-Received: by 2002:aca:af09:: with SMTP id y9mr2147634oie.101.1582296187526; 
 Fri, 21 Feb 2020 06:43:07 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <CACvgo50pCb4OafEs9tLm7YEPqHc+BtDAvagRnwjXtZeQDNwUwg@mail.gmail.com>
 <20200220142759.GA13686@intel.com> <20200220153426.GC13686@intel.com>
 <871rqoyy42.fsf@intel.com> <20200221114309.GM13686@intel.com>
In-Reply-To: <20200221114309.GM13686@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 21 Feb 2020 15:42:56 +0100
Message-ID: <CAKMK7uGTpEHuBA09FuUA5ihPLtw7s+6=YBfQ2A4i=8Q-4SsRjA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 00/12] drm: Put drm_display_mode on diet
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMTI6NDMgUE0gVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEZlYiAyMSwgMjAyMCBh
dCAwMTozMjoyOVBNICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToKPiA+IE9uIFRodSwgMjAgRmVi
IDIwMjAsIFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdy
b3RlOgo+ID4gPiBMb29rcyBsaWtlIGdldHRpbmcgcmlkIG9mIHByaXZhdGVfZmxhZ3MgaXMgZ29p
bmcgdG8gYmUgcHJldHR5Cj4gPiA+IHN0cmFpZ2h0Zm9yd2FyZC4gSSdsbCBwb3N0IHBhdGNoZXMg
Zm9yIHRoYXQgb25jZSB0aGlzIGZpcnN0IHNlcmllcwo+ID4gPiBsYW5kcy4KPiA+Cj4gPiBHb2lu
ZyBhbGwgaW4gb24gY3J0YyBzdGF0ZT8gSSBzdXBwb3NlIG1pZ3JhdGluZyBhd2F5IGZyb20gcHJp
dmF0ZV9mbGFncwo+ID4gY291bGQgZWFzaWx5IHN0YXJ0IGluIGk5MTUgYmVmb3JlIHRoYXQuIFNl
ZW1zIHJhdGhlciBpbmRlcGVuZGVudC4KPiA+Cj4gPiBJIGd1ZXNzIGl0J3MgX19pbnRlbF9nZXRf
Y3J0Y19zY2FubGluZSgpIGFuZDoKPiA+Cj4gPiAgICAgICB2YmxhbmsgPSAmY3J0Yy0+YmFzZS5k
ZXYtPnZibGFua1tkcm1fY3J0Y19pbmRleCgmY3J0Yy0+YmFzZSldOwo+ID4gICAgICAgbW9kZSA9
ICZ2YmxhbmstPmh3bW9kZTsKPiA+Cj4gPiAgICAgICBpZiAobW9kZS0+cHJpdmF0ZV9mbGFncyAm
IEk5MTVfTU9ERV9GTEFHX0dFVF9TQ0FOTElORV9GUk9NX1RJTUVTVEFNUCkKPiA+Cj4gPiB0aGF0
IGdpdmVzIG1lIHRoZSBjcmVlcHMgaW4gcmV2aWV3aW5nIGFsbCB0aGF0Lgo+ID4KPiA+IFRoZXJl
J3MgYWxzbyBbMV0gYWRkaW5nIG5ldyB1c2VzIGZvciBwcml2YXRlX2ZsYWdzOyBJIHRoaW5rIHRo
ZXJlIHdlcmUKPiA+IGlzc3VlcyBpbiBnZXR0aW5nIGF0IHRoZSByaWdodCBjcnRjIHN0YXRlIG9u
IHNvbWUgb2YgdGhvc2UgcGF0aHMsIGJ1dCBJCj4gPiBmb3JnZXQgdGhlIGV4YWN0IGRldGFpbHMu
IElkZWFzPwo+Cj4gSSdtIGp1c3QgZ29pbmcgdG8gbW92ZSB0aGVtIHRvIHRoZSBjcnRjX3N0YXRl
IGFuZCBwdXQgYSBjb3B5IGludG8gdGhlCj4gY3J0YyBpdHNlbGYgZm9yIHRoZSB2YmxhbmsgY29k
ZS4gUHJldHR5IG11Y2ggYSAxOjEgcmVwbGFjZW1lbnQuCj4gU2F2ZXMgbWUgZnJvbSBoYXZpbmcg
dG8gdGhpbmsgOykKCkkndmUgbG9va2VkIHRocm91Z2ggdGhlIHBhdGNoZXMsIGFuZCBkaWRuJ3Qg
c3BvdCBhbnkgcGxhY2Ugd2hlcmUgd2UKY291bGRuJ3QganVzdCBnZXQgYXQgdGhlIGZ1bGwgY3J0
YyBzdGF0ZS4gTWlnaHQgbmVlZCBzb21lIGNydGMtPnN0YXRlCmRlcmVmZXJlbmNpbmcgYW5kIHVw
Y2FzdGluZyBhbmQgbWFraW5nIHN1cmUgc3R1ZmYgaXMgb3JkZXJlZCBjb3JyZWN0bHkKd2l0aCBl
bmFibGUvZGlzYWJsZSBwYXRocyBvZiBjcnRjLCBidXQgbm90aGluZyB0byBqdW1wIG92ZXIuCgpX
YXMgdGhpcyBtYXliZSBwcmVkYXRpbmcgdGhlIHN3aXRjaCBvZiB0aGUgdmJsYW5rIGNhbGxiYWNr
cyBvdmVyIGZyb20KZHJtX2RyaXZlciB0byBkcm1fY3J0Y19mdW5jcywgYW5kIGluIHRoZSBmb3Jt
ZXIgaXQncyBpbmRlZWQgbm90CnN1cGVyLW9idmlvdXMgdGhhdCB5b3UgY2FuIGp1c3QgbG9vayBh
dCB0aGUgY3J0Yz8gQW55d2F5LCBkaWRuJ3QgbG9vawpsaWtlIGl0IG5lZWRzIHByaXZhdGUgZmxh
Z3MgYXQgYWxsIGZyb20gYSBxdWljayBzY2FuLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAt
IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
