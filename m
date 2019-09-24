Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EB4BCC6D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173066EA45;
	Tue, 24 Sep 2019 16:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E916EA45
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:28:18 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x2so885373wmj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 09:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BhiqhiNCyg2iKe2QgHnCVRClKHmtJxSxATbA4G39gTo=;
 b=AUh1bHc0AEZXEVytRhMAaclZ/kj5ZJQKNdMYmY0FLPgQBQwGboItWg1NyACJuSGgPy
 y+/tbREuaFCZvaBEkZn/xBBtBzhU0dMYTjbEPgTSfvNkhBGRP6GyKeqDEQXe43/UyUW5
 6jyCgxkpHvzRKKNvr83O2CAL3JQiGRacoVedsVvSijGH0IH9Epp8LK7Qkv0GNtehXVnJ
 oI7rSbtvRdtNmr2OXiGZr3UpWmeuGZz/aLjW63IseaBgOOij+gGflXRNplBCX/DrAQhC
 yo8GuqDeq8VSVQLK7R8eDWHidaqRekdmuKSC+ZpIjDrbiytVrifAAyvJ5iwgBfs+PONx
 wZ0A==
X-Gm-Message-State: APjAAAWUMKv7JqqoMlDVf3zjQYz24RsyGgehRah2v+OY/OaXgGkSLg3C
 LtUGwaThd6nJMyqjtQGcPL5GKWaBADkMZlJ7vVUesQ==
X-Google-Smtp-Source: APXvYqxZ5pU4lxFJ5tQmF3vfkOLnNi5HezknxSez2JUPr5x+LtPQ4ks1/3HtByssCHPjURAE2yOlGO/+DZjLSQDG9Bo=
X-Received: by 2002:a1c:e0d6:: with SMTP id x205mr506020wmg.1.1569342496892;
 Tue, 24 Sep 2019 09:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
 <20190924162217.GA12974@arm.com>
In-Reply-To: <20190924162217.GA12974@arm.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 24 Sep 2019 09:28:05 -0700
Message-ID: <CALAqxLXyGeW=GH-FyEyt1KfZk-dcUP7DEdQsd8nMjvBhpSiHbg@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
To: Ayan Halder <Ayan.Halder@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BhiqhiNCyg2iKe2QgHnCVRClKHmtJxSxATbA4G39gTo=;
 b=Jx4/I6tmWFxd9oBqpJwEewoaLfll1xA49kapNwo4K7jIwLNsffD4izYcxn7GxwGEFz
 337SYN9mj2IvQriEMDYZ8ZQmgMDBO16aFo7m2EZ9P6p/nAKssi+7n4uKoDpAGeK43FQo
 fhgYgG4HJ6cKwTzbzeq/8tXruKHfQeZ8EUMcBpnSFm1ojAQvmuapo3ejeyolrmur+2Co
 IVmxX/JQwvrpifOwHYQ8pGJtNAMnUyKCfW3IF11WR+1i9ojYwkwl57YUdgQXa70tNvPk
 NZi4wYu97qdZyzrrHgjtujJNU9nYwCJrgYYzuJQjFGwhuhOdiQUbRT/pGWF4lZp5ZcMb
 qeRw==
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
Cc: nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgOToyMiBBTSBBeWFuIEhhbGRlciA8QXlhbi5IYWxkZXJA
YXJtLmNvbT4gd3JvdGU6Cj4gSSB0ZXN0ZWQgdGhlc2UgcGF0Y2hlcyB1c2luZyBvdXIgaW50ZXJu
YWwgdGVzdCBzdWl0ZSB3aXRoIEFybSxrb21lZGEKPiBkcml2ZXIgYW5kIHRoZSBmb2xsb3dpbmcg
bm9kZSBpbiBkdHMKPgo+ICAgICAgICAgcmVzZXJ2ZWQtbWVtb3J5IHsKPiAgICAgICAgICAgICAg
ICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgyPjsKPiAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMg
PSA8MHgyPjsKPiAgICAgICAgICAgICAgICAgcmFuZ2VzOwo+Cj4gICAgICAgICAgICAgICAgIGZy
YW1lYnVmZmVyQDYwMDAwMDAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gInNoYXJlZC1kbWEtcG9vbCI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgbGludXgsY21h
LWRlZmF1bHQ7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDYwMDAwMDAw
IDB4MCAweDgwMDAwMDA+Owo+ICAgICAgICAgICAgICAgICB9Owo+ICAgICAgICAgfQo+Cj4gVGhl
IHRlc3RzIHdlbnQgZmluZS4gT3VyIHRlc3RzIGFsbG9jYXRlcyBmcmFtZWJ1ZmZlcnMgb2YgZGlm
ZmVyZW50Cj4gc2l6ZXMsIHBvc3RzIHRoZW0gb24gc2NyZWVuIGFuZCB0aGUgZHJpdmVyIHdyaXRl
cyBiYWNrIHRvIG9uZSBvZiB0aGUKPiBmcmFtZWJ1ZmZlcnMuIEkgaGF2ZW5vdCB0ZXN0ZWQgZm9y
IGFueSBwZXJmb3JtYW5jZSwgbGF0ZW5jeSBvcgo+IGNhY2hlIG1hbmFnZW1lbnQgcmVsYXRlZCBz
dHVmZi4gU28sIGl0IHRoYXQgbG9va3MgYXBwcm9wcmlhdGUsIGZlZWwKPiBmcmVlIHRvIGFkZDot
Cj4gVGVzdGVkLWJ5Oi0gQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4uaGFsZGVyQGFybS5jb20+CgpU
aGFua3Mgc28gbXVjaCBmb3IgdGVzdGluZyEgSSByZWFsbHkgYXBwcmVjaWF0ZSBpdCEKCj4gQXJl
IHlvdSBwbGFubmluZyB0byB3cml0ZSBzb21lIGlndCB0ZXN0cyBmb3IgaXQgPwoKSSd2ZSBub3Qg
cGVyc29uYWxseSBhcyBmYW1pbGlhciB3aXRoIGlndCB5ZXQsIHdoaWNoIGlzIHdoeSBJIHN0YXJ0
ZWQKd2l0aCBrc2VsZnRlc3QsIGJ1dCBpdCdzIGEgZ29vZCBpZGVhLiBJJ2xsIHRha2UgYSBsb29r
IGFuZCB0cnkgdG8gdGFrZQphIHN3aW5nIGF0IGl0IGFmdGVyIFN1bWl0IHF1ZXVlcyB0aGUgcGF0
Y2hzZXQgKEkgbmVlZCB0byByZXN1Ym1pdCB0bwphZGRyZXNzIEJyaWFuJ3MgZmVlZGJhY2spLgoK
dGhhbmtzCi1qb2huCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
