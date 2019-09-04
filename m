Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980B8A9B66
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358B589E19;
	Thu,  5 Sep 2019 07:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38234899B5;
 Wed,  4 Sep 2019 09:14:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BBEF3AEB3;
 Wed,  4 Sep 2019 09:14:18 +0000 (UTC)
Date: Wed, 4 Sep 2019 11:14:27 +0200
From: Jean Delvare <jdelvare@suse.de>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/edid: no CEA v3 extension is not an error
Message-ID: <20190904111427.4474e9f8@endymion>
In-Reply-To: <20190904111152.266d5176@endymion>
References: <20190904111152.266d5176@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:13:21 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@linux.ie>, David@freedesktop.org,
	Zhou@freedesktop.org (ChunMing),
	"  <David1.Zhou@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo  Li  <sunpeng.li@amd.com>, Maarten Lankhorst   <maarten.lankhorst@linux.intel.com>, Maxime Ripard   <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Ville  =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,  Christian =?UTF-8?B?S8O2?= =?UTF-8?B?bmln?= <christian.koenig@amd.com>"@freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgZmluZSBmb3IgZGlzcGxheXMgd2l0aG91dCBhdWRpbyBmdW5jdGlvbmFsaXR5IHRvIG5v
dCBpbXBsZW1lbnQKQ0VBIHYzIGV4dGVuc2lvbiBpbiB0aGVpciBFRElELiBEbyBub3QgcmV0dXJu
IGFuIGVycm9yIGluIHRoYXQgY2FzZSwKaW5zdGVhZCByZXR1cm4gMCBhcyBpZiB0aGVyZSB3YXMg
YSBDRUEgdjMgZXh0ZW5zaW9uIHdpdGggbm8gYXVkaW8gb3IKc3BlYWtlciBibG9jay4KClRoaXMg
Zml4ZXMgaGFsZiBvZiBidWcgZmRvIzEwNzgyNToKaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9MTA3ODI1CgpTaWduZWQtb2ZmLWJ5OiBKZWFuIERlbHZhcmUgPGpk
ZWx2YXJlQHN1c2UuZGU+ClJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9v
dGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
LS0tCkNoYW5nZXMgc2luY2UgdjE6CiAqIFRyZWF0IENFQSBleHRlbnNpb24gdmVyc2lvbiA8IDMg
YXMgbm9uLWVycm9yIHRvbyAoc3VnZ2VzdGVkIGJ5IFZpbGxlCiAgIFN5cmrDpGzDpCkKCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8ICAgIDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgotLS0gbGludXgtNS4yLm9yaWcvZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMJMjAxOS0wOS0wMiAxMDoyMTowMS40OTU1MjU2NjMgKzAyMDAK
KysrIGxpbnV4LTUuMi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwkyMDE5LTA5LTA0IDEwOjMz
OjUxLjA4MDI3MzMzMSArMDIwMApAQCAtNDEzMCwxMiArNDEzMCwxMiBAQCBpbnQgZHJtX2VkaWRf
dG9fc2FkKHN0cnVjdCBlZGlkICplZGlkLCBzCiAJY2VhID0gZHJtX2ZpbmRfY2VhX2V4dGVuc2lv
bihlZGlkKTsKIAlpZiAoIWNlYSkgewogCQlEUk1fREVCVUdfS01TKCJTQUQ6IG5vIENFQSBFeHRl
bnNpb24gZm91bmRcbiIpOwotCQlyZXR1cm4gLUVOT0VOVDsKKwkJcmV0dXJuIDA7CiAJfQogCiAJ
aWYgKGNlYV9yZXZpc2lvbihjZWEpIDwgMykgewogCQlEUk1fREVCVUdfS01TKCJTQUQ6IHdyb25n
IENFQSByZXZpc2lvblxuIik7Ci0JCXJldHVybiAtRU5PVFNVUFA7CisJCXJldHVybiAwOwogCX0K
IAogCWlmIChjZWFfZGJfb2Zmc2V0cyhjZWEsICZzdGFydCwgJmVuZCkpIHsKQEAgLTQxOTEsMTIg
KzQxOTEsMTIgQEAgaW50IGRybV9lZGlkX3RvX3NwZWFrZXJfYWxsb2NhdGlvbihzdHJ1YwogCWNl
YSA9IGRybV9maW5kX2NlYV9leHRlbnNpb24oZWRpZCk7CiAJaWYgKCFjZWEpIHsKIAkJRFJNX0RF
QlVHX0tNUygiU0FEOiBubyBDRUEgRXh0ZW5zaW9uIGZvdW5kXG4iKTsKLQkJcmV0dXJuIC1FTk9F
TlQ7CisJCXJldHVybiAwOwogCX0KIAogCWlmIChjZWFfcmV2aXNpb24oY2VhKSA8IDMpIHsKIAkJ
RFJNX0RFQlVHX0tNUygiU0FEOiB3cm9uZyBDRUEgcmV2aXNpb25cbiIpOwotCQlyZXR1cm4gLUVO
T1RTVVBQOworCQlyZXR1cm4gMDsKIAl9CiAKIAlpZiAoY2VhX2RiX29mZnNldHMoY2VhLCAmc3Rh
cnQsICZlbmQpKSB7CgotLSAKSmVhbiBEZWx2YXJlClNVU0UgTDMgU3VwcG9ydApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
