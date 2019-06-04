Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD31349EA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BDF8972D;
	Tue,  4 Jun 2019 14:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A258972D;
 Tue,  4 Jun 2019 14:18:12 +0000 (UTC)
Received: from [179.182.172.34] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYAGH-0001Rs-VW; Tue, 04 Jun 2019 14:18:01 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hYAGE-0002l7-Mq; Tue, 04 Jun 2019 11:17:58 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 08/22] gpu: i915.rst: Fix references to renamed files
Date: Tue,  4 Jun 2019 11:17:42 -0300
Message-Id: <bd7dd29b9fb2101c954c8cfb2c3b4efc7d277045.1559656538.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559656538.git.mchehab+samsung@kernel.org>
References: <cover.1559656538.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kjhz9ZDClKO+GVwWomvO0sdT8nN7V5kJ8pUXdG9VfXk=; b=JTYXEHZMLzldK0P3t1DJm7x6nb
 BQmvT1qrKWPVRiEbb53beHUKHD30P1fdTUfE0YObx5pm6PM+ksAgw35d0J3/9gTMHsm5TFTEsajWy
 60UoXiA/rNuU+y+k99eOJadMchlmm4pSTkYo7UancRfAKIyHzPvk5kwCMJ3sJ+pJ2Y7iaCBL/Iems
 FrwZ4B+lpEg1lLmiAF979ZFmN6zicC33fN8sPhNdztaXa+vP6Rfrjl0FUBCYlkwUZhIlDRFHW3LuD
 yhi4IUPvVHEMRbwoW+WyuZPiMAgeqrrqKj5eZe/J8yJZJUq4wXroABdmkCPrNmtXeuppgD+x1fawI
 9kHZ5WDQ==;
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
Cc: Jonathan Corbet <corbet@lwn.net>, Maxime Ripard <maxime.ripard@bootlin.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
NTk2YzEuLjZjNzUzODBiMjkyOCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvaTkxNS5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvaTkxNS5yc3QKQEAgLTYxLDcgKzYxLDcgQEAgSW50
ZWwgR1ZULWcgSG9zdCBTdXBwb3J0KHZHUFUgZGV2aWNlIG1vZGVsKQogV29ya2Fyb3VuZHMKIC0t
LS0tLS0tLS0tCiAKLS4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF93
b3JrYXJvdW5kcy5jCisuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50
ZWxfd29ya2Fyb3VuZHMuYwogICAgOmRvYzogSGFyZHdhcmUgd29ya2Fyb3VuZHMKIAogRGlzcGxh
eSBIYXJkd2FyZSBIYW5kbGluZwpAQCAtMzc5LDEwICszNzksMTAgQEAgVXNlciBCYXRjaGJ1ZmZl
ciBFeGVjdXRpb24KIExvZ2ljYWwgUmluZ3MsIExvZ2ljYWwgUmluZyBDb250ZXh0cyBhbmQgRXhl
Y2xpc3RzCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogCi0uLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfbHJjLmMKKy4u
IGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9scmMuYwogICAgOmRv
YzogTG9naWNhbCBSaW5ncywgTG9naWNhbCBSaW5nIENvbnRleHRzIGFuZCBFeGVjbGlzdHMKIAot
Li4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2xyYy5jCisuLiBrZXJu
ZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbHJjLmMKICAgIDppbnRlcm5h
bDoKIAogR2xvYmFsIEdUVCB2aWV3cwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
