Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74ED114149
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 14:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1ECA6F57F;
	Thu,  5 Dec 2019 13:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191796E181
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 13:15:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q9so3725134wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 05:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t+FOsqG088MQ/Rpd/JAJf1h5akdx130ujdcBNRFOAfk=;
 b=tu/4+knyRveMYKLBh7dCpnxOTerIasJts+BSlVrhmLS65R4cTgA60oE7O7GzXtVzff
 MJf9yHxoY9BQPQaq16vQjJ6hxHrXL5tco7l4ndtnByBROvHV1xd49hdlulvinJph1o0O
 X1BYP8MEG6yRZHSWMusX/P+fgECiEWGn/gtGT0WtYDz4uXNFkGPjZAn0pH0qdM023jJX
 nuHHRUOTtOOtI1Zx3lQtz1wfVPe8EmfK6vym+6R4PzB2I9YwOuK+ozsW/fGEVW0h7xnG
 jnriE7apLzAa0onjYzyC1EUV2C3fEzGMx+DRQ6lGxlMy6zsgPFOuLtcWY2Do67Hc3Z+Z
 uE/Q==
X-Gm-Message-State: APjAAAVZ1lKWB7FesUYC0h1u86baZy94ZqYQShI7em8HuAfaq1Pq/4Ua
 MSJwDjZqSqxLnY9LUojrX+snvw==
X-Google-Smtp-Source: APXvYqxs63QtYpu8U/qQjLPi32tLYsZYZvnOjWc/5VzAfakJnb2D+5ALdz4xYEoOHRQ1ujVS1IEgFQ==
X-Received: by 2002:a7b:c7cc:: with SMTP id z12mr5408777wmk.115.1575551727646; 
 Thu, 05 Dec 2019 05:15:27 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q6sm13055846wrx.72.2019.12.05.05.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 05:15:27 -0800 (PST)
Date: Thu, 5 Dec 2019 13:15:25 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: pwm_bl: Switch to full GPIO descriptor
Message-ID: <20191205131525.tf4n3kfnkrf6eksl@holly.lan>
References: <20191205081116.5254-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205081116.5254-1-linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t+FOsqG088MQ/Rpd/JAJf1h5akdx130ujdcBNRFOAfk=;
 b=WZCIgqJZWH+ewdVO+z3NKeUzNZsgIx7F0l7WZG0eSqupGSv7KpOBc+S3mr3Y38VcYR
 DHBMvDeeSraSt9aSQbLDWUe92+mjFEFv0EDXsPijapP315WWbnIVf+T+St7xVeYXRjBV
 lq6FZLkRW458PQ/LZYrMiETsi5IvsJERFuFGCNdDCxsVsOo0Cm8BbMRQQ8mm4N/pm1ht
 U1Y42+BO6Fsvx4BF92qigFC5jALiUfK1MF3J2LsMcuN76p77VMahqusA/GuGI1APzdf0
 WBSBiGaoCdCruXNS4XE7giVRCZfb50V6GistC2TzxkOjn+07ZPyrIy22KdtJQWgoE0/s
 ovCw==
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>,
 Guan Xuetao <gxt@pku.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMDk6MTE6MTZBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBUaGUgUFdNIGJhY2tsaWdodCBzdGlsbCBzdXBwb3J0cyBwYXNzaW5nIGEgZW5hYmxl
