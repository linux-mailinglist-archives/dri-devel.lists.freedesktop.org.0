Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7408DB782
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 21:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A196EA2A;
	Thu, 17 Oct 2019 19:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5576EA2A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 19:29:25 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HJT8bD074406;
 Thu, 17 Oct 2019 14:29:08 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9HJT8rD129768
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Oct 2019 14:29:08 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 17
 Oct 2019 14:29:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 17 Oct 2019 14:29:07 -0500
Received: from [10.250.79.55] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HJT7b5090136;
 Thu, 17 Oct 2019 14:29:07 -0500
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
To: John Stultz <john.stultz@linaro.org>
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
 <20190924162217.GA12974@arm.com> <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
 <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
 <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
 <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
Date: Thu, 17 Oct 2019 15:29:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1571340548;
 bh=FQw6tHtjutclhEra0bZ8lyV5GyV+9hIm6rM/wZiaztY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pFrbpnvYi4/9sJztFJOw7XPBz5mwhCGiScK6huQmaA0g6+DLer/EVPapviG6iQ380
 iWYH/F59Fd00zXWXejG+rpz2NJpxMxxOjfpS68IFDgqU6pVVQCOiNmpJ8MwoNf/U4w
 +Ky+ZAJzdT6NwRQb4WLJqC8bXG2LkSFecyqlsciE=
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
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Ayan Halder <Ayan.Halder@arm.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, nd <nd@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMTcvMTkgMzoxNCBQTSwgSm9obiBTdHVsdHogd3JvdGU6Cj4gT24gV2VkLCBPY3QgMTYs
IDIwMTkgYXQgMTA6NDEgQU0gQW5kcmV3IEYuIERhdmlzIDxhZmRAdGkuY29tPiB3cm90ZToKPj4g
T24gMTAvMTQvMTkgNTowNyBBTSwgQnJpYW4gU3RhcmtleSB3cm90ZToKPj4+IEhpIEFuZHJldywK
Pj4+Cj4+PiBPbiBXZWQsIE9jdCAwOSwgMjAxOSBhdCAwMjoyNzoxNVBNIC0wNDAwLCBBbmRyZXcg
Ri4gRGF2aXMgd3JvdGU6Cj4+Pj4gVGhlIENNQSBkcml2ZXIgdGhhdCByZWdpc3RlcnMgdGhlc2Ug
bm9kZXMgd2lsbCBoYXZlIHRvIGJlIGV4cGFuZGVkIHRvCj4+Pj4gZXhwb3J0IHRoZW0gdXNpbmcg
dGhpcyBmcmFtZXdvcmsgYXMgbmVlZGVkLiBXZSBkbyBzb21ldGhpbmcgc2ltaWxhciB0bwo+Pj4+
IGV4cG9ydCBTUkFNIG5vZGVzOgo+Pj4+Cj4+Pj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkv
My8yMS81NzUKPj4+Pgo+Pj4+IFVubGlrZSB0aGUgc3lzdGVtL2RlZmF1bHQtY21hIGRyaXZlciB3
aGljaCBjYW4gYmUgY2VudHJhbGl6ZWQgaW4gdGhlCj4+Pj4gdHJlZSwgdGhlc2UgZXh0cmEgZXhw
b3J0ZXJzIHdpbGwgcHJvYmFibHkgbGl2ZSBvdXQgaW4gb3RoZXIgc3Vic3lzdGVtcwo+Pj4+IGFu
ZCBzbyBhcmUgYWRkZWQgaW4gbGF0ZXIgc3RlcHMuCj4+Pj4KPj4+PiBBbmRyZXcKPj4+Cj4+PiBJ
IHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IHRoZSAiY21hX2Zvcl9lYWNoX2FyZWEiIGxv
b3AgaW4gcGF0Y2gKPj4+IDQgd291bGQgZG8gdGhhdCAoYWRkX2NtYV9oZWFwcykuIElzIGl0IG5v
dCB0aGUgY2FzZT8KPj4+Cj4+Cj4+IEZvciB0aGVzZSBjbWEgbm9kZXMgeWVzLCBJIHRob3VnaHQg
eW91IG1lYW50IHJlc2VydmVkIG1lbW9yeSBhcmVhcyBpbgo+PiBnZW5lcmFsLgo+IAo+IE9rLCBz
b3JyeSBJIGRpZG4ndCBzZWUgdGhpcyBlYXJsaWVyLCBub3Qgb25seSB3YXMgSSBzdGlsbCBkcm9w
cGVkIGZyb20KPiB0aGUgVG8gbGlzdCwgYnV0IHRoZSBjb3B5IEkgZ290IGZyb20gZHJpLWRldmVs
IGVuZGVkIHVwIG1hcmtlZCBhcwo+IHNwYW0uCj4gCj4+IEp1c3QgYXMgYSBzaWRlIG5vdGUsIEkn
bSBub3QgYSBodWdlIGZhbiBvZiB0aGUgY21hX2Zvcl9lYWNoX2FyZWEoKSB0bwo+PiBiZWdpbiB3
aXRoLCBpdCBzZWVtcyBhIGJpdCBvdXQgb2YgcGxhY2Ugd2hlbiB0aGV5IGNvdWxkIGJlIHNlbGVj
dGl2ZWx5Cj4+IGFkZGVkIGFzIGhlYXBzIGFzIG5lZWRlZC4gTm90IHN1cmUgaG93IHRoYXQgd2ls
bCB3b3JrIHdpdGggY21hIG5vZGVzCj4+IHNwZWNpZmljYWxseSBhc3NpZ25lZCB0byBkZXZpY2Vz
LCBzZWVtcyBsaWtlIHdlIGNvdWxkIGp1c3Qgc3RlYWwgdGhlaXIKPj4gbWVtb3J5IHNwYWNlIGZy
b20gdXNlcnNwYWNlIHdpdGggdGhpcy4uCj4gCj4gU28gdGhpcyB3b3VsZCBiZSBhIGNvbmNlcm4g
d2l0aCBJT04gYXMgd2VsbCwgc2luY2UgaXQgZG9lcyB0aGUgc2FtZQo+IHRoaW5nIGJlY2F1c2Ug
YmVpbmcgYWJsZSB0byBhbGxvY2F0ZSBmcm9tIG11bHRpcGxlIENNQSBoZWFwcyBmb3IKPiBkZXZp
Y2Ugc3BlY2lmaWMgcHVycG9zZSBpcyByZWFsbHkgdXNlZnVsLgo+IEFuZCBhdCBsZWFzdCB3aXRo
IGRtYWJ1ZiBoZWFwcyBlYWNoIGhlYXAgY2FuIGJlIGdpdmVuIGl0cyBvd24KPiBwZXJtaXNzaW9u
cyBzbyB0aGVyZSdzIGxlc3MgbGlrZWxpaG9vZCBmb3IgYW55IGFidXNlIGFzIHlvdSBkZXNjcmli
ZS4KPiAKCgpZZXMgaXQgd2FzIGEgcHJvYmxlbSB3aXRoIElPTiBhbHNvLCBoYXZpbmcgaW5kaXZp
ZHVhbCBmaWxlcyBwZXIgaGVhcApkb2VzIGhlbHAgd2l0aCBzb21lIHBlcm1pc3Npb25zLCBidXQg
bXkgaXNzdWUgaXMgd2hhdCBpZiBJIGRvbid0IHdhbnQgbXkKQ01BIGV4cG9ydGVkIGF0IGFsbCwg
Y21hX2Zvcl9lYWNoX2FyZWEoKSBqdXN0IGdyYWJzIHRoZW0gYWxsIGFueXdheS4KCgo+IEFuZCBp
dCBhbHNvIGFsbG93cyB2YXJpb3VzIGRldmljZSBjbWEgbm9kZXMgdG8gc3RpbGwgYmUgYWxsb2Nh
dGVkIGZyb20KPiB1c2luZyB0aGUgc2FtZSBpbnRlcmZhY2UgKHJhdGhlciB0aGVuIGhhdmluZyB0
byB1c2UgYSBjdXN0b20gZHJpdmVyCj4gaW9jdGwgZm9yIGVhY2ggZGV2aWNlKS4KPiAKCgpUaGlz
IGlzIGRlZmluaXRlbHkgdGhlIHdheSB0byBnbywgaXQncyB0aGUgaW1wbGVtZW50YXRpb24gb2Yg
aG93IHdlIGdldAp0aGUgQ01BcyB0byBleHBvcnQgaW4gdGhlIGZpcnN0IHBsYWNlIHRoYXQgaXMg
YSBiaXQgb2RkLgoKCj4gQnV0IGlmIHRoZSBvYmplY3Rpb24gc3RhbmRzLCBkbyB5b3UgaGF2ZSBh
IHByb3Bvc2FsIGZvciBhbiBhbHRlcm5hdGl2ZQo+IHdheSB0byBlbnVtZXJhdGUgYSBzdWJzZXQg
b2YgQ01BIGhlYXBzPwo+IAoKCldoZW4gaW4gc3RhZ2luZyBJT04gaGFkIHRvIHJlYWNoIGludG8g
dGhlIENNQSBmcmFtZXdvcmsgYXMgdGhlIG90aGVyCmRpcmVjdGlvbiB3b3VsZCBub3QgYmUgYWxs
b3dlZCwgc28gY21hX2Zvcl9lYWNoX2FyZWEoKSB3YXMgYWRkZWQuIElmCkRNQS1CVUYgaGVhcHMg
aXMgbm90IGluIHN0YWdpbmcgdGhlbiB3ZSBjYW4gZG8gdGhlIG9wcG9zaXRlLCBhbmQgaGF2ZQp0
aGUgQ01BIGZyYW1ld29yayByZWdpc3RlciBoZWFwcyBpdHNlbGYgdXNpbmcgb3VyIGZyYW1ld29y
ay4gVGhhdCB3YXkKdGhlIENNQSBzeXN0ZW0gY291bGQgZGVjaWRlIHdoYXQgYXJlYXMgdG8gZXhw
b3J0IG9yIG5vdCAobWF5YmUgYmFzZWQgb24KYSBEVCBwcm9wZXJ0eSBvciBzaW1pbGFyKS4KClRo
ZSBlbmQgcmVzdWx0IGlzIHRoZSBzYW1lIHNvIHdlIGNhbiBtYWtlIHRoaXMgY2hhbmdlIGxhdGVy
IChpdCBoYXMgdG8KY29tZSBhZnRlciBETUEtQlVGIGhlYXBzIGlzIGluIGFueXdheSkuCgpBbmRy
ZXcKCgo+IHRoYW5rcwo+IC1qb2huCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
