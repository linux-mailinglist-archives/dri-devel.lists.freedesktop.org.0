Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C59284A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8AA89B9E;
	Mon, 19 Aug 2019 15:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4E889A1F;
 Mon, 19 Aug 2019 15:24:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 08:24:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; d="scan'208";a="182898164"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga006.jf.intel.com with ESMTP; 19 Aug 2019 08:24:46 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sharma Shashank <shashank.sharma@intel.com>
Subject: [PATCH v6 0/3] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Date: Mon, 19 Aug 2019 20:54:09 +0530
Message-Id: <20190819152412.21318-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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

RW5hYmxpbmcgdGhlIEhEQ1AxLjQgYW5kIDIuMiBvbiBUR0wgYnkgc3VwcG9ydGluZyB0aGUgSFcg
YmxvY2sgbW92ZW1lbnQKZnJvbSBEREkgaW50byB0cmFuc2NvZGVyLgoKdjY6CiAgRXh0ZW5kaW5n
IHRoZSBJOTE1LU1FSSBIRENQIGludGVyZmFjZSB0byBpbmNsdWRlIHRoZSB0cmFuc2NvZGVyLgog
IEZvciByZWdpc3RlciBwcm9ncmFtbWluZywgdHJhbnNjb2RlciBpcyB1c2VkIGluc3RlYWQgb2Yg
UElQRS4gSnVzdAoJcmVhZGFiaWxpdHkgaW1wcm92ZW1lbnQKICBwaXBlIGFuZCB0cmFuc2NvZGVy
IGRlZmluaXRpb24gaXMgbW92ZWQgaW50byBpOTE1X2RybS5oCgpSYW1hbGluZ2FtIEMgKDMpOgog
IGRybS9pOTE1OiBlbnVtIHRyYW5zY29kZXIgYW5kIHBpcGUgYXJlIG1vdmVkIGludG8gaTkxNV9k
cm0uaAogIG1pc2MvbWVpX2hkY3A6IEFkZGluZyB0aGUgdHJhbnNjb2RlciBkZXRhaWwgaW4gcGF5
bG9hZCBpbnB1dAogIGRybS9pOTE1OiBFbmFibGUgSERDUCAxLjQgYW5kIDIuMiBvbiBHZW4xMisK
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuaCB8ICA0NCAtLS0t
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgICAgfCAgIDMgKwog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMgICAgfCAxNjAgKysrKysr
KysrKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmgg
ICAgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgICAg
fCAgMTIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAgICAgIHwg
MTI0ICsrKysrKysrKysrKy0tCiBkcml2ZXJzL21pc2MvbWVpL2hkY3AvbWVpX2hkY3AuYyAgICAg
ICAgICAgICB8ICAyNyArKysrCiBkcml2ZXJzL21pc2MvbWVpL2hkY3AvbWVpX2hkY3AuaCAgICAg
ICAgICAgICB8ICAxNSArLQogaW5jbHVkZS9kcm0vaTkxNV9kcm0uaCAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNDYgKysrKysrCiBpbmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5o
ICAgICAgICB8ICAgMiArCiAxMCBmaWxlcyBjaGFuZ2VkLCAzMjYgaW5zZXJ0aW9ucygrKSwgMTA5
IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
