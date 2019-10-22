Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC478DFF3B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434626E43F;
	Tue, 22 Oct 2019 08:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4C26E43F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:16:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 01:16:56 -0700
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="191387159"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 01:16:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] drm/scdc: Fix typo in bit definition of SCDC_STATUS_FLAGS
In-Reply-To: <20191016123342.19119-1-patrik.r.jakobsson@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191016123342.19119-1-patrik.r.jakobsson@gmail.com>
Date: Tue, 22 Oct 2019 11:16:51 +0300
Message-ID: <87lftdfb4c.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNiBPY3QgMjAxOSwgUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jzc29u
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gRml4IHR5cG8gd2hlcmUgYml0cyBnb3QgY29tcGFyZWQgKHgg
PCB5KSBpbnN0ZWFkIG9mIHNoaWZ0ZWQgKHggPDwgeSkuCgpGaXhlczogM2FkMzNhZTJiYzgwICgi
ZHJtOiBBZGQgU0NEQyBoZWxwZXJzIikKQ2M6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpayBKYWtvYnNzb24gPHBhdHJpay5yLmpha29i
c3NvbkBnbWFpbC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9zY2RjX2hlbHBlci5oIHwg
NiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fc2NkY19oZWxwZXIuaCBiL2luY2x1
ZGUvZHJtL2RybV9zY2RjX2hlbHBlci5oCj4gaW5kZXggZjkyZWIyMDk0ZDZiLi42YTQ4MzUzM2Fh
ZTQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3NjZGNfaGVscGVyLmgKPiArKysgYi9p
bmNsdWRlL2RybS9kcm1fc2NkY19oZWxwZXIuaAo+IEBAIC01MCw5ICs1MCw5IEBACj4gICNkZWZp
bmUgIFNDRENfUkVBRF9SRVFVRVNUX0VOQUJMRSAoMSA8PCAwKQo+ICAKPiAgI2RlZmluZSBTQ0RD
X1NUQVRVU19GTEFHU18wIDB4NDAKPiAtI2RlZmluZSAgU0NEQ19DSDJfTE9DSyAoMSA8IDMpCj4g
LSNkZWZpbmUgIFNDRENfQ0gxX0xPQ0sgKDEgPCAyKQo+IC0jZGVmaW5lICBTQ0RDX0NIMF9MT0NL
ICgxIDwgMSkKPiArI2RlZmluZSAgU0NEQ19DSDJfTE9DSyAoMSA8PCAzKQo+ICsjZGVmaW5lICBT
Q0RDX0NIMV9MT0NLICgxIDw8IDIpCj4gKyNkZWZpbmUgIFNDRENfQ0gwX0xPQ0sgKDEgPDwgMSkK
PiAgI2RlZmluZSAgU0NEQ19DSF9MT0NLX01BU0sgKFNDRENfQ0gyX0xPQ0sgfCBTQ0RDX0NIMV9M
T0NLIHwgU0NEQ19DSDBfTE9DSykKPiAgI2RlZmluZSAgU0NEQ19DTE9DS19ERVRFQ1QgKDEgPDwg
MCkKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
