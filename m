Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F3ECE9C8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 18:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050756E610;
	Mon,  7 Oct 2019 16:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5906E60D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 16:48:04 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id q7so5358604ywe.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 09:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bQ7t0YfEyUi6/XxzSzzzJPgkBy/Y1npqi1QHUBdAdjs=;
 b=gbDpQIZwGDx+xyPO2zj+hcOKlARNy9B3GzDSg/+yRkBx4cQ1UeLHgqZ7j9AXl93pup
 1e1fy3sJ+VHHLKDBZihxwEpo8wUS71UweYCO0liwAJvod5oNL0auLCfoytjtGs9fuktx
 +ZoWTW0fIAhedk94b6p1baAj8FizKcnnTCQTBXde73FB8Op7KrGRsG92SpVSVu+dNWxZ
 XfzAQd7S/BOe4RhSBhVkscGaSM+R9wKGp7trnDi2xRRbFbTZPT14bGaLHIpe8+AKLOye
 QDZG3oEWtBIxptSILHcIQ2auT9IqOqdV+BUcvxPl3+eQQ8t2NMGhMXRAdyzeWZFFZkoJ
 51sw==
X-Gm-Message-State: APjAAAVhf6FM5TC9ERdIogOYgjEx+Hl/BLP3wAhxiVJ8Fk7X3ihhNq3w
 KxUOhq710Suc5YGfNVAo2E5ZzQ==
X-Google-Smtp-Source: APXvYqzqFE/kG9F8NYrqeqGMnEJIHroH1DGoJ5wHOm/YlpjWwk8tZNWrYg1M2OA9pEzzh3ILFWBkWg==
X-Received: by 2002:a81:7b05:: with SMTP id w5mr20591060ywc.15.1570466883457; 
 Mon, 07 Oct 2019 09:48:03 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id y129sm4181437ywy.41.2019.10.07.09.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 09:48:02 -0700 (PDT)
Date: Mon, 7 Oct 2019 12:48:02 -0400
From: Sean Paul <sean@poorly.run>
To: Derek Basehore <dbasehore@chromium.org>
Subject: Re: [PATCH v8 4/4] drm/mtk: add panel orientation property
Message-ID: <20191007164802.GD126146@art_vandelay>
References: <20190925225833.7310-1-dbasehore@chromium.org>
 <20190925225833.7310-5-dbasehore@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925225833.7310-5-dbasehore@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bQ7t0YfEyUi6/XxzSzzzJPgkBy/Y1npqi1QHUBdAdjs=;
 b=W3fLoSUrj8yJnZCMtZp+3Z2XubKePSGiIXKCTJtf8NgGqe6YfhNrC9bveRjZw6wpmF
 v9jzQ5j1VQP3GRAx44r0Jhgc8TJPiEB7XTnjchviKgXZI8nD3yG7I/WgoHu3YEtryVvz
 fG4rdsgZxIXFthOSjMaybVSlmOow3T3ljx0qxNCFJpkpmiiGPJBCNNOiY057IySo7EGV
 2yf1Zh1r/t+Q8vdPk8hNVF6FtTOalBTihx2aE1PTwc4qPBruNr0J8+YNM4KwX9C1BzCc
 g8jWzB0LOr31wuXEGyYlQ9E7EGPr+FHjDYwtdXdDlFUFtbYFK+7Ic2bLdoPaPMQMlzMz
 oOCg==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDM6NTg6MzNQTSAtMDcwMCwgRGVyZWsgQmFzZWhvcmUg
d3JvdGU6Cj4gVGhpcyBpbml0cyB0aGUgcGFuZWwgb3JpZW50YXRpb24gcHJvcGVydHkgZm9yIHRo
ZSBtZWRpYXRlayBkc2kgZHJpdmVyCj4gaWYgdGhlIHBhbmVsIG9yaWVudGF0aW9uIChjb25uZWN0
b3IuZGlzcGxheV9pbmZvLnBhbmVsX29yaWVudGF0aW9uKSBpcwo+IG5vdCBEUk1fTU9ERV9QQU5F
TF9PUklFTlRBVElPTl9VTktOT1dOLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERlcmVrIEJhc2Vob3Jl
IDxkYmFzZWhvcmVAY2hyb21pdW0ub3JnPgo+IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+Cj4gUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+CgpS
ZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgOCArKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
Cj4gaW5kZXggMjI0YWZiNjY2ODgxLi4yOTM2OTMyMzQ0ZWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMKPiBAQCAtNzkyLDEwICs3OTIsMTggQEAgc3RhdGljIGludCBtdGtfZHNp
X2NyZWF0ZV9jb25uZWN0b3Ioc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3RydWN0IG10a19kc2kg
KmRzaSkKPiAgCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gYXR0YWNoIHBhbmVsIHRvIGRybVxuIik7
Cj4gIAkJCWdvdG8gZXJyX2Nvbm5lY3Rvcl9jbGVhbnVwOwo+ICAJCX0KPiArCj4gKwkJcmV0ID0g
ZHJtX2Nvbm5lY3Rvcl9pbml0X3BhbmVsX29yaWVudGF0aW9uX3Byb3BlcnR5KCZkc2ktPmNvbm4p
Owo+ICsJCWlmIChyZXQpIHsKPiArCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gaW5pdCBwYW5lbCBv
cmllbnRhdGlvblxuIik7Cj4gKwkJCWdvdG8gZXJyX3BhbmVsX2RldGFjaDsKPiArCQl9Cj4gIAl9
Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIAo+ICtlcnJfcGFuZWxfZGV0YWNoOgo+ICsJZHJtX3BhbmVs
X2RldGFjaChkc2ktPnBhbmVsKTsKPiAgZXJyX2Nvbm5lY3Rvcl9jbGVhbnVwOgo+ICAJZHJtX2Nv
bm5lY3Rvcl9jbGVhbnVwKCZkc2ktPmNvbm4pOwo+ICAJcmV0dXJuIHJldDsKPiAtLSAKPiAyLjIz
LjAuMzUxLmdjNDMxNzAzMmU2LWdvb2cKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2lu
ZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
