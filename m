Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDF457427
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 00:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F80D6E532;
	Wed, 26 Jun 2019 22:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A386E532;
 Wed, 26 Jun 2019 22:15:27 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id d4so5080832edr.13;
 Wed, 26 Jun 2019 15:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zemuVaUHq/tphy/ciHMFp8B8qf7n17M0tqs1U3HVNUA=;
 b=OitbyRBSOHkb2+sAzmgLkCr5Ls6OEEaop6c4euIU28uVB6pTRfBIpuuuAwf7a2DZrl
 ByAmPxulyr6WEQtTrBKhdAtWf8Hc4ptD757prVLiK/PKhUnImzpFj0H3H86iRDBi0IqQ
 8w9IA1uaaR215SWv5raVS3qp7VgIui+S08ghplAfP6wqYksj62HOmprYuh3psIt1nIr3
 fgt74dVtpAwpeWQMPug65/TkJl45ZOjqoq3PQZpKWRVAtpFJ1FquLwZ/w3UdMeCvEHdY
 JH+vaBJDJP2QEXHV9VaPjj0BPN2YbuYYw6cDqsq5JbL5LR3Igpy+Rx+SGp5pTeg/HLVC
 NrCg==
X-Gm-Message-State: APjAAAWLiYgHht3zW6zCuXWtnV/IrMz6ExQXUMdqC9ZOQoH1/yaVrQi/
 4Ik5/aFZDnkqds0xfqEwsLKQLRuaXxpBCqNYzWA=
X-Google-Smtp-Source: APXvYqyGfVsc/dMcR6jO79hcglfAjrPcJGKF1Z+B55tLE12kxP2ei5HxKdhsi5lm9yFS9jAZA8HHVNLKKZ89hvzj/Ow=
X-Received: by 2002:a17:906:3612:: with SMTP id
 q18mr98024ejb.278.1561587325940; 
 Wed, 26 Jun 2019 15:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190626180015.45242-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190626180015.45242-1-jeffrey.l.hugo@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Jun 2019 15:15:10 -0700
Message-ID: <CAF6AEGuLVQfwtDOr=fGEpKR9+QdYecrvm-aaJr1ahPRyu=qd6g@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: Fix add_gpu_components
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zemuVaUHq/tphy/ciHMFp8B8qf7n17M0tqs1U3HVNUA=;
 b=sIVip1emTJrjRVlVLKWWy33DQoZHWO0Z0I5dKDSqgG/SwETQ9Ws6VsRSdabsaQGnhX
 Q52J6WKzpJJFXGXKwr3GuEDddItg/HvA2IlPK6IS040GCjSI0SW6BsVLGxS6covCYPXM
 5stA83oCS9bCo/sW3a0WZHEWeUEprE15RtoozRxI4cI0l8d/88/pNOFyzbvP6LfJv9BM
 uTvG9LHhSCN0uk+hkvvchyHcBLD5o+Kmrz2LYjxeDq/b9V//TC1y0j5Y2Cl0uUUI9+/r
 0717wBPzuTTuE0V8QNndRrsU8l51qCw9KNpyjvIpd3KUNjogWab6G2z5Me6n2wyHT4Zb
 C0rg==
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

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTE6MDAgQU0gSmVmZnJleSBIdWdvIDxqZWZmcmV5Lmwu
aHVnb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gYWRkX2dwdV9jb21wb25lbnRzKCkgYWRkcyBmb3Vu
ZCBHUFUgbm9kZXMgZnJvbSB0aGUgRFQgdG8gdGhlIG1hdGNoIGxpc3QsCj4gcmVnYXJkbGVzcyBv
ZiB0aGUgc3RhdHVzIG9mIHRoZSBub2Rlcy4gIFRoaXMgaXMgYSBwcm9ibGVtLCBiZWNhdXNlIGlm
IHRoZQo+IG5vZGVzIGFyZSBkaXNhYmxlZCwgdGhleSBzaG91bGQgbm90IGJlIG9uIHRoZSBtYXRj
aCBsaXN0IGJlY2F1c2UgdGhleSB3aWxsCj4gbm90IGJlIG1hdGNoZWQuICBUaGlzIHByZXZlbnRz
IGRpc3BsYXkgZnJvbSBpbml0aW5nIGlmIGEgR1BVIG5vZGUgaXMKPiBkZWZpbmVkLCBidXQgaXQn
cyBzdGF0dXMgaXMgZGlzYWJsZWQuCj4KPiBGaXggdGhpcyBieSBjaGVja2luZyB0aGUgbm9kZSdz
IHN0YXR1cyBiZWZvcmUgYWRkaW5nIGl0IHRvIHRoZSBtYXRjaCBsaXN0LgoKaG1tLCBJIGd1ZXNz
IGEgY2FzZSBJIGhhZCBjZXJ0YWlubHkgbmV2ZXIgdGVzdGVkIDstKQoKSSB3b25kZXIgaWYgaXQg
cmVhbGx5IG1ha2VzIHNlbnNlIGZvciBncHUgdG8gZXZlciBiZSBkaXNhYmxlZCAoc2luY2UKaXQg
aXNuJ3QgZGVwZW5kaW5nIG9uIGV4dGVybmFsIG5vbi1Tb0Mtc3BlY2lmaWMgd2lyaW5nIHVwIG9m
IHRoaW5ncy4uCmJ1dCBJIGd1ZXNzIHRoYXQgbWlnaHQgc3RpbGwgYmUgdXNlZnVsIGZvciBicmlu
Zy11cC4uIGVpdGhlciB3YXksCgpSZXZpZXdlZC1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21h
aWwuY29tPgoKU2Vhbiwgd2FudCB0byBwaWNrIHRoaXMgdXAgaW4gZHJtLW1pc2MtZml4ZXM/CgpC
UiwKLVIKCj4KPiBGaXhlczogZGMzZWEyNjViODU2ICgiZHJtL21zbTogRHJvcCB0aGUgZ3B1IGJp
bmRpbmciKQo+IFNpZ25lZC1vZmYtYnk6IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21h
aWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyB8IDMgKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2Rydi5jCj4gaW5kZXggYWI2NGFiNDcwZGU3Li40YWViODRmMWQ4NzQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9kcnYuYwo+IEBAIC0xMjc5LDcgKzEyNzksOCBAQCBzdGF0aWMgaW50IGFkZF9n
cHVfY29tcG9uZW50cyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gICAgICAgICBpZiAoIW5wKQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPgo+IC0gICAgICAgZHJtX29mX2NvbXBvbmVudF9tYXRj
aF9hZGQoZGV2LCBtYXRjaHB0ciwgY29tcGFyZV9vZiwgbnApOwo+ICsgICAgICAgaWYgKG9mX2Rl
dmljZV9pc19hdmFpbGFibGUobnApKQo+ICsgICAgICAgICAgICAgICBkcm1fb2ZfY29tcG9uZW50
X21hdGNoX2FkZChkZXYsIG1hdGNocHRyLCBjb21wYXJlX29mLCBucCk7Cj4KPiAgICAgICAgIG9m
X25vZGVfcHV0KG5wKTsKPgo+IC0tCj4gMi4xNy4xCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
