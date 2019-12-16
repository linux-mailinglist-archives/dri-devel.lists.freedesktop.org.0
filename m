Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FAF11FF8D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6896E130;
	Mon, 16 Dec 2019 08:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE716E130
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:23:39 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t2so6104216wrr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 00:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=CADl3sus23eXf0o9DSkqT/j9xqWFxLb2gzSZEjOVDrM=;
 b=NR/F1Lu9dLpqYhu0drRgTp0rcc5ozwOTBUgF+sQRe+tDGgAYlu6uBHNLjMO94QFEz2
 BCThmCy6MKUeAXxyDwEhwtFoOGwa25I+ytEvc6nJgM3x7Rvvo/oJ/AwgAiuB+o7YD4EF
 khrpHCGItplWWgV8schYbTmHMgyhbTKdyJ8jYKF4jDoXXLtHq9KnjZx6UZfw7qPqQiPQ
 HLklDFRvyAOzw5AohiVqMMHPA8MIloJMALvYYM3V4FRfF0OltC5GA7JmtXzJWAx9OI0q
 2HWIa/f5+JsZrFJpUaMMgbHSu17afx6Oc0cK0Q17zGSS4iHePJlTZ/EgEYBHuPpzzNYZ
 l/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=CADl3sus23eXf0o9DSkqT/j9xqWFxLb2gzSZEjOVDrM=;
 b=Qe9WlmHcn2Ek504E4kOC+Ve0cpcBT6z4XHkIGhcup5gjfxw0MJ+vPpHsuJCX5ddz/N
 doZ2eTj40rYFYP/xAO3vW75U+wggi0nocpGy1rTBmFNc9TIlQrko0Amhp6Lmscr43Ff9
 gmdaegkgom5x+YbQKyb2TlRIibgfr+APr97AufJZyLJJt81ZuY7H/UZQDQ3Myv0H99Dd
 AyqxCZGYwL2a5YCNrjoYjD9JOnJankLJP/44kAT7dth6MNSftniFSiiovYfZqISdWKdx
 3t/Umg8NRKXLTV80SUwqzGDUv6tq10wsdvHA8B/o2+GieOwIdx5uVFxuWLhMj3N69nmm
 0giQ==
X-Gm-Message-State: APjAAAWpWAL4zFVPzpZz9/PYQvuPjxnFliDNLR5cQdzi+KuTJvng9anC
 mvkvkoB/FgqsQaDI0DBkoSvNwIZojCQ=
X-Google-Smtp-Source: APXvYqz3ZQG02oodY7+SvP8ulgpDS87gnr76UZ84BZ62JWTEAk4EvCMwgDdGPiXfaPRFJuayYzAPcA==
X-Received: by 2002:adf:93c5:: with SMTP id 63mr28725558wrp.236.1576484617967; 
 Mon, 16 Dec 2019 00:23:37 -0800 (PST)
Received: from dell ([2.27.35.132])
 by smtp.gmail.com with ESMTPSA id g2sm20536256wrw.76.2019.12.16.00.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 00:23:36 -0800 (PST)
Date: Mon, 16 Dec 2019 08:23:36 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: corgi: Convert to use GPIO descriptors
Message-ID: <20191216082336.GD3648@dell>
References: <20191203123143.118487-1-linus.walleij@linaro.org>
 <87sgluy43j.fsf@belgarion.home>
 <CACRpkdZS0umWreCuXXkdmwLoSVyAtwMrN21EMyqnn4LR8zkFkw@mail.gmail.com>
 <87mubwxhnc.fsf@belgarion.home>
 <CACRpkdYJT+givuOP8SA9nuyDWr7yRW+X13okTVjVNP81Kdb__g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYJT+givuOP8SA9nuyDWr7yRW+X13okTVjVNP81Kdb__g@mail.gmail.com>
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
Cc: Andrea Adami <andrea.adami@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAxNCBEZWMgMjAxOSwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gT24gRnJpLCBEZWMg
MTMsIDIwMTkgYXQgNjoyNCBQTSBSb2JlcnQgSmFyem1payA8cm9iZXJ0LmphcnptaWtAZnJlZS5m
cj4gd3JvdGU6Cj4gPiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdy
aXRlczoKPiA+ID4gT24gU3VuLCBEZWMgOCwgMjAxOSBhdCA5OjA2IFBNIFJvYmVydCBKYXJ6bWlr
IDxyb2JlcnQuamFyem1pa0BmcmVlLmZyPiB3cm90ZToKPiA+ID4+IExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JpdGVzOgo+IAo+ID4gPiBTbyBpdCB3aWxsIHRoZW9y
ZXRpY2FsbHkgInNwaTAuMSIKPiA+ID4KPiA+ID4gQmV3YXJlIGFib3V0IGJ1Z3MgaW4gdGhlIGFi
b3ZlIGludGVycHJldGVyIGJlY2F1c2UgaXQgaXMKPiA+ID4ganVzdCBteSBicmFpbi4KPiA+Cj4g
PiBXZWxsLCBpZiBub2JvZHkgY29tcGxhaW5zIGJlY2F1c2Ugb2YgdGVzdGluZywgd2h5IG5vdCwg
eW91ciBleHBsYW5hdGlvbiBzZWVtcyBhcwo+ID4gZ29vZCBhcyBpdCBjb3VsZCBiZS4KPiAKPiA6
RAo+IAo+ID4gSWYgeW91IHdvdWxkIGJlIHNvIGtpbmQgYXMgdG8gY2FycnkgdGhlc2UgY2hhbmdl
cyB0aHJvdWdoIHlvdXIgdHJlZSBpbnN0ZWFkIG9mCj4gPiB0aGUgUFhBIG9uZSwgcGxlYXNlIGhh
dmUgbXkgOgo+ID4gQWNrZWQtYnk6IFJvYmVydCBKYXJ6bWlrIDxyb2JlcnQuamFyem1pa0BmcmVl
LmZyPgo+IAo+IEkgd2FzIGhvcGluZyB0aGUgYmFja2xpZ2h0IHBlb3BsZSB3b3VsZCBwaWNrIGl0
IHVwIHRvIHRoZSBiYWNrbGlnaHQgdHJlZS4KClllcCwgdGhhdCdzIHRoZSBwbGFuLgoKQmlnIHVw
ZGF0ZSB0b2RheSwgYmVhciB3aXRoLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8g
U2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
