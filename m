Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2522A98EB7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 11:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B3A6EABB;
	Thu, 22 Aug 2019 09:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072506EAB7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 09:06:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A576C18C8913
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 09:06:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CBFE5C22C;
 Thu, 22 Aug 2019 09:06:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E0B8511AAF; Thu, 22 Aug 2019 11:06:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm,
 fbdev: complete remove_conflicting_pci_framebuffers cleanup.
Date: Thu, 22 Aug 2019 11:06:42 +0200
Message-Id: <20190822090645.25410-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Thu, 22 Aug 2019 09:06:50 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpHZXJkIEhvZmZtYW5uICgzKToKICBmYmRldjogZHJvcCByZXNfaWQgcGFyYW1ldGVyIGZyb20g
cmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnMKICBkcm06IGRyb3AgcmVzb3VyY2Vf
aWQgcGFyYW1ldGVyIGZyb20KICAgIGRybV9mYl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5nX3Bj
aV9mcmFtZWJ1ZmZlcnMKICBkcm0vaTkxNTogc3dpdGNoIHRvIGRybV9mYl9oZWxwZXJfcmVtb3Zl
X2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnMKCiBpbmNsdWRlL2RybS9kcm1fZmJfaGVscGVy
LmggICAgICAgICAgICAgfCAgNiArKy0tCiBpbmNsdWRlL2xpbnV4L2ZiLmggICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
IHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19kcnYuYyAgICAgICB8ICAyICst
CiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYyAgICAgICAgIHwgNDEgKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyAgIHwgIDIgKy0K
IGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2Rydi5jICAgIHwgIDEgLQogZHJpdmVycy92aWRlby9mYmRldi9jb3Jl
L2ZibWVtLmMgICAgICAgIHwgMTcgKysrLS0tLS0tLQogMTEgZmlsZXMgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKSwgNjMgZGVsZXRpb25zKC0pCgotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
