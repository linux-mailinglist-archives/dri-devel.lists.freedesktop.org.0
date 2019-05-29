Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680B2E8FA
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 01:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5CE6E118;
	Wed, 29 May 2019 23:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBCF6E0C2;
 Wed, 29 May 2019 23:24:04 +0000 (UTC)
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW7vL-0005Rq-9i; Wed, 29 May 2019 23:23:59 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hW7vI-0007xU-Pz; Wed, 29 May 2019 20:23:56 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 12/22] gpu: i915.rst: Fix references to renamed files
Date: Wed, 29 May 2019 20:23:43 -0300
Message-Id: <5ecde05364284f6845b651297fd9ce8225af2bcd.1559171394.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559171394.git.mchehab+samsung@kernel.org>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=101NUubdgdQ5XTreIrPkh1wQNPvLvYeTkirlA9vazw4=; b=cKuo/zXENJygACfL65gsogn05p
 6dIGhbpUvFYawarAVSJsma9Vw6fOxOHyu/mwvi/d2ZVecEoeeaXAA68FOLsQFeeOV7XdYvxNjX0mG
 cJWjhDNATPJktdkHX7JOxE9x+5obzsy0G37bhR67isEeziusXUCWAsMW5xJYOvnmCWIKtX3YX0nFG
 +uOIVLVbZWtqA5XFmDCrA2mzsR0DEPFuIK2HxD5Su9WXdseaROor5JXldCnoQ27RF6+oYgEbM4+vl
 jYF/RlcmyGsWvbMuxWI9Yeqrfic+T2ivdtVfxO8KlfDTkuM+xWP7oK+BX2V1mKaeooKXxyw+SEx0m
 nK53Q09w==;
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V0FSTklORzoga2VybmVsLWRvYyAnLi9zY3JpcHRzL2tlcm5lbC1kb2MgLXJzdCAtZW5hYmxlLWxp
bmVubyAtZnVuY3Rpb24gSGFyZHdhcmUgd29ya2Fyb3VuZHMgLi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pbnRlbF93b3JrYXJvdW5kcy5jJyBmYWlsZWQgd2l0aCByZXR1cm4gY29kZSAxCldBUk5JTkc6
IGtlcm5lbC1kb2MgJy4vc2NyaXB0cy9rZXJuZWwtZG9jIC1yc3QgLWVuYWJsZS1saW5lbm8gLWZ1
bmN0aW9uIExvZ2ljYWwgUmluZ3MsIExvZ2ljYWwgUmluZyBDb250ZXh0cyBhbmQgRXhlY2xpc3Rz
IC4vZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfbHJjLmMnIGZhaWxlZCB3aXRoIHJldHVybiBj
b2RlIDEKV0FSTklORzoga2VybmVsLWRvYyAnLi9zY3JpcHRzL2tlcm5lbC1kb2MgLXJzdCAtZW5h
YmxlLWxpbmVubyAtaW50ZXJuYWwgLi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9scmMuYycg
ZmFpbGVkIHdpdGggcmV0dXJuIGNvZGUgMgoKRml4ZXM6IDExMmVkMmQzMWE0NiAoImRybS9pOTE1
OiBNb3ZlIEdyYXBoaWNzVGVjaG5vbG9neSBmaWxlcyB1bmRlciBndC8iKQpTaWduZWQtb2ZmLWJ5
OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgotLS0K
IERvY3VtZW50YXRpb24vZ3B1L2k5MTUucnN0IHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9ncHUvaTkxNS5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS9pOTE1LnJzdAppbmRleCAwNTVkZjQ1
NTk2YzEuLjM4ZmVmZWI5OWJiYSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvaTkxNS5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvaTkxNS5yc3QKQEAgLTYxLDcgKzYxLDcgQEAgSW50
ZWwgR1ZULWcgSG9zdCBTdXBwb3J0KHZHUFUgZGV2aWNlIG1vZGVsKQogV29ya2Fyb3VuZHMKIC0t
LS0tLS0tLS0tCiAKLS4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF93
b3JrYXJvdW5kcy5jCisuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2Vs
ZnRlc3Rfd29ya2Fyb3VuZHMuYwogICAgOmRvYzogSGFyZHdhcmUgd29ya2Fyb3VuZHMKIAogRGlz
cGxheSBIYXJkd2FyZSBIYW5kbGluZwpAQCAtMzc5LDEwICszNzksMTAgQEAgVXNlciBCYXRjaGJ1
ZmZlciBFeGVjdXRpb24KIExvZ2ljYWwgUmluZ3MsIExvZ2ljYWwgUmluZyBDb250ZXh0cyBhbmQg
RXhlY2xpc3RzCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogCi0uLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfbHJjLmMK
Ky4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9scmMuYwogICAg
OmRvYzogTG9naWNhbCBSaW5ncywgTG9naWNhbCBSaW5nIENvbnRleHRzIGFuZCBFeGVjbGlzdHMK
IAotLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2xyYy5jCisuLiBr
ZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbHJjLmMKICAgIDppbnRl
cm5hbDoKIAogR2xvYmFsIEdUVCB2aWV3cwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
