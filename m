Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D9B7DA75
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 13:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936BD6E4DE;
	Thu,  1 Aug 2019 11:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC026E4DD;
 Thu,  1 Aug 2019 11:41:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 04:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,334,1559545200"; d="scan'208";a="256622151"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga001.jf.intel.com with ESMTP; 01 Aug 2019 04:41:23 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v12 0/6] HDCP2.2 Phase II
Date: Thu,  1 Aug 2019 17:11:13 +0530
Message-Id: <20190801114119.28830-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.19.1
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
Cc: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2VyaWVzIGFkZHMgdGhlIGNvbnRlbnRfdHlwZSBzdXBwb3J0IGZvciBIRENQMi4yLiBBbG9uZyB3
aXRoIHRoYXQgdWV2ZW50CmlzIHNlbnQgZm9yIGVhY2ggSERDUCBzdGF0ZSBjaGFuZ2UgdHJpZ2dl
cmVkIHdpdGhpbiBrZXJuZWwuCgpQZWtrYSBoYXZlIGNvbXBsZXRlZCB0aGUgV2VzdG9uIERSTS1i
YWNrZW5kIHJldmlldyBpbgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93
ZXN0b24vbWVyZ2VfcmVxdWVzdHMvNDgKYW5kIHRoZSBVQVBJIGZvciBIRENQIDIuMiBsb29rcyBn
b29kLgoKVGhlIHVzZXJzcGFjZSBpcyBhY2NlcHRlZCBpbiBXZXN0b24uCgp2MTI6CiAgRFJNX01P
REVfSERDUF9DT05URU5UX1RZUEV4IGRlZmluaXRpb24gYXJlIG1vdmVkIGludG8gZHJtX2hkY3Au
aApbcGVra2FdCiAgUGlja2VkIEFja2VkLWJ5IGFuZCBSLWJ5IGZyb20gcmV2aWV3ZXJzLgoKVGVz
dC13aXRoOiA8MjAxOTA3MDMwOTU0NDYuMTQwOTItMi1yYW1hbGluZ2FtLmNAaW50ZWwuY29tPgoK
UmFtYWxpbmdhbSBDICg2KToKICBkcm06IEFkZCBDb250ZW50IHByb3RlY3Rpb24gdHlwZSBwcm9w
ZXJ0eQogIGRybS9pOTE1OiBBdHRhY2ggY29udGVudCB0eXBlIHByb3BlcnR5CiAgZHJtOiB1ZXZl
bnQgZm9yIGNvbm5lY3RvciBzdGF0dXMgY2hhbmdlCiAgZHJtL2hkY3A6IHVwZGF0ZSBjb250ZW50
IHByb3RlY3Rpb24gcHJvcGVydHkgd2l0aCB1ZXZlbnQKICBkcm0vaTkxNTogdXBkYXRlIHRoZSBo
ZGNwIHN0YXRlIHdpdGggdWV2ZW50CiAgZHJtL2hkY3A6IHJlZmVyZW5jZSBmb3Igc3JtIGZpbGUg
Zm9ybWF0CgogZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jICAgICAgICAgfCAgNCAr
KwogZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyAgICAgICAgICAgfCA2OCArKysrKysr
KysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL2RybV9oZGNwLmMgICAgICAgICAgICAgICAg
fCA3NyArKysrKysrKysrKysrKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5j
ICAgICAgICAgICAgICAgfCAzNSArKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kZGkuYyAgfCAzOSArKysrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfaGRjcC5jIHwgNTMgKysrKysrKysrKy0tLS0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmggfCAgMiArLQogaW5jbHVkZS9kcm0vZHJtX2Nv
bm5lY3Rvci5oICAgICAgICAgICAgICAgfCAgNyArKysKIGluY2x1ZGUvZHJtL2RybV9oZGNwLmgg
ICAgICAgICAgICAgICAgICAgIHwgIDkgKystCiBpbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcu
aCAgICAgICAgICAgICB8ICA2ICsrCiBpbmNsdWRlL2RybS9kcm1fc3lzZnMuaCAgICAgICAgICAg
ICAgICAgICB8ICA1ICstCiAxMSBmaWxlcyBjaGFuZ2VkLCAyNzEgaW5zZXJ0aW9ucygrKSwgMzQg
ZGVsZXRpb25zKC0pCgotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
