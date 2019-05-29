Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 498832E557
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 21:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6A26E0A6;
	Wed, 29 May 2019 19:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832716E0A6;
 Wed, 29 May 2019 19:31:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 12:31:30 -0700
X-ExtLoop1: 1
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by fmsmga008.fm.intel.com with ESMTP; 29 May 2019 12:31:27 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm: Drop a redundant unused variable
Date: Thu, 30 May 2019 01:29:01 +0530
Message-Id: <1559159944-21103-2-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559159944-21103-1-git-send-email-uma.shankar@intel.com>
References: <1559159944-21103-1-git-send-email-uma.shankar@intel.com>
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, emil.l.velikov@gmail.com,
 Uma Shankar <uma.shankar@intel.com>, seanpaul@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCBhIHJlZHVuZGFudCBhbmQgdW51c2VkIHZhcmlhYmxlICJoZHJfb3V0cHV0X21ldGFkYXRh
IiBmcm9tCmRybV9jb25uZWN0b3IuCgpTdWdnZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVs
LmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCAyIC0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY29ubmVj
dG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKaW5kZXggZjhmNDAwMy4uNTQ3NjU2
MSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCisrKyBiL2luY2x1ZGUv
ZHJtL2RybV9jb25uZWN0b3IuaApAQCAtMTI0NCw4ICsxMjQ0LDYgQEAgc3RydWN0IGRybV9jb25u
ZWN0b3IgewogCSAqLwogCXN0cnVjdCBsbGlzdF9ub2RlIGZyZWVfbm9kZTsKIAotCS8qIEhEUiBt
ZXRkYXRhICovCi0Jc3RydWN0IGhkcl9vdXRwdXRfbWV0YWRhdGEgaGRyX291dHB1dF9tZXRhZGF0
YTsKIAlzdHJ1Y3QgaGRyX3NpbmtfbWV0YWRhdGEgaGRyX3NpbmtfbWV0YWRhdGE7CiB9OwogCi0t
IAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
