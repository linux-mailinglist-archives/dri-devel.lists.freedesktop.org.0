Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E80432D2E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 11:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E4789211;
	Mon,  3 Jun 2019 09:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4DB5C89203;
 Mon,  3 Jun 2019 09:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 64BD12AA100;
 Mon,  3 Jun 2019 11:50:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id XU7Yz1o_dxlc; Mon,  3 Jun 2019 11:50:54 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 726A92AA0E9;
 Mon,  3 Jun 2019 11:50:54 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hXjcD-0002sz-F9; Mon, 03 Jun 2019 11:50:53 +0200
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
To: Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20190514110242.6f6ba4b0@eldfell.localdomain>
 <9b6386239ecae396fc4f5cc4467f8e76721f2c83.camel@intel.com>
 <CAKMK7uHJPugRWJx32oWVF94jBf28P0nBirZNbSBRMS1SbUaS9A@mail.gmail.com>
 <20190514163602.7d252b12@eldfell.localdomain>
 <CAKMK7uGMJMZiOP4rhhiu=Obu6sO0oav5se-vy8bNLu8dfoZmvA@mail.gmail.com>
 <20190515103731.16855195@eldfell.localdomain>
 <20190515082449.GA17751@phenom.ffwll.local>
 <20190516112211.1cd5a8c6@eldfell.localdomain>
 <20190516122455.GA3851@phenom.ffwll.local>
 <20190517130824.17372663@eldfell.localdomain>
 <20190520161107.GA21222@phenom.ffwll.local>
 <20190521095505.7ef1cbdf@eldfell.localdomain>
 <CAKMK7uGoVhAOkZN7G1fuzdUjihjxqRhVuVvE3K5HFZwGjyC6Hg@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Openpgp: preference=signencrypt
Autocrypt: addr=michel@daenzer.net; prefer-encrypt=mutual; keydata=
 mQGiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPLQjTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD6IXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkK5AQ0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpYhGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAn2Ufk2d6/3p4
 Cuyz/NX7KpL2dQ8WAJ9UD5JEakhfofed8PSqOM7jOO3LCA==
Message-ID: <9953e1fa-dafa-21c1-9604-50ed1e9fecaf@daenzer.net>
Date: Mon, 3 Jun 2019 11:50:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGoVhAOkZN7G1fuzdUjihjxqRhVuVvE3K5HFZwGjyC6Hg@mail.gmail.com>
Content-Language: en-CA
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
Cc: "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "Ser, Simon" <simon.ser@intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yMSA5OjUyIGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVHVlLCBN
YXkgMjEsIDIwMTkgYXQgODo1NSBBTSBQZWtrYSBQYWFsYW5lbiA8cHBhYWxhbmVuQGdtYWlsLmNv
bT4gd3JvdGU6Cj4+IE9uIE1vbiwgMjAgTWF5IDIwMTkgMTg6MTE6MDcgKzAyMDAKPj4gRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPj4KPj4+IFRoZXJlJ3MgYWxzbyBhIGZh
aXJseSBlYXN5IGZpeCBmb3IgdGhhdCAtbW9kZXNldHRpbmcgaXNzdWU6IFdlIGRvbid0Cj4+PiBl
eHBvc2UgYXRvbWljIGlmIHRoZSBjb21wb3NpdG9yIGhhcyBhIHByb2Nlc3MgbmFtZSBvZiAiWHNl
cnZlciIuIEJydXRhbCwKPj4+IGJ1dCBnZXRzIHRoZSBqb2IgZG9uZS4gT25jZSBYIGlzIGZpeGVk
LCB3ZSBjYW4gZ2l2ZSBhIG5ldyAiSSdtIG5vdCB0b3RhbGx5Cj4+PiBicm9rZW4gYW55bW9yZSIg
aW50ZXJmYWNlIHRvIGdldCBiYWNrIGF0IGF0b21pYy4KPj4KPj4gWW91IG1lYW4gIlhvcmciLiBP
ciBtYXliZSAiWCIuIE9yIG1heWJlIHRoZSBzZXR1aWQgaGVscGVyPyBXYWl0LCBkbyB5b3UKPj4g
Y2hlY2sgYWdhaW5zdCB0aGUgcHJvY2VzcyBpc3N1aW5nIGlvY3RsIGJ5IGlvY3RsLCBvciB0aGUg
cHJvY2VzcyB0aGF0Cj4+IG9wZW5lZCB0aGUgZGV2aWNlPyBXaGljaCB3b3VsZCBiZSBsb2dpbmQ/
IFdoYXQgYWJvdXQgRFJNIGxlYXNpbmc/IC4uLgo+IAo+IEluIHRoZSBHZXQvU2V0Q2FwcyBpb2N0
bCB3ZSBjYW4gZG8gdGhlIGNoZWNrLCB3aGljaCBpcyBjYWxsZWQgZnJvbSBYLAo+IG5vdCBsb2dp
bmQuIFdlIGp1c3QgbmVlZCBzb21lIHdheSB0byB0ZWxsIC1tb2Rlc2V0dGluZyBhcGFydCBmcm9t
Cj4gZXZlcnl0aGluZyBlbHNlLCBhbmQgbHVja2lseSB0aGVyZSdzIG5vdCBhbnkgb3RoZXIgYXRv
bWljIFggZHJpdmVycy4KCk5vdCB5ZXQuLi4KCkFzIGZvciBhICJJJ20gbm90IHRvdGFsbHkgYnJv
a2VuIGFueW1vcmUiIGludGVyZmFjZSwgd2UgZGlkIHNvbWV0aGluZwpsaWtlIHRoYXQgKHRob3Vn
aCBraW5kIG9mIGluIHRoZSBvdGhlciBkaXJlY3Rpb24pIHdpdGgKUkFERU9OX0lORk9fQUNDRUxf
V09SS0lORywgYnV0IGxhdGVyIFJBREVPTl9JTkZPX0FDQ0VMX1dPUktJTkcyIGhhZCB0bwpiZSBh
ZGRlZCwgYmVjYXVzZSB0aGUgZm9ybWVyIGNsYWltZWQgYWNjZWxlcmF0aW9uIHdhcyAid29ya2lu
ZyIgaW4gY2FzZXMKd2hlcmUgaXQgcmVhbGx5IHdhc24ndC4uLiBUaGF0IGtpbmQgb2YgdGhpbmcg
Y291bGQgYmVjb21lIHVnbHkgaW4gdGhlCmxvbmcgcnVuIGlmIG90aGVyIFhvcmcgZHJpdmVyIHN0
YXJ0IHVzaW5nIGF0b21pYywgYW5kIHRoZXknbGwgaW5ldml0YWJseQpiZSBicm9rZW4gaW4gZGlm
ZmVyZW50IHdheXMuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAg
IHwgICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVz
aWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
