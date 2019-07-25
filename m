Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5F675818
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 21:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCD26E81B;
	Thu, 25 Jul 2019 19:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AB56E81B;
 Thu, 25 Jul 2019 19:40:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7815A3086262;
 Thu, 25 Jul 2019 19:40:17 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-11.bss.redhat.com
 [10.20.1.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF28620CE;
 Thu, 25 Jul 2019 19:40:14 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 1/2] drm/nouveau: Fix missing elses in g94_i2c_aux_xfer
Date: Thu, 25 Jul 2019 15:40:00 -0400
Message-Id: <20190725194005.16572-2-lyude@redhat.com>
In-Reply-To: <20190725194005.16572-1-lyude@redhat.com>
References: <20190725194005.16572-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 25 Jul 2019 19:40:17 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBsb29rcyByYXRoZXIgdW5pbnRlbnRpb25hbCEKClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBh
dWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvaTJjL2F1eGc5NC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L2kyYy9hdXhnOTQuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
c3ViZGV2L2kyYy9hdXhnOTQuYwppbmRleCBjOGFiMWI1NzQxYTMuLjliYzllYWMwODc4OSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaTJjL2F1eGc5NC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2kyYy9hdXhnOTQuYwpA
QCAtMTM4LDkgKzEzOCw5IEBAIGc5NF9pMmNfYXV4X3hmZXIoc3RydWN0IG52a21faTJjX2F1eCAq
b2JqLCBib29sIHJldHJ5LAogCQlpZiAoKHN0YXQgJiAweDAwMGYwMDAwKSA9PSAweDAwMDgwMDAw
IHx8CiAJCSAgICAoc3RhdCAmIDB4MDAwZjAwMDApID09IDB4MDAwMjAwMDApCiAJCQlyZXQgPSAx
OwotCQlpZiAoKHN0YXQgJiAweDAwMDAwMTAwKSkKKwkJZWxzZSBpZiAoKHN0YXQgJiAweDAwMDAw
MTAwKSkKIAkJCXJldCA9IC1FVElNRURPVVQ7Ci0JCWlmICgoc3RhdCAmIDB4MDAwMDBlMDApKQor
CQllbHNlIGlmICgoc3RhdCAmIDB4MDAwMDBlMDApKQogCQkJcmV0ID0gLUVJTzsKIAogCQlBVVhf
VFJBQ0UoJmF1eC0+YmFzZSwgIiUwMmQgJTA4eCAlMDh4IiwgcmV0cmllcywgY3RybCwgc3RhdCk7
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
