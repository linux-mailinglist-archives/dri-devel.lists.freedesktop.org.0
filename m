Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 485B610237E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 12:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC046E7FA;
	Tue, 19 Nov 2019 11:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164D46E7FA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 11:44:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 03:44:12 -0800
X-IronPort-AV: E=Sophos;i="5.68,322,1569308400"; d="scan'208";a="200325748"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 03:44:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thierry Reding <thierry.reding@gmail.com>, zhengbin <zhengbin13@huawei.com>,
 Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 0/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
In-Reply-To: <20191118132357.GC2246533@ulmo>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
 <20191118132357.GC2246533@ulmo>
Date: Tue, 19 Nov 2019 13:44:06 +0200
Message-ID: <87wobwxf95.fsf@intel.com>
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
Cc: , airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, treding@nvidia.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxOCBOb3YgMjAxOSwgVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWls
LmNvbT4gd3JvdGU6Cj4gT24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDc6NDY6MTBQTSArMDgwMCwg
emhlbmdiaW4gd3JvdGU6Cj4+IHpoZW5nYmluICgyKToKPj4gICBkcm0vdGVncmE6IFVzZSBQVFJf
RVJSX09SX1pFUk8oKSB0byBzaW1wbGlmeSBjb2RlIGluCj4+ICAgICB0ZWdyYV9ib19kdW1iX2Ny
ZWF0ZQo+PiAgIGRybS90ZWdyYTogVXNlIFBUUl9FUlJfT1JfWkVSTygpIHRvIHNpbXBsaWZ5IGNv
ZGUgaW4gdGVncmFfZ2VtX2NyZWF0ZQo+PiAKPj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0u
YyB8IDUgKy0tLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYyB8IDUgKy0tLS0KPj4g
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gQXMg
SSBleHBsYWluZWQgaW4gcmVzcG9uc2UgdG8gdGhlIHNhbWUgcGF0Y2hlcyBzZW50IGZvciBvdGhl
ciBkcml2ZXJzCj4gYWxyZWFkeSwgSSBkb24ndCB0aGluayB0aGlzIGhhcyBhbnkgbWVyaXQuCgpJ
IGFncmVlIGNvbXBsZXRlbHkuCgpBcHBhcmVudGx5IHRoZXJlJ3MgYSBjb2NjaWNoZWNrIGZsYWdn
aW5nIGNvbnN0cnVjdHMgbGlrZSB0aGlzOyBwZXJoYXBzCnRoYXQgc2hvdWxkIGJlIGFkZHJlc3Nl
ZC4gSnVsaWE/CgpUaGluZ3MgbGlrZToKCmRyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYzo0NTc6
MS0zOiBXQVJOSU5HOiBQVFJfRVJSX09SX1pFUk8gY2FuIGJlIHVzZWQKCmxlYWRpbmcgdG86Cgog
LQlpZiAoSVNfRVJSKGJvKSkKIC0JCXJldHVybiBQVFJfRVJSKGJvKTsKIC0KIC0JcmV0dXJuIDA7
CiArCXJldHVybiBQVFJfRVJSX09SX1pFUk8oYm8pOwoKSSB0aGluayB3ZSBoYXZlIGNvbnNlbnN1
cyB0aGUgZXJyb3IgcGF0aCBhbmQgdGhlIGhhcHB5IGRheSBzY2VuYXJpb3MKc2hvdWxkIHJlbWFp
biBkaXN0aW5jdC4gTW9yZW92ZXIsIEkgZmluZCBQVFJfRVJSX09SX1pFUk8oKSBjYXVzZXMgbWUg
dG8KcGF1c2UgZm9yIGEgbW9tZW50IHdoaWxlIHRoZSBvcmlnaW5hbCBpcyBhIGNyeXN0YWwgY2xl
YXIgaW1tZWRpYXRlbHkuCgoKQlIsCkphbmkuCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVu
IFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
