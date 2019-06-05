Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82A53572E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 08:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4BA891C2;
	Wed,  5 Jun 2019 06:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D14891C2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 06:49:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x17so176004wrl.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 23:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Aa9SiEOP57dMUPIPXZ4uRkPtqSgf6jJ4AGTncZG28+8=;
 b=g8VXGmf2AYuS6wuxuyBmbFhntWai56omq3HF5myvfBTKr9vcPXEcil8aZr+u2TBt/c
 P+ge/jCWod2/ogJhI7jA1ZBb8DgtdphASAe5poZEJzF6vuM7KxzX4Klw6/FyHplvM4cT
 VoX3BC708F/fwA4zVtO9S8Nh67yVMMYxVXafLgcFEsDIE/LTYPWSwwlNQ3Cy1VD3kC8i
 Y3jU2sAoBiedgR24UDtthz9vCI1gYmfrApAvCBbZQdEFlQBqv6aVYi5L+pgyXiWtzZpC
 JohJdyV98NpX/09n5czwhLS1ZATutssEoLY3lIIKXpfVSzQsARBEjCjFYaSZkCpRsLCQ
 yx7w==
X-Gm-Message-State: APjAAAW4qjL9DSZuyOfW2hdbtVcNHe4cRZ3F+9+KYWGS43Cr35Fu2u79
 vccnzlNqye1iBQjJ3RqCuyEDgw==
X-Google-Smtp-Source: APXvYqwajN0uRRCoaJnBR/tXaECbZNfMRnmng7+jNtUyT+LwmBN5T6WdLNxU3OssrQaDRvfxZEYoPQ==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr8042948wru.87.1559717390470;
 Tue, 04 Jun 2019 23:49:50 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id s9sm17126517wmc.1.2019.06.04.23.49.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Jun 2019 23:49:49 -0700 (PDT)
