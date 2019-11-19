Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFA0102742
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 15:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345D86E060;
	Tue, 19 Nov 2019 14:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.47.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC2D6E8C0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:47:30 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D2D53C2577;
 Tue, 19 Nov 2019 14:41:55 +0000 (UTC)
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id A75AEA0069;
 Tue, 19 Nov 2019 14:41:53 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 3/4] DRM: ARC: PGU: replace unsupported by HW RGB888 format by
 XRGB888
Date: Tue, 19 Nov 2019 17:41:46 +0300
Message-Id: <20191119144147.8022-4-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
References: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1574174517; bh=y/UJ6x3VYOJt5fIAD/1jTDgF9YTH0srcaXkWR4OGbd0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fPtTti2LVDPM9DgKHzdr1nFE/0ZhNsu3lkSW1EvgO3qMMEaJ2jmBoYY+fZOcw3wet
 4EdJL/drirgbr5SPdnJATxMYvflcxei+311eYSEc1UqC+D4yqpKCOi/nGKgkhdq6NB
 u16RzcMaAu74XfVgGrgBi6L0/aE1I0JifzdswhnSTiI0o8P5Wx5USGSFXMu4s4BH6R
 3A8bzMEHS+c4px5RSnAnQ6d/OvzSX7T6t1HT0ObSi+yW3kRMRWeZXOr77t34lyHQGI
 aTJoi/sgyKANCULKv+0SvFWR9C2CVac6GPcWSdwoWLaDKWx6AYlA4glo4Jdv/4cjyv
 gn9EB64ZGggFw==
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
Cc: David Airlie <airlied@linux.ie>, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QVJDIFBHVSBkb2Vzbid0IHN1cHBvcnQgUkdCODg4ICgyNCBiaXQpIGZvcm1hdCBidXQgc3VwcG9y
dHMKWFJHQjg4OCAoMzIgYml0KSBmb3JtYXQuIEZpeCBpbmNvcnJlY3QgZm9ybWF0IGxpc3QgaW4g
YSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBFdWdlbml5IFBhbHRzZXYgPEV1Z2VuaXkuUGFsdHNl
dkBzeW5vcHN5cy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3VfY3J0Yy5jIHwg
NiArKystLS0KIGRyaXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X3JlZ3MuaCB8IDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcmMv
YXJjcGd1X2NydGMuYwppbmRleCA1NDczYjE5YTUyZWUuLjk4MGUwMDE4MGU2ZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3VfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcmMvYXJjcGd1X2NydGMuYwpAQCAtMjIsNyArMjIsNyBAQAogCiBzdGF0aWMgY29uc3QgdTMy
IGFyY19wZ3Vfc3VwcG9ydGVkX2Zvcm1hdHNbXSA9IHsKIAlEUk1fRk9STUFUX1JHQjU2NSwKLQlE
Uk1fRk9STUFUX1JHQjg4OCwKKwlEUk1fRk9STUFUX1hSR0I4ODg4LAogfTsKIAogc3RhdGljIHZv
aWQgYXJjX3BndV9zZXRfcHhsX2ZtdChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCkBAIC00NCw5ICs0
NCw5IEBAIHN0YXRpYyB2b2lkIGFyY19wZ3Vfc2V0X3B4bF9mbXQoc3RydWN0IGRybV9jcnRjICpj
cnRjKQogCiAJcmVnX2N0cmwgPSBhcmNfcGd1X3JlYWQoYXJjcGd1LCBBUkNQR1VfUkVHX0NUUkwp
OwogCWlmIChmb3JtYXQgPT0gRFJNX0ZPUk1BVF9SR0I1NjUpCi0JCXJlZ19jdHJsICY9IH5BUkNQ
R1VfTU9ERV9SR0I4ODhfTUFTSzsKKwkJcmVnX2N0cmwgJj0gfkFSQ1BHVV9NT0RFX1hSR0I4ODg4
OwogCWVsc2UKLQkJcmVnX2N0cmwgfD0gQVJDUEdVX01PREVfUkdCODg4X01BU0s7CisJCXJlZ19j
dHJsIHw9IEFSQ1BHVV9NT0RFX1hSR0I4ODg4OwogCWFyY19wZ3Vfd3JpdGUoYXJjcGd1LCBBUkNQ
R1VfUkVHX0NUUkwsIHJlZ19jdHJsKTsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FyYy9hcmNwZ3VfcmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3VfcmVncy5oCmlu
ZGV4IGRhYjJjMzgwZjdmMy4uYjY4OWEzODJkNTU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXJjL2FyY3BndV9yZWdzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3VfcmVn
cy5oCkBAIC0yNSw3ICsyNSw3IEBACiAjZGVmaW5lIEFSQ1BHVV9DVFJMX1ZTX1BPTF9PRlNUCTB4
MwogI2RlZmluZSBBUkNQR1VfQ1RSTF9IU19QT0xfTUFTSwkweDEKICNkZWZpbmUgQVJDUEdVX0NU
UkxfSFNfUE9MX09GU1QJMHg0Ci0jZGVmaW5lIEFSQ1BHVV9NT0RFX1JHQjg4OF9NQVNLCTB4MDQK
KyNkZWZpbmUgQVJDUEdVX01PREVfWFJHQjg4ODgJQklUKDIpCiAjZGVmaW5lIEFSQ1BHVV9TVEFU
X0JVU1lfTUFTSwkweDAyCiAKICNlbmRpZgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
