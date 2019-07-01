Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE5F5C183
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 18:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869B389BFF;
	Mon,  1 Jul 2019 16:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38E689BFF;
 Mon,  1 Jul 2019 16:55:50 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id h28so9327233vsl.12;
 Mon, 01 Jul 2019 09:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9hpsLHOwYBTNgUUHIZrkULO7G1kYAcJRjXyIqaOWRmI=;
 b=DTQ8v62xVdjSpXmCSmf5/iYSkj0cig9CXGnFOO0rieoJRyppxtajCUyfCICl6eR3BP
 dYgw0+1xLT7ZiP+UAUEdTXQydhZxsJ+d2tkTz0k5HTIBcog13/OhMlQpDuwZ3eoJtY2D
 4c2MjvRYVBBjAkF6OonTrF/arOsLt9fngG6+CjuUz0F2ryqXjQuCEuCPZkSC9ZkhHHIz
 Y9xlva8JITXDRKRrdKplfsGSc7C/SOafJlVfzudSC9WKL+xGOmoKMlnimTABZm3V317S
 cW7IAUqxgF3f02SplTHyLEo+jZ2UF184eb3+Fa8h9+e+oEhhc3NB4NRBV6XAt7RAlmyZ
 ty4A==
X-Gm-Message-State: APjAAAXVZXPzaZdOQa6Y1pW87l8vAgO69U4CTrDW4Do6D4XmhafQIJ7w
 mcGBm/Suzx4U9NVCjXW3Aq8Ir7o3O0uC/gRFn1I=
X-Google-Smtp-Source: APXvYqxXrwMWAFaMAkfDfGjVZRGknf91sOEOwGuCDcLY5CpuQQCHeG4XkXBuiu4jeSaNk1Y/xa95e2GybiNG9fSePV0=
X-Received: by 2002:a67:9946:: with SMTP id b67mr15331235vse.37.1562000149810; 
 Mon, 01 Jul 2019 09:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190701032245.25906-1-huangfq.daxian@gmail.com>
 <CACvgo52N7c3mtAvfH-98pkgHC6UpdKPNH+cYozb4yRsMetMhkg@mail.gmail.com>
In-Reply-To: <CACvgo52N7c3mtAvfH-98pkgHC6UpdKPNH+cYozb4yRsMetMhkg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 1 Jul 2019 17:56:02 +0100
Message-ID: <CACvgo525gKG1xok-O-AmTLT4OgupB2FCoO=qeBqS=DXK5vhFOg@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpu: Use dev_get_drvdata()
To: Fuqian Huang <huangfq.daxian@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9hpsLHOwYBTNgUUHIZrkULO7G1kYAcJRjXyIqaOWRmI=;
 b=qcpTiHJPbLBWjXPetB6GIiRnwUcaNNyX5NB4TnmPGjus6TpXK7WjOIQbb1ldh95SZG
 B0C3W1rCUkB35dC33DoDQyFIWv3LApNphWwlfrhm2VUBb+g6JudyExYvHsJaJ8eYuIsq
 GhpJN6Bb5i8gp/Aam/UdZUP4+c4mBHKLtWXRNRYpF+l5CyaZHc+SZC3fZlZ+jle00wHv
 NWgtEXh3NfJvdfLf8ZPIDTUvAN6EZMAhUsigt3GM+Lgc/FhHEhYBphSQgzrsnhiOr16+
 LVuHnDWH6Yg+0OlnRUhnpt+S06HdIKO6nzeoKu6ienC2prfjPAZfk5nIjukpsTAgg3mk
 bZIg==
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sibi Sankar <sibis@codeaurora.org>,
 freedreno@lists.freedesktop.org, Rajesh Yadav <ryadav@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Bruce Wang <bzwang@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Daniel Mack <daniel@zonque.org>, Enrico Weigelt <info@metux.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxIEp1bCAyMDE5IGF0IDEzOjM3LCBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBGdXFpYW4sCj4KPiBPbiBNb24sIDEgSnVsIDIwMTkg
YXQgMDg6MTMsIEZ1cWlhbiBIdWFuZyA8aHVhbmdmcS5kYXhpYW5AZ21haWwuY29tPiB3cm90ZToK
PiA+Cj4gPiBVc2luZyBkZXZfZ2V0X2RydmRhdGEgZGlyZWN0bHkuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRnVxaWFuIEh1YW5nIDxodWFuZ2ZxLmRheGlhbkBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2aWNlLmMgICAgICB8ICA2ICsr
LS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyAgICAgICAg
IHwgMTMgKysrKystLS0tLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21k
cDVfa21zLmMgICAgICAgIHwgIDYgKystLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kv
ZHNpX2hvc3QuYyAgICAgICAgICAgICAgfCAgNiArKy0tLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9kcnYuYyAgICAgICAgICAgICAgICAgICB8ICAzICstLQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jIHwgMTUgKysrKystLS0tLS0tLS0t
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jICAgICAgfCAg
NiArKy0tLS0KPiBBcyBmYXIgYXMgaSBjYW4gc2VlIHRoZSBwYXRjaCBpcyBzcG90IG9uLCB0aGFu
a3MgZm9yIHRoYXQuCj4KPiBDYW4geW91IHNwbGl0IHRoaXMgaW4gdGhyZWUgc2luY2UgaXQgY292
ZXJzIDMgc2VwYXJhdGUgZHJpdmVycy4KClF1aWNrIGdyZXAgZm9yICJwbGF0Zm9ybV9nZXRfZHJ2
ZGF0YSh0b19wbGF0Zm9ybV9kZXZpY2UiIHNob3dlZCBhIGZldwppbnN0YW5jZXMgdGhyb3VnaCB2
YXJpb3VzIGRyaXZlcnMgLSBleHlub3MsIG1zbSwgZXRjLgpJZiB5b3UgY2FuIGFkZHJlc3MgdGhv
c2Ugd2l0aCB2MiB0aGF0IHdvdWxkIGJlIGdyZWF0LgoKLUVtaWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
