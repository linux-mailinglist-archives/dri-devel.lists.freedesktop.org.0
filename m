Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF38AD76E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 12:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9250F892BC;
	Mon,  9 Sep 2019 10:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D679892BC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 10:59:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p13so14148616wmh.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 03:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cC4g9BRBEaf08E8q7Ceq+EDE6JFex4JwlziqyOjWmy0=;
 b=dJlTVf8OpTJ+2pTk9++j5/wUKoBXs+JxAtz4THSI4QmIYQ0SRb37pyFluG4cQn2kiZ
 fc+BbZDzYFl1ANSUL8/bY+uzKNFmSCF8CEQaFB/UUVImzYwI2Mtg/079+XRCsmxytHBn
 Ez8iJxRbD98hNqh34tALr7PQ0JADjy7Z5dwS739kW0tdhoSFY19jM9okJahvH/USCrwb
 /WjSUSCimxTZKNrVi2v0uPp2VEZkbOnugPzCFTrBCdP8tZvC6NOUE8wbAyECgRrt9y9m
 kym2q0UBK2oFyGUKl8KyrIus3+Asj6Js79iKJhqOwf7PdJl3hTn+l6173bOByImVAwEW
 T20Q==
X-Gm-Message-State: APjAAAXcZPMcq49lEfeu8a5kdWwoOamClNaBObN8H2lVM6UGKpcDVOir
 s2QKV9HulxvvQcSP811fX0glpA==
X-Google-Smtp-Source: APXvYqzyqfA2w/Lqb9/5hfL+KB+09ziudbSV+CalqKx6i1gQ7KLdpqRoeuy4hGtJtvQV1S9tM22+/Q==
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr155367wml.150.1568026784923; 
 Mon, 09 Sep 2019 03:59:44 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s3sm10943664wmj.48.2019.09.09.03.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 03:59:44 -0700 (PDT)
Date: Mon, 9 Sep 2019 11:59:42 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 2/2] dt-bindings: backlight: lm3630a: add enable_gpios
Message-ID: <20190909105942.pxwz6rtjg3cxlcnf@holly.lan>
References: <20190908203704.30147-1-andreas@kemnade.info>
 <20190908203704.30147-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190908203704.30147-3-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cC4g9BRBEaf08E8q7Ceq+EDE6JFex4JwlziqyOjWmy0=;
 b=PVIe3K3q+MLvV9INLxU2fZYlQCC9Jc1EePTFLZast77owUaVemUSI1wYrcz+h1thcT
 /DU/8gPgn0DHHXvoBNfU9oEobDMKs3QGwxbmVTSpJl6oZaSDoJyZpnsiqcT945v+w/fz
 mJDJtD8l/7MHSRYQppq1Jdi+Z4kY06oBD/kg65+/MCD/YmxvzjTJ7gD/H7xy0vmBXiz1
 FP6c9+wIoz5/qyhzC5+uqESbx88b4zOeFtyaNfkWBrnRvGaoNVd01IgGSmUs93HKYmfU
 xbV7YqOoRdRUq9LLJv9mbAvGCpjbkOfC63THV2N7eFR5xusJYYpO+yQpmy5HKDgAakji
 ORYQ==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMDgsIDIwMTkgYXQgMTA6Mzc6MDRQTSArMDIwMCwgQW5kcmVhcyBLZW1uYWRl
IHdyb3RlOgo+IGFkZCBlbmFibGUtZ3Bpb3MgdG8gZGVzY3JpYmUgSFdFTiBwaW4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFkZS5pbmZvPgoKTG9va3Mg
bGlrZSBwYXRjaGVzIGFyZSBpbiB0aGUgd3Jvbmcgb3JkZXIuIENoYW5nZXMgdG8gYmluZGluZ3Mg
bXVzdAphcHBlYXIgaW4gcGF0Y2hzZXRzICpiZWZvcmUqIHRoZSBMaW51eCBpbXBsZW1lbnRhdGlv
biBvZiB0aGUgYmluZGluZ3MuCgoKPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbGVk
cy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbCB8IDQgKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEt
YmFja2xpZ2h0LnlhbWwKPiBpbmRleCBkYzEyOWQ5YTMyOWUuLmE5NjU2ZDcyYjY2OCAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQv
bG0zNjMwYS1iYWNrbGlnaHQueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55YW1sCj4gQEAgLTI5LDYg
KzI5LDEwIEBAIHByb3BlcnRpZXM6Cj4gICAgJyNzaXplLWNlbGxzJzoKPiAgICAgIGNvbnN0OiAw
Cj4gIAo+ICsgIGVuYWJsZS1ncGlvczoKPiArICAgIGRlc2NyaXB0aW9uOiBHUElPIHRvIHVzZSB0
byBlbmFibGUvZGlzYWJsZSB0aGUgYmFja2xpZ2h0IChIV0VOIHBpbikuCj4gKyAgICBtYXhJdGVt
czogMQo+ICsKPiAgcmVxdWlyZWQ6Cj4gICAgLSBjb21wYXRpYmxlCj4gICAgLSByZWcKClBsZWFz
ZSBhZGQgZW5hYmxlLWdwaW9zIHRvIG9uZSBvZiB0aGUgZXhhbXBsZXMuCgoKRGFuaWVsLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
