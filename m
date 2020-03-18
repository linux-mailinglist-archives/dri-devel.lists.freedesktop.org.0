Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC59818A2EE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 20:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B706E943;
	Wed, 18 Mar 2020 19:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B37B6E943;
 Wed, 18 Mar 2020 19:08:53 +0000 (UTC)
IronPort-SDR: ee2XIWdHHyuwkm/9ygEN5EjyyHgczw80KvpySBj5mIboahrMqjjTb7HelJtVEmcvy1aGdxuP4J
 t5E/1+tPZktA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 12:08:52 -0700
IronPort-SDR: 1RER0b8WJ7uU8DuvOk4osBuYh5geyIp5mdkP0hKFt4oJVO/AlYK3IcBZB5ceYDANHUrVwjG6Uo
 Z88VEin0fhfw==
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="418055805"
Received: from gkern-mobl.ger.corp.intel.com (HELO localhost) ([10.252.54.69])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2020 12:08:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Guru Das Srinagesh <gurus@codeaurora.org>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v9 01/11] drm/i915: Use 64-bit division macro
In-Reply-To: <19661821c8eb32291e72ec091c267f915c365c52.1584473399.git.gurus@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1584473399.git.gurus@codeaurora.org>
 <19661821c8eb32291e72ec091c267f915c365c52.1584473399.git.gurus@codeaurora.org>
Date: Wed, 18 Mar 2020 21:08:45 +0200
Message-ID: <87h7yleb0i.fsf@intel.com>
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
Cc: Guru Das Srinagesh <gurus@codeaurora.org>,
 Uwe =?utf-8?Q?Kleine-K?= =?utf-8?Q?=C3=B6nig?= <uwe@kleine-koenig.org>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNyBNYXIgMjAyMCwgR3VydSBEYXMgU3JpbmFnZXNoIDxndXJ1c0Bjb2RlYXVyb3Jh
Lm9yZz4gd3JvdGU6Cj4gU2luY2UgdGhlIFBXTSBmcmFtZXdvcmsgaXMgc3dpdGNoaW5nIHN0cnVj
dCBwd21fc3RhdGUuZHV0eV9jeWNsZSdzCj4gZGF0YXR5cGUgdG8gdTY0LCBwcmVwYXJlIGZvciB0
aGlzIHRyYW5zaXRpb24gYnkgdXNpbmcgRElWX1JPVU5EX1VQX1VMTAo+IHRvIGhhbmRsZSBhIDY0
LWJpdCBkaXZpZGVuZC4KPgo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50
ZWwuY29tPgo+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRl
bC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KPiBDYzogIlZpbGxlIFN5cmrDpGzDpCIgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogUm9kcmlnbyBWaXZpIDxyb2Ry
aWdvLnZpdmlAaW50ZWwuY29tPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VydSBEYXMgU3JpbmFn
ZXNoIDxndXJ1c0Bjb2RlYXVyb3JhLm9yZz4KClJldmlld2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFu
aS5uaWt1bGFAaW50ZWwuY29tPgoKQWxzbyBhY2sgZm9yIG1lcmdpbmcgdGhpcyB2aWEgd2hpY2hl
dmVyIHRyZWUgeW91IHByZWZlcjsgcGxlYXNlIGxldCBtZQprbm93IGlmIHlvdSB3YW50IG1lIHRv
IHRha2UgdGhpcyB2aWEgZHJtLWludGVsLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9wYW5lbC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3BhbmVsLmMKPiBpbmRleCBiYzE0ZTljLi44NDNjYWMxIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYwo+IEBAIC0xODY4LDcgKzE4NjgsNyBAQCBz
dGF0aWMgaW50IHB3bV9zZXR1cF9iYWNrbGlnaHQoc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29u
bmVjdG9yLAo+ICAKPiAgCXBhbmVsLT5iYWNrbGlnaHQubWluID0gMDsgLyogMCUgKi8KPiAgCXBh
bmVsLT5iYWNrbGlnaHQubWF4ID0gMTAwOyAvKiAxMDAlICovCj4gLQlwYW5lbC0+YmFja2xpZ2h0
LmxldmVsID0gRElWX1JPVU5EX1VQKAo+ICsJcGFuZWwtPmJhY2tsaWdodC5sZXZlbCA9IERJVl9S
T1VORF9VUF9VTEwoCj4gIAkJCQkgcHdtX2dldF9kdXR5X2N5Y2xlKHBhbmVsLT5iYWNrbGlnaHQu
cHdtKSAqIDEwMCwKPiAgCQkJCSBDUkNfUE1JQ19QV01fUEVSSU9EX05TKTsKPiAgCXBhbmVsLT5i
YWNrbGlnaHQuZW5hYmxlZCA9IHBhbmVsLT5iYWNrbGlnaHQubGV2ZWwgIT0gMDsKCi0tIApKYW5p
IE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
