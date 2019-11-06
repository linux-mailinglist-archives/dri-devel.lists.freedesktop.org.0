Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F09CEF1888
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 15:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C776ED7D;
	Wed,  6 Nov 2019 14:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1FF6ED7D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 14:25:12 +0000 (UTC)
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com
 [209.85.161.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B0FB21A49
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 14:25:12 +0000 (UTC)
Received: by mail-yw1-f53.google.com with SMTP id k127so9614776ywc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 06:25:12 -0800 (PST)
X-Gm-Message-State: APjAAAUjAGLnWoxKui9QywIhN0GLFBdA/PYBaTmbXbl413eE+FwAA/Xk
 Apq0QhwLQDv7VD7RLNm3cT6ACvzCJcfNlKo+dw==
X-Google-Smtp-Source: APXvYqzZFcvicyLbyVKKqZBBg3KUfyX6DrTKhbmcP3UuFixdP0C+dSzUm2vlJQ+TJwMuEZWoGfVcj47a+BgKJoaNCRQ=
X-Received: by 2002:a81:a196:: with SMTP id y144mr1774534ywg.507.1573050311255; 
 Wed, 06 Nov 2019 06:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20191104013932.22505-1-afaerber@suse.de>
 <20191104013932.22505-2-afaerber@suse.de>
In-Reply-To: <20191104013932.22505-2-afaerber@suse.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Nov 2019 08:24:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL3NOstoa5ZY1JE9e3Ay=WTmz153H-KbHErhi-GBX-5GA@mail.gmail.com>
Message-ID: <CAL_JsqL3NOstoa5ZY1JE9e3Ay=WTmz153H-KbHErhi-GBX-5GA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: gpu: mali-midgard: Tidy up conversion to
 YAML
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573050312;
 bh=t22la/XtVNC5KQNqEOFeF0+C1rhKgq+qOSEIqpk5BHA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yMmYaPKVAuHLBJl+V9hcNV4Bdja+di11oystN/HBPVsX2VVth4PM3toVOn3T+5Qni
 TNMuQFXL7UMzuqxylzuRIkofuibnjKujINuB5rcGtAkWzBr8zJ8hSJ0e9o0f07cOIC
 XQl+cC7bfJ3KBwLkY7NAaB/tlddnnXmckFIrCegQ=
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
 Guillaume Gardet <guillaume.gardet@arm.com>,
 linux-realtek-soc@lists.infradead.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMywgMjAxOSBhdCA3OjQwIFBNIEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJA
c3VzZS5kZT4gd3JvdGU6Cj4KPiBJbnN0ZWFkIG9mIGdyb3VwaW5nIGFscGhhYmV0aWNhbGx5IGJ5
IHRoaXJkLXBhcnR5IHZlbmRvciwgbGVhZGluZyB0bwo+IG9uZS1lbGVtZW50IGVudW1zLCBzb3J0
IGJ5IE1hbGkgbW9kZWwgbnVtYmVyLCBhcyBkb25lIGZvciBVdGdhcmQuCj4KPiBUaGlzIGFscmVh
ZHkgYWxsb3dzIHVzIHRvIGRlLWR1cGxpY2F0ZSB0d28gImFybSxtYWxpLXQ3NjAiIHNlY3Rpb25z
IGFuZAo+IHdpbGwgbWFrZSBpdCBlYXNpZXIgdG8gYWRkIG5ldyB2ZW5kb3IgY29tcGF0aWJsZXMu
CgpUaGF0IHdhcyB0aGUgaW50ZW50LiBOb3Qgc3VyZSBob3cgSSBtZXNzZWQgdGhhdCB1cC4uLgoK
VGhpcyBwYXRjaCBpcyBwcm9ibGVtYXRpYyBiZWNhdXNlIHRoZXJlJ3MgY2hhbmdlcyBpbiBhcm0t
c29jIGp1bm8vZHQKYnJhbmNoIGFuZCB0aGVyZSdzIG5vdyBhIHBhdGNoIGZvciBleHlub3M1NDIw
ICh0NjI4KS4gSSdkIHByb3Bvc2UgSQphcHBseSB0aGlzIHN1Y2ggdGhhdCB3ZSBkb24ndCBnZXQg
YSBtZXJnZSBjb25mbGljdCB3aXRoIGp1bm8vZHQgYW5kIHdlCmZpbmlzaCByZXNvcnRpbmcgYWZ0
ZXIgcmMxIChvciB3aGVuIGJvdGggYnJhbmNoZXMgYXJlIGluIExpbnVzJyB0cmVlKS4KClJvYgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
