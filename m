Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92926DB723
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 21:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A306EA1C;
	Thu, 17 Oct 2019 19:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8AC6EA1C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 19:14:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z9so3586895wrl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 12:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mvGIqAYge04E8FhX6sBpxVjaOFRt097ptSHTXXfneKk=;
 b=i2B79H43ULxbjpfXP3upoLlICCt1NTK7m2MX/LHfjb03wJeoPctG60w386p9YqF2WN
 OAuCAq9plRgofZFAYeUrOVT74yHVYIdTo2lEPeDMOtBvGA754gWERo4ssKuKg3wsen7Z
 O6byMnFy4NvE4AIRMfeqMQitv+hqVEFYB1kN4iOBp1YklcDxNMts3HaXucV00LWMfxDT
 GjwFeEQHe4lI6kgYspMLPSIgFswksGkCnDQr8RG65BEgCNPTuwtl2KiX3YXHc6+7gPS6
 +lzoU2I0H+olYYAJSLTw4oumWBxcJHAkD2aZif99iU8dC54zYtsQxp6ekH6IfRyzXx4w
 gHDg==
X-Gm-Message-State: APjAAAV8nfIIjzwN3Mx4Ph3FaK5OGRI2juD3zxG21RQ0M5LM0FPZNXki
 qPGNir2zo9ZgF7OhZhObbH6ZrcMfHed6bD5iEMVNow==
X-Google-Smtp-Source: APXvYqzFbMnUb/1t8V7j8o3XbJVHjhBH3R49CMB7RWahl1YDxZElbr2au0kf7JnoH8msqWOMy4ukXdU7uCeiYlCR/l4=
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr1030503wrx.105.1571339666625; 
 Thu, 17 Oct 2019 12:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
 <20190924162217.GA12974@arm.com> <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
 <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
 <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
