Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382B0C3750
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 16:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1976E7E2;
	Tue,  1 Oct 2019 14:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431C86E7E2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 14:29:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b24so3486030wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 07:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Zbs/Q3MsdenwE0g7FlmKiMlk/SOvniNFvpDInB7/8lg=;
 b=R30Dpaet5+2Bnyq0y5PiiOW8pCuMSbEbjYfC6imGvprTozI8iwwg+cR7E6fyXR4byF
 rVOMRkpXB+ljpJh/L/4iCa+jND3mvRjLg+sNDDsQiX5MsbbZkHZ18q7GSQ7iQ0ZZRI0Q
 G0Z1xDyOmFmtPFh4As6TIqffBKqPqsr9wExL3KHhNncr9ivuJFveML5Jt+hU2FT+6wwk
 uqX4AN9jZH2ssNJ4AAbh5MyRHg2MluXLKayk4y7uDma0M2JeR62/q/hR58YIKQELTlNH
 gRnGcs1gF84cCOG8J7jzYeWL7Odo86kYcPzFzCeCo5nJX3WnDvSV7CA7zVgTWqiOTAeu
 rwYg==
X-Gm-Message-State: APjAAAUbwwxN35lhraf4WHjnRWXM5jxDCNOXZ01uxpqVAPcBGeW/PUYO
 3GXMzcUzpGoRIANkZyzl0fsI1w==
X-Google-Smtp-Source: APXvYqxXALWaJtwvVfsLlZFYYua2CQBoHGuUym/bKHxQZ190WXx8BwxxVFOpKgosan9NU4AewmAYlQ==
X-Received: by 2002:a05:600c:2290:: with SMTP id
 16mr805781wmf.161.1569940160774; 
 Tue, 01 Oct 2019 07:29:20 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id l18sm15404308wrc.18.2019.10.01.07.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 07:29:20 -0700 (PDT)
Date: Tue, 1 Oct 2019 15:29:18 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v4 1/7] backlight: gpio: remove unneeded include
Message-ID: <20191001142918.gjifvlkz574dbihr@holly.lan>
References: <20191001125837.4472-1-brgl@bgdev.pl>
 <20191001125837.4472-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001125837.4472-2-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Zbs/Q3MsdenwE0g7FlmKiMlk/SOvniNFvpDInB7/8lg=;
 b=Ab78udnPe3CRWuo1p82gth5GZPwVCa619kuHOdLyJPwlTZWd8o67QnPGzfD0g5txa/
 Hgmc/jnJuqVkWi7VwGXZ8lnqFcojAh6LTJrrJsydA11V+jKR6g2nJ0wuW/S4lTboC/SW
 bKo1z1nPOemI8ZG34YVv5PlBByBjHVtciX91NVR8dL7DIiy+x5UgDPi2wQ1vDO2VxRbo
 /LSQmlDGgjSUsQ9KL2o+b0G21XyHl0ICmPWF5a+VKrekFyLvwoa18e0ac+vetvM4EHav
 V6wM6F4HzCA1IGEfa0dNVeVcb5gPTSNz9p4iL163mCfdf3Xyy3seTMimN6B43VNWdJQD
 8H5w==
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
Cc: Jacopo Mondi <jacopo@jmondi.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDI6NTg6MzFQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFdlIG5vIGxvbmdlciB1c2UgYW55IHN5bWJvbHMgZnJvbSBvZl9ncGlv
LmguIFJlbW92ZSB0aGlzIGluY2x1ZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xh
c3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBEYW5pZWwg
VGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgoKPiAtLS0KPiAgZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9n
cGlvX2JhY2tsaWdodC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQu
Ywo+IGluZGV4IDE4ZTA1M2U0NzE2Yy4uN2UxOTkwMTk5ZmFlIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiArKysgYi9kcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gQEAgLTEyLDcgKzEyLDYgQEAKPiAgI2luY2x1
ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9vZi5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGF0YS9ncGlvX2JhY2tsaWdodC5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wcm9wZXJ0eS5oPgo+IC0t
IAo+IDIuMjMuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
