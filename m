Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1C86D058
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 16:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5B86E3E5;
	Thu, 18 Jul 2019 14:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5D16E3DA;
 Thu, 18 Jul 2019 14:50:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 07:50:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,278,1559545200"; d="scan'208";a="168287912"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 18 Jul 2019 07:50:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Jul 2019 17:50:53 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/12] drm/i915: YCbCr output fixes and prep work for YCbCr
 4:4:4 output
Date: Thu, 18 Jul 2019 17:50:41 +0300
Message-Id: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkkg
d2FzIHBsYXlpbmcgYXJvdW5kIHdpdGggWUNiQ3IgNDo0OjQgb3V0cHV0IGFuZCBub3RpY2VkIHNl
dmVyYWwKdGhpbmdzIHdyb25nIGluIG91ciBjb2RlLiBTbyBJIGZpeGVkIGl0IGFsbCBhbmQgdG9z
c2VkIGluIHRoZSAKcHJlcCB3b3JrIGZvciBZQ2JDciA0OjQ6NCBvdXRwdXQgb24gaWxrKy4KClZp
bGxlIFN5cmrDpGzDpCAoMTIpOgogIGRybS9kcDogQWRkIGRlZmluaXRvbnMgZm9yIE1TQSBNSVND
IGJpdHMKICBkcm0vaTkxNTogRml4IEhTVysgRFAgTVNBIFlDYkNyIGNvbG9yc3BhY2UgaW5kaWNh
dGlvbgogIGRybS9pOTE1OiBGaXggQVZJIGluZm9mcmFtZSBxdWFudGl6YXRpb24gcmFuZ2UgZm9y
IFlDYkNyIG91dHB1dAogIGRybS9pOTE1OiBFeHRyYWN0IGludGVsX2hkbWlfbGltaXRlZF9jb2xv
cl9yYW5nZSgpCiAgZHJtL2k5MTU6IE5ldmVyIHNldCBsaW1pdGVkX2NvbG9yX3JhbmdlPXRydWUg
Zm9yIFlDYkNyIG91dHB1dAogIGRybS9pOTE1OiBTd2l0Y2ggdG8gdXNpbmcgRFBfTVNBX01JU0Nf
KiBkZWZpbmVzCiAgZHJtL2k5MTU6IERvbid0IGxvb2sgYXQgdW5yZWxhdGVkIFBJUEVDT05GIGJp
dHMgZm9yIGludGVybGFjZWQgcmVhZG91dAogIGRybS9pOTE1OiBTaW1wbGlmeSBpbnRlbF9nZXRf
Y3J0Y195Y2Jjcl9jb25maWcoKQogIGRybS9pOTE1OiBBZGQgUElQRUNPTkYgWUNiQ3IgNDo0OjQg
cHJvZ3JhbW1pbmcgZm9yIEhTVwogIGRybS9pOTE1OiBEb2N1bWVudCBJTEsrIHBpcGUgY3NjIG1h
dHJpeCBiZXR0ZXIKICBkcm0vaTkxNTogU2V0IHVwIElMSy9TTkIgY3NjIHVuaXQgcHJvcGVybHkg
Zm9yIFlDYkNyIG91dHB1dAogIGRybS9pOTE1OiBBZGQgUElQRUNPTkYgWUNiQ3IgNDo0OjQgcHJv
Z3JhbW1pbmcgZm9yIElMSy1JVkIKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2NvbG9yLmMgICB8ICA1MSArKysrKystLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kZGkuYyAgICAgfCAgMjggKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheS5jIHwgMTIwICsrKysrKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgIHwgIDEwICsrCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyAgICB8ICA2MSArKysrKysrLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X3JlZy5oICAgICAgICAgICAgICB8ICAzMSArKy0tLQogaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAgICAgICAgICAgfCAgNDIgKysrKysrKwogNyBmaWxl
cyBjaGFuZ2VkLCAyNDcgaW5zZXJ0aW9ucygrKSwgOTYgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
