Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329F72D9D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 13:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36C26E4BA;
	Wed, 24 Jul 2019 11:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFD96E4C1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:30:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3D088AE8B;
 Wed, 24 Jul 2019 11:30:25 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org, airlied@redhat.com,
 yc_chen@aspeedtech.com, Christian.Koenig@amd.com
Subject: [PATCH 0/3] Provide vmap/vunmap for VRAM helpers
Date: Wed, 24 Jul 2019 13:30:17 +0200
Message-Id: <20190724113020.3752-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHZtYXAgb3BlcmF0aW9uIGlzIHBpbitrbWFwLCBhcyBhbHJlYWR5IGltcGxlbWVudGVkIGZv
ciBQUklNRQpzdXBwb3J0LiBUaGUgdnVubWFwIG9wZXJhdGlvbiBpcyB0aGUgaW52ZXJzZS4gVGhp
cyBwYXRjaCBzZXQgbWFrZXMKYm90aCBhdmFpbGFibGUgZm9yIGRyaXZlcnMgdGhhdCB1c2UgVlJB
TSBoZWxwZXJzLCBhbmQgcmVwbGFjZXMgdGhlCnJlc3BlY3RpdmUgY29kZSBpbiBhc3QgYW5kIG1n
YWcyMDAuCgpUaG9tYXMgWmltbWVybWFubiAoMyk6CiAgZHJtL3ZyYW06IFByb3ZpZGUgdm1hcCBh
bmQgdnVubWFwIG9wZXJhdGlvbnMgZm9yIEdFTSBWUkFNIG9iamVjdHMKICBkcm0vYXN0OiBVc2Ug
ZHJtX2dlbV92cmFtX3t2bWFwLHZ1bm1hcH0oKSB0byBtYXAgY3Vyc29yIHNvdXJjZSBCTwogIGRy
bS9tZ2FnMjAwOiBVc2UgZHJtX2dlbV92cmFtX3t2bWFwLHZ1bm1hcH0oKSB0byBtYXAgY3Vyc29y
IHNvdXJjZSBCTwoKIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyAgICAgICAgICAgfCAy
MSArKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgICAgfCA1
NSArKysrKysrKysrKysrKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfY3Vyc29yLmMgfCAyMiArKystLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmggICAgICAgIHwgMTIgKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMo
KyksIDM5IGRlbGV0aW9ucygtKQoKLS0KMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
