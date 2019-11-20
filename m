Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B558103997
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178FD6E43A;
	Wed, 20 Nov 2019 12:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767C96E430;
 Wed, 20 Nov 2019 12:09:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 04:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; d="scan'208";a="215777847"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 20 Nov 2019 04:09:14 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 20 Nov 2019 14:09:13 +0200
Date: Wed, 20 Nov 2019 14:09:13 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191120120913.GE11621@lahna.fi.intel.com>
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NTg6MDBQTSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IG92ZXJhbGwsIHdoYXQgSSByZWFsbHkgd2FudCB0byBrbm93IGlzLCBfd2h5XyBkb2Vz
IGl0IHdvcmsgb24gd2luZG93cz8KClNvIGRvIEkgOy0pCgo+IE9yIHdoYXQgYXJlIHdlIGRvaW5n
IGRpZmZlcmVudGx5IG9uIExpbnV4IHNvIHRoYXQgaXQgZG9lc24ndCB3b3JrPyBJZgo+IGFueWJv
ZHkgaGFzIGFueSBpZGVhIG9uIGhvdyB3ZSBjb3VsZCBkaWcgaW50byB0aGlzIGFuZCBmaWd1cmUg
aXQgb3V0Cj4gb24gdGhpcyBsZXZlbCwgdGhpcyB3b3VsZCBwcm9iYWJseSBhbGxvdyB1cyB0byBn
ZXQgY2xvc2VyIHRvIHRoZSByb290Cj4gY2F1c2U/IG5vPwoKSGF2ZSB5b3UgdHJpZWQgdG8gdXNl
IHRoZSBhY3BpX3Jldl9vdmVycmlkZSBwYXJhbWV0ZXIgaW4geW91ciBzeXN0ZW0gYW5kCmRvZXMg
aXQgaGF2ZSBhbnkgZWZmZWN0PwoKQWxzbyBkaWQgeW91IHRyeSB0byB0cmFjZSB0aGUgQUNQSSBf
T04vX09GRigpIG1ldGhvZHM/IEkgdGhpbmsgdGhhdApzaG91bGQgaG9wZWZ1bGx5IHJldmVhbCBz
b21ldGhpbmcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
