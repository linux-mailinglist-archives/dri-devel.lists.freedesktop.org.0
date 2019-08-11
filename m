Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8789207
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 16:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3B46E347;
	Sun, 11 Aug 2019 14:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D70E6E347
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 14:37:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 973233082B41;
 Sun, 11 Aug 2019 14:37:36 +0000 (UTC)
Received: from dhcp-44-196.space.revspace.nl (ovpn-112-19.ams2.redhat.com
 [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 660AB60933;
 Sun, 11 Aug 2019 14:37:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: [PATCH 2/2] drm: gm12u320: Add -ENODEV to list of errors to ignore
Date: Sun, 11 Aug 2019 16:37:25 +0200
Message-Id: <20190811143725.5951-2-hdegoede@redhat.com>
In-Reply-To: <20190811143725.5951-1-hdegoede@redhat.com>
References: <20190811143725.5951-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Sun, 11 Aug 2019 14:37:36 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIC1FTk9ERVYgdG8gdGhlIGxpc3Qgb2YgdXNiLXRyYW5zZmVyIGVycm9ycyB3aGljaCB3ZSBp
Z25vcmUgdG8KYXZvaWQgbG9nZ2luZyBGcmFtZSB1cGRhdGUgZXJyb3JzIHdoZW4gdGhlIGRldmlj
ZSBnZXRzIHVucGx1Z2dlZC4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRl
QHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlu
eS9nbTEydTMyMC5jCmluZGV4IDRkNjY3NjViMTEyNS4uMDhhNTJhNjdlYzllIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90
aW55L2dtMTJ1MzIwLmMKQEAgLTQyMiw3ICs0MjIsNyBAQCBzdGF0aWMgdm9pZCBnbTEydTMyMF9m
Yl91cGRhdGVfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJcmV0dXJuOwogZXJyOgog
CS8qIERvIG5vdCBsb2cgZXJyb3JzIGNhdXNlZCBieSBtb2R1bGUgdW5sb2FkIG9yIGRldmljZSB1
bnBsdWcgKi8KLQlpZiAocmV0ICE9IC1FQ09OTlJFU0VUICYmIHJldCAhPSAtRVNIVVRET1dOKQor
CWlmIChyZXQgIT0gLUVOT0RFViAmJiByZXQgIT0gLUVDT05OUkVTRVQgJiYgcmV0ICE9IC1FU0hV
VERPV04pCiAJCUdNMTJVMzIwX0VSUigiRnJhbWUgdXBkYXRlIGVycm9yOiAlZFxuIiwgcmV0KTsK
IH0KIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
