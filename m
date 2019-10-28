Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7535CE7CD5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 00:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515036E03F;
	Mon, 28 Oct 2019 23:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209EB6E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 23:26:10 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED6E2222C5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 23:26:08 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id l3so6793190qtp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 16:26:08 -0700 (PDT)
X-Gm-Message-State: APjAAAUA9pKXGf4I3eGRJYKpsxPMlFuh+xCf2i5qum2YyINK9kkP+DoZ
 rO6bAcn9th2LB9mjpkphnqaMiIywf9TT3PJz9w==
X-Google-Smtp-Source: APXvYqyIOnmWjP3GoLFvC7z60bp1fpcfLf2ubB7T6b3H6DBWuYxFoBuWQX2ZNarU+6b5ojoZdspaBlyJz9Lj0u5QWLs=
X-Received: by 2002:aed:2706:: with SMTP id n6mr523854qtd.224.1572305168028;
 Mon, 28 Oct 2019 16:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190912213257.24147-1-andreas@kemnade.info>
 <20190912213257.24147-2-andreas@kemnade.info>
In-Reply-To: <20190912213257.24147-2-andreas@kemnade.info>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 28 Oct 2019 18:25:56 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+zDYifFntHMqmqU4qmsj7_nafN+W7a0Vh+HdwGvVj5TA@mail.gmail.com>
Message-ID: <CAL_Jsq+zDYifFntHMqmqU4qmsj7_nafN+W7a0Vh+HdwGvVj5TA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
To: Andreas Kemnade <andreas@kemnade.info>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572305169;
 bh=q0OTmR1wgzTZD6EaP5k/W/AbGqmVSJjg13ZftmTiSZE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hezMheFbDN23JCAY51dksxmJGn0f0gJFzlQ8PYwJy4eQmyUpqFhnzr863IXmnm6ZY
 kcB9f8rfz07kpiqgLMVBNNbp+poxaJxOovMwaRP++vNhaK++Mkx/XqdgjR5SO05Klx
 iC8UVKO2J1iWAez6QSVAdSSs6K5+czLaTrL27/J4=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgNDozMyBQTSBBbmRyZWFzIEtlbW5hZGUgPGFuZHJlYXNA
a2VtbmFkZS5pbmZvPiB3cm90ZToKPgo+IGFkZCBlbmFibGUtZ3Bpb3MgdG8gZGVzY3JpYmUgSFdF
TiBwaW4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgS2VtbmFkZSA8YW5kcmVhc0BrZW1uYWRl
LmluZm8+Cj4gQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFy
by5vcmc+CgpUaGlzIGJyZWFraW5nIGxpbnV4LW5leHQgbm93Li4uCgo+IC0tLQo+IGNoYW5nZXMg
aW4gdjI6IGFkZGVkIGV4YW1wbGUKPiBjaGFuZ2VzIGluIHYzOiBhZGRlZCBBY2tlZC1ieQo+IGNo
YW5nZXMgaW4gdjQ6IG1vdmVkIGVuYWJsZS1ncGlvcyB0byB0aGUgcmlnaHQgcG9zaXRpb24KPiAg
IGluIHRoZSBleGFtcGxlCj4gIC4uLi9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJh
Y2tsaWdodC55YW1sICAgICAgICAgICB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0Lnlh
bWwKPiBpbmRleCBkYzEyOWQ5YTMyOWUuLmM4NDcwNjI4ZmUwMiAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNr
bGlnaHQueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRz
L2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55YW1sCj4gQEAgLTI5LDYgKzI5LDEwIEBAIHBy
b3BlcnRpZXM6Cj4gICAgJyNzaXplLWNlbGxzJzoKPiAgICAgIGNvbnN0OiAwCj4KPiArICBlbmFi
bGUtZ3Bpb3M6Cj4gKyAgICBkZXNjcmlwdGlvbjogR1BJTyB0byB1c2UgdG8gZW5hYmxlL2Rpc2Fi
bGUgdGhlIGJhY2tsaWdodCAoSFdFTiBwaW4pLgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gIHJl
cXVpcmVkOgo+ICAgIC0gY29tcGF0aWJsZQo+ICAgIC0gcmVnCj4gQEAgLTk2LDYgKzEwMCw3IEBA
IGV4YW1wbGVzOgo+ICAgICAgICAgIGxlZC1jb250cm9sbGVyQDM4IHsKPiAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAidGksbG0zNjMwYSI7Cj4gICAgICAgICAgICAgICAgICByZWcgPSA8
MHgzOD47Cj4gKyAgICAgICAgICAgICAgICBlbmFibGUtZ3Bpb3MgPSA8JmdwaW8yIDUgR1BJT19B
Q1RJVkVfSElHSD47CgpFcnJvcjogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xl
ZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LmV4YW1wbGUuZHRzOjI0LjQ2LTQ3CnN5bnRh
eCBlcnJvcgpGQVRBTCBFUlJPUjogVW5hYmxlIHRvIHBhcnNlIGlucHV0IHRyZWUKbWFrZVsxXTog
KioqIFtEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0z
NjMwYS1iYWNrbGlnaHQuZXhhbXBsZS5kdC55YW1sXQpFcnJvciAxCnNjcmlwdHMvTWFrZWZpbGUu
bGliOjMxNDogcmVjaXBlIGZvciB0YXJnZXQKJ0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC5leGFtcGxlLmR0LnlhbWwnCmZh
aWxlZAoKWW91IG5lZWQgdGhlIGluY2x1ZGUgZm9yIHRoZSBkZWZpbmUuCgpSb2IKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
