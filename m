Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5529ACDC07
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF8C6E462;
	Mon,  7 Oct 2019 07:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E124C6E252
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 05:48:05 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y72so7875761pfb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2019 22:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5tzoF5jEWBGYn2YEncgp+nUwEVI8tjzoOCexGDe1hVc=;
 b=fGujlVDVV7tUNAVhSBIWRMVTlKWtV2vzjfIaOaRXPOFoc+9Ek+bvig+quaiBc0qfUM
 GyHiI0EnSOYH7190areYS2wixpt4/P+5vLoM3qMQ1+sVB2YicJj68Wnn/vFKf2r4B3xw
 /J+8pJwcnFPaSgCZH44aVRNzZGkupNQDCxxbsDuP0yV+zoTJggX4Iq5HjJBibr7+w+TB
 lByRoEJ4JnLoxt837WtcLy8blwQQVOUbUBn4V2pVZ+BqqYxF58Oqab5lwf2sxcLyHnkb
 ZQ2noEBouuaquSahrJK025PHlgIiZLOIezfjz8UaAk9kNnMA3/sKAfJtORKvuVk2uWXj
 6csw==
X-Gm-Message-State: APjAAAWxd0tAM7My6di/5ioSeFEesUSc57ZJb6qY21uKyBU5iLD7XGSv
 IwasazuNzlxbhLmVYML7oHnwRg==
X-Google-Smtp-Source: APXvYqx8wMELgRKaVDfwPVaxFK4vskD26Isa8VG9p6kFK7Fr+X+pG18Z3YrxVjib5kmWx8LxnhwKbg==
X-Received: by 2002:a65:504c:: with SMTP id k12mr16046935pgo.252.1570427285224; 
 Sun, 06 Oct 2019 22:48:05 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id u7sm5730980pfn.61.2019.10.06.22.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 22:48:04 -0700 (PDT)
Date: Sun, 6 Oct 2019 22:48:01 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH RFC v2 3/5] ARM: dts: qcom: pm8941: add 5vs2 regulator node
Message-ID: <20191007054801.GH6390@tuxbook-pro>
References: <20191007014509.25180-1-masneyb@onstation.org>
 <20191007014509.25180-4-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007014509.25180-4-masneyb@onstation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5tzoF5jEWBGYn2YEncgp+nUwEVI8tjzoOCexGDe1hVc=;
 b=iWm2gbrxXJtQbLIiHmiKtOzlK0kdACMqzvNyCI0Bvt31xz+eLXkAX3gfjASqtsyxd2
 pibAMwyUux/rIge9wN9ApuhvjHkiHSb6pKraakhzlhJbh8JgeyELWbZL3PIl53pLUXyM
 iC4fFVNWHchNI0Y9vRlKepoKrk43B7Q/GtfRWIqXe+L/euPWh53pNl7YkRPu2Px87Ijb
 ti4S14CzINDFcQoHtWJxeSosRNR3kd6DjPJfm/4b+LrhRudNDYrseCHJvA0sPBhBVIts
 zkUet9HlTvXp/wvmIvi/ZrzCOh/d/RQI2xYxO0LV3j4KYxlVl9xwzjWI37g1ahIIy/6B
 m2Gg==
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
Cc: freedreno@lists.freedesktop.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuIDA2IE9jdCAxODo0NSBQRFQgMjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgoKPiBwbTg5
NDEgaXMgbWlzc2luZyB0aGUgNXZzMiByZWd1bGF0b3Igbm9kZSBzbyBsZXQncyBhZGQgaXQgc2lu
Y2UgaXRzCj4gbmVlZGVkIHRvIGdldCB0aGUgZXh0ZXJuYWwgZGlzcGxheSB3b3JraW5nLiBUaGlz
IHJlZ3VsYXRvciB3YXMgYWxyZWFkeQo+IGNvbmZpZ3VyZWQgaW4gdGhlIGludGVycnVwdHMgcHJv
cGVydHkgb24gdGhlIHBhcmVudCBub2RlLgo+IAo+IE5vdGUgdGhhdCB0aGlzIHJlZ3VsYXRvciBp
cyByZWZlcnJlZCB0byBhcyBtdnMyIGluIHRoZSBkb3duc3RyZWFtIE1TTQo+IGtlcm5lbCBzb3Vy
Y2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24u
b3JnPgo+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+CgpQaWNrZWQgdGhpcyBwYXRjaCBmb3Igbm93LCBvbmNlIHRoZSBkcml2ZXIgdXBkYXRlcyBh
cmUgbGFuZGVkIEkgd2lsbAp0YWtlIHRoZSBsYXN0IHR3byBkdHMgcGF0Y2hlcy4KClJlZ2FyZHMs
CkJqb3JuCgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjE6Cj4gLSBOb25lCj4gCj4gIGFyY2gvYXJt
L2Jvb3QvZHRzL3Fjb20tcG04OTQxLmR0c2kgfCAxMCArKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3Fjb20tcG04OTQxLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9xY29tLXBtODk0MS5kdHNpCj4g
aW5kZXggZjE5ODQ4MGM4ZWY0Li5jMWYyMDEyZDFjOGIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvcWNvbS1wbTg5NDEuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20t
cG04OTQxLmR0c2kKPiBAQCAtMTc4LDYgKzE3OCwxNiBAQAo+ICAJCQkJcWNvbSx2cy1zb2Z0LXN0
YXJ0LXN0cmVuZ3RoID0gPDA+Owo+ICAJCQkJcmVndWxhdG9yLWluaXRpYWwtbW9kZSA9IDwxPjsK
PiAgCQkJfTsKPiArCj4gKwkJCXBtODk0MV81dnMyOiA1dnMyIHsKPiArCQkJCXJlZ3VsYXRvci1l
bmFibGUtcmFtcC1kZWxheSA9IDwxMDAwPjsKPiArCQkJCXJlZ3VsYXRvci1wdWxsLWRvd247Cj4g
KwkJCQlyZWd1bGF0b3Itb3Zlci1jdXJyZW50LXByb3RlY3Rpb247Cj4gKwkJCQlxY29tLG9jcC1t
YXgtcmV0cmllcyA9IDwxMD47Cj4gKwkJCQlxY29tLG9jcC1yZXRyeS1kZWxheSA9IDwzMD47Cj4g
KwkJCQlxY29tLHZzLXNvZnQtc3RhcnQtc3RyZW5ndGggPSA8MD47Cj4gKwkJCQlyZWd1bGF0b3It
aW5pdGlhbC1tb2RlID0gPDE+Owo+ICsJCQl9Owo+ICAJCX07Cj4gIAl9Owo+ICB9Owo+IC0tIAo+
IDIuMjEuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