IEdQSU8gbGluZSBhcwo+IHBsYXRmb3JtIGRhdGEgdXNpbmcgdGhlIGxlZ2FjeSA8bGludXgvZ3Bp
by5oPiBBUEkuCj4gCj4gSXQgdHVybnMgb3V0IHRoYXQgZXZlciBib2FyZCB1c2luZyB0aGlzIG1l
Y2hhbmlzbSBleGNlcHQgb25lCj4gaXMgcGFzcyAuZW5hYmxlX2dwaW8gPSAtMS4gU28gd2UgZHJv
cCBhbGwgdGhlc2UgY2FyZ28tY3VsdGVkIC0xJ3MKPiBmcm9tIGFsbCBpbnN0YW5jZXMgb2YgdGhp
cyBwbGF0Zm9ybSBkYXRhIGluIHRoZSBrZXJuZWwuCj4gCj4gVGhlIHJlbWFuaW5nIGJvYXJkLCBQ
YWxtIFRDLCBpcyBjb252ZXJ0ZWQgdG8gcGFzcyBhIG1hY2hpbmUKPiBkZXNjcmlwdGlvciB0YWJs
ZSB3aXRoIHRoZSAiZW5hYmxlIiBHUElPIGluc3RlYWQsIGFuZCBkZWxldGUgdGhlCj4gcGxhdGZv
cm0gZGF0YSBlbnRyeSBmb3IgZW5hYmxlX2dwaW8gYW5kIHRoZSBjb2RlIGhhbmRsaW5nIGl0Cj4g
YW5kIHRoaW5ncyBzaG91bGQgd29yayBzbW9vdGhseSB3aXRoIHRoZSBuZXcgQVBJLgo+IAo+IENj
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gQ2M6IFJvYmVydCBKYXJ6
bWlrIDxyb2JlcnQuamFyem1pa0BmcmVlLmZyPgo+IENjOiBHdWFuIFh1ZXRhbyA8Z3h0QHBrdS5l
ZHUuY24+Cj4gQ2M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgoKTG9va3MgZ29vZCBidXQuLi4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtcHhh
L3BhbG10Yy5jIGIvYXJjaC9hcm0vbWFjaC1weGEvcGFsbXRjLmMKPiBpbmRleCBmNTJiZDE1NWU4
MjUuLjM4MTMxMTg0MzViZiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9tYWNoLXB4YS9wYWxtdGMu
Ywo+ICsrKyBiL2FyY2gvYXJtL21hY2gtcHhhL3BhbG10Yy5jCj4gQEAgLTE3NSw2ICsxNzUsMTUg
QEAgc3RhdGljIGlubGluZSB2b2lkIHBhbG10Y19rZXlzX2luaXQodm9pZCkge30KPiAgICogQmFj
a2xpZ2h0Cj4gICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovCj4gICNpZiBkZWZpbmVkKENPTkZJR19C
QUNLTElHSFRfUFdNKSB8fCBkZWZpbmVkKENPTkZJR19CQUNLTElHSFRfUFdNX01PRFVMRSkKPiAr
Cj4gK3N0YXRpYyBzdHJ1Y3QgZ3Bpb2RfbG9va3VwX3RhYmxlIHBhbG10Y19wd21fYmxfZ3Bpb190
YWJsZSA9IHsKPiArCS5kZXZfaWQgPSAicHdtLWJhY2tsaWdodC4wIiwKPiArCS50YWJsZSA9IHsK
PiArCQlHUElPX0xPT0tVUCgiZ3Bpby1weGEiLCBHUElPX05SX1BBTE1UQ19CTF9QT1dFUiwKPiAr
CQkJICAgICJlbmFibGUiLCBHUElPX0FDVElWRV9ISUdIKSwKPiArCX0sCj4gK307Cj4gKwoKLi4u
IEkgY2Fubm90IGZpbmQgdGhlIGNvcnJlc3BvbmRpbmcgcmVtb3ZhbCBvZiB0aGUgCmAuZW5hYmxl
X2dwaW8gPSBHUElPX05SX1BBTE1UQ19CTF9QT1dFUmAgbWVhbmluZyB0aGF0IC4uLgoKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wd21fYmFja2xpZ2h0LmggYi9pbmNsdWRlL2xpbnV4L3B3
bV9iYWNrbGlnaHQuaAo+IGluZGV4IDhlYTI2NWEwMjJmZC4uMDYwODZjYjkzYjZmIDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvbGludXgvcHdtX2JhY2tsaWdodC5oCj4gKysrIGIvaW5jbHVkZS9saW51
eC9wd21fYmFja2xpZ2h0LmgKPiBAQCAtMTYsOCArMTYsNiBAQCBzdHJ1Y3QgcGxhdGZvcm1fcHdt
X2JhY2tsaWdodF9kYXRhIHsKPiAgCXVuc2lnbmVkIGludCAqbGV2ZWxzOwo+ICAJdW5zaWduZWQg
aW50IHBvc3RfcHdtX29uX2RlbGF5Owo+ICAJdW5zaWduZWQgaW50IHB3bV9vZmZfZGVsYXk7Cj4g
LQkvKiBUT0RPIHJlbW92ZSBvbmNlIGFsbCB1c2VycyBhcmUgc3dpdGNoZWQgdG8gZ3Bpb2RfKiBB
UEkgKi8KPiAtCWludCBlbmFibGVfZ3BpbzsKCi4uLiBJIHdvcnJ5IHRoYXQgcGFsbXRjLmMgaXMg
bm8gbG9uZ2VyIGNvbXBpbGFibGUgZm9yIHNvbWUgY29uZmlncy4KCgpEYW5pZWwuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
