Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F199E7C4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 14:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D8E898FD;
	Tue, 27 Aug 2019 12:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58994898CE;
 Tue, 27 Aug 2019 12:21:53 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 222C422CBB;
 Tue, 27 Aug 2019 12:21:53 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id v38so21055692qtb.0;
 Tue, 27 Aug 2019 05:21:53 -0700 (PDT)
X-Gm-Message-State: APjAAAVV1DQ3cJ9TkysMegRe3Y1iZ+TTnymt0kBuR3jeXjnKeb4up5ud
 MDGWIw/P241ATlfxo7MZksgh4waDAm0+VLB59Q==
X-Google-Smtp-Source: APXvYqyA08IogmVH6/eLxgDuudG/7vlKnuGh62iApaH8ZRCJvpE+Z067YCE/LHZReBYhVH85YjaQVbcpek7HBHvUyfc=
X-Received: by 2002:ac8:386f:: with SMTP id r44mr22938146qtb.300.1566908512316; 
 Tue, 27 Aug 2019 05:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190823121637.5861-1-masneyb@onstation.org>
 <20190823121637.5861-3-masneyb@onstation.org>
In-Reply-To: <20190823121637.5861-3-masneyb@onstation.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Aug 2019 07:21:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLmaE+6Lj6KDgscK3OO=fsCGM=90eRCYK_gBA7bdkEbEg@mail.gmail.com>
Message-ID: <CAL_JsqLmaE+6Lj6KDgscK3OO=fsCGM=90eRCYK_gBA7bdkEbEg@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] dt-bindings: display: msm: gmu: add optional ocmem
 property
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566908513;
 bh=eit3RrFqNrNE4vZrZrZF8s6p9Ki/i527M3cLIrYgSgk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K+bhF6LQlv0PWuqu69sB60FlA8VjbX6q7t88std4fDvwW+Qdv9KvM0+06G4BpppUE
 Tq7Cm1xEVtY69dumS4ki+R8Lx4ZUFhuF9PEy4Xz7vrH+kntlW5Qv1SH6JUm28eC46r
 UVt7J4YMad9VT8qigX+DqJi8v3/FaWGHckQXRWjE=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgNzoxNiBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBTb21lIEEzeHggYW5kIEE0eHggQWRyZW5vIEdQVXMgZG8g
bm90IGhhdmUgR01FTSBpbnNpZGUgdGhlIEdQVSBjb3JlIGFuZAo+IG11c3QgdXNlIHRoZSBPbiBD
aGlwIE1FTW9yeSAoT0NNRU0pIGluIG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwuIEFkZCB0aGUKPiBv
cHRpb25hbCBvY21lbSBwcm9wZXJ0eSB0byB0aGUgQWRyZW5vIEdyYXBoaWNzIE1hbmFnZW1lbnQg
VW5pdCBiaW5kaW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBv
bnN0YXRpb24ub3JnPgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjY6Cj4gLSBsaW5rIHRvIGdtdS1z
cmFtIGluIGV4YW1wbGUKPiAtIGFkZCByYW5nZXMgcHJvcGVydHkgdG8gb2NtZW0gZXhhbXBsZSB0
byBtYXRjaCBiaW5kaW5ncwo+Cj4gQ2hhbmdlcyBzaW5jZSB2NToKPiAtIHJlbmFtZSBvY21lbSBw
cm9wZXJ0eSB0byBzcmFtIHRvIG1hdGNoIHdoYXQgVEkgY3VycmVudGx5IGhhcy4KPgo+IENoYW5n
ZXMgc2luY2UgdjQ6Cj4gLSBOb25lCj4KPiBDaGFuZ2VzIHNpbmNlIHYzOgo+IC0gY29ycmVjdCBs
aW5rIHRvIHFjb20sb2NtZW0ueWFtbAo+Cj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiAtIEFkZCBhM3h4
IGV4YW1wbGUgd2l0aCBPQ01FTQo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIE5vbmUKPgo+ICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0ICAgfCA1MSArKysrKysr
KysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspCgpSZXZpZXdl
ZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
