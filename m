Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6611E13A6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3046E991;
	Wed, 23 Oct 2019 08:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D54C6E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 11:47:01 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id w67so8570710qkb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 04:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ZsrVaR6vc/qnzUA4wVz/77TV1vtgZkJHUiseGtW32fE=;
 b=ihxDgUlTg9pWSchU2Ihh91vjK+QcaVybFeDQCB69/VuRf1j8j6IsBFkGDYNy/qdeuS
 F5F/n2DsVMKuHn/9mALo+k9d/Lr9nwYWyJj0UQMmsQjU4k/DRXrnLg7WfehEHMZ8hxfk
 4wMyFPEzvQ3ra0KL5VoZ+BN5WJhi3qysH4k2T+cuLVoicaRufXdxdfmRzkx7DWBOdevm
 vGIUjZmiv6+ySPeS6tQ1PArE07iExMPtCApopPo07Za6QwFAgy426Bj/CqH2xB1973/d
 OlNKr8ZMAAwQqQ/DpgqJmvgDMrSrJXY9oJAUS14Bdvq5kX+u0lbhwk9Ye2f8VekWs5Kl
 n3eA==
X-Gm-Message-State: APjAAAXie7ZlQsiLqMMthF3Epk/5GIVurau2nUYdDFwM9Kl3/xhkhwvf
 zsG4OqY2zBXxQmiOIutzqyIp6kcewNTN
X-Google-Smtp-Source: APXvYqwP2XO0+wPKaNKqstjcgNhdUynq5gHMc5aDViFMW7a988Y2xcf+1D8ZFjFrBT2cjoj1ZcA528RiWWjN
X-Received: by 2002:a37:8dc6:: with SMTP id p189mr2474821qkd.132.1571744819983; 
 Tue, 22 Oct 2019 04:46:59 -0700 (PDT)
Date: Tue, 22 Oct 2019 19:45:02 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.3.I37696eb1321a21846f9e5a9eb14dfac7dbe10663@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 3/6] ASoC: dt-bindings: mt8183: add a property "mediatek,
 hdmi-codec"
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=ZsrVaR6vc/qnzUA4wVz/77TV1vtgZkJHUiseGtW32fE=;
 b=rWB904Gcs2qVJZUdeAyoeepfzKedgnQjJZ4jfO3wA6WjqYb2giKU5Pzx6ySfLtL2A0
 C6G6kK2HU9Bq/aW8NNHtf4gVgn+a7FpdApE4JmhpKiKxDBdyJd5ELjOwCOUHnqAEC6ju
 p9UzXTH32R+O8Ob6C2dZTmDtGa3SCOUtc35f7m5G7APRhN3dqXcFTbK7RaQizelauCeW
 iMcqQAFx9SxO10nufCXxuspyLOK8zXPgo1FF7o2TKgZuNIcuq0cEjSqoZFlV/sw3o0ES
 qitFE0wo1hMeoSthzVhddP3lGNji2i8tKc+iG/apvGVcxGXfpqXwlRRIQTE4qIxwHAd6
 DFEQ==
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, jonas@kwiboo.se, allen.chen@ite.com.tw,
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, tzungbi@google.com, dgreid@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGFuIG9wdGlvbmFsIHByb3BlcnR5ICJtZWRpYXRlayxoZG1pLWNvZGVjIi4KClNpZ25lZC1v
ZmYtYnk6IFR6dW5nLUJpIFNoaWggPHR6dW5nYmlAZ29vZ2xlLmNvbT4KLS0tCiAuLi4vYmluZGlu
Z3Mvc291bmQvbXQ4MTgzLW10NjM1OC10czNhMjI3LW1heDk4MzU3LnR4dCAgICAgICAgICAgfCAy
ICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE4My1tdDYzNTgtdHMzYTIyNy1t
YXg5ODM1Ny50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4
MTgzLW10NjM1OC10czNhMjI3LW1heDk4MzU3LnR4dAppbmRleCBkZWNhYTAxM2EwN2UuLmNjMjg0
NTI4N2U2MSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
dW5kL210ODE4My1tdDYzNTgtdHMzYTIyNy1tYXg5ODM1Ny50eHQKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE4My1tdDYzNTgtdHMzYTIyNy1tYXg5ODM1
Ny50eHQKQEAgLTgsNiArOCw3IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6CiAtIG1lZGlhdGVrLGhl
YWRzZXQtY29kZWM6IHRoZSBwaGFuZGxlcyBvZiB0czNhMjI3IGNvZGVjcwogLSBtZWRpYXRlayxl
Yy1jb2RlYzogdGhlIHBoYW5kbGUgb2YgRUMgY29kZWNzLgogICAgICAgICAgICAgICAgICAgICAg
U2VlIGdvb2dsZSxjcm9zLWVjLWNvZGVjLnR4dCBmb3IgbW9yZSBkZXRhaWxzLgorLSBtZWRpYXRl
ayxoZG1pLWNvZGVjOiB0aGUgcGhhbmRsZXMgb2YgSERNSSBjb2RlYwogCiBFeGFtcGxlOgogCkBA
IC0xNSw2ICsxNiw3IEBAIEV4YW1wbGU6CiAJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgz
X210NjM1OF90czNhMjI3X21heDk4MzU3IjsKIAkJbWVkaWF0ZWssaGVhZHNldC1jb2RlYyA9IDwm
dHMzYTIyNz47CiAJCW1lZGlhdGVrLGVjLWNvZGVjID0gPCZlY19jb2RlYz47CisJCW1lZGlhdGVr
LGhkbWktY29kZWMgPSA8Jml0NjUwNWRwdHg+OwogCQltZWRpYXRlayxwbGF0Zm9ybSA9IDwmYWZl
PjsKIAl9OwogCi0tIAoyLjIzLjAuODY2LmdiODY5Yjk4ZDRjLWdvb2cKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
