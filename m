Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4F810391A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 12:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A866E34A;
	Wed, 20 Nov 2019 11:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8346E340;
 Wed, 20 Nov 2019 11:51:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 03:51:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; d="scan'208";a="215772771"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 20 Nov 2019 03:51:27 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 20 Nov 2019 13:51:27 +0200
Date: Wed, 20 Nov 2019 13:51:27 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191120115127.GD11621@lahna.fi.intel.com>
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120112212.GA11621@lahna.fi.intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, Linux PM <linux-pm@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDE6MjI6MTZQTSArMDIwMCwgTWlrYSBXZXN0ZXJiZXJn
IHdyb3RlOgo+ICAgICAgICAgICAgIElmICgoKE9TWVMgPD0gMHgwN0Q5KSB8fCAoKE9TWVMgPT0g
MHgwN0RGKSAmJiAoX1JFViA9PSAKPiAgICAgICAgICAgICAgICAgMHgwNSkpKSkKPiAgICAgICAg
ICAgICB7CgpUaGUgT1NZUyBjb21lcyBmcm9tIHRoaXMgKGluIERTRFQpOgoKICAgICAgICAgICAg
ICAgIElmIChfT1NJICgiV2luZG93cyAyMDA5IikpCiAgICAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgICAgT1NZUyA9IDB4MDdEOQogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAg
ICAgIElmIChfT1NJICgiV2luZG93cyAyMDEyIikpCiAgICAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgICAgT1NZUyA9IDB4MDdEQwogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAg
ICAgIElmIChfT1NJICgiV2luZG93cyAyMDEzIikpCiAgICAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgICAgT1NZUyA9IDB4MDdERAogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAg
ICAgIElmIChfT1NJICgiV2luZG93cyAyMDE1IikpCiAgICAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgICAgT1NZUyA9IDB4MDdERgogICAgICAgICAgICAgICAgfQoKU28gSSBndWVzcyB0
aGlzIHBhcnRpY3VsYXIgY2hlY2sgdHJpZXMgdG8gaWRlbnRpZnkgV2luZG93cyA3IGFuZCBvbGRl
ciwKYW5kIExpbnV4LgoKPiAgICAgICAgICAgICAgICAgSWYgKChQSU9GID09IFplcm8pKQo+ICAg
ICAgICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICAgICAgICBQMExEID0gT25lCj4gICAgICAg
ICAgICAgICAgICAgICBUQ05UID0gWmVybwo+ICAgICAgICAgICAgICAgICAgICAgV2hpbGUgKChU
Q05UIDwgTERMWSkpCj4gICAgICAgICAgICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgSWYgKChQMExUID09IDB4MDgpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgQnJlYWsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICB9Cj4gCj4gICAgICAgICAgICAgICAgICAgICAgICAgU2xlZXAgKDB4MTApCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgVENOVCArPSAweDEwCj4gICAgICAgICAgICAgICAgICAgICB9Cj4gCj4g
ICAgICAgICAgICAgICAgICAgICBQMFJNID0gT25lCj4gICAgICAgICAgICAgICAgICAgICBQMEFQ
ID0gMHgwMwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIEVsc2VJZiAoKFBJ
T0YgPT0gT25lKSkKPiAgICAgICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgICAgUDFM
RCA9IE9uZQo+ICAgICAgICAgICAgICAgICAgICAgVENOVCA9IFplcm8KPiAgICAgICAgICAgICAg
ICAgICAgIFdoaWxlICgoVENOVCA8IExETFkpKQo+ICAgICAgICAgICAgICAgICAgICAgewo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIElmICgoUDFMVCA9PSAweDA4KSkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJyZWFrCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgfQo+IAo+ICAgICAgICAgICAgICAgICAgICAgICAgIFNsZWVwICgw
eDEwKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIFRDTlQgKz0gMHgxMAo+ICAgICAgICAgICAg
ICAgICAgICAgfQo+IAo+ICAgICAgICAgICAgICAgICAgICAgUDFSTSA9IE9uZQo+ICAgICAgICAg
ICAgICAgICAgICAgUDFBUCA9IDB4MDMKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAg
ICAgICBFbHNlSWYgKChQSU9GID09IDB4MDIpKQo+ICAgICAgICAgICAgICAgICB7Cj4gICAgICAg
ICAgICAgICAgICAgICBQMkxEID0gT25lCj4gICAgICAgICAgICAgICAgICAgICBUQ05UID0gWmVy
bwo+ICAgICAgICAgICAgICAgICAgICAgV2hpbGUgKChUQ05UIDwgTERMWSkpCj4gICAgICAgICAg
ICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgSWYgKChQMkxUID09IDB4MDgp
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgQnJlYWsKPiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgU2xlZXAgKDB4MTApCj4gICAgICAgICAgICAgICAgICAgICAgICAgVENOVCArPSAw
eDEwCj4gICAgICAgICAgICAgICAgICAgICB9Cj4gCj4gICAgICAgICAgICAgICAgICAgICBQMlJN
ID0gT25lCj4gICAgICAgICAgICAgICAgICAgICBQMkFQID0gMHgwMwo+ICAgICAgICAgICAgICAg
ICB9Cj4gCj4gICAgICAgICAgICAgICAgIElmICgoUEJHRSAhPSBaZXJvKSkKPiAgICAgICAgICAg
ICAgICAgewo+ICAgICAgICAgICAgICAgICAgICAgSWYgKFNCREwgKFBJT0YpKQo+ICAgICAgICAg
ICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIE1CREwgPSBHTVhCIChQSU9G
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIFBEVUIgKFBJT0YsIE1CREwpCj4gICAgICAgICAg
ICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICB9Cj4gICAgICAg
ICAgICAgRWxzZQo+ICAgICAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgTEtEUyAoUElPRikK
PiAgICAgICAgICAgICB9Cj4gCj4gICAgICAgICAgICAgSWYgKChEZXJlZk9mIChTQ0xLIFtaZXJv
XSkgIT0gWmVybykpCj4gICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICBQQ1JPICgweERD
LCAweDEwMEMsIERlcmVmT2YgKFNDTEsgW09uZV0pKQo+ICAgICAgICAgICAgICAgICBTbGVlcCAo
MHgxMCkKPiAgICAgICAgICAgICB9Cj4gCj4gICAgICAgICAgICAgR1BQUiAoUElPRiwgWmVybykK
PiAgICAgICAgICAgICBJZiAoKE9TWVMgIT0gMHgwN0Q5KSkKPiAgICAgICAgICAgICB7Cj4gICAg
ICAgICAgICAgICAgIERJV0sgKFBJT0YpCj4gICAgICAgICAgICAgfQo+IAo+ICAgICAgICAgICAg
IFxfU0IuU0dPViAoMHgwMTAxMDAwNCwgWmVybykKPiAgICAgICAgICAgICBTbGVlcCAoMHgxNCkK
PiAgICAgICAgICAgICBSZXR1cm4gKFplcm8pCj4gICAgICAgICB9Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
