Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BDA71051
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 06:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8664A88635;
	Tue, 23 Jul 2019 04:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B14988635
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 04:09:39 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v19so37161940wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 21:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+AEy0A1U3bDIt426sx3FptCy+IyQIvQzzikjslkeuhc=;
 b=mo3GGMVX0V5QgggivROXCNEnLWbNvhg69CwNnCQKomSCuU7JyvtONW1HUsxcfEH2bp
 Y6VyvS7e9R1WSZ10tH0wiMD664rUzXHx0KbGShIJBBlwjMg2clsGty7ucOjaNrEqiEbI
 Zgi7hileQoRfgYmNgBJN2hxtOIXIB2dMnOqdZa5gQ8RIxbMvxHktjnc+nPlgDiBQvNsj
 z96RW7dvUfHUTfN0N0wXfKHWtOVmASLAvICJOS4NZsecC7iBNgu1YofY8wu1Q+oj1Ltg
 Ex3hR8LpZ28x93j45bLwHjRVTut4jtIso63yEs3LsG09kHRYrqZNKZn2HQMNiTaP4VQp
 BQlA==
X-Gm-Message-State: APjAAAWju6Rs61onYyibmv7aQcNWuLymXUT9fRzBiNbY/29RFWuI+AQV
 Z/F1pUk5Am4czhS6xNq2FAPTEpGLfIdpgPToXNGcrw==
X-Google-Smtp-Source: APXvYqwuDiAxsLbuVgRtZCmC5Njj4s+XxHj+VdwIPWtFY080q1KB1qHh/tqWkr0COKq0eaQWs5bNyFofmnAAy93Bavo=
X-Received: by 2002:a1c:dc07:: with SMTP id t7mr69039790wmg.164.1563854978031; 
 Mon, 22 Jul 2019 21:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <20190624194908.121273-3-john.stultz@linaro.org>
 <20190718100654.GA19666@infradead.org>
In-Reply-To: <20190718100654.GA19666@infradead.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 22 Jul 2019 21:09:25 -0700
Message-ID: <CALAqxLX1s4mbitE-_1s1vFPJrbrCKqpyhYoFW0V6hMEqE=eKVw@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] dma-buf: heaps: Add heap helpers
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+AEy0A1U3bDIt426sx3FptCy+IyQIvQzzikjslkeuhc=;
 b=E311kO1pCEwMLgLW8p32jUkqQOjQ9ZoxegskYz6+JpTLlAudw1HLUYbCumdlFFhvlN
 kknZAMeF/KHxiSf9QsA6fQbR+l+hHeS1KJrxuFayMjWeUjRw/vRMm1JeHS+yFatZIVtD
 iBjLtMlVQU2dN2EOMpK58+tFiAC2ZYilQAZ70uh+1pz3Ryqb91hawquXEbV//jqi+a8v
 PetHF5ohrQ4BFuL1d4cQtT3tqa0gkhsy6nSts16PwfrMnLXOBgp+f87TyuCUbmR9CLsB
 8vUkxyOvq5Wjxf8LYsqRq78Lbadeg2mgJu1/x+x87LVeyafSxluHqsAfIBCFQm3FL0P0
 uyKg==
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
Cc: Yudongbin <yudongbin@hisilicon.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Xu YiPing <xuyiping@hisilicon.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>,
 "Xiaqing \(A\)" <saberlily.xia@hisilicon.com>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>,
 butao <butao@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMzowNiBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gPiArdm9pZCBJTklUX0hFQVBfSEVMUEVSX0JVRkZFUihz
