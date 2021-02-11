Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 694FC318DC6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 16:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F95F6E448;
	Thu, 11 Feb 2021 15:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273566E448
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 15:02:54 +0000 (UTC)
IronPort-SDR: pINhpeZuLcoVJ6aQn+MaZeC5f1jkxZRjQDYW7SdXdpOAOLldivh36YOJxTmVoVK4TOKXCP90Da
 izEuqYv+HmSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="162001975"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="162001975"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 07:02:31 -0800
IronPort-SDR: I/h2ucizwdHThalUP9XYrHiXUGJt69ygVea4wrQllwDfGFWl82TqbqAn1dRcLG40fNaF4vhdit
 53UzTpVFR8Aw==
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="397353081"
Received: from hblancoa-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.99])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 07:02:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Not 100% sure if I correctly fixed drm-tip
In-Reply-To: <b313d0b2-9589-8209-54a3-f44dc137164e@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <b313d0b2-9589-8209-54a3-f44dc137164e@amd.com>
Date: Thu, 11 Feb 2021 17:02:27 +0200
Message-ID: <87o8gqd4vw.fsf@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMSBGZWIgMjAyMSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPiB3cm90ZToKPiBIaSBndXlzLAo+Cj4gSSBoYWQgYSBjb25mbGljdCB0aGlzIG1vcm5p
bmcgaW4gdGhlIHR0bSBwb29sIHdoaWxlIHB1c2hpbmcgYW4gaW1wb3J0YW50IAo+IGZpeCB0byBk
cm0tbWlzYy1maXhlcy4KPgo+IEknbSBub3QgMTAwJSBzdXJlIGlmIEkgY29ycmVjdGx5IGZpeGVk
IHVwIGRybS10aXAuIEhvdyBjYW4gdGhpcyBiZSAKPiBkb3VibGUgY2hlY2tlZD8gQW5kIGhvdyBj
YW4gaXQgYmUgZml4ZWQgaWYgdGhlIG1lcmdlIGhhcyBnb25lIGJhZD8KCkknbSBhZnJhaWQgdGhl
cmUncyBhIHByb2JsZW07IGJiNTJjYjBkZWM4ZCAoImRybS90dG06IG1ha2UgdGhlIHBvb2wKc2hy
aW5rZXIgbG9jayBhIG11dGV4IikgaW4gdXBzdHJlYW0gYW5kIGRybS1taXNjLWZpeGVzIGNyZWF0
ZXMgYSBzaWxlbnQKY29uZmxpY3Qgd2l0aCBiYTA1MTkwMWQxMGYgKCJkcm0vdHRtOiBhZGQgYSBk
ZWJ1Z2ZzIGZpbGUgZm9yIHRoZSBnbG9iYWwKcGFnZSBwb29scyIpIGluIGRybS1taXNjLW5leHQs
IGNhdXNpbmcgdGhlIGxhdHRlciB0byB1c2UKc3Bpbl9sb2NrL3VubG9jayBvbiBhIG11dGV4LgoK
QnV0IHdoaWxlIHlvdSBoaXQgYSBjb25mbGljdCwgaXQgZG9lcyBsb29rIGxpa2UgdGhlIGNvbmZs
aWN0IGJyZWFraW5nCnRoZSBidWlsZCBpcyBzaWxlbnQsIEFGQUlDVCB0aGUgc3BpbmxvY2sgcGFy
dCBkb2VzIG5vdCBjb25mbGljdC4gU28gYQpmaXh1cCBwYXRjaCBpbiBkcm0tcmVyZXJlIGlzIHBy
b2JhYmx5IG5lZWRlZCB1bnRpbCB0aGVyZSBhcmUgc29tZQpiYWNrbWVyZ2VzLgoKCkJSLApKYW5p
LgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
