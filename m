Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00A069026
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 16:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62E989359;
	Mon, 15 Jul 2019 14:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C704A89359
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 14:19:39 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id l12so12771441oil.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 07:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=74LWTKonskxRfxiDYwVD7OpNsKbfOfYFfTZAvmrPFJg=;
 b=d637ASaprRcY8Ri5QJRdTFOGnvaA8HU4UxDV/8y0VNwFL8Jcb01K1/zDunZx9yyol1
 m5+Qh/r7sOwWfQQB8EyRDnpBf5O0dBMOK6DmXAJjybZjNg00DD7IHhhyhodrdPmzSonJ
 TJ3TRBb0nFCz94ubuMrAzwOSRBMc4duo7ZKwSz7l1duv0LI5ouhf94wxq0okEnmTrwdp
 FqpEx8SEanDm+eQ2qLVTZ4jT44+7r9FQ7HCS9rTiTGtxkRw50l53BW5BwtlgxxAu9U00
 tGj9sgojiBhvs98F8Juz6BsjsldrDlp43EF9IGUVXJXqafRssGjqOufgTefNBOhw3atN
 OprQ==
X-Gm-Message-State: APjAAAWtcLZdQ0B9/ckHK5rHn5KZkbnzuBErpQxjj9Jvb+wqiAxYy/RJ
 sQVf4tVXDjIsu59rrXb0VUaMIg+t6GSDKSiQEr8=
X-Google-Smtp-Source: APXvYqx9+tVgh5v+w5/XYZec+gr4t4ZX0LQfnl+mzXMZ66oi07oxVvsNmRa3kHVSBsjT45GtQ+mVBCop0D+NIq3ehcA=
X-Received: by 2002:aca:b2d5:: with SMTP id
 b204mr11927663oif.101.1563200378969; 
 Mon, 15 Jul 2019 07:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9tx+CEkzmLZ-93GZmde9xzJ_rw3PJZxFu_pjZJc7KM5f-w@mail.gmail.com>
 <20190715122924.GA15202@mellanox.com>
In-Reply-To: <20190715122924.GA15202@mellanox.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 15 Jul 2019 16:19:26 +0200
Message-ID: <CAKMK7uHvjuQ5Dqm0LPrtQxdHh5Z6Pt2mg4AnpRRR0gWb1Wp05g@mail.gmail.com>
Subject: Re: DRM pull for v5.3-rc1
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=74LWTKonskxRfxiDYwVD7OpNsKbfOfYFfTZAvmrPFJg=;
 b=kiTItl6xyrG9FywIDRfcy4DIFgA9n5FQMjm2wL9mdgzuKSnbt3nESPsNKfqPBueZBs
 RaocmVPDYXFtDrI4ysRzoObj0qDrpjOvB+wDyHYfLEV64FkHNR3uH95XLhXfJ6ufu+HZ
 p8X+m5T0N8pujQ2DcVZL1lXs5oJQY92Qy3HYA=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Hellstrom <thellstrom@vmware.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMjoyOSBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gW3VyaywgaHRtbCBlbWFpbC4uIGZvcmdpdmUgdGhlIG1lc3Nd
