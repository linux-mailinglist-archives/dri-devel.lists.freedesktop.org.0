Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671692A2BCD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9EC6EB8E;
	Mon,  2 Nov 2020 13:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B3B6E4FF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 13:38:43 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 27A6444E;
 Mon,  2 Nov 2020 08:38:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 02 Nov 2020 08:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=9FIIhXB0a80yjS17q8F/HtzehI
 kT+EtdjFXdzpPVkBA=; b=FiWZtGOsNPtwW60QhzGfFB+PaWpVfFVgt3bHkQSB6/
 j7Fbi+A9zjduvrvNLOCpOZ7avZgnuX+GDQVs/PmY3LEADdQCa7ULe4AYzhEIVyo0
 jDzMrX6B/razZBniXLc+3C1SqaLa1YgsgZgOHbZWEINYxInH0UtJaP+i//Yzry9x
 //UAF9vFbY39CJNUCGoooQnMF7T3rNGTtKczjKQQUosB9Wx7SyIBwVKa8lUUiAco
 6Hj5ps1fjGh4zI2B2nCnwAF2qhA+YBEKztC8B9hfZCcnVYD3PP2j7o76xsiz0bK6
 ErqUpWM6YzNCCcVma8zHhXQ3QJ3y5MfuuWbyC7gHVE2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9FIIhX
 B0a80yjS17q8F/HtzehIkT+EtdjFXdzpPVkBA=; b=dqcq7oN4CevOIf4H47FeSr
 spxNxwii7PXCEkV4+NHYtSE5OvaOsHXt5efs7falZGrtmUsXFG9TXqdQX37Cr/Kd
 F18f5LndGXH6MoOn9qc0Ihe2xTjkfSDzRXpuQWHQcmQNvmCJ12BnbGz2BJKoQfuM
 Wq0c9mravw5qBgOYb9Km7jYw4l+pM6aiZqml0ZvD6ADwOWGi2vYMtZ4QVvgmOSRx
 sWwvkZhNX4DfEEzNK27PpU4y3qodu71YTyc1hYGd09Haq0uzMPV+htMEZG5Mf8kn
 OkAoiK/d8c1hsO7hloSNFo+pityMjTsaN68YKV1IHvY9J0keoGJEmZIvrFOAXk8w
 ==
X-ME-Sender: <xms:3QugXyeJ6y1_uhF-0p2rh8F-W21zMt0xsMEzTJ-BHjkzIDRDTw6oTw>
 <xme:3QugX8OLbLT_8teBquUEs-fVJebpuXsxA3cuzShiHdYEK3tJ7x3QtIkJJ3_B-zws-
 iC_QnmY_x7VJObUCQU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeehvdfgueejgfefhfelfeejtdetuddvffdttefggfeftdfgffekleefjedvgeei
 hfenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3QugXzgM7UB45hxrFQoRqduHCQr-h4LXx2twBwW_KX0xd9Zl3E2aPw>
 <xmx:3QugX__va7ZPlPvgqU9c7MvCP6a5_mzJEB74vaVXMHHNWSNQM88D2w>
 <xmx:3QugX-sN7EJRwq9HB9BiSYUfCfohvSeiQnr14wOCzIuI-ndgiarOoQ>
 <xmx:3gugXwJGj8uwQeYnJM4590esKQC_yb3b-Nlum0PA75PrreDVakvirA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 743653280060;
 Mon,  2 Nov 2020 08:38:37 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/3] drm/nouveau/kms/nv50-: Use state helper instead of crtc
 pointer
Date: Mon,  2 Nov 2020 14:38:32 +0100
Message-Id: <20201102133834.1176740-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGlzcG52NTAgcmVmZXJlbmNlcyB0aGUgY3J0Yy0+c3RhdGUgcG9pbnRlciBpbiBvcmRlciB0byBn
ZXQgdGhlIGN1cnJlbnQKQ1JUQyBzdGF0ZSBpbiBpdHMgYXRvbWljX2NoZWNrIGhvb2ssIHdoaWNo
IHdvdWxkIGJlIHRoZSBvbGQgQ1JUQyBzdGF0ZSBpbgp0aGUgZ2xvYmFsIGF0b21pYyBzdGF0ZS4K
ClVzZSB0aGUgZHJtX2F0b21pY19nZXRfb2xkX2NydGNfc3RhdGUgaGVscGVyIHRvIGdldCB0aGF0
IHN0YXRlIHRvIG1ha2UgaXQKbW9yZSBvYnZpb3VzLgoKU3VnZ2VzdGVkLWJ5OiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYXhp
bWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9oZWFkLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9oZWFkLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkLmMK
aW5kZXggMDU0MmNhMjJiMzNhLi41MzdjMWVmMmU0NjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9oZWFkLmMKQEAgLTMxMywxMSArMzEzLDEzIEBAIG52NTBfaGVhZF9hdG9taWNf
Y2hlY2tfbW9kZShzdHJ1Y3QgbnY1MF9oZWFkICpoZWFkLCBzdHJ1Y3QgbnY1MF9oZWFkX2F0b20g
KmFzeWgpCiBzdGF0aWMgaW50CiBudjUwX2hlYWRfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fY3J0
YyAqY3J0Yywgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQogeworCXN0cnVjdCBkcm1f
Y3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9vbGRfY3J0Y19zdGF0
ZShzdGF0ZSwKKwkJCQkJCQkJCSAgICAgIGNydGMpOwogCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
Y3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKHN0YXRlLAogCQkJCQkJ
CQkJICBjcnRjKTsKIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKGNydGMt
PmRldik7CiAJc3RydWN0IG52NTBfaGVhZCAqaGVhZCA9IG52NTBfaGVhZChjcnRjKTsKLQlzdHJ1
Y3QgbnY1MF9oZWFkX2F0b20gKmFybWggPSBudjUwX2hlYWRfYXRvbShjcnRjLT5zdGF0ZSk7CisJ
c3RydWN0IG52NTBfaGVhZF9hdG9tICphcm1oID0gbnY1MF9oZWFkX2F0b20ob2xkX2NydGNfc3Rh
dGUpOwogCXN0cnVjdCBudjUwX2hlYWRfYXRvbSAqYXN5aCA9IG52NTBfaGVhZF9hdG9tKGNydGNf
c3RhdGUpOwogCXN0cnVjdCBub3V2ZWF1X2Nvbm5fYXRvbSAqYXN5YyA9IE5VTEw7CiAJc3RydWN0
IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5zOwotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
