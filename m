Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2B0F8EBE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 12:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD336E40C;
	Tue, 12 Nov 2019 11:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15ABF6E40C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 11:40:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t1so18156979wrv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 03:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SLuhtJEUY90bkqc19DKt+xd8yq8xw26lU1HTC8t+5Ww=;
 b=sE0VJfsemYuAbjFhHV8pdCWMbU131bYte4Q8vHWxMowDbSBfnUpY8v4Ydfth+akGDm
 enmj2iwgSeIU46Ceg5vY9+Lknc4HSo+/LepmseeZjmgvtWELOMLU0LR4/INfR5aP6Gv5
 JsGDE4PpfAVjvUPc1pWJ7DXb3r8NHUauwf1EDBvyl9P9r5FtzBn7VtH3QX0XSqN6Aqyr
 ns7zYc785BPrGNrXHZOJzKO68aHjgsVmVL7O5+0zGAh8c2hHwmKOlI9F90N/bQctJRKT
 kTzs4sopmk/TeZlLo01E654crspcIJyQsHt9CBIP4UrHdYWzC5u65Cyf4kGlWEFZMRHP
 0tHg==
X-Gm-Message-State: APjAAAVU6M4bY2BrD6uP4SiC5a1RZxt9G+EBJasWofKDsvJJTGwuGTCg
 ZbVspYeU6PAuYU68vZ/mlBFthQ==
X-Google-Smtp-Source: APXvYqwt3tNaS/uT92o7K3rM2wGyefBrcWVvOCdsSmuV5mHmF/CHpgdD2v2b3xmUuttwQkFy9ND83A==
X-Received: by 2002:adf:f744:: with SMTP id z4mr16993048wrp.205.1573558808635; 
 Tue, 12 Nov 2019 03:40:08 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v81sm3331292wmg.4.2019.11.12.03.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 03:40:07 -0800 (PST)
Date: Tue, 12 Nov 2019 11:40:06 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] backlight: qcom-wled: fix spelling mistake
 "trigged" -> "triggered"
Message-ID: <20191112114006.wxjsrcmhrjyeai6e@holly.lan>
References: <20191112093025.98638-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112093025.98638-1-colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SLuhtJEUY90bkqc19DKt+xd8yq8xw26lU1HTC8t+5Ww=;
 b=v2f/kpHAG3P+dAelw27PbhnuN6PPubaQHKMkdlBuTKEATOxTzOE7QC7sKigDqDWOp9
 /PomLsUcwsoNHkQ/+GUWD7yAHlQPDRoQ5D8eyMkFySsjDD4VISYFgaN77lqF9YUphhhu
 Qz4lXcfjVX3e0gFkFiC1WAIBeq8/XOvMzJn3L3NnYO4ui/VDr7tTu6LpqiYfQTCCmKk0
 L8SfAkihIdipXkrVlomuho9sj64bXeQ/WhJBZyJ2kYfy2gjKCLqU/IIWSoudQCjf3dX+
 vUqg/veoDt7yVZpKAndlUgDs4sAkWdwoRdojufDpxpacK2UUDW2HtLqPGzhkWiVtldG8
 d73g==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDk6MzA6MjVBTSArMDAwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IFRoZXJlIGlzIGEgc3BlbGxpbmcgbWlzdGFrZSBpbiBhIGRldl9lcnIgZXJyb3IgbWVzc2FnZS4g
Rml4IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+CgpSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBz
b25AbGluYXJvLm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xl
ZC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMg
Yi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYwo+IGluZGV4IDMzYjYwMDdjNWU1
NS4uZDQ2MDUyZDhmZjQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fj
b20td2xlZC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKPiBA
QCAtMzIyLDcgKzMyMiw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB3bGVkX3Nob3J0X2lycV9oYW5k
bGVyKGludCBpcnEsIHZvaWQgKl93bGVkKQo+ICAJCXdsZWQtPnNob3J0X2NvdW50ID0gMTsKPiAg
Cj4gIAlpZiAod2xlZC0+c2hvcnRfY291bnQgPiBXTEVEX1NIT1JUX0NOVF9NQVgpIHsKPiAtCQlk
ZXZfZXJyKHdsZWQtPmRldiwgIlNob3J0IHRyaWdnZWQgJWQgdGltZXMsIGRpc2FibGluZyBXTEVE
IGZvcmV2ZXIhXG4iLAo+ICsJCWRldl9lcnIod2xlZC0+ZGV2LCAiU2hvcnQgdHJpZ2dlcmVkICVk
IHRpbWVzLCBkaXNhYmxpbmcgV0xFRCBmb3JldmVyIVxuIiwKPiAgCQkJd2xlZC0+c2hvcnRfY291
bnQpOwo+ICAJCXdsZWQtPmRpc2FibGVkX2J5X3Nob3J0ID0gdHJ1ZTsKPiAgCQlnb3RvIHVubG9j
a19tdXRleDsKPiAtLSAKPiAyLjIwLjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
