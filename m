Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C6E61B14
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF2F89B30;
	Mon,  8 Jul 2019 07:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B9189762
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 18:47:18 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id j6so21081349ioa.5
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 11:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e1s/k43Uef/oTZ066ashsVWzI7Tt+ue2hhBa4/5vSY8=;
 b=GNStnGonaf1UE3DcICe9e5kcQ26a88d+tZKoJ8W4Ro1Pm2s4beJIG5mDZ9H+iiqJfp
 2AuFKBEH/eAxZXmWQdbaXyIjesKxZD16Zcp5TgNvSML0ZGNnGJho7Tk53aSQgP4cDgWN
 FaWJgar/ksh40FsThkHhTO/e2XFuLbq14KeGXj+IUDY88G1HsgaVti79Cq1rzOfA0L30
 Jc6gEsuWl5O20IeOVuahXftPqBhH3DGvJS+AH78kgA5SxUmVjQjUviABEhVdpJXYkuUl
 xe62vlgqUy1zP/I7TrQm9BqMKCqBSrBV70/XVK5SJw0Cj2mwozv0CKS/GWB9q2MPG6WJ
 L86Q==
X-Gm-Message-State: APjAAAWmgOMnH1IC3/hyaadFsEhYSBgJ1aPo9CeWnmreeH4kgZ7RRaG1
 p04FPm2I4g+mGqSr6sRzey/F0s4RE4sMtMEzHguY5w==
X-Google-Smtp-Source: APXvYqwe/lOZqTMnRDY7Swtv9Fp4sctE1ATThpdg1r/J8kj+FhdaVVgjYdjeXRQ1YQvjfA/lu8RkKXTGyy+WWuejpmQ=
X-Received: by 2002:a02:c50a:: with SMTP id s10mr6427939jam.106.1562351944338; 
 Fri, 05 Jul 2019 11:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165655.456-1-jeffrey.l.hugo@gmail.com>
 <20190705172338.GB2788@ravnborg.org>
In-Reply-To: <20190705172338.GB2788@ravnborg.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Fri, 5 Jul 2019 12:38:54 -0600
Message-ID: <CAOCk7NoCq0k2rCC4XQm_yLxgQir1bqLwJMGwD1qDCHQJRUEC8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=e1s/k43Uef/oTZ066ashsVWzI7Tt+ue2hhBa4/5vSY8=;
 b=HHAshVYuxSLMcBpfsVyE710re2bMPnXjz2lor83rqUHC7wpBI9j0Umy9JS8PGUz1me
 8bg7v5s3JYFtsPMXh47sH2xaxAkW9mvENDvNv9xQBVr+C0ZMksvV/mGRD5S6C9uEabIE
 +iC9o+j2DqDoMgcUwu7y4xDDVWui30NxDWrxsgZ1uAFymPyeOeNWZtWXTeug/+Lzz9xR
 MYpiM1BKSM9WNckqLDqIgdHZg5dOa38Ijwea7yN8Q4UdfuBAq64mj1AGIdETJuOXFCnr
 s/10ufHZIWrSd9Hpq7qJQTan33d1nUwTL3l7SzJZeA73XocbIY4KW9K6pa3rL+yR6w5h
 CbcA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Dave Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxMToyMyBBTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgSmVmZnJleS4KPgo+IE9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0
IDA5OjU2OjU1QU0gLTA3MDAsIEplZmZyZXkgSHVnbyB3cm90ZToKPiA+ICsgICAgIHBhbmVsOiBw
YW5lbCB7Cj4gPiArICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2hhcnAsbGQtZDUxMTZ6MDFi
IjsKPiA+ICsgICAgICAgICAgICAgcG93ZXItc3VwcGx5ID0gPCZ2bGNkXzN2Mz47Cj4gPiArICAg
ICAgICAgICAgIG5vLWhwZAo+IFRoZSBiaW5kaW5nIGRvIG5vdCBtZW50aW9uIG5vLWhwZCAtIGJ1
dCBpdCBpcyBwYXJ0IG9mIHBhbmVsLXNpbXBsZQo+IGJpbmRpbmcuIElzIGl0IGluY2x1ZGVkIGlu
IHRoZSBleGFtcGxlIGZvciBhbnkgc3BlY2lhbCByZWFzb24/CgpJIGp1c3QgY29waWVkIChwb29y
bHkgYXBwYXJlbnRseSBzaW5jZSBhICI7IiBpcyBtaXNzaW5nKSBmcm9tIG15CnBsYXRmb3JtJ3Mg
ZHQuICBUaGVyZSBpcyBubyBwYXJ0aWN1bGFyIHJlYXNvbiB0aGUgZXhhbXBsZSBsaXN0cwpuby1o
cGQuICBJJ2xsIGRyb3AgaXQgaW4gdGhlIG5leHQgcmV2LgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
