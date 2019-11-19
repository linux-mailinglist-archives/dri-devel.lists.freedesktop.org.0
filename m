Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7D3102740
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 15:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036B66E8BC;
	Tue, 19 Nov 2019 14:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 333 seconds by postgrey-1.36 at gabe;
 Tue, 19 Nov 2019 14:47:30 UTC
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA946E8BC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:47:30 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 147B1C2579;
 Tue, 19 Nov 2019 14:41:56 +0000 (UTC)
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4EED4A006A;
 Tue, 19 Nov 2019 14:41:54 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 4/4] DRM: ARC: PGU: add ARGB8888 format to supported format
 list
Date: Tue, 19 Nov 2019 17:41:47 +0300
Message-Id: <20191119144147.8022-5-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
References: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1574174521; bh=ZWkYMPU199Ha5+2VkQ3merzs8RQFTg9Z2C7vXwrjAQE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lmcoumEql73Gt7gufxFUVndk5tPFqX+lygXfzwoBF5sAlyK34XuAUEuniDepeeIVX
 se9xf6g76XsP52MNWxZWbGeabdePfaS8rRIXFg7y6f+xOo+8+U/bplGUkA5NS0wvLQ
 q/2l6tqvtnxvOeahJQRx4v8JzCIUD18otbF0ul8ytbgJzBFEMNzsVkwao4ALij3A2W
 zmIPiHfjY/yBmhfsjGJYq+7MDjjASlo4wO62jiz0ooKt6oP9e0BkhVMpVII4bPSRNl
 hyP+EYYL6Y9uU5pmN59lohBQfUR8oP7s9PkTBhKjI7dyXtfRzxW6BYcC4HDusPsNZs
 9Zj28YXRD1l1w==
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

QXMgd2UgaWdub3JlIGZpcnN0IDggYml0IG9mIDMyIGJpdCBwaXhlbCB2YWx1ZSB3ZSBjYW4gYWRk
IEFSR0I4ODg4CmZvcm1hdCBhcyBhbGlhcyBvZiBYUkdCODg4OC4KClNpZ25lZC1vZmYtYnk6IEV1
Z2VuaXkgUGFsdHNldiA8RXVnZW5peS5QYWx0c2V2QHN5bm9wc3lzLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYXJjL2FyY3BndV9jcnRjLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X2NydGMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X2NydGMuYwppbmRleCA5ODBlMDAxODBlNmYuLjhh
ZTFlMWY5N2E3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3VfY3J0Yy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X2NydGMuYwpAQCAtMjMsNiArMjMsNyBA
QAogc3RhdGljIGNvbnN0IHUzMiBhcmNfcGd1X3N1cHBvcnRlZF9mb3JtYXRzW10gPSB7CiAJRFJN
X0ZPUk1BVF9SR0I1NjUsCiAJRFJNX0ZPUk1BVF9YUkdCODg4OCwKKwlEUk1fRk9STUFUX0FSR0I4
ODg4LAogfTsKIAogc3RhdGljIHZvaWQgYXJjX3BndV9zZXRfcHhsX2ZtdChzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMpCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