Cj4KPiBPbiBNb24sIEp1bCAxNSwgMjAxOSBhdCAwNDo1OTozOVBNICsxMDAwLCBEYXZlIEFpcmxp
ZSB3cm90ZToKPgo+ID4gICAgICBWTXdhcmUgaGFkIHNvbWUgbW0gaGVscGVycyBnbyBpbiB2aWEg
bXkgdHJlZSAobG9va2luZyBiYWNrIEknbQo+ID4gICAgICBub3Qgc3VyZSBUaG9tYXMgcmVhbGx5
IHNlY3VyZWQgZW5vdWdoIGFja3Mgb24gdGhlc2UsIGJ1dCBJJ20KPgo+IEkgc2F3IHRob3NlIHBh
dGNoZXMsIGhvbmVzdGx5IEkgY291bGRuJ3QgZW50aXJlbHkgdW5kZXJzdGFuZCB3aGF0Cj4gcHJv
YmxlbSB0aGV5IHdlcmUgdHJ5aW5nIHRvIGFkZHJlc3MuLgo+Cj4gPiAgICAgIGdvaW5nIHdpdGgg
aXQgZm9yIG5vdyB1bnRpbCBJIGdldCBwdXNoIGJhY2spLiBUaGV5IGNvbmZsaWN0ZWQKPiA+ICAg
ICAgd2l0aCBvbmUgb2YgdGhlIG1tIGNsZWFudXBzIGluIHRoZSBobW0gdHJlZSwgSSd2ZSBwdXNo
ZWQgYQo+ID4gICAgICBwYXRjaCB0byB0aGUgdG9wIG9mIG15IG5leHQgdG8gZml4IG1vc3Qgb2Yg
dGhlIGZhbGxvdXQgaW4gbXkKPiA+ICAgICAgdHJlZSwgYW5kIHRoZSByZXN1bHRpbmcgZml4dXAg
aXMgdG8gcGljayB0aGUgY2xvc3VyZS0+cHRlZm4KPiA+ICAgICAgaHVuayBhbmQgYXBwbHkgc29t
ZXRoaW5nIGxpa2UgaW4gbW0vbWVtb3J5LmMKPgo+IERpZCBJIG1lc3MgYSBub3RpZmljYXRpb24g
ZnJvbSBTdGVwaGVuUiBpbiBsaW51eC1uZXh0PyBJIHdhcyB1bndhd2FyZQo+IG9mIHRoaXMgY29u
ZmxpY3Q/Cj4KPiBUaGUgJ2htbScgdHJlZSBpcyBzb21ldGhpbmcgSSByYW4gdG8gdHJ5IGFuZCBo
ZWxwIHdvcmtmbG93IGlzc3VlcyBsaWtlCj4gdGhpcywgYXMgaXQgY291bGQgYmUgbWVyZ2VkIHRv
IERSTSBhcyBhIHRvcGljIGJyYW5jaCAtIG1heWJlIGNvbnNpZGVyCj4gdGhpcyBmbG93IGluIGZ1
dHVyZT8KPgo+IExpbnVzLCBkbyB5b3UgaGF2ZSBhbnkgYWR2aWNlIG9uIGhvdyBiZXN0IHRvIGhh
bmRsZSBzaGFyaW5nIG1tCj4gcGF0Y2hlcz8gVGhlIGhtbS5naXQgd2FzIG1pbGRseSBwYWluZnVs
IGFzIGl0IHNpdHMgYmV0d2VlbiBxdWlsdCBvbgo+IHRoZSAtbW0gc2lkZSBhbmQgd2hhdCBzZWVt
cyBsaWtlICdhIHdvcmxkIG9mIGludGVyZXN0aW5nIGdpdCB0aGluZ3MnCj4gb24gdGhlIERSTSBz
aWRlIChidXQgbWF5YmUgSSBqdXN0IGRvbid0IGtub3cgZW5vdWdoIGFib3V0IERSTSkuCgpJIHRo
aW5rIHRoZSBhcHByb2FjaCBpbiB0aGlzIG1lcmdlIHdpbmRvdyB3b3JrZWQgZmFpcmx5IHdlbGw6
Ci0gcmVmYWN0b3IvcmV3b3JrIGNvcmUgbW0gc3R1ZmYgaW4gKGgpbW0uZ2l0Ci0gaGFuZGxlIGFs
bCB0aGUgZ3B1IHN0dWZmIGluIGRybS5naXQKLSBtYWtlIHRoZSBjbGFzaGVzIHdvcmthYmxlIHRo
cm91Z2ggc29tZSBjbGV2ZXIgcHJlcCBwYXRjaGVzIGxpa2UKd2UndmUgZG9uZSB0aGlzIHRpbWUg
YXJvdW5kCgpJIHRoaW5rIExpbnVzIHdhbnRzIHRvIGJlIGFibGUgdG8gbG9vayB0aHJvdWdoIGNv
cmUgbW0gc3R1ZmYgcXVpdGUKY2xvc2VseSwgc28gbm90IGEgZ29vZCBpZGVhIGlmIHdlIGRlZXBs
eSBpbnRlcnR3aW4gaXQgd2l0aCBvbmUgb2YgdGhlCmJpZ2dlc3Qgc3Vic3lzdGVtcyB0aGVyZSBp
cy4gQW5kIEkgZG9uJ3QgdGhpbmsgdGhlcmUgd2lsbCBiZSBhIHJlYWwKY29uZmxpY3QgbGlrZSB0
aGlzIGV2ZXJ5IG1lcmdlIHdpbmRvdywgdGhpcyBzaG91bGQgYmUgdGhlIGV4Y2VwdGlvbi4KV29y
c3QgY2FzZSB3ZSBoYXZlIHRvIHN0YWdlIHNvbWUgd29yayAxIHJlbGVhc2UgY3ljbGUgYXBhcnQs
IGkuZS4KbWVyZ2UgbW0gc3R1ZmYgZmlyc3QsIHRoZW4gZHJtIDMgbW9udGhzIGxhdGVyLiBVc3Vh
bGx5IHRoYXQncyBub3QKZ29pbmcgdG8gc2xvdyB0aGluZ3MgZG93biBub3RpY2VhYmxlIGdpdmVu
IGF2ZXJhZ2UgbWVyZ2UgbGF0ZW5jeSBmb3IKY29yZSBtbSBmZWF0dXJlcyA6LSkKLURhbmllbAoK
PiA+IEBAIC0yMjAxLDcgKzIxNjIsNyBAQCBzdGF0aWMgaW50IGFwcGx5X3RvX3BhZ2VfcmFuZ2Vf
d3JhcHBlcihwdGVfdAo+ID4gICAgICAqcHRlLAo+ID4gICAgICAgICAgICAgIHN0cnVjdCBwYWdl
X3JhbmdlX2FwcGx5ICpwcmEgPQo+ID4gICAgICAgICAgICAgICAgICAgICAgY29udGFpbmVyX29m
KHB0ZXIsIHR5cGVvZigqcHJhKSwgcHRlcik7Cj4gPiAgICAgIC0gICAgICAgcmV0dXJuIHByYS0+
Zm4ocHRlLCBOVUxMLCBhZGRyLCBwcmEtPmRhdGEpOwo+ID4gICAgICArICAgICAgIHJldHVybiBw
cmEtPmZuKHB0ZSwgYWRkciwgcHJhLT5kYXRhKTsKPiA+ICAgICAgIH0KPgo+IEkgbG9va2VkIHRo
cm91Z2ggdGhpcyBhbmQgaXQgbG9va3MgT0sgdG8gbWUsIHRoYW5rcwo+Cj4gSmFzb24KCgoKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAo
MCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
