Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17207A9D96
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 10:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E938089D02;
	Thu,  5 Sep 2019 08:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5015189D02
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 08:56:11 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01F4522CEC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 08:56:10 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id u40so1845285qth.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 01:56:10 -0700 (PDT)
X-Gm-Message-State: APjAAAUEGCb/TPEylu9d3GI4LMIay/u76CPUvs/4NgJUv1pHDkHY9stk
 3D/EGrSLDRjYj7Wq9luaDCNpJ3uBX6uYYYr12w==
X-Google-Smtp-Source: APXvYqwe7WYxk3XElGIIkDrb0I2DrV8ccOBgRzEx1xzn6PSLs7xZ9sDEOQkVezo7W2c1bqph8/273A3ZNIydErCuYfc=
X-Received: by 2002:ac8:6b05:: with SMTP id w5mr2408517qts.136.1567673770094; 
 Thu, 05 Sep 2019 01:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-147-sashal@kernel.org>
In-Reply-To: <20190903162519.7136-147-sashal@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 5 Sep 2019 09:55:58 +0100
X-Gmail-Original-Message-ID: <CAL_JsqJrwwsp1wjCBnNmx45ZiLTXVY_nCfN6OrJ5o9dLbc+_2w@mail.gmail.com>
Message-ID: <CAL_JsqJrwwsp1wjCBnNmx45ZiLTXVY_nCfN6OrJ5o9dLbc+_2w@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 4.19 147/167] drm/panel: Add support for Armadeus
 ST0700 Adapt
To: Sasha Levin <sashal@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567673771;
 bh=nxynrq1ZfNXPmxOvki9jsnLzdsi03WB1FQJR4M9tk9E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ecyFj7MxRKASyJLrsL7kjE7VL6EGorP4cT5Z64pFYPksHfFHpZq++Vistm/eDhA/I
 GlZ7DfdU8fVfLFoqLKajsUIIuXI1A3dnnvl9MPvfN4Iq0XowyLbXSdttXZoUpwNFgd
 MyejiMAf0qs1wvlS8CdTggdiz2OzFkcNkbGHpyNk=
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCA1OjMxIFBNIFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6
eW1hbnNraUBhcm1hZGV1cy5jb20+Cj4KPiBbIFVwc3RyZWFtIGNvbW1pdCBjNDc5NDUwZjYxYzdm
MWYyNDhjOWE1NGFlZGFjZDJhNmNhNTIxZmY4IF0KPgo+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0
IGZvciB0aGUgQXJtYWRldXMgU1QwNzAwIEFkYXB0LiBJdCBjb21lcyB3aXRoIGEKPiBTYW50ZWsg
U1QwNzAwSTVZLVJCU0xXIDcuMCIgV1ZHQSAoODAweDQ4MCkgVEZUIGFuZCBhbiBhZGFwdGVyIGJv
YXJkIHNvCj4gdGhhdCBpdCBjYW4gYmUgY29ubmVjdGVkIG9uIHRoZSBURlQgaGVhZGVyIG9mIEFy
bWFkZXVzIERldiBib2FyZHMuCj4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY0LjE5
Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9m
Zi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBM
aW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA1
MDcxNTI3MTMuMjc0OTQtMS1zZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbQo+IFNpZ25l
ZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KPiAtLS0KPiAgLi4uL2Rp
c3BsYXkvcGFuZWwvYXJtYWRldXMsc3QwNzAwLWFkYXB0LnR4dCAgIHwgIDkgKysrKysrCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyAgICAgICAgICB8IDI5ICsrKysrKysr
KysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9hcm1hZGV1cyxzdDA3MDAtYWRhcHQudHh0CgpMb29rcyBsaWtlIGEgbmV3IGZlYXR1cmUs
IG5vdCBzdGFibGUgbWF0ZXJpYWwuIE5vdCBzdXJlIHdoeSBpdCBnb3QKdGFnZ2VkIGZvciBzdGFi
bGUuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
