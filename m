Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C2A75780
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 21:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B5C6E81D;
	Thu, 25 Jul 2019 19:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914E06E81D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 19:02:23 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l2so45642849wmg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 12:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X3AsLQhnTHv4m5xXViWHAbzsivrqwa3myoFef6PvdXM=;
 b=HqP5nl0K6qt0rMwPL3jjsfk7XmVOeEwVtv1mgbpIya0wo0xjdk6hPXx4hv+b0i28g6
 0S/Q9DhDkJeflKzRbRFqFbXEvbdVxZe/i6KXko/dg1gtiF1LgBBYIuGjzUPLvAQmefZe
 w4qwnWNsM7PEIjoeAPk2R3FPY7AhyBofwjLwE74yTqT35nLeN8w7D2J0iq1OjRirOyEB
 muuTJeubzmYjBZCuzA8wMiV0qZWSg49yM5w63FhkPFNad5tdgY4BrbKnBXP/mQzjAHjl
 TWdU70IPTrfMpsdlJsmVoSioVNdRAJdyin/DiAfSbvwTQEYvcxEPLq4erRHCMfbEmXBT
 1rZg==
X-Gm-Message-State: APjAAAWbUQmOALPfscsXaNYCj7wN9nVbadMYOvSna9gg9ahrj8JHBfIQ
 ZAQxCePUBVSGQBGSrNJJjpELLHUvfZPThTodsJtBTg==
X-Google-Smtp-Source: APXvYqxBn/gbH+PT6SDkNaOjbZZU5/bxVkSeXpu2kzM/b7ovVktC8AkRNNHB0Ifr7dWGjGxOqTYxwRvs3k38c5DiRG8=
X-Received: by 2002:a05:600c:c6:: with SMTP id
 u6mr83259750wmm.153.1564081342013; 
 Thu, 25 Jul 2019 12:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190724003656.59780-1-john.stultz@linaro.org>
 <20190724003656.59780-4-john.stultz@linaro.org>
 <20190725130204.GG20286@infradead.org>
