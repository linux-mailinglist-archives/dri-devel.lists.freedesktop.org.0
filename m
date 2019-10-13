Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541DAD56F1
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 19:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D416E147;
	Sun, 13 Oct 2019 17:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F6D6E147
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 17:02:31 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id n197so32343453iod.9
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 10:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y5EXXBAwwQtPJ53xui2dWiC39EIVV1N/CWUXrjlPr7o=;
 b=jhWpni5BS4lFqi8IbjsdLwcYDzY5tcpcY9+EvfWtvelBop9SHQjOmnngpvWlHMQeza
 y5IeTYtcN5eoyJUptNaakUMq1pQL1ouGxXAX6GaGYIla17HJZJ3xgc5r92tBEDA8yS1g
 uGKd7vp+61ql2DPlVrDagAJu3oi1jZnJ5ok0F3KF6lT4rjus2dAEY9FhWSQOjPIQHgRF
 6Sf9MFyWygChJOdjfjy/3/sG9/U1OPQyGBmqN4TlbwPgPxYDVd3c5/si2ySXLqxAxWxX
 wnL+TcfSod8JrQq3mqrInQgxNP+pImlnD6JiEzG8FB5UyIQprTyQNYmgJ+rItpt2dHpq
 HxsA==
X-Gm-Message-State: APjAAAVMKGNcrjrj/ZDUQoIXrWYcJdUwGAtjQZcZaatcEwf6xT6DXKC9
 4uMR0hpwM/fkKkNYpo/aIN2+4HyHpph09yfwUVPwxQ==
X-Google-Smtp-Source: APXvYqxe8O/zqzfE+BE/bWBaXmZwc8ddmkzF2zTRQsw5hvZGzCCUSKkZI14FxXesaHp6rT1xlHYB8wKYoOJ+CQ4U80w=
X-Received: by 2002:a6b:5c0f:: with SMTP id z15mr23291130ioh.173.1570986150676; 
 Sun, 13 Oct 2019 10:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
 <20191005141913.22020-2-jagan@amarulasolutions.com>
 <20191007093122.ixrpzvy6ynh6vuir@gilmour>
In-Reply-To: <20191007093122.ixrpzvy6ynh6vuir@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 13 Oct 2019 22:32:18 +0530
Message-ID: <CAMty3ZA1azP3kkJPw6oZudcSQksF6i+STeW=oOh65cfHsj0QrQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: sun6i-dsi: Add A64 MIPI-DSI
 compatible
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Y5EXXBAwwQtPJ53xui2dWiC39EIVV1N/CWUXrjlPr7o=;
 b=aaz/dotn+umYNxbMf0N27lTns2rUEnRXr3ncyAS8unjQPXipinDv30U1G3pR/NaY5x
 5TQlgYYDRtl50mIFY6g/ZFU/rETQ0X9RMjm6VgXusBevN254jSYYkPM2GM7E7BGBDJCc
 RmwkhOVMrLkI1mZ4BKvd/MXUBhijYnSSgj1vc=
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
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgNywgMjAxOSBhdCAzOjAxIFBNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIE9jdCAwNSwgMjAxOSBhdCAwNzo0OTowOFBNICsw
NTMwLCBKYWdhbiBUZWtpIHdyb3RlOgo+ID4gVGhlIE1JUEkgRFNJIGNvbnRyb2xsZXIgaW4gQWxs
d2lubmVyIEE2NCBpcyBzaW1pbGFyIHRvIEEzMy4KPiA+Cj4gPiBCdXQgdW5saWtlIEEzMywgQTY0
IGRvZXNuJ3QgaGF2ZSBEU0lfU0NMSyBnYXRpbmcgc28gaXQgaXMgdmFsaWQKPiA+IHRvIHdpdGgg
c2VwYXJhdGUgY29tcGF0aWJsZSBmb3IgQTY0IG9uIHRoZSBzYW1lIGRyaXZlci4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+
IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1k
c2kueWFtbCAgICAgICAgfCA0ICsrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixz
dW42aS1hMzEtbWlwaS1kc2kueWFtbAo+ID4gaW5kZXggZGFmYzA5ODBjNGZhLi5jZmNjODRkMzgw
ODQgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9hbGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHNpLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlw
aS1kc2kueWFtbAo+ID4gQEAgLTE1LDcgKzE1LDkgQEAgcHJvcGVydGllczoKPiA+ICAgICIjc2l6
ZS1jZWxscyI6IHRydWUKPiA+Cj4gPiAgICBjb21wYXRpYmxlOgo+ID4gLSAgICBjb25zdDogYWxs
d2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaQo+ID4gKyAgICBlbnVtOgo+ID4gKyAgICAgIC0gY29u
c3Q6IGFsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kKPiA+ICsgICAgICAtIGNvbnN0OiBhbGx3
aW5uZXIsc3VuNTBpLWE2NC1taXBpLWRzaQo+Cj4gSG93IGRpZCB5b3UgdGVzdCB0aGlzPyBJdCB3
aWxsIHJlcG9ydCBhbiBlcnJvciB3aGVuIHJ1bm5pbmcgdGhlCj4gdmFsaWRhdGlvbgoKSSBkaWQg
Zm9sbG93IHRoZSB2OSBjb21tZW50cyBbMV0gYW5kIGZvcmdvdCB0byBkbyBkdC1kb2MtdmFsaWRh
dGUuCndpbGwgc2VuZCB0aGUgdjExIGZvciB0aGlzIHBhdGNoIGFsb25lLCB3aWxsIHRoYXQgYmUg
b2theT8KClsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzA3NDk5
LwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
