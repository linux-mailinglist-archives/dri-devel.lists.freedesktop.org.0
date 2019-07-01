Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAFC5C4BB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A535389DBF;
	Mon,  1 Jul 2019 20:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC0289D00;
 Mon,  1 Jul 2019 20:22:39 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id u19so23262289ior.9;
 Mon, 01 Jul 2019 13:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I1GjeEITaALvhm8pAAmaP+3EXBqqOojgJYfM1DzUyl4=;
 b=DaVOPmPTSUdqTMIKHSzr3A3KzenEPkytWNJzGhsLig+4YwGaR+yDCesH4FUBtyfhYg
 uq4u8JoE5a1eoM4/Q6iErun0OBAhTbiNoskqDDG/MCzMGGh1REUoMGQUYOrS/cXVVXZm
 B/EvN5bB1GI0hAyrsC9d/s8IiLZi0S/0aHVMhmhaugtOaDwchH0psoBV6mF+olKg1o3f
 zUPwd8+8VW4I2jFGl6UQRBjY9Cw8HPrcimCO2RVdKCIXA1Shn2+r3eb9BjH+RCStmC3i
 WfyaJtdtBvAZCRplNYlCDAQ+X2NC/OApXqL2h8gkiD3WIGawQEl2N2jG+3FbTUTY0bsY
 e05g==
X-Gm-Message-State: APjAAAUCGRCnypL/7RYC+oWDPYbU3AhV5+bKAChYUzQg2cyg+XiOqYEA
 Y64tYGkWRAksdKXblzSz4Ox6oQ0G3sG6UlH/JYw=
X-Google-Smtp-Source: APXvYqxVBTG47CwHCdrXmA5JNt7wro7euLefJZUOOmQ+NthLv4IjR3SFYlhyAyNGvyaQ7VNb5UxSB7N5f7nMOOlzbGA=
X-Received: by 2002:a6b:901:: with SMTP id t1mr22675024ioi.42.1562012558828;
 Mon, 01 Jul 2019 13:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
 <CAF6AEGu=Pv5mCKA7QDVGPjhFShmD2cfKWNZk26PTQSSQzbzKXA@mail.gmail.com>
In-Reply-To: <CAF6AEGu=Pv5mCKA7QDVGPjhFShmD2cfKWNZk26PTQSSQzbzKXA@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 1 Jul 2019 14:22:27 -0600
Message-ID: <CAOCk7NqvDgUJ6Nr217ftaB5R6i3LCMbdsiEOhrmt9-StPfV5kg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use drm_device for creating gem address
 space
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=I1GjeEITaALvhm8pAAmaP+3EXBqqOojgJYfM1DzUyl4=;
 b=ljiAZQXjCG4pFHtSRCcPXocbqglD4vhZPuwJC84rX30dPSNf0N3UPo8R08EQtHKzcD
 bPlDY6tg/r4gkkYT8VsXyWWjkfqZBRr7VnuAU82Q3x02rfFkrr+9dhSo+QsdhFaqeAPD
 FEzS5DKZj9LBi8UzkRXTkKcm8mtLHJBWYDDdFuAZU+lxwY5be8vvc2lxXhT4IE+vu0Un
 BNfU7vLcCgzf3Xa7Ztrf3h8T1HKncve6yvVG5RaE50d0YdarMfYu9/X2E4VIx2S8JIFl
 TSQEb4RkZ/ozuP/OJ8bWIz9tmQF53PKa/rJCQ0SC7uwfoMldSqlRWIYp8TrBcDXKXpkK
 dkwA==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMSwgMjAxOSBhdCAxOjQ1IFBNIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAxLCAyMDE5IGF0IDEwOjM5IEFNIEplZmZyZXkg
SHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBDcmVhdGluZyB0
aGUgbXNtIGdlbSBhZGRyZXNzIHNwYWNlIHJlcXVpcmVzIGEgcmVmZXJlbmNlIHRvIHRoZSBkZXYg
d2hlcmUKPiA+IHRoZSBpb21tdSBpcyBsb2NhdGVkLiAgVGhlIGRyaXZlciBjdXJyZW50bHkgYXNz
dW1lcyB0aGlzIGlzIHRoZSBzYW1lIGFzCj4gPiB0aGUgcGxhdGZvcm0gZGV2aWNlLCB3aGljaCBi
cmVha3Mgd2hlbiB0aGUgaW9tbXUgaXMgb3V0c2lkZSBvZiB0aGUKPiA+IHBsYXRmb3JtIGRldmlj
ZS4gIFVzZSB0aGUgZHJtX2RldmljZSBpbnN0ZWFkLCB3aGljaCBoYXBwZW5zIHRvIGFsd2F5cyBo
YXZlCj4gPiBhIHJlZmVyZW5jZSB0byB0aGUgcHJvcGVyIGRldmljZS4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMgfCAyICstCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCj4gPiBpbmRleCA0YTYwZjVmY2E2
YjAuLjEzNDdhNTIyMzkxOCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9tZHA1L21kcDVfa21zLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1
L21kcDVfa21zLmMKPiA+IEBAIC03MDIsNyArNzAyLDcgQEAgc3RydWN0IG1zbV9rbXMgKm1kcDVf
a21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiA+ICAgICAgICAgbWRlbGF5KDE2KTsK
PiA+Cj4gPiAgICAgICAgIGlmIChjb25maWctPnBsYXRmb3JtLmlvbW11KSB7Cj4gPiAtICAgICAg
ICAgICAgICAgYXNwYWNlID0gbXNtX2dlbV9hZGRyZXNzX3NwYWNlX2NyZWF0ZSgmcGRldi0+ZGV2
LAo+ID4gKyAgICAgICAgICAgICAgIGFzcGFjZSA9IG1zbV9nZW1fYWRkcmVzc19zcGFjZV9jcmVh
dGUoZGV2LT5kZXYsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZpZy0+
cGxhdGZvcm0uaW9tbXUsICJtZHA1Iik7Cj4KPiBobW0sIGRvIHlvdSBoYXZlIGEgdHJlZSBzb21l
d2hlcmUgd2l0aCB5b3VyIGR0IGZpbGVzPyAgVGhpcyBtYWtlcyBtZQo+IHRoaW5rIHRoZSBkaXNw
bGF5IGlvbW11IGlzIGhvb2tlZCB1cCBzb21ld2hlcmUgZGlmZmVyZW50bHkgY29tcGFyZWQKPiB0
bywgc2F5LCBtc204OTE2LmR0c2kKCkknbGwgcG9zdCBzb21ldGhpbmcgc29tZXdoZXJlIGFuZCBm
b3J3YXJkIGl0IHRvIHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
