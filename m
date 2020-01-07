Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C391328F1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 15:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6226E0C5;
	Tue,  7 Jan 2020 14:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EC26E0C5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 14:33:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z3so54204441wru.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 06:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=B9kCZBzCa3OPKOxnRW9B6aJzv1zvRjaOSS6YO9GMesQ=;
 b=sIs+fctiAHDZvO1/J//nk3hf4t/k9VgDnBJ8fooiGvnZFm5IJz3/K8auAGQVsiKqRp
 bZwBxmWg/4kZUGed7vrb6mcIBEPFpUsmS8Puq0N1osWgGg45KyLx6ozVkA1YAel4Y7cN
 p5FRcwNTJjlzACZixiGRyO9PpSpyGr37HETuafnI2pP5+NRSbRebqYJKKEo7/8ULnYIA
 wtIn0vxX9sBlm9wuFaYH9QiUREBKE2MMuHmw2OnXOM+P66pYE63QNXCQPar20680vRVB
 hqrV04wl/YLDH7k2xt9HrsVIBI96XJapKHx8ln7dw+m57FzHpQfz9F4gDfZwIzrezF1M
 Y5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=B9kCZBzCa3OPKOxnRW9B6aJzv1zvRjaOSS6YO9GMesQ=;
 b=KJAhxsSlI7HZ9g7Vc1DDRtlTkoWg5ER7vpK5yycwwFfIyT91gE/Rav4Mmoq7tGQkLR
 JmEhPNlFsmUrocBHKH9DaHjQT2zgpsznjIwPwAaLzbr2ltvkhxzL7+dPJvQWwitTYCKQ
 z/09qMcLu0uOv/igmrAS3Kk9BQZFeY+IwYBu2rZ2JejedzzBsunsZ3i9hYDfWtUpRIWA
 XL21NbCsiBd5PwnXGqlEpCh2MiJ6ov4y9x1OgGKXOEaRU5iRz9BV4X/YwXqGL9joIQRs
 EuFB0/CdqESp9/kLSVB9RD1Z3d7Pv1MpbQGFwXms5ZSB3qHt8D0OYDD7RCzVyU0cOq2P
 Q5/Q==
X-Gm-Message-State: APjAAAWroyzMvv/T6GZpnXZ0VTlzifkCssF+n0sqFk6rm0NIOpBEpOhc
 DEDuOxMjMRR+6zN9h8/aOITwKw==
X-Google-Smtp-Source: APXvYqxLiq2Vxm7BymdTvGrcQbAasyqJYAawPBC+jse2yxXUYIok3KtmZ1vQbeEpibLG0Ldxa+sO6w==
X-Received: by 2002:adf:806e:: with SMTP id 101mr7682761wrk.300.1578407621321; 
 Tue, 07 Jan 2020 06:33:41 -0800 (PST)
Received: from dell ([2.27.35.135])
 by smtp.gmail.com with ESMTPSA id b17sm36621wrx.15.2020.01.07.06.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 06:33:40 -0800 (PST)
Date: Tue, 7 Jan 2020 14:33:42 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v10 6/6] backlight: add led-backlight driver
Message-ID: <20200107143342.GP14821@dell>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-7-jjhiblot@ti.com>
 <20191121181350.GN43123@atomide.com> <20200107102800.GG14821@dell>
 <20200107134540.x5tngzoslssesb2y@ucw.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107134540.x5tngzoslssesb2y@ucw.cz>
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org,
 Tony Lindgren <tony@atomide.com>, tomi.valkeinen@ti.com, sre@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwNyBKYW4gMjAyMCwgUGF2ZWwgTWFjaGVrIHdyb3RlOgoKPiBIaSEKPiAKPiA+ID4g
KiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+IFs3MDAxMDEgMDA6MDBdOgo+
ID4gPiA+IEZyb206IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gPiA+
ID4gCj4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIGEgbGVkLWJhY2tsaWdodCBkcml2ZXIgKGxlZF9i
bCksIHdoaWNoIGlzIHNpbWlsYXIgdG8KPiA+ID4gPiBwd21fYmwgZXhjZXB0IHRoZSBkcml2ZXIg
dXNlcyBhIExFRCBjbGFzcyBkcml2ZXIgdG8gYWRqdXN0IHRoZQo+ID4gPiA+IGJyaWdodG5lc3Mg
aW4gdGhlIEhXLiBNdWx0aXBsZSBMRURzIGNhbiBiZSB1c2VkIGZvciBhIHNpbmdsZSBiYWNrbGln
aHQuCj4gPiA+IC4uLgo+ID4gPiAKPiA+ID4gPiArCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMy
KG5vZGUsICJkZWZhdWx0LWJyaWdodG5lc3MiLCAmdmFsdWUpOwo+ID4gPiA+ICsJaWYgKCFyZXQg
JiYgdmFsdWUgPD0gcHJpdi0+bWF4X2JyaWdodG5lc3MpCj4gPiA+ID4gKwkJcHJpdi0+ZGVmYXVs
dF9icmlnaHRuZXNzID0gdmFsdWU7Cj4gPiA+ID4gKwllbHNlIGlmICghcmV0ICAmJiB2YWx1ZSA+
IHByaXYtPm1heF9icmlnaHRuZXNzKQo+ID4gPiA+ICsJCWRldl93YXJuKGRldiwgIkludmFsaWQg
ZGVmYXVsdCBicmlnaHRuZXNzLiBJZ25vcmluZyBpdFxuIik7Cj4gPiA+IAo+ID4gPiBIbW0gc28g
anVzdCB3b25kZXJpbmcuLiBBcmUgd2UgdXNpbmcgImRlZmF1bHQtYnJpZ2h0bmVzcyIgaW5zdGVh
ZCBvZiB0aGUKPiA+ID4gdXN1YWwgImRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCIgaGVyZT8KPiA+
IAo+ID4gRGlkIHRoaXMgZ2V0IGFuc3dlcmVkPwo+ID4gCj4gPiA+IFBsZWFzZSBDYyBtZSBvbiB0
aGUgbmV4dCBwYXRjaHNldCB0b28gOikKPiA+IAo+ID4gSSd2ZSBiZWVuIHdhaXRpbmcgZm9yIHYx
MS4KPiAKPiBJIGd1ZXNzIEkgY291bGQganVzdCByZW1vdmUgaXQgZnJvbSBhIG1lcmdlIGZvciBu
b3cgaWYgdGhlcmUncyBubyBvdGhlcgo+IGZpeC4KCldoYXQgZG8geW91IG1lYW4sIHNvcnJ5PwoK
VGhpcyBwYXRjaCBzaG91bGQgbm90IGJlIG1lcmdlZCBhbnl3aGVyZSB5ZXQuCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFj
ZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
