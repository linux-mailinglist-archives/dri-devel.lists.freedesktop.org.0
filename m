Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B96527E906
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 14:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8786E570;
	Wed, 30 Sep 2020 12:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E67B89BA1;
 Wed, 30 Sep 2020 12:57:44 +0000 (UTC)
IronPort-SDR: x0D0AXRD55vGvJqzuuvaaPLCPNfFndi88lUCKLB/Qiyzv3AqyL9ke5dD5k9K8rWR41gAy6rKoG
 UkTSxPlbn7fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="150221605"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="150221605"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 05:57:43 -0700
IronPort-SDR: 7RvkPx+pthl3R62VORE4YjrlyXuUojNd7XKUWMFLscRecd9fGZhSU2S+Oe6ovANV7d5AjR8UDA
 N1PxMGr8Xp2A==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="497435672"
Received: from dkuts-mobl3.ccr.corp.intel.com (HELO localhost)
 ([10.249.36.150])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 05:57:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Matt
 Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/i915/edp/jsl: Update vswing table for HBR and HBR2
In-Reply-To: <20200930103812.GL6112@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200929121127.254086-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <d235e6f34182e327d8bb46383f6c3ef518b5fc23.camel@intel.com>
 <20200929200201.GH6112@intel.com>
 <a4a075597c7d3e65b25598ab696a59eccbd2a069.camel@intel.com>
 <20200929203022.GI6112@intel.com>
 <20200929210144.GA2214475@mdroper-desk1.amr.corp.intel.com>
 <20200929211148.GJ6112@intel.com> <20200929215958.GK6112@intel.com>
 <20200929233822.GC2214475@mdroper-desk1.amr.corp.intel.com>
 <20200930103812.GL6112@intel.com>
Date: Wed, 30 Sep 2020 15:57:58 +0300
Message-ID: <87zh57mnft.fsf@intel.com>
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Ausmus,
 James" <james.ausmus@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Souza, 
 Jose" <jose.souza@intel.com>, "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzMCBTZXAgMjAyMCwgVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4gTm93IHdlIGhhdmUgYW4gYWN0dWFsIGRpZmZlcmVuY2UgYmV0
d2VlbiBFSEwgYW5kIEpTTCBzbyB3ZQo+IHNob3VsZCBzcGxpdC4gR3JhbnRlZCBpdCdzIGEgYml0
IGFubm95aW5nIHRvIGhhdmUgdG8gZG8gaXQKPiBqdXN0IGZvciBzb21lIHZzd2luZyB0YWJsZXMu
IElkZWFsbHkgdGhhdCBzdHVmZiB3b3VsZCBiZQo+IHNwZWNpZmllZCBpbiBhIHNhbmUgd2F5IGJ5
IHRoZSBWQlQuIEJ1dCBzaW5jZSBWQlQgaXMgZ2VuZXJhbGx5Cj4gdXNlbGVzcyB3ZSBuZWVkIHRv
IGRlYWwgd2l0aCB0aGlzIG9uIGEgcGxhdGZvcm0gbGV2ZWwuCgpKdXN0IHRvIHJlY2FwLCB3ZSBo
YXZlIHRocmVlIGJhc2ljIGFwcHJvYWNoZXMgZm9yIGRpZmZlcmVudGlhdGluZwpwbGF0Zm9ybXMg
YmFzZWQgb24gUENJIElEOgoKLSBTZXBhcmF0ZSBwbGF0Zm9ybXMsIGVhY2ggd2l0aCB0aGVpciBv
d24gZGV2aWNlIGluZm8gYW5kIGVudW0KICBpbnRlbF9wbGF0Zm9ybSwgdXNpbmcgSVNfPFBMQVRG
T1JNPigpIGZvciBjaGVja3MuCgotIFNhbWUgcGxhdGZvcm0sIHdpdGggc3VicGxhdGZvcm1zLCB1
c2luZyBJU19TVUJQTEFURk9STSgpIGZvcgogIGNoZWNrcy4gR2VuZXJhbGx5IG9ubHkgdXNlZCBm
b3IgdGhlIFVMVC9VTFggY2hlY2tzLCBidXQgdGhlcmUncyBhbHNvCiAgdGhlIENOTC9JQ0wgcG9y
dCBGIGNhc2Ugd2hpY2ggaXMgcGVyaGFwcyBjb21wYXJhYmxlLgoKLSBTYW1lIHBsYXRmb3JtLCBl
YWNoIHdpdGggdGhlaXIgb3duIGRldmljZSBpbmZvLCBhbmQgYSBmZWF0dXJlIGZsYWcuCgooSW4g
dGhpcyBjYXNlLCBjaGVja2luZyB0aGUgUENIIGlzIGEgcHJveHk7IHRoZXJlIGlzIG5vIGFjdHVh
bApkaWZmZXJlbmNlIGluIHRoZSBQQ0hzIHRvIGFjY291bnQgZm9yIHRoZSBkaWZmZXJlbnQgdmFs
dWVzIHRvIGJlCnVzZWQuIE1peGluZyBQQ0hzIHdpdGggdGhlIHBsYXRmb3JtcyB3b3VsZCBsZWFk
IHRvIHByb2JsZW1zLikKCldlJ3ZlIGJlZW4gdG9sZCBKU0wgYW5kIEVITCBhcmUgdGhlIHNhbWUs
IHdoaWNoIHdvdWxkIGFyZ3VlIGZvciBrZWVwaW5nCnRoZW0gSU5URUxfRUxLSEFSVExBS0UuIFdl
J3ZlIGRvbmUgdGhpcyB3aXRoIG90aGVyIHBsYXRmb3JtcyB0aGF0IGFyZQppZGVudGljYWwuIEhv
d2V2ZXIsIG5vdyBpdCBsb29rcyBsaWtlIHRoZXkncmUgbm90IHRoZSBzYW1lLi4uIHdoeSBub3Qg
aWYKdGhleSdyZSBzdXBwb3NlZCB0byBiZSBpZGVudGljYWw/IFdoYXQgZWxzZSBpcyB0aGVyZT8K
CkJSLApKYW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3Mg
Q2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
