Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9273343758
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 16:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896C589AD2;
	Thu, 13 Jun 2019 14:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68F389AD2;
 Thu, 13 Jun 2019 14:49:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 07:49:46 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2019 07:49:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RESEND FOR CI] i915: no need to check return value of debugfs_create
 functions
Date: Thu, 13 Jun 2019 17:52:29 +0300
Message-Id: <20190613145229.21389-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: jani.nikula@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KCldo
ZW4gY2FsbGluZyBkZWJ1Z2ZzIGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8gbmVlZCB0byBldmVyIGNo
ZWNrIHRoZQpyZXR1cm4gdmFsdWUuICBUaGUgZnVuY3Rpb24gY2FuIHdvcmsgb3Igbm90LCBidXQg
dGhlIGNvZGUgbG9naWMgc2hvdWxkCm5ldmVyIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQgYmFzZWQg
b24gdGhpcy4KCkNjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgpD
YzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgpDYzog
Um9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzog
aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPgpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
aW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jIHwgMjAg
KysrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVi
dWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1Z2ZzLmMKaW5kZXggMzIzODYz
NTA0MTExLi40MTM4NmM4NmVhNjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jCkBA
IC00NDQyLDIzICs0NDQyLDE3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTkxNV9kZWJ1Z2ZzX2Zp
bGVzIHsKIGludCBpOTE1X2RlYnVnZnNfcmVnaXN0ZXIoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUg
KmRldl9wcml2KQogewogCXN0cnVjdCBkcm1fbWlub3IgKm1pbm9yID0gZGV2X3ByaXYtPmRybS5w
cmltYXJ5OwotCXN0cnVjdCBkZW50cnkgKmVudDsKIAlpbnQgaTsKIAotCWVudCA9IGRlYnVnZnNf
Y3JlYXRlX2ZpbGUoImk5MTVfZm9yY2V3YWtlX3VzZXIiLCBTX0lSVVNSLAotCQkJCSAgbWlub3It
PmRlYnVnZnNfcm9vdCwgdG9faTkxNShtaW5vci0+ZGV2KSwKLQkJCQkgICZpOTE1X2ZvcmNld2Fr
ZV9mb3BzKTsKLQlpZiAoIWVudCkKLQkJcmV0dXJuIC1FTk9NRU07CisJZGVidWdmc19jcmVhdGVf
ZmlsZSgiaTkxNV9mb3JjZXdha2VfdXNlciIsIFNfSVJVU1IsIG1pbm9yLT5kZWJ1Z2ZzX3Jvb3Qs
CisJCQkgICAgdG9faTkxNShtaW5vci0+ZGV2KSwgJmk5MTVfZm9yY2V3YWtlX2ZvcHMpOwogCiAJ
Zm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoaTkxNV9kZWJ1Z2ZzX2ZpbGVzKTsgaSsrKSB7Ci0J
CWVudCA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoaTkxNV9kZWJ1Z2ZzX2ZpbGVzW2ldLm5hbWUsCi0J
CQkJCSAgU19JUlVHTyB8IFNfSVdVU1IsCi0JCQkJCSAgbWlub3ItPmRlYnVnZnNfcm9vdCwKLQkJ
CQkJICB0b19pOTE1KG1pbm9yLT5kZXYpLAotCQkJCQkgIGk5MTVfZGVidWdmc19maWxlc1tpXS5m
b3BzKTsKLQkJaWYgKCFlbnQpCi0JCQlyZXR1cm4gLUVOT01FTTsKKwkJZGVidWdmc19jcmVhdGVf
ZmlsZShpOTE1X2RlYnVnZnNfZmlsZXNbaV0ubmFtZSwKKwkJCQkgICAgU19JUlVHTyB8IFNfSVdV
U1IsCisJCQkJICAgIG1pbm9yLT5kZWJ1Z2ZzX3Jvb3QsCisJCQkJICAgIHRvX2k5MTUobWlub3It
PmRldiksCisJCQkJICAgIGk5MTVfZGVidWdmc19maWxlc1tpXS5mb3BzKTsKIAl9CiAKIAlyZXR1
cm4gZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKGk5MTVfZGVidWdmc19saXN0LAotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
