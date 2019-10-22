Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93660DFFFE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FA36E484;
	Tue, 22 Oct 2019 08:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32AB6E484
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:50:53 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 60so13500340otu.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EpIbPyLJiW0xJnouuCwRPkxpgK7OWPXN5Ymgu9JHiHA=;
 b=XSyV0lzw+vaqWTk/Q274yclkMQt+xP+J+rOhICkK3YIEO1QhdkDo44ubiFWkv6vQDw
 VWEv/eGblpLNR3G9FN9t+mAUMXylp1OE6R8y8BqrQmafZnbi3GRZB72fvHBkKf4O2MSU
 f4cDt+cHmZ7gk+MVQBZvN8i8hREzeXGw8+QYWoblPafdda6/ssiiBrpVlUVIJj3MBO8z
 D3J/yu7gQMlRdKj43MqiDCTOSfrUHcFIYi5ON1z2StEuLlzCLmo9JSMvY8QZr5sJ7YVT
 AMcehrUJ4UK5DaFTCRQxmAgk0ratj++e60WiKlx6YzHQgbhzMW9oHeM6WZnSn24j+Tgs
 Dq9w==
X-Gm-Message-State: APjAAAUKB6YO5z/5UgRRgayztLBhAj1uq08SsRwlA75eRs5NWWDbt53b
 JbZ2yyDcdhmcsxm0QYOuXa2ljsBRh8zPZ7ZgIuRtqA==
X-Google-Smtp-Source: APXvYqzfOO7kyEdELBPyn8unY9U2wUNIdnFmPqhP+Ugyi+Fc8SWIBaqjX7c3BRfx99tAYAvJQeiMCmh7oj2Kly5k95U=
X-Received: by 2002:a9d:6343:: with SMTP id y3mr1701963otk.106.1571734253134; 
 Tue, 22 Oct 2019 01:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300> <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
 <20191017030752.GA3109@jamwan02-TSP300>
 <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
 <20191017102055.GA8308@jamwan02-TSP300>
 <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
 <20191017114137.GC25745@shell.armlinux.org.uk>
 <20191022084210.GX11828@phenom.ffwll.local>
 <20191022084826.GP25745@shell.armlinux.org.uk>
In-Reply-To: <20191022084826.GP25745@shell.armlinux.org.uk>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 22 Oct 2019 10:50:42 +0200
Message-ID: <CAKMK7uHZ1Lw03LhZVH=oAa92WxZXucqooH1w6SG8HG20+g0Rbg@mail.gmail.com>
Subject: Re: [RFC,
 3/3] drm/komeda: Allow non-component drm_bridge only endpoints
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EpIbPyLJiW0xJnouuCwRPkxpgK7OWPXN5Ymgu9JHiHA=;
 b=B9HyTM0I+eVfwtkstGxQ65uPJqKWJnfhdWV6v/uQS3In3pRhIaSrkdc0974dc+lXJu
 q0YrPIWPoEyrc9O1XRZLVzd3yzM0Nwj+1YL9EhIJFEYi9nvpQSggzF6igw+51j66rOFk
 XixeX/xqAaPga96jY9SQyZJuHJ9izAYIOajzI=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTA6NDggQU0gUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4
IGFkbWluCjxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMjIs
IDIwMTkgYXQgMTA6NDI6MTBBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFRo
dSwgT2N0IDE3LCAyMDE5IGF0IDEyOjQxOjM3UE0gKzAxMDAsIFJ1c3NlbGwgS2luZyAtIEFSTSBM
aW51eCBhZG1pbiB3cm90ZToKPiA+ID4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6NDg6MTJB
TSArMDAwMCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE9jdCAxNywgMjAx
OSBhdCAxMDoyMTowM0FNICswMDAwLCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENo
aW5hKSB3cm90ZToKPiA+ID4gPiA+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDA4OjIwOjU2QU0g
KzAwMDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFRodSwgT2N0IDE3LCAy
MDE5IGF0IDAzOjA3OjU5QU0gKzAwMDAsIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kg
Q2hpbmEpIHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDA0OjIy
OjA3UE0gKzAwMDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4gSWYgSmFtZXMgaXMgc3Ryb25nbHkgYWdhaW5zdCBtZXJnaW5nIHRoaXMsIG1heWJl
IHdlIGp1c3Qgc3dhcAo+ID4gPiA+ID4gPiA+ID4gd2hvbGVzYWxlIHRvIGJyaWRnZT8gQnV0IGZv
ciBtZSwgdGhlIHByYWdtYXRpYyBhcHByb2FjaCB3b3VsZCBiZSB0aGlzCj4gPiA+ID4gPiA+ID4g
PiBzdG9wLWdhcC4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBU
aGlzIGlzIGEgZ29vZCBpZGVhLCBhbmQgSSB2b3RlICtVTE9OR19NQVggOikKPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+IGFuZCBJIGFsc28gY2hlY2tlZCB0ZGE5OTh4IGRyaXZlciwgaXQgc3Vw
cG9ydHMgYnJpZGdlLiBzbyBzd2FwIHRoZQo+ID4gPiA+ID4gPiA+IHdob2xlc2FsZSB0byBicmln
ZSBpcyBwZXJmZWN0LiA6KQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFdl
bGwsIGFzIE1paGFpbCB3cm90ZSwgaXQncyBkZWZpbml0ZWx5IG5vdCBwZXJmZWN0Lgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBUb2RheSwgaWYgeW91IHJtbW9kIHRkYTk5OHggd2l0aCB0aGUgRFBV
IGRyaXZlciBzdGlsbCBsb2FkZWQsCj4gPiA+ID4gPiA+IGV2ZXJ5dGhpbmcgd2lsbCBiZSB1bmJv
dW5kIGdyYWNlZnVsbHkuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IElmIHdlIHN3YXAgdG8gYnJp
ZGdlLCB0aGVuIHJtbW9kJ2luZyB0ZGE5OTh4IChvciBhbnkgb3RoZXIgYnJpZGdlCj4gPiA+ID4g
PiA+IGRyaXZlciB0aGUgRFBVIGlzIHVzaW5nKSB3aXRoIHRoZSBEUFUgZHJpdmVyIHN0aWxsIGxv
YWRlZCB3aWxsIHJlc3VsdAo+ID4gPiA+ID4gPiBpbiBhIGNyYXNoLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IEkgaGF2ZW4ndCByZWFkIHRoZSBicmlkZ2UgY29kZSwgYnV0IHNlZW1zIHRoaXMgaXMgYSBi
dWcgb2YgZHJtX2JyaWRnZSwKPiA+ID4gPiA+IHNpbmNlIGlmIHRoZSBicmlkZ2UgaXMgc3RpbGwg
aW4gdXNpbmcgYnkgb3RoZXJzLCB0aGUgcm1tb2Qgc2hvdWxkIGZhaWwKPiA+ID4gPiA+Cj4gPiA+
ID4KPiA+ID4gPiBDb3JyZWN0LCBidXQgdGhlcmUncyBubyBmaXggZm9yIHRoYXQgdG9kYXkuIFlv
dSBjYW4gYWxzbyB0YWtlIGEgbG9vawo+ID4gPiA+IGF0IHRoZSB0aHJlYWQgbGlua2VkIGZyb20g
TWloYWlsJ3MgY292ZXIgbGV0dGVyLgo+ID4gPiA+Cj4gPiA+ID4gPiBBbmQgcGVyc29uYWxseSBv
cGluaW9uLCBpZiB0aGUgYnJpZGdlIGRvZXNuJ3QgaGFuZGxlIHRoZSBkZXBlbmRlbmNlLgo+ID4g
PiA+ID4gZm9yIHVzOgo+ID4gPiA+ID4KPiA+ID4gPiA+IC0gYWRkIHN1Y2ggc3VwcG9ydCB0byBi
cmlkZ2UKPiA+ID4gPgo+ID4gPiA+IFRoYXQgd291bGQgY2VydGFpbmx5IGJlIGhlbHBmdWwuIEkg
ZG9uJ3Qga25vdyBpZiB0aGVyZSdzIGNvbnNlbnN1cyBvbgo+ID4gPiA+IGhvdyB0byBkbyB0aGF0
Lgo+ID4gPiA+Cj4gPiA+ID4gPiAgIG9yCj4gPiA+ID4gPiAtIGp1c3QgZG8gdGhlIGluc21vZC9y
bW1vZCBpbiBjb3JyZWN0IG9yZGVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU28sIHRoZXJlIHJl
YWxseSBhcmUgcHJvcGVyIGJlbmVmaXRzIHRvIHN0aWNraW5nIHdpdGggdGhlIGNvbXBvbmVudAo+
ID4gPiA+ID4gPiBjb2RlIGZvciB0ZGE5OTh4LCB3aGljaCBpcyB3aHkgSSdkIGxpa2UgdG8gdW5k
ZXJzdGFuZCB3aHkgeW91J3JlIHNvCj4gPiA+ID4gPiA+IGFnYWluc3QgdGhpcyBwYXRjaD8KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIGNoYW5nZSBoYW5kbGVzIHR3byBkaWZm
ZXJlbnQgY29ubmVjdG9ycyBpbiBrb21lZGEgaW50ZXJuYWxseSwgY29tcGFyZQo+ID4gPiA+ID4g
d2l0aCBvbmUgaW50ZXJmYWNlLCBpdCBpbmNyZWFzZXMgdGhlIGNvbXBsZXhpdHksIG1vcmUgcmlz
ayBvZiBidWcgYW5kIG1vcmUKPiA+ID4gPiA+IGNvc3Qgb2YgbWFpbnRhaW5hbmNlLgo+ID4gPiA+
ID4KPiA+ID4gPgo+ID4gPiA+IFdlbGwsIGl0J3Mgb25seSBhYm91dCBob3cgdG8gYmluZCB0aGUg
ZHJpdmVycyAtIHR3byBkaWZmZXJlbnQgbWV0aG9kcwo+ID4gPiA+IG9mIGJpbmRpbmcsIG5vdCB0
d28gZGlmZmVyZW50IGNvbm5lY3RvcnMuIEkgd291bGQgYXJndWUgdGhhdCBjYXJyeWluZwo+ID4g
PiA+IG91ciBvdXQtb2YtdHJlZSBwYXRjaGVzIHRvIHN1cHBvcnQgYm90aCBwbGF0Zm9ybXMgaXMg
YSBsYXJnZXIKPiA+ID4gPiBtYWludGVuYW5jZSBidXJkZW4uCj4gPiA+ID4KPiA+ID4gPiBIb25l
c3RseSB0aGlzIGxvb2tzIGxpa2UgYSB3aW4td2luIHRvIG1lLiBXZSBnZXQgdGhlIHN1cGVyaW9y
IGFwcHJvYWNoCj4gPiA+ID4gd2hlbiBpdHMgc3VwcG9ydGVkLCBhbmQgc3RpbGwgZ2V0IHRvIHN1
cHBvcnQgYnJpZGdlcyB3aGljaCBhcmUgbW9yZQo+ID4gPiA+IGNvbW1vbi4KPiA+ID4gPgo+ID4g
PiA+IEFzL3doZW4gaW1wcm92ZW1lbnRzIGFyZSBtYWRlIHRvIHRoZSBicmlkZ2UgY29kZSB3ZSBj
YW4gcmVtb3ZlIHRoZQo+ID4gPiA+IGNvbXBvbmVudCBiaXRzIGFuZCBub3QgbG9zZSBhbnl0aGlu
Zy4KPiA+ID4KPiA+ID4gVGhlcmUgd2FzIGFuIGlkZWEgYSB3aGlsZSBiYWNrIGFib3V0IHVzaW5n
IHRoZSBkZXZpY2UgbGlua3MgY29kZSB0bwo+ID4gPiBzb2x2ZSB0aGUgYnJpZGdlIGlzc3VlIC0g
YnV0IGF0IHRoZSB0aW1lIHRoZSBkZXZpY2UgbGlua3MgY29kZSB3YXNuJ3QKPiA+ID4gdXAgdG8g
dGhlIGpvYi4gIEkgdGhpbmsgdGhhdCdzIGJlZW4gcmVzb2x2ZWQgbm93LCBidXQgSSBoYXZlbid0
IGJlZW4KPiA+ID4gYWJsZSB0byBjb25maXJtIGl0LiAgSSBkaWQgcHJvcG9zZSBzb21lIHBhdGNo
ZXMgZm9yIGJyaWRnZSBhdCB0aGUKPiA+ID4gdGltZSBidXQgdGhleSBwcm9iYWJseSBuZWVkIHVw
ZGF0aW5nLgo+ID4KPiA+IEkgdGhpbmsgdGhlIG9ubHkgcGF0Y2hlcyB0aGF0IGV4aXN0ZWQgd2hl
cmUgZm9yIHBhbmVsLCBhbmQgd2Ugb25seQo+ID4gZGlzY3Vzc2VkIHRoZSBicmlkZ2UgY2FzZS4g
QXQgbGVhc3QgSSBjYW4gb25seSBmaW5kIHBhdGNoZXMgZm9yIHBhbmVsLG5vdAo+ID4gYnJpZGdl
LCBidXQgbWlnaHQgYmUgbWlzc2luZyBzb21ldGhpbmcuCj4KPiBJIGhhZCBhIHBhdGNoZXMsIHdo
aWNoIGlzIHdoeSBJIHJhaXNlZCB0aGUgcHJvYmxlbSB3aXRoIHRoZSBjb3JlOgo+Cj4gNjk2MWVk
ZmVlMjZkIGJyaWRnZSBoYWNrcyB1c2luZyBkZXZpY2UgbGlua3MKPgo+IGJ1dCBpdCBuZXZlciB3
ZW50IGZ1cnRoZXIgdGhhbiBhbiBleHBlcmltZW50IGF0IHRoZSB0aW1lIGJlY2F1c2Ugb2YgdGhl
Cj4gcHJvYmxlbXMgaW4gdGhlIGNvcmUuICBBcyBpdCB3YXMgYSBoYWNrLCBpdCBuZXZlciBnb3Qg
cG9zdGVkLiAgU2VlbXMKPiB0aGF0IGtlcm5lbCB0cmVlIChmb3IgdGhlIGN1Ym94KSBpcyBzdGls
bCA1LjIgYmFzZWQsIHNvIGhhcyBhIGxvdCBvZgo+IHBhdGNoZXMgYW5kIG1pZ2h0IG5lZWQgdXBk
YXRpbmcgdG8gYSBtb3JlIHJlY2VudCBiYXNlIGJlZm9yZSBhbnl0aGluZwo+IGNhbiBiZSB0ZXN0
ZWQuCgoKRm9yIHJlZmVyZW5jZSwgdGhlIHBhbmVsIHBhdGNoOgoKaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC8xMDM2NDg3My8KCkFuZCB0aGUgaHVnZSBkaXNjdXNzaW9uIGFyb3Vu
ZCBicmlkZ2VzLCB0aGF0IHJlc3VsdGVkIGluIFJhZmFlbApXeXpvY2tpIGZpeGluZyBhbGwgdGhl
IGNvcmUgaXNzdWVzOgoKaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJpLWRldmVsL21z
ZzIwMTkyNy5odG1sCgpKYW1lcywgZG8geW91IHdhbnQgdG8gbG9vayBpbnRvIHRoaXMgZm9yIGJy
aWRnZXM/CgpDaGVlcnMsIERhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
