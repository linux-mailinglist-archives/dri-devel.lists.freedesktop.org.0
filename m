Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAE4DCDED
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DC76EB86;
	Fri, 18 Oct 2019 18:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F6B6EB86
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:27:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q13so2277268wrs.12
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 11:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lO2StNiS2UHCj8+9SsvqSbVKFte3Dujsk2JYdGhstd0=;
 b=nTGbwjsYNTBmaHqU+tpdfEiQKbxyQvA6FWO8ZM+IxAhTE3w8pFPHO1mqGGksaIxqZy
 CpFHvcOLhTFs9UPgYFXjaQ/0gNbNUUU7b842emeVmXqa4L0TcWsfM/vz9rv1CmXhBMak
 txb6pBKw7Pdz4olBXSxpQ/DM+xU7yIRnMtpKxKx3GFG0WFllZZCihjZe1stNfESQ3ouU
 JlhlHiGlpfXJYr2B1erbIGRedDqsX5479uFa7+xDclmab0efJBco4QlVJptOLEWoqThp
 dkRc/xMQeP3zUIsE69FRjiYMp7VDm8Bv9n+o/5bZpVAWrnihGHyWCz9uJco1m13/myHe
 gAUQ==
X-Gm-Message-State: APjAAAXIxi/WzEGR3qYql9R2WIiNmXoGozK50+4ACrLTzg7iwZxH2qqG
 3j82/ZTzkqb9SJDDXLlOLWhaGiG1wWF2oKG6/Bolcg==
X-Google-Smtp-Source: APXvYqy02V7JvYjspbL2KqGV67KwG+Nwl8JcMdFE4sjvajWRC5F41fOItfkNZW2vQ9MumjE8aMqtnrumrcIePCpePlw=
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr9338121wrr.50.1571423224434; 
 Fri, 18 Oct 2019 11:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191018052323.21659-1-john.stultz@linaro.org>
 <20191018052323.21659-2-john.stultz@linaro.org>
 <20191018111832.o7wx3x54jm3ic6cq@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191018111832.o7wx3x54jm3ic6cq@DESKTOP-E1NTVVP.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 18 Oct 2019 11:26:52 -0700
Message-ID: <CALAqxLUVLP0ujB0SHyWHMncRMHkBvVj1+CpBgGUD8Xg3RexQ8w@mail.gmail.com>
Subject: Re: [PATCH v12 1/5] dma-buf: Add dma-buf heaps framework
To: Brian Starkey <Brian.Starkey@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lO2StNiS2UHCj8+9SsvqSbVKFte3Dujsk2JYdGhstd0=;
 b=mCSqmO2XSWm/BFp+YC0O5sy6vJ4J9PotAhn5xpwkgbLUAOKLOjfiuMwaNP4IM5w77D
 1S15TG8+HjOpw2soOliWnJE23GXyYl2TXYvWNZArL9GbV9beblrMKFHKZdicosRbE4fq
 yp47axUjsA6baFIHyOPPi3/rWce8BrLV6v0ZzfuMzwDU7prEK6y90itiERMCUMZV/lMu
 m9sJHdbbrS7aaHwvAfm2Uk4/Y36IHrBd+TkMqVp8Kgr9XjSui6C2usRZeEb1khK3depA
 U8LSiLkppE1IwqCCKIY5Nt4HDOBkjfuqMc4CQnwdfb+Grr1qOSqeYO3yF2hjUZY/LLGH
 TFjg==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgNDoxOCBBTSBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFy
a2V5QGFybS5jb20+IHdyb3RlOgo+IE9uIEZyaSwgT2N0IDE4LCAyMDE5IGF0IDA1OjIzOjE5QU0g
KzAwMDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+Cj4gQXMgaW4gdjM6Cj4KPiAgKiBBdm9pZCBFWFBP
UlRfU1lNQk9MIHVudGlsIHdlIGZpbmFsaXplIG1vZHVsZXMgKHN1Z2dlc3RlZCBieQo+ICAgIEJy
aWFuKQoKSGVoLiBJIGd1ZXNzIGl0IGhhcyBiZWVuIGF3aGlsZS4gIDopCgo+IERpZCBzb21ldGhp
bmcgY2hhbmdlIGluIHRoYXQgcmVnYXJkPyBJIHN0aWxsIHRoaW5rIGxldHRpbmcgbW9kdWxlcwo+
IHJlZ2lzdGVyIGhlYXBzIHdpdGhvdXQgYSB3YXkgdG8gcmVtb3ZlIHRoZW0gaXMgYSByZWNpcGUg
Zm9yIGlzc3Vlcy4KClNvIHllYSwgaW4gcmVjZW50IG1vbnRocywgd29yayBhcm91bmQgQW5kcm9p
ZCB3aXRoIHRoZWlyIEdLSSBlZmZvcnQKaGFzIG1hZGUgaXQgbmVjZXNzYXJ5IGZvciBJT04gaGVh
cHMgdG8gYmUgbG9hZGFibGUgZnJvbSBtb2R1bGVzLiBJIGhhZApzb21lIHBhdGNoZXMgaW4gV0lQ
IHRyZWUgdG8gZW5hYmxlIHRoaXMsIGFuZCBpbiB0aGUgcmV3b3JrIEkgZGlkCnllc3RlcmRheSBm
b3IgdGhlIENNQSBtb2R1bGUgdHJpdmlhbGx5IGNvbGxpZGVkIHdpdGggcGFydHMsIGFuZApmb3Jn
ZXR0aW5nIHRoZSBkaXNjdXNzaW9uIGJhY2sgaW4gdjMsIEkgZmlndXJlZCBJJ2QganVzdCBmb2xk
IHRob3NlCmJpdHMgaW4gYmVmb3JlIEkgcmVzdWJtaXR0ZWQgZm9yIHYxMi4KCklmIGl0J3MgYW4g
aXNzdWUsIEkgY2FuIHB1bGwgaXQgb3V0LCBidXQgSSdtIGdvaW5nIHRvIGJlIHN1Ym1pdHRpbmcK
bW9kdWxlIGVuYWJsZW1lbnQgZm9yIHJldmlldyBhcyBzb29uIGFzIHRoZSBjb3JlIGJpdHMgYXJl
IHF1ZXVlZCwgYXMKaXRzIGdvaW5nIHRvIGJlIGltcG9ydGFudCB0byBzdXBwb3J0IGZvciBBbmRy
b2lkIHRvIHN3aXRjaCB0byB0aGlzCmZyb20gSU9OLgoKdGhhbmtzCi1qb2huCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
