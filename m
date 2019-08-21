Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 328A0981A6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 19:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064176E997;
	Wed, 21 Aug 2019 17:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8026E997
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 17:44:03 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7AFF22D6D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 17:44:02 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id b11so4030188qtp.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 10:44:02 -0700 (PDT)
X-Gm-Message-State: APjAAAVdzlHchfxllPm4A4jA0d/xInqVb+AnH3G7kPBOWV84sIqw4GZx
 Eid5349Fagpv+7iq8pwSbnKiJcJddgTzmY7mJg==
X-Google-Smtp-Source: APXvYqyQR+a47sPYtXE2oJEbDbhNlURhzSAM1nFDuJdD56V2bJUpYD2FaxDWVRw4fGXKdeXs21dF377WRfSMK/l8Aec=
X-Received: by 2002:aed:24f4:: with SMTP id u49mr33003861qtc.110.1566409442105; 
 Wed, 21 Aug 2019 10:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190820195959.6126-1-robh@kernel.org> <174045783.D6yh98NvXX@phil>
In-Reply-To: <174045783.D6yh98NvXX@phil>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Aug 2019 12:43:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJoMAHWDonXVik=y1D=_sx20OAzueBtB+YuSwzwU6iVFw@mail.gmail.com>
Message-ID: <CAL_JsqJoMAHWDonXVik=y1D=_sx20OAzueBtB+YuSwzwU6iVFw@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: Convert Arm Mali GPUs to DT schema
To: Heiko Stuebner <heiko@sntech.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566409443;
 bh=PyxwQDgDc5aOigK3c+vq8KjKb84oVZzrlhzvskhgtQY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=plq4ktDbbRn+azB2w7PINPSUbq3ErhQqZ7X3drQtKCRJoTJHSQUNZcJldJ52UxiEG
 TjRF7kIK6pK80xZ+Ou6QHF/Lu0fZomhzVEXQNOcIY3c7Tj75DPPsDbUxxoJylXTmGL
 M5IEyHxMus/G76cYdf+4HScK+Qvgt6AFlLEEB9HM=
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
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMTI6MjQgUE0gSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4gd3JvdGU6Cj4KPiBBbSBEaWVuc3RhZywgMjAuIEF1Z3VzdCAyMDE5LCAyMTo1OTo1
NiBDRVNUIHNjaHJpZWIgUm9iIEhlcnJpbmc6Cj4gPiBUaGlzIHNlcmllcyBjb252ZXJ0cyB0aGUg
dmFyaW91cyBBcm0gTWFsaSBHUFUgYmluZGluZ3MgdG8gdXNlIHRoZSBEVAo+ID4gc2NoZW1hIGZv
cm1hdC4KPiA+Cj4gPiBUaGUgTWlkZ2FyZCBhbmQgQmlmcm9zdCBiaW5kaW5ncyBnZW5lcmF0ZSB3
YXJuaW5ncyBvbiAnaW50ZXJydXB0LW5hbWVzJwo+ID4gYmVjYXVzZSB0aGVyZSdzIGFsbCBkaWZm
ZXJlbnQgb3JkZXJpbmcuIFRoZSBVdGdhcmQgYmluZGluZyBnZW5lcmF0ZXMKPiA+IHdhcm5pbmdz
IG9uIFJvY2tjaGlwIHBsYXRmb3JtcyBiZWNhdXNlICdjbG9jay1uYW1lcycgb3JkZXIgaXMgcmV2
ZXJzZWQuCj4KPiBBcmUgeW91IHBsYW5uaW5nIG9uIHNlbmRpbmcgZml4ZXMgZm9yIHRoZXNlLCBz
aG91bGQgSSBqdXN0IGNoYW5nZSB0aGUKPiBvcmRlcmluZyBteXNlbGY/CgpJIHdhc24ndCBwbGFu
bmluZyBvbiBpdC4gSSBqdXN0IGFkZCB3YXJuaW5ncy4gOikKCj4KPiA+IFJvYiBIZXJyaW5nICgz
KToKPiA+ICAgZHQtYmluZGluZ3M6IENvbnZlcnQgQXJtIE1hbGkgTWlkZ2FyZCBHUFUgdG8gRFQg
c2NoZW1hCj4gPiAgIGR0LWJpbmRpbmdzOiBDb252ZXJ0IEFybSBNYWxpIEJpZnJvc3QgR1BVIHRv
IERUIHNjaGVtYQo+ID4gICBkdC1iaW5kaW5nczogQ29udmVydCBBcm0gTWFsaSBVdGdhcmQgR1BV
IHRvIERUIHNjaGVtYQo+Cj4gQWNrZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2gu
ZGU+CgpUaGFua3MuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
