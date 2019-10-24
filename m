Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 378C7E35C0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 16:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1006E41D;
	Thu, 24 Oct 2019 14:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5854B6E41D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:42:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C038AB92C;
 Thu, 24 Oct 2019 14:42:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH 2/5] drm/udl: Set drm_driver.gem_prime_mmap
Date: Thu, 24 Oct 2019 16:42:34 +0200
Message-Id: <20191024144237.8898-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024144237.8898-1-tzimmermann@suse.de>
References: <20191024144237.8898-1-tzimmermann@suse.de>
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

VGhpcyBpbnRlcmZhY2UgaXMgcmVxdWlyZWQgYnkgdGhlIG1tYXAgc3VwcG9ydCBvZiBnZW5lcmlj
CmZiZGV2IGVtdWxhdGlvbi4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jIHwgMSAr
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jCmluZGV4
IDg0MjY2Njk0MzNlNC4uMTVhZDdhMzM4ZjlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dWRsL3VkbF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYwpAQCAtNzQs
NiArNzQsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZHJpdmVyID0gewogCS5wcmltZV9m
ZF90b19oYW5kbGUgPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwKIAkuZ2VtX3ByaW1lX2V4
cG9ydCA9IHVkbF9nZW1fcHJpbWVfZXhwb3J0LAogCS5nZW1fcHJpbWVfaW1wb3J0ID0gdWRsX2dl
bV9wcmltZV9pbXBvcnQsCisJLmdlbV9wcmltZV9tbWFwID0gZHJtX2dlbV9wcmltZV9tbWFwLAog
CiAJLm5hbWUgPSBEUklWRVJfTkFNRSwKIAkuZGVzYyA9IERSSVZFUl9ERVNDLAotLSAKMi4yMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
