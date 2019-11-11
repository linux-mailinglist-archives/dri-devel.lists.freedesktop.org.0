Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFCAF70BB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F636E872;
	Mon, 11 Nov 2019 09:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CA76E872
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:30:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q70so12496893wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 01:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=j4UsCyQdcZm2KCJe59FDjzH8nfUWhHJFhxVJ6xfimnY=;
 b=L1bqoRD4/ifLx2HXkKEYaDoZb3flHTgXvtM7LABHG1uhcP4L1+c53u/udydv/2N1dT
 837Jc725+f/lLqLIISzVCJjIbsOlcIm6z5x/71mx/na5igXiSb+7uPEtix+Nhg4ECsra
 wCoQfdjaEkt9DI9m9K87CUh3lhlWyXmWKKkpad9hX88kEQfaVg9VQORNFfwSVk25WTVQ
 I3RuBOhP9yMs8n9tdxE6l7lIgVA1ir+fqdkyWASoa50smKVw968H8b+DFEkZbRnt592r
 sZK4RffolPo5d1G3qCpslmNMeS4US8voF9EMNV1bKbJFXFJxj+gEJdnFIl9KsGgAGQJw
 8kDw==
X-Gm-Message-State: APjAAAXsBB/DjrXXHirDxYDwyHgCjgtfG5ODNXDJWoVFakHA2yFuhnNP
 Qecr7SSkv6CLn4PN8rXgihI5oA==
X-Google-Smtp-Source: APXvYqz0dNCJqOn51gF9WLKs0blLiqHdYKWXicmqZcGwIqo2oULL5pMRIbpJqhIRh6h98e57UR7klQ==
X-Received: by 2002:a1c:9a81:: with SMTP id
 c123mr18676120wme.118.1573464646982; 
 Mon, 11 Nov 2019 01:30:46 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id z14sm13555064wrl.60.2019.11.11.01.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 01:30:45 -0800 (PST)
Date: Mon, 11 Nov 2019 09:30:38 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 38/46] video: backlight: tosa: use gpio lookup table
Message-ID: <20191111093038.GA3218@dell>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-38-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018154201.1276638-38-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=j4UsCyQdcZm2KCJe59FDjzH8nfUWhHJFhxVJ6xfimnY=;
 b=R07dOsYYwpCpFqth2eEc/oCIsVGaao+wJn8wLg/tmKa7DWZrLBWvdgQx9iz4t5Bou+
 NyhMN5nHtROIBDBw/J2CRYIOtN+EXzAti6P8xtElGQWvekQHtrzTT1eBZCFSPGwuzGNu
 iJOqNEoouqVKG5syT/aSf4ScmQTaC4Dm/aumuHvIxx8ScQuOYUQPsTQ8ogi05kcJA2nF
 j77KE5TGXxf7iWtwl1Vu/bowSieiJy/4G5x3mTV7Obk6ktIIcic+E42dTW3WxMSJBEB+
 68IyDuWAADrxnS4xxQ7FliuravZHxaMgwkmsk8Ogdrup6ezZyviq0N4hLN6CZ9tChZSi
 Z2PQ==
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
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>,
 linux-fbdev@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxOCBPY3QgMjAxOSwgQXJuZCBCZXJnbWFubiB3cm90ZToKCj4gVGhlIGRyaXZlciBz
aG91bGQgbm90IHJlcXVpcmUgYSBtYWNoaW5lIHNwZWNpZmljIGhlYWRlci4gQ2hhbmdlCj4gaXQg
dG8gcGFzcyB0aGUgZ3BpbyBsaW5lIHRocm91Z2ggYSBsb29rdXAgdGFibGUsIGFuZCBtb3ZlIHRo
ZQo+IHRpbWluZyBnZW5lcmF0b3IgZGVmaW5pdGlvbnMgaW50byB0aGUgZHJpdmVycyBpdHNlbGYu
Cj4gCj4gQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gQ2M6IERhbmllbCBU
aG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gQ2M6IEppbmdvbyBIYW4gPGpp
bmdvb2hhbjFAZ21haWwuY29tPgo+IENjOiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpv
bG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogQXJu
ZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiAtLS0KPiBJJ20gbm90IG92ZXJseSBjb25m
aWRlbnQgdGhhdCBJIGdvdCB0aGUgY29ycmVjdCBkZXZpY2UgbmFtZXMKPiBmb3IgdGhlIGxvb2t1
cCB0YWJsZSwgaXQgd291bGQgYmUgZ29vZCBpZiBzb21lb25lIGNvdWxkCj4gZG91YmxlLWNoZWNr
Lgo+IC0tLQo+ICBhcmNoL2FybS9tYWNoLXB4YS9pbmNsdWRlL21hY2gvdG9zYS5oIHwgMTUgLS0t
LS0tLS0tLS0tLS0KPiAgYXJjaC9hcm0vbWFjaC1weGEvdG9zYS5jICAgICAgICAgICAgICB8IDIy
ICsrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC90b3NhX2Js
LmMgICAgIHwgMTAgKysrKystLS0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC90b3NhX2Js
LmggICAgIHwgIDggKysrKysrKysKPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvdG9zYV9sY2Qu
YyAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ICA1IGZpbGVzIGNoYW5nZWQs
IDU2IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvdG9zYV9ibC5oCgpBcHBsaWVkLCB0aGFua3MuCgotLSAK
TGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5h
cm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFy
bzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
