Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FEC10688B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5946D6F4FE;
	Fri, 22 Nov 2019 09:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id C3E546E1E8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 18:13:55 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 1541880DB;
 Thu, 21 Nov 2019 18:14:30 +0000 (UTC)
Date: Thu, 21 Nov 2019 10:13:50 -0800
From: Tony Lindgren <tony@atomide.com>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v10 6/6] backlight: add led-backlight driver
Message-ID: <20191121181350.GN43123@atomide.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-7-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009085127.22843-7-jjhiblot@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Fri, 22 Nov 2019 09:00:44 +0000
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tomi.valkeinen@ti.com,
 sre@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgoqIEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4gWzcwMDEwMSAwMDow
MF06Cj4gRnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPiAKPiBU
aGlzIHBhdGNoIGFkZHMgYSBsZWQtYmFja2xpZ2h0IGRyaXZlciAobGVkX2JsKSwgd2hpY2ggaXMg
c2ltaWxhciB0bwo+IHB3bV9ibCBleGNlcHQgdGhlIGRyaXZlciB1c2VzIGEgTEVEIGNsYXNzIGRy
aXZlciB0byBhZGp1c3QgdGhlCj4gYnJpZ2h0bmVzcyBpbiB0aGUgSFcuIE11bHRpcGxlIExFRHMg
Y2FuIGJlIHVzZWQgZm9yIGEgc2luZ2xlIGJhY2tsaWdodC4KLi4uCgo+ICsJcmV0ID0gb2ZfcHJv
cGVydHlfcmVhZF91MzIobm9kZSwgImRlZmF1bHQtYnJpZ2h0bmVzcyIsICZ2YWx1ZSk7Cj4gKwlp
ZiAoIXJldCAmJiB2YWx1ZSA8PSBwcml2LT5tYXhfYnJpZ2h0bmVzcykKPiArCQlwcml2LT5kZWZh
dWx0X2JyaWdodG5lc3MgPSB2YWx1ZTsKPiArCWVsc2UgaWYgKCFyZXQgICYmIHZhbHVlID4gcHJp
di0+bWF4X2JyaWdodG5lc3MpCj4gKwkJZGV2X3dhcm4oZGV2LCAiSW52YWxpZCBkZWZhdWx0IGJy
aWdodG5lc3MuIElnbm9yaW5nIGl0XG4iKTsKCkhtbSBzbyBqdXN0IHdvbmRlcmluZy4uIEFyZSB3
ZSB1c2luZyAiZGVmYXVsdC1icmlnaHRuZXNzIiBpbnN0ZWFkIG9mIHRoZQp1c3VhbCAiZGVmYXVs
dC1icmlnaHRuZXNzLWxldmVsIiBoZXJlPwoKUGxlYXNlIENjIG1lIG9uIHRoZSBuZXh0IHBhdGNo
c2V0IHRvbyA6KQoKUmVnYXJkcywKClRvbnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