dHJ1Y3QgaGVhcF9oZWxwZXJfYnVmZmVyICpidWZmZXIsCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICB2b2lkICgqZnJlZSkoc3RydWN0IGhlYXBfaGVscGVyX2J1ZmZlciAqKSkKPgo+IFBs
ZWFzZSB1c2UgYSBsb3dlciBjYXNlIG5hbWluZyBmb2xsb3dpbmcgdGhlIG5hbWluZyBzY2hlbWUg
Zm9yIHRoZQo+IHJlc3Qgb2YgdGhlIGZpbGUuCgpZZXMhIEFwb2xvZ2llcyBhcyB0aGlzIHdhcyBh
IGhvbGQtb3ZlciBmcm9tIHdoZW4gdGhlIGluaXRpYWxpemF0aW9uCmZ1bmN0aW9uIHdhcyBhbiBp
bmxpbmUgZnVuY3Rpb24gaW4gdGhlIHN0eWxlIG9mCklOSVRfV09SSy9JTklUX0xJU1RfSEVBRC4g
Tm8gbG9uZ2VyIGFwcHJvcHJpYXRlIHRoYXQgaXRzIGEgZnVuY3Rpb24uCkknbGwgY2hhbmdlIGl0
LgoKPiA+ICtzdGF0aWMgdm9pZCAqZG1hX2hlYXBfbWFwX2tlcm5lbChzdHJ1Y3QgaGVhcF9oZWxw
ZXJfYnVmZmVyICpidWZmZXIpCj4gPiArewo+ID4gKyAgICAgdm9pZCAqdmFkZHI7Cj4gPiArCj4g
PiArICAgICB2YWRkciA9IHZtYXAoYnVmZmVyLT5wYWdlcywgYnVmZmVyLT5wYWdlY291bnQsIFZN
X01BUCwgUEFHRV9LRVJORUwpOwo+ID4gKyAgICAgaWYgKCF2YWRkcikKPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gdmFkZHI7
Cj4gPiArfQo+Cj4gVW5sZXNzIEknbSBtaXNyZWFkaW5nIHRoZSBwYXRjaGVzIHRoaXMgaXMgdXNl
ZCBmb3IgdGhlIHNhbWUgcGFnZXMgdGhhdAo+IGFsc28gbWlnaHQgYmUgZG1hIG1hcHBlZC4gIElu
IHRoaXMgY2FzZSB5b3UgbmVlZCB0byB1c2UKPiBmbHVzaF9rZXJuZWxfdm1hcF9yYW5nZSBhbmQg
aW52YWxpZGF0ZV9rZXJuZWxfdm1hcF9yYW5nZSBpbiB0aGUgcmlnaHQKPiBwbGFjZXMgdG8gZW5z
dXJlIGNvaGVyZW5jeSBiZXR3ZWVuIHRoZSB2bWFwIGFuZCBkZXZpY2Ugdmlldy4gIFBsZWFzZQo+
IGFsc28gZG9jdW1lbnQgdGhlIGJ1ZmZlciBvd25lcnNoaXAsIGFzIHRoaXMgcmVhbGx5IGNhbiBn
ZXQgY29tcGxpY2F0ZWQuCgpGb3JnaXZlIG1lIEkgd2Fzbid0IGZhbWlsaWFyIHdpdGggdGhvc2Ug
Y2FsbHMsIGJ1dCB0aGlzIHNlZW1zIGxpa2UgaXQKd291bGQgYXBwbHkgdG8gYWxsIGRtYS1idWYg
ZXhwb3J0ZXJzIGlmIHNvLCBhbmQgSSBkb24ndCBzZWUgYW55CnNpbWlsYXIgZmx1c2hfa2VybmVs
X3ZtYXBfcmFuZ2UgY2FsbHMgdGhlcmUgKGJvdGggZnVuY3Rpb25zIGFyZQpzZWVtaW5nbHkgb25s
eSB1c2VkIGJ5IHhmcywgbWQgYW5kIGJpbykuCgpXZSBkbyBoYXZlIHRoZSBkbWFfaGVhcF9kbWFf
YnVmX2JlZ2luX2NwdV9hY2Nlc3MoKS9kbWFfaGVhcF9kbWFfYnVmX2VuZF9jcHVfYWNjZXNzKCkK
aG9va3MgKHNlZSBtb3JlIG9uIHRoZXNlIGJlbG93KSB3aGljaCBzeW5jIHRoZSBidWZmZXJzIGZv
ciBlYWNoCmF0dGFjaG1lbnQgKHZpYSBkbWFfc3luY19zZ19mb3JfY3B1L2RldmljZSksIGFuZCBh
cmUgdXNlZCBhcm91bmQgY3B1CmFjY2VzcyB0byB0aGUgYnVmZmVycy4gQXJlIHlvdSBzdWdnZXN0
aW5nIHRoZQpmbHVzaF9rZXJuZWxfdm1hcF9yYW5nZSgpIGNhbGwgYmUgYWRkZWQgdG8gdGhvc2Ug
aG9va3Mgb3IgaXMgdGhlCmRtYV9zeW5jX3NnX2Zvcl8qIGNhbGxzIHN1ZmZpY2llbnQgdGhlcmU/
Cgo+ID4gK3N0YXRpYyB2bV9mYXVsdF90IGRtYV9oZWFwX3ZtX2ZhdWx0KHN0cnVjdCB2bV9mYXVs
dCAqdm1mKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gdm1m
LT52bWE7Cj4gPiArICAgICBzdHJ1Y3QgaGVhcF9oZWxwZXJfYnVmZmVyICpidWZmZXIgPSB2bWEt
PnZtX3ByaXZhdGVfZGF0YTsKPiA+ICsKPiA+ICsgICAgIHZtZi0+cGFnZSA9IGJ1ZmZlci0+cGFn
ZXNbdm1mLT5wZ29mZl07Cj4gPiArICAgICBnZXRfcGFnZSh2bWYtPnBhZ2UpOwo+ID4gKwo+ID4g
KyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+Cj4gSXMgdGhlcmUgYW55IGV4bHVzaW9uIGJldHdlZW4g
bW1hcCAvIHZtYXAgYW5kIHRoZSBkZXZpY2UgYWNjZXNzaW5nCj4gdGhlIGRhdGE/ICBXaXRob3V0
IHRoYXQgeW91IGFyZSBnb2luZyB0byBydW4gaW50byBhIGxvdCBvZiBjb2hlcmVuY3kKPiBwcm9i
bGVtcy4KClRoaXMgaGFzIGFjdHVhbGx5IGJlZW4gYSBjb25jZXJuIG9mIG1pbmUgcmVjZW50bHks
IGJ1dCBhdCB0aGUgaGlnaGVyCmRtYS1idWYgY29yZSBsZXZlbC4gIENvbmNlcHR1YWxseSwgdGhl
cmUgaXMgdGhlCmRtYV9idWZfbWFwX2F0dGFjaG1lbnQoKSBhbmQgZG1hX2J1Zl91bm1hcF9hdHRh
Y2htZW50KCkgY2FsbHMgZHJpdmVycwp1c2UgdG8gbWFwIHRoZSBidWZmZXIgdG8gYW4gYXR0YWNo
ZWQgZGV2aWNlLCBhbmQgdGhlcmUgYXJlIHRoZQpkbWFfYnVmX2JlZ2luX2NwdV9hY2Nlc3MoKSBh
bmQgZG1hX2J1Zl9lbmRfY3B1X2FjY2VzcygpIGNhbGxzIHdoaWNoCmFyZSB0byBiZSBkb25lIHdo
ZW4gdG91Y2hpbmcgdGhlIGNwdSBtYXBwZWQgcGFnZXMuICBUaGVzZSBsb29rIGxpa2UKc2VyaWFs
aXppbmcgZnVuY3Rpb25zLCBidXQgYWN0dWFsbHkgZG9uJ3Qgc2VlbSB0byBoYXZlIGFueSBlbmZv
cmNlbWVudAptZWNoYW5pc20gdG8gZXhjbHVkZSBwYXJhbGxlbCBhY2Nlc3MuCgpUbyBtZSBpdCBz
ZWVtcyBsaWtlIGFkZGluZyB0aGUgZXhjbHVzaW9uIGJldHdlZW4gdGhvc2Ugb3BlcmF0aW9ucwpz
aG91bGQgYmUgZG9uZSBhdCB0aGUgZG1hYnVmIGNvcmUgbGV2ZWwsIGFuZCB3b3VsZCBhY3R1YWxs
eSBiZSBoZWxwZnVsCmZvciBvcHRpbWl6aW5nIHNvbWUgb2YgdGhlIGNhY2hlIG1haW50ZW5hbmNl
IHJ1bGVzIHcvIGRtYWJ1Zi4gIERvZXMKdGhpcyBzb3VuZCBsaWtlIHNvbWV0aGluZyBjbG9zZXIg
dG8gd2hhdCB5b3VyIHN1Z2dlc3RpbmcsIG9yIGFtIEkKbWlzdW5kZXJzdGFuZGluZyB5b3VyIHBv
aW50PwoKQWdhaW4sIEkgcmVhbGx5IGFwcHJlY2lhdGUgdGhlIHJldmlldyBhbmQgZmVlZGJhY2sh
CgpUaGFua3Mgc28gbXVjaCEKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
