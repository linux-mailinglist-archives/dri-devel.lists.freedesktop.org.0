Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8463AA33E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 14:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E1B6E0AF;
	Thu,  5 Sep 2019 12:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DD46E0AF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 12:32:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2019 05:32:10 -0700
X-ExtLoopCount2: 2 from 10.237.72.174
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; d="scan'208";a="199271718"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 05 Sep 2019 05:32:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 Sep 2019 15:32:07 +0300
Resent-From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Resent-Date: Thu, 5 Sep 2019 15:32:07 +0300
Resent-Message-ID: <20190905123207.GJ7482@intel.com>
Resent-To: dri-devel@lists.freedesktop.org
X-Original-To: ville.syrjala@linux.intel.com
Delivered-To: ville.syrjala@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by stinkbox.fi.intel.com with IMAP (fetchmail-6.3.26)
 for <vsyrjala@localhost> (single-drop); Wed, 04 Sep 2019 19:27:16 +0300 (EEST)
Received: from orsmga002.jf.intel.com (orsmga002.jf.intel.com [10.7.209.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CD5FE58046E
 for <ville.syrjala@linux.intel.com>; Wed,  4 Sep 2019 09:26:30 -0700 (PDT)
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,467,1559545200"; d="scan'208";a="194788058"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 04 Sep 2019 09:26:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 04 Sep 2019 19:26:27 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/15] drm/edid: Add drm_hdmi_avi_infoframe_bars()
Date: Wed,  4 Sep 2019 19:26:11 +0300
Message-Id: <20190904162625.15048-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904162625.15048-1-ville.syrjala@linux.intel.com>
References: <20190904162625.15048-1-ville.syrjala@linux.intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
ZCBhIGZ1bmN0aW9uIHRvIGZpbGwgdGhlIEFWSSBpbmZvZnJhbWUgYmFyIGluZm9ybWF0aW9uIGZy
b20KdGhlIHN0YW5kYXJkIHR2IG1hcmdpbiBwcm9wZXJ0aWVzLgoKU2lnbmVkLW9mZi1ieTogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYyB8IDE3ICsrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9k
cm1fZWRpZC5oICAgICB8ICA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkLmMKaW5kZXggODJhNGNlZWQzZmNmLi4xZTE2ZWUyMGNkMzEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZC5jCkBAIC01MjgyLDYgKzUyODIsMjMgQEAgZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9xdWFu
dF9yYW5nZShzdHJ1Y3QgaGRtaV9hdmlfaW5mb2ZyYW1lICpmcmFtZSwKIH0KIEVYUE9SVF9TWU1C
T0woZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9xdWFudF9yYW5nZSk7CiAKKy8qKgorICogZHJtX2hk
bWlfYXZpX2luZm9mcmFtZV9iYXJzKCkgLSBmaWxsIHRoZSBIRE1JIEFWSSBpbmZvZnJhbWUKKyAq
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmFyIGluZm9ybWF0aW9uCisgKiBAZnJh
bWU6IEhETUkgQVZJIGluZm9mcmFtZQorICogQGNvbm5fc3RhdGU6IGNvbm5lY3RvciBzdGF0ZQor
ICovCit2b2lkCitkcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2JhcnMoc3RydWN0IGhkbWlfYXZpX2lu
Zm9mcmFtZSAqZnJhbWUsCisJCQkgICAgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUg
KmNvbm5fc3RhdGUpCit7CisJZnJhbWUtPnJpZ2h0X2JhciA9IGNvbm5fc3RhdGUtPnR2Lm1hcmdp
bnMucmlnaHQ7CisJZnJhbWUtPmxlZnRfYmFyID0gY29ubl9zdGF0ZS0+dHYubWFyZ2lucy5sZWZ0
OworCWZyYW1lLT50b3BfYmFyID0gY29ubl9zdGF0ZS0+dHYubWFyZ2lucy50b3A7CisJZnJhbWUt
PmJvdHRvbV9iYXIgPSBjb25uX3N0YXRlLT50di5tYXJnaW5zLmJvdHRvbTsKK30KK0VYUE9SVF9T
WU1CT0woZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9iYXJzKTsKKwogc3RhdGljIGVudW0gaGRtaV8z
ZF9zdHJ1Y3R1cmUKIHMzZF9zdHJ1Y3R1cmVfZnJvbV9kaXNwbGF5X21vZGUoY29uc3Qgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCiB7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
ZWRpZC5oIGIvaW5jbHVkZS9kcm0vZHJtX2VkaWQuaAppbmRleCBiOTcxOTQxOGMzZDIuLmUwNzAx
YjNkMzE5NCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2VkaWQuaAorKysgYi9pbmNsdWRl
L2RybS9kcm1fZWRpZC5oCkBAIC0zNjcsNiArMzY3LDEwIEBAIHZvaWQKIGRybV9oZG1pX2F2aV9p
bmZvZnJhbWVfY29sb3JzcGFjZShzdHJ1Y3QgaGRtaV9hdmlfaW5mb2ZyYW1lICpmcmFtZSwKIAkJ
CQkgIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlKTsKIAordm9p
ZAorZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9iYXJzKHN0cnVjdCBoZG1pX2F2aV9pbmZvZnJhbWUg
KmZyYW1lLAorCQkJICAgIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0
YXRlKTsKKwogdm9pZAogZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9xdWFudF9yYW5nZShzdHJ1Y3Qg
aGRtaV9hdmlfaW5mb2ZyYW1lICpmcmFtZSwKIAkJCQkgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yLAotLSAKMi4yMS4wCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
