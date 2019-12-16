Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C201202AF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 11:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023A06E49F;
	Mon, 16 Dec 2019 10:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B9F6E49F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:33:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t14so6087272wmi.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 02:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=fisd2ZxQV7HfHTKDuiQqGDlHhaeL149q62BcqKWmAdU=;
 b=FMMrVHXXh39OP9d89y2YCZjMCGO9f+NOXjagG7NnyKKxsffEW341x9xVKm25qVqbZo
 MfT92uq6hjKwx9Uzq+2Llnw+xppB8vCISyR8UgW+BaSacmo8I4tKXx3qr7+pD8Xz+bR9
 gLvMAZaDVP5XEe9SEwMBqPMy7F77HjmUQ/983V82V/XTzmOM5io7DFyk5luKCUDWKt4z
 EZhpujcQm+TunWMQQlyRjudYAlfh+KTVa2H1GNkS9xycd8iE6jqPOPNNC2zw6lF49ge0
 xPL+rQXzXU+mx/FsB818oK2AfXFoZb1eLqQJN2ZXBSd0dAEv/PSScKG4wbywfPyYW2JY
 CSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=fisd2ZxQV7HfHTKDuiQqGDlHhaeL149q62BcqKWmAdU=;
 b=ICyyyuGxUFYuBn4qD8qs1M+WdV5hHv5pkK3NCag/URMw7YRPYHuj+UJgpFmun8d+d0
 AUHvaDdptq+9nkBKduMEkLxMQtFsdiGWbgVDOtnsR/DXdnPVtJGpc/fiz9ZlEi9KYF8N
 hO4Mp2J846/K7zOQb3+52VRjDi6mZ41zVD52WrZDC5Ow0kgiHm2P5K+NITdQ4m+j+LCp
 MyZUoV+7mWH9nH5iAc2aemoOEkPOlVf1ALlmDgmrewsdNdfwrLI2nr+ajciDGIbda88B
 r+SvTaYeCDFzZ/u170QzeeMAjSgU/457r6qWRBLMrdC2sQzAQT9IjbdyFl1L/xxZX6Oj
 Kg0g==
X-Gm-Message-State: APjAAAXP8B5i30N95iZg9PH7psYIKx4NsLFkpb3DGDLx1MTSISa90tQV
 gsLSBRcc5ZPUUbEcBY13SVCy2w==
X-Google-Smtp-Source: APXvYqyyMbe+dxwwItNp/tyv3HdnoX/WpGZ7zcVkOh5ro78Xx8HxUSY4zQ0tTBYphlS+3uAfQzNfwg==
X-Received: by 2002:a1c:dc08:: with SMTP id t8mr30655016wmg.139.1576492381812; 
 Mon, 16 Dec 2019 02:33:01 -0800 (PST)
Received: from dell ([2.27.35.132])
 by smtp.gmail.com with ESMTPSA id d8sm20918593wre.13.2019.12.16.02.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 02:33:01 -0800 (PST)
Date: Mon, 16 Dec 2019 10:33:01 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: bd6107: Convert to use GPIO descriptor
Message-ID: <20191216103301.GC3601@dell>
References: <20191202103028.102770-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202103028.102770-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwMiBEZWMgMjAxOSwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIFJvaG0gQkQ2
MTA3IGRyaXZlciBjYW4gcGFzcyBhIGZpeGVkIEdQSU8gbGluZSB1c2luZyB0aGUgb2xkCj4gR1BJ
TyBBUEkgdXNpbmcgcGxhdGZvcm0gZGF0YS4gQXMgdGhlcmUgYXJlIG5vIGluLXRyZWUgdXNlcnMg
b2YgdGhpcwo+IHBsYXRmb3JtIGRhdGEgc2luY2UgMjAxMywgd2UgY2FuIGNvbnZlcnQgdGhpcyB0
byB1c2UgYSBHUElPIGRlc2NyaXB0b3IKPiBhbmQgcmVxdWlyZSBhbnkgb3V0LW9mLXRyZWUgY29u
c3VtZXJzIHRvIHBhc3MgdGhlIEdQSU8gdXNpbmcKPiBhIG1hY2hpbmUgZGVzY3JpcHRvciB0YWJs
ZSBpbnN0ZWFkLgo+IAo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9iZDYxMDcu
YyAgICAgfCAyNCArKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgaW5jbHVkZS9saW51eC9wbGF0
Zm9ybV9kYXRhL2JkNjEwNy5oIHwgIDEgLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvm
nY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBP
cGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sg
fCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
