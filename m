Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1876BAB698
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 13:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DF36E1D5;
	Fri,  6 Sep 2019 11:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EB56E1D5;
 Fri,  6 Sep 2019 11:04:31 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 04:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,472,1559545200"; d="scan'208";a="213113241"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 06 Sep 2019 04:04:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 06 Sep 2019 14:04:23 +0300
Date: Fri, 6 Sep 2019 14:04:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH V4] drm: Add LTTPR defines for DP 1.4a
Message-ID: <20190906110422.GO7482@intel.com>
References: <20190904190116.klyt2rjg3svswmot@outlook.office365.com>
 <20190905172914.GN7482@intel.com>
 <bc61a7de-2183-cb28-65e0-3b7545fb556b@amd.com>
 <20190905195156.3jay646drmdrw7bi@outlook.office365.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905195156.3jay646drmdrw7bi@outlook.office365.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Berthe,
 Abdoulaye" <Abdoulaye.Berthe@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDc6NTE6NTlQTSArMDAwMCwgU2lxdWVpcmEsIFJvZHJp
Z28gd3JvdGU6Cj4gSGkgVmlsbGUsCj4gCj4gRmlyc3Qgb2YgYWxsLCB0aGFuayB5b3UgdmVyeSBt
dWNoIGZvciB0aGUgcmV2aWV3Lgo+IAo+IEkgYWRkZWQgc29tZSBjb21tZW50cyBiZWxvdy4KPiAK
PiBPbiAwOS8wNSwgV2VudGxhbmQsIEhhcnJ5IHdyb3RlOgo+ID4gT24gMjAxOS0wOS0wNSAxOjI5
IHAubS4sIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiA+ID4gT24gV2VkLCBTZXAgMDQsIDIwMTkg
YXQgMDc6MDI6MThQTSArMDAwMCwgU2lxdWVpcmEsIFJvZHJpZ28gd3JvdGU6Cj4gPiA+PiBEUCAx
LjRhIHNwZWNpZmljYXRpb24gZGVmaW5lcyBMaW5rIFRyYWluaW5nIFR1bmFibGUgUEhZIFJlcGVh
dGVyIChMVFRQUikKPiA+ID4gCj4gPiA+IEEgYnVuY2ggb2YgdGhpcyBzdHVmZiB3YXMgYWxyZWFk
eSBpbiBEUCAxLjMgc28gdGhlIHN0YXRlbWVudCBoZXJlCj4gPiA+IChhbmQgaW4gdGhlIGNvbW1l
bnQpIGlzIGEgYml0IG1pc2xlYWRpbmcuCj4gPiA+IAo+ID4gPiAiTFRUUFIiIGlzIG5vdCBhIG5h
bWUgdGhhdCBhcHBlYXJzIGFueXdoZXJlIGluIHRoZSBzcGVjIEFGQUlDUywgc28KPiA+ID4gY2Fs
bGluZyBpdCB0aGF0IGlzIGEgYml0IGNvbmZ1c2luZy4KPiA+ID4gCj4gCj4gV2UgYXJlIHVzaW5n
ICJWRVNBIERpc3BsYXlQb3J0IChEUCkgU3RhbmRhcmQgMS40YSIgYXMgYSByZWZlcmVuY2UuIFdl
Cj4gZG91YmxlLWNoZWNrZWQgdGhlIHNwZWNpZmljYXRpb24sIGFuZCB3ZSBmb3VuZCBtYW55IG9j
Y3VycmVuY2VzIG9mCj4gTFRUUFIuCgpBaCwgeWVzIEkgY2FuIHNlZSBpdCBpbiAxLjRhLiBFYXJs
aWVyIHZlcnNpb25zIGRpZG4ndCB1c2UgdGhhdCBhY3JvbnltLgpJIHdpdGhkcmF3IG15IG9iamVj
dGlvbiB0byB0aGlzIHRoZW4uCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