In-Reply-To: <20190725130204.GG20286@infradead.org>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 25 Jul 2019 12:02:10 -0700
Message-ID: <CALAqxLW3AFRVgrZwpuBTm8g7R5WmRDVsmmKEH+d7-aaNZGeuCw@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] dma-buf: heaps: Add system heap to dmabuf heaps
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=X3AsLQhnTHv4m5xXViWHAbzsivrqwa3myoFef6PvdXM=;
 b=ea9V0F0OEhqUArIBeWLCnvfcrUIQC370T7JFfVzHiH7WaDR72Pc79vJ3YAHgMdAdeM
 LnqlyM/gWSnYRnHArIBN7L/XLdoUxcI0DyW6F2VGzFBc2PwdL4KtMLbbkBrTi8ieSNmd
 PVzdVtd97Rvn2O1JXKF4Vm+igS8L3HuOZ1Zw5hBdGYB8Xj9gVppLO9QWHKWNyXfGRuFn
 2ZQAPUEtagigSOFpgVesdN7ii7hUjf0cz0F+u9AyOEjM9okSTRpnjg8+atvNFUi2iiOV
 Bn0etSCenMtCUQejzDNdqD0IC7qX0U8zz/eoqTM8YmZxXW0+AI3qXLtHXiLDAJ4fj6ZZ
 Pn/A==
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
Cc: Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgNjowMiBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gPiArc3RydWN0IHN5c3RlbV9oZWFwIHsKPiA+ICsgICAg
IHN0cnVjdCBkbWFfaGVhcCAqaGVhcDsKPiA+ICt9IHN5c19oZWFwOwo+Cj4gSXQgc2VlbXMgbGlr
ZSB0aGlzIHN0cnVjdHVyZSBjb3VsZCBiZSByZW1vdmVkIGFuZCBpZiB3b3VsZCBpbXByb3ZlCj4g
dGhlIGNvZGUgZmxvdy4KCkdvb2QgcG9pbnQuIFdlIGFjdHVhbGx5IGtlZXAgYSBmZXcgdGhpbmdz
IGluIHRoZSBjbWEgdmVyc2lvbiBvZiB0aGlzLAphbmQgSSB0aGluayBJIGNvcGllZCB0aGF0IG92
ZXIgd2hlbiBJIHN0YXJ0ZWQgaGVyZSwgYnV0IG5ldmVyIGNsZWFuZWQKaXQgdXAuCgo+ID4gK3N0
YXRpYyBzdHJ1Y3QgZG1hX2hlYXBfb3BzIHN5c3RlbV9oZWFwX29wcyA9IHsKPiA+ICsgICAgIC5h
bGxvY2F0ZSA9IHN5c3RlbV9oZWFwX2FsbG9jYXRlLAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGlj
IGludCBzeXN0ZW1faGVhcF9jcmVhdGUodm9pZCkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgZG1h
X2hlYXBfZXhwb3J0X2luZm8gZXhwX2luZm87Cj4gPiArICAgICBpbnQgcmV0ID0gMDsKPiA+ICsK
PiA+ICsgICAgIGV4cF9pbmZvLm5hbWUgPSAic3lzdGVtX2hlYXAiOwo+ID4gKyAgICAgZXhwX2lu
Zm8ub3BzID0gJnN5c3RlbV9oZWFwX29wczsKPiA+ICsgICAgIGV4cF9pbmZvLnByaXYgPSAmc3lz
X2hlYXA7Cj4gPiArCj4gPiArICAgICBzeXNfaGVhcC5oZWFwID0gZG1hX2hlYXBfYWRkKCZleHBf
aW5mbyk7Cj4gPiArICAgICBpZiAoSVNfRVJSKHN5c19oZWFwLmhlYXApKQo+ID4gKyAgICAgICAg
ICAgICByZXQgPSBQVFJfRVJSKHN5c19oZWFwLmhlYXApOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJu
IHJldDsKPgo+IFRoZSBkYXRhIHN0cnVjdHVyZXMgaGVyZSBzZWVtIGEgbGl0dGxlIG9kZC4gIEkg
dGhpbmsgeW91IHdhbnQgdG86CgpZZWEuIFRoZXJlIGlzIHNvbWUgYXdrd2FyZG5lc3MsIGFuZCBz
b21lIGlzIGR1ZSB0byB1c2luZyB0aGUgaGVscGVyCmluZnJhc3RydWN0dXJlLCBidXQgc29tZSBp
cyBqdXN0IGNsdXR0ZXIgYW5kIEknbGwgcmV2aXNlIHRoYXQuCgo+ICAtIG1hcmsgYWxsIGRtYV9o
ZWFwX29wcyBpbnN0YW5lcyBjb25zdHMsIGFzIHdlIGdlbmVyYWxseSBkbyB0aGF0IGZvcgo+ICAg
IGFsbCBzdHJ1Y3R1cmVzIGNvbnRhaW5pbmcgZnVuY3Rpb24gcG9pbnRlcnMKCkRvbmUuCgo+ICAt
IG1vdmUgdGhlIG5hbWUgaW50byBkbWFfaGVhcF9vcHMuCgpJJ20gbm90IHN1cmUgdGhpcyBpcyB1
c2VmdWwsIGFzIHRoZXJlIGFyZSBjYXNlcyB3aGVyZSB0aGVyZSBhcmUKbXVsdGlwbGUgaGVhcHMg
dGhhdCB1c2UgdGhlIHNhbWUgb3BzLiBTcGVjaWZpY2FsbHkgdGhlIG11bHRpcGxlIENNQQpoZWFw
cy4KCj4gIC0gcmVtb3ZlIHRoZSBkbWFfaGVhcF9leHBvcnRfaW5mbyBzdHJ1Y3R1cmUsIHdoaWNo
IGlzIGEgYml0IHBvaW50bGVzcwoKQW5kcmV3IGFuZCBJIHdlbnQgYmFjayBhbmQgZm9ydGggb24g
dGhpcyBhIGJpdC4gSXQgbG9va3MgbGlrZSBoZSBqdXN0CnJlc3BvbmRlZCBzbyBJJ2xsIGRlZmVy
IHRvIGhpcyBhbnN3ZXIuCgo+ICAtIGRvbid0IGJvdGhlciBzZXR0aW5nIGEgcHJpdmF0ZSBkYXRh
LCBhcyB5b3UgZG9uJ3QgbmVlZCBpdC4KPiAgICBJZiBvdGhlciBoZWFwcyBuZWVkIHByaXZhdGUg
ZGF0YSBJJ2Qgc3VnZ2VzdCB0byBzd2l0Y2ggdG8gZW1iZWRkaW5nCj4gICAgdGhlIGRtYV9oZWFw
IHN0cnVjdHVyZSBpbnRvIGNvbnRhaW5pbmcgc3RydWN0dXJlIGluc3RlZCBzbyB0aGF0IHlvdQo+
ICAgIGNhbiB1c2UgY29udGFpbmVyX29mIHRvIGdldCBhdCBpdC4KCkZhaXIuIFRoZXJlIGlzIHNv
bWUgY2FzZXMgd2hlcmUgd2UgdXNlIHRoZSBwcml2IGRhdGEsIGJ1dCBJJ2xsIHRyeSB0bwpzZWUg
aWYgSSBjYW4gbWluaW1pemUgaXQuICBBbmQgYWdhaW4sIEkgdGhpbmsgaGF2aW5nIHRoZSBkbWFf
aGVhcApzdHJ1Y3R1cmUgYmUgaW50ZXJuYWwvcHJpdmF0ZSB0byB0aGUgaGVhcCBpbXBsZW1lbnRh
dGlvbnMgbWFkZSBpdApkaWZmaWN1bHQgdG8gYmUgYSBjb250YWluZWQgc3RydWN0dXJlLiBTbyBp
dCBnb2VzIGJhY2sgdG8gdGhlCmV4cG9ydF9pbmZvIHN0cnVjdHVyZSBwb2ludCBhYm92ZS4KCj4g
IC0gYWxzbyB3aHkgaXMgdGhlIGZyZWUgY2FsbGJhY2sgcGFzc2VkIGFzIGEgY2FsbGJhY2sgcmF0
aGVyIHRoYW4KPiAgICBrZXB0IGluIGRtYV9oZWFwX29wcywgbmV4dCB0byB0aGUgcGFpcmVkIGFs
bG9jIG9uZT8KClRoaXMgb25lIGlzIGR1ZSB0byB0aGUgb3B0aW9uYWwgaGVhcCBoZWxwZXJzIGlu
ZnJhc3RydWN0dXJlLiBJZiBhIGhlYXAKaW1wbGVtZW50cyBpdHMgb3duIGRtYV9idWZfb3BzLCBp
dCBjYW4gaGF2ZSByZWxlYXNlIGRpcmVjdGx5IGNhbGwgdGhlCmJ1ZmZlciBmcmVlIGZ1bmN0aW9u
LiBIb3dldmVyLCBzaW5jZSB3ZSB0cmllZCB0byBtaW5pbWl6ZSB0aGUgY29kZSB3ZQpoYXZlIHRo
ZSBoZWFwIGhlbHBlcnMgaW5mcmFzdHJ1Y3R1cmUgd2hpY2ggaW1wbGVtZW50cyBhIHNoYXJlZApk
bWFfYnVmX29wLCB3ZSBuZWVkIHNvbWUgd2F5IGZvciB0aGUgaGVscGVyIHJlbGVhc2UgZnVuY3Rp
b24gdG8gY2FsbApiYWNrIHRvIHRoZSBoZWFwIHNwZWNpZmljIGZyZWUuICBXZSBjb3VsZCBwdXQg
aXQgaW4gdGhlIGRtYV9oZWFwc19vcHMKbGlrZSB5b3Ugc3VnZ2VzdCwgYnV0IHRoYXQgYnJpbmdz
IHNvbWUgY29uZnVzaW9uIGFzIHdlbGwsIGFzIG5vdGhpbmcKaW4gdGhlIGRtYS1oZWFwcyBjb3Jl
IHdvdWxkIGNhbGwgaXQsIGl0IHdvdWxkIG9ubHkgYmUgYSB0b29sIGZvciB0aGUKaGVscGVyIGlu
ZnJhc3RydWN0dXJlIHRvIHRyYWNlIGJhY2sgdG8gdGhlIGhlYXAgc3BlY2lmaWMgZnJlZSBjYWxs
LgpUaGlzIGlzIHdoeSBpdHMgcGFzc2VkIHRvIHRoZSBoZWFwX2hlbHBlciBpbml0aWFsaXplci4g
IEkgYWdyZWUgaXQKZmVlbHMgYSBsaXR0bGUgb2RkLCBzbyBJJ2Qgd2VsY29tZSBhbHRlcm5hdGUg
YXBwcm9hY2hlcy4KClZlcnkgbXVjaCBhcHByZWNpYXRlIHRoZSByZXZpZXcgYW5kIGZlZWRiYWNr
ISAgSSdsbCB0cnkgdG8gYWRkcmVzcyBhcwptdWNoIG9mIHRoaXMgYXMgSSBjYW4gaW4gdGhlIG5l
eHQgcmV2aXNpb24uCgp0aGFua3MKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
