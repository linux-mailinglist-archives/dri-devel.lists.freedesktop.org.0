Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8F5316AD0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 17:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586726ECA6;
	Wed, 10 Feb 2021 16:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441756ECA6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 16:13:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id m1so2300741wml.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 08:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9EqkICeAqFea9hutcJE8LTJk6fkCLGfHmOvQQmMvAJM=;
 b=Hh49I+GceO/gmkekotuymhn3rjlU3YIypVisjoLOygTP1mgYBpzmbiY1B+Z5kDHv1H
 X+1p+H/pZbOPlldO65mL33J/nmB6ms47MC+u60d9S34oT4MiRfwDpZZWh/qETmt/Om/y
 olUsvQGKt/zp/HREvWDezf3EVhY9WQSBDq//vrYo+RtlXuw1teA/flfEzF4rT2UCYUo6
 WEyPCuv9rP7JAXB7hd4Zk5CXQfiPo2bj7YDV4C/V4SfKbO6gG7O8nWSxiVamK32i6r03
 Vi1DcAM4Whf1JnAWKjVWawTmQnF73oyA7TPneeQ1mIDpdIwY/evQfcTuEdgRAkLg3tZr
 f/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9EqkICeAqFea9hutcJE8LTJk6fkCLGfHmOvQQmMvAJM=;
 b=JCtezT0WGD6BlBnFRtO+y4yMF0PRm1BN37KOI/caG9Qk3NbMOYevWpd8s4t716RC8Y
 NMwe24WhQsIIGx8j/kUFU1kn3bU4cvMIV9j0YjZvxKlkNf8BnN+n6RzQQPD4+smLVmXu
 Y1MMQhWchP2lu8ai+hTvNcrXuDevRR/yJOwmcNpP3metEmSEw/27wRbAYJ5W9z3eIreP
 AVwTwXxFPKEKg65F99bDF01TJleNfFmAT4YR/hdO5J71MDmlyUoI9YZdTeKMlxat5TaO
 LzacQEEQNPjYBmtz6lp1VGeBrLCxL5bm488taGiL/pYzLXSlKj30ugvmhmq3xC6brN2b
 n6fA==
X-Gm-Message-State: AOAM530xSQGhtZ3ih/URHGXQpmkCRBLPU6WtH2mB5Ehb5KUminCyyYA/
 O/jdnMnl8tIV6ggKKcpmqan3ZmL/qyk4gA==
X-Google-Smtp-Source: ABdhPJxwjN9tnOjYE29ii/KagRZk+egL7JyD+GF9hT3oJWkCY7DOqROK+nqMjm3eItHTGs95G9LYOA==
X-Received: by 2002:a05:600c:216:: with SMTP id
 22mr3432179wmi.111.1612973581930; 
 Wed, 10 Feb 2021 08:13:01 -0800 (PST)
Received: from x1 ([91.110.221.237])
 by smtp.gmail.com with ESMTPSA id x9sm3275333wmb.14.2021.02.10.08.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:13:00 -0800 (PST)
Date: Wed, 10 Feb 2021 16:12:58 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Julia Lawall <Julia.Lawall@inria.fr>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] video: use getter/setter functions
Message-ID: <20210210161258.GA124276@x1>
References: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
 <20210210082341.GH220368@dell>
 <YCPbxSHWMipTz+mB@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCPbxSHWMipTz+mB@phenom.ffwll.local>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMCBGZWIgMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gV2VkLCBGZWIg
