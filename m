Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3295B56B1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 22:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2652E6ED41;
	Tue, 17 Sep 2019 20:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349696ED40
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 20:08:18 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id e18so4053675oii.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 13:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hogc/92S8/u/DUogFIB6MZH6mO5Gji1BbREYssF21ZI=;
 b=JaVTeHPf1vFjrLOzpXvi50m/4OXF1QLhs9kVjPM00VEjepws8EKSOOyIjZiPdtA2QQ
 Lu8Y8KBPA9gLRExIDzI7sZM40QiXn6jpaElabQ5i4NFpTY8Fb9704DhGYxbKoHENQgYJ
 WX1KFEex5QdKdHRw8IlAvNdwrydnsv0wCBSFVEXS91x3yjLDFwqvTw+8m+cGFvi4Ypmt
 9hdWMMfeJKj218bH5R1CkRz9DBx3Nl6GPeYwLig2OTyy8qhVEeKzHAFVMPZQaDXA+0OH
 a5LH8ggDkIbQ8yFvWiB9W9Vo849Z+kf/kvXoXHTpAZ76HvQel1dSBg9skXX+ScnsPrAh
 DKyg==
X-Gm-Message-State: APjAAAUCvGU6S+qTVTdyCFkkuzi4WMUUwvXQPyvSGwi7jyey2zq9Agnc
 SMF2JxBHtgCOmcHUoqkw6YQgegyofA==
X-Google-Smtp-Source: APXvYqzFGTenJyiV9FyX5Dm5tzOndO9FlAzGE1mpSP3LOGeYCu62xyqYJaDeLNgqxRiN0ELUJbqGsQ==
X-Received: by 2002:a05:6808:302:: with SMTP id
 i2mr3244340oie.176.1568750897306; 
 Tue, 17 Sep 2019 13:08:17 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i17sm994400oii.3.2019.09.17.13.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 13:08:16 -0700 (PDT)
Date: Tue, 17 Sep 2019 15:08:16 -0500
From: Rob Herring <robh@kernel.org>
To: Maciej Falkowski <m.falkowski@samsung.com>
Subject: Re: [PATCH v3] dt-bindings: gpu: Convert Samsung Image Rotator to
 dt-schema
Message-ID: <20190917200816.GA10224@bogus>
References: <20190913062945.GA10283@pi3>
 <CGME20190917103758eucas1p10793e499209137630681186a10a4b7bd@eucas1p1.samsung.com>
 <20190917103727.14997-1-m.falkowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190917103727.14997-1-m.falkowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, m.falkowski@samsung.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzk@kernel.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNyBTZXAgMjAxOSAxMjozNzoyNyArMDIwMCwgTWFjaWVqIEZhbGtvd3NraSB3cm90
ZToKPiBDb252ZXJ0IFNhbXN1bmcgSW1hZ2UgUm90YXRvciB0byBuZXdlciBkdC1zY2hlbWEgZm9y
bWF0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hY2llaiBGYWxrb3dza2kgPG0uZmFsa293c2tpQHNh
bXN1bmcuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3Nr
aUBzYW1zdW5nLmNvbT4KPiAtLS0KPiB2MzoKPiAtIHJlbW92ZSB1bm5lZGVkIGNvbW1lbnRzIGFu
ZCBkZXNjcmlwdGlvbnMKPiAtIHJlbW92ZSB1bm5lZGVkIG1heEl0ZW1zIGZpZWxkIGZyb20gY2xv
Y2stbmFtZXMgcHJvcGVydHkKPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2dwdS9zYW1zdW5nLXJvdGF0
b3IudHh0ICAgICAgICAgIHwgMjggLS0tLS0tLS0tLS0KPiAgLi4uL2JpbmRpbmdzL2dwdS9zYW1z
dW5nLXJvdGF0b3IueWFtbCAgICAgICAgIHwgNDggKysrKysrKysrKysrKysrKysrKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+ICBkZWxldGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9zYW1zdW5n
LXJvdGF0b3IudHh0Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZ3B1L3NhbXN1bmctcm90YXRvci55YW1sCj4gCgpBcHBsaWVkLCB0aGFua3Mu
CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
