Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD475120F4B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84956E7FA;
	Mon, 16 Dec 2019 16:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38A56E7FA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:24:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m24so6014546wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=llbkzlKSPIxwUXHWHgtqCw4kPqPvje1n5crDMdl/6tU=;
 b=qyo3qjQ6M9XGQSxgffMeMJUKMr8fujgew/LhXKhz2wdQG0sirrHw705Vp5FMH1Gene
 AMpppauj9lm4EqTDVn5sKT7re72xJWRtemS3Ltbdl3KKiwbH0Xkd3dsfBeRSKdipx15B
 v4ARdMaqDVZlhL5xZTWtjqai9RjyEcvFQxSH2ukyT3mL0wKR5DuvzB1joAD+IfnOldTa
 3VrfnJT4ZkiCVHcrPRubHViFym19DaqlL9/pC9tZlmp8/OAbVjcVZjPDw1EGSUydpQmX
 vwxiQxpufqd46BDsGnYd+x9cvJVZhd2IGq3ftVPSY6dmRrMWIrj494qqGVfYJqCw1Q33
 Us9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=llbkzlKSPIxwUXHWHgtqCw4kPqPvje1n5crDMdl/6tU=;
 b=ktQeWwbnKxdqIHBNjJA1ja/HBLZA2mwZjdouG+TjPaHhwfRQDFCwnR5XKpYOOuUMy2
 2zOQxyWPyKUmGd5lUGShqkCvoOKyQZpSVdI/TTbDKGEMXQMgbR/rPH5Oi+E+uWrNRuCt
 8WQ0MRCt/s6wPLE8fRvTJ7N6gOKzhjHuzqRyE5FzbyKdauR3tJSqL13QPK2+z5uYER3k
 uofS8GQ+hIz2wo0iMIVM5SRpKzmsAw4jmDGlMcqAaXghCb6i6dM+CG6drZRoWLxWVvg9
 fEhQuPydYroGXfLZ7lgePyEu7u8WyQgF3Cu5k0g+VOYp9biwVRpKXtebqqAcgUCdbJRj
 L1Cg==
X-Gm-Message-State: APjAAAVyd9g1g2PLeIPtqaMMQRduuJDSJ28o5Ud4d94qZK8w3JJTIN8m
 yHx5xZNNMNwEyoWoU+b2hEZCZQ==
X-Google-Smtp-Source: APXvYqw/af4JJwzf37BYYywEn5ThaK6uC1VvISuGJMJj+/VkvCJB0tA9xjXtKQNDvnU5wA80dfkrJw==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr31241155wml.3.1576513447276;
 Mon, 16 Dec 2019 08:24:07 -0800 (PST)
Received: from dell ([185.17.149.202])
 by smtp.gmail.com with ESMTPSA id h8sm23512856wrx.63.2019.12.16.08.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 08:24:06 -0800 (PST)
Date: Mon, 16 Dec 2019 16:24:06 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 4/6] mfd: atmel-hlcdc: return in case of error
Message-ID: <20191216162406.GQ2369@dell>
References: <1576249496-4849-1-git-send-email-claudiu.beznea@microchip.com>
 <1576249496-4849-5-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576249496-4849-5-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org, airlied@linux.ie,
 nicolas.ferre@microchip.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com,
 sam@ravnborg.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMyBEZWMgMjAxOSwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6Cgo+IEZvciBITENEQyB0
aW1pbmcgZW5naW5lIGNvbmZpZ3VyYXRpb25zIGJpdCBBVE1FTF9ITENEQ19TSVAgb2YKPiBBVE1F
TF9ITENEQ19TUiBuZWVkcyB0byBiZSBwb2xsZWQgYmVmb3JlIGFwcGx5aW5nIG5ldyBjb25maWcu
IEluIGNhc2Ugb2YKPiB0aW1lb3V0IHRoZXJlIGlzIG5vIGluZGljYXRvciBhYm91dCB0aGlzLCBz
bywgcmV0dXJuIGluIGNhc2Ugb2YgdGltZW91dAo+IGFuZCBhbHNvIHByaW50IGEgbWVzc2FnZSBh
Ym91dCB0aGlzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJl
em5lYUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9hdG1lbC1obGNkYy5jIHwg
MTUgKysrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9hdG1lbC1obGNkYy5j
IGIvZHJpdmVycy9tZmQvYXRtZWwtaGxjZGMuYwo+IGluZGV4IDkyYmZjYWE2MmFjZS4uYTFlNDZj
ODdiOTU2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL2F0bWVsLWhsY2RjLmMKPiArKysgYi9k
cml2ZXJzL21mZC9hdG1lbC1obGNkYy5jCj4gQEAgLTQwLDEwICs0MCwxNyBAQCBzdGF0aWMgaW50
IHJlZ21hcF9hdG1lbF9obGNkY19yZWdfd3JpdGUodm9pZCAqY29udGV4dCwgdW5zaWduZWQgaW50
IHJlZywKPiAgCj4gIAlpZiAocmVnIDw9IEFUTUVMX0hMQ0RDX0RJUykgewo+ICAJCXUzMiBzdGF0
dXM7Cj4gLQo+IC0JCXJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMoaHJlZ21hcC0+cmVncyArIEFU
TUVMX0hMQ0RDX1NSLAo+IC0JCQkJCSAgc3RhdHVzLCAhKHN0YXR1cyAmIEFUTUVMX0hMQ0RDX1NJ
UCksCj4gLQkJCQkJICAxLCAxMDApOwo+ICsJCWludCByZXQ7Cj4gKwo+ICsJCXJldCA9IHJlYWRs
X3BvbGxfdGltZW91dF9hdG9taWMoaHJlZ21hcC0+cmVncyArIEFUTUVMX0hMQ0RDX1NSLAo+ICsJ
CQkJCQlzdGF0dXMsCj4gKwkJCQkJCSEoc3RhdHVzICYgQVRNRUxfSExDRENfU0lQKSwKPiArCQkJ
CQkJMSwgMTAwKTsKPiArCQlpZiAocmV0KSB7Cj4gKwkJCWRldl9lcnIoaHJlZ21hcC0+ZGV2LAo+
ICsJCQkJIlRpbWVvdXQgd2FpdGluZyBmb3IgQVRNRUxfSExDRENfU0lQXG4iKTsKCk5pdDogSnVz
dCBpbiBjYXNlIHlvdSBoYXZlIHRvIHJld29yayB0aGlzLCBwbGFjaW5nIHJlZ2lzdGVyIG5hbWVz
IGluCnRoZSBrZXJuZWwgbG9nIGlzbid0IHVzdWFsbHkgaGVscGZ1bC4gIENhbiB5b3Ugc3dhcCBp
dCBvdXQgZm9yIGEgbW9yZQp1c2VyIGZyaWVuZGx5IG1lc3NhZ2U/CgoiVGltZWQgb3V0IHdhaXRp
bmcgZm9yIC4uLiIKCi4uLiBYIHN0YXR1cwouLi4gWSB0byB1cGRhdGUKLi4uIHNldHRpbmcgWiBj
b25maWd1cmF0aW9uCgpFdGMuCgo+ICsJCQlyZXR1cm4gcmV0Owo+ICsJCX0KPiAgCX0KPiAgCj4g
IAl3cml0ZWwodmFsLCBocmVnbWFwLT5yZWdzICsgcmVnKTsKCi0tIApMZWUgSm9uZXMgW+adjueQ
vOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
