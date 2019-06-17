Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8220048054
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 13:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4696891B3;
	Mon, 17 Jun 2019 11:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790A0891AA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 11:14:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 196C2356E4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 11:14:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A524A18A26;
 Mon, 17 Jun 2019 11:14:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DD1BE16E18; Mon, 17 Jun 2019 13:14:06 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/virtio: try remove ttm
Date: Mon, 17 Jun 2019 13:14:02 +0200
Message-Id: <20190617111406.14765-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 17 Jun 2019 11:14:10 +0000 (UTC)
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

dHRtIGluY3JlYXNpbmdseSBnZXRzIGludG8gdGhlIHdheSB3aGlsZSBoYWNraW5nIG9uIHZpcnRp
by1ncHUgbWVtb3J5Cm1hbmFnZW1lbnQuICBTbyBtYXliZSB3ZSBhcmUgYmV0dGVyIG9mZiB3aXRo
b3V0LCB1c2luZyBnZW0gaGVscGVycwppbnN0ZWFkPwoKVHJ5aW5nIHJlbW92ZSB0aGUgZGVwZW5k
ZW5jeSBvbiB0dG0gcmVzZXJ2YXRpb25zIGxvb2tzIGxpa2UgYSBnb29kIGZpcnN0CmZpcnN0IHN0
ZXAgdG8gbWUuICBUaGlzIHBhdGNoIHNlcmllcyBpcyBhIChzbWFsbCkgc3RhcnQgb24gdGhhdC4K
CkF0IHRoZSBwb2ludCBJJ20gbG9va2luZyBmb3IgY29tbWVudHMgd2hldmVuZXIgdGhlIHBsYW4g
YW5kIHRoZSBpbml0aWFsCnBhdGNoZXMgbG9vayBzYW5lIGFuZCBmb3IgdGhpbmdzIEkgc2hvdWxk
IHBvc3NpYmx5IHdhdGNoIG91dCBmb3Igb24gdGhlCndheS4KCnRoYW5rcywKICBHZXJkCgpHZXJk
IEhvZmZtYW5uICg0KToKICBkcm0vdmlydGlvOiBwYXNzIGdlbSByZXNlcnZhdGlvbiBvYmplY3Qg
dG8gdHRtIGluaXQKICBkcm0vdmlydGlvOiBzd2l0Y2ggdmlydGlvX2dwdV93YWl0X2lvY3RsKCkg
dG8gZ2VtIGhlbHBlci4KICBkcm0vdmlydGlvOiBzaW1wbGlmeSBjdXJzb3IgdXBkYXRlcwogIGRy
bS92aXJ0aW86IHJlbW92ZSB2aXJ0aW9fZ3B1X29iamVjdF93YWl0CgogZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2Rydi5oICAgIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2lvY3RsLmMgIHwgMTggKysrKy0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgfCAxNiArKy0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYyAgfCAxMyArKystLS0tLS0tLS0tCiA0IGZpbGVz
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCgotLSAKMi4xOC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
