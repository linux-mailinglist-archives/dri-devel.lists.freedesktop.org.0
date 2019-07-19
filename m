Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B9F6E315
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 11:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5046E5D1;
	Fri, 19 Jul 2019 09:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id F050A6E5D0;
 Fri, 19 Jul 2019 09:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 3735D2A6045;
 Fri, 19 Jul 2019 11:05:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Yq7CsvYtFlRu; Fri, 19 Jul 2019 11:05:46 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 3AF902A6042;
 Fri, 19 Jul 2019 11:05:45 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hoOpk-0002mO-O0; Fri, 19 Jul 2019 11:05:44 +0200
Subject: Re: [PATCH/RFT v1 0/6] drm/via: drop use of deprecated headers drmP.h
 and drm_os_linux.h
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190718153737.28657-1-sam@ravnborg.org>
 <20190719060712.GA26070@ravnborg.org>
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
Message-ID: <e2a3b772-96e7-0fed-d269-bb103057cafe@daenzer.net>
Date: Fri, 19 Jul 2019 11:05:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719060712.GA26070@ravnborg.org>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Kevin Brace <kevinbrace@gmx.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0xOSA4OjA3IGEubS4sIFNhbSBSYXZuYm9yZyB3cm90ZToKPiBPbiBUaHUsIEp1
bCAxOCwgMjAxOSBhdCAwNTozNzozMVBNICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4+IFRo
aXMgaXMgc29tZSBqYW5pdG9yaWFsIHVwZGF0ZXMgdG8gdGhlIHZpYSBkcml2ZXIKPj4gdGhhdCBp
cyByZXF1aXJlZCB0byBnZXQgcmlkIG9mIGRlcHJlY2F0ZWQgaGVhZGVycwo+PiBpbiB0aGUgZHJt
IHN1YnN5c3RlbS4KPj4KPj4gVGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgYXJlIHRyaXZpYWwsIHdo
ZXJlCj4+IHRoZSBkZXBlbmRlbmNpZXMgb24gZHJtUC5oIGFuZCBkcm1fb3NfbGludXggYXJlIGRy
b3BwZWQuCj4+Cj4+IFRoZSByZW1haW5pbmcgdGhyZWUgcGF0Y2hlcyBkcm9wIHVzZSBvZiBEUk1f
V0FJVF9PTigpLgo+PiBUaGV5IGFyZSByZXBsYWNlZCBieSB3YWl0X2V2ZW50X2ludGVycnVwdGli
bGVfdGltZW91dCgpLgo+PiBUaGVzZSBwYXRjaGVzIGNvdWxkIHVzZSBhIG1vcmUgY3JpdGljYWwg
cmV2aWV3Lgo+IAo+IFRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIERSTV9XQUlUX09OKCkgYW5kCj4g
d2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQoKSBhcmUgYmlnZ2VyIHRoYW4gYW50aWNp
cGF0ZWQuCj4gCj4gVGhlIGNvbnZlcnNpb24gSSBkaWQgZm9yIGRybV92YmxhbmsuYyBpcyBib2d1
cyB0aHVzIEkgZXhwZWN0Cj4gdGhlIGNvbnZlcnNpb24gZG9uZSBmb3IgdmlhIGlzIGFsc28gYm9n
dXMuCgpXaGF0IGV4YWN0bHkgaXMgdGhlIHByb2JsZW0gdGhvdWdoPyBDYW4geW91IHNoYXJlIGlu
Zm9ybWF0aW9uIGFib3V0IHRoZQpmYWlsdXJlcyB5b3UncmUgc2VlaW5nPwoKVGhlcmUgd2FzIHNv
bWUgZGlzY3Vzc2lvbiBhYm91dCBEUk1fV0FJVF9PTigpICJwb2xsaW5nIiBvbiBJUkMuIEkgYXNz
dW1lCnRoYXQgcmVmZXJzIHRvIGl0IG9ubHkgc2xlZXBpbmcgZm9yIHVwIHRvIDAuMDFzIGJlZm9y
ZSBjaGVja2luZyB0aGUKY29uZGl0aW9uIGFnYWluLiBJbiBjb250cmFzdCwgd2FpdF9ldmVudF9p
bnRlcnJ1cHRpYmxlX3RpbWVvdXQoKSBjaGVja3MKdGhlIGNvbmRpdGlvbiBvbmNlLCB0aGVuIHNs
ZWVwcyB1cCB0byB0aGUgZnVsbCB0aW1lb3V0IGJlZm9yZSBjaGVja2luZwppdCBhZ2Fpbi4KCklm
IHRoYXQgbWFrZXMgYSBkaWZmZXJlbmNlIGZvciBkcm1fd2FpdF92YmxhbmtfaW9jdGwsIGl0IGlu
ZGljYXRlcyB0aGF0CnNvbWUgb3RoZXIgY29kZSB3aGljaCB1cGRhdGVzIHRoZSB2YmxhbmsgY291
bnQgb3IgY2xlYXJzIHZibGFuay0+ZW5hYmxlZApkb2Vzbid0IHdha2UgdXAgdGhlIHZibGFuay0+
cXVldWUuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAg
ICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
