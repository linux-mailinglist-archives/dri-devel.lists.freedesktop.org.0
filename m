Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B24329862
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 14:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8386E107;
	Fri, 24 May 2019 12:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201056E107
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:58:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2B8953082207;
 Fri, 24 May 2019 12:58:05 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-47.ams2.redhat.com
 [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBD426A964;
 Fri, 24 May 2019 12:58:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 1/2] drm: panel-orientation-quirks: Add quirk for GPD
 pocket2
Date: Fri, 24 May 2019 14:57:58 +0200
Message-Id: <20190524125759.14131-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 24 May 2019 12:58:13 +0000 (UTC)
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
YXRlZAp3aXRoIHNvbWUgZXh0cmEgYmlvcy1kYXRlcyBpbiB0aGUgZnV0dXJlLgoKQ2hhbmdlcyBp
biB2MjoKLUFkZCBvbmUgbW9yZSBrbm93biBCSU9TIGRhdGUgdG8gdGhlIGxpc3Qgb2YgQklPUyBk
YXRlcwoKQ2M6IEp1cmdlbiBLcmFtZXIgPGd0bWtyYW1lckB4czRhbGwubmw+ClJlcG9ydGVkLWJ5
OiBKdXJnZW4gS3JhbWVyIDxndG1rcmFtZXJAeHM0YWxsLm5sPgpTaWduZWQtb2ZmLWJ5OiBIYW5z
IGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
cGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMgfCAxNiArKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVs
X29yaWVudGF0aW9uX3F1aXJrcy5jCmluZGV4IDUyMWFmZjk5YjA4YS4uOTg2NzljODMxZjY2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKQEAg
LTUwLDYgKzUwLDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RtaV9wYW5lbF9vcmllbnRh
dGlvbl9kYXRhIGdwZF9wb2NrZXQgPSB7CiAJLm9yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxf
T1JJRU5UQVRJT05fUklHSFRfVVAsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kbWlf
cGFuZWxfb3JpZW50YXRpb25fZGF0YSBncGRfcG9ja2V0MiA9IHsKKwkud2lkdGggPSAxMjAwLAor
CS5oZWlnaHQgPSAxOTIwLAorCS5iaW9zX2RhdGVzID0gKGNvbnN0IGNoYXIgKiBjb25zdCBbXSl7
ICIwNi8yOC8yMDE4IiwgIjA4LzI4LzIwMTgiLAorCQkiMTIvMDcvMjAxOCIsIE5VTEwgfSwKKwku
b3JpZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9SSUdIVF9VUCwKK307CisK
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RtaV9wYW5lbF9vcmllbnRhdGlvbl9kYXRhIGdwZF93
aW4gPSB7CiAJLndpZHRoID0gNzIwLAogCS5oZWlnaHQgPSAxMjgwLApAQCAtMTEyLDYgKzEyMCwx
NCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgb3JpZW50YXRpb25fZGF0YVtd
ID0gewogCQkgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiRGVmYXVsdCBzdHJp
bmciKSwKIAkJfSwKIAkJLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmZ3BkX3BvY2tldCwKKwl9LCB7
CS8qIEdQRCBQb2NrZXQgMiAoZ2VuZXJpYyBzdHJpbmdzLCBhbHNvIG1hdGNoIG9uIGJpb3MgZGF0
ZSkgKi8KKwkJLm1hdGNoZXMgPSB7CisJCSAgRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9S
LCAiRGVmYXVsdCBzdHJpbmciKSwKKwkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFN
RSwgIkRlZmF1bHQgc3RyaW5nIiksCisJCSAgRE1JX0VYQUNUX01BVENIKERNSV9CT0FSRF9WRU5E
T1IsICJEZWZhdWx0IHN0cmluZyIpLAorCQkgIERNSV9FWEFDVF9NQVRDSChETUlfQk9BUkRfTkFN
RSwgIkRlZmF1bHQgc3RyaW5nIiksCisJCX0sCisJCS5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmdw
ZF9wb2NrZXQyLAogCX0sIHsJLyogR1BEIFdpbiAoc2FtZSBub3RlIG9uIERNSSBtYXRjaCBhcyBH
UEQgUG9ja2V0KSAqLwogCQkubWF0Y2hlcyA9IHsKIAkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX0JP
QVJEX1ZFTkRPUiwgIkFNSSBDb3Jwb3JhdGlvbiIpLAotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
