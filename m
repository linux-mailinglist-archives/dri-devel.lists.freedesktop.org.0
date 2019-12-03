Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B01A311029E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48396EA08;
	Tue,  3 Dec 2019 16:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD966EA08;
 Tue,  3 Dec 2019 16:40:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:40:07 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="208503613"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:40:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 10/12] media: constify fb ops across all drivers
Date: Tue,  3 Dec 2019 18:38:52 +0200
Message-Id: <71794337f8611271f2c1fdb3882119a58e743a87.1575390741.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575390740.git.jani.nikula@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 ivtv-devel@ivtvdriver.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25zdCwgd2Ug
Y2FuIHN0YXJ0Cm1ha2luZyB0aGUgb3BzIGNvbnN0IGFzIHdlbGwuCgpSZW1vdmUgdGhlIHJlZHVu
ZGFudCBmYm9wcyBhc3NpZ25tZW50cyB3aGlsZSBhdCBpdC4KCnYyOgotIGFjdHVhbGx5IGFkZCBj
b25zdCBpbiB2aXZpZAotIGZpeCB0eXBvIChDaHJpc3RvcGhlIGRlIERpbmVjaGluKQoKQ2M6IEhh
bnMgVmVya3VpbCA8aHZlcmt1aWxAeHM0YWxsLm5sPgpDYzogQW5keSBXYWxscyA8YXdhbGxzQG1k
Lm1ldHJvY2FzdC5uZXQ+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGl2dHYt
ZGV2ZWxAaXZ0dmRyaXZlci5vcmcKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBp
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2ZmIuYyAgICAgICAgICB8
IDMgKy0tCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZpdmlkL3ZpdmlkLW9zZC5jIHwgMyArLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvcGNpL2l2dHYvaXZ0dmZiLmMgYi9kcml2ZXJzL21lZGlhL3Bj
aS9pdnR2L2l2dHZmYi5jCmluZGV4IDk1YTU2Y2NlOWI2NS4uZjI5MjJiNTU0YjA5IDEwMDY0NAot
LS0gYS9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHZmYi5jCisrKyBiL2RyaXZlcnMvbWVkaWEv
cGNpL2l2dHYvaXZ0dmZiLmMKQEAgLTkyNSw3ICs5MjUsNyBAQCBzdGF0aWMgaW50IGl2dHZmYl9i
bGFuayhpbnQgYmxhbmtfbW9kZSwgc3RydWN0IGZiX2luZm8gKmluZm8pCiAJcmV0dXJuIDA7CiB9
CiAKLXN0YXRpYyBzdHJ1Y3QgZmJfb3BzIGl2dHZmYl9vcHMgPSB7CitzdGF0aWMgY29uc3Qgc3Ry
dWN0IGZiX29wcyBpdnR2ZmJfb3BzID0gewogCS5vd25lciA9IFRISVNfTU9EVUxFLAogCS5mYl93
cml0ZSAgICAgICA9IGl2dHZmYl93cml0ZSwKIAkuZmJfY2hlY2tfdmFyICAgPSBpdnR2ZmJfY2hl
Y2tfdmFyLApAQCAtMTA0OSw3ICsxMDQ5LDYgQEAgc3RhdGljIGludCBpdnR2ZmJfaW5pdF92aWRt
b2RlKHN0cnVjdCBpdnR2ICppdHYpCiAKIAlvaS0+aXZ0dmZiX2luZm8ubm9kZSA9IC0xOwogCW9p
LT5pdnR2ZmJfaW5mby5mbGFncyA9IEZCSU5GT19GTEFHX0RFRkFVTFQ7Ci0Jb2ktPml2dHZmYl9p
bmZvLmZib3BzID0gJml2dHZmYl9vcHM7CiAJb2ktPml2dHZmYl9pbmZvLnBhciA9IGl0djsKIAlv
aS0+aXZ0dmZiX2luZm8udmFyID0gb2ktPml2dHZmYl9kZWZpbmVkOwogCW9pLT5pdnR2ZmJfaW5m
by5maXggPSBvaS0+aXZ0dmZiX2ZpeDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vdml2aWQvdml2aWQtb3NkLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZpdmlkL3Zpdmlk
LW9zZC5jCmluZGV4IGYyZTc4OWJkZjRhNi4uZmJhZWM4YWNjMTYxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3ZpdmlkL3ZpdmlkLW9zZC5jCisrKyBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vdml2aWQvdml2aWQtb3NkLmMKQEAgLTI0NCw3ICsyNDQsNyBAQCBzdGF0aWMgaW50
IHZpdmlkX2ZiX2JsYW5rKGludCBibGFua19tb2RlLCBzdHJ1Y3QgZmJfaW5mbyAqaW5mbykKIAly
ZXR1cm4gMDsKIH0KIAotc3RhdGljIHN0cnVjdCBmYl9vcHMgdml2aWRfZmJfb3BzID0geworc3Rh
dGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgdml2aWRfZmJfb3BzID0gewogCS5vd25lciA9IFRISVNf
TU9EVUxFLAogCS5mYl9jaGVja192YXIgICA9IHZpdmlkX2ZiX2NoZWNrX3ZhciwKIAkuZmJfc2V0
X3BhciAgICAgPSB2aXZpZF9mYl9zZXRfcGFyLApAQCAtMzExLDcgKzMxMSw2IEBAIHN0YXRpYyBp
bnQgdml2aWRfZmJfaW5pdF92aWRtb2RlKHN0cnVjdCB2aXZpZF9kZXYgKmRldikKIAogCWRldi0+
ZmJfaW5mby5ub2RlID0gLTE7CiAJZGV2LT5mYl9pbmZvLmZsYWdzID0gRkJJTkZPX0ZMQUdfREVG
QVVMVDsKLQlkZXYtPmZiX2luZm8uZmJvcHMgPSAmdml2aWRfZmJfb3BzOwogCWRldi0+ZmJfaW5m
by5wYXIgPSBkZXY7CiAJZGV2LT5mYl9pbmZvLnZhciA9IGRldi0+ZmJfZGVmaW5lZDsKIAlkZXYt
PmZiX2luZm8uZml4ID0gZGV2LT5mYl9maXg7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
