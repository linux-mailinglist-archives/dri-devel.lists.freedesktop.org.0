Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A610B379
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 17:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BA26E54C;
	Wed, 27 Nov 2019 16:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CEA6E392;
 Wed, 27 Nov 2019 16:34:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:34:03 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; d="scan'208";a="234152321"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:33:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/13] media: constify fb ops across all drivers
Date: Wed, 27 Nov 2019 18:32:08 +0200
Message-Id: <2f8755b70308bf917c0ad8f5b6040fa2a4862b94.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Andy Walls <awalls@md.metrocast.net>, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, ivtv-devel@ivtvdriver.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25zdCwgd2Ug
Y2FuIHN0YXIgbWFraW5nCnRoZSBvcHMgY29uc3QgYXMgd2VsbC4KCkNjOiBIYW5zIFZlcmt1aWwg
PGh2ZXJrdWlsQHhzNGFsbC5ubD4KQ2M6IEFuZHkgV2FsbHMgPGF3YWxsc0BtZC5tZXRyb2Nhc3Qu
bmV0PgpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBpdnR2LWRldmVsQGl2dHZk
cml2ZXIub3JnClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5j
b20+Ci0tLQogZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2ZmIuYyAgICAgICAgICB8IDMgKy0t
CiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZpdmlkL3ZpdmlkLW9zZC5jIHwgMSAtCiAyIGZpbGVz
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGNpL2l2dHYvaXZ0dmZiLmMgYi9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2
dHZmYi5jCmluZGV4IDk1YTU2Y2NlOWI2NS4uZjI5MjJiNTU0YjA5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHZmYi5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGNpL2l2dHYv
aXZ0dmZiLmMKQEAgLTkyNSw3ICs5MjUsNyBAQCBzdGF0aWMgaW50IGl2dHZmYl9ibGFuayhpbnQg
YmxhbmtfbW9kZSwgc3RydWN0IGZiX2luZm8gKmluZm8pCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRp
YyBzdHJ1Y3QgZmJfb3BzIGl2dHZmYl9vcHMgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGZiX29w
cyBpdnR2ZmJfb3BzID0gewogCS5vd25lciA9IFRISVNfTU9EVUxFLAogCS5mYl93cml0ZSAgICAg
ICA9IGl2dHZmYl93cml0ZSwKIAkuZmJfY2hlY2tfdmFyICAgPSBpdnR2ZmJfY2hlY2tfdmFyLApA
QCAtMTA0OSw3ICsxMDQ5LDYgQEAgc3RhdGljIGludCBpdnR2ZmJfaW5pdF92aWRtb2RlKHN0cnVj
dCBpdnR2ICppdHYpCiAKIAlvaS0+aXZ0dmZiX2luZm8ubm9kZSA9IC0xOwogCW9pLT5pdnR2ZmJf
aW5mby5mbGFncyA9IEZCSU5GT19GTEFHX0RFRkFVTFQ7Ci0Jb2ktPml2dHZmYl9pbmZvLmZib3Bz
ID0gJml2dHZmYl9vcHM7CiAJb2ktPml2dHZmYl9pbmZvLnBhciA9IGl0djsKIAlvaS0+aXZ0dmZi
X2luZm8udmFyID0gb2ktPml2dHZmYl9kZWZpbmVkOwogCW9pLT5pdnR2ZmJfaW5mby5maXggPSBv
aS0+aXZ0dmZiX2ZpeDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdml2aWQv
dml2aWQtb3NkLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZpdmlkL3ZpdmlkLW9zZC5jCmlu
ZGV4IGYyZTc4OWJkZjRhNi4uMjE2MGE0ZDNjMmYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3ZpdmlkL3ZpdmlkLW9zZC5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
dml2aWQvdml2aWQtb3NkLmMKQEAgLTMxMSw3ICszMTEsNiBAQCBzdGF0aWMgaW50IHZpdmlkX2Zi
X2luaXRfdmlkbW9kZShzdHJ1Y3Qgdml2aWRfZGV2ICpkZXYpCiAKIAlkZXYtPmZiX2luZm8ubm9k
ZSA9IC0xOwogCWRldi0+ZmJfaW5mby5mbGFncyA9IEZCSU5GT19GTEFHX0RFRkFVTFQ7Ci0JZGV2
LT5mYl9pbmZvLmZib3BzID0gJnZpdmlkX2ZiX29wczsKIAlkZXYtPmZiX2luZm8ucGFyID0gZGV2
OwogCWRldi0+ZmJfaW5mby52YXIgPSBkZXYtPmZiX2RlZmluZWQ7CiAJZGV2LT5mYl9pbmZvLmZp
eCA9IGRldi0+ZmJfZml4OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
