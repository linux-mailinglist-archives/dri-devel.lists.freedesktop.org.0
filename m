Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E385E1CD83
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 19:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E13989308;
	Tue, 14 May 2019 17:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D5989307;
 Tue, 14 May 2019 17:09:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 10:09:45 -0700
X-ExtLoop1: 1
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by fmsmga005.fm.intel.com with ESMTP; 14 May 2019 10:09:42 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [v10 05/12] drm/i915: Attach HDR metadata property to connector
Date: Tue, 14 May 2019 23:06:27 +0530
Message-Id: <1557855394-12214-6-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557855394-12214-1-git-send-email-uma.shankar@intel.com>
References: <1557855394-12214-1-git-send-email-uma.shankar@intel.com>
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

QXR0YWNoIEhEUiBtZXRhZGF0YSBwcm9wZXJ0eSB0byBjb25uZWN0b3Igb2JqZWN0LgoKdjI6IFJl
YmFzZQoKdjM6IFVwZGF0ZWQgdGhlIHByb3BlcnR5IG5hbWUgYXMgcGVyIHVwZGF0ZWQgbmFtZQp3
aGlsZSBjcmVhdGluZyBoZHIgbWV0YWRhdGEgcHJvcGVydHkKClNpZ25lZC1vZmYtYnk6IFVtYSBT
aGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBTaGFzaGFuayBTaGFy
bWEgPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
aW50ZWxfaGRtaS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkbWkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX2hkbWkuYwppbmRleCAyYTQwODZjLi45MjU5N2Q4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfaGRtaS5jCkBAIC0yNzI0LDYgKzI3MjQsOCBAQCBzdGF0aWMgdm9pZCBpbnRl
bF9oZG1pX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAogCWRybV9j
b25uZWN0b3JfYXR0YWNoX2NvbnRlbnRfdHlwZV9wcm9wZXJ0eShjb25uZWN0b3IpOwogCWNvbm5l
Y3Rvci0+c3RhdGUtPnBpY3R1cmVfYXNwZWN0X3JhdGlvID0gSERNSV9QSUNUVVJFX0FTUEVDVF9O
T05FOworCWRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5KCZjb25uZWN0b3ItPmJhc2UsCisJCQkJ
ICAgY29ubmVjdG9yLT5kZXYtPm1vZGVfY29uZmlnLmhkcl9vdXRwdXRfbWV0YWRhdGFfcHJvcGVy
dHksIDApOwogCiAJaWYgKCFIQVNfR01DSChkZXZfcHJpdikpCiAJCWRybV9jb25uZWN0b3JfYXR0
YWNoX21heF9icGNfcHJvcGVydHkoY29ubmVjdG9yLCA4LCAxMik7Ci0tIAoxLjkuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
