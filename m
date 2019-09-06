Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE70AC23A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 23:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB54D6E14C;
	Fri,  6 Sep 2019 21:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B97C6E14B;
 Fri,  6 Sep 2019 21:51:04 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id b13so5435072pfo.8;
 Fri, 06 Sep 2019 14:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eDpX53pV2w3525Sfc++y574jdtjcTxKRU6k4wrPYJJE=;
 b=Hrr6kvNWy+Rx40ms/n4fJl2WUwQSmOgbl9EekvBoe10KCg+j570BKYq4qLr3/PN0NK
 bJRTsHFnaj0YG3Wcd78wgHFhTioxgXLWLydWL2+558b2EpuaGADFU5epqOLCxCjv/4dW
 XequW8Q6oZGrkzBJRDLzWs+xVGT9JdWWUrScIkGXr5hjcc7p7TlWdIcVrp5ubEP7HBNM
 pw33+umyi6QvOPoO4J42HtO3Ak45czzV2lC/rwuCALQ3obawxyt+xm9MND7khSpVS8As
 gLmZ9EsEBNwIQJX4rAbQsUJvNNob89cpVXAg7aB3zyG7gMVv6YZU1WrT4kx/HZoDpE5l
 HfAQ==
X-Gm-Message-State: APjAAAVx1la9i9TEzQm3H3FTdfe+JkxATt1nvMJsywfbVxw1qiywmpm6
 bDzCFu7OPhi5iTc4lQoySZ0=
X-Google-Smtp-Source: APXvYqxxmn9ULbrQFMLJEtMySO7JBNQkpSXC7k9Y2QPcQyK5SFcavLc7RGYi6hNSQ6p9Iz352cwvcQ==
X-Received: by 2002:a63:484d:: with SMTP id x13mr9803253pgk.122.1567806663646; 
 Fri, 06 Sep 2019 14:51:03 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id g14sm6823936pfo.133.2019.09.06.14.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 14:51:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 2/2] drm/msm: mark devices where iommu is managed by driver
Date: Fri,  6 Sep 2019 14:44:02 -0700
Message-Id: <20190906214409.26677-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190906214409.26677-1-robdclark@gmail.com>
References: <20190906214409.26677-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eDpX53pV2w3525Sfc++y574jdtjcTxKRU6k4wrPYJJE=;
 b=R7tJANYP9RC8vMxjaiQJQysGREeC4SukBKwQay9FF+AMJE+MvsYVBFrsati6KaggWM
 VWkpRA7WPb67hbvt9c4rmHWNClvfUZwODODfoY+fH9crahdylzEddDD/2NidH2MKqLAp
 Iapm/hiz0A2mDeZEclyVm+SdU1bJGoc8FP6NklRbcl5IksRx0lwTVYI5cealjOhS7XYM
 gitoGxs4V3Z1Ekpym5seReRqr8Hs7DrGi6GbW553Hr4d3wKFAx1oTU7V3ez1y5WfY1gc
 2nf2SwaiX5AwY5cE+npxZbJaQLMTapIZxsY6RSypeBRKrquK9OECMgG8670DMSeZaHyp
 Vsrw==
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bruce Wang <bzwang@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Boris Brezillon <bbrezillon@kernel.org>, Enrico Weigelt <info@metux.net>,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2FkcmVub19kZXZpY2UuYyB8IDEgKwogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2ttcy5jICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9t
ZHA1X2ttcy5jICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jICAgICAgICAg
ICAgICB8IDEgKwogNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2aWNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2aWNlLmMKaW5kZXggN2Y3NTBhOTUxMGE1Li4xOWYy
YmQyZDZjYjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19k
ZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2aWNlLmMK
QEAgLTQ1Miw2ICs0NTIsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhZHJlbm9f
ZHJpdmVyID0gewogCQkubmFtZSA9ICJhZHJlbm8iLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBkdF9t
YXRjaCwKIAkJLnBtID0gJmFkcmVub19wbV9vcHMsCisJCS5kcml2ZXJfbWFuYWdlc19pb21tdSA9
IHRydWUsCiAJfSwKIH07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwpp
bmRleCA1NzUxODE1YTI2ZDcuLmRlYzhjYzZiNjRkYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9rbXMuYwpAQCAtMTA5NCw2ICsxMDk0LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgZHB1X2RyaXZlciA9IHsKIAkJLm5hbWUgPSAibXNtX2RwdSIsCiAJCS5vZl9t
YXRjaF90YWJsZSA9IGRwdV9kdF9tYXRjaCwKIAkJLnBtID0gJmRwdV9wbV9vcHMsCisJCS5kcml2
ZXJfbWFuYWdlc19pb21tdSA9IHRydWUsCiAJfSwKIH07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvbWRwNS9tZHA1X2ttcy5jCmluZGV4IGQ5M2RlM2E1NjliNC4uZWZmMWIwMDAyNThlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKQEAgLTExMzQsNiArMTEzNCw3
IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1kcDVfZHJpdmVyID0gewogCQkubmFt
ZSA9ICJtc21fbWRwIiwKIAkJLm9mX21hdGNoX3RhYmxlID0gbWRwNV9kdF9tYXRjaCwKIAkJLnBt
ID0gJm1kcDVfcG1fb3BzLAorCQkuZHJpdmVyX21hbmFnZXNfaW9tbXUgPSB0cnVlLAogCX0sCiB9
OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX2Rydi5jCmluZGV4IDNhNGZkMjBhMzNlOC4uMzM2YTZkMGE0Y2QzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9kcnYuYwpAQCAtMTM4OCw2ICsxMzg4LDcgQEAgc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgbXNtX3BsYXRmb3JtX2RyaXZlciA9IHsKIAkJLm5hbWUgICA9ICJtc20i
LAogCQkub2ZfbWF0Y2hfdGFibGUgPSBkdF9tYXRjaCwKIAkJLnBtICAgICA9ICZtc21fcG1fb3Bz
LAorCQkuZHJpdmVyX21hbmFnZXNfaW9tbXUgPSB0cnVlLAogCX0sCiB9OwogCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