Date: Wed, 5 Jun 2019 07:49:48 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Claudiu.Beznea@microchip.com
Subject: Re: [RESEND][PATCH v3 0/6] add LCD support for SAM9X60
Message-ID: <20190605064948.GI4797@dell>
References: <1556195748-11106-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556195748-11106-1-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Aa9SiEOP57dMUPIPXZ4uRkPtqSgf6jJ4AGTncZG28+8=;
 b=zi+4AOGqVMCKl+mid40KDQdfPs+xU211Ce0sh8e2CuDwew50rwR7HmE9RNsXOpW38J
 7nnLm9odQTjC/LvSmcEj3vtRmQ0dK+u2BHtiWxamIssDnHEsuvkR9OdSBvkKwltKKILD
 YIqkE3sdv4UGDkYJIfhmh2vYVKOLpEXRD0bEV1YB3GAZlTQZpLJApMRHd+Knh2tb3kYv
 Tr/5XLuDlozOjb/5OGBOh2EDP71Ysw9vzOHMeSQZmoveZpw1Oo3LEEgP16hPmkbb+nQ0
 Ur+k/LHdXxpVmQJLDfgoejyaW6uiZdPgGrfWtIcaet7s1PmOmI2b5Y1NW8XHmSTPZMqh
 SEew==
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
Cc: linux-pwm@vger.kernel.org, alexandre.belloni@bootlin.com,
 bbrezillon@kernel.org, airlied@linux.ie, Nicolas.Ferre@microchip.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ludovic.Desroches@microchip.com, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNSBBcHIgMjAxOSwgQ2xhdWRpdS5CZXpuZWFAbWljcm9jaGlwLmNvbSB3cm90ZToK
Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+Cj4g
Cj4gSGksCj4gCj4gVGhlc2UgcGF0Y2hlcyBhZGRzIHN1cHBvcnQgZm9yIFNBTTlYNjAncyBMQ0Qg
Y29udHJvbGxlci4KPiAKPiBGaXJzdCBwYXRjaGVzIGFkZCBvcHRpb24gdG8gc3BlY2lmeSBpZiBj
b250cm9sbGVyIGNsb2NrIHNvdXJjZSBpcyBmaXhlZC4KPiBTZWNvbmQgcGF0Y2ggYXZvaWQgYSB2
YXJpYWJsZSBpbml0aWFsaXphdGlvbiBpbiBhdG1lbF9obGNkY19jcnRjX21vZGVfc2V0X25vZmIo
KS4KPiBUaGUgM3JkIGFkZCBjb21wYXRpYmxlcyBpbiBwd20tYXRtZWwtaGxjZGMgZHJpdmVyLgo+
IFRoZSA0dGggcGF0Y2ggZW5hYmxlcyBzeXNfY2xrIGluIHByb2JlIHNpbmNlIFNBTTlYNjAgbmVl
ZHMgdGhpcy4KPiBTcGVjaWZpYyBzdXBwb3J0IHdhcyBhZGRlZCBhbHNvIGluIHN1c3BlbmQvcmVz
dW1lIGhvb2tzLgo+IFRoZSA1dGggcGF0Y2ggYWRkcyBTQU05WDYwJ3MgTENEIGNvbmZpZ3VyYXRp
b24gYW5kIGVuYWJsZWQgaXQuCj4gCj4gSSB0b29rIHRoZSBjaGFuZ2VzIG9mIHRoaXMgc2VyaWVz
IGFuZCBpbnRyb2R1Y2VkIGFsc28gYSBmaXgKPiAodGhpcyBpcyB0aGUgNnRoIHBhdGNoIGluIHRo
aXMgc2VyaWVzKSAtIGlmIHlvdSB3YW50IHRvIHNlbmQgaXQgc2VwYXJhdGVseQo+IEkgd291bGQg
Z2xhZGx5IGRvIGl0Lgo+IAo+IEkgcmVzZW5kIHRoaXMgdG8gYWxzbyBpbmNsdWRlIExlZSBKb25l
cyBmb3IgcHdtLWF0bWVsLWhsY2RjIGNoYW5nZXMuCj4gCj4gVGhhbmsgeW91LAo+IENsYXVkaXUg
QmV6bmVhCj4gCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIGtlZXAgY29tcGF0aWJsZSBzdHJpbmcgb24g
cGF0Y2ggMy82IG9uIGEgc2luZ2xlIGxpbmUgKEkga2VlcCBoZXJlIGEgdGFiCj4gICBpbiBmcm9u
dCBvZiAiLmNvbXBhdGlibGUiIHRvIGJlIGFsaWduZWQgd2l0aCB0aGUgcmVzdCBvZiB0aGUgY29k
ZSBpbgo+ICAgYXRtZWxfaGxjZGNfZHRfaWRzW10pCj4gLSBwYXRjaGVzIDQvNyBhbmQgMy83IGZy
b20gdjIgd2VyZSBhcHBsaWVkIHNvIHJlbW92ZSB0aGVtIGZyb20gdGhpcyB2ZXJzaW9uCj4gLSBh
ZGQgYSBmaXggZm9yIGF0bWVsX2hsY2RjIChwYXRjaCA2LzYpCj4gCj4gQ2hhbmdlcyBpbiB2MjoK
PiAtIHVzZSAifCIgb3BlcmF0b3IgaW4gcGF0Y2ggMS83IHRvIHNldCBBVE1FTF9ITENEQ19DTEtT
RUwgb24gY2ZnCj4gLSBjb2xsZWN0IEFja2VkLWJ5LCBSZXZpZXdlZC1ieSB0YWdzCj4gCj4gQ2xh
dWRpdSBCZXpuZWEgKDQpOgo+ICAgZHJtOiBhdG1lbC1obGNkYzogYWRkIGNvbmZpZyBvcHRpb24g
Zm9yIGNsb2NrIHNlbGVjdGlvbgo+ICAgZHJtOiBhdG1lbC1obGNkYzogYXZvaWQgaW5pdGlhbGl6
aW5nIGNmZyB3aXRoIHplcm8KPiAgIHB3bTogYXRtZWwtaGxjZGM6IGFkZCBjb21wYXRpYmxlIGZv
ciBTQU05WDYwIEhMQ0RDJ3MgUFdNCj4gICBkcm0vYXRtZWwtaGNsY2RjOiByZXZlcnQgc2hpZnQg
YnkgOAo+IAo+IFNhbmRlZXAgU2hlcmlrZXIgTWFsbGlrYXJqdW4gKDIpOgo+ICAgZHJtOiBhdG1l
bC1obGNkYzogZW5hYmxlIHN5c19jbGsgZHVyaW5nIGluaXRhbGl6YXRpb24uCj4gICBkcm06IGF0
bWVsLWhsY2RjOiBhZGQgc2FtOXg2MCBMQ0QgY29udHJvbGxlcgo+IAo+ICBkcml2ZXJzL2dwdS9k
cm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfY3J0Yy5jICB8ICAxOCArKy0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5jICAgIHwgMTIwICsrKysrKysrKysr
KysrKysrKysrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNf
ZGMuaCAgICB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNk
Y19wbGFuZS5jIHwgICAyICstCj4gIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC1obGNkYy5jICAgICAg
ICAgICAgICAgICAgIHwgICAxICsKPiAgNSBmaWxlcyBjaGFuZ2VkLCAxMzIgaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pCgpXaHkgaXMgdGhpcyBiZWluZyBzZW50IHRvIG1lPwoKLS0gCkxl
ZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
