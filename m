Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F88DA5311
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 11:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397CE89812;
	Mon,  2 Sep 2019 09:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E0289812
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:41:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q12so13252082wrj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 02:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=XEaajhYL2DDcNnig232ycVZm5Az7zzGM6juW3JXG9yQ=;
 b=k+2kNDF1Xue7ZMO4eZx8i6+zdyPDu3wmg/Uew7lwMy/3cxiuHU/x6yBpY/O5NdhKYS
 +L/BS995EsyQqHI5CRGYxw531u5yyidk96ZEovq0Gjpt36olLO2FUrUKwJIHitG//K2g
 V9rlh7T7yGJICqcraxqyEiuP04pVrjR9MUHcHwaD/+k+rLTZyfJIJacPymz0XtRNRzuq
 c0kqY2K7q+FNUGgJ4Qdv4Q//rB8YgixfNMNRjw3O0/eXrKi6pSKdJpbWdxmzDvDWz9CY
 bb8Qu0j53tiH3qxiQ2L0aqlQUVUTDMxrR4Wi6PrpS9d8XgB70BhqZE2j5E15AQGq5/n4
 4m/w==
X-Gm-Message-State: APjAAAUJ27QoJlDoMnUegcVTJ8VU+3rRbg37kj9M5Cwl17EKlOpvJ7C1
 nhlbDFn5HhIi31SsmtkY/L5OtA==
X-Google-Smtp-Source: APXvYqzc9kvt4IxUGw8ouqARjHnLlmJJZz62Rz9BCP9k67kGZc0ulYwTxiSzmVBXrtHgzH6HcjVbGw==
X-Received: by 2002:adf:e603:: with SMTP id p3mr4027156wrm.102.1567417299891; 
 Mon, 02 Sep 2019 02:41:39 -0700 (PDT)
Received: from dell ([95.147.198.93])
 by smtp.gmail.com with ESMTPSA id g201sm11439111wmg.34.2019.09.02.02.41.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Sep 2019 02:41:39 -0700 (PDT)
