Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0C098F78
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 11:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7376EAE8;
	Thu, 22 Aug 2019 09:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92646EAE7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 09:36:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7069F10C6967;
 Thu, 22 Aug 2019 09:36:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0329060126;
 Thu, 22 Aug 2019 09:36:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 524599AF5; Thu, 22 Aug 2019 11:36:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] udmabuf: check that __pad is zero
Date: Thu, 22 Aug 2019 11:36:53 +0200
Message-Id: <20190822093654.23752-3-kraxel@redhat.com>
In-Reply-To: <20190822093654.23752-1-kraxel@redhat.com>
References: <20190822093654.23752-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 22 Aug 2019 09:36:57 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, laurent.pinchart@ideasonboard.com,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwb3J0ZWQtYnk6IFlhbm4gRHJvbmVhdWQgPHlkcm9uZWF1ZEBvcHRleWEuY29tPgpTaWduZWQt
b2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2Rt
YS1idWYvdWRtYWJ1Zi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYv
dWRtYWJ1Zi5jCmluZGV4IDk2MzU4OTc0NThhMC4uNmMzZWM4ZmNlZjAxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMK
QEAgLTEzNyw2ICsxMzcsOCBAQCBzdGF0aWMgbG9uZyB1ZG1hYnVmX2NyZWF0ZShjb25zdCBzdHJ1
Y3QgdWRtYWJ1Zl9jcmVhdGVfbGlzdCAqaGVhZCwKIAogCXBnbGltaXQgPSAoc2l6ZV9saW1pdF9t
YiAqIDEwMjQgKiAxMDI0KSA+PiBQQUdFX1NISUZUOwogCWZvciAoaSA9IDA7IGkgPCBoZWFkLT5j
b3VudDsgaSsrKSB7CisJCWlmIChsaXN0W2ldLl9fcGFkKQorCQkJZ290byBlcnI7CiAJCWlmICgh
SVNfQUxJR05FRChsaXN0W2ldLm9mZnNldCwgUEFHRV9TSVpFKSkKIAkJCWdvdG8gZXJyOwogCQlp
ZiAoIUlTX0FMSUdORUQobGlzdFtpXS5zaXplLCBQQUdFX1NJWkUpKQotLSAKMi4xOC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