MTAsIDIwMjEgYXQgMDg6MjM6NDFBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gVHVl
LCAwOSBGZWIgMjAyMSwgSnVsaWEgTGF3YWxsIHdyb3RlOgo+ID4gCj4gPiA+IFVzZSBnZXR0ZXIg
YW5kIHNldHRlciBmdW5jdGlvbnMsIGZvciBwbGF0Zm9ybV9kZXZpY2Ugc3RydWN0dXJlcyBhbmQg
YQo+ID4gPiBzcGlfZGV2aWNlIHN0cnVjdHVyZS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEp1bGlhIExhd2FsbCA8SnVsaWEuTGF3YWxsQGlucmlhLmZyPgo+ID4gPiAKPiA+ID4gLS0tCj4g
PiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgIDIgKy0KPiA+IAo+ID4gVGhpcyBwYXRjaCBpcyBmaW5lLgo+
ID4gCj4gPiBDb3VsZCB5b3UgcGxlYXNlIHNwbGl0IGl0IG91dCBhbmQgc3VibWl0IGl0IHNlcGFy
YXRlbHkgdGhvdWdoIHBsZWFzZS4KPiAKPiBPciBqdXN0IGFwcGx5IHRoZSBlbnRpcmUgcGF0Y2gg
dGhyb3VnaCBiYWNrbGlnaHQgdHJlZSwgdGhlcmUncyBub3RoaW5nCj4gZ29pbmcgb24gaW4gZmJk
ZXYgYW55d2F5IEkgdGhpbmsuCj4gCj4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+CgpJIGNhbiBkbyB0aGF0LiAgSXMgdGhhdCBhbiBmYmRldiBBY2s/Cgo+
ID4gPiAgZHJpdmVycy92aWRlby9mYmRldi9hbWlmYi5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICA0ICsrLS0KPiA+ID4gIGRyaXZlcnMvdmlkZW8vZmJkZXYv
ZGE4eHgtZmIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNCAr
Ky0tCj4gPiA+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2lteGZiLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKy0KPiA+ID4gIGRyaXZlcnMvdmlkZW8vZmJk
ZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL3BhbmVsLWxncGhpbGlwcy1sYjAzNXEwMi5jIHwgICAg
NiArKystLS0KPiA+ID4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy9kcGku
YyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNCArKy0tCj4gPiA+ICBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvZHNpLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgIDQgKystLQo+ID4gPiAgZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZHNz
L2hkbWk0LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAyICstCj4gPiA+ICBkcml2ZXJz
L3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvaGRtaTUuYyAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgIDIgKy0KPiA+ID4gIGRyaXZlcnMvdmlkZW8vZmJkZXYveGlsaW54ZmIuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQo+ID4gPiAgMTAgZmls
ZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gPiAKPiA+IC4u
Ll0KPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13
bGVkLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYwo+ID4gPiBpbmRleCAz
YmM3ODAwZWIwYTkuLjA5MWYwN2U3YzE0NSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvcWNvbS13bGVkLmMKPiA+ID4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcWNvbS13bGVkLmMKPiA+ID4gQEAgLTE2OTIsNyArMTY5Miw3IEBAIHN0YXRpYyBpbnQgd2xl
ZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiAgCj4gPiA+ICBzdGF0
aWMgaW50IHdsZWRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ICB7
Cj4gPiA+IC0Jc3RydWN0IHdsZWQgKndsZWQgPSBkZXZfZ2V0X2RydmRhdGEoJnBkZXYtPmRldik7
Cj4gPiA+ICsJc3RydWN0IHdsZWQgKndsZWQgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsK
PiA+ID4gIAo+ID4gPiAgCW11dGV4X2Rlc3Ryb3koJndsZWQtPmxvY2spOwo+ID4gPiAgCWNhbmNl
bF9kZWxheWVkX3dvcmtfc3luYygmd2xlZC0+b3ZwX3dvcmspOwo+ID4gCj4gPiBGb3IgbXkgb3du
IHJlZmVyZW5jZSAoYXBwbHkgdGhpcyBhcy1pcyB0byB5b3VyIHNpZ24tb2ZmIGJsb2NrKToKPiA+
IAo+ID4gICBBY2tlZC1mb3ItQmFja2xpZ2h0LWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgo+ID4gCj4gCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmlj
YWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBz
b2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwg
QmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
