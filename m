Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAF11B6DF9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 08:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1469C6E43F;
	Fri, 24 Apr 2020 06:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1436E42F;
 Fri, 24 Apr 2020 06:18:06 +0000 (UTC)
IronPort-SDR: IUbAsSqGloiCzdYb4mIfBDQXbJ8yDBm+AkZ01n34GoS4g0hNPzeS3EeDwyJ4BE5xCPWRw7Qa1o
 OjJ7ASSSZm8g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 23:18:05 -0700
IronPort-SDR: CMMh7MOlW2PHOf69i2rCxZUoGQjBYXzGWUKRrghXshWnbMa4J890SrsF0POzKmQwBnpobtHclZ
 6P4wnWvYB6hA==
X-IronPort-AV: E=Sophos;i="5.73,310,1583222400"; d="scan'208";a="430652200"
Received: from khelzel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.52.65])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 23:18:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Guru Das Srinagesh <gurus@codeaurora.org>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v13 01/11] drm/i915: Use 64-bit division macro
In-Reply-To: <4a3acf8673c08308848fb7ae73d992b6feb758d3.1587523702.git.gurus@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1587523702.git.gurus@codeaurora.org>
 <4a3acf8673c08308848fb7ae73d992b6feb758d3.1587523702.git.gurus@codeaurora.org>
Date: Fri, 24 Apr 2020 09:17:58 +0300
Message-ID: <87ftctbe5l.fsf@intel.com>
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
 David Collins <collinsd@codeaurora.org>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6ni?= =?utf-8?Q?g?=
 <u.kleine-koenig@pengutronix.de>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMSBBcHIgMjAyMCwgR3VydSBEYXMgU3JpbmFnZXNoIDxndXJ1c0Bjb2RlYXVyb3Jh
Lm9yZz4gd3JvdGU6Cj4gU2luY2UgdGhlIFBXTSBmcmFtZXdvcmsgaXMgc3dpdGNoaW5nIHN0cnVj
dCBwd21fc3RhdGUuZHV0eV9jeWNsZSdzCj4gZGF0YXR5cGUgdG8gdTY0LCBwcmVwYXJlIGZvciB0
aGlzIHRyYW5zaXRpb24gYnkgdXNpbmcgRElWX1JPVU5EX1VQX1VMTAo+IHRvIGhhbmRsZSBhIDY0
LWJpdCBkaXZpZGVuZC4KPgo+IFRvOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50
ZWwuY29tPgo+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRl
bC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KPiBDYzogIlZpbGxlIFN5cmrDpGzDpCIgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPgoKU3VwZXJmbHVvdXMgYmxhbmsgbGlu
ZS4KCkFueXdheSwgcGxlYXNlIHByZXNlcnZlIHRoZSBleGlzdGluZyBhY2tzIGFuZCByZXZpZXdz
IFsxXSBzbyBwZW9wbGUKZG9uJ3QgaGF2ZSB0byBkbyBpdCBhZ2Fpbi4KCkJSLApKYW5pLgoKWzFd
IGh0dHA6Ly9sb3JlLmtlcm5lbC5vcmcvci84N2g3eWxlYjBpLmZzZkBpbnRlbC5jb20KCj4gU2ln
bmVkLW9mZi1ieTogR3VydSBEYXMgU3JpbmFnZXNoIDxndXJ1c0Bjb2RlYXVyb3JhLm9yZz4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wYW5lbC5jIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3BhbmVsLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3BhbmVsLmMKPiBpbmRleCAyNzZmNDM4Li44
MTU0N2EwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
cGFuZWwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwu
Ywo+IEBAIC0xOTIwLDcgKzE5MjAsNyBAQCBzdGF0aWMgaW50IHB3bV9zZXR1cF9iYWNrbGlnaHQo
c3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+ICAJCXJldHVybiByZXR2YWw7Cj4g
IAl9Cj4gIAo+IC0JbGV2ZWwgPSBESVZfUk9VTkRfVVAocHdtX2dldF9kdXR5X2N5Y2xlKHBhbmVs
LT5iYWNrbGlnaHQucHdtKSAqIDEwMCwKPiArCWxldmVsID0gRElWX1JPVU5EX1VQX1VMTChwd21f
Z2V0X2R1dHlfY3ljbGUocGFuZWwtPmJhY2tsaWdodC5wd20pICogMTAwLAo+ICAJCQkgICAgIENS
Q19QTUlDX1BXTV9QRVJJT0RfTlMpOwo+ICAJcGFuZWwtPmJhY2tsaWdodC5sZXZlbCA9Cj4gIAkJ
aW50ZWxfcGFuZWxfY29tcHV0ZV9icmlnaHRuZXNzKGNvbm5lY3RvciwgbGV2ZWwpOwoKLS0gCkph
bmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
