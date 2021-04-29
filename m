Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3727336E91A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 12:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F65F6EE10;
	Thu, 29 Apr 2021 10:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A717B6EE0C;
 Thu, 29 Apr 2021 10:51:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F011B02C;
 Thu, 29 Apr 2021 10:51:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk
Subject: [PATCH v8 2/5] drm/i915/gt: Remove reference to struct drm_device.pdev
Date: Thu, 29 Apr 2021 12:50:58 +0200
Message-Id: <20210429105101.25667-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429105101.25667-1-tzimmermann@suse.de>
References: <20210429105101.25667-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVmZXJlbmNlcyB0byBzdHJ1Y3QgZHJtX2RldmljZS5wZGV2IHNob3VsZCBub3QgYmUgdXNlZCBh
bnkgbG9uZ2VyIGFzCnRoZSBmaWVsZCB3aWxsIGJlIG1vdmVkIGludG8gdGhlIHN0cnVjdCdzIGxl
Z2FjeSBzZWN0aW9uLiBBZGQgYSBmaXgKZm9yIHRoZSByc3AgY29tbWl0LgoKdjg6CgkqIGZpeCBj
b21taXQgbWVzc2FnZSAoTWljaGFlbCkKClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgpGaXhlczogYTUwY2EzOWZiZDAxICgiZHJtL2k5MTU6IHNl
dHVwIHRoZSBMTUVNIHJlZ2lvbiIpCkNjOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hp
QGludGVsLmNvbT4KQ2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4Lmlu
dGVsLmNvbT4KQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KQ2M6IE1h
dHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KQ2M6IEphbmkgTmlrdWxhIDxqYW5p
Lm5pa3VsYUBpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgpDYzogRGFuaWVsZSBDZXJhb2xv
IFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4KQ2M6IE1pa2EgS3VvcHBh
bGEgPG1pa2Eua3VvcHBhbGFAbGludXguaW50ZWwuY29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IFZlbmthdGEgU2FuZGVlcCBE
aGFuYWxha290YSA8dmVua2F0YS5zLmRoYW5hbGFrb3RhQGludGVsLmNvbT4KQ2M6ICJNaWNoYcWC
IFdpbmlhcnNraSIgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX3JlZ2lvbl9sbWVtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF9yZWdpb25fbG1lbS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
aW50ZWxfcmVnaW9uX2xtZW0uYwppbmRleCBiZTZmMmM4ZjUxODQuLjczZmNlYjBjMjVmYyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmVnaW9uX2xtZW0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9yZWdpb25fbG1lbS5jCkBAIC0xNzcsNyAr
MTc3LDcgQEAgc3RhdGljIHN0cnVjdCBpbnRlbF9tZW1vcnlfcmVnaW9uICpzZXR1cF9sbWVtKHN0
cnVjdCBpbnRlbF9ndCAqZ3QpCiB7CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBn
dC0+aTkxNTsKIAlzdHJ1Y3QgaW50ZWxfdW5jb3JlICp1bmNvcmUgPSBndC0+dW5jb3JlOwotCXN0
cnVjdCBwY2lfZGV2ICpwZGV2ID0gaTkxNS0+ZHJtLnBkZXY7CisJc3RydWN0IHBjaV9kZXYgKnBk
ZXYgPSB0b19wY2lfZGV2KGk5MTUtPmRybS5kZXYpOwogCXN0cnVjdCBpbnRlbF9tZW1vcnlfcmVn
aW9uICptZW07CiAJcmVzb3VyY2Vfc2l6ZV90IGlvX3N0YXJ0OwogCXJlc291cmNlX3NpemVfdCBs
bWVtX3NpemU7Ci0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
