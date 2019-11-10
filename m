Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8690F69D0
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 16:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF6B6E098;
	Sun, 10 Nov 2019 15:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C40A6E0A5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 15:41:15 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-c5qBTgbgPGClGcBueuGeKQ-1; Sun, 10 Nov 2019 10:41:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22A44107ACC4;
 Sun, 10 Nov 2019 15:41:09 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-82.ams2.redhat.com
 [10.36.116.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34913608BB;
 Sun, 10 Nov 2019 15:41:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 02/12] drm/modes: parse_cmdline: Make various char pointers
 const
Date: Sun, 10 Nov 2019 16:40:51 +0100
Message-Id: <20191110154101.26486-3-hdegoede@redhat.com>
In-Reply-To: <20191110154101.26486-1-hdegoede@redhat.com>
References: <20191110154101.26486-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: c5qBTgbgPGClGcBueuGeKQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573400474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VsmMxSAFwIKoui3iFOl5ZHgxudt4RqsqP0xF8mNwbQ=;
 b=HXH9BNZNx7wXj59rFur+ZnSwtYsKFHemd21apgo0CKMWWTN4u0jTWYYruELjaIEd9NweiR
 /opZ8y3tEC2LrIEWZ+8Hg85PskKBfV7Cd49He+q08OFPI+5AwIeKfOTb8m+ra8L3df18yD
 2fmcCSwqTMBQz97fDt2kEFbyp974unQ=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Mathieu=20Alexandre-T=C3=A9treault?= <alexandretm@amotus.ca>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgYXJlIG5vdCBzdXBwb3NlZCB0byBtb2RpZnkgdGhlIHBhc3NlZCBpbiBzdHJpbmcsIG1ha2Ug
Y2hhciBwb2ludGVycwp1c2VkIGluIGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfb3B0aW9ucygpIGNv
bnN0IGNoYXIgKiB3aGVyZSBwb3NzaWJsZS4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUg
PGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwg
MTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX21vZGVzLmMKaW5kZXggM2MzYzc0MzUyMjVmLi42NTRkNGI2ZmVjYjMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX21vZGVzLmMKQEAgLTE1OTEsMTUgKzE1OTEsMTUgQEAgc3RhdGljIGludCBkcm1fbW9k
ZV9wYXJzZV9jbWRsaW5lX2ludChjb25zdCBjaGFyICpkZWxpbSwgdW5zaWduZWQgaW50ICppbnRf
cmV0KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVf
b3B0aW9ucyhjaGFyICpzdHIsIHNpemVfdCBsZW4sCitzdGF0aWMgaW50IGRybV9tb2RlX3BhcnNl
X2NtZGxpbmVfb3B0aW9ucyhjb25zdCBjaGFyICpzdHIsIHNpemVfdCBsZW4sCiAJCQkJCSAgY29u
c3Qgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAkJCQkJICBzdHJ1Y3QgZHJtX2Nt
ZGxpbmVfbW9kZSAqbW9kZSkKIHsKIAl1bnNpZ25lZCBpbnQgZGVnLCBtYXJnaW4sIHJvdGF0aW9u
ID0gMDsKLQljaGFyICpzZXAgPSBzdHI7CisJY29uc3QgY2hhciAqc2VwID0gc3RyOwogCiAJd2hp
bGUgKChzZXAgPSBzdHJjaHIoc2VwLCAnLCcpKSkgewotCQljaGFyICpkZWxpbSwgKm9wdGlvbjsK
KwkJY29uc3QgY2hhciAqZGVsaW0sICpvcHRpb247CiAKIAkJb3B0aW9uID0gc2VwICsgMTsKIAkJ
ZGVsaW0gPSBzdHJjaHIob3B0aW9uLCAnPScpOwpAQCAtMTcxOCw4ICsxNzE4LDggQEAgYm9vbCBk
cm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICptb2Rl
X29wdGlvbiwKIAlib29sIG5hbWVkX21vZGUgPSBmYWxzZSwgcGFyc2VfZXh0cmFzID0gZmFsc2U7
CiAJdW5zaWduZWQgaW50IGJwcF9vZmYgPSAwLCByZWZyZXNoX29mZiA9IDAsIG9wdGlvbnNfb2Zm
ID0gMDsKIAl1bnNpZ25lZCBpbnQgbW9kZV9lbmQgPSAwOwotCWNoYXIgKmJwcF9wdHIgPSBOVUxM
LCAqcmVmcmVzaF9wdHIgPSBOVUxMLCAqZXh0cmFfcHRyID0gTlVMTDsKLQljaGFyICpvcHRpb25z
X3B0ciA9IE5VTEw7CisJY29uc3QgY2hhciAqYnBwX3B0ciA9IE5VTEwsICpyZWZyZXNoX3B0ciA9
IE5VTEwsICpleHRyYV9wdHIgPSBOVUxMOworCWNvbnN0IGNoYXIgKm9wdGlvbnNfcHRyID0gTlVM
TDsKIAljaGFyICpicHBfZW5kX3B0ciA9IE5VTEwsICpyZWZyZXNoX2VuZF9wdHIgPSBOVUxMOwog
CWludCByZXQ7CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
