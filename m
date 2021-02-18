Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F2531EBF0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 17:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD5C6EA32;
	Thu, 18 Feb 2021 16:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C31A6EA32;
 Thu, 18 Feb 2021 16:03:11 +0000 (UTC)
IronPort-SDR: k47qjrhTVfS//N5oCuyNE+NBPVgFA4mXdM+mZmuCXTl7CEhg8wzZilgjshaCx7XFSYTvepM/+S
 O6Y6YoctWJEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="183667229"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="183667229"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 08:03:09 -0800
IronPort-SDR: INchL6Jz7WFlP13lm0OqRD3Wuta7Se/Rvl690BHn/wX0LWcdCNswhzgZY3baTBv9tFHEh5f3QS
 xmOCQLrcj7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="400563729"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 18 Feb 2021 08:03:06 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Feb 2021 18:03:05 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/vblank: Do not store a new vblank timestamp in
 drm_vblank_restore()
Date: Thu, 18 Feb 2021 18:03:05 +0200
Message-Id: <20210218160305.16711-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204020400.29628-1-ville.syrjala@linux.intel.com>
References: <20210204020400.29628-1-ville.syrjala@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmRy
bV92YmxhbmtfcmVzdG9yZSgpIGV4aXN0cyBiZWNhdXNlIGNlcnRhaW4gcG93ZXIgc2F2aW5nIHN0
YXRlcwpjYW4gY2xvYmJlciB0aGUgaGFyZHdhcmUgZnJhbWUgY291bnRlci4gVGhlIHdheSBpdCBk
b2VzIHRoaXMgaXMKYnkgZ3Vlc3N0aW1hdGluZyBob3cgbWFueSBmcmFtZXMgd2VyZSBtaXNzZWQg
cHVyZWx5IGJhc2VkIG9uCnRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIGxhc3Qgc3RvcmVkIHRp
bWVzdGFtcCB2cy4gYSBuZXdseQpzYW1wbGVkIHRpbWVzdGFtcC4KCklmIHdlIHNob3VsZCBjYWxs
IHRoaXMgZnVuY3Rpb24gYmVmb3JlIGEgZnVsbCBmcmFtZSBoYXMKZWxhcHNlZCBzaW5jZSB3ZSBz
YW1wbGVkIHRoZSBsYXN0IHRpbWVzdGFtcCB3ZSB3b3VsZCBlbmQgdXAKd2l0aCBhIHBvc3NpYmx5
IHNsaWdodGx5IGRpZmZlcmVudCB0aW1lc3RhbXAgdmFsdWUgZm9yIHRoZQpzYW1lIGZyYW1lLiBD
dXJyZW50bHkgd2Ugd2lsbCBoYXBwaWx5IG92ZXJ3cml0ZSB0aGUgYWxyZWFkeQpzdG9yZWQgdGlt
ZXN0YW1wIGZvciB0aGUgZnJhbWUgd2l0aCB0aGUgbmV3IHZhbHVlLiBUaGlzCmNvdWxkIGNhdXNl
IHVzZXJzcGFjZSB0byBvYnNlcnZlIHR3byBkaWZmZXJlbnQgdGltZXN0YW1wcwpmb3IgdGhlIHNh
bWUgZnJhbWUgKGFuZCB0aGUgdGltZXN0YW1wIGNvdWxkIGV2ZW4gZ28KYmFja3dhcmRzIGRlcGVu
ZGluZyBvbiBob3cgbXVjaCBlcnJvciB3ZSBpbnRyb2R1Y2Ugd2hlbgpjb3JyZWN0aW5nIHRoZSB0
aW1lc3RhbXAgYmFzZWQgb24gdGhlIHNjYW5vdXQgcG9zaXRpb24pLgoKVG8gYXZvaWQgdGhhdCBs
ZXQncyBub3QgdXBkYXRlIHRoZSBzdG9yZWQgdGltZXN0YW1wIGF0IGFsbCwKYW5kIGluc3RlYWQg
d2UganVzdCBmaXggdXAgdGhlIGxhc3QgcmVjb3JkZWQgaHcgdmJsYW5rIGNvdW50ZXIKdmFsdWUg
c3VjaCB0aGF0IHRoZSBhbHJlYWR5IHN0b3JlZCB0aW1lc3RhbXAvc2VxIG51bWJlciB3aWxsCm1h
dGNoLiBUaHVzIHRoZSBuZXh0IHRpbWUgYSB2YmxhbmsgaXJxIGhhcHBlbnMgaXQgd2lsbCBjYWxj
dWxhdGUKdGhlIGNvcnJlY3QgZGlmZiBiZXR3ZWVuIHRoZSBjdXJyZW50IGFuZCBzdG9yZWQgaHcg
dmJsYW5rIGNvdW50ZXIKdmFsdWVzLgoKU2lkZW5vdGU6IEFub3RoZXIgcG9zc2libGUgaWRlYSB0
aGF0IGNhbWUgdG8gbWluZCB3b3VsZCBiZSB0bwpkbyB0aGlzIGNvcnJlY3Rpb24gb25seSBpZiB0
aGUgcG93ZXIgcmVhbGx5IHdhcyByZW1vdmVkIHNpbmNlCnRoZSBsYXN0IHRpbWUgd2Ugc2FtcGxl
ZCB0aGUgaHcgZnJhbWUgY291bnRlci4gQnV0IHRvIGRvIHRoYXQKd2Ugd291bGQgbmVlZCBhIHJv
YnVzdCB3YXkgdG8gZGV0ZWN0IHdoZW4gaXQgaGFzIG9jY3VycmVkLiBTb21lCnBvc3NpYmlsaXRp
ZXMgY291bGQgaW52b2x2ZSBzb21lIGtpbmQgb2YgaGFyZGFyZSBwb3dlciB3ZWxsCnRyYW5zaXRp
b24gY291bnRlciwgb3IgcG90ZW50aWFsbHkgd2UgY291bGQgc3RvcmUgYSBtYWdpYyB2YWx1ZQpp
biBhIHNjcmF0Y2ggcmVnaXN0ZXIgdGhhdCBsaXZlcyBpbiB0aGUgc2FtZSBwb3dlciB3ZWxsLiBC
dXQKSSdtIG5vdCBzdXJlIGVpdGhlciBvZiB0aG9zZSBleGlzdCwgc28gd291bGQgbmVlZCBhbiBh
Y3R1YWwKaW52ZXN0aWdhdGlvbiB0byBmaW5kIG91dC4gQWxsIG9mIHRoYXQgaXMgdmVyeSBoYXJk
d2FyZSBzcGVjaWZpYwpvZiBjb3Vyc2UsIHNvIHdvdWxkIGhhdmUgdG8gYmUgZG9uZSBpbiB0aGUg
ZHJpdmVyIGNvZGUuCgpDYzogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlh
bkBpbnRlbC5jb20+CkNjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
dmJsYW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCmluZGV4IDJiZDk4OTY4OGVh
ZS4uMzQxN2UxYWM3OTE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKQEAgLTE0NzgsNiArMTQ3OCw3IEBA
IHN0YXRpYyB2b2lkIGRybV92YmxhbmtfcmVzdG9yZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1
bnNpZ25lZCBpbnQgcGlwZSkKIAl1NjQgZGlmZl9uczsKIAl1MzIgY3VyX3ZibGFuaywgZGlmZiA9
IDE7CiAJaW50IGNvdW50ID0gRFJNX1RJTUVTVEFNUF9NQVhSRVRSSUVTOworCXUzMiBtYXhfdmJs
YW5rX2NvdW50ID0gZHJtX21heF92YmxhbmtfY291bnQoZGV2LCBwaXBlKTsKIAogCWlmIChkcm1f
V0FSTl9PTihkZXYsIHBpcGUgPj0gZGV2LT5udW1fY3J0Y3MpKQogCQlyZXR1cm47CkBAIC0xNTA0
LDcgKzE1MDUsNyBAQCBzdGF0aWMgdm9pZCBkcm1fdmJsYW5rX3Jlc3RvcmUoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUpCiAJZHJtX2RiZ192YmwoZGV2LAogCQkgICAg
Im1pc3NlZCAlZCB2YmxhbmtzIGluICVsbGQgbnMsIGZyYW1lIGR1cmF0aW9uPSVkIG5zLCBod19k
aWZmPSVkXG4iLAogCQkgICAgZGlmZiwgZGlmZl9ucywgZnJhbWVkdXJfbnMsIGN1cl92Ymxhbmsg
LSB2YmxhbmstPmxhc3QpOwotCXN0b3JlX3ZibGFuayhkZXYsIHBpcGUsIGRpZmYsIHRfdmJsYW5r
LCBjdXJfdmJsYW5rKTsKKwl2YmxhbmstPmxhc3QgPSAoY3VyX3ZibGFuayAtIGRpZmYpICYgbWF4
X3ZibGFua19jb3VudDsKIH0KIAogLyoqCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