Date: Mon, 2 Sep 2019 10:41:37 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190902094137.GM32232@dell>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709190007.91260-3-mka@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=XEaajhYL2DDcNnig232ycVZm5Az7zzGM6juW3JXG9yQ=;
 b=a/f0r3wh1i2nTAvJVAJBZEoLNeDpRYSXvLUG800eabb6+vAM1Piy+0FYiXbkWJS4on
 aywDOCMGNAhoBqPGDYyF+qGX2MgbkO8+mFR9K0wa5ChpvAgCDdzrq9vMq5dxnIhF+0yf
 N1vkx4pEtz5FJsNy3IIZoe3eMtE5GJBw9V3pdcQrBLYSshV3ucgoY6rq5hvTd+BWrteQ
 ZF8RYGsso3WxK/1Jp841Xpgz5qdpswdGBggqH3JmJxaYM3g3Hx0XAQYucE7PREvRuj9X
 kG60QBVhiW/tOtPkagKKds9jkvxyfjfCSXna7SOZDdD925Sq37LrwNctNNT8h4i04gaH
 G3Fg==
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwOSBKdWwgMjAxOSwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cgo+IEJhY2tsaWdo
dCBicmlnaHRuZXNzIGN1cnZlcyBjYW4gaGF2ZSBkaWZmZXJlbnQgc2hhcGVzLiBUaGUgdHdvIG1h
aW4KPiB0eXBlcyBhcmUgbGluZWFyIGFuZCBub24tbGluZWFyIGN1cnZlcy4gVGhlIGh1bWFuIGV5
ZSBkb2Vzbid0Cj4gcGVyY2VpdmUgbGluZWFybHkgaW5jcmVhc2luZy9kZWNyZWFzaW5nIGJyaWdo
dG5lc3MgYXMgbGluZWFyIChzZWUKPiBhbHNvIDg4YmE5NWJlZGI3OSAiYmFja2xpZ2h0OiBwd21f
Ymw6IENvbXB1dGUgYnJpZ2h0bmVzcyBvZiBMRUQKPiBsaW5lYXJseSB0byBodW1hbiBleWUiKSwg
aGVuY2UgbWFueSBiYWNrbGlnaHRzIHVzZSBub24tbGluZWFyIChvZnRlbgo+IGxvZ2FyaXRobWlj
KSBicmlnaHRuZXNzIGN1cnZlcy4gVGhlIHR5cGUgb2YgY3VydmUgY3VycmVudGx5IGlzIG9wYXF1
ZQo+IHRvIHVzZXJzcGFjZSwgc28gdXNlcnNwYWNlIG9mdGVuIHVzZXMgbW9yZSBvciBsZXNzIHJl
bGlhYmxlIGhldXJpc3RpY3MKPiAobGlrZSB0aGUgbnVtYmVyIG9mIGJyaWdodG5lc3MgbGV2ZWxz
KSB0byBkZWNpZGUgd2hldGhlciB0byB0cmVhdCBhCj4gYmFja2xpZ2h0IGRldmljZSBhcyBsaW5l
YXIgb3Igbm9uLWxpbmVhci4KPiAKPiBFeHBvcnQgdGhlIHR5cGUgb2YgdGhlIGJyaWdodG5lc3Mg
Y3VydmUgdmlhIHRoZSBuZXcgc3lzZnMgYXR0cmlidXRlCj4gJ3NjYWxlJy4gVGhlIHZhbHVlIG9m
IHRoZSBhdHRyaWJ1dGUgY2FuIGJlICdsaW5lYXInLCAnbm9uLWxpbmVhcicgb3IKPiAndW5rbm93
bicuIEZvciBkZXZpY2VzIHRoYXQgZG9uJ3QgcHJvdmlkZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUg
c2NhbGUKPiBvZiB0aGVpciBicmlnaHRuZXNzIGN1cnZlIHRoZSB2YWx1ZSBvZiB0aGUgJ3NjYWxl
JyBhdHRyaWJ1dGUgaXMgJ3Vua25vd24nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEth
ZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgo+IC0tLQo+IEZlZWwgZnJlZSB0byBzdWdnZXN0IGlt
cHJvdmVtZW50cyBpbiB0aGUgZG9jdW1lbnRhdGlvbiA6KQo+IAo+IENoYW5nZXMgaW4gdjM6Cj4g
LSByZW1vdmVkIGNvbXBvc2l0ZSBzdHJpbmdzLCBvbmx5IGtlZXAgJ2xpbmVhcicsICdub24tbGlu
ZWFyJyBhbmQKPiAgICd1bmtub3duJwo+IC0gdXBkYXRlZCBzeXNmcyBhdHRyaWJ1dGUgZG9jdW1l
bnRhdGlvbgo+IC0gdXBkYXRlZCBjb21taXQgbWVzc2FnZQo+IAo+IENoYW5nZXMgaW4gdjI6Cj4g
LSBjaGFuZ2VkIG9yZGVyIG9mIGJyaWdodG5lc3Mgc2NhbGUgZW51bXMsIGV4cGxpY2l0bHkgbWFr
ZSAndW5rbm93bicgemVybwo+IC0gbWlub3IgdXBkYXRlIG9mIGNvbW1pdCBtZXNzYWdlCj4gLSBk
ZWxldGVkIGV4Y2VzcyBibGFuayBsaW5lIGFmdGVyICdiYWNrbGlnaHRfc2NhbGVfdHlwZXMnCj4g
LSBzL2N1cnZlcy9jdXJ2ZS8gaW4gc3lzZnMgZG9jCj4gLS0tCj4gIC4uLi9BQkkvdGVzdGluZy9z
eXNmcy1jbGFzcy1iYWNrbGlnaHQgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysKPiAg
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9iYWNrbGlnaHQuYyAgICAgICAgICAgfCAxOSArKysrKysr
KysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L2JhY2tsaWdodC5oICAgICAgICAgICAgICAgICAgICAg
fCAgOCArKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWNsYXNzLWJhY2ts
aWdodAoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8g
U2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
