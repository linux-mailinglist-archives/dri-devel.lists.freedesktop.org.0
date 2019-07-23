Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2CF71EFC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690CA6E348;
	Tue, 23 Jul 2019 18:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037FC89FFD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 15:34:31 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 08:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="174578077"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga006.jf.intel.com with ESMTP; 23 Jul 2019 08:34:28 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hpwo6-0004It-9g; Tue, 23 Jul 2019 18:34:26 +0300
Date: Tue, 23 Jul 2019 18:34:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 7/7] backlight: gpio: use a helper variable for
 &pdev->dev
Message-ID: <20190723153426.GL9224@smile.fi.intel.com>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-8-brgl@bgdev.pl>
 <20190722160908.GZ9224@smile.fi.intel.com>
 <CAMRc=McGTk+i0SzWN7AvGu3deYbXX_rJX=7+dKRpKFPKM_qxDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=McGTk+i0SzWN7AvGu3deYbXX_rJX=7+dKRpKFPKM_qxDA@mail.gmail.com>
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

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDg6Mjk6NTJBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBwb24uLCAyMiBsaXAgMjAxOSBvIDE4OjA5IEFuZHkgU2hldmNoZW5rbwo+
IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IG5hcGlzYcWCKGEpOgo+ID4KPiA+
IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDA1OjAzOjAyUE0gKzAyMDAsIEJhcnRvc3ogR29sYXN6
ZXdza2kgd3JvdGU6Cj4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3Nr
aUBiYXlsaWJyZS5jb20+Cj4gPiA+Cj4gPiA+IEluc3RlYWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2
IGVhY2ggdGltZSwgdXNlIGEgaGVscGVyIHZhcmlhYmxlIGZvcgo+ID4gPiB0aGUgYXNzb2NpYXRl
ZCBkZXZpY2UgcG9pbnRlci4KPiA+Cj4gPiA+ICBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ICB7Cj4gPiA+IC0gICAgIHN0
cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9Cj4gPiA+IC0gICAgICAg
ICAgICAgZGV2X2dldF9wbGF0ZGF0YSgmcGRldi0+ZGV2KTsKPiA+ID4gKyAgICAgc3RydWN0IGdw
aW9fYmFja2xpZ2h0X3BsYXRmb3JtX2RhdGEgKnBkYXRhOwo+ID4gPiAgICAgICBzdHJ1Y3QgYmFj
a2xpZ2h0X3Byb3BlcnRpZXMgcHJvcHM7Cj4gPiA+ICAgICAgIHN0cnVjdCBiYWNrbGlnaHRfZGV2
aWNlICpibDsKPiA+ID4gICAgICAgc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmw7Cj4gPiA+ICAg
ICAgIGVudW0gZ3Bpb2RfZmxhZ3MgZmxhZ3M7Cj4gPiA+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRl
djsKPiA+Cj4gPiBDYW4ndCB3ZSBkbwo+ID4KPiA+ICAgICAgICAgc3RydWN0IGRldmljZSBkZXYg
PSAmcGRldi0+ZGV2Owo+ID4gICAgICAgICBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZvcm1f
ZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7Cj4gPgo+ID4gPyBJdCBmaXRzIDgw
IG5pY2VseS4KPiA+Cj4gCj4gSU1PIGl0J3MgbW9yZSByZWFkYWJsZSBsaWtlIHRoYXQgd2l0aCB0
aGUgcmV2ZXJzZSBjaHJpc3RtYXMgdHJlZSBsYXlvdXQuCgpJdCBtYWtlcyBtb3JlIGNodXJuIGlu
IHRoZSBvcmlnaW5hbCBjb2RlIGFuZCBmb3IgaW5pdGlhbGl6ZXJzIHRoZSBvcmRlciBpcwpkZWZp
bmVkIGJ5IGl0cyBuYXR1cmUuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5r
bwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
