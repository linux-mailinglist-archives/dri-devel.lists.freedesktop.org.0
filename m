Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB2A71F02
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5DE6E356;
	Tue, 23 Jul 2019 18:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14DC6E2E8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 15:32:55 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 08:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="180772567"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga002.jf.intel.com with ESMTP; 23 Jul 2019 08:32:52 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hpwmY-0004Hw-9w; Tue, 23 Jul 2019 18:32:50 +0300
Date: Tue, 23 Jul 2019 18:32:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/7] backlight: gpio: simplify the platform data
 handling
Message-ID: <20190723153250.GK9224@smile.fi.intel.com>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-3-brgl@bgdev.pl>
 <20190722160603.GY9224@smile.fi.intel.com>
 <CAMRc=Mfuvh6byfPhPdB51dy_YbAS5scJQT3n3pL_5VZLCjB3Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfuvh6byfPhPdB51dy_YbAS5scJQT3n3pL_5VZLCjB3Hw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDg6Mjg6MDBBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBwb24uLCAyMiBsaXAgMjAxOSBvIDE4OjA2IEFuZHkgU2hldmNoZW5rbwo+
IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IG5hcGlzYcWCKGEpOgo+ID4KPiA+
IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDA1OjAyOjU3UE0gKzAyMDAsIEJhcnRvc3ogR29sYXN6
ZXdza2kgd3JvdGU6Cj4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3Nr
aUBiYXlsaWJyZS5jb20+Cj4gPiA+Cj4gPiA+IE5vdyB0aGF0IHRoZSBsYXN0IHVzZXIgb2YgcGxh
dGZvcm0gZGF0YSAoc2ggZWNvdmVjMjQpIGRlZmluZXMgYSBwcm9wZXIKPiA+ID4gR1BJTyBsb29r
dXAgYW5kIHNldHMgdGhlICdkZWZhdWx0LW9uJyBkZXZpY2UgcHJvcGVydHksIHdlIGNhbiBkcm9w
IHRoZQo+ID4gPiBwbGF0Zm9ybV9kYXRhLXNwZWNpZmljIEdQSU8gaGFuZGxpbmcgYW5kIHVuaWZ5
IGEgYmlnIGNodW5rIG9mIGNvZGUuCj4gPiA+Cj4gPiA+IFRoZSBvbmx5IGZpZWxkIHVzZWQgZnJv
bSB0aGUgcGxhdGZvcm0gZGF0YSBpcyBub3cgdGhlIGZiZGV2IHBvaW50ZXIuCj4gPgo+ID4gPiAt
c3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZV9kdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2LAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZ3Bp
b19iYWNrbGlnaHQgKmdibCkKPiA+ID4gLXsKPiA+ID4gLSAgICAgc3RydWN0IGRldmljZSAqZGV2
ID0gJnBkZXYtPmRldjsKPiA+ID4gLSAgICAgZW51bSBncGlvZF9mbGFncyBmbGFnczsKPiA+ID4g
LSAgICAgaW50IHJldDsKPiA+ID4gLQo+ID4gPiAtICAgICBnYmwtPmRlZl92YWx1ZSA9IGRldmlj
ZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiZGVmYXVsdC1vbiIpOwo+ID4gPiAtICAgICBmbGFn
cyA9IGdibC0+ZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XOwo+ID4g
PiAtCj4gPiA+IC0gICAgIGdibC0+Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldChkZXYsIE5VTEwsIGZs
YWdzKTsKPiA+ID4gLSAgICAgaWYgKElTX0VSUihnYmwtPmdwaW9kKSkgewo+ID4gPiAtICAgICAg
ICAgICAgIHJldCA9IFBUUl9FUlIoZ2JsLT5ncGlvZCk7Cj4gPiA+IC0KPiA+ID4gLSAgICAgICAg
ICAgICBpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpIHsKPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRXJy
b3I6IFRoZSBncGlvcyBwYXJhbWV0ZXIgaXMgbWlzc2luZyBvciBpbnZhbGlkLlxuIik7Cj4gPiA+
IC0gICAgICAgICAgICAgfQo+ID4gPiAtICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+IC0g
ICAgIH0KPiA+ID4gLQo+ID4gPiAtICAgICByZXR1cm4gMDsKPiA+ID4gLX0KPiA+Cj4gPiBXaHkg
bm90IGxlYXZlIHRoaXMgZnVuY3Rpb24gKHBlcmhhcHMgd2l0aCBkaWZmZXJlbnQgbmFtZSk/Cj4g
Cj4gV2h5IHdvdWxkIHdlIGRvIHRoYXQgaWYgdGhlIGVudGlyZSBwcm9iZSgpIGZ1bmN0aW9uIGlz
IG5vdyBsZXNzIHRoYW4KPiA1MCBsaW5lcyBsb25nPyBBbHNvOiBpdCBnZXRzIGlubGluZWQgYnkg
dGhlIGNvbXBpbGVyIGFueXdheS4gSXQKPiBkb2Vzbid0IG1ha2Ugc2Vuc2UgSU1PLgoKSSdtIG5v
dCBhZ2FpbnN0IHRoaXMsIHBlcmhhcHMsIGRyb3BwaW5nIGFuZCBtb3ZpbmcgY2FuIGJlIHNwbGl0
IHRvIHR3byBjaGFuZ2VzLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
