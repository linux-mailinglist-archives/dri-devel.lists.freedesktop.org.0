Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040FA69ADB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 20:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8307899B5;
	Mon, 15 Jul 2019 18:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E57899B5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 18:29:56 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 62so6834894lfa.8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VPvxiQHl/XpK5lt5vP4y2doBBzKLayLNDsJKONRA2Dk=;
 b=j9uZgFKY+NEmjyLIQzfk3UUT+zeA8ZvA1Drvd3Dh/meS+bJPvA6SphypuDGmLz5GNE
 oggJ+nT3S2N8DVLPB0xxmXa1nPpHh/oY0NNKdiJlCklH+VGT7u7BDHXwtuo9lNeXglbj
 K83tfF0Z+6xvPiobmPZ4Dcne0cM6G20nIUnMltRzyrWKyFHm9aROWgYZSIRD8rYGeUm8
 62vgXkGm7D8Dy2a3OgkDhFepYQEdVSKGj/Tm+84Idyr4++3yG2MYOtht3dVoQqKaQ9lu
 081b7fq5z4PAyKlHLV6oMErG/TdK8NDbqjq3oKQPGoESNA7Hk8eAM5J5TAP3Wj4nzc/U
 N5xA==
X-Gm-Message-State: APjAAAXtFYaC3BC6mKf7jlJ9KvXxKKZzmi4bQ+1PXCIx96Axei5kkEcx
 iMzpZpAaXKsb0CuXD6DA721VzeW8pr7b7iHvmq6V5w==
X-Google-Smtp-Source: APXvYqxJQm3ccb14HTwtnHx4Exld8ZB4jKosY+0FKtFAlSN7DSp6Z+JsME4XcBlP9PCCczxTN+kvpkGM8EErT8/97CM=
X-Received: by 2002:a19:e006:: with SMTP id x6mr11939257lfg.165.1563215395101; 
 Mon, 15 Jul 2019 11:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9twvwhm318btWy_WkQxOcpRCzjpok52R8zPQxQrnQ8QzwQ@mail.gmail.com>
 <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
 <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
In-Reply-To: <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 16 Jul 2019 04:29:43 +1000
Message-ID: <CAPM=9tx9N=qDnt8sn6dMw4BmfPwh-qNPGXDg5FA5fh5hKmooEA@mail.gmail.com>
Subject: Re: drm pull for v5.3-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VPvxiQHl/XpK5lt5vP4y2doBBzKLayLNDsJKONRA2Dk=;
 b=tV/deThLDZe31WMO8nTAh9K9TM0jW5+vMT1NfhxHMROxn7FA6/BczTC5ocyHago83Z
 O18gjZTkFK21kgxUnQr8esifjPBhbkr5tlhS1Ddi9aHdScCuFDB634IRJvJbY6G29uMx
 26XTzBnaJfmG7iXifLRBSQEu0pmt8nf3U/HG8Mfejp2USFrtfBbI3zY9od43QvNQ//Aq
 q5G4wgd7DMK8vFYZJrO1GxqFyQ+O8Yarbx0SgwUzHsHcYVkEE3rKX7SW/jHltuQcFcqO
 RIL4MqFHzL9vIiXLjdsC63P2f7v5tyiw3FbxTwQetXrHK6sYughpntfz0MgD4wNm5WdB
 vIfg==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNiBKdWwgMjAxOSBhdCAwNDowMCwgTGludXMgVG9ydmFsZHMKPHRvcnZhbGRzQGxp
bnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDE1LCAyMDE5IGF0IDEw
OjM3IEFNIExpbnVzIFRvcnZhbGRzCj4gPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3
cm90ZToKPiA+Cj4gPiBJJ20gbm90IHB1bGxpbmcgdGhpcy4gV2h5IGRpZCB5b3UgbWVyZ2UgaXQg
aW50byB5b3VyIHRyZWUsIHdoZW4KPiA+IGFwcGFyZW50bHkgeW91IHdlcmUgYXdhcmUgb2YgaG93
IHF1ZXN0aW9uYWJsZSBpdCBpcyBqdWRnaW5nIGJ5IHRoZSBkcm0KPiA+IHB1bGwgcmVxdWVzdC4K
Pgo+IExvb2tpbmcgYXQgc29tZSBvZiB0aGUgZmFsbG91dCwgSSBhbHNvIHNlZSB0aGF0IHlvdSB0
aGVuIGFkZGVkIHRoYXQKPiAiYWRqdXN0IGFwcGx5X3RvX3Bmbl9yYW5nZSBpbnRlcmZhY2UgZm9y
IGRyb3BwZWQgdG9rZW4iIHBhdGNoIHRoYXQKPiBzZWVtcyB0byBiZSBmb3IgZWFzaWVyIG1lcmdp
bmcgb2YgdGhpcyBhbGwuCj4KPiBCdXQgeW91IHJlbW92ZSB0aGUgJ3Rva2VuJyBlbnRpcmVseSBp
biBvbmUgcGxhY2UsIGFuZCBpbiBhbm90aGVyIHlvdQo+IGtlZXAgaXQgYW5kIGp1c3Qgc2F5ICJ3
aGF0ZXZlciwgaXQncyB1bnVzZWQsIHBhc3MgaW4gTlVMTCIuIFdIQUE/CgpOb3QgdGhhdCBJIHdh
bnQgdG8gZGVmZW5kIHRoYXQgY29kZSwgYnV0IHRoZSBtbSBwYXRjaCB0aGF0IGNvbmZsaWN0cwph
bHJlYWR5IHNob3dzIHRoYXQgcmVtb3ZpbmcgdGhlIHRva2VuIGlzIGZpbmUgYXMgbm9ib2R5IG5l
ZWRzIG9yCnJlcXVpcmVzIGl0LiBTbyB0aGUgZml4dXAgcGF0Y2ggaW4gbXkgdHJlZSB3YXMganVz
dCBhIGJyaWRnZSB0byB0aGF0IHBhdGNoLAp3aGljaCByZWR1Y2VzIGNvbmZsaWN0cy4gUmlwIHRo
ZSB0b2tlbiBvdXQgb2YgdGhlIG5ldyBBUEksIHBhc3MgaXQgYXMgTlVMTAp0byB0aGUgb2xkIEFQ
SSB1bnRpbCB0aGUgbW0gcGF0Y2ggaXMgbWVyZ2VkIGFnYWluc3QgaXQgd2hpY2ggZHJvcHMgdGhl
CnRva2VuIGZyb20gdGhlIG9sZCBBUEkuCgpEYXZlLgoKPgo+IEFzIHBhcnQgb2YgbG9va2luZyBh
dCB0aGlzIGFsbCwgSSBhbHNvIG5vdGUgdGhhdCBzb21lIG9mIHRoaXMgaXMgYWxzbwo+IHZlcnkg
bm9uLWtlcm5lbHkuCj4KPiBUaGUgd2hvbGUgdGhpbmcgd2l0aCB0cnlpbmcgdG8gaW1wbGVtZW50
IGEgImNsb3N1cmUiIGluIEMgaXMgc2ltcGx5Cj4gbm90IGhvdyB3ZSBkbyB0aGluZ3MgaW4gdGhl
IGtlcm5lbCAoYWx0aG91Z2ggSSd2ZSBhZG1pdHRlZGx5IHNlZW4KPiBzaWducyBvZiBpdCBpbiBz
b21lIGRyaXZlcnMpLgo+Cj4gSWYgdGhpcyBzaG91bGQgYmUgZG9uZSBhdCBhbGwgKGFuZCB0aGF0
J3MgcXVlc3Rpb25hYmxlKSwgYXQgbGVhc3QgZG8KPiBpdCBpbiB0aGUgY2Fub25pY2FsIGtlcm5l
bCB3YXk6IHBhc3MgaW4gYSBzZXBhcmF0ZSAiYWN0b3IiIGZ1bmN0aW9uCj4gcG9pbnRlciBhbmQg
YW4gYXJndW1lbnQgYmxvY2ssIGRvbid0IHRyeSB0byBtaXggZnVuY3Rpb24gcG9pbnRlcnMgYW5k
Cj4gYXJndW1lbnQgZGF0YSBhbmQgY2FsbCBpdCBhICJjbG9zdXJlIi4KPgo+IFdlIHRyeSB0byBr
ZWVwIGRhdGEgYW5kIGZ1bmN0aW9ucyBzZXBhcmF0ZS4gSXQncyBub3QgZXZlbiBmb3Igc2VjdXJp
dHkKPiBjb25jZXJucyAoYWx0aG91Z2ggdGhvc2UgaGF2ZSBjYXVzZWQgc29tZSBzcGxpdHMgaW4g
dGhlIHBhc3QgLSBhdm9pZAo+IHB1dHRpbmcgZnVuY3Rpb24gcG9pbnRlcnMgaW4gc3RydWN0dXJl
cyB0aGF0IHlvdSB0aGVuIGNhbid0IG1hcmsKPiByZWFkLW9ubHkhKSwgaXQncyBhIG1vcmUgZ2Vu
ZXJpYyBpc3N1ZSBvZiBqdXN0IGtlZXBpbmcgYXJndW1lbnRzIGFzCj4gYXJndW1lbnRzIC0gZXZl
biBpZiB5b3UgdGhlbiBtYWtlIGEgc3RydWN0dXJlIG9mIHRoZW0gaW4gb3JkZXIgdG8gbm90Cj4g
bWFrZSB0aGUgY2FsbGluZyBjb252ZW50aW9uIHZlcnkgY29tcGxpY2F0ZWQuCj4KPiAoWWVzLCB3
ZSBkbyBoYXZlIHRoZSBwYXR0ZXJuIG9mIHNvbWV0aW1lcyBtaXhpbmcgZnVuY3Rpb24gcG9pbnRl
cnMKPiB3aXRoICJkZXNjcmliaW5nIGRhdGEiLCBpZSB0aGUgInN0cnVjdCBmaWxlX29wZXJhdGlv
bnMiIHN0cnVjdHVyZQo+IGlzbid0IF9qdXN0XyBhY3R1YWwgZnVuY3Rpb24gcG9pbnRlcnMsIGl0
IGFsc28gY29udGFpbnMgdGhlIG1vZHVsZQo+IG93bmVyLCBmb3IgZXhhbXBsZS4gQnV0IHRob3Nl
IGFyZW4ndCBhYm91dCBtaXhpbmcgZnVuY3Rpb24gcG9pbnRlcnMKPiB3aXRoIHRoZWlyIGFyZ3Vt
ZW50cywgaXQncyBhYm91dCBiYXNpY2FsbHkgImRlc2NyaWJpbmciIGFuIG9iamVjdAo+IGludGVy
ZmFjZSB3aXRoIG1vcmUgdGhhbiBqdXN0IHRoZSBvcGVyYXRpb24gcG9pbnRlcnMpLgo+Cj4gU28g
c29tZSBvZiB0aGlzIGNvZGUgaXMgc3R1ZmYgdGhhdCBJIHdvdWxkIGhhdmUgbGV0IGdvIGlmIGl0
IHdhcyBpbgo+IHNvbWUgaW5kaXZpZHVhbCBkcml2ZXIgKCJDbG9zdXJlcz8gQyBkb2Vzbid0IGhh
dmUgY2xvc3VyZXMhIEJ1dAo+IHdoYXRldmVyIC0gdGhhdCBkcml2ZXIgd3JpdGVyIGNhbWUgZnJv
bSBzb21lIHBsYWNlIHRoYXQgdGF1Z2h0IGxhbWRhCj4gY2FsY3VsdXMgYmVmb3JlIHRlY2huaW5n
IEMiKS4KPgo+IEJ1dCBpbiB0aGUgY29yZSBtbSBjb2RlLCBJIHdhbnQgcmV2aWV3cy4gQW5kIEkg
d2FudCB0aGUgY29kZSB0byBmb2xsb3cKPiBub3JtYWwga2VybmVsIGNvbnZlbnRpb25zLgo+Cj4g
ICAgICAgICAgICAgICAgICAgIExpbnVzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
