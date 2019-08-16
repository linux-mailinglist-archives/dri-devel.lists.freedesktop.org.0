Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6C2903B6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 16:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149956E440;
	Fri, 16 Aug 2019 14:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4BC6E33D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 14:11:47 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id 16so4890237oiq.6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 07:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yssxgr/R6OQdplSnDNsdTRBQMibjMIg4+OgGLQyMPwk=;
 b=Xgb7qiwnWEJ2LvugHbsIm/G8qjIOsjOCXT84T/iGssT9QYxJHKI4T30+bFEPI5xXQH
 xvGMfwVTpj1h+ufzBivYdwLb83wQEu8i/I5gEPhGU4y5p5lQwahKBXShvhotOu+GRLU4
 nsy/rX3mdRFwtmo7gYD4cGz30kbja8LsPnHeSxTouHx32a13RtXzLOe1dcxfsBk4R36l
 VSgdKLPw7L5xZ/goV99IkP6wv3nDC8H9ajD1mIV5WdA6FUPBhgIE8gwa4EfWA51LU+sR
 0yDRZgY/UpgixvkieB1tE6Z1I5ommTMLpfOJAa91tk+CdNVeBy4kxndkxRGpVv3oCzqb
 AIlQ==
X-Gm-Message-State: APjAAAX3ZaXs4Lq7GKRI1SuqX4ftu/2UwIDwrkO2CecYi044qIbkHdhR
 gKve3KNX2sVWWZJr6WbKGMiuDiaWMeR1vqAKDFTtgw==
X-Google-Smtp-Source: APXvYqx2XgL7KeHyryZ4+8xqmn4BItCVHB9tDtZdlS5rAComTkGY2660h6IEE51SBGH2skdFu1E3ye0pzcKw0PqZrbI=
X-Received: by 2002:aca:1a0b:: with SMTP id a11mr5297448oia.128.1565964706931; 
 Fri, 16 Aug 2019 07:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz> <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
 <20190815202721.GV21596@ziepe.ca>
 <CAKMK7uER0u1TqeJBXarKakphnyZTHOmedOfXXqLGVDE2mE-mAQ@mail.gmail.com>
 <20190816010036.GA9915@ziepe.ca>
 <CAKMK7uH0oa10LoCiEbj1NqAfWitbdOa-jQm9hM=iNL-=8gH9nw@mail.gmail.com>
 <20190816121243.GB5398@ziepe.ca>
