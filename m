Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B57D29EA3A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 12:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABABC6ECAB;
	Thu, 29 Oct 2020 11:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F6F6ECAB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 11:13:08 +0000 (UTC)
IronPort-SDR: KtkDySy8S7bb4EZxnYcbdUW/3zCCwD8T4KXy6sLtcUImbSuNaXr79B9GnDkApRj02BbNFGfSeA
 S8OntXMjN0iQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="186199171"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; d="scan'208";a="186199171"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 04:13:08 -0700
IronPort-SDR: kOURXJIUux9fb2F1N/52IyY64/0hjAb65lkeFEZElsUy8+mvr2bTIFDzWkrQmVbXzVR+bGFFrM
 rPAEUDisUDdg==
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; d="scan'208";a="526697289"
Received: from rsexton-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.5.42])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 04:13:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Subject: Re: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
In-Reply-To: <20201029110326.GC3840801@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
 <ad87c5c1-061d-8a81-7b2c-43a8687a464f@suse.de>
 <3294C797-1BBB-4410-812B-4A4BB813F002@oracle.com>
 <20201027062217.GE206502@kroah.com>
 <2DA9AE6D-93D6-4142-9FC4-EEACB92B7203@oracle.com>
 <20201029110326.GC3840801@kroah.com>
Date: Thu, 29 Oct 2020 13:13:01 +0200
Message-ID: <874kmdi8ua.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 daniel.vetter@ffwll.ch, gustavoars@kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, akpm@linux-foundation.org,
 rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyOSBPY3QgMjAyMCwgR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
IHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDI3LCAyMDIwIGF0IDEwOjEyOjQ5QU0gLTA3MDAsIFNhZWVk
IE1pcnphbW9oYW1tYWRpIHdyb3RlOgo+PiBIaSBHcmVnLAo+PiAKPj4gU29ycnkgZm9yIHRoZSBj
b25mdXNpb24uIEnigJltIHJlcXVlc3Rpbmcgc3RhYmxlIG1haW50YWluZXJzIHRvIGNoZXJyeS1w
aWNrIHRoaXMgcGF0Y2ggaW50byBzdGFibGUgNS40IGFuZCA1LjguCj4+IGNvbW1pdCBjYzA3MDU3
YzdjODhmYjhlZmYzYjE5OTExMzFkZWQwZjBiY2ZhN2UzCj4+IEF1dGhvcjogU2FlZWQgTWlyemFt
b2hhbW1hZGkgPHNhZWVkLm1pcnphbW9oYW1tYWRpQG9yYWNsZS5jb20+Cj4+IERhdGU6ICAgV2Vk
IE9jdCAyMSAxNjo1Nzo1OCAyMDIwIC0wNzAwCj4+IAo+PiAgICAgdmlkZW86IGZiZGV2OiBmaXgg
ZGl2aWRlIGVycm9yIGluIGZiY29uX3N3aXRjaAo+Cj4gSSBkbyBub3Qgc2VlIHRoYXQgY29tbWl0
IGluIExpbnVzJ3MgdHJlZSwgZG8geW91PwoKSXQncyBpbiBkcm0tbWlzYy1uZXh0LCBJSVVDIGhl
YWRpbmcgZm9yIExpbnVzJyB0cmVlIGluIHRoZSBuZXh0IG1lcmdlCndpbmRvdyBpbiA2LTggd2Vl
a3MuIFdoaWNoIGlzIHRvIHNheSB0aGlzIHNob3VsZCBwcm9iYWJseSBoYXZlIGJlZW4KYXBwbGll
ZCB0byBkcm0tbWlzYy1maXhlcyBicmFuY2ggaGVhZGluZyBmb3IgdjUuMTAtcmNYLCB3aXRoIGEg
Q2M6CnN0YWJsZSB0YWcsIHRvIGJlZ2luIHdpdGguCgpCUiwKSmFuaS4KCgotLSAKSmFuaSBOaWt1
bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
