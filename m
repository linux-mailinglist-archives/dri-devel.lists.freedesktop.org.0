Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 388249B099
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 15:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1746E06F;
	Fri, 23 Aug 2019 13:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFD36E06F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 13:18:18 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4A1B23400
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 13:18:18 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id y26so11152253qto.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 06:18:18 -0700 (PDT)
X-Gm-Message-State: APjAAAUAUMmgqTxmffRlzoQQtdUL+nv6cvTErEO8Wl1L0WjyZ0FoYmNX
 FUKW3zG9yYuUdsZhZqWusdrhVVPyqwVmUUvHPg==
X-Google-Smtp-Source: APXvYqwVGfUYpJDuvSk4JLXxB0511+FALJ0em+PZ/9+koBRWu7uJkXPFxZ8K9XB4Jt00BzDCwYyH4PoaY3CXYRgOyls=
X-Received: by 2002:a05:6214:10e1:: with SMTP id
 q1mr3794699qvt.148.1566566297713; 
 Fri, 23 Aug 2019 06:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-9-robh@kernel.org>
 <39a16722-9ab2-b7ca-1c28-dd733c1b193a@arm.com>
In-Reply-To: <39a16722-9ab2-b7ca-1c28-dd733c1b193a@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Aug 2019 08:18:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKeUBUw3JmCyc5Ui5Ou_shmizyEzFA-UQ-zXHCsPDv0DQ@mail.gmail.com>
Message-ID: <CAL_JsqKeUBUw3JmCyc5Ui5Ou_shmizyEzFA-UQ-zXHCsPDv0DQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm/panfrost: Remove unnecessary flushing from
 tlb_inv_context
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566566298;
 bh=XG8XXwfzxDM9b0nIM6ddp1sGvNvzAlaD3olMJ3Wx1Kc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LCTarW+pVXjnwn3m6sOSGEwiv4E5ySbLk9UZSs+EWby5OQD7vh/Lp3j0eWDKwsH++
 y7M1251/xYCc3lsuZI3m8E8tZilfpMNX4Q7HZz1+qhnwKp0r807fQvBiDFeh75wJqv
 4nh3Rn8+SzuFpueAtVaAqryaTKH0rXUvXvSPtt9I=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgNzo1NiBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDIzLzA4LzIwMTkgMDM6MTIsIFJvYiBIZXJyaW5nIHdy
b3RlOgo+ID4gdGxiX2ludl9jb250ZXh0KCkgaG9vayBpcyBvbmx5IGNhbGxlZCB3aGVuIGZyZWVp
bmcgdGhlIHBhZ2UgdGFibGVzLiBUaGVyZSdzCj4gPiBubyBwb2ludCBpbiBmbHVzaGluZyBvbmx5
IHRvIGZyZWUgdGhlIHBhZ2UgdGFibGVzIGltbWVkaWF0ZWx5IGZvbGxvd2luZy4KPgo+IEZXSVcs
IGluIGdlbmVyYWwgdGhlIHBvaW50IG9mIGZsdXNoaW5nIGlzICpiZWNhdXNlKiB3ZSdyZSBhYm91
dCB0byBmcmVlCj4gdGhlIHBhZ2V0YWJsZXMgLSBpZiB0aGVyZSdzIGFueSBwb3NzaWJpbGl0eSB0
aGF0IHRoZSBoYXJkd2FyZSBjb3VsZAo+IGNvbnRpbnVlIHRvIGlzc3VlIHRyYW5zbGF0aW9uIHRh
YmxlIHdhbGtzIChzcGVjdWxhdGl2ZSBvciBvdGhlcndpc2UpCj4gYWZ0ZXIgdGhvc2UgcGFnZXMg
aGF2ZSBiZWVuIHJldXNlZCBieSBzb21lb25lIGVsc2UsIFRMQiBiYWRuZXNzIG1heSBlbnN1ZS4K
Pgo+IEZvciBwYW5mcm9zdCBpbiBwYXJ0aWN1bGFyIEkgc3VzcGVjdCB3ZSBjYW4gcHJvYmFibHkg
Z2V0IGF3YXkgd2l0aG91dAo+IGl0LCBhdCBsZWFzdCBmb3IgdGhlIG1vbWVudCwgYnV0IGl0IG1p
Z2h0IGJlIHdvcnRoIG1vdmluZyB0aGUgZmx1c2ggdG8KPiBtbXVfZGlzYWJsZSgpIGZvciBjb21w
bGV0ZSBwZWFjZSBvZiBtaW5kICh3aGljaCBraW5kIG9mIHByZWVtcHRzIHRoZQo+IHNvcnQgb2Yg
dGhpbmcgdGhhdCBwZXItcHJvY2VzcyBBUyBzd2l0Y2hpbmcgd2lsbCB3YW50IGFueXdheSkuCgpU
aGVyZSdzIGJpZ2dlciBwcm9ibGVtIHRoYXQgbW11X2Rpc2FibGUoKSBpcyBzdGlsbCBvbmx5IGNh
bGxlZCBmb3IgQVMwCmFuZCBvbmx5IGZvciBkcml2ZXIgdW5sb2FkLiBJIGd1ZXNzIHdlIHNob3Vs
ZCBmaXggdGhhdCBhbmQgdGhlbiBmaWd1cmUKb3V0IHdoZXJlIGEgZmx1c2ggaXMgbmVlZGVkIGlm
IGF0IGFsbC4gSSB3b3VsZCB0aGluayBjaGFuZ2luZyB0aGUgVFRCUgp3b3VsZCBiZSBlbm91Z2gg
dG8gcXVpZXNjZSB0aGUgaC93IGFuZCBUTEJzLiBUaGF0IHNlZW1zIHRvIGJlIHRoZSBjYXNlCmlu
IG15IHRlc3Rpbmcgb2Ygc3dpdGNoaW5nIGFkZHJlc3Mgc3BhY2VzLgoKUm9iCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
