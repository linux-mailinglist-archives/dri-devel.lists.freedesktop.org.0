Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5843160DC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 09:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184CE6E99B;
	Wed, 10 Feb 2021 08:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3D76E99B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 08:23:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id g10so1481809wrx.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 00:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MJzRoK5AHHgr8V25vpyceNTWmZxiFyKsyjhqQm8Vxxc=;
 b=d/b3ponHrtEaGh9+nR4CHVGjqOHtnpraE5raOOOMutWd3Y/vW/uw1i/PmwjfcCAOlI
 hSBPogoT7cAULj0g3PmoKbO+SoDAWMPSOECHnT1Hf4DW/HG3NgCZs5Oz4yycpbsGpbXz
 6aDc3GNQtnk1ZzXHSwQCVv4LOVj0FL2tcZrnkEKPH22CeUw6azGEwO6gqPhOeo/UTzC8
 CAGMYMu0CibvYCRJgy2fuPg3TqVZbhGt5gHufNtUof0Gw0FDR3KgWX5KWtTvRU2bJCB3
 6J8LXoac3H1R5/6ZWZ8wIHim0sOUZG312tHezmcG2vA/YZDFQNq2NLrC7BlZj/TPwF8d
 LG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MJzRoK5AHHgr8V25vpyceNTWmZxiFyKsyjhqQm8Vxxc=;
 b=LXqHDxguHICpr9CQSzOlw3iiWmlWlprRy3yBp6mbkQcgkJ1gAVSMEy3mETfhAsgWT9
 qrXhLGgnU/xh5yYz/a7ogeoCqC9JDSZ7l5HzS+0ZFqSKSEuFyzYb4K1ZGu83uP/S0v0J
 0+CMOuobNhr6VqTdLK6y6xdLAu30FzXxXB8KsKLMm15GqEij7Yf7HrW4Ew8LcP+OwpAU
 jaQjwBmSO8L17jmBUXTkagZwuEQgtzbNMkf2aRqTHxcDsWL2zU8LnA4I7NvXzyY21B2b
 EZsQSfX108Hfu5oieYWVa0v0PkJRU3IOIwAgRZ52wwEgVk+vUqxrEUqIQSZ5u2gwMM+I
 5bpw==
X-Gm-Message-State: AOAM532xPqCRd/CjBco3FaGyBxaGX5btdfsdtuwa10Vc6Ah/+fGoD5d8
 FaUWkjf6gjFOthM8AO6nKjwhvg==
X-Google-Smtp-Source: ABdhPJzpmLKGtf/B7RhbJlQwrCAP0Mb8Tyioqci54O7y0v57o4U82PROFirmSWr5+lJk79X2A0kouQ==
X-Received: by 2002:a05:6000:2cf:: with SMTP id
 o15mr2236419wry.184.1612945423966; 
 Wed, 10 Feb 2021 00:23:43 -0800 (PST)
Received: from dell ([91.110.221.237])
 by smtp.gmail.com with ESMTPSA id h9sm1850897wrc.94.2021.02.10.00.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 00:23:43 -0800 (PST)
Date: Wed, 10 Feb 2021 08:23:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH] video: use getter/setter functions
Message-ID: <20210210082341.GH220368@dell>
References: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwOSBGZWIgMjAyMSwgSnVsaWEgTGF3YWxsIHdyb3RlOgoKPiBVc2UgZ2V0dGVyIGFu
ZCBzZXR0ZXIgZnVuY3Rpb25zLCBmb3IgcGxhdGZvcm1fZGV2aWNlIHN0cnVjdHVyZXMgYW5kIGEK
PiBzcGlfZGV2aWNlIHN0cnVjdHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpYSBMYXdhbGwg
PEp1bGlhLkxhd2FsbEBpbnJpYS5mcj4KPiAKPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcWNvbS13bGVkLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAyICst
CgpUaGlzIHBhdGNoIGlzIGZpbmUuCgpDb3VsZCB5b3UgcGxlYXNlIHNwbGl0IGl0IG91dCBhbmQg
c3VibWl0IGl0IHNlcGFyYXRlbHkgdGhvdWdoIHBsZWFzZS4KCj4gIGRyaXZlcnMvdmlkZW8vZmJk
ZXYvYW1pZmIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAg
NCArKy0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvZGE4eHgtZmIuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgNCArKy0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYv
aW14ZmIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiAr
LQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC1sZ3Bo
aWxpcHMtbGIwMzVxMDIuYyB8ICAgIDYgKysrLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21h
cDIvb21hcGZiL2Rzcy9kcGkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNCArKy0t
Cj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy9kc2kuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgNCArKy0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIv
b21hcGZiL2Rzcy9oZG1pNC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQo+ICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvaGRtaTUuYyAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgIDIgKy0KPiAgZHJpdmVycy92aWRlby9mYmRldi94aWxpbnhmYi5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAyICstCj4gIDEwIGZpbGVz
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKLi4uXQoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMgYi9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYwo+IGluZGV4IDNiYzc4MDBlYjBhOS4uMDkxZjA3ZTdj
MTQ1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jCj4g
KysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKPiBAQCAtMTY5Miw3ICsx
NjkyLDcgQEAgc3RhdGljIGludCB3bGVkX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gIAo+ICBzdGF0aWMgaW50IHdsZWRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gIHsKPiAtCXN0cnVjdCB3bGVkICp3bGVkID0gZGV2X2dldF9kcnZkYXRhKCZwZGV2
LT5kZXYpOwo+ICsJc3RydWN0IHdsZWQgKndsZWQgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2
KTsKPiAgCj4gIAltdXRleF9kZXN0cm95KCZ3bGVkLT5sb2NrKTsKPiAgCWNhbmNlbF9kZWxheWVk
X3dvcmtfc3luYygmd2xlZC0+b3ZwX3dvcmspOwoKRm9yIG15IG93biByZWZlcmVuY2UgKGFwcGx5
IHRoaXMgYXMtaXMgdG8geW91ciBzaWduLW9mZiBibG9jayk6CgogIEFja2VkLWZvci1CYWNrbGln
aHQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvm
nY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5h
cm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFy
bzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
