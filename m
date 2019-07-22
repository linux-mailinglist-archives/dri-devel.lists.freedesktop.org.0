Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48FB71275
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80616892D7;
	Tue, 23 Jul 2019 07:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACD389CF1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:09:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 09:09:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="180441409"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga002.jf.intel.com with ESMTP; 22 Jul 2019 09:09:10 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hpas8-00075M-KV; Mon, 22 Jul 2019 19:09:08 +0300
Date: Mon, 22 Jul 2019 19:09:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 7/7] backlight: gpio: use a helper variable for
 &pdev->dev
Message-ID: <20190722160908.GZ9224@smile.fi.intel.com>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722150302.29526-8-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDU6MDM6MDJQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IEluc3RlYWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2IGVhY2ggdGltZSwg
dXNlIGEgaGVscGVyIHZhcmlhYmxlIGZvcgo+IHRoZSBhc3NvY2lhdGVkIGRldmljZSBwb2ludGVy
LgoKPiAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+ICB7Cj4gLQlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZvcm1fZGF0YSAq
cGRhdGEgPQo+IC0JCWRldl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7Cj4gKwlzdHJ1Y3QgZ3Bp
b19iYWNrbGlnaHRfcGxhdGZvcm1fZGF0YSAqcGRhdGE7Cj4gIAlzdHJ1Y3QgYmFja2xpZ2h0X3By
b3BlcnRpZXMgcHJvcHM7Cj4gIAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmw7Cj4gIAlzdHJ1
Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibDsKPiAgCWVudW0gZ3Bpb2RfZmxhZ3MgZmxhZ3M7Cj4gKwlz
dHJ1Y3QgZGV2aWNlICpkZXY7CgpDYW4ndCB3ZSBkbwoKCXN0cnVjdCBkZXZpY2UgZGV2ID0gJnBk
ZXYtPmRldjsKCXN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9IGRl
dl9nZXRfcGxhdGRhdGEoZGV2KTsKCj8gSXQgZml0cyA4MCBuaWNlbHkuCgotLSAKV2l0aCBCZXN0
IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
