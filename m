Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA8955C75
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 01:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203246E162;
	Tue, 25 Jun 2019 23:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4CE896E7;
 Tue, 25 Jun 2019 23:41:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2019 16:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,417,1557212400"; d="scan'208";a="163762576"
Received: from dk-thinkpad-x260.jf.intel.com (HELO
 dk-ThinkPad-X260.fios-router.home) ([10.54.75.51])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jun 2019 16:41:09 -0700
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/connector: Allow max possible encoders to attach to a
 connector
Date: Tue, 25 Jun 2019 16:40:45 -0700
Message-Id: <20190625234045.31321-1-dhinakaran.pandiyan@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: dri-devel@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHdlIHJlc3RyaWN0IHRoZSBudW1iZXIgb2YgZW5jb2RlcnMgdGhhdCBjYW4gYmUg
bGlua2VkIHRvCmEgY29ubmVjdG9yIHRvIDMsIGluY3JlYXNlIGl0IHRvIG1hdGNoIHRoZSBtYXhp
bXVtIG51bWJlciBvZiBlbmNvZGVycwp0aGF0IGNhbiBiZSBpbml0aWFsaXplZCAtIDMyLiBUaGUg
Y3VycmVudCBsaW1pdGF0aW9uIGxvb2tzIGFydGlmaWNpYWwuCkluY3JlYXNpbmcgdGhlIGxpbWl0
IHRvIDMyIGRvZXMgaG93ZXZlciBpbmNyZWFzZXMgdGhlIHNpemUgb2YgdGhlIHN0YXRpYwp1MzIg
YXJyYXkga2VlcGluZyB0cmFjayBvZiB0aGUgZW5jb2RlciBJRHMuCgpDYzogSm9zw6kgUm9iZXJ0
byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBh
bmRpeWFuQGludGVsLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVj
dG9yLmgKaW5kZXggY2E3NDVkOWZlYWY1Li45MTQ1NWI0YTkzNjAgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvZHJtL2RybV9jb25uZWN0b3IuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgK
QEAgLTEyNzgsNyArMTI3OCw3IEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yIHsKIAkvKiogQG92ZXJy
aWRlX2VkaWQ6IGhhcyB0aGUgRURJRCBiZWVuIG92ZXJ3cml0dGVuIHRocm91Z2ggZGVidWdmcyBm
b3IgdGVzdGluZz8gKi8KIAlib29sIG92ZXJyaWRlX2VkaWQ7CiAKLSNkZWZpbmUgRFJNX0NPTk5F
Q1RPUl9NQVhfRU5DT0RFUiAzCisjZGVmaW5lIERSTV9DT05ORUNUT1JfTUFYX0VOQ09ERVIgMzIK
IAkvKioKIAkgKiBAZW5jb2Rlcl9pZHM6IFZhbGlkIGVuY29kZXJzIGZvciB0aGlzIGNvbm5lY3Rv
ci4gUGxlYXNlIG9ubHkgdXNlCiAJICogZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9l
bmNvZGVyKCkgdG8gZW51bWVyYXRlIHRoZXNlLgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
