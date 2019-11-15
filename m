Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC65FDCB7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 12:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDB56E505;
	Fri, 15 Nov 2019 11:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B23F6E505
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 11:53:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 03:53:00 -0800
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; d="scan'208";a="199178566"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 03:52:56 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Wambui Karuga <wambui.karugax@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 hjc@rock-chips.com
Subject: Re: [PATCH 0/2] add new DRM_DEV_WARN macro
In-Reply-To: <20191114132436.7232-1-wambui.karugax@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191114132436.7232-1-wambui.karugax@gmail.com>
Date: Fri, 15 Nov 2019 13:52:53 +0200
Message-ID: <8736ep1hm2.fsf@intel.com>
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
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNCBOb3YgMjAxOSwgV2FtYnVpIEthcnVnYSA8d2FtYnVpLmthcnVnYXhAZ21haWwu
Y29tPiB3cm90ZToKPiBUaGlzIGFkZHMgYSBuZXcgRFJNX0RFVl9XQVJOIGhlbHBlciBtYWNybyBm
b3Igd2FybmluZ3MgbG9nIG91dHB1dCB0aGF0IGluY2x1ZGUKPiBkZXZpY2UgcG9pbnRlcnMuIEl0
IGFsc28gaW5jbHVkZXMgdGhlIHVzZSBvZiB0aGUgRFJNX0RFVl9XQVJOIG1hY3JvIGluCj4gZHJt
L3JvY2tjaGlwIHRvIHJlcGxhY2UgZGV2X3dhcm4uCgpJJ20gdHJ5aW5nIHRvIHNvbGljaXQgbmV3
IHN0cnVjdCBkcm1fZGV2aWNlIGJhc2VkIGxvZ2dpbmcgbWFjcm9zLCBhbmQKc3RhcnRpbmcgdG8g
Y29udmVydCB0byB0aG9zZS4gWzFdCgpCUiwKSmFuaS4KCgpbMV0gaHR0cDovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvNjNkMWU3MmI5OWU5YzEzZWU1YjFiMzYyYTY1M2Zm
OWMyMWUxOTEyNC4xNTcyMjU4OTM2LmdpdC5qYW5pLm5pa3VsYUBpbnRlbC5jb20KCgoKCj4KPiBX
YW1idWkgS2FydWdhICgyKToKPiAgIGRybS9wcmludDogYWRkIERSTV9ERVZfV0FSTiBtYWNybwo+
ICAgZHJtL3JvY2tjaGlwOiB1c2UgRFJNX0RFVl9XQVJOIG1hY3JvIGluIGRlYnVnIG91dHB1dAo+
Cj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYyB8IDMgKystCj4gIGluY2x1
ZGUvZHJtL2RybV9wcmludC5oICAgICAgICAgICAgICB8IDkgKysrKysrKysrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0gCkphbmkgTmlrdWxh
LCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