In-Reply-To: <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 17 Oct 2019 12:14:14 -0700
Message-ID: <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
To: "Andrew F. Davis" <afd@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mvGIqAYge04E8FhX6sBpxVjaOFRt097ptSHTXXfneKk=;
 b=cZ4QO9rlkFXmbsu9Pg73hXjoos4HnGGzGTdFGgn+xOCCdXRtpg7LeIGvGwTIoMw9ir
 yPYX4zU3b+IOKDprgcX3V8YeiNv30hdK6FHrTtEblw/9jIvucazynts8Sm3w3iojII4f
 jcj12a7NBzmuMuqo3yHpRCONapbJ1WK8dRrAyKAdayuMMu+7uJUkazi4jizlRLHW0irZ
 3h6WKcrxwBzmFh8TNXtOB5l2toN2kdgDknHB4W0h+kSyemLc3smo+gaf4+lOHEdJm0ue
 dHoM6ia55QGIvtmY/fZIOYCG4C4mXDGng8Ii+Q9ffHwREpGZqO4j2bk6AYo+krBvd/hk
 +2Wg==
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

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMTA6NDEgQU0gQW5kcmV3IEYuIERhdmlzIDxhZmRAdGku
Y29tPiB3cm90ZToKPiBPbiAxMC8xNC8xOSA1OjA3IEFNLCBCcmlhbiBTdGFya2V5IHdyb3RlOgo+
ID4gSGkgQW5kcmV3LAo+ID4KPiA+IE9uIFdlZCwgT2N0IDA5LCAyMDE5IGF0IDAyOjI3OjE1UE0g
LTA0MDAsIEFuZHJldyBGLiBEYXZpcyB3cm90ZToKPiA+PiBUaGUgQ01BIGRyaXZlciB0aGF0IHJl
Z2lzdGVycyB0aGVzZSBub2RlcyB3aWxsIGhhdmUgdG8gYmUgZXhwYW5kZWQgdG8KPiA+PiBleHBv
cnQgdGhlbSB1c2luZyB0aGlzIGZyYW1ld29yayBhcyBuZWVkZWQuIFdlIGRvIHNvbWV0aGluZyBz
aW1pbGFyIHRvCj4gPj4gZXhwb3J0IFNSQU0gbm9kZXM6Cj4gPj4KPiA+PiBodHRwczovL2xrbWwu
b3JnL2xrbWwvMjAxOS8zLzIxLzU3NQo+ID4+Cj4gPj4gVW5saWtlIHRoZSBzeXN0ZW0vZGVmYXVs
dC1jbWEgZHJpdmVyIHdoaWNoIGNhbiBiZSBjZW50cmFsaXplZCBpbiB0aGUKPiA+PiB0cmVlLCB0
aGVzZSBleHRyYSBleHBvcnRlcnMgd2lsbCBwcm9iYWJseSBsaXZlIG91dCBpbiBvdGhlciBzdWJz
eXN0ZW1zCj4gPj4gYW5kIHNvIGFyZSBhZGRlZCBpbiBsYXRlciBzdGVwcy4KPiA+Pgo+ID4+IEFu
ZHJldwo+ID4KPiA+IEkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgdGhlICJjbWFfZm9y
X2VhY2hfYXJlYSIgbG9vcCBpbiBwYXRjaAo+ID4gNCB3b3VsZCBkbyB0aGF0IChhZGRfY21hX2hl
YXBzKS4gSXMgaXQgbm90IHRoZSBjYXNlPwo+ID4KPgo+IEZvciB0aGVzZSBjbWEgbm9kZXMgeWVz
LCBJIHRob3VnaHQgeW91IG1lYW50IHJlc2VydmVkIG1lbW9yeSBhcmVhcyBpbgo+IGdlbmVyYWwu
CgpPaywgc29ycnkgSSBkaWRuJ3Qgc2VlIHRoaXMgZWFybGllciwgbm90IG9ubHkgd2FzIEkgc3Rp
bGwgZHJvcHBlZCBmcm9tCnRoZSBUbyBsaXN0LCBidXQgdGhlIGNvcHkgSSBnb3QgZnJvbSBkcmkt
ZGV2ZWwgZW5kZWQgdXAgbWFya2VkIGFzCnNwYW0uCgo+IEp1c3QgYXMgYSBzaWRlIG5vdGUsIEkn
bSBub3QgYSBodWdlIGZhbiBvZiB0aGUgY21hX2Zvcl9lYWNoX2FyZWEoKSB0bwo+IGJlZ2luIHdp
dGgsIGl0IHNlZW1zIGEgYml0IG91dCBvZiBwbGFjZSB3aGVuIHRoZXkgY291bGQgYmUgc2VsZWN0
aXZlbHkKPiBhZGRlZCBhcyBoZWFwcyBhcyBuZWVkZWQuIE5vdCBzdXJlIGhvdyB0aGF0IHdpbGwg
d29yayB3aXRoIGNtYSBub2Rlcwo+IHNwZWNpZmljYWxseSBhc3NpZ25lZCB0byBkZXZpY2VzLCBz
ZWVtcyBsaWtlIHdlIGNvdWxkIGp1c3Qgc3RlYWwgdGhlaXIKPiBtZW1vcnkgc3BhY2UgZnJvbSB1
c2Vyc3BhY2Ugd2l0aCB0aGlzLi4KClNvIHRoaXMgd291bGQgYmUgYSBjb25jZXJuIHdpdGggSU9O
IGFzIHdlbGwsIHNpbmNlIGl0IGRvZXMgdGhlIHNhbWUKdGhpbmcgYmVjYXVzZSBiZWluZyBhYmxl
IHRvIGFsbG9jYXRlIGZyb20gbXVsdGlwbGUgQ01BIGhlYXBzIGZvcgpkZXZpY2Ugc3BlY2lmaWMg
cHVycG9zZSBpcyByZWFsbHkgdXNlZnVsLgpBbmQgYXQgbGVhc3Qgd2l0aCBkbWFidWYgaGVhcHMg
ZWFjaCBoZWFwIGNhbiBiZSBnaXZlbiBpdHMgb3duCnBlcm1pc3Npb25zIHNvIHRoZXJlJ3MgbGVz
cyBsaWtlbGlob29kIGZvciBhbnkgYWJ1c2UgYXMgeW91IGRlc2NyaWJlLgoKQW5kIGl0IGFsc28g
YWxsb3dzIHZhcmlvdXMgZGV2aWNlIGNtYSBub2RlcyB0byBzdGlsbCBiZSBhbGxvY2F0ZWQgZnJv
bQp1c2luZyB0aGUgc2FtZSBpbnRlcmZhY2UgKHJhdGhlciB0aGVuIGhhdmluZyB0byB1c2UgYSBj
dXN0b20gZHJpdmVyCmlvY3RsIGZvciBlYWNoIGRldmljZSkuCgpCdXQgaWYgdGhlIG9iamVjdGlv
biBzdGFuZHMsIGRvIHlvdSBoYXZlIGEgcHJvcG9zYWwgZm9yIGFuIGFsdGVybmF0aXZlCndheSB0
byBlbnVtZXJhdGUgYSBzdWJzZXQgb2YgQ01BIGhlYXBzPwoKdGhhbmtzCi1qb2huCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
