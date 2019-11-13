Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D2AFB7DC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 19:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84346EDFD;
	Wed, 13 Nov 2019 18:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A5F6EDFE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 18:45:07 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id r4so2237620pfl.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 10:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ytOa/TRpYZHcXnwihJ6zpPIzYpkWSN253EE1mDAjXKo=;
 b=IK5H7y01BJV0w9k9jCR1KQVAzVHJDcaCPOzHJ/XYPXDK7kuuSL4RWogH0USOFrMncE
 7nyADfJP4mKeu8/eZb1+boxMg0T2QBihkuTp4WYFwcJKxQhd4SL3k2J5qjWs0y/2UJG5
 mJ751qvmGJJnYkKsO8jHDx7uFL8kBXuWdL5uxXAaIFA463VH6Pyv9L6O28pT1e7LUQmB
 8Q7mIVOGr1QnzzaiiImyYtSnmdjCmNuYHc/ZkYsDT5/DZQD+QLKT+sPhK3VbBeXBlJPz
 QddY3NhgEXHL5lmzRdCEMe4oFTziHtsyFOfSrpY+qbotcOec+VqkGr+Ey/bKwayPoNGP
 jPdw==
X-Gm-Message-State: APjAAAXFGTmI2MfhpT9rh3eo57NeBm7qJdPY1klxi6q40zyxgeltvSXz
 ivxGhMxmsB6rCSHGbURWNaJN+E5k
X-Google-Smtp-Source: APXvYqw6X5AwWUNGodgFhZ6+c75EuWASAsRsHY14mdl8no689akd+8+9HvchuIg7nCAOCno/VfHAOg==
X-Received: by 2002:aa7:9d8b:: with SMTP id f11mr6212536pfq.20.1573670707173; 
 Wed, 13 Nov 2019 10:45:07 -0800 (PST)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id 21sm4273627pfa.170.2019.11.13.10.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 10:45:06 -0800 (PST)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 68732403DC; Wed, 13 Nov 2019 18:45:05 +0000 (UTC)
Date: Wed, 13 Nov 2019 18:45:05 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] video: fbdev: atyfb: only use ioremap_uc() on i386 and
 ia64
Message-ID: <20191113184505.GW11244@42.do-not-panic.com>
References: <20191111192258.2234502-1-arnd@arndb.de>
 <20191112105507.GA7122@lst.de>
 <CAKMK7uEEz1n+zuTs29rbPHU74Dspaib=prpMge63L_-rUk_o4A@mail.gmail.com>
 <20191112140631.GA10922@lst.de>
 <CAKMK7uFaA607rOS6x_FWjXQ2+Qdm8dQ1dQ+Oi-9if_Qh_wHWPg@mail.gmail.com>
 <20191112222423.GO11244@42.do-not-panic.com>
 <20191113072708.GA3213@lst.de>
 <CAK8P3a3OpiWAep86tOiN1Fj2W7ud5hQ1OLTkBR8ueAKsMHk-dA@mail.gmail.com>
 <20191113093154.GB32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113093154.GB32742@smile.fi.intel.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-ia64@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Lee Jones <lee.jones@linaro.org>, Christoph Hellwig <hch@lst.de>,
 X86 ML <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Tuowen Zhao <ztuowen@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Luis R. Rodriguez" <mcgrof@suse.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Juergen Gross <jgross@suse.com>, Tony Luck <tony.luck@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Roman Gilg <subdiff@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMTE6MzE6NTRBTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFdlZCwgTm92IDEzLCAyMDE5IGF0IDA4OjM4OjE1QU0gKzAxMDAsIEFybmQg
QmVyZ21hbm4gd3JvdGU6Cj4gPiBPbiBXZWQsIE5vdiAxMywgMjAxOSBhdCA4OjI3IEFNIENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBOb3Yg
MTIsIDIwMTkgYXQgMTA6MjQ6MjNQTSArMDAwMCwgTHVpcyBDaGFtYmVybGFpbiB3cm90ZToKPiA+
ID4gPiBJIHRoaW5rIHRoaXMgd291bGQgYmUgcG9zc2libGUgaWYgd2UgY291bGQgZmxvcCBpb3Jl
bWFwX25vY2FjaGUoKSB0byBVQwo+ID4gPiA+IGluc3RlYWQgb2YgVUMtIG9uIHg4Ni4gT3RoZXJ3
aXNlLCBJIGNhbid0IHNlZSBob3cgd2UgY2FuIHJlbW92ZSB0aGlzIGJ5Cj4gPiA+ID4gc3RpbGwg
bm90IGFsbG93aW5nIGRpcmVjdCBNVFJSIGNhbGxzLgo+ID4gPgo+ID4gPiBJZiBldmVyeXRoaW5n
IGdvZXMgd2VsbCBpb3JlbWFwX25vY2FjaGUgd2lsbCBiZSBnb25lIGFzIG9mIDUuNS4KPiA+IAo+
ID4gQXMgaW9yZW1hcF9ub2NhY2hlKCkganVzdCBhbiBhbGlhcyBmb3IgaW9yZW1hcCgpLCBJIHN1
cHBvc2UgdGhlIGlkZWEgd291bGQKPiA+IHRoZW4gYmUgdG8gbWFrZSB4ODYgaW9yZW1hcCBiZSBV
QyBpbnN0ZWFkIG9mIFVDLSwgYWdhaW4gbWF0Y2hpbmcgd2hhdCB0aGUKPiA+IG90aGVyIGFyY2hp
dGVjdHVyZXMgZG8gYWxyZWFkeS4KPiAKPiBJIHRoaW5rIGl0J3MgcmlnaHQgdGhpbmcgdG8gZG8s
IGkuZS4gYXNzdW1lIHRoYXQgaW9yZW1hcCgpIGFsd2F5cyBkb2VzIHN0cm9uZwo+IFVDIGluZGVw
ZW5kZW50bHkgb24gTVRSUiBzZXR0aW5ncy4KCkFncmVlZCB3aG9sZWhlYXJ0ZWRseS4gV2hhdCBh
cmUgdGhlIGJsb2NrZXJzIGZyb20gbWFraW5nIHRoYXQgaGFwcGVuPyBEbwp3ZSBoYXZlIGFueSBs
ZWZ0PwoKICBMdWlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
