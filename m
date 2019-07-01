Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726465C4BA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CC189D9A;
	Mon,  1 Jul 2019 20:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F17889BFF
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 14:25:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id n9so4200235wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 07:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=VA6etb7PKcueUzChPNSXMUbieaUCUkK9Wor2+kjhzg0=;
 b=jjFTqrBAMY++CFg1dXn4FHS1Chvxls+atJmmN2freDxFoMUmxo6wGcVRkNhTAja+m4
 9H0EQJmwWAQgQgGf84A2XUSSR7I2HQq1AsuiY7AneAPZGiAKlklm6p/JwcMW6SaX5G2a
 +qahC23NeJCdXEmMCinRxb1DFz0OMnMcsdVVwMlwUGap0BN7j5AVqRaL4sUloRGD06X2
 Fae1Anyp0Z0DFu6O+EPNMDTQxggWsq1EXFsbjACzqtePZx956XOYQlUJGFIoJ5OQIra7
 zCxeVx/H7ewe5+GXiMzKohf4q0FsaWZo6dbsn+QmIjZcjfF/xc088klTxI163mo6cX0K
 xU2g==
X-Gm-Message-State: APjAAAVV3tLd1r34iqNXUrvN+pWDQ0lOPc7qMDjjS/V3xXKCKvsLiBp/
 NDIlEpUt5DeIUZal9A7ex1ZigwtD
X-Google-Smtp-Source: APXvYqyKyObSsAs3KQCEzT9dyY88sCOnUzgmodrzRuveD+3nI1xtN4ngfz1yIUvLjVGU7pGJ0y0HgQ==
X-Received: by 2002:a1c:bbc1:: with SMTP id
 l184mr17083909wmf.111.1561991131976; 
 Mon, 01 Jul 2019 07:25:31 -0700 (PDT)
Received: from Timur-XPS ([152.66.80.213])
 by smtp.gmail.com with ESMTPSA id y2sm9487234wrl.4.2019.07.01.07.25.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 07:25:31 -0700 (PDT)
