Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C28D5CD5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D029C89DDF;
	Mon, 14 Oct 2019 07:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D91789DDF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 07:57:28 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o18so18415661wrv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 00:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wlueTYL+8qZ9KSvaC2J4g2+SKGmj7tj869xGKKDwlhM=;
 b=CGTxIgoHtolC29AhRVX8cbtGX/jNhdbqvAC8xzfGvO0oKZD5gw+plrQuTWMu6LFFTl
 cjyCWx+Y7i23l7LKSZGD7ImFEVV8kF4S4+xQfJVRkSM/GdwG/DCXwbcLhdJwYJAd/zK7
 1JQwuPJgLxY2vTvqS4w/UgWH5hfCalryUBtembvNfqTXbBoLpzZjls99azXeaGTgA37i
 v7NlqMNlTnZCfFSzZUOjDN2rWLpOO5t8siXLaoP+zIkc419Lzw/lS0QgcnVDf7HaXyNt
 VqP5O3zm6OEgpmCsvLc/LAz5lp31CrnNF8Qsqr6Gw6AWJ+n3VfOalHi7I9e9QDSnEUma
 ZB3A==
X-Gm-Message-State: APjAAAUb/LRsfNsKhOmpVcZWOqDfgOsishcg1a19jYOS+0t8ueATkv0h
 KYGGptBVObhtAJfB/oy8Mj0Opw==
X-Google-Smtp-Source: APXvYqz1dQ+ediHiuUw3Ev4YeRHAcaUSBjOankgR/wtJRQ2BlmnBskvUcofomJfjQciB18XzBY6BAA==
X-Received: by 2002:adf:f5c2:: with SMTP id k2mr26018100wrp.0.1571039847065;
 Mon, 14 Oct 2019 00:57:27 -0700 (PDT)
Received: from dell ([2.27.167.11])
 by smtp.gmail.com with ESMTPSA id r2sm39324299wma.1.2019.10.14.00.57.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Oct 2019 00:57:26 -0700 (PDT)
Date: Mon, 14 Oct 2019 08:57:25 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v7 5/5] backlight: add led-backlight driver
Message-ID: <20191014075725.GI4545@dell>
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-6-jjhiblot@ti.com>
 <20191004143900.GO18429@dell>
 <cef282ee-3659-3bc3-da25-db02f843d61c@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cef282ee-3659-3bc3-da25-db02f843d61c@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=wlueTYL+8qZ9KSvaC2J4g2+SKGmj7tj869xGKKDwlhM=;
 b=EFZRMeDamau/PtjDTr3QllzMuLdqjBy/NYciSuFN+qIKgsX0Ot88ouA4V4VQ6UOMQG
 rWcI4kDhiK/io9dxf0zDYfHtSar7xjwL5WQEmucaF+ZqA2yfOGgkG8MlP4eq8kYcYh6M
 BV2DH+dladA+Iwa/7WEfoQWfy5qiHAzjwQP36mGz/BOraRyD/CEjY8f3SjfBYhYHafeo
 3Y8ostev2sEjqCZQ75hoFrs+xlgITGw50ztSPEyHM6GZprKYHasX7j9i5s5o+UIcbCB+
 Zv1gq2qmSvnoO7wpK3/3tyJGIUuBRXfHCXi/FCDYEkw/P4cXcx/KgDIBfW+E8PittOnW
 iSQQ==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNCBPY3QgMjAxOSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKCj4gSGkgTGVl
LAo+IAo+IE9uIDA0LzEwLzIwMTkgMTY6MzksIExlZSBKb25lcyB3cm90ZToKPiA+IE9uIFdlZCwg
MTggU2VwIDIwMTksIEplYW4tSmFjcXVlcyBIaWJsb3Qgd3JvdGU6Cj4gPiAKPiA+ID4gRnJvbTog
VG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPiA+ID4gCj4gPiA+IFRoaXMg
cGF0Y2ggYWRkcyBhIGxlZC1iYWNrbGlnaHQgZHJpdmVyIChsZWRfYmwpLCB3aGljaCBpcyBzaW1p
bGFyIHRvCj4gPiA+IHB3bV9ibCBleGNlcHQgdGhlIGRyaXZlciB1c2VzIGEgTEVEIGNsYXNzIGRy
aXZlciB0byBhZGp1c3QgdGhlCj4gPiA+IGJyaWdodG5lc3MgaW4gdGhlIEhXLiBNdWx0aXBsZSBM
RURzIGNhbiBiZSB1c2VkIGZvciBhIHNpbmdsZSBiYWNrbGlnaHQuCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+Cj4gPiA+
IEFja2VkLWJ5OiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KPiA+ID4gUmV2aWV3ZWQtYnk6
IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gPiA+IC0tLQo+
ID4gPiAgIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcgIHwgICA3ICsKPiA+ID4gICBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9NYWtlZmlsZSB8ICAgMSArCj4gPiA+ICAgZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvbGVkX2JsLmMgfCAyNjAgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ID4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjY4IGluc2VydGlvbnMoKykKPiA+ID4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2JsLmMKPiA+IEFw
cGxpZWQsIHRoYW5rcy4KPiAKPiBJdCB3aWxsIGJyZWFrIHRoZSBidWlsZCBiZWNhdXNlIGl0IHJl
bGllcyBvbiBmdW5jdGlvbnMgbm90IHlldCBpbiB0aGUgTEVECj4gY29yZSAoZGV2bV9sZWRfZ2V0
KCkgZm9yIHY3IG9yIGRldm1fb2ZfbGVkX2dldCgpIGZvciB2OCkKCllvdSdyZSByaWdodCwgdW4t
YXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2Vydmlj
ZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
