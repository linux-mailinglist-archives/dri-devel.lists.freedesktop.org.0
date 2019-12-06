Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512B211564B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 18:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EBE6FA6E;
	Fri,  6 Dec 2019 17:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065486FA6E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 17:17:01 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0C7724676
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 17:17:00 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id p2so156130qvo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 09:17:00 -0800 (PST)
X-Gm-Message-State: APjAAAUlzjJuFtYBURCht7+clsQxzeAaw58b4bzhX/H+Ba7zOdu0TvpC
 4dzC5ruFWm3eKfnCPJFXsfFGthX9r5xHw2w/Sw==
X-Google-Smtp-Source: APXvYqwkk7GbRzINAc/hil6dytSPRwReJ1m9qwTkMDI3l2OrHW3YbesEyJygFRTdl24EpZsgkA+a/rv7yHAxvc5lf+g=
X-Received: by 2002:a05:6214:11ac:: with SMTP id
 u12mr13749702qvv.85.1575652619951; 
 Fri, 06 Dec 2019 09:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20191118173002.32015-1-steven.price@arm.com>
In-Reply-To: <20191118173002.32015-1-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 6 Dec 2019 11:16:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL2-3+rBHJzfsQfz=hKt3kt+wh5tmXd0Wa-1QFLo3=57w@mail.gmail.com>
Message-ID: <CAL_JsqL2-3+rBHJzfsQfz=hKt3kt+wh5tmXd0Wa-1QFLo3=57w@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: devfreq: Round frequencies to OPPs
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575652620;
 bh=DatOl7pENgsZgL0vR4s62JyPzJa3DWGO0o2jk6RhY+0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JS1ov9al4yWI6/QL523l9ach20dToYwDP+KU3yVcpX3vBvzAc3PCMzTcOJA4kljpz
 AQPhphRcCVklKttzte21SP1RlBNCU6Xi2isBU5TdWulpSidmWPgyggWkd878rk/q0G
 RPNpADADRAbBT7mSYDx80hfgfD3ByiKEvut5d7ss=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTE6MzAgQU0gU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJp
Y2VAYXJtLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHkgd2hlbiBzZXR0aW5nIGEgZnJlcXVlbmN5
IGluIHBhbmZyb3N0X2RldmZyZXFfdGFyZ2V0IHRoZQo+IHJldHVybmVkIGZyZXF1ZW5jeSBpcyB0
aGUgYWN0dWFsIGZyZXF1ZW5jeSB0aGF0IHRoZSBjbG9jayBkcml2ZXIgcmVwb3J0cwo+ICh0aGUg
cmV0dXJuIG9mIGNsa19nZXRfcmF0ZSgpKS4gSG93ZXZlciwgd2hlcmUgdGhlIHByb3ZpZGVkIE9Q
UHMgZG9uJ3QKPiBwcmVjaXNlbHkgbWF0Y2ggdGhlIGZyZXF1ZW5jaWVzIHRoYXQgdGhlIGNsb2Nr
IGFjdHVhbGx5IGFjaGlldmVzIGRldmZyZXEKPiB3aWxsIHRoZW4gY29tcGxhaW4gKHJlcGVhdGVk
bHkpOgo+Cj4gICBkZXZmcmVxIGRldmZyZXEwOiBDb3VsZG4ndCB1cGRhdGUgZnJlcXVlbmN5IHRy
YW5zaXRpb24gaW5mb3JtYXRpb24uCj4KPiBUbyBhdm9pZCB0aGlzIGNoYW5nZSBwYW5mcm9zdF9k
ZXZmcmVxX3RhcmdldCgpIHRvIGZldGNoIHRoZSBvcHAgdXNpbmcKPiBkZXZmcmVxX3JlY29tbWVu
ZWRfb3BwKCkgYW5kIG5vdCBhY3R1YWxseSBxdWVyeSB0aGUgY2xvY2sgZm9yIHRoZQo+IGZyZXF1
ZW5jeS4KPgo+IEEgc2ltaWxhciBwcm9ibGVtIGV4aXN0cyB3aXRoIHBhbmZyb3N0X2RldmZyZXFf
Z2V0X2N1cl9mcmVxKCksIGJ1dCBpbgo+IHRoaXMgY2FzZSBiZWNhdXNlIHRoZSBmdW5jdGlvbiBp
cyBvcHRpb25hbCB3ZSBjYW4ganVzdCByZW1vdmUgaXQgYW5kCj4gZGV2ZnJlcSB3aWxsIGZhbGwg
YmFjayB0byB1c2luZyB0aGUgcHJldmlvdXNseSBzZXQgZnJlcXVlbmN5Lgo+Cj4gRml4ZXM6IDIy
MWJjNzc5MTRjYiAoImRybS9wYW5mcm9zdDogVXNlIGdlbmVyaWMgY29kZSBmb3IgZGV2ZnJlcSIp
Cj4gU2lnbmVkLW9mZi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDE5ICsr
KysrKy0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTMg
ZGVsZXRpb25zKC0pCgpBcHBsaWVkLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
