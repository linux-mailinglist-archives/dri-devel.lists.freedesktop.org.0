Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B5184C44
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 17:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D036E6EC01;
	Fri, 13 Mar 2020 16:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F0C6EC01;
 Fri, 13 Mar 2020 16:20:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 09:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; d="scan'208";a="246730809"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 13 Mar 2020 09:20:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Mar 2020 18:20:54 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] drm/edid: DisplayID parser fixes
Date: Fri, 13 Mar 2020 18:20:45 +0200
Message-Id: <20200313162054.16009-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkkg
d2FzIHBsYXlpbmcgYXJvdW5kIHdpdGggdGhlIHRpbGUgc3R1ZmYgYSBiaXQgYW5kIG5vdGljZWQg
YSBidW5jaCBvZgppc3N1ZXMgaW4gdGhlIERpc3BsYXlJRCBwYXJzZXIuIFRoaXMgc2VyaWVzIGFp
bXMgdG8gZml4IHdoYXQgSSBmb3VuZC4KClZpbGxlIFN5cmrDpGzDpCAoOSk6CiAgZHJtOiBDb25z
dGlmeSB0b3BvbG9neSBpZAogIGRybS9lZGlkOiBTd2FwIHNvbWUgb3BlcmFuZHMgaW4gZm9yX2Vh
Y2hfZGlzcGxheWlkX2RiKCkKICBkcm0vZWRpZDogUmVtb3ZlIGlkeD09MSBhc3N1bXB0aW9ucyBm
cm9tIGFsbCBvdmVyIHRoZSBEaXNwSUQgcGFyc2luZwogIGRybS9lZGlkOiBSZXR1cm4gRGlzcElE
IGxlbmd0aCBmcm9tIGRybV9maW5kX2Rpc3BsYXlpZF9leHRlbnNpb24oKQogIGRybS9lZGlkOiBN
b3ZlIHZhbGlkYXRlX2Rpc3BsYXlpZCgpIGRybV9maW5kX2Rpc3BsYXlpZF9leHRlbnNpb24oKQog
IGRybS9lZGlkOiBEb24ndCBwYXJzZSBnYXJiYWdlIGFzIERpc3BJRCBibG9ja3MKICBkcm0vZWRp
ZDogRG9uJ3QgaW5jbHVkZSBleHQgYmxvY2sgY3N1bSBpbiBEaXNwSUQgc2l6ZQogIGRybS9lZGlk
OiBDbGFyaWZ5IHZhbGlkYXRlX2Rpc3BsYXlpZCgpCiAgZHJtL2VkaWQ6IEZpeCBEaXNwSUQgdGls
ZSBwYXJzaW5nIGZvciBvdmVycmlkZSBFRElECgogZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0
b3IuYyAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Y19pbnRlcm5hbC5oIHwg
ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jICAgICAgICAgIHwgMTAzICsrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCAgICAgICAg
IHwgICA0ICstCiBpbmNsdWRlL2RybS9kcm1fZGlzcGxheWlkLmggICAgICAgICB8ICAgMiArLQog
NSBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCA2MiBkZWxldGlvbnMoLSkKCi0tIAoy
LjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
