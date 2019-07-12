Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F5675AA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 22:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4096E388;
	Fri, 12 Jul 2019 20:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DCC6E38D;
 Fri, 12 Jul 2019 20:06:04 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jul 2019 13:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,483,1557212400"; d="scan'208";a="160484071"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 12 Jul 2019 13:06:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 12 Jul 2019 23:05:59 +0300
Date: Fri, 12 Jul 2019 23:05:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 07/10] drm/i915: Implement MST Aux device registration
Message-ID: <20190712200559.GN5942@intel.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
 <20190704190519.29525-8-sunpeng.li@amd.com>
 <5673f815f4bc01b5d88961a1c087bed2e84ad466.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5673f815f4bc01b5d88961a1c087bed2e84ad466.camel@redhat.com>
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
Cc: sunpeng.li@amd.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMDM6NDg6NTNQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBCVFcsIEkganVzdCB0cmllZCB0aGVzZSBwYXRjaGVzIG9uIG15IFQ0NTBzICh1c2luZyBp
OTE1KSBhbmQgSSdtIHNlZWluZyBzb21lCj4ga2VybmVsIHdhcm5pbmdzIHdpdGggdGhlbSB3aGVu
IGFkZGluZyBEUCBhdXggZGV2aWNlcyBhZnRlciBjb25uZWN0aW5nIGEgbmV3Cj4gTVNUIHRvcG9s
b2d5IHRvIHRoZSBzeXN0ZW06IAo+IAo+IFsgIDM2Ny43NDI1NzFdIFdBUk5JTkc6IENQVTogMiBQ
SUQ6IDQ0MiBhdCBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfb2JqZWN0LmM6NDUgX19kcm1fbW9k
ZV9vYmplY3RfYWRkKzB4YWEvMHhiMCBbZHJtXQoKTG9va3MgbGlrZSBEYW5pZWwgYWRkZWQgdGhh
dCBwYXJ0aWN1bGFyIFdBUk4gaW4KY29tbWl0IDRmNTM2OGI1NTQxYSAgKCJkcm0va21zOiBDYXRj
aCBtb2RlX29iamVjdCBsaWZldGltZSBlcnJvcnMiKS4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
