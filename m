Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D1A7BAE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 08:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760A8898F3;
	Wed,  4 Sep 2019 06:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7367898F3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 06:26:52 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 23:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,465,1559545200"; d="scan'208";a="198955603"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.147.113])
 by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2019 23:26:50 -0700
Date: Wed, 4 Sep 2019 14:27:16 +0800
From: Feng Tang <feng.tang@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
Message-ID: <20190904062716.GC5541@shbuild999.sh.intel.com>
References: <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
 <20190812072545.GA63191@shbuild999.sh.intel.com>
 <20190813093616.GA65475@shbuild999.sh.intel.com>
 <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
 <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rong Chen <rong.a.chen@intel.com>,
 michel@daenzer.net, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, lkp@01.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKT24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTI6NTE6NDBQTSArMDIwMCwgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAyOC4wOC4xOSB1bSAxMTozNyBzY2hy
aWViIFJvbmcgQ2hlbjoKPiA+IEhpIFRob21hcywKPiA+IAo+ID4gT24gOC8yOC8xOSAxOjE2IEFN
LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPiA+PiBIaQo+ID4+Cj4gPj4gQW0gMjcuMDguMTkg
dW0gMTQ6MzMgc2NocmllYiBDaGVuLCBSb25nIEE6Cj4gPj4+IEJvdGggcGF0Y2hlcyBoYXZlIGxp
dHRsZSBpbXBhY3Qgb24gdGhlIHBlcmZvcm1hbmNlIGZyb20gb3VyIHNpZGUuCj4gPj4gVGhhbmtz
IGZvciB0ZXN0aW5nLiBUb28gYmFkIHRoZXkgZG9lc24ndCBzb2x2ZSB0aGUgaXNzdWUuCj4gPj4K
PiA+PiBUaGVyZSdzIGFub3RoZXIgcGF0Y2ggYXR0YWNoZWQuIENvdWxkIHlvdSBwbGVhc2UgdGVz
dHMgdGhpcyBhcyB3ZWxsPwo+ID4+IFRoYW5rcyBhIGxvdCEKPiA+Pgo+ID4+IFRoZSBwYXRjaCBj
b21lcyBmcm9tIERhbmllbCBWZXR0ZXIgYWZ0ZXIgZGlzY3Vzc2luZyB0aGUgcHJvYmxlbSBvbiBJ
UkMuCj4gPj4gVGhlIGlkZWEgb2YgdGhlIHBhdGNoIGlzIHRoYXQgdGhlIG9sZCBtZ2FnMjAwIGNv
ZGUgbWlnaHQgZGlzcGxheSBtdWNoCj4gPj4gbGVzcyBmcmFtZXMgdGhhdCB0aGUgZ2VuZXJpYyBj
b2RlLCBiZWNhdXNlIG1nYWcyMDAgb25seSBwcmludHMgZnJvbQo+ID4+IG5vbi1hdG9taWMgY29u
dGV4dC4gSWYgd2Ugc2ltdWxhdGUgdGhpcyB3aXRoIHRoZSBnZW5lcmljIGNvZGUsIHdlIHNob3Vs
ZAo+ID4+IHNlZSByb3VnaGx5IHRoZSBvcmlnaW5hbCBwZXJmb3JtYW5jZS4KPiA+Pgo+ID4+Cj4g
PiAKPiA+IEl0J3MgY29vbCwgdGhlIHBhdGNoICJ1c2VjYW5zbGVlcC5wYXRjaCIgY2FuIGZpeCB0
aGUgaXNzdWUuCj4gCj4gVGhhbmsgeW91IGZvciB0ZXN0aW5nLiBCdXQgZG9uJ3QgZ2V0IHRvbyBl
eGNpdGVkLCBiZWNhdXNlIHRoZSBwYXRjaAo+IHNpbXVsYXRlcyBhIGJ1ZyB0aGF0IHdhcyBwcmVz
ZW50IGluIHRoZSBvcmlnaW5hbCBtZ2FnMjAwIGNvZGUuIEEKPiBzaWduaWZpY2FudCBudW1iZXIg
b2YgZnJhbWVzIGFyZSBzaW1wbHkgc2tpcHBlZC4gVGhhdCBpcyBhcHBhcmVudGx5IHRoZQo+IHJl
YXNvbiB3aHkgaXQncyBmYXN0ZXIuCgpUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBpbmZvLCBzbyB0
aGUgb3JpZ2luYWwgY29kZSBza2lwcyB0aW1lLWNvbnN1bWluZwp3b3JrIGluc2lkZSBhdG9taWMg
Y29udGV4dCBvbiBwdXJwb3NlLiBJcyB0aGVyZSBhbnkgc3BhY2UgdG8gb3B0bWlzZSBpdD8KSWYg
MiBzY2hlZHVsZWQgdXBkYXRlIHdvcmtlciBhcmUgaGFuZGxlZCBhdCBhbG1vc3Qgc2FtZSB0aW1l
LCBjYW4gb25lIGJlCnNraXBwZWQ/CgpUaGFua3MsCkZlbmcKCj4gCj4gQmVzdCByZWdhcmRzCj4g
VGhvbWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
