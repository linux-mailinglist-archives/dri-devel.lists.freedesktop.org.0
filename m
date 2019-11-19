Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BF0102757
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 15:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8236E910;
	Tue, 19 Nov 2019 14:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 549 seconds by postgrey-1.36 at gabe;
 Tue, 19 Nov 2019 14:51:04 UTC
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1B86E910
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:51:04 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C9CCDC04B6;
 Tue, 19 Nov 2019 14:41:53 +0000 (UTC)
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id DEEC8A005D;
 Tue, 19 Nov 2019 14:41:50 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 0/4] DRM: PGU: ARC: fixies related to framebuffer format
Date: Tue, 19 Nov 2019 17:41:43 +0300
Message-Id: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1574174515; bh=G4p50MA5mFWmjXCuDGR29jySUNUSgvmL37nTesfoCHE=;
 h=From:To:Cc:Subject:Date:From;
 b=ZcPGV1yuUi+weiF9t/xM5EPXYfLagwjWjkAIv41Z/Tb9YhloRYkFVkVSN4aBJxX1L
 fKKxGwZqQ81oK7aA7+1wcFJmX1Gj80q908fv4/CXFhoA3mgnzXNt0g9kqU2D9Eh1sE
 zP13Eqh3bCqaHxMi3wEUjUQByO4Ylb9r1a5i45R7RiIMrCwMD/7hShOV/3VttUDC3z
 vuQHLbj0ldkCZDuOOryPvWlb/xbR3dzJG6xfqzSEUo+qMMtAyScWnsGVkXotopcx4E
 phr7wAJJ0fTCKqHV9NVAmVD54l9/M36we+9zdvullHtRBqnDE9Oik1qV9rEkZm/iah
 rA/cm0sZo8Njg==
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

RXVnZW5peSBQYWx0c2V2ICg0KToKICBEUk06IEFSQzogUEdVOiBmaXggZnJhbWVidWZmZXIgZm9y
bWF0IHN3aXRjaGluZwogIERSTTogQVJDOiBQR1U6IGNsZWFudXAgc3VwcG9ydGVkIGZvcm1hdCBs
aXN0IGNvZGUKICBEUk06IEFSQzogUEdVOiByZXBsYWNlIHVuc3VwcG9ydGVkIGJ5IEhXIFJHQjg4
OCBmb3JtYXQgYnkgWFJHQjg4OAogIERSTTogQVJDOiBQR1U6IGFkZCBBUkdCODg4OCBmb3JtYXQg
dG8gc3VwcG9ydGVkIGZvcm1hdCBsaXN0CgogZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3VfY3J0
Yy5jIHwgMzYgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJt
L2FyYy9hcmNwZ3VfcmVncy5oIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9u
cygrKSwgMTkgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
