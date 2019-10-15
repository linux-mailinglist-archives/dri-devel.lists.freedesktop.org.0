Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02BBD7796
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 15:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05745899DC;
	Tue, 15 Oct 2019 13:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C366E286;
 Tue, 15 Oct 2019 13:40:16 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id q203so19182411qke.1;
 Tue, 15 Oct 2019 06:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Fcph1pgTeMjmsVZh23+/8jjHWKO/soaKXMJcvGvjZOo=;
 b=sqwRDpb+KqCxF3GGfnVSTGXKvzKoeaFCazzy9GWwNp6xelTW2BPnTYAwVrhVTuUMAE
 V+4r51kZEiY8+v8p3ji2oYnphXR0rDvR/9wFI10DPZcMJtECQ+iKluVmxMSwD8FPuSmn
 VlzKcz/a+QwV8EW7z96zyG3DSWkoaGJ+oovpLmg++jcLvUju/Tc1k849BRY29VcxZvZr
 x4PveOFMov4+HFaCaxc0dCT5OT5qBcACq9n/lzdJelBCU//FcLUdYNPeHjVwkWJrh/mh
 k4Yl+GEx8qgBsaBN3KN1Y8GQcF0pYu3FwzjXYY6NlGs4Ce/Qw3AtoZO6WikZ870upVx+
 8oZg==
X-Gm-Message-State: APjAAAVOqv4hOJRrhsqyUfrym8cdT/U4MShb2Iz+ZJqdVOyPuSnsh+l9
 OKP5HGYSaOptEMXJHiDNPZA=
X-Google-Smtp-Source: APXvYqwSgcZrzcqoQCUjyb3OlYsv2l4vtTu0DSLZr8K5OsBbRhWzgDx0lKQiXmfYujhHwYgrw73+9w==
X-Received: by 2002:a37:f90e:: with SMTP id l14mr36512937qkj.40.1571146815044; 
 Tue, 15 Oct 2019 06:40:15 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
 by smtp.gmail.com with ESMTPSA id b22sm9945140qkc.58.2019.10.15.06.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 06:40:14 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH RESEND] drm/msm/adreno: Do not print error on "qcom,
 gpu-pwrlevels" absence
Date: Tue, 15 Oct 2019 10:40:12 -0300
Message-Id: <20191015134012.15165-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Fcph1pgTeMjmsVZh23+/8jjHWKO/soaKXMJcvGvjZOo=;
 b=Y+C32lOWFO+vP2+T16VM9qOkorXycv2L+9Ez64H6Gh/5hIwNmrjZZ69gLpmAYY/ifM
 wzcWL41oS5l8zwKTwIYGSmzVQfAzY49coxVFwdGwyKfgZbCAdn9ERN/zvcs5XWLAu6Lz
 ByTe1LheYtEANToKeEylfcd7s1QhwHTHlakPXUrZSNCw9206aGy7TVG9r17fEQmR1hlK
 CpzPYWPo1N0Qw+Y4rqc13btzqsDtlJUnaWeU2bk1a/h7FGwqNEVmPcY5m8lzB76sBcAQ
 a/BUw2jw0hlLGH3ruMN8qud/uQi5FN+mUee/QG/sbYiB++twbFucsPoHRoLGyJFXi9ml
 O+HQ==
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
Cc: jonathan@marek.ca, sean@poorly.run, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, cphealy@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Qm9vdGluZyB0aGUgYWRyZW5vIGRyaXZlciBvbiBhIGlteDUzIGJvYXJkIGxlYWRzIHRvIHRoZSBm
b2xsb3dpbmcKZXJyb3IgbWVzc2FnZToKCmFkcmVubyAzMDAwMDAwMC5ncHU6IFtkcm06YWRyZW5v
X2dwdV9pbml0XSAqRVJST1IqIENvdWxkIG5vdCBmaW5kIHRoZSBHUFUgcG93ZXJsZXZlbHMKCkFz
IHRoZSAicWNvbSxncHUtcHdybGV2ZWxzIiBwcm9wZXJ0eSBpcyBvcHRpb25hbCBhbmQgbmV2ZXIg
cHJlc2VudCBvbgppLk1YNSwgdHVybiB0aGUgbWVzc2FnZSBpbnRvIGRlYnVnIGxldmVsIGluc3Rl
YWQuCgpTaWduZWQtb2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Ci0t
LQoKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2FkcmVub19ncHUuYwppbmRleCAwNzgzZTRiNTQ4NmEuLjVkN2JkYjRjODNjYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYwpAQCAtODI2LDcgKzgyNiw3
IEBAIHN0YXRpYyBpbnQgYWRyZW5vX2dldF9sZWdhY3lfcHdybGV2ZWxzKHN0cnVjdCBkZXZpY2Ug
KmRldikKIAogCW5vZGUgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChkZXYtPm9mX25vZGUsICJx
Y29tLGdwdS1wd3JsZXZlbHMiKTsKIAlpZiAoIW5vZGUpIHsKLQkJRFJNX0RFVl9FUlJPUihkZXYs
ICJDb3VsZCBub3QgZmluZCB0aGUgR1BVIHBvd2VybGV2ZWxzXG4iKTsKKwkJRFJNX0RFVl9ERUJV
RyhkZXYsICJDb3VsZCBub3QgZmluZCB0aGUgR1BVIHBvd2VybGV2ZWxzXG4iKTsKIAkJcmV0dXJu
IC1FTlhJTzsKIAl9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
