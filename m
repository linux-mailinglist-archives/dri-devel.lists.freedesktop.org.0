Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A856044AF2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93F0897C8;
	Thu, 13 Jun 2019 18:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E667897D7;
 Thu, 13 Jun 2019 18:43:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 11:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,369,1557212400"; d="scan'208";a="184711197"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 13 Jun 2019 11:43:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Jun 2019 21:43:35 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 0/2] drm: PATH prop for all connectors?
Date: Thu, 13 Jun 2019 21:43:33 +0300
Message-Id: <20190613184335.7970-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkhl
cmUncyBhIHBvc3NpYmxlIGFwcG9yb2FjaCBmb3IgcHJvdmlkaW5nIHVzZXJzcGFjZSB3aXRoCnNv
bWUgc3RhYmxlIGNvbm5lY3RvciBpZGVudGlmaWVycy4gQ29tYmluZSB3aXRoIHRoZSBidXMKbmFt
ZSBvZiB0aGUgR1BVIGFuZCB5b3Ugc2hvdWxkIGhhdmUgc29tZSBraW5kIG9mIHJlYWwKcGh5c2lj
YWwgcGF0aCBkZXNjcmlwdGlvbi4gVW5mb3J0dW5hdGVseSB0aGUgc2hpcCBoYXMKc2FpbGVkIGZv
ciBNU1QgY29ubmVjdG9ycyBiZWNhdXNlIHVzZXJzcGFjZSBpcyBhbHJlYWR5CnBhcnNpbmcgdGhl
IHByb3BlcnR5IGFuZCBleHBlY3RzIHRvIGZpbmQgY2VydGFpbiB0aGluZ3MKdGhlcmUuIFNvIGlm
IHdlIHdhbnQgc3RhYmxlIG5hbWVzIGZvciB0aG9zZSB3ZSdkIHByb2JhYmx5CmhhdmUgaW50cm9k
dWNlIGFub3RoZXIgUEFUSCBwcm9wIChQSFlTX1BBVEg/KS4KCkkgc3VwcG9zZSBvbmUgYWx0ZXJu
YXRpdmUgd291bGQgdG8gbWFrZSB0aGUgY29ubmVjdG9yIAp0eXBlX2lkIHN0YWJsZS4gQ3VycmVu
dGx5IHRoYXQgaXMgYmVpbmcgcG9wdWxhdGVkIGJ5IGRybSAKY29yZSBhbmQgaXQncyBqdXN0IGEg
Z2xvYmFsIGNvdW50ZXIuIE5vdCBzdXJlIGhvdyBiYWRseQp0aGluZ3Mgd291bGQgdHVybiBvdXQg
aWYgd2UnZCBhbGxvdyBlYWNoIGRyaXZlciB0byBzZXQKdGhhdC4gSXQgY291bGQgcmVzdWx0IGlu
IGNvbmZsaWN0aW5nIHhyYW5kciBjb25uZWN0b3IKbmFtZXMgYmV0d2VlbiBkaWZmZXJlbnQgR1BV
cyB3aGljaCBJIHN1cHBvc2Ugd291bGQKY29uZnVzZSBleGlzdGluZyB1c2Vyc3BhY2U/CgpDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogUGVra2EgUGFhbGFuZW4gPHBwYWFs
YW5lbkBnbWFpbC5jb20+CkNjOiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+CgpW
aWxsZSBTeXJqw6Rsw6QgKDIpOgogIGRybTogSW1wcm92ZSBQQVRIIHByb3AgZG9jcwogIGRybS9p
OTE1OiBQb3B1bGF0ZSBQQVRIIHByb3AgZm9yIGV2ZXJ5IGNvbm5lY3RvcgoKIGRyaXZlcnMvZ3B1
L2RybS9kcm1fY29ubmVjdG9yLmMgICAgICAgIHwgMTMgKysrKysrKystLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaWNsX2RzaS5jICAgICAgICAgfCAgMyArKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2ludGVsX2Nvbm5lY3Rvci5jIHwgMjAgKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9jb25uZWN0b3IuaCB8ICAzICsrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfY3J0LmMgICAgICAgfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHAuYyAg
ICAgICAgfCAgNiArKysrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHBfbXN0LmMgICAg
fCAgMyArLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2R2by5jICAgICAgIHwgIDMgKysr
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1pLmMgICAgICB8ICA0ICsrKwogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaW50ZWxfbHZkcy5jICAgICAgfCAgMiArKwogZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfc2R2by5jICAgICAgfCAzNSArKysrKysrKysrKysrKysrKystLS0tLS0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfdHYuYyAgICAgICAgfCAgMiArKwogZHJpdmVycy9n
cHUvZHJtL2k5MTUvdmx2X2RzaS5jICAgICAgICAgfCAgMyArKysKIDEzIGZpbGVzIGNoYW5nZWQs
IDgzIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
