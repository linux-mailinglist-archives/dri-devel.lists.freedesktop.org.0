Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93453AD615
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 11:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28CD89A9B;
	Mon,  9 Sep 2019 09:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADCB89A9B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 09:53:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q12so13874948wmj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 02:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q0Bu4MUr8Rse6QepVD+Mo7/VVrikFAdvAtW78HC8sMg=;
 b=I339ewoAPdSQjWlGbU1Qsqp/x/ZMLbeCPKaz78VsdWbh72ju8fJq6hAnY2O8icLftK
 fl/Fz1II9VElSycjqNCWOgT/y0sBS/oi8pl3VVGEskWWxaR2W0TKXGC2bOB/cJ/jMjsZ
 KTXf5e7GE63RYhhBb9Ly/GH6mzLru0ye4gcnX3MorTJcb3MGXutIUVlL106xTdbbHX8Y
 eBMeKxEp4PrqRHdT6M1kZkDyqAarTS1tK/OW46j1X11X+Q9hQTa0M0TcI+K1LpJ51fOp
 As7skOU6dt/f4uozPNTSdvnEqRdHc2lTIvVwN1409oD1mjqzxT+jThnyTdKQhXkh7Y2W
 /TiA==
X-Gm-Message-State: APjAAAVUAn96fSPiuJA+Bd+eWJ3dDzYPfCMuJFGLAihA9HgiuQtNm6Ht
 RnxGWLXbe2dfsbSQTJmOFrKb9g==
X-Google-Smtp-Source: APXvYqyD7rIWfK15PwhuVw8tOpuuhFAqh0A4/sE3kYWn0d2L0pLoNlfPN6HlEweSVm7rZWqOpmvIXg==
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr19129801wmd.14.1568022787085; 
 Mon, 09 Sep 2019 02:53:07 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q15sm12234012wmb.28.2019.09.09.02.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 02:53:06 -0700 (PDT)
