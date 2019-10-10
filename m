Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEC0D2662
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF6C6E338;
	Thu, 10 Oct 2019 09:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC5B6EACA;
 Thu, 10 Oct 2019 09:32:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 02:32:25 -0700
X-IronPort-AV: E=Sophos;i="5.67,279,1566889200"; d="scan'208";a="184354187"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 02:32:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Ruhl\, Michael J" <michael.j.ruhl@intel.com>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 8/8] drm/print: introduce new struct
 drm_device based logging macros
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663D9C2390F@FMSMSX108.amr.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1570635293.git.jani.nikula@intel.com>
 <d56d095321ac43582b500ca2c3e40b1932f198c0.1570635293.git.jani.nikula@intel.com>
 <14063C7AD467DE4B82DEDB5C278E8663D9C2390F@FMSMSX108.amr.corp.intel.com>
Date: Thu, 10 Oct 2019 12:32:20 +0300
Message-ID: <87eezlgd3v.fsf@intel.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAwOSBPY3QgMjAxOSwgIlJ1aGwsIE1pY2hhZWwgSiIgPG1pY2hhZWwuai5ydWhsQGlu
dGVsLmNvbT4gd3JvdGU6Cj4+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj5Gcm9tOiBJbnRl
bC1nZnggW21haWx0bzppbnRlbC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9u
IEJlaGFsZiBPZgo+PkphbmkgTmlrdWxhCgo+PisvKiBIZWxwZXIgZm9yIHN0cnVjdCBkcm1fZGV2
aWNlIGJhc2VkIGxvZ2dpbmcuICovCj4+KyNkZWZpbmUgX19kcm1fcHJpbnRrKGRybSwgbGV2ZWws
IHR5cGUsIGZtdCwgLi4uKQkJCVwKPj4rCWRldl8jI2xldmVsIyN0eXBlKGRybS0+ZGV2LCAiW2Ry
bV0gIiBmbXQsICMjX19WQV9BUkdTX18pCj4KPiBJbiB0aGUgcGFzdCwgSSBoYXZlIGJlZW4gYWJs
ZSB0byBkbyBhOgo+Cj4gI3VuZGVmIHByX2ZtdAo+ICNkZWZpbmUgcHJfZm10KGZtdCkgIltteWlu
Zm8gaGVyZV0gIiBmbXQKPgo+IEFuZCBoYXZlIHRoZSAiW215aW5mbyBoZXJlXSIgcG9ydGlvbiBz
aG93IHVwIHRoZSBvdXRwdXQuCj4KPiBJcyBpdCBwb3NzaWJsZSB0aGF0IHlvdSBtaWdodCBiZSBh
YmxlIHRvIHVzZSB0aGlzIGluc3RlYWQgb2YgIltkcm1dICIgZm10Pwo+Cj4gSSB0aGluayB0aGF0
IHRoZSB0aGlzIHdpbGwgYmUgdGhlIHNhbWUgcmVzdWx0LCBidXQgbWlnaHQgYmUgbW9yZSBpbgo+
IGxpbmUgd2l0aCB0aGUgcHJpbnRrIGludGVyZmFjZT8KCnByX2ZtdCBpcyBvbmx5IHVzZWQgYnkg
dGhlIHByXzxsZXZlbD4oKSBtYWNyb3MgaW4gcHJpbnRrLmggdGhhdCB1c2UKcHJpbnRrLiBUaGlz
IGRvZXMgbm90IHVzZSBwcmludGsuCgpCUiwKSmFuaS4KCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwg
T3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
