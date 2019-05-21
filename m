Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F725383
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 17:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09C38925F;
	Tue, 21 May 2019 15:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B528925F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 15:07:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B7E9010C94;
 Tue, 21 May 2019 15:07:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-25.ams2.redhat.com
 [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BED9F60FD1;
 Tue, 21 May 2019 15:07:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm: panel-orientation-quirks: Add quirk for GPD pocket2
Date: Tue, 21 May 2019 17:07:31 +0200
Message-Id: <20190521150731.16516-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 21 May 2019 15:07:38 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 Jurgen Kramer <gtmkramer@xs4all.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R1BEIGhhcyBkb25lIGl0IGFnYWluLCBtYWtlIGEgbmljZSBkZXZpY2UgKGdvb2QpLCB1c2Ugd2F5
IHRvbyBnZW5lcmljCkRNSSBzdHJpbmdzIChiYWQpIGFuZCB1c2UgYSBwb3J0cmFpdCBzY3JlZW4g
cm90YXRlZCA5MCBkZWdyZWVzICh1Z2x5KS4KCkJlY2F1c2Ugb2YgdGhlIHRvbyBnZW5lcmljIERN
SSBzdHJpbmdzIHRoaXMgZW50cnkgaXMgYWxzbyBkb2luZyBiaW9zLWRhdGUKbWF0Y2hpbmcsIHNv
IHRoZSBncGRfcG9ja2V0MiBkYXRhIHN0cnVjdCBtYXkgdmVyeSB3ZWxsIG5lZWQgdG8gYmUgdXBk
YXRlZAp3aXRoIHNvbWUgZXh0cmEgYmlvcy1kYXRlcyBpbiB0aGUgZnV0dXJlLgoKQ2M6IEp1cmdl
biBLcmFtZXIgPGd0bWtyYW1lckB4czRhbGwubmw+ClJlcG9ydGVkLWJ5OiBKdXJnZW4gS3JhbWVy
IDxndG1rcmFtZXJAeHM0YWxsLm5sPgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRp
b25fcXVpcmtzLmMgfCAxNiArKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50
YXRpb25fcXVpcmtzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1
aXJrcy5jCmluZGV4IDUyZTQ0NWJiMWFhNS4uYjgwNzliOTk1ZDk3IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKQEAgLTUwLDYgKzUwLDE0IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RtaV9wYW5lbF9vcmllbnRhdGlvbl9kYXRhIGdwZF9w
b2NrZXQgPSB7CiAJLm9yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fUklH
SFRfVVAsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kbWlfcGFuZWxfb3JpZW50YXRp
b25fZGF0YSBncGRfcG9ja2V0MiA9IHsKKwkud2lkdGggPSAxMjAwLAorCS5oZWlnaHQgPSAxOTIw
LAorCS5iaW9zX2RhdGVzID0gKGNvbnN0IGNoYXIgKiBjb25zdCBbXSl7ICIwOC8yOC8yMDE4Iiwg
IjEyLzA3LzIwMTgiLAorCQlOVUxMIH0sCisJLm9yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxf
T1JJRU5UQVRJT05fUklHSFRfVVAsCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kbWlf
cGFuZWxfb3JpZW50YXRpb25fZGF0YSBncGRfd2luID0gewogCS53aWR0aCA9IDcyMCwKIAkuaGVp
Z2h0ID0gMTI4MCwKQEAgLTEwNiw2ICsxMTQsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlf
c3lzdGVtX2lkIG9yaWVudGF0aW9uX2RhdGFbXSA9IHsKIAkJICBETUlfRVhBQ1RfTUFUQ0goRE1J
X1BST0RVQ1RfTkFNRSwgIkRlZmF1bHQgc3RyaW5nIiksCiAJCX0sCiAJCS5kcml2ZXJfZGF0YSA9
ICh2b2lkICopJmdwZF9wb2NrZXQsCisJfSwgewkvKiBHUEQgUG9ja2V0IDIgKGdlbmVyaWMgc3Ry
aW5ncywgYWxzbyBtYXRjaCBvbiBiaW9zIGRhdGUpICovCisJCS5tYXRjaGVzID0geworCQkgIERN
SV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkRlZmF1bHQgc3RyaW5nIiksCisJCSAgRE1J
X0VYQUNUX01BVENIKERNSV9QUk9EVUNUX05BTUUsICJEZWZhdWx0IHN0cmluZyIpLAorCQkgIERN
SV9FWEFDVF9NQVRDSChETUlfQk9BUkRfVkVORE9SLCAiRGVmYXVsdCBzdHJpbmciKSwKKwkJICBE
TUlfRVhBQ1RfTUFUQ0goRE1JX0JPQVJEX05BTUUsICJEZWZhdWx0IHN0cmluZyIpLAorCQl9LAor
CQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZncGRfcG9ja2V0MiwKIAl9LCB7CS8qIEdQRCBXaW4g
KHNhbWUgbm90ZSBvbiBETUkgbWF0Y2ggYXMgR1BEIFBvY2tldCkgKi8KIAkJLm1hdGNoZXMgPSB7
CiAJCSAgRE1JX0VYQUNUX01BVENIKERNSV9CT0FSRF9WRU5ET1IsICJBTUkgQ29ycG9yYXRpb24i
KSwKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
