Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93863442F9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 18:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E7989233;
	Thu, 13 Jun 2019 16:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 716C4891AC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 16:27:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 269F3367;
 Thu, 13 Jun 2019 09:27:57 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0759D3F694;
 Thu, 13 Jun 2019 09:27:57 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id BDC80682579; Thu, 13 Jun 2019 17:27:55 +0100 (BST)
Date: Thu, 13 Jun 2019 17:27:55 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] malidp: no need to check return value of debugfs_create
 functions
Message-ID: <20190613162755.GR4173@e110455-lin.cambridge.arm.com>
References: <20190613132829.GB4863@kroah.com>
 <20190613145221.GP4173@e110455-lin.cambridge.arm.com>
 <20190613155713.GA4632@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613155713.GA4632@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDU6NTc6MTNQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDAzOjUyOjIyUE0gKzAxMDAsIExp
dml1IER1ZGF1IHdyb3RlOgo+ID4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6Mjg6MjlQTSAr
MDIwMCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+ID4gPiBXaGVuIGNhbGxpbmcgZGVidWdm
cyBmdW5jdGlvbnMsIHRoZXJlIGlzIG5vIG5lZWQgdG8gZXZlciBjaGVjayB0aGUKPiA+ID4gcmV0
dXJuIHZhbHVlLiAgVGhlIGZ1bmN0aW9uIGNhbiB3b3JrIG9yIG5vdCwgYnV0IHRoZSBjb2RlIGxv
Z2ljIHNob3VsZAo+ID4gPiBuZXZlciBkbyBzb21ldGhpbmcgZGlmZmVyZW50IGJhc2VkIG9uIHRo
aXMuCj4gPiAKPiA+IEkgcmVtZW1iZXIgd2hlbiB3cml0aW5nIHRoaXMgY29kZSBhbmQgdGVzdGlu
ZyBub3QgZnVsbHkgY29tcGxldGUgY29kZSB0aGF0IGxlZnQKPiA+IG5vZGVzIGFyb3VuZCBvbiBy
ZW1vdmluZyB0aGUgbW9kdWxlIHRoYXQgdGhlcmUgd2VyZSBlcnJvcnMgYmVpbmcgcmV0dXJuZWQg
YnkKPiA+IGRlYnVnZnNfY3JlYXRlX2ZpbGUoKS4gSGFzIHRoYXQgY2hhbmdlZCBzaW5jZSAyIHll
YXJzIGFnbz8gOikKPiAKPiBFcnJvcnMgY2FuIGJlIHJldHVybmVkIGlmIHlvdSBkbyBzb21ldGhp
bmcgZm9vbGlzaDoKPiAJLSBwYXNzIGFuIGVycm9yIGFzIGEgcGFyZW50IHBvaW50ZXIKPiAJLSBw
YXNzIGEgbmFtZSB0aGF0IGlzIGFscmVhZHkgcHJlc2VudAoKVGhhdCBpcyB3aGF0IEkgd2FzIGhp
dHRpbmcgcHJldmlvdXNseS4gSWYgd2UgZm9sbG93IHRoZSBuZXcgYWR2aWNlIG9mIG5vdApjaGVj
a2luZyBmb3IgZXJyb3JzIGRvZXMgdGhpcyBtZWFuIEkgY2FuIG5vdyBzdGFydCB0byBoaWRlIGRl
YnVnZnMgZW50cmllcwpieSB0b3VjaGluZyBzb21lIGRlYnVnZnMgZmlsZXMgYmVmb3JlIG1vZHVs
ZXMgZ2V0IGxvYWRlZD8KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gb3IgaWYgdGhlIHN5c3RlbSBp
cyBvdXQgb2YgcmVzb3VyY2VzCj4gCS0gY2FuIG5vdCBpbmNyZW1lbnQgc3VwZXJibG9jayByZWZl
cmVuY2UKPiAJLSBvdXQgb2YgbWVtb3J5IHRvIGNyZWF0ZSBhbiBpbm9kZQo+IAo+IElmIHRob3Nl
IGxhc3QgdHdvIHRoaW5ncyBhcmUgaGFwcGVuaW5nLCB0aGVuIHlvdXIgc3lzdGVtIGlzIGNyYXNo
aW5nCj4gYWxyZWFkeSwgZGVidWdmcyBpcyB0aGUgbGVhc3Qgb2YgeW91ciB3b3JyaWVzIDopCj4g
Cj4gPiA+IENjOiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KPiA+ID4gQ2M6IEJy
aWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPiA+ID4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gU2ln
bmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4KPiA+IAo+ID4gQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+
ID4gCj4gPiBJJ2xsIHB1bGwgaXQgaW50byB0aGUgbWFsaWRwIHRyZWUuCj4gCj4gV29uZGVyZnVs
LCB0aGFua3MhCj4gCj4gZ3JlZyBrLWgKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291
bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdp
dmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAg
wq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