Message-ID: <28afd27aaa02346cf52fcbe1c7556670fdcad3ca.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Mon, 01 Jul 2019 16:25:30 +0200
In-Reply-To: <20190701114453.GR2640@lahna.fi.intel.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <20190628125346.GM2640@lahna.fi.intel.com>
 <c5545128e27cbcce5888f9972ff066fb4979fd28.camel@gmail.com>
 <20190628141455.GO2640@lahna.fi.intel.com>
 <29c0d7a01f5b233ff3b68ad215f7ac9308f860db.camel@gmail.com>
 <20190701114453.GR2640@lahna.fi.intel.com>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=VA6etb7PKcueUzChPNSXMUbieaUCUkK9Wor2+kjhzg0=;
 b=dGWTmXaXzxQtzTcG3XPNmMxBPI+e5EObSecypzNlTbyUqAr3zVJlf4N7v8NRjkUiS7
 dwNS7ZaDDzBvbUKNyDvUnLnJbg/44mtxQFJEccsqc0nBTkdUcpO0+2pW2p8mVaKLpI07
 xP1mdcVf7WGVL0sbEPO0DGTIJJztR4QS0wfySzATxZuxX+pru4E0k4UdtyJEFv20Z10U
 CEVG2dMUd3FHM2BMcHOTWtlmgx/gXJbUDD2SmzkRZULtkPdZOlTJWIGg2N7uABl+Z7eV
 HRY4z4acpdrMXFyViAh4Gu2jCLYTrUpbjthDQHuXHkpzOG/8qQAdT4h8fms//1KuC4qh
 qHyQ==
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+IAo+ID4gVGhhdCdzIHVuZm9ydHVuYXRlLCBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgdGhlcmUg
dG8gYmUgc29tZSBzb3J0IG9mCj4gPiBQQ0llCj4gPiBzcGVlZCB0ZXN0IHV0aWxpdHkuCj4gPiAK
PiA+IE5vdyB0aGF0IEkgZ2F2ZSBpdCBhIHRyeSwgSSBjYW4gbWVhc3VyZSB+MjAgR2JpdC9zZWMg
d2hlbiBJIHJ1bgo+ID4gR25vbWUKPiA+IFdheWxhbmQgb24gdGhpcyBzeXN0ZW0gKHdoaWNoIGZv
cmNlcyB0aGUgZUdQVSB0byBzZW5kIHRoZQo+ID4gZnJhbWVidWZmZXIKPiA+IGJhY2sgYW5kIGZv
cnRoIGFsbCB0aGUgdGltZSAtIGZvciB0d28gNEsgbW9uaXRvcnMpLiBCdXQgaXQgc3RpbGwKPiA+
IGRvZXNuJ3QgZ2l2ZSBtZSA0MCBHYml0L3NlYy4KPiAKPiBIb3cgZG8geW91IG1lYXN1cmUgdGhh
dD8gSXMgdGhlcmUgYSBEUCBzdHJlYW0gYWxzbz8gQXMgSSBzYWlkIHRoZQo+IGJhbmR3aWR0aCBp
cyBkeW5hbWljYWxseSBzaGFyZWQgYmV0d2VlbiB0aGUgY29uc3VtZXJzIHNvIHlvdSBwcm9iYWJs
eQo+IGRvCj4gbm90IGdldCB0aGUgZnVsbCBiYW5kd2lkdGggZm9yIFBDSWUgb25seSBiZWNhdXNl
IGl0IG5lZWRzIHRvIHJlc2VydmUKPiBzb21ldGhpbmcgZm9yIHBvc3NpYmxlIERQIHN0cmVhbXMg
YW5kIHNvIG9uLgoKSSdtIG1lYXN1cmluZyBpdCB1c2luZyBBTUQncyBwY2llX2J3IHN5c2ZzIGlu
dGVyZmFjZSB3aGljaCBzaG93cyBob3cKbWFueSBwYWNrZXRzIHdlcmUgc2VudCBhbmQgcmVjZWl2
ZWQgYnkgdGhlIEdQVSwgYW5kIHRoZSBtYXggcGFja2V0CnNpemUuIFNvIGl0J3Mgbm90IGFuIGV4
YWN0IG1lYXN1cmVtZW50IGJ1dCBhIGdvb2QgZXN0aW1hdGUuCgpBRkFJSyB0aGVyZSBpcyBubyBE
UCBzdHJlYW0uIE9ubHkgdGhlIGVHUFUgaXMgY29ubmVjdGVkIHRvIHRoZSBUQjMgcG9ydAphbmQg
bm90aGluZyBlbHNlLiBUaGUgZ3JhcGhpY3MgY2FyZCBpbnNpZGUgdGhlIFRCMyBlbmNsb3N1cmUg
ZG9lcyBoYXZlCmEgRFAgY29ubmVjdG9yIHdoaWNoIGlzIGluIHVzZSwgYnV0IEkgYXNzdW1lIHRo
YXQncyBub3Qgd2hhdCB5b3UgbWVhbi4KCkl0IGFsc28gZG9lc24ndCBzZWVtIHRvIG1ha2UgYSBk
aWZmZXJlbmNlIHdoZXRoZXIgb3Igbm90IGFueXRoaW5nIGlzCnBsdWdnZWQgaW50byB0aGUgVVNC
IHBvcnRzIHByb3ZpZGVkIGJ5IHRoZSBlR1BVLiAoU29tZSBvbmxpbmUgcG9zdHMKc3VnZ2VzdCB0
aGF0IG5vdCB1c2luZyB0aG9zZSBwb3J0cyB3b3VsZCBhbGxvdyBoaWdoZXIgdGhyb3VnaHB1dCB0
byB0aGUKZUdQVSwgYnV0IEkgZG9uJ3Qgc2VlIHRoYXQgaXQgd291bGQgbWFrZSBhbnkgZGlmZmVy
ZW5jZSBoZXJlLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
