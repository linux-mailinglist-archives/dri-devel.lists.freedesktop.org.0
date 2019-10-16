Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E24B0D988A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 19:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74BD6E9B8;
	Wed, 16 Oct 2019 17:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D1A6E9B8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 17:34:15 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p7so3812004wmp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 10:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d0tIou4PVkZRKLfa9URmZPGTaGi8mrzfHy4IFvVFBmo=;
 b=N6wBPQDJym4MjLJQOdfBPQ8ukx43I8JRdE/AqyOgq8Y3TogVDBZvgL8IESY5dgZC/6
 /o226fEcJ9m6GmKX+6zJXXBzkn9/ZE9EZv0eZFdqiqPL22GF01dZVtdrlQi8NZSRDOtv
 cWmLe3DN8HjSApbQkIqerjTzc/wopilNYmpiTlXQY8BKO+TrOpH1ej94iI5AfW3i0air
 zrzxYOUwn7ouaUbN38GICkBbsL4vtg/zo63H1qg0EizbnJvdiwqeS0GNu3yzQce2esyF
 u1UuZyQm1bG43OIpv2UHGNNwCCWUPPkEQsCaZ3kiiCpSjtcBdjwTQ5MnvA05YIugFeVV
 ioJg==
X-Gm-Message-State: APjAAAUekU09FNaOwMk1aOxckBRYB0ZDYuYh3jmld4s5nUaxk1gcTH7v
 +3FQmnRaLSj8uLtxx6tJUOzdq1XsJbR1/LYMmMwCTknlkmA=
X-Google-Smtp-Source: APXvYqy+FGQn6QYk/0687usNtlfuIFnlu9T3YLV2q9L2MjpCBtgZNe+VkqswnI0REXKB1BTmCOjv5LFAhvBniduVCTU=
X-Received: by 2002:a1c:f201:: with SMTP id s1mr4209041wmc.59.1571247253858;
 Wed, 16 Oct 2019 10:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
 <20190924162217.GA12974@arm.com> <20191009173742.GA2682@arm.com>
In-Reply-To: <20191009173742.GA2682@arm.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 16 Oct 2019 10:34:01 -0700
Message-ID: <CALAqxLVHjijuDUvVp4bTn5-bh=CTAZ3wvY0-PAG0TdKq-J6cHw@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
To: Ayan Halder <Ayan.Halder@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=d0tIou4PVkZRKLfa9URmZPGTaGi8mrzfHy4IFvVFBmo=;
 b=IsrhK51OKWd8bP04UTXaPueBjA67hvoFZsdh7mia4eNj9xsV7+fv3sHRuN9eKLHN+V
 HDjLtWhbuI1I7S4WCLQLbfHetyQkZUCeRcNFjFP9wy1ADEOzsLrA2g+MYlHTfw7kjB84
 TIjeewvFBSokWChLz9b/K8dJz0aqdKI8genVCmpx09KFHWjj3+xPVvsGTGwpJ+IoH3YX
 tidSriY4ER0KjLMS+dUXbniyYq6agUF5ud6Vk61dRZ4a0zNelvyV75BBCzaRYQXY+ATZ
 guqCjijTxyJ7rFwVEC3ID9G0VyuqhmQVj2zHzr9p4j/1nLr4Qxg41roPSdfI8+zsg3ym
 JKEQ==
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
Cc: nd <nd@arm.com>, Vincent Donnefort <Vincent.Donnefort@arm.com>,
 Chenbo Feng <fengc@google.com>, Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 "Andrew F . Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Sudipto Paul <Sudipto.Paul@arm.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgOSwgMjAxOSBhdCAxMDozOCBBTSBBeWFuIEhhbGRlciA8QXlhbi5IYWxkZXJA
YXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIFNlcCAyNCwgMjAxOSBhdCAwNDoyMjoxOFBNICsw
MDAwLCBBeWFuIEhhbGRlciB3cm90ZToKPiA+IE9uIFRodSwgU2VwIDE5LCAyMDE5IGF0IDEwOjIx
OjUyUE0gKzA1MzAsIFN1bWl0IFNlbXdhbCB3cm90ZToKPiA+ID4gSGVsbG8gQ2hyaXN0b3BoLCBl
dmVyeW9uZSwKPiA+ID4KPiA+ID4gT24gU2F0LCA3IFNlcCAyMDE5IGF0IDAwOjE3LCBKb2huIFN0
dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBIZXJl
IGlzIHlldCBhbm90aGVyIHBhc3MgYXQgdGhlIGRtYS1idWYgaGVhcHMgcGF0Y2hzZXQgQW5kcmV3
Cj4gPiA+ID4gYW5kIEkgaGF2ZSBiZWVuIHdvcmtpbmcgb24gd2hpY2ggdHJpZXMgdG8gZGVzdGFn
ZSBhIGZhaXIgY2h1bmsKPiA+ID4gPiBvZiBJT04gZnVuY3Rpb25hbGl0eS4KPiA+ID4gPgo+ID4g
PiA+IFRoZSBwYXRjaHNldCBpbXBsZW1lbnRzIHBlci1oZWFwIGRldmljZXMgd2hpY2ggY2FuIGJl
IG9wZW5lZAo+ID4gPiA+IGRpcmVjdGx5IGFuZCB0aGVuIGFuIGlvY3RsIGlzIHVzZWQgdG8gYWxs
b2NhdGUgYSBkbWFidWYgZnJvbSB0aGUKPiA+ID4gPiBoZWFwLgo+ID4gPiA+Cj4gPiA+ID4gVGhl
IGludGVyZmFjZSBpcyBzaW1pbGFyLCBidXQgbXVjaCBzaW1wbGVyIHRoZW4gSU9Ocywgb25seQo+
ID4gPiA+IHByb3ZpZGluZyBhbiBBTExPQyBpb2N0bC4KPiA+ID4gPgo+ID4gPiA+IEFsc28sIEkn
dmUgcHJvdmlkZWQgcmVsYXRpdmVseSBzaW1wbGUgc3lzdGVtIGFuZCBjbWEgaGVhcHMuCj4gPiA+
ID4KPiA+ID4gPiBJJ3ZlIGJvb3RlZCBhbmQgdGVzdGVkIHRoZXNlIHBhdGNoZXMgd2l0aCBBT1NQ
IG9uIHRoZSBIaUtleTk2MAo+ID4gPiA+IHVzaW5nIHRoZSBrZXJuZWwgdHJlZSBoZXJlOgo+ID4g
PiA+ICAgaHR0cHM6Ly9naXQubGluYXJvLm9yZy9wZW9wbGUvam9obi5zdHVsdHovYW5kcm9pZC1k
ZXYuZ2l0L2xvZy8/aD1kZXYvZG1hLWJ1Zi1oZWFwCj4gPiA+ID4KPiA+ID4gPiBBbmQgdGhlIHVz
ZXJzcGFjZSBjaGFuZ2VzIGhlcmU6Cj4gPiA+ID4gICBodHRwczovL2FuZHJvaWQtcmV2aWV3Lmdv
b2dsZXNvdXJjZS5jb20vYy9kZXZpY2UvbGluYXJvL2hpa2V5LysvOTA5NDM2Cj4gPiA+ID4KPiA+
ID4gPiBDb21wYXJlZCB0byBJT04sIHRoaXMgcGF0Y2hzZXQgaXMgbWlzc2luZyB0aGUgc3lzdGVt
LWNvbnRpZywKPiA+ID4gPiBjYXJ2ZW91dCBhbmQgY2h1bmsgaGVhcHMsIGFzIEkgZG9uJ3QgaGF2
ZSBhIGRldmljZSB0aGF0IHVzZXMKPiA+ID4gPiB0aG9zZSwgc28gSSdtIHVuYWJsZSB0byBkbyBt
dWNoIHVzZWZ1bCB2YWxpZGF0aW9uIHRoZXJlLgo+ID4gPiA+IEFkZGl0aW9uYWxseSB3ZSBoYXZl
IG5vIHVwc3RyZWFtIHVzZXJzIG9mIGNodW5rIG9yIGNhcnZlb3V0LAo+ID4gPiA+IGFuZCB0aGUg
c3lzdGVtLWNvbnRpZyBoYXMgYmVlbiBkZXByZWNhdGVkIGluIHRoZSBjb21tb24vYW5kb2lkLSoK
PiA+ID4gPiBrZXJuZWxzLCBzbyB0aGlzIHNob3VsZCBiZSBvay4KPiA+ID4gPgo+ID4gPiA+IEkn
dmUgYWxzbyByZW1vdmVkIHRoZSBzdGF0cyBhY2NvdW50aW5nLCBzaW5jZSBhbnkgc3VjaCBhY2Nv
dW50aW5nCj4gPiA+ID4gc2hvdWxkIGJlIGltcGxlbWVudGVkIGJ5IGRtYS1idWYgY29yZSBvciB0
aGUgaGVhcHMgdGhlbXNlbHZlcy4KPiA+ID4gPgo+ID4gPiA+IE1vc3Qgb2YgdGhlIGNoYW5nZXMg
aW4gdGhpcyByZXZpc2lvbiBhcmUgYWRkZHJlc3NpbmcgdGhlIG1vcmUKPiA+ID4gPiBjb25jcmV0
ZSBmZWVkYmFjayBmcm9tIENocmlzdG9waCAobWFueSB0aGFua3MhKS4gVGhvdWdoIEknbSBub3QK
PiA+ID4gPiBzdXJlIGlmIHNvbWUgb2YgdGhlIGxlc3Mgc3BlY2lmaWMgZmVlZGJhY2sgd2FzIGNv
bXBsZXRlbHkgcmVzb2x2ZWQKPiA+ID4gPiBpbiBkaXNjdXNzaW9uIGxhc3QgdGltZSBhcm91bmQu
IFBsZWFzZSBsZXQgbWUga25vdyEKPiA+ID4KPiA+ID4gSXQgbG9va3MgbGlrZSBtb3N0IG9mIHRo
ZSBmZWVkYmFjayBoYXMgYmVlbiB0YWtlbiBjYXJlIG9mLiBJZiB0aGVyZSdzCj4gPiA+IG5vIG1v
cmUgb2JqZWN0aW9uIHRvIHRoaXMgc2VyaWVzLCBJJ2QgbGlrZSB0byBtZXJnZSBpdCBpbiBzb29u
Lgo+ID4gPgo+ID4gPiBJZiB0aGVyZSBhcmUgYW55IG1vcmUgcmV2aWV3IGNvbW1lbnRzLCBtYXkg
SSByZXF1ZXN0IHlvdSB0byBwbGVhc2UgcHJvdmlkZSB0aGVtPwo+ID4KPiA+IEkgdGVzdGVkIHRo
ZXNlIHBhdGNoZXMgdXNpbmcgb3VyIGludGVybmFsIHRlc3Qgc3VpdGUgd2l0aCBBcm0sa29tZWRh
Cj4gPiBkcml2ZXIgYW5kIHRoZSBmb2xsb3dpbmcgbm9kZSBpbiBkdHMKPiA+Cj4gPiAgICAgICAg
IHJlc2VydmVkLW1lbW9yeSB7Cj4gPiAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MHgyPjsKPiA+ICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDI+Owo+ID4gICAgICAg
ICAgICAgICAgIHJhbmdlczsKPiA+Cj4gPiAgICAgICAgICAgICAgICAgZnJhbWVidWZmZXJANjAw
MDAwMDAgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaGFyZWQt
ZG1hLXBvb2wiOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgbGludXgsY21hLWRlZmF1bHQ7
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4NjAwMDAwMDAgMHgwIDB4
ODAwMDAwMD47Cj4gPiAgICAgICAgICAgICAgICAgfTsKPiA+ICAgICAgICAgfQo+IEFwb2xvZ2ll
cyBmb3IgdGhlIGNvbmZ1c2lvbiwgdGhpcyBkdHMgbm9kZSBpcyBpcnJlbGV2YW50IGFzIG91ciB0
ZXN0cyB3ZXJlIHVzaW5nCj4gdGhlIGNtYSBoZWFwICh2aWEgL2Rldi9kbWFfaGVhcC9yZXNlcnZl
ZCkuCj4KPiBUaGF0IHJhaXNlcyBhIHF1ZXN0aW9uLiBIb3cgZG8gd2UgcmVwcmVzZW50IHRoZSBy
ZXNlcnZlZC1tZW1vcnkgbm9kZXMKPiAoYXMgc2hvd24gYWJvdmUpIHZpYSB0aGUgZG1hLWJ1ZiBo
ZWFwcyBmcmFtZXdvcmsgPwoKKEFwb2xvZ2llcyBJIGRpZG4ndCBpbml0aWFsbHkgc2VlIHRoaXMg
YXMgeW91IHNvbWVob3cgbGVmdCBtZSBvZmYgdGhlCnJlcGx5IGxpc3QpCgpTbyB5ZWEsIGFzIEJy
aWFuIG1lbnRpb25lZCwgd2UnbGwgZ2VuZXJhdGUgYSBoZWFwIGZvciBlYWNoIGNtYSBhcmVhLgpT
byB0aGUgYWJvdmUgc2hvdWxkIGdlbmVyYXRlIGEgaGVhcCBuYW1lZCAiZnJhbWVidWZmZXIiLgoK
Rm9yIGV4YW1wbGUsIG9uIEhpS2V5OTYwIHRoZSBmb2xsb3dpbmcgcGF0Y2ggYWRkcyAob3JpZ2lu
YWxseSBmb3IgSU9OLApidXQgdGhlIHNhbWUgZHQgbm9kZSB3aWxsIHdvcmsgZm9yIGRtYWJ1ZiBo
ZWFwcykgdGhlIGNtYSBoZWFwCiJsaW51eCxjbWEiCiAgaHR0cHM6Ly9naXQubGluYXJvLm9yZy9w
ZW9wbGUvam9obi5zdHVsdHovYW5kcm9pZC1kZXYuZ2l0L2NvbW1pdC8/aD1kZXYvZG1hLWJ1Zi1o
ZWFwJmlkPTAwNTM4ZmU3MGUxN2FjZjA3ZmRjYmM0NDE4MTZkOTFjZGQyMjcyMDcKCnRoYW5rcwot
am9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
