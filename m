Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86614E122
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5586E830;
	Fri, 21 Jun 2019 07:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0F86E5AF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 15:12:59 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 08:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; d="scan'208";a="181878850"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2019 08:12:57 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hdykC-0001VD-Vq; Thu, 20 Jun 2019 18:12:56 +0300
Date: Thu, 20 Jun 2019 18:12:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v1] backlight: gpio_backlight: Enable ACPI enumeration
Message-ID: <20190620151256.GH9224@smile.fi.intel.com>
References: <20190619152127.11670-1-andriy.shevchenko@linux.intel.com>
 <8919f52e-c745-503d-806d-aa605ddc8325@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8919f52e-c745-503d-806d-aa605ddc8325@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMDM6MTI6MDVQTSArMDEwMCwgRGFuaWVsIFRob21wc29u
IHdyb3RlOgo+IE9uIDE5LzA2LzIwMTkgMTY6MjEsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiA+
IEFDUEkgYWxsb3dzIHRvIGVudW1lcmF0ZSBzcGVjaWZpYyBkZXZpY2VzIGJ5IHVzaW5nIGNvbXBh
dGlibGUgc3RyaW5ncy4KPiA+IEVuYWJsZSB0aGF0IGVudW1lcmF0aW9uIGZvciBHUElPIGJhc2Vk
IGJhY2tsaWdodCBkZXZpY2VzLgoKPiA+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwKPiA+ICsJCQki
ZmFpbGVkIHRvIGZpbmQgcGxhdGZvcm0gZGF0YSBvciBkZXZpY2UgdHJlZSBub2RlLlxuIik7Cj4g
Cj4gU2hvdWxkIHRoZSBzdHJpbmcgYWxzbyBiZSB1cGRhdGVkPwoKSSBkb24ndCB0aGluayBpdCdz
IG5lY2Vzc2FyeS4gVGhlIGRldmljZSB0cmVlIGNvbXBhdGlibGUgbW9kZSBpcyBmb3IgRFQKZHJp
dmVycywgc28sIGl0IGlzIGFzc3VtZWQgdGhhdCBwZXJzb24ga25vd3MgbXVjaCBlbm91Z2ggYW5k
IHRoaXMgbWVzc2FnZSB3b3VsZApiZSB1c2VmdWwgYXMgaXMuCgo+IElmIHdoYXQgaXMgdXBkYXRl
ZCB0byBhY2tub2xlZGdlIG9wdGlvbiB0byB1c2UgQUNQSSB0aGVuOgo+IEFja2VkLWJ5OiBEYW5p
ZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgoKVGhhbmtzIQoKLS0gCldp
dGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
