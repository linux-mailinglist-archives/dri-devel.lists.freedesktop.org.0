Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E881030943
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 09:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1643489227;
	Fri, 31 May 2019 07:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B183F892A0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 07:21:35 +0000 (UTC)
Received: by mail-it1-x142.google.com with SMTP id i63so9383743ita.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 00:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QBBKhSbZP7EAiicuPXkBfvJuEZTNKNpMjn27c5MZ3Dc=;
 b=qhEEqvbiCDUMPnGU4aX01W1APSFe4tTOvkzy4YbpCAeyjNTg9RGjQY54k0rqL0bU0m
 amLWwx6drehkFVCtrnWU2Hg6lr0yDmps2TAZ9k75vMSpwXPLdvS7cfWXvZaYRMraxv3/
 D1GauZJnmLvzRz4JRURDPt0v6Uxi+rnbmDo4b3oWC8hF/EQGBPxuo8/mFsd9dmG4vu04
 onbUOO7nhhkj+PkCeQivE/7U7fJpK/sN7IwDtfuuCJDaLDklC354KcLtWpgEOTw3uF8Z
 NQW6TMZSW8Vd8biyzkp0+HFZxR4/GEbNZlLpGXPqnrggrDu8YplmysuXcMn8gBtof6cE
 Wy4w==
X-Gm-Message-State: APjAAAVQ29sHyel8aH5xJXuCcV+yhOyKmFZxenYuOQpOhgTqiU2cKjJR
 WGV0ltKjt/sInnlT5kCFETHxTUyVTiDjGD9B8q/+sg==
X-Google-Smtp-Source: APXvYqz2PDD+zioaMHLifADW+9kK68f43tOq4Amc0xMgAm0W/t6TnadR93Ukk5QMxHkQCpAl7zFjHTl9o7dS+amRmzU=
X-Received: by 2002:a24:2846:: with SMTP id h67mr6274629ith.94.1559287294453; 
 Fri, 31 May 2019 00:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
 <20190529105615.14027-2-jagan@amarulasolutions.com>
 <20190531065928.4wfr3kjngefy4q2b@flea>
In-Reply-To: <20190531065928.4wfr3kjngefy4q2b@flea>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 31 May 2019 12:51:23 +0530
Message-ID: <CAMty3ZBTu5DqcL+u6KTUC=Ofe9Gwdcu8VT-kSwWb2O3n9gnrWQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/9] dt-bindings: sun6i-dsi: Add A64 MIPI-DSI compatible
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QBBKhSbZP7EAiicuPXkBfvJuEZTNKNpMjn27c5MZ3Dc=;
 b=AGwQrFiOCXgty4N4Ai5lLfQQ6Xg6MpVZHZRCHn9hb3ZDqRg/wR45SafGZhZKmmDC8y
 rHi8kv3AK9Dyf1clZUArh8rLaWgNT8PRSYqvMkcfx4hMo41rbMKlE53+ta/onOJtH6oo
 dfsWtjfgGEsFvdUTkgJxMtxVJftBAPsCWuVaQ=
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
Cc: devicetree <devicetree@vger.kernel.org>, Ryan Pannell <ryan@osukl.com>,
 Bhushan Shah <bshah@mykolab.com>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Sergey Suloev <ssuloev@orpaltech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMTI6MjkgUE0gTWF4aW1lIFJpcGFyZAo8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAyOSwgMjAxOSBhdCAwNDoy
NjowN1BNICswNTMwLCBKYWdhbiBUZWtpIHdyb3RlOgo+ID4gVGhlIE1JUEkgRFNJIGNvbnRyb2xs
ZXIgaW4gQWxsd2lubmVyIEE2NCBpcyBzaW1pbGFyIHRvIEEzMy4KPiA+Cj4gPiBCdXQgdW5saWtl
IEEzMywgQTY0IGRvZXNuJ3QgaGF2ZSBEU0lfU0NMSyBnYXRpbmcgc28gaXQgaXMgdmFsaWQKPiA+
IHRvIHdpdGggc2VwYXJhdGUgY29tcGF0aWJsZSBmb3IgQTY0IG9uIHRoZSBzYW1lIGRyaXZlci4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25z
LmNvbT4KPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4g
VGVzdGVkLWJ5OiBNZXJsaWpuIFdhamVyIDxtZXJsaWpuQHdpenp1cC5vcmc+Cj4gPiAtLS0KPiA+
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW42aS1k
c2kudHh0IHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1
bnhpL3N1bjZpLWRzaS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9zdW54aS9zdW42aS1kc2kudHh0Cj4gPiBpbmRleCAxY2M0MDY2M2I3YTIuLjk4NzczOThi
ZTY5YSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQKPiA+IEBAIC0xMiw2ICsx
Miw3IEBAIFRoZSBEU0kgRW5jb2RlciBnZW5lcmF0ZXMgdGhlIERTSSBzaWduYWwgZnJvbSB0aGUg
VENPTidzLgo+ID4gIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gPiAgICAtIGNvbXBhdGlibGU6IHZh
bHVlIG11c3QgYmUgb25lIG9mOgo+ID4gICAgICAqIGFsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1k
c2kKPiA+ICsgICAgKiBhbGx3aW5uZXIsc3VuNTBpLWE2NC1taXBpLWRzaQo+ID4gICAgLSByZWc6
IGJhc2UgYWRkcmVzcyBhbmQgc2l6ZSBvZiBtZW1vcnktbWFwcGVkIHJlZ2lvbgo+ID4gICAgLSBp
bnRlcnJ1cHRzOiBpbnRlcnJ1cHQgYXNzb2NpYXRlZCB0byB0aGlzIElQCj4gPiAgICAtIGNsb2Nr
czogcGhhbmRsZXMgdG8gdGhlIGNsb2NrcyBmZWVkaW5nIHRoZSBEU0kgZW5jb2Rlcgo+Cj4gV2Un
dmUgc3dpdGNoIHRvIFlBTUwgbm93LCBhbmQgdGhlIGNvbXBhdGlibGUgc2hvdWxkIGJlIGV4cHJl
c3NlZCB0aGF0Cj4gd2F5IG5vdzoKClllcywgSSBoYXZlIHNlZW4gaXQgZmV3IGRheXMgYmFjayB3
aWxsIHVwZGF0ZSBvbiB0b3Agb2YgdGhhdCwgdGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
