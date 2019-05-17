Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 336BB219D1
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 16:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE6A898CC;
	Fri, 17 May 2019 14:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4DFFC898CC
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 14:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 74B962A6042;
 Fri, 17 May 2019 16:28:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id D4WLwgpOV7NH; Fri, 17 May 2019 16:28:55 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 02B192A6016;
 Fri, 17 May 2019 16:28:55 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hRdqg-0004ci-E6; Fri, 17 May 2019 16:28:38 +0200
Subject: Re: [PATCH libdrm] enable syncobj test depending on capability
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
References: <20190516104642.21450-1-david1.zhou@amd.com>
 <278437b6-c5f0-209b-443b-573b4143f944@amd.com>
 <-yw2q6u7xkjpo-i83eg9msudz1wgjn7w-b101h0-sfv5ag1noxjz2wg54r-iuw7ml-f519uls55cqypexnfa-et96uc-nx96jg5fu1d3-wn1hxg-td9bpo5n1nbv-wmnwfr84y609mm8lnpxqaf92-n4k5l3.1558004611599@email.android.com>
 <144963b9-d1e5-2afb-c02e-58dd6ba19a3e@amd.com>
 <f80c8b88-1dad-26ae-4de2-ec5e3fac289d@daenzer.net>
 <dd6450e5-a622-94bb-9bef-bed7dd901af8@amd.com>
 <iuca3rriuy61ilmprn7wjpxafclwjn-par0kv-n5se1uvs8pejoxgl1d1tv9e7-suc50po1nq5dp8g58yk4yiap-pn8vbp-u5q05h-bqtpqfswj30t-5msp9f-xh7906-cs7026x7ja36kggkcls4qiau.1558096119187@email.android.com>
 <243bd55d-6dbc-9814-621d-3d76e3ae9b31@amd.com>
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
Message-ID: <53756d93-b208-8b19-3907-28b15776d1e5@daenzer.net>
Date: Fri, 17 May 2019 16:28:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <243bd55d-6dbc-9814-621d-3d76e3ae9b31@amd.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0xNyAzOjQzIHAubS4sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+IE5vLCBm
aXJzdCBvZiBhbGwgSSdtIHJlYWxseSBidXN5IHdpdGggdGhvc2UgVFRNIHByb2JsZW1zLgo+IAo+
IEFuZCBzZWNvbmQgSSdtIGFjdHVhbGx5IG5vdCB2ZXJ5IGZhbWlsaWFyIHdpdGggdGhpcyBlaXRo
ZXIuCj4gCj4gUGxlYXNlIGp1c3Qgc3BsaXQgdGhlIHBhdGNoIHVwIGludG8gdHdvLCBvbmUgdXBk
YXRpbmcgdGhlIGhlYWRlcnMgYW5kIG9uZSBmaXhpbmcgdGhlIHRlc3QgY2FzZS4KPiAKPiBNYXli
ZSB0aGF0J3MgZW5vdWdoIGZvciBNaWNoZWwsCgpUaGlzIGlzIHRoZSBtb3N0IGltcG9ydGFudCBw
YXJ0IG9mIGluY2x1ZGUvZHJtL1JFQURNRToKCgpXaGVuIGFuZCBob3cgdG8gdXBkYXRlIHRoZXNl
IGZpbGVzCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTm90ZTogT25lIHNob3Vs
ZCBub3QgZG8gX2FueV8gY2hhbmdlcyB0byB0aGUgZmlsZXMgYXBhcnQgZnJvbSB0aGUgc3RlcHMK
YmVsb3cuCgpJbiBvcmRlciB0byB1cGRhdGUgdGhlIGZpbGVzIGRvIHRoZSBmb2xsb3dpbmc6CiAt
IFN3aXRjaCB0byBhIExpbnV4IGtlcm5lbCB0cmVlL2JyYW5jaCB3aGljaCBpcyBub3QgcmViYXNl
ZC4KICAgRm9yIGV4YW1wbGU6IGRybS1uZXh0IChodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3Jn
L2RybS9kcm0pCiAtIEluc3RhbGwgdGhlIGhlYWRlcnMgdmlhIGBtYWtlIGhlYWRlcnNfaW5zdGFs
bCcgdG8gYSBzZXBhcmF0ZSBsb2NhdGlvbi4KIC0gQ29weSB0aGUgZHJtIGhlYWRlcltzXSArIGdp
dCBhZGQgKyBnaXQgY29tbWl0LgogLSBOb3RlOiBZb3VyIGNvbW1pdCBtZXNzYWdlIG11c3QgaW5j
bHVkZToKICAgYSkgQnJpZWYgc3VtbWFyeSBvbiB0aGUgZGVsdGEuIElmIHRoZXJlJ3MgYW55IGNo
YW5nZSB0aGF0IGxvb2tzIGxpa2UgYW4KQVBJL0FCSSBicmVhayBvbmUgX211c3RfIGV4cGxpY2l0
bHkgc3RhdGUgd2h5IGl0J3Mgc2FmZSB0byBkbyBzby4KICAgYikgIkdlbmVyYXRlZCB1c2luZyBt
YWtlIGhlYWRlcnNfaW5zdGFsbC4iCiAgIGMpICJHZW5lcmF0ZWQgZnJvbSAkdHJlZS9icmFuY2gg
Y29tbWl0ICRzaGEiCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAg
IHwgICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVz
aWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
