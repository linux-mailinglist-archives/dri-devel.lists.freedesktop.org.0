Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BCCD6404
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 15:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433C06E4C7;
	Mon, 14 Oct 2019 13:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB1B6E4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 13:24:04 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1A4821925
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 13:24:03 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id x134so15878370qkb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 06:24:03 -0700 (PDT)
X-Gm-Message-State: APjAAAW7fXcj2Z33CFa54Lv/7HPYVZqDW5XCmKhHYun/iMZnuOT0uHTy
 oqPdesMYaVFnsJfo4uo0idZ2i1dXjxV5o2/cuQ==
X-Google-Smtp-Source: APXvYqwFZz5r02Q8zvQ+0YwyjuVSCha6+fsX0DiB2cUKhQvltP4Evo5NpCWKG2okrETOAf6t3D5ierG7w/sOMPF08GE=
X-Received: by 2002:a37:9847:: with SMTP id a68mr30353019qke.223.1571059443085; 
 Mon, 14 Oct 2019 06:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <1570025100-5634-1-git-send-email-laurentiu.palcu@nxp.com>
 <1570025100-5634-5-git-send-email-laurentiu.palcu@nxp.com>
 <20191011145042.GA15680@bogus> <20191014080327.GB14065@fsr-ub1664-121>
In-Reply-To: <20191014080327.GB14065@fsr-ub1664-121>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Oct 2019 08:23:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJZHq=jDoK66bTHK+oqSvdrFh9x5a_cNe1hkFdALfs8vw@mail.gmail.com>
Message-ID: <CAL_JsqJZHq=jDoK66bTHK+oqSvdrFh9x5a_cNe1hkFdALfs8vw@mail.gmail.com>
Subject: Re: Re: [PATCH v2 4/5] dt-bindings: display: imx: add bindings for
 DCSS
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571059444;
 bh=m6XF4o4SsSJ4V485gjFJ25vq9Pu6PVzZfoLQRS3+ep8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YjNLUTo+t3LVgzzI3OkZol6ldaNw/9LGK07uaQQ5g1tHyRtRdE2+G/IjVXLH+lJv4
 vUNIH4zaosIrSmUs4bUkBUHaDbrFdGaE6pYJGZJAdGVoVcnyb2do/QgmaS00As2C+4
 aK3Jx1bBpCP6cs9oGkobyq1PjhRFXDMh7kbe231Q=
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "agx@sigxcpu.org" <agx@sigxcpu.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMzowMyBBTSBMYXVyZW50aXUgUGFsY3UgPGxhdXJlbnRp
dS5wYWxjdUBueHAuY29tPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IE9uIEZyaSwgT2N0IDExLCAy
MDE5IGF0IDA5OjUwOjQyQU0gLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gOnU/d2M/P201
P14/456+P300LT8/entiPz8/cj8rP9eAdT8/P9inPz8/PyMgPz8gPz9layA/Pz8/P1c/Sj8/Pz9e
Pyg/Pz9ofT8/LT8/entiPz8/cj9aPz8/Pys/alcuPyBcP2/bindiPyA/dispPz8/P2wgPyBiPyAm
Pz8sPyY/P86+Pz8/Pz8/Pz8/Pz8/Pz8/P1c/Pz8hanggd86iP8erPyonPz8reT9ePz9eP006Pz8/
cumentatPz8/dT8/cT9reT/bindiPyA/dispPz8/P2wgPyBiPyAmPz8sPyY/PyA/Pz8gdT8/Pz/e
rj8/Pz8gP0c/Pz9oCj4KPiBPayEgTm90IHN1cmUgaG93IHRvIGFkZHJlc3MgdGhpcyB0aG91Z2gu
Li4gOikKCllvdXIgbWFpbCB3YXMgYmFzZTY0IHdoaWNoIGlkZWFsbHkgc2hvdWxkIGJlIGF2b2lk
ZWQgb24gbWFpbGxpc3RzLiBNeQpzY3JpcHRpbmcgdHJpZXMgdG8gZGVhbCB3aXRoIGl0LCBidXQg
ZmFpbGVkIG9idmlvdXNseS4gV2hhdCBJIHNhaWQKd2FzOgoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
