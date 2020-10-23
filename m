Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4C1296E93
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0CE6E517;
	Fri, 23 Oct 2020 12:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8EF6E51B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e2so1302970wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+fkOMfIAhHnIvKJblgrObApVFyijBiqdZwYQpautVWE=;
 b=h2UcRa9UQoJClDthSwfwclF7bhL3oBVRME7c7/5zSRqhORAazkbgsGc4/vw6kIZtIK
 fhou2mbGdVANXK1CAFqIvL046sqBvxJGq5gDLkYCxZejl9o44OcJnB+RHw52tVnqbiHm
 JEDd6QHk5g7ytqeIZjF9fLUc3+7QOoDG7T1g8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+fkOMfIAhHnIvKJblgrObApVFyijBiqdZwYQpautVWE=;
 b=Dw+a+g4KrK7LTqMaCjxGz3ovBvqlaU1T5Udct+b+WIlN/LzibotKnXj8Od1obm+Yxe
 DhNXr2IJtg1wRh1Jt+YQ7Un/vbGKSCIEzHRH8aSANZ8ge0S811BDVdBYpAkvYBaFHhwl
 QYGZeXnLBJlKmrE31CGUVWI1D76hWhQtjhCBVkgL2iGo3Zim+SdMg+afwaFyvHK3h+2N
 nUuooiKO966KOIOyugVKnpOC3P6I27ZwQ7UGeqyLgTKlc8el3AQLydkqUufyck/rjLzs
 YZQQD/hlYK6UPxQfMFRMplxK7lgGOubbzquIeHAHp7bzSrQB5m8/MMAxMRAlzTEak6qu
 mAYg==
X-Gm-Message-State: AOAM5326qNxJaWahLEg5hBJF/mfj+upQfmNCWANN7Erem5kaY+7OKqcY
 pp1UpRGuXxziFuUkQmERJUTyI38n+UDQXH+/
X-Google-Smtp-Source: ABdhPJxH4xe48wzE/NSho9ypMHFrSsNZaDWF+abLcTHBzoHtv3gPf22+aRfQRDawp5z3s1pKd7nXCw==
X-Received: by 2002:a1c:4445:: with SMTP id r66mr2000497wma.140.1603455748879; 
 Fri, 23 Oct 2020 05:22:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:28 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/65] drm/vkms: Annotate vblank timer
Date: Fri, 23 Oct 2020 14:21:17 +0200
Message-Id: <20201023122216.2373294-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: linaro-mm-sig@lists.linaro.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, linux-rdma@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBuZWVkZWQgdG8gc2lnbmFsIHRoZSBmZW5jZXMgZnJvbSBwYWdlIGZsaXBzLCBhbm5v
dGF0ZSBpdAphY2NvcmRpbmdseS4gV2UgbmVlZCB0byBhbm5vdGF0ZSBlbnRpcmUgdGltZXIgY2Fs
bGJhY2sgc2luY2UgaWYgd2UgZ2V0CnN0dWNrIGFueXdoZXJlIGluIHRoZXJlLCB0aGVuIHRoZSB0
aW1lciBzdG9wcywgYW5kIGhlbmNlIGZlbmNlcyBzdG9wLgpKdXN0IGFubm90YXRpbmcgdGhlIHRv
cCBwYXJ0IHRoYXQgZG9lcyB0aGUgdmJsYW5rIGhhbmRsaW5nIGlzbid0CmVub3VnaC4KClRlc3Rl
ZC1ieTogTWVsaXNzYSBXZW4gPG1lbGlzc2Euc3J3QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IFJv
ZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgpDYzogbGludXgt
bWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcK
Q2M6IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwub3JnCkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogQ2hyaXMgV2ls
c29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWly
YW1lbG9AZ21haWwuY29tPgpDYzogSGFuZWVuIE1vaGFtbWVkIDxoYW1vaGFtbWVkLnNhQGdtYWls
LmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdmttcy92a21zX2NydGMuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dmttcy92a21zX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5jCmluZGV4
IGU0M2U0ZTFiMjY4YS4uODEyNGQ4ZjJlZTE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dmttcy92a21zX2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NydGMuYwpA
QCAtMSw1ICsxLDcgQEAKIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwogCisj
aW5jbHVkZSA8bGludXgvZG1hLWZlbmNlLmg+CisKICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pYy5o
PgogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1f
cHJvYmVfaGVscGVyLmg+CkBAIC0xNCw3ICsxNiw5IEBAIHN0YXRpYyBlbnVtIGhydGltZXJfcmVz
dGFydCB2a21zX3ZibGFua19zaW11bGF0ZShzdHJ1Y3QgaHJ0aW1lciAqdGltZXIpCiAJc3RydWN0
IGRybV9jcnRjICpjcnRjID0gJm91dHB1dC0+Y3J0YzsKIAlzdHJ1Y3Qgdmttc19jcnRjX3N0YXRl
ICpzdGF0ZTsKIAl1NjQgcmV0X292ZXJydW47Ci0JYm9vbCByZXQ7CisJYm9vbCByZXQsIGZlbmNl
X2Nvb2tpZTsKKworCWZlbmNlX2Nvb2tpZSA9IGRtYV9mZW5jZV9iZWdpbl9zaWduYWxsaW5nKCk7
CiAKIAlyZXRfb3ZlcnJ1biA9IGhydGltZXJfZm9yd2FyZF9ub3coJm91dHB1dC0+dmJsYW5rX2hy
dGltZXIsCiAJCQkJCSAgb3V0cHV0LT5wZXJpb2RfbnMpOwpAQCAtNDksNiArNTMsOCBAQCBzdGF0
aWMgZW51bSBocnRpbWVyX3Jlc3RhcnQgdmttc192Ymxhbmtfc2ltdWxhdGUoc3RydWN0IGhydGlt
ZXIgKnRpbWVyKQogCQkJRFJNX0RFQlVHX0RSSVZFUigiQ29tcG9zZXIgd29ya2VyIGFscmVhZHkg
cXVldWVkXG4iKTsKIAl9CiAKKwlkbWFfZmVuY2VfZW5kX3NpZ25hbGxpbmcoZmVuY2VfY29va2ll
KTsKKwogCXJldHVybiBIUlRJTUVSX1JFU1RBUlQ7CiB9CiAKLS0gCjIuMjguMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
