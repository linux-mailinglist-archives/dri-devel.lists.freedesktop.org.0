Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E422345AF0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 10:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E5C6E875;
	Tue, 23 Mar 2021 09:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1B46E875
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 09:35:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id kt15so16460144ejb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=T8ujadlsfMOs83cAs9UtDu2l6f6I0ppOLicLa7+9n6s=;
 b=rhGUZpU3lq5FuN30OA5Lu/hODznQG1MHp3rCnsMvUr+jaUOk5+8issQpgldBzkuSw9
 i2fmo6f9WkqeLOhkE75LJsZtyjw4jy0BOeMgVvkPN/mQM7cm5q00oNKE19Q+Lfwf3hND
 d3Vyr2vaKckTtvJRZJagY+VMVZB220QmCBLiF1zJdopIMcih5ZmHvEr2Hic6fmNOmtJl
 YI5o5EuJYApg+IDqrgbWj/QogHm2uvark0SAUYZDxVJvfy4hhXJP3rg+Qg30zMFARi5s
 +McQ5ehedTb4vloDDhWhPsNV/y5IWPY5wkGxTNxserKwKfhgwYHJPf8bpefB68WXf4Lc
 G4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=T8ujadlsfMOs83cAs9UtDu2l6f6I0ppOLicLa7+9n6s=;
 b=PU8+JBvXpu3rGG7CCGVtNIZ8KGG0+7XvRysHn2RdJ2UGrqZoQ6p/ckrhHOtW3pbfw0
 MO1poJAbf7DpE0txD+p+d0yUB9yrBFJEIyVRwIgQJ6Y6+WpGi04xZ7nXBWnPpfcdpF41
 gmsesT/QJxom0F5zzhInypAgynIUbXPvIgdgvFWEh9xQsFyqlcfUtSjMBh3tHJ4FSD5X
 PtRjb8RpskBhumMhsxzCb32B4XufQTQXz4rhQ7ebLStTNK4pUzFgJhyIb+uhHdIIzY7m
 rkYpvcB3cVAMEbJn6AGumswZsmM+Nxndy7Ie/ayqEzOMfP0kseGEFZSKBtUNV36vQ4fR
 qZLw==
X-Gm-Message-State: AOAM532YSl8OSCvHlNPg41fOUXcYW4eiBjqU22j1rgg4x4x+aaa/uWCQ
 ilXEy9naZCb82TIB258ngSOQFA==
X-Google-Smtp-Source: ABdhPJznA5cuEOX+OJTa2zs2ul2EylGfPKzOYpS/rjV0k2ciZGN4I3439arfs0FK6NUztAu3QzBrnA==
X-Received: by 2002:a17:907:2809:: with SMTP id
 eb9mr3935111ejc.204.1616492142655; 
 Tue, 23 Mar 2021 02:35:42 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id a9sm12701859eds.33.2021.03.23.02.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 02:35:42 -0700 (PDT)
Date: Tue, 23 Mar 2021 09:35:40 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Message-ID: <20210323093540.dqrhjlvr6oza3hvt@maple.lan>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
 <20210322161810.biagj2qro66rv4gt@maple.lan>
 <20210323083935.GF2916463@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323083935.GF2916463@dell>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 Pavel Machek <pavel@ucw.cz>, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMjMsIDIwMjEgYXQgMDg6Mzk6MzVBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIE1vbiwgMjIgTWFyIDIwMjEsIERhbmllbCBUaG9tcHNvbiB3cm90ZToKPiAKPiA+IE9u
IFN1biwgRmViIDI4LCAyMDIxIGF0IDAxOjQxOjA1UE0gKzAxMDAsIEtvbnJhZCBEeWJjaW8gd3Jv
dGU6Cj4gPiA+IEFkZCBhIGNvbXBhdGlibGUgZm9yIFBNSTg5OTQgV0xFRC4gSXQgdXNlcyB0aGUg
VjQgb2YgV0xFRCBJUC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEtvbnJhZCBEeWJjaW8g
PGtvbnJhZC5keWJjaW9Ac29tYWlubGluZS5vcmc+Cj4gPiAKPiA+IFJldmlld2VkLWJ5OiBEYW5p
ZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IAo+IFdoeSBhcmUgeW91
IFJldmlld2luZy9BY2tpbmcgYSBwYXRjaCB0aGF0IHdhcyBhcHBsaWVkIG9uIHRoZSAxMHRoPwoK
U2ltcGx5IGFuIG92ZXJzaWdodC4gTG9va3MgbGlrZSBJIGZvcmdvdCB0byByZW1vdmUgaXQgZnJv
bSBteSBiYWNrbG9nCndoZW4gaXQgd2FzIGFwcGxpZWQuCgoKRGFuaWVsLgoKCj4gCj4gPiA+IC0t
LQo+ID4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMgfCAxICsKPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jIGIvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcWNvbS13bGVkLmMKPiA+ID4gaW5kZXggM2JjNzgwMGViMGE5Li40OTdiOTAzNWE5MDgg
MTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jCj4g
PiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jCj4gPiA+IEBAIC0x
NzA0LDYgKzE3MDQsNyBAQCBzdGF0aWMgaW50IHdsZWRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gPiA+ICAKPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIHdsZWRfbWF0Y2hfdGFibGVbXSA9IHsKPiA+ID4gIAl7IC5jb21wYXRpYmxlID0gInFjb20s
cG04OTQxLXdsZWQiLCAuZGF0YSA9ICh2b2lkICopMyB9LAo+ID4gPiArCXsgLmNvbXBhdGlibGUg
PSAicWNvbSxwbWk4OTk0LXdsZWQiLCAuZGF0YSA9ICh2b2lkICopNCB9LAo+ID4gPiAgCXsgLmNv
bXBhdGlibGUgPSAicWNvbSxwbWk4OTk4LXdsZWQiLCAuZGF0YSA9ICh2b2lkICopNCB9LAo+ID4g
PiAgCXsgLmNvbXBhdGlibGUgPSAicWNvbSxwbTY2MGwtd2xlZCIsIC5kYXRhID0gKHZvaWQgKik0
IH0sCj4gPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJxY29tLHBtODE1MGwtd2xlZCIsIC5kYXRhID0g
KHZvaWQgKik1IH0sCj4gCj4gLS0gCj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dCj4gU2VuaW9yIFRl
Y2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCj4gTGluYXJvLm9yZyDilIIgT3BlbiBz
b3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCj4gRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