Date: Mon, 9 Sep 2019 10:53:04 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v4 4/4] backlight: add led-backlight driver
Message-ID: <20190909095304.67ehnpg6gckwpno4@holly.lan>
References: <20190717141514.21171-1-jjhiblot@ti.com>
 <20190717141514.21171-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717141514.21171-5-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=q0Bu4MUr8Rse6QepVD+Mo7/VVrikFAdvAtW78HC8sMg=;
 b=Bdcic7+lcLbSMXP63HOL8yGDSyRidRn33ahnPC9DyBQXs/uzkjDWHM6b+3k/T5b8rP
 B0EcqGZmUCTyCvJUwQmSpboPIL7qnlQNvmgn6UBWaCeq8OxhRiPa784Gi4iG4ziivAHe
 40DI6CbEhX8vC6FpHJuao5Ia8QbiRsojJzGqRn4PvkWrgyaQRQW8cqHcQ+fq9pvmnn57
 OTr9M3sOnmtmha2JM6yxCnLPt3ol5O/t3/kjj+47pamlrROJHzvMxkTNqp0WRQoja+4U
 NN+IVCqxOSJmxpEQRTn+Od7PnTqjxD4F9bnN/lmRbb0qrsSzeSADIEW/BnF3aXzyqR4y
 dEIw==
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
Cc: mark.rutland@arm.com, jingoohan1@gmail.com, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDQ6MTU6MTRQTSArMDIwMCwgSmVhbi1KYWNxdWVzIEhp
YmxvdCB3cm90ZToKPiBGcm9tOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29t
Pgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBhIGxlZC1iYWNrbGlnaHQgZHJpdmVyIChsZWRfYmwpLCB3
aGljaCBpcyBzaW1pbGFyIHRvCj4gcHdtX2JsIGV4Y2VwdCB0aGUgZHJpdmVyIHVzZXMgYSBMRUQg
Y2xhc3MgZHJpdmVyIHRvIGFkanVzdCB0aGUKPiBicmlnaHRuZXNzIGluIHRoZSBIVy4gTXVsdGlw
bGUgTEVEcyBjYW4gYmUgdXNlZCBmb3IgYSBzaW5nbGUgYmFja2xpZ2h0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgo+IEFja2VkLWJ5OiBQ
YXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGln
aHQvS2NvbmZpZyAgfCAgIDcgKwo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9NYWtlZmlsZSB8
ICAgMSArCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xlZF9ibC5jIHwgMjY4ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyNzYgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2Js
LmMKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2JsLmMgYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRfYmwuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMDAwLi5hYzVmZjc4ZTc4NTkKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2JsLmMKPiBAQCAtMCwwICsxLDI2OCBAQAo+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsvKgo+ICsgKiBDb3B5cmlnaHQg
KEMpIDIwMTUtMjAxOSBUZXhhcyBJbnN0cnVtZW50cyBJbmNvcnBvcmF0ZWQgLSAgaHR0cDovL3d3
dy50aS5jb20vCj4gKyAqIEF1dGhvcjogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRp
LmNvbT4KPiArICoKPiArICogQmFzZWQgb24gcHdtX2JsLmMKPiArICovCj4gKwo+ICsjaW5jbHVk
ZSA8bGludXgvYmFja2xpZ2h0Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+
CgpXaHkgZG8gd2UgbmVlZCB0aGlzIGhlYWRlciBmaWxlPwoKPiArI2luY2x1ZGUgPGxpbnV4L2xl
ZHMuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gKwo+ICsjZGVmaW5l
IEJLTF9GVUxMX0JSSUdIVE5FU1MgMjU1CgpJZiB3ZSByZWFsbHkgbmVlZCB0byBoYXZlIGEgZnVs
bCBpbnRlbnNpdHkgY29uc3RhbnQgdGhlbiBzaG91bGRuJ3Qgd2UKdXNlIExFRF9GVUxMIGRpcmVj
dGx5LgoKPiArCj4gK3N0cnVjdCBsZWRfYmxfZGF0YSB7Cj4gKwlzdHJ1Y3QgZGV2aWNlCQkqZGV2
Owo+ICsJc3RydWN0IGJhY2tsaWdodF9kZXZpY2UJKmJsX2RldjsKPiArCXN0cnVjdCBsZWRfY2xh
c3NkZXYJKipsZWRzOwo+ICsJYm9vbAkJCWVuYWJsZWQ7Cj4gKwlpbnQJCQluYl9sZWRzOwo+ICsJ
dW5zaWduZWQgaW50CQkqbGV2ZWxzOwo+ICsJdW5zaWduZWQgaW50CQlkZWZhdWx0X2JyaWdodG5l
c3M7Cj4gKwl1bnNpZ25lZCBpbnQJCW1heF9icmlnaHRuZXNzOwo+ICt9Owo+ICsKPiArc3RhdGlj
IGludCB0b19sZWRfYnJpZ2h0bmVzcyhzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWQsIGludCB2YWx1
ZSkKPiArewo+ICsJcmV0dXJuICh2YWx1ZSAqIGxlZC0+bWF4X2JyaWdodG5lc3MpIC8gQktMX0ZV
TExfQlJJR0hUTkVTUzsKClRoaXMgY29kZSBsb29rcyBicm9rZW4uCgpGb3IgZXhhbXBsZSBsZWQt
Pm1heF9icmlnaHRuZXNzIGlzIDEyNyB0aGVuIHRoZSB2YWx1ZSB0aGlzCmZ1bmN0aW9uIHdpbGwg
cGljayB2YWx1ZXMgaXMgaW4gdGhlIGludGVydmFsIDAuLjYzIHdoaWNoIGlzCndyb25nIHNpbmNl
IHdlIGFyZSBub3QgdXNpbmcgdGhlIGZ1bGwgcmFuZ2Ugb2YgdGhlIExFRC4KClNpbWlsYXJseSBs
ZWQtPm1heF9icmlnaHRuZXNzIGlzID4gMjU1IHRoZW4gd2UnbGwgZ2VuZXJhdGUgdmFsdWVzCnRo
YXQgYXJlIG91dC1vZi1yYW5nZQoKCkRhbmllbC4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
