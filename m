Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992C19AA6B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 10:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9454D6EC27;
	Fri, 23 Aug 2019 08:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE9A6EC27
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 08:34:14 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id f17so8084223otq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 01:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2wI4jnej8AspWUXE13reusEb4wx5ZdHi/mO0D9XYtEg=;
 b=kLHeCubjXpVR4ot6ll/JhS1qLbgA8OAaWNmCYDjOzJTNoN0Uyolphv0YSgAv867hDG
 JewqVLJT3LYdhgAL7H4F/Z21tDKtNfJ57MSQLwTFvXBQ/Y0nWTrb7EQtgfDjdxG5kkc6
 3zPzsWLbvgOQkGDsbDVd5ad/6PqRnMcz2yRix6GGm9ayfPjSB4DZLBQ6C2ZBzGXy4ypG
 LLlquEuv1qqa7dtBlCUfetqtUJDHzk2c3JbyGVotBLkBXRgujiqmYkdlQxzSajVdarOh
 hfLd5DZ+KT6PTN0OE4bVByC1Az/vM7jMo1KoOt7cPjLIHJNQHw0QzYe6ONHkXvj95eTv
 Duqw==
X-Gm-Message-State: APjAAAXrZt/SUCvZpUIht1s+ZNT06JYoi+P+YprTgH43UarxrVHI8s03
 ULfINhZOZ9/qgEcuqmWhtM9g24OljCmimzb841zIwQ==
X-Google-Smtp-Source: APXvYqySGMSx76GQciFyarc45Uaxat2fi1EkKKRAKJHDAgSYk4ycOdQtf+zAg8LRPPEFSKLE0nTWT6z30G/6Y2FEpF0=
X-Received: by 2002:a9d:7006:: with SMTP id k6mr3113253otj.303.1566549253448; 
 Fri, 23 Aug 2019 01:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-4-daniel.vetter@ffwll.ch>
 <20190820202440.GH11147@phenom.ffwll.local>
 <20190822161428.c9e4479207386d34745ea111@linux-foundation.org>
In-Reply-To: <20190822161428.c9e4479207386d34745ea111@linux-foundation.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 23 Aug 2019 10:34:01 +0200
Message-ID: <CAKMK7uGw_7uD=wH3bcR9xXSxAcAuYTLOZt3ue4TEvst1D0KzLQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] kernel.h: Add non_block_start/end()
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=2wI4jnej8AspWUXE13reusEb4wx5ZdHi/mO0D9XYtEg=;
 b=aeC3TxV0j2A92x3gKbNcF7bCggKdYhKlcyjxAhb5hfIRm+pYMjP86E3zP6iPTYa0CW
 V4FP5NjHd9HiRZopamKaKgTN9DoDP1olhMwISRwQM8srvpF0JbA28Xs/5rV6oXCqpMTX
 iTLRFwvLICz57Ol4za0Kp8tRS9HWt94Uo/ni8=
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
Cc: Feng Tang <feng.tang@intel.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <keescook@chromium.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMToxNCBBTSBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4
LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgMjAgQXVnIDIwMTkgMjI6MjQ6NDAg
KzAyMDAgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPgo+ID4gSGkgUGV0
ZXIsCj4gPgo+ID4gSWlyYyB5b3UndmUgYmVlbiBpbnZvbHZlZCBhdCBsZWFzdCBzb21ld2hhdCBp
biBkaXNjdXNzaW5nIHRoaXMuIC1tbSBmb2xrcwo+ID4gYXJlIGEgYml0IHVuZGVjaWRlZCB3aGV0
aGVyIHRoZXNlIG5ldyBub25fYmxvY2sgc2VtYW50aWNzIGFyZSBhIGdvb2QgaWRlYS4KPiA+IE1p
Y2hhbCBIb2NrbyBzdGlsbCBpcyBpbiBzdXBwb3J0LCBidXQgQW5kcmV3IE1vcnRvbiBhbmQgSmFz
b24gR3VudGhvcnBlCj4gPiBhcmUgbGVzcyBlbnRodXNpYXN0aWMuIEphc29uIHNhaWQgaGUncyBv
ayB3aXRoIG1lcmdpbmcgdGhlIGhtbSBzaWRlIG9mCj4gPiB0aGlzIGlmIHNjaGVkdWxlciBmb2xr
cyBhY2suIElmIG5vdCwgdGhlbiBJJ2xsIHJlc3BpbiB3aXRoIHRoZQo+ID4gcHJlZW1wdF9kaXNh
YmxlL2VuYWJsZSBpbnN0ZWFkIGxpa2UgaW4gdjEuCj4KPiBJIGJlY2FtZSBtb2xsaWZpZWQgb25j
ZSBNaWNoZWwgZXhwbGFpbmVkIHRoZSByYXRpb25hbGUuICBJIHRoaW5rIGl0J3MKPiBPSy4gIEl0
J3MgdmVyeSBzcGVjaWZpYyB0byB0aGUgb29tIHJlYXBlciBhbmQgaG9wZWZ1bGx5IHdvbid0IGJl
IHVzZWQKPiBtb3JlIHdpZGVseSg/KS4KClllYWgsIG5vIHBsYW5zIGZvciB0aGF0IGZyb20gbWUu
IEFuZCBJIGhvcGUgdGhlIGNvbW1lbnQgYWJvdmUgdGhlbSBub3cKZXhwbGFpbnMgd2h5IHRoZXkg
ZXhpc3QsIHNvIHBlb3BsZSB0aGluayB0d2ljZSBiZWZvcmUgdXNpbmcgaXQgaW4KcmFuZG9tIHBs
YWNlcy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
