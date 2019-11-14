Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82642FC4C9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 11:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF1B6E79B;
	Thu, 14 Nov 2019 10:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276266E799
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 10:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 5FA0B3F5B9;
 Thu, 14 Nov 2019 11:56:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPGMgaBoRjEa; Thu, 14 Nov 2019 11:56:56 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 3698F3F59D;
 Thu, 14 Nov 2019 11:56:54 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id AE47836012A;
 Thu, 14 Nov 2019 11:56:54 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org,
	linux-graphics-maintainer@vmware.com
Subject: [PATCH 1/3] drm/vmwgfx: Remove the vmw_dma_phys mode code
Date: Thu, 14 Nov 2019 11:56:43 +0100
Message-Id: <20191114105645.41578-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114105645.41578-1-thomas_os@shipmail.org>
References: <20191114105645.41578-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1573729014; bh=TKgde+IF4lIDHkgDtWxYUZrz8WvYtB8hbGdZh0VIHTc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UuC9uC74mjuUJnZ10wgjzEXnfipz1J76UtU2oZxy4EIvcgejdqo+MchVVY1TvhiUC
 HMhmdrdZNQr9cW2hlfHHzvEx0fzothhbQTbW+gIjPdhAGAXkSEyuqjoeSC+4CXZCOI
 CRhC7TVGqmy0uYVMxXVmH5pOBRCFL1bnCmaZ0XP8=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="UuC9uC74";
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhpcyBtb2Rl
IGlzIG5vdCB1c2VkIGFueW1vcmUuIFJlbW92ZSB0aGUgZGVhZCBjb2RlLgoKU2lnbmVkLW9mZi1i
eTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggICAgICAgIHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgfCA5IC0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9k
cnYuYwppbmRleCBlOTYyMDQ4ZjY1ZDIuLjYwZWYwMzEyMDkxNyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfZHJ2LmMKQEAgLTU2NCw3ICs1NjQsNiBAQCBzdGF0aWMgdm9pZCB2bXdfZ2V0X2lu
aXRpYWxfc2l6ZShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2KQogc3RhdGljIGludCB2bXdf
ZG1hX3NlbGVjdF9tb2RlKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYpCiB7CiAJc3RhdGlj
IGNvbnN0IGNoYXIgKm5hbWVzW3Ztd19kbWFfbWFwX21heF0gPSB7Ci0JCVt2bXdfZG1hX3BoeXNd
ID0gIlVzaW5nIHBoeXNpY2FsIFRUTSBwYWdlIGFkZHJlc3Nlcy4iLAogCQlbdm13X2RtYV9hbGxv
Y19jb2hlcmVudF0gPSAiVXNpbmcgY29oZXJlbnQgVFRNIHBhZ2VzLiIsCiAJCVt2bXdfZG1hX21h
cF9wb3B1bGF0ZV0gPSAiQ2FjaGluZyBETUEgbWFwcGluZ3MuIiwKIAkJW3Ztd19kbWFfbWFwX2Jp
bmRdID0gIkdpdmluZyB1cCBETUEgbWFwcGluZ3MgZWFybHkuIn07CkBAIC01OTgsOCArNTk3LDcg
QEAgc3RhdGljIGludCB2bXdfZG1hX21hc2tzKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYp
CiAJaW50IHJldCA9IDA7CiAKIAlyZXQgPSBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KGRldi0+
ZGV2LCBETUFfQklUX01BU0soNjQpKTsKLQlpZiAoZGV2X3ByaXYtPm1hcF9tb2RlICE9IHZtd19k
bWFfcGh5cyAmJgotCSAgICAoc2l6ZW9mKHVuc2lnbmVkIGxvbmcpID09IDQgfHwgdm13X3Jlc3Ry
aWN0X2RtYV9tYXNrKSkgeworCWlmIChzaXplb2YodW5zaWduZWQgbG9uZykgPT0gNCB8fCB2bXdf
cmVzdHJpY3RfZG1hX21hc2spIHsKIAkJRFJNX0lORk8oIlJlc3RyaWN0aW5nIERNQSBhZGRyZXNz
ZXMgdG8gNDQgYml0cy5cbiIpOwogCQlyZXR1cm4gZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudChk
ZXYtPmRldiwgRE1BX0JJVF9NQVNLKDQ0KSk7CiAJfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9k
cnYuaAppbmRleCBiMTg4NDJmNzMwODEuLjc2MWRiZDQyNDc0OSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfZHJ2LmgKQEAgLTI4MSw3ICsyODEsNiBAQCBzdHJ1Y3Qgdm13X3Jlc19jYWNoZV9l
bnRyeSB7CiAgKiBlbnVtIHZtd19kbWFfbWFwX21vZGUgLSBpbmRpY2F0ZSBob3cgdG8gcGVyZm9y
bSBUVE0gcGFnZSBkbWEgbWFwcGluZ3MuCiAgKi8KIGVudW0gdm13X2RtYV9tYXBfbW9kZSB7Ci0J
dm13X2RtYV9waHlzLCAgICAgICAgICAgLyogVXNlIHBoeXNpY2FsIHBhZ2UgYWRkcmVzc2VzICov
CiAJdm13X2RtYV9hbGxvY19jb2hlcmVudCwgLyogVXNlIFRUTSBjb2hlcmVudCBwYWdlcyAqLwog
CXZtd19kbWFfbWFwX3BvcHVsYXRlLCAgIC8qIFVubWFwIGZyb20gRE1BIGp1c3QgYWZ0ZXIgdW5w
b3B1bGF0ZSAqLwogCXZtd19kbWFfbWFwX2JpbmQsICAgICAgIC8qIFVubWFwIGZyb20gRE1BIGp1
c3QgYmVmb3JlIHVuYmluZCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfdHRtX2J1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1
ZmZlci5jCmluZGV4IGQ4ZWEzZGQxMGFmMC4uOGMwMTM1ZjFjMzQ2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jCkBAIC0yOTUsMTEgKzI5NSw2IEBAIHN0YXRp
YyBzdHJ1Y3QgcGFnZSAqX192bXdfcGl0ZXJfbm9uX3NnX3BhZ2Uoc3RydWN0IHZtd19waXRlciAq
dml0ZXIpCiAgKiBwb2ludGVkIHRvIGJ5IEB2aXRlci4gRnVuY3Rpb25zIGFyZSBzZWxlY3RlZCBk
ZXBlbmRpbmcgb24gdGhlCiAgKiBjdXJyZW50IG1hcHBpbmcgbW9kZS4KICAqLwotc3RhdGljIGRt
YV9hZGRyX3QgX192bXdfcGl0ZXJfcGh5c19hZGRyKHN0cnVjdCB2bXdfcGl0ZXIgKnZpdGVyKQot
ewotCXJldHVybiBwYWdlX3RvX3BoeXModml0ZXItPnBhZ2VzW3ZpdGVyLT5pXSk7Ci19Ci0KIHN0
YXRpYyBkbWFfYWRkcl90IF9fdm13X3BpdGVyX2RtYV9hZGRyKHN0cnVjdCB2bXdfcGl0ZXIgKnZp
dGVyKQogewogCXJldHVybiB2aXRlci0+YWRkcnNbdml0ZXItPmldOwpAQCAtMzI5LDEwICszMjQs
NiBAQCB2b2lkIHZtd19waXRlcl9zdGFydChzdHJ1Y3Qgdm13X3BpdGVyICp2aXRlciwgY29uc3Qg
c3RydWN0IHZtd19zZ190YWJsZSAqdnNndCwKIAl2aXRlci0+cGFnZSA9ICZfX3Ztd19waXRlcl9u
b25fc2dfcGFnZTsKIAl2aXRlci0+cGFnZXMgPSB2c2d0LT5wYWdlczsKIAlzd2l0Y2ggKHZzZ3Qt
Pm1vZGUpIHsKLQljYXNlIHZtd19kbWFfcGh5czoKLQkJdml0ZXItPm5leHQgPSAmX192bXdfcGl0
ZXJfbm9uX3NnX25leHQ7Ci0JCXZpdGVyLT5kbWFfYWRkcmVzcyA9ICZfX3Ztd19waXRlcl9waHlz
X2FkZHI7Ci0JCWJyZWFrOwogCWNhc2Ugdm13X2RtYV9hbGxvY19jb2hlcmVudDoKIAkJdml0ZXIt
Pm5leHQgPSAmX192bXdfcGl0ZXJfbm9uX3NnX25leHQ7CiAJCXZpdGVyLT5kbWFfYWRkcmVzcyA9
ICZfX3Ztd19waXRlcl9kbWFfYWRkcjsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
