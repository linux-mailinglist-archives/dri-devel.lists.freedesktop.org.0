Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FFD5C965
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 08:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB1089C37;
	Tue,  2 Jul 2019 06:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2A289C37
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 06:36:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x17so16314502wrl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 23:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=kL52YKQhFRfe3VLS8UGs1QL98Cpg/XLkHXZMM+/zcyM=;
 b=mJsPwOkL31Mg8YklEgysVvHL5TXSikHwP+MYxYhzZfaUPr7JS7U02kM03BCkuO8lNq
 8rjiYaQOCsNEqssIlk6kWjhGVTuUG1uyqjqif7wong1iKT4lzRt5X44yx3EgQYRYr3Pn
 8EFNlBN4wLTxQeJWTiEcNjVWhRCyxRfYDJShzfQKjuOOWImwRhYwbVhDOmvXTQiDb3pZ
 61g9cpMlFnAfM1XTIAtGcGqQndal7kJ17ldymOUX/BKvL2tlw3XOfczmr0EEFH058X/6
 svOpraRQGeuIjHCuByeIGAAbj5Nj97D3VyQCZgU2jYofoxrPey4p+AAxpjHHO6K9PBVL
 B2dg==
X-Gm-Message-State: APjAAAUBAdFvKLblF0bb0Y2nS3KFzihCSgENkv5Do6u2jsj/L9YeQ3La
 TrGtBA/uzK+MKENOC8Fio3UgJQ==
X-Google-Smtp-Source: APXvYqyNIADHpitNQlVYgOHrVqbwIkf6QAAdkpRA5Xs8300TxHIp8LjNRmcFL/fWRjeA4UT1R1Qr1A==
X-Received: by 2002:a05:6000:1285:: with SMTP id
 f5mr7035937wrx.315.1562049416043; 
 Mon, 01 Jul 2019 23:36:56 -0700 (PDT)
Received: from dell ([2.27.35.164])
 by smtp.gmail.com with ESMTPSA id h133sm1648236wme.28.2019.07.01.23.36.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 01 Jul 2019 23:36:55 -0700 (PDT)
Date: Tue, 2 Jul 2019 07:36:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 00/12] ARM: davinci: da850-evm: remove more legacy GPIO
 calls
Message-ID: <20190702063653.GC4652@dell>
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <fe42c0e1-2bfb-2b1c-2c38-0e176e88ec6e@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe42c0e1-2bfb-2b1c-2c38-0e176e88ec6e@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=kL52YKQhFRfe3VLS8UGs1QL98Cpg/XLkHXZMM+/zcyM=;
 b=YZV+d5gqyzrP4gJNY5WwDuXGyrmn0m0DVdTv+9ppXaeW71PBbeOby+m1eElOIBixjX
 bkEre9t6nF7NUX9U965KXC/EJ8N98Cru9PsOJGSjGF9gFnwp8/QzBDy5LTRHXHi9aqrI
 zW9Z41R0hL7APL7VK5m6sYCxRpZfFKvd1bTVN0BR21ivFK/UZmgSRk9ygU2x48NnBA8X
 AcBGEN/Jh0clFSqBDXkVTpFBncTcdw03s0bRc1OCI9d189YVkL5re+bSQrm+0KZ0TqmV
 AWij6o1bxNwElPFN+PCnj2zJDkewnveeiEIoypEZ0ljdMwx5LuxyF3hah2RwmITTiE2x
 w1Kw==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Lechner <david@lechnology.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwMSBKdWwgMjAxOSwgU2VraGFyIE5vcmkgd3JvdGU6Cgo+IEhpIExlZSwgRGFuaWVs