In-Reply-To: <20190816121243.GB5398@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Aug 2019 16:11:34 +0200
Message-ID: <CAKMK7uHk03OD+N-anPf-ADPzvQJ_NbQXFh5WsVUo-Ewv9vcOAw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/5] kernel.h: Add non_block_start/end()
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Yssxgr/R6OQdplSnDNsdTRBQMibjMIg4+OgGLQyMPwk=;
 b=iKfxKoMvF7fYuHqtxhMdeLtiTE/pTTZEGguyp0+hucFHluJ5kX2VIkLSCTNrBBI4hS
 m75gSd95L78hr4hdAIJz7abvXf9heA1zVnFk/Tff1ZGBb79t7v6ncV9jdxtpQZTpEg9o
 H6oav0M6pZU1zPqylhHo7uj1Ld1HrZ7uYQ70Q=
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
Cc: Feng Tang <feng.tang@intel.com>, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMjoxMiBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAwODoyMDo1NUFNICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMzowMCBB
TSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4gd3JvdGU6Cj4gPiA+IE9uIFRodSwgQXVn
IDE1LCAyMDE5IGF0IDEwOjQ5OjMxUE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+
ID4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MjcgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dA
emllcGUuY2E+IHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MTY6
NDNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gPiA+ID4gU28gaWYgc29tZW9u
ZSBjYW4gZXhwbGFpbiB0byBtZSBob3cgdGhhdCB3b3JrcyB3aXRoIGxvY2tkZXAgSSBjYW4gb2YK
PiA+ID4gPiA+ID4gY291cnNlIGltcGxlbWVudCBpdC4gQnV0IGFmYWljcyB0aGF0IGRvZXNuJ3Qg
ZXhpc3QgKEkgdHJpZWQgdG8gZXhwbGFpbgo+ID4gPiA+ID4gPiB0aGF0IHNvbWV3aGVyZSBlbHNl
IGFscmVhZHkpLCBhbmQgSSdtIG5vIHJlYWxseSBsb29raW5nIGZvcndhcmQgdG8KPiA+ID4gPiA+
ID4gaGFja2luZyBhbHNvIG9uIGxvY2tkZXAgZm9yIHRoaXMgbGl0dGxlIHNlcmllcy4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBIbW0sIGtpbmQgb2YgbG9va3MgbGlrZSBpdCBpcyBkb25lIGJ5IGNhbGxp
bmcgcHJlZW1wdF9kaXNhYmxlKCkKPiA+ID4gPgo+ID4gPiA+IFl1cC4gVGhhdCB3YXMgdjEsIHRo
ZW4gY2FtZSB0aGUgc3VnZ2VzdGlvbiB0aGF0IGRpc2FibGluZyBwcmVlbXB0aW9uCj4gPiA+ID4g
aXMgbWF5YmUgbm90IHRoZSBiZXN0IHRoaW5nICh0aGUgb29tIHJlYXBlciBjb3VsZCBzdGlsbCBy
dW4gZm9yIGEgbG9uZwo+ID4gPiA+IHRpbWUgY29tcGFyYXRpdmVseSwgaWYgaXQncyBjbGVhbmlu
ZyBvdXQgZ2lnYWJ5dGVzIG9mIHByb2Nlc3MgbWVtb3J5Cj4gPiA+ID4gb3Igd2hhdCBub3QsIGhl
bmNlIHRoaXMgZGVkaWNhdGVkIGRlYnVnIGluZnJhc3RydWN0dXJlKS4KPiA+ID4KPiA+ID4gT2gs
IEknbSBjb21pbmcgaW4gbGF0ZSwgc29ycnkKPiA+ID4KPiA+ID4gQW55aG93LCBJIHdhcyB0aGlu
a2luZyBzaW5jZSB3ZSBhZ3JlZWQgdGhpcyBjYW4gdHJpZ2dlciBvbiBzb21lCj4gPiA+IENPTkZJ
R19ERUJVRyBmbGFnLCBzb21ldGhpbmcgbGlrZQo+ID4gPgo+ID4gPiAgICAgLyogVGhpcyBpcyBh
IHNsZWVwYWJsZSByZWdpb24sIGJ1dCB1c2UgcHJlZW1wdF9kaXNhYmxlIHRvIGdldCBkZWJ1Z2dp
bmcKPiA+ID4gICAgICAqIGZvciBjYWxscyB0aGF0IGFyZSBub3QgYWxsb3dlZCB0byBibG9jayBm
b3IgT09NIFsuLiBpbnNlcnQKPiA+ID4gICAgICAqIE1pY2hhbCdzIGV4cGxhbmF0aW9uLi4gXSAq
Lwo+ID4gPiAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0RFQlVHX0FUT01JQ19TTEVFUCkgJiYg
IW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpKQo+ID4gPiAgICAgICAgIHByZWVt
cHRfZGlzYWJsZSgpOwo+ID4gPiAgICAgb3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCk7Cj4g
Pgo+ID4gSSB0aGluayB3ZSBhbHNvIGRpc2N1c3NlZCB0aGF0LCBhbmQgc29tZSBleHByZXNzZWQg
Y29uY2VybnMgaXQgd291bGQKPiA+IGNoYW5nZSBiZWhhdmlvdXIvdGltaW5nIHRvbyBtdWNoIGZv
ciB0ZXN0aW5nLiBTaW5jZSB0aGlzIGRvZXMgZG9lcwo+ID4gZGlzYWJsZSBwcmVlbXB0aW9uIGZv
ciByZWFsLCBub3QganVzdCBmb3IgbWlnaHRfc2xlZXAuCj4KPiBJIGRvbid0IGZvbGxvdywgdGhp
cyBpcyBhIGRlYnVnIGtlcm5lbCwgaXQgd2lsbCBoYXZlIHdpZGx5IGRpZmZlcmVudAo+IHRpbWlu
Zy4KPgo+IEZ1cnRoZXIgdGhlIHBvaW50IG9mIHRoaXMgZGVidWdnaW5nIG9uIGF0b21pY19zbGVl
cCBpcyB0byBiZSBhcwo+IHRpbWluZy1pbmRlcGVuZGVudCBhcyBwb3NzaWJsZSBzaW5jZSBmdW5j
dGlvbnMgd2l0aCByYXJlIHNsZWVwcyBzaG91bGQKPiBiZSBndWFyZGVkIGJ5IG1pZ2h0X3NsZWVw
KCkgaW4gdGhlaXIgY29tbW9uIHBhdGhzLgo+Cj4gSSBndWVzcyBJIGRvbid0IGdldCB0aGUgcHVz
aCB0byBoYXZlIHNvbWUgbG93IG92ZXJoZWFkIGRlYnVnZ2luZyBmb3IKPiB0aGlzPyBJcyB0aGVy
ZSBzb21ldGhpbmcgc3BlY2lhbCB5b3UgYXJlIGxvb2tpbmcgZm9yPwoKRG9uJ3QgYXNrIG1lLCBJ
J20ganVzdCB0cnlpbmcgdG8gZ2V0IF9zb21lXyBkZWJ1Z2dpbmcgZm9yIHRoaXMgaW4uIEkKZG9u
J3QgY2FyZSBvbmUgYml0IGhvdyBtdWNoIG92ZXJoZWFkIGl0IGhhcyBiZWNhdXNlIGluIG91ciBD
SSBvdXIKZGVidWcgYnVpbGQgaGFzIGxvY2tkZXAgYW5kIGV2ZXJ5dGhpbmcgYW5kIGl0IGNyYXds
cyBhbnl3YXkuIEkgc3RhcnRlZApvdXQgd2l0aCB0aGUgcHJlZW1wdF9kaXNhYmxlL2VuYWJsZSB0
aGluZyBsaWtlIHlvdSBzdWdnZXN0ZWQsIGFuZCBhCmZldyByb3VuZHMgbGF0ZXIgd2UncmUgaGVy
ZS4gV2UgY2FuIGdvIGJhY2sgdG8gdjEgb24gdGhpcyBvbmUsIGJ1dCBJJ2QKcHJlZmVyIHRvIG5v
dCBkbyB0aGUgbGFwIHRvbyBvZnRlbi4KCkFsc28sIGFzaWRlIGZyb20gdGhpcyBwYXRjaCAod2hp
Y2ggaXMgcHJlcCBmb3IgdGhlIG5leHQpIGFuZCBzb21lCnNpbXBsZSByZW9yZGVyaW5nIGNvbmZs
aWN0cyB0aGV5J3JlIGFsbCBpbmRlcGVuZGVudC4gU28gaWYgdGhlcmUncyBubwp3YXkgdG8gcGFp
bnQgdGhpcyBiaWtlc2hlZCBoZXJlICh0ZWNobmljb2xvciBwZXJoYXBzPykgdGhlbiBJJ2QgbGlr
ZQp0byBnZXQgYXQgbGVhc3QgdGhlIG90aGVycyBjb25zaWRlcmVkLgotRGFuaWVsCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5
IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
