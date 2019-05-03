Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F30BB12E8C
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A56489CF2;
	Fri,  3 May 2019 12:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3AD89CBE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:55:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9779831E;
 Fri,  3 May 2019 14:55:39 +0200 (CEST)
Date: Fri, 3 May 2019 15:55:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 08/22] drm/bridge: tc358767: split stream enable/disable
Message-ID: <20190503125526.GG4912@pendragon.ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-9-tomi.valkeinen@ti.com>
 <20190420212913.GK4964@pendragon.ideasonboard.com>
 <c5b5ca05-2c0a-7cb2-e916-e655138f3e58@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5b5ca05-2c0a-7cb2-e916-e655138f3e58@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1556888139;
 bh=0pt/C8/sX6sBddU+nTHgJBSypG9wPUuJyaQdU4QmBhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n/WjmZO7Ktu4tJVsfgUIDZSKv28zfwF5pLcugHzq+RjjrtBgyrt9hPM6T1Oa2gWTj
 T/8vvcGOijebBfphvueUskCQL8veSMFR/JDpaMjttkcWrEbOeCYPgIcOLgskUi9hcb
 Byvd8BMWNdBrb2nxHekS5AUHNuZgctf7/RFuMI9c=
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIEZyaSwgTWF5IDAzLCAyMDE5IGF0IDEyOjIwOjQ5UE0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDIxLzA0LzIwMTkgMDA6MjksIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBPbiBUdWUsIE1hciAyNiwgMjAxOSBhdCAxMjozMTozMlBNICswMjAwLCBUb21p
IFZhbGtlaW5lbiB3cm90ZToKPiA+PiBJdCBpcyBuaWNlciB0byBoYXZlIGVuYWJsZS9kaXNhYmxl
IGZ1bmN0aW9ucyBpbnN0ZWFkIG9mIHNldChib29sIGVuYWJsZSkKPiA+PiBzdHlsZSBmdW5jdGlv
bi4KPiA+IAo+ID4gV2hlbiB0aGUgdHdvIGZ1bmN0aW9ucyBoYXZlIG5vdGhpbmcgaW4gY29tbW9u
LCB5ZXMuCj4gPiAKPiA+PiBTcGxpdCB0Y19tYWluX2xpbmtfc3RyZWFtIGludG8gdGNfc3RyZWFt
X2VuYWJsZSBhbmQgdGNfc3RyZWFtX2Rpc2FibGUuCj4gPiAKPiA+IFNob3VsZCB5b3Uga2VlcCB0
aGUgdGNfbWFpbl9saW5rXyBwcmVmaXggPyBJIHN1cHBvc2UgaXQgaXMgaW1wbGllZCBpbiBhCj4g
PiB3YXksIGFzIHRoZSBzdHJlYW0gaXMgY2FycmllZCBvdmVyIHRoZSBtYWluIGxpbmsuCj4gCj4g
SXQgc291bmRzIGEgYml0IHJlZHVuZGFudCwgb25seSBtYWtpbmcgdGhlIGZ1bmN0aW9ucyBuYW1l
cyBsb25nZXIuCgpBIGJpdCwgYnV0IGl0IGFsc28gbWFrZXMgdGhlIGNvZGUgYSBiaXQgY2xlYXJl
ciBpbiBteSBvcGluaW9uLiBVcCB0bwp5b3UuCgo+ID4+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFs
a2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gPj4gLS0tCj4gPj4gIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDgxICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygt
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3Njcu
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+ID4+IGluZGV4IDg2YjI3MjQy
MjI4MS4uYmZjNjczYmQ1OTg2IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGMzNTg3NjcuYwo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3Njcu
Ywo+ID4+IEBAIC0xMDEzLDQ3ICsxMDEzLDU2IEBAIHN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX3Nl
dHVwKHN0cnVjdCB0Y19kYXRhICp0YykKPiA+PiAgCXJldHVybiByZXQ7Cj4gPj4gIH0KPiA+PiAg
Cj4gPj4gLXN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX3N0cmVhbShzdHJ1Y3QgdGNfZGF0YSAqdGMs
IGludCBzdGF0ZSkKPiA+PiArc3RhdGljIGludCB0Y19zdHJlYW1fZW5hYmxlKHN0cnVjdCB0Y19k
YXRhICp0YykKPiA+PiAgewo+ID4+ICAJaW50IHJldDsKPiA+PiAgCXUzMiB2YWx1ZTsKPiA+PiAg
Cj4gPj4gLQlkZXZfZGJnKHRjLT5kZXYsICJzdHJlYW06ICVkXG4iLCBzdGF0ZSk7Cj4gPj4gKwlk
ZXZfZGJnKHRjLT5kZXYsICJzdHJlYW0gZW5hYmxlXG4iKTsKPiA+IAo+ID4gTWF5YmUgImVuYWJs
ZSB2aWRlbyBzdHJlYW1cbiIgKGFuZCBzaW1pbGFybHkgZm9yIHRoZSB0Y19zdHJlYW1fZGlzYWJs
ZSgpCj4gPiBmdW5jdGlvbikgPwo+IAo+IE9rLgo+IAo+ID4+ICAKPiA+PiAtCWlmIChzdGF0ZSkg
ewo+ID4+IC0JCXJldCA9IHRjX3NldF92aWRlb19tb2RlKHRjLCB0Yy0+bW9kZSk7Cj4gPj4gLQkJ
aWYgKHJldCkKPiA+PiAtCQkJZ290byBlcnI7Cj4gPj4gKwlyZXQgPSB0Y19zZXRfdmlkZW9fbW9k
ZSh0YywgdGMtPm1vZGUpOwo+ID4+ICsJaWYgKHJldCkKPiA+PiArCQlnb3RvIGVycjsKPiA+IAo+
ID4gTGV0J3MgcmV0dXJuIHJldCBkaXJlY3RseSBhbmQgcmVtb3ZlIHRoZSBlcnIgbGFiZWwuCj4g
Cj4gQ2FuJ3QgcmVtb3ZlIHRoZSBlcnIgbGFiZWwsIGJlY2F1c2Ugb2YgdGhlIHRjX3dyaXRlKCkg
Y2FsbHMuLi4KCjotKAoKSSdkIGxvdmUgdG8gc2VlIHRoaXMgZ2V0dGluZyBmaXhlZC4gVGhlIGJl
c3Qgd2F5IEkndmUgZm91bmQgc28gZmFyIHdvdWxkCmJlCgppbnQgdGNfd3JpdGUoc3RydWN0IHRj
X2RhdGEgKnRjLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgdmFsdWUsIGludCAmZXJy
KQp7Cgl1bnNpZ25lZCBpbnQgcmV0OwoKCWlmIChlcnIgJiYgKmVycikKCQlyZXR1cm4gKmVycjsK
CglyZXQgPSBkb190aGVfd3JpdGVfaGVyZSguLi4sIHJlZywgdmFsdWUpOwoJaWYgKGVycikKCQkq
ZXJyID0gcmV0OwoKCXJldHVybiByZXQ7Cn0KClRoaXMgY2FuIGJlIHVzZWQgYXMKCglpbnQgcmV0
ID0gMDsKCgl0Y193cml0ZSh0YywgUkVHMCwgVkFMMCwgJnJldCk7CgkuLi4KCXRjX3dyaXRlKHRj
LCBSRUduLCBWQUxuLCAmcmV0KTsKCglpZiAocmV0KQoJCS8qIEVycm9yIGhhbmRsaW5nICovCgot
LSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
