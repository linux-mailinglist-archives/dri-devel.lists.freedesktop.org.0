Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7FA37388B
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 12:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711AF6E043;
	Wed,  5 May 2021 10:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7426E043;
 Wed,  5 May 2021 10:28:49 +0000 (UTC)
IronPort-SDR: 3hjGe8Ii35dxxNF5GS6MXEBOtk7byXuaTQPLPv5DTNxaSaK9qe+wN+2X5OMuMx2zy9rS+P207j
 i1+Ta8M82ZSQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="177730928"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="177730928"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 03:28:48 -0700
IronPort-SDR: oN74f6sSgF4XCZmYoweQxh2eme3Q+Lr2Q0f4Zojo1rOngA3iziW4ASRUGicslRBouwtelEX6p5
 BfMI5DHUysuA==
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="618912096"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 03:28:45 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with ESMTP id 43061203BC;
 Wed,  5 May 2021 13:28:43 +0300 (EEST)
Date: Wed, 5 May 2021 13:28:43 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
Message-ID: <20210505102843.GM3@paasikivi.fi.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
 <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com>
 <CAHp75VcfkcaVAu2-8-5he7PN=W_tRHiHAgXYn04gRnLehDVsyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VcfkcaVAu2-8-5he7PN=W_tRHiHAgXYn04gRnLehDVsyQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5keSwgSGFucywKCk9uIFdlZCwgTWF5IDA1LCAyMDIxIGF0IDEyOjE3OjE0UE0gKzAzMDAs
IEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiBPbiBXZWQsIE1heSA1LCAyMDIxIGF0IDEyOjA3IFBN
IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gT24gNS80LzIx
IDk6NTIgQU0sIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiA+ID4gT24gTW9uZGF5LCBNYXkgMywg
MjAyMSwgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbSA8bWFpbHRvOmhkZWdvZWRl
QHJlZGhhdC5jb20+PiB3cm90ZToKPiAKPiAuLi4KPiAKPiA+ID4gICAgICsgICAgICAgICAgICAg
ICBmd25vZGUgPSBkZXZpY2VfZ2V0X25leHRfY2hpbGRfbm9kZShrZGV2LCBmd25vZGUpOwo+IAo+
ID4gPiBXaG8gaXMgZHJvcHBpbmcgcmVmZXJlbmNlIGNvdW50aW5nIG9uIGZ3bm9kZSA/Cj4gPgo+
ID4gV2UgYXJlIGRlYWxpbmcgd2l0aCBBQ1BJIGZ3bm9kZS1zIGhlcmUgYW5kIHRob3NlIGFyZSBu
b3QgcmVmLWNvdW50ZWQsIHRoZXkKPiA+IGFyZSBlbWJlZGRlZCBpbnNpZGUgYSBzdHJ1Y3QgYWNw
aV9kZXZpY2UgYW5kIHRoZWlyIGxpZmV0aW1lIGlzIHRpZWQgdG8KPiA+IHRoYXQgc3RydWN0LiBU
aGV5IHNob3VsZCBwcm9iYWJseSBzdGlsbCBiZSByZWYtY291bnRlZCAod2l0aCB0aGUgY291bnQK
PiA+IG5ldmVyIGRyb3BwaW5nIHRvIDApIHNvIHRoYXQgdGhlIGdlbmVyaWMgZndub2RlIGZ1bmN0
aW9ucyBiZWhhdmUgdGhlIHNhbWUKPiA+IGFueXdoZXJlIGJ1dCBhdG0gdGhlIEFDUEkgbm9kZXMg
YXJlIG5vdCByZWZjb3VudGVkLCBzZWU6IGFjcGlfZ2V0X25leHRfc3Vibm9kZSgpCj4gPiBpbiBk
cml2ZXJzL2FjcGkvcHJvcGVydHkuYyB3aGljaCBpcyB0aGUgZ2V0X25leHRfY2hpbGRfbm9kZSgp
IGltcGxlbWVudGF0aW9uCj4gPiBmb3IgQUNQSSBmd25vZGUtcy4KPiAKPiBZZXMsIEFDUEkgY3Vy
cmVudGx5IGlzIGV4Y2VwdGlvbmFsLCBidXQgZndub2RlIEFQSSBpcyBub3QuCj4gSWYgeW91IG1h
eSBndWFyYW50ZWUgdGhhdCB0aGlzIGNhc2Ugd29uJ3QgZXZlciBiZSBvdXRzaWRlIG9mIEFDUEkg
YW5kCj4gZXZlbiB0aG91Z2ggaWYgQUNQSSB3b24ndCBldmVyIGdhaW4gYSByZWZlcmVuY2UgY291
bnRpbmcgZm9yIGZ3bm9kZXMsCj4gd2UgY2FuIGxlYXZlIGl0IGFzIGlzLgo+IAo+ID4gPiBJ4oCZ
bSBpbiB0aGUgbWlkZGxlIG9mIGEgcGlsZSBvZiBmaXhlcyBmb3IgZndub2RlIHJlZmNvdW50aW5n
IHdoZW4KPiA+ID4gZm9yX2VhY2hfY2hpbGQgb3IgZ2V0X25leHRfY2hpbGQgaXMgdXNlZC4gU28s
IHBsZWFzZSBkb3VibGUgY2hlY2sgeW91Cj4gPiA+IGRyb3AgYSByZWZlcmVuY2UuCj4gPgo+ID4g
VGhlIGtkb2MgY29tbWVudHMgb24gZGV2aWNlX2dldF9uZXh0X2NoaWxkX25vZGUoKSAvIGZ3bm9k
ZV9nZXRfbmV4dF9jaGlsZF9ub2RlKCkKPiA+IGRvIG5vdCBtZW50aW9uIGFueXRoaW5nIGFib3V0
IHRoZXNlIGZ1bmN0aW9ucyByZXR1cm5pbmcgYSByZWZlcmVuY2UuCj4gCj4gSXQncyBwb3NzaWJs
ZS4gSSBkdW5ubyBpZiBpdCBoYWQgdG8gYmUgZG9uZSBlYXJsaWVyLiBTYWthcmk/CgpUaGUgZndu
b2RlIEFQSSBoYXMgd29ya2VkIHdpdGggcmVmZXJlbmNlcyBmb3IgYSBsb25nIHRpbWUsIGxvb2tz
IGxpa2UgZnJvbQp0aGUgdmVyeSBiZWdpbm5pbmcgb2YgaXQsIGFzIGluIHBhdGNoCjhhMDY2MmQ5
ZWQyOTY4ZTExODYyMDgzMzZhOGUxZmFiM2ZkZmVhNjMgLgoKSWYgeW91J3JlIGV4cGVjdGluZyBh
biBmd25vZGUgZmFtaWx5IG9mIGZ1bmN0aW9uIHJldHVybmluZyBhbm90aGVyIG5vZGUsCnRoZW4g
dGhhdCBmdW5jdGlvbiBoYXMgdG8gaGF2ZSB0YWtlbiBhIHJlZmVyZW5jZSB0byB0aGF0IG5vZGUg
YmVmb3JlCnJldHVybmluZyBpdC4gT3RoZXJ3aXNlIHRoZXJlJ3Mgbm8gZ3VhcmFudGVlIHRoYXQg
bm9kZSBpcyBzdGlsbCB0aGVyZSB3aGVuCml0IGlzIHJldHVybmVkLgoKSXQgbWF5IGJlIHRoaXMg
aXMgbm90IGRvY3VtZW50ZWQgZm9yIGV2ZXJ5IGZ1bmN0aW9uIGRvaW5nIHNvLiBUaGF0IHNob3Vs
ZApwcm9iYWJseSBiZSBhZGRlZC4KCi0tIApLaW5kIHJlZ2FyZHMsCgpTYWthcmkgQWlsdXMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
