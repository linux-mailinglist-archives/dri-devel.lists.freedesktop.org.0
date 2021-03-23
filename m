Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE423459EC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 09:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132538931F;
	Tue, 23 Mar 2021 08:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3858931F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:39:39 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ce10so25687869ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vOdKWnp3rkpIGMt87ZNlf2cZf53/gDQXm8BtihNuwrY=;
 b=awC7OJCja/vDjs8UM3Q2cV7cH4nuw99ReUsihpNF+0rbb/GYsXuZl+yoz8gQu8xn4B
 hTALcZCKLmRhR6rGBx5oe19l9xnWJ31Ch53+rY2CpZSSvH55LYyJp+91113PSVJNIS00
 yFWPcW99/D9lZFnQZlpOHcfmEI5dxY6BBarjNauuYBRpKnAvbIeobKullrS6/F+GabEX
 RLIqR2rCthAonYJaBQByTJodXq+ZjqYwTvE5UiCKMUxKQmKPupfoBqFqkV0eDKW7SzPm
 0+ul8XGZKTS40YtkXqZCXjiN7E6EnNaZwrf+8JXCI2s9pdm7CQckxordKve2k8LhNwLb
 jcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vOdKWnp3rkpIGMt87ZNlf2cZf53/gDQXm8BtihNuwrY=;
 b=hXzKeF4D5JOuJ8vbekcop1K13W1baRRO1hEJGd7y9fHrRHEI1LxrV3MnWvoKXUs7uO
 axV9j1s8BgKz4+0gJrZevmYg5TV+UqJYAXEpE+224mLzdcMOBSkjLTkzRxNEZzp3tVPV
 DOlCNVmWvJmM8Hxja1h/pqyCQNb1z1o6ItbGYIQWAAxCDSrgdGxZ0uWv2Fhg6VpfROh/
 0vzRcZr6XY2RvpqFIGecqBhjuzB/qrdWq7dQH41dY7cLgr/oiseslLuEwEJXYoCNhheD
 FtY81PyVYFNlG3pAYmWaAowtlrBzOUBuPO5f0QwtHigZvwMRfN8f89vdy6YzEu7Z88RO
 Pfqw==
X-Gm-Message-State: AOAM530iDmbjU7fpGReBwWXVHsy6yGscsLsSqHckNQmstPPv2vhc4SET
 /vft+6cAO7iQ0X2axUce+6+pgg==
X-Google-Smtp-Source: ABdhPJztz2rpnHmS0vjtxAqb+sjwT+S9UIOX/8oNcIG+D+p3IjWse50o3nha+gQW7cNBnqWhjOEJGw==
X-Received: by 2002:a17:906:d153:: with SMTP id
 br19mr3749846ejb.360.1616488777820; 
 Tue, 23 Mar 2021 01:39:37 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id h13sm12649939edz.71.2021.03.23.01.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 01:39:37 -0700 (PDT)
Date: Tue, 23 Mar 2021 08:39:35 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Message-ID: <20210323083935.GF2916463@dell>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
 <20210322161810.biagj2qro66rv4gt@maple.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322161810.biagj2qro66rv4gt@maple.lan>
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

T24gTW9uLCAyMiBNYXIgMjAyMSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBTdW4sIEZl
YiAyOCwgMjAyMSBhdCAwMTo0MTowNVBNICswMTAwLCBLb25yYWQgRHliY2lvIHdyb3RlOgo+ID4g
QWRkIGEgY29tcGF0aWJsZSBmb3IgUE1JODk5NCBXTEVELiBJdCB1c2VzIHRoZSBWNCBvZiBXTEVE
IElQLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lv
QHNvbWFpbmxpbmUub3JnPgo+IAo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmll
bC50aG9tcHNvbkBsaW5hcm8ub3JnPgoKV2h5IGFyZSB5b3UgUmV2aWV3aW5nL0Fja2luZyBhIHBh
dGNoIHRoYXQgd2FzIGFwcGxpZWQgb24gdGhlIDEwdGg/Cgo+ID4gLS0tCj4gPiAgZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L3Fjb20td2xlZC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKPiA+IGlu
ZGV4IDNiYzc4MDBlYjBhOS4uNDk3YjkwMzVhOTA4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L3Fjb20td2xlZC5jCj4gPiBAQCAtMTcwNCw2ICsxNzA0LDcgQEAgc3RhdGljIGludCB3bGVk
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gIAo+ID4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHdsZWRfbWF0Y2hfdGFibGVbXSA9IHsKPiA+ICAJeyAu
Y29tcGF0aWJsZSA9ICJxY29tLHBtODk0MS13bGVkIiwgLmRhdGEgPSAodm9pZCAqKTMgfSwKPiA+
ICsJeyAuY29tcGF0aWJsZSA9ICJxY29tLHBtaTg5OTQtd2xlZCIsIC5kYXRhID0gKHZvaWQgKik0
IH0sCj4gPiAgCXsgLmNvbXBhdGlibGUgPSAicWNvbSxwbWk4OTk4LXdsZWQiLCAuZGF0YSA9ICh2
b2lkICopNCB9LAo+ID4gIAl7IC5jb21wYXRpYmxlID0gInFjb20scG02NjBsLXdsZWQiLCAuZGF0
YSA9ICh2b2lkICopNCB9LAo+ID4gIAl7IC5jb21wYXRpYmxlID0gInFjb20scG04MTUwbC13bGVk
IiwgLmRhdGEgPSAodm9pZCAqKTUgfSwKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9y
IFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
