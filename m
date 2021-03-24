Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4337347F3D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 18:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4928B6ECBF;
	Wed, 24 Mar 2021 17:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2746ECB8;
 Wed, 24 Mar 2021 17:22:58 +0000 (UTC)
IronPort-SDR: npl03gj17Y+287WwiQurdwlkWJRKIVCjWZtUxr7BV6rUkB+ejWZsvp2iC5WM+e7DBbGofuEvyn
 Vr1hlF4yOGOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="252110426"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="252110426"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 10:22:57 -0700
IronPort-SDR: q7x5MCG+vkoOU9Zt5AI1qoSHSHC0Zp99QAlPGLHuv2CUXVcGAPnke24VDa6jskQUUfvyu5ceVQ
 Ar5TomltcFSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="443059639"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 24 Mar 2021 10:22:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 24 Mar 2021 19:22:48 +0200
Date: Wed, 24 Mar 2021 19:22:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 10/11] drm/i915: avoid stringop-overread warning on
 pri_latency
Message-ID: <YFt1aBFwJI+z97g3@intel.com>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-11-arnd@kernel.org>
 <874kh04lin.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874kh04lin.fsf@intel.com>
X-Patchwork-Hint: comment
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-scsi@vger.kernel.org,
 x86@kernel.org, James Smart <james.smart@broadcom.com>,
 tboot-devel@lists.sourceforge.net, Kalle Valo <kvalo@codeaurora.org>,
 intel-gfx@lists.freedesktop.org, Serge Hallyn <serge@hallyn.com>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ning Sun <ning.sun@intel.com>, Anders Larsen <al@alarsen.net>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Aditya Swarup <aditya.swarup@intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Martin Sebor <msebor@gcc.gnu.org>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 linux-security-module@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgMDU6MzA6MjRQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gTW9uLCAyMiBNYXIgMjAyMSwgQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPgo+ID4g
Z2NjLTExIHdhcm5zIGFib3V0IHdoYXQgYXBwZWFycyB0byBiZSBhbiBvdXQtb2YtcmFuZ2UgYXJy
YXkgYWNjZXNzOgo+ID4KPiA+IEluIGZ1bmN0aW9uIOKAmHNuYl93bV9sYXRlbmN5X3F1aXJr4oCZ
LAo+ID4gICAgIGlubGluZWQgZnJvbSDigJhpbGtfc2V0dXBfd21fbGF0ZW5jeeKAmSBhdCBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jOjMxMDg6MzoKPiA+IGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX3BtLmM6MzA1Nzo5OiBlcnJvcjog4oCYaW50ZWxfcHJpbnRfd21fbGF0ZW5jeeKA
mSByZWFkaW5nIDE2IGJ5dGVzIGZyb20gYSByZWdpb24gb2Ygc2l6ZSAxMCBbLVdlcnJvcj1zdHJp
bmdvcC1vdmVycmVhZF0KPiA+ICAzMDU3IHwgICAgICAgICBpbnRlbF9wcmludF93bV9sYXRlbmN5
KGRldl9wcml2LCAiUHJpbWFyeSIsIGRldl9wcml2LT53bS5wcmlfbGF0ZW5jeSk7Cj4gPiAgICAg
ICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9w
bS5jOiBJbiBmdW5jdGlvbiDigJhpbGtfc2V0dXBfd21fbGF0ZW5jeeKAmToKPiA+IGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2ludGVsX3BtLmM6MzA1Nzo5OiBub3RlOiByZWZlcmVuY2luZyBhcmd1bWVu
dCAzIG9mIHR5cGUg4oCYY29uc3QgdTE2ICrigJkge2FrYSDigJhjb25zdCBzaG9ydCB1bnNpZ25l
ZCBpbnQgKuKAmX0KPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmM6Mjk5NDoxMzog
bm90ZTogaW4gYSBjYWxsIHRvIGZ1bmN0aW9uIOKAmGludGVsX3ByaW50X3dtX2xhdGVuY3nigJkK
PiA+ICAyOTk0IHwgc3RhdGljIHZvaWQgaW50ZWxfcHJpbnRfd21fbGF0ZW5jeShzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsCj4gPiAgICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KPiA+Cj4gPiBNeSBndWVzcyBpcyB0aGF0IHRoaXMgY29kZSBpcyBhY3R1
YWxseSBzYWZlIGJlY2F1c2UgdGhlIHNpemUgb2YgdGhlCj4gPiBhcnJheSBkZXBlbmRzIG9uIHRo
ZSBoYXJkd2FyZSBnZW5lcmF0aW9uLCBhbmQgdGhlIGZ1bmN0aW9uIGNoZWNrcyBmb3IKPiA+IHRo
YXQsIGJ1dCBhdCB0aGUgc2FtZSB0aW1lIEkgd291bGQgbm90IGV4cGVjdCB0aGUgY29tcGlsZXIg
dG8gd29yayBpdAo+ID4gb3V0IGNvcnJlY3RseSwgYW5kIHRoZSBjb2RlIHNlZW1zIGEgbGl0dGxl
IGZyYWdpbGUgd2l0aCByZWdhcmRzIHRvCj4gPiBmdXR1cmUgY2hhbmdlcy4gU2ltcGx5IGluY3Jl
YXNpbmcgdGhlIHNpemUgb2YgdGhlIGFycmF5IHNob3VsZCBoZWxwLgo+IAo+IEFncmVlZCwgSSBk
b24ndCB0aGluayB0aGVyZSdzIGFuIGlzc3VlLCBidXQgdGhlIGNvZGUgY291bGQgdXNlIGEgYnVu
Y2gKPiBvZiBpbXByb3ZlbWVudHMuCj4gCj4gTGlrZSwgd2UgaGF2ZSBpbnRlbF9wcmludF93bV9s
YXRlbmN5KCkgZm9yIGRlYnVnIGxvZ2dpbmcgYW5kCj4gd21fbGF0ZW5jeV9zaG93KCkgZm9yIGRl
YnVnZnMsIGFuZCB0aGVyZSdzIGEgYnVuY2ggb2YgZHVwbGljYXRpb24gYW5kCj4gdWdoLgoKVGhl
cmUgaXMgYWxsIHRoaXMgYW5jaWVudCBzdHVmZiBpbiByZXZpZXcgbGltYm8uLi4KaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81MDgwMi8KCi0tIApWaWxsZSBTeXJqw6Rs
w6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