LCBKaW5nb28sCj4gCj4gT24gMjUvMDYvMTkgMTA6MDQgUE0sIEJhcnRvc3ogR29sYXN6ZXdza2kg
d3JvdGU6Cj4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGli
cmUuY29tPgo+ID4gCj4gPiBUaGlzIGlzIGFub3RoZXIgc21hbGwgc3RlcCBvbiB0aGUgcGF0aCB0
byBsaWJlcmF0aW5nIGRhdmluY2kgZnJvbSBsZWdhY3kKPiA+IEdQSU8gQVBJIGNhbGxzIGFuZCBz
aHJpbmtpbmcgdGhlIGRhdmluY2kgR1BJTyBkcml2ZXIgYnkgbm90IGhhdmluZyB0bwo+ID4gc3Vw
cG9ydCB0aGUgYmFzZSBHUElPIG51bWJlciBhbnltb3JlLgo+ID4gCj4gPiBUaGlzIHRpbWUgd2Un
cmUgcmVtb3ZpbmcgdGhlIGxlZ2FjeSBjYWxscyB1c2VkIGluZGlyZWN0bHkgYnkgdGhlIExDREMK
PiA+IGZiZGV2IGRyaXZlci4KPiA+IAo+ID4gVGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgbW9kaWZ5
IHRoZSBHUElPIGJhY2tsaWdodCBkcml2ZXIuIFRoZSBmaXJzdAo+ID4gb2YgdGhlbSBhZGRzIHRo
ZSBuZWNlc3NhcnkgZnVuY3Rpb25hbGl0eSwgdGhlIG90aGVyIHR3byBhcmUganVzdAo+ID4gdHdl
YWtzIGFuZCBjbGVhbnVwcy4KPiAKPiBDYW4geW91IHRha2UgdGhlIGZpcnN0IHRocmVlIHBhdGNo
ZXMgZm9yIHY1LjMgLSBpZiBpdHMgbm90IHRvbyBsYXRlPyBJCj4gdGhpbmsgdGhhdCB3aWxsIG1h
a2UgaXQgZWFzeSBmb3IgcmVzdCBvZiBwYXRjaGVzIHRvIG1ha2UgaW50byBzdWJzZXF1ZW50Cj4g
a2VybmVsIHJlbGVhc2VzLgoKSXQncyBhbHJlYWR5IHRvbyBsYXRlIGluIHRoZSBjeWNsZSAoLXJj
NykgZm9yIHRoYXQuICBJIHJlcXVpcmUgcGF0Y2hlcwpvZiB0aGlzIG5hdHVyZSB0byBoYXZlIGEg
Z29vZCBzb2FrIGluIC1uZXh0IGJlZm9yZSBiZWluZyBtZXJnZWQuIFRoZXJlCnNob3VsZG4ndCBi
ZSBhbiBpc3N1ZSB3aXRoIGdldHRpbmcgdGhlbSBpbnRvIHY1LjQgdGhvdWdoLgoKPiA+IE5leHQg
dHdvIHBhdGNoZXMgZW5hYmxlIHRoZSBHUElPIGJhY2tsaWdodCBkcml2ZXIgaW4KPiA+IGRhdmlu
Y2lfYWxsX2RlZmNvbmZpZy4KPiA+IAo+ID4gUGF0Y2ggNi8xMiBtb2RlbHMgdGhlIGJhY2tsaWdo
dCBHUElPIGFzIGFuIGFjdHVhbCBHUElPIGJhY2tsaWdodCBkZXZpY2UuCj4gPiAKPiA+IFBhdGNo
ZXMgNy05IGV4dGVuZCB0aGUgZmJkZXYgZHJpdmVyIHdpdGggcmVndWxhdG9yIHN1cHBvcnQgYW5k
IGNvbnZlcnQKPiA+IHRoZSBkYTg1MC1ldm0gYm9hcmQgZmlsZSB0byB1c2luZyBpdC4KPiA+IAo+
ID4gTGFzdCB0aHJlZSBwYXRjaGVzIGFyZSBpbXByb3ZlbWVudHMgdG8gdGhlIGRhOHh4IGZiZGV2
IGRyaXZlciBzaW5jZQo+ID4gd2UncmUgYWxyZWFkeSB0b3VjaGluZyBpdCBpbiB0aGlzIHNlcmll
cy4KPiAKPiBUaGFua3MsCj4gU2VraGFyCj4gCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxp
bmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBz
b2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwg
QmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
