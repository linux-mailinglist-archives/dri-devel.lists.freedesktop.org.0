Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E908115FF6
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2019 01:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8F56E293;
	Sun,  8 Dec 2019 00:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB8F6E293;
 Sun,  8 Dec 2019 00:07:18 +0000 (UTC)
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 333682176D;
 Sun,  8 Dec 2019 00:07:17 +0000 (UTC)
Date: Sun, 8 Dec 2019 01:07:02 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 11/14] HID: picoLCD: constify fb ops
In-Reply-To: <871rtji02a.fsf@intel.com>
Message-ID: <nycvar.YFH.7.76.1912080106260.4603@cbobk.fhfr.pm>
References: <cover.1575022735.git.jani.nikula@intel.com>
 <8678a9a3566279c881bb4db944850eef35d0a4bb.1575022735.git.jani.nikula@intel.com>
 <20191202094047.34525a7d@aether.lan.sysophe.eu> <871rtji02a.fsf@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575763638;
 bh=M7YFDrfsP98aHjcTFmDSkdeQQZQR99Y+Wunr3u7VZBk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=1TY4b7uPfggkxhFT+TY3ACqYiMTBwLT2da6upkhSP9ffdWP65lHcYCNWxCaVLoSdI
 nNqzfhmSQZ+33DwsBzNTLbncAzpH2IXNJw6CaWZR0LORJF34o81IxGrRrLHI2Au6KE
 eU8U9cK9EaBIOthIBFlz5Iupe4m6Q3Q60w8XZmh0=
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?ISO-8859-15?Q?Bruno_Pr=E9mont?= <bonbons@linux-vserver.org>,
 linux-input@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA1IERlYyAyMDE5LCBKYW5pIE5pa3VsYSB3cm90ZToKCj4gPj4gTm93IHRoYXQgdGhl
IGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25zdCwgd2UgY2FuIHN0YXJ0Cj4g
Pj4gbWFraW5nIHRoZSBvcHMgY29uc3QgYXMgd2VsbC4KPiA+Pgo+ID4+IHYyOiBmaXgJdHlwbyAo
Q2hyaXN0b3BoZSBkZSBEaW5lY2hpbikKPiA+Cj4gPiBGaW5lIHdpdGggbWUuCj4gPiBJIGRvbid0
IHRoaW5rIGdvaW5nIHRocm91Z2ggZHJtLW1pc2Mgd291bGQgdHJpZ2dlciBhbnkgY29uZmxpY3Qs
IGJ1dAo+ID4gYWRkaW5nIEppcmkgdG8gQ0MgZm9yIHRoZSBjYXNlIHRoZXJlIHdhcyBhbnkgcHJl
ZmVyZW5jZS4KPiA+Cj4gPiBBY2tlZC1ieTogQnJ1bm8gUHLDqW1vbnQgPGJvbmJvbnNAbGludXgt
dnNlcnZlci5vcmc+Cj4gCj4gTm8gcmVzcG9uc2UsIG1heSBJIHByb2NlZWQgd2l0aCBtZXJnaW5n
IHRoaXMgdGhyb3VnaCBkcm0tbWlzYyBwbGVhc2U/CgpJIGhhdmUgYmVlbiBvZmYgdGhlIGdyaWQg
dGhlIHBhc3Qgd2Vlaywgc29ycnkgZm9yIGJlbGF0ZWQgcmVzcG9uc2UuIEZlZWwgCmZyZWUgdG8g
YWRkCgoJQWNrZWQtYnk6IEppcmkgS29zaW5hIDxqa29zaW5hQHN1c2UuY3o+CgphbmQgdGFrZSBp
dCB0aHJvdWdoIHlvdXIgdHJlZS4KCi0tIApKaXJpIEtvc2luYQpTVVNFIExhYnMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
