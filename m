Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3742918DF8A
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 11:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AD06E2F0;
	Sat, 21 Mar 2020 10:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD486EAE1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 08:07:44 +0000 (UTC)
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id c47444be
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Fri, 20 Mar 2020 01:07:41 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 4DFA54CC97;
 Fri, 20 Mar 2020 08:07:37 +0000 (UTC)
Date: Fri, 20 Mar 2020 15:58:09 +0800
In-Reply-To: <CACRpkdaVrfd1p+WyACy-gq-3BPsXJ_CZwi2OZe+=csseBcvcaA@mail.gmail.com>
References: <20200316133503.144650-1-icenowy@aosc.io>
 <20200316133503.144650-3-icenowy@aosc.io>
 <CACRpkdaVrfd1p+WyACy-gq-3BPsXJ_CZwi2OZe+=csseBcvcaA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/5] dt-bindings: panel: add binding for Xingbangda
 XBD599 panel
To: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <491ADD02-5511-404B-88A8-5725EF061EAC@aosc.io>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1584691659;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references;
 bh=stsS4dj9oBV/7b45QdrFyqP0smVpfXDmrt3Ueus/OeQ=;
 b=GtADa9cpqzkGuQKMBAZQjihl/+F10s/Hpdjay+d0XsQ1X1T0QH1GPjjqXzeH7LKeP1+eaE
 PFopxiao42wyUcVgcZaQTj5Za9JwlH36zazAmYYv3wkGqvuSHY1oT67WPNFq1YHUyqENjh
 8P3ylWO5/C4wiSlzq9FMcI7DoyWHAKM=
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:31 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgrkuo4gMjAyMOW5tDPmnIgxOeaXpSBHTVQrMDg6MDAg5LiL5Y2IMTA6MTQ6MjcsIExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4g5YaZ5YiwOgo+SGkgSWNlbm93eSwKPgo+
T24gTW9uLCBNYXIgMTYsIDIwMjAgYXQgMjozNyBQTSBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFv
c2MuaW8+IHdyb3RlOgo+Cj4+IFhpbmdiYW5nZGEgWEJENTk5IGlzIGEgNS45OSIgNzIweDE0NDAg
TUlQSS1EU0kgTENEIHBhbmVsLgo+Pgo+PiBBZGQgaXRzIGRldmljZSB0cmVlIGJpbmRpbmcuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPiguLi4p
Cj4KPj4gK3Byb3BlcnRpZXM6Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IHhpbmdi
YW5nZGEseGJkNTk5Cj4KPkFzIG5vdGljZWQgaW4gdGhlIHJldmlldyBvZiB0aGUgZHJpdmVyLCB0
aGlzIGRpc3BsYXkgaXMgdmVyeSBjbG9zZSB0bwo+aGltYXgsaHg4MzYzLgo+Cj5JIHRoaW5rIHRo
ZSBiZXN0IGlzIHRvIGRldGVybWluIHdoYXQgYWN0dWFsIGRpc3BsYXkgY29udHJvbGxlciBpdCBp
cywKPkkgdGhpbmsgaXQgaXMgc29tZSBraW5kIG9mIElsaXRlayBjb250cm9sbGVyIHNpbmNlIEls
aXRlayBpbGk5MzQyIGlzCj5jbGVhcmx5IHZlcnkgc2ltaWxhci4KCkl0J3MgU2l0cm9uaXggU1Q3
NzAzLCBzYW1lIGFzIHRoZSBMaWJyZW0gNSBwYW5lbC4KCj4KPlRoZSBiZXN0IHdvdWxkIGJlIHNv
bWV0aGluZyBsaWtlIG5hbWUgdGhlIGJpbmRpbmdzCj5pbGl0ZWstaWxpOTM0Mi55YW1sIGFuZCB0
aGVuOgo+Cj5wcm9wZXJ0aWVzOgo+ICBjb21wYXRpYmxlOgo+ICAgIGl0ZW1zOgo+ICAgICAgLSBj
b25zdDogeGluZ2JhbmdkYSx4YmQ1OTkKPiAgICAgIC0gY29uc3Q6IGlsaXRlayxpbGk5MzQyCj4K
PlBvc3NpYmx5IHVzZSBvbmVPZiBhbmQgYWRkIHN1cHBvcnQgZm9yIHRoZSBoaW1heCxoeDgzNjMK
PmFscmVhZHkgd2hpbGUgeW91J3JlIGF0IGl0Lgo+Cj5Zb3VycywKPkxpbnVzIFdhbGxlaWoKPgo+
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0Cj5saW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKPmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAoKLS0gCuS9v+eUqCBLLTkgTWFpbCDlj5HpgIHoh6rmiJHnmoRBbmRyb2lk6K6+5aSH
44CCCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
