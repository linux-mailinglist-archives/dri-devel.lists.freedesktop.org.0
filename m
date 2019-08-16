Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2191178
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2873D6EAE4;
	Sat, 17 Aug 2019 15:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E7F6E33F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 12:52:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D724B011;
 Fri, 16 Aug 2019 12:52:09 +0000 (UTC)
Date: Fri, 16 Aug 2019 14:52:07 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [Bug 204407] New: Bad page state in process Xorg
Message-ID: <20190816125207.GA23865@suse.de>
References: <bug-204407-27@https.bugzilla.kernel.org/>
 <20190802132306.e945f4420bc2dcddd8d34f75@linux-foundation.org>
 <20190802203344.GD5597@bombadil.infradead.org>
 <1564780650.11067.50.camel@lca.pw>
 <20190802225939.GE5597@bombadil.infradead.org>
 <CA+i2_Dc-VrOUk8EVThwAE5HZ1-zFqONuW8Gojv+16UPsAqoM1Q@mail.gmail.com>
 <45258da8-2ce7-68c2-1ba0-84f6c0e634b1@suse.cz>
 <0287aace-fec1-d2d1-370f-657e80477717@vandrovec.name>
 <6a45a9b1-81ad-72c4-8f06-5d2cd87278ef@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a45a9b1-81ad-72c4-8f06-5d2cd87278ef@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
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
Cc: David Airlie <airlied@linux.ie>, bugzilla-daemon@bugzilla.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Qian Cai <cai@lca.pw>,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Petr Vandrovec <petr@vandrovec.name>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDI6NDc6NTNQTSArMDIwMCwgVmxhc3RpbWlsIEJhYmth
IHdyb3RlOgo+IE9uIDgvMTUvMTkgOToxMyBQTSwgUGV0ciBWYW5kcm92ZWMgd3JvdGU6Cj4gPiBb
wqDCoCAxOC4xMTA5ODVdIERNQVI6IFtETUEgV3JpdGVdIFJlcXVlc3QgZGV2aWNlIFswNzowMC4x
XSBmYXVsdCBhZGRyIAo+ID4gZmZmZTAwMDDCoFtmYXVsdMKgcmVhc29uwqAwMl3CoFByZXNlbnTC
oGJpdMKgaW7CoGNvbnRleHTCoGVudHJ5wqBpc8KgY2xlYXIKPiAKPiBXb3J0aCByZXBvcnRpbmcg
YXMgd2VsbCwgbm90IG5pY2UgcmVncmVzc2lvbi4KCklzIHRoYXQgYSByZWdyZXNzaW9uIGJldHdl
ZW4gNS4zLXJjMyBhbmQgNS4zLXJjNCBvciBpcyBpdCBhbHJlYWR5IGJyb2tlbgpzaW5jZSAtcmMx
PyBUaGUgNS4zLXJjNSBrZXJuZWwgd2lsbCBjb250YWlucyBzb21lIFZULWQgZml4ZXMgdGhhdCBh
cmUKd29ydGggYSB0cnkgaGVyZSB0b28uIElmIHlvdSBjYW4gdGVzdCBsYXRlc3QgbGludXMvbWFz
dGVyIGJyYW5jaCB0aGF0CndvdWxkIGJlIGdyZWF0LCBvdGhlcndpc2UgLXJjNSBpcyBmaW5lIHRv
by4KCgpSZWdhcmRzLAoKCUpvZXJnCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
