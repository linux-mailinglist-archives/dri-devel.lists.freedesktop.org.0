Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8FE7038B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 17:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B587489686;
	Mon, 22 Jul 2019 15:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70D789686
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:20:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v15so35636126wml.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rcQE3lqQ7qHdpTliGnphmcGBT5sq5T1i6sYO3p/vgc8=;
 b=o3GXt2zlS126Wa16oSvaVtRFO4EbfTtMmUGsDMV6JTI8oB0ltvJSA7iA49OYSCCyZH
 /R4/iC9CeHmVhRB+awbCmlwHRZEhayEBwibmO/z0+JVPv8xzDVdBYmDdQoj1toKRuBt9
 j5rRtpcrXiVVGeQcRAhcncYZrl2Mzx7eVwqYREK0JQieOoviy6QhgkYaZQpXy1gPWsiM
 QR03UJElBxDQGS92agW3uINEhpI4meidPQp0xSQfPW+rMNVzYxBrW3KZ03hqWmPmrPo1
 DD96DmKhKf4rO4gJNP+h77WOPEpmRbbqPLKlNCP8Qqf/gqSy5zuuwl+uwxanSbmFevFp
 gt6Q==
X-Gm-Message-State: APjAAAWe6DGn9uS2RW0EwRXHKf2FebiV/KJiZkLQRl7sVtQr1O7s6MsD
 qp180eALKi5xpm0RpIdGSNR0uA==
X-Google-Smtp-Source: APXvYqxCxsboFZaheGk5qi4oj8GmwA1c5IhO90rjs/b8WLMO0LzRMCPUTyNiuTec/jgg8DLQfEd8uA==
X-Received: by 2002:a7b:cc04:: with SMTP id f4mr65955957wmh.125.1563808846569; 
 Mon, 22 Jul 2019 08:20:46 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a81sm39805102wmh.3.2019.07.22.08.20.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:20:45 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:20:44 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 5/7] backlight: gpio: remove dev from struct
 gpio_backlight
Message-ID: <20190722152044.7zwf2xtzbpesjrmv@holly.lan>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722150302.29526-6-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rcQE3lqQ7qHdpTliGnphmcGBT5sq5T1i6sYO3p/vgc8=;
 b=V+zBb66mMoZKT+uP6vSPu6gSa0cocMmWscUDuipWZQXinBTzJl0+/SZPTSnx/eG+W7
 M2gj/SB4fPiH3QDjf67mfQ8Nq5e0taThlxRK+Pbv7iY6AjFz4MRd5WmNbZAH+RPBNaXn
 oOJ3sPFg2QfJ4sHMHeXZKOUX6YXHy+63u7p2v9E8LBX9VH9uUxjd8OySrTsVephTd/5R
 zd5znXce9+FzwhGw8znDlGTMr6/pjW832Gw97gSXXtorFOujysfZYyCcISGscjrm85Yj
 kuuLzWhOidE+E7wuLCQSBOYLTMQtQx0W6tctgLTMOj716nlnXLGkUcDWZPCJqLVA93M9
 0vbw==
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDU6MDM6MDBQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFRoaXMgZmllbGQgaXMgdW51c2VkLiBSZW1vdmUgaXQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNv
bT4KClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8u
b3JnPgoKCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMg
fCA0IC0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gaW5kZXggMDEyNjIxODZmYTFlLi43MDg4
MjU1NmYwNDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNr
bGlnaHQuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMK
PiBAQCAtMTksOSArMTksNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICAKPiAgc3Ry
dWN0IGdwaW9fYmFja2xpZ2h0IHsKPiAtCXN0cnVjdCBkZXZpY2UgKmRldjsKPiAgCXN0cnVjdCBk
ZXZpY2UgKmZiZGV2Owo+IC0KPiAgCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9kOwo+ICAJaW50IGRl
Zl92YWx1ZTsKPiAgfTsKPiBAQCAtNjksOCArNjcsNiBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xp
Z2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlpZiAoZ2JsID09IE5V
TEwpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+IC0JZ2JsLT5kZXYgPSAmcGRldi0+ZGV2Owo+
IC0KPiAgCWlmIChwZGF0YSkKPiAgCQlnYmwtPmZiZGV2ID0gcGRhdGEtPmZiZGV2Owo+ICAKPiAt
LSAKPiAyLjIxLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
