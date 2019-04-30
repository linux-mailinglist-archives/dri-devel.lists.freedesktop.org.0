Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712BDF191
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 09:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A0D89491;
	Tue, 30 Apr 2019 07:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFF008946E;
 Tue, 30 Apr 2019 07:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id E7AEE2A6046;
 Tue, 30 Apr 2019 09:44:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 9cIVe2Mi86eU; Tue, 30 Apr 2019 09:44:26 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 899D82A6045;
 Tue, 30 Apr 2019 09:44:26 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hLNR9-00088f-Lq; Tue, 30 Apr 2019 09:44:23 +0200
Subject: Re: [PATCH] drm/amd/display: Allow faking displays as VRR capable.
To: Mario Kleiner <mario.kleiner.de@gmail.com>
References: <20190430073724.505-1-mario.kleiner.de@gmail.com>
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
Message-ID: <cc0516a8-36ea-55f6-96f1-558df96d5493@daenzer.net>
Date: Tue, 30 Apr 2019 09:44:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430073724.505-1-mario.kleiner.de@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNC0zMCA5OjM3IGEubS4sIE1hcmlvIEtsZWluZXIgd3JvdGU6Cj4gQWxsb3cgdG8g
ZGV0ZWN0IGFueSBjb25uZWN0ZWQgZGlzcGxheSB0byBiZSBtYXJrZWQgYXMKPiBWUlIgY2FwYWJs
ZS4gVGhpcyBpcyB1c2VmdWwgZm9yIHRlc3RpbmcgdGhlIGJhc2ljcyBvZgo+IFZSUiBtb2RlLCBl
LmcuLCBzY2hlZHVsaW5nIGFuZCB0aW1lc3RhbXBpbmcsIEJUUiwgYW5kCj4gdHJhbnNpdGlvbiBs
b2dpYywgb24gbm9uLVZSUiBjYXBhYmxlIGRpc3BsYXlzLCBlLmcuLAo+IHRvIHBlcmZvcm0gSUdU
IHRlc3Qtc3VpdCBrbXNfdnJyIHRlc3QgcnVucy4KPiAKPiBUaGlzIGZha2UgVlJSIGRpc3BsYXkg
bW9kZSBpcyBlbmFibGVkIGJ5IHNldHRpbmcgdGhlCj4gb3B0aW9uYWwgbW9kdWxlIHBhcmFtZXRl
ciBhbWRncHUuZmFrZXZycmRpc3BsYXk9MS4KPiAKPiBJdCB3aWxsIHRyeSB0byB1c2UgVlJSIHJh
bmdlIGluZm8gcGFyc2VkIGZyb20gRURJRCBvbgo+IERpc3BsYXlQb3J0IGRpc3BsYXlzIHdoaWNo
IGhhdmUgYSBjb21wYXRpYmxlIEVESUQsCj4gYnV0IG5vdCBjb21wYXRpYmxlIERQQ0QgY2FwcyBm
b3IgQWRhcHRpdmUgU3luYy4gRS5nLiwKPiBOVmlkaWEgRy1TeW5jIGNvbXBhdGlibGUgZGlzcGxh
eXMgZXhwb3NlIGEgcHJvcGVyIEVESUQsCj4gYnV0IG5vdCBwcm9wZXIgRFBDRCBjYXBzLgo+IAo+
IEl0IHdpbGwgdXNlIGEgaGFyZC1jb2RlZCBWUlIgcmFuZ2Ugb2YgMzAgSHogLSAxNDQgSHogb24K
PiBvdGhlciBkaXNwbGF5cyB3aXRob3V0IHN1aXRhYmxlIEVESUQsIGUuZy4sIHN0YW5kYXJkCj4g
RGlzcGxheVBvcnQsIEhETUksIERWSSBtb25pdG9ycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJp
byBLbGVpbmVyIDxtYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNvbT4KPiAKPiBbLi4uXQo+ICAKPiAg
c3RydWN0IGFtZGdwdV9tZ3B1X2luZm8gbWdwdV9pbmZvID0gewo+ICAJLm11dGV4ID0gX19NVVRF
WF9JTklUSUFMSVpFUihtZ3B1X2luZm8ubXV0ZXgpLAo+IEBAIC02NjUsNiArNjY2LDE2IEBAIE1P
RFVMRV9QQVJNX0RFU0MoaGFsdF9pZl9od3NfaGFuZywgIkhhbHQgaWYgSFdTIGhhbmcgaXMgZGV0
ZWN0ZWQgKDAgPSBvZmYgKGRlZmF1Cj4gIE1PRFVMRV9QQVJNX0RFU0MoZGNmZWF0dXJlbWFzaywg
ImFsbCBzdGFibGUgREMgZmVhdHVyZXMgZW5hYmxlZCAoZGVmYXVsdCkpIik7Cj4gIG1vZHVsZV9w
YXJhbV9uYW1lZChkY2ZlYXR1cmVtYXNrLCBhbWRncHVfZGNfZmVhdHVyZV9tYXNrLCB1aW50LCAw
NDQ0KTsKPiAgCj4gKy8qKgo+ICsgKiBET0M6IGZha2V2cnJkaXNwbGF5IChpbnQpCj4gKyAqIE92
ZXJyaWRlIGRldGVjdGlvbiBvZiBWUlIgZGlzcGxheXMgdG8gbWFyayBhbnkgZGlzcGxheSBhcyBW
UlIgY2FwYWJsZSwgZXZlbgo+ICsgKiBpZiBpdCBpcyBub3QuIFVzZWZ1bCBmb3IgYmFzaWMgdGVz
dGluZyBvZiBWUlIgd2l0aG91dCBuZWVkIHRvIGF0dGFjaCBzdWNoIGEKPiArICogZGlzcGxheSwg
ZS5nLiwgZm9yIGlndCB0ZXN0cy4KPiArICogU2V0dGluZyAxIGVuYWJsZXMgZmFraW5nIFZSUi4g
RGVmYXVsdCB2YWx1ZSwgMCwgZG9lcyBub3JtYWwgZGV0ZWN0aW9uLgo+ICsgKi8KPiArbW9kdWxl
X3BhcmFtX25hbWVkKGZha2V2cnJkaXNwbGF5LCBhbWRncHVfZmFrZV92cnJfZGlzcGxheSwgaW50
LCAwNjQ0KTsKPiArTU9EVUxFX1BBUk1fREVTQyhmYWtldnJyZGlzcGxheSwgIkRldGVjdCBhbnkg
ZGlzcGxheSBhcyBWUlIgY2FwYWJsZSAoMCA9IG9mZiAoZGVmYXVsdCksIDEgPSBvbikiKTsKCmFt
ZGdwdSBoYXMgdG9vIG1hbnkgbW9kdWxlIHBhcmFtZXRlcnMgYWxyZWFkeTsgSU1ITyB0aGlzIGtp
bmQgb2YgbmljaGUKdXNlLWNhc2UgZG9lc24ndCBqdXN0aWZ5IGFkZGluZyB5ZXQgYW5vdGhlciBv
bmUuIEZvciB0aGUgdmFzdCBtYWpvcml0eQpvZiB1c2VycywgdGhpcyB3b3VsZCBqdXN0IGJlIGFu
b3RoZXIga25vYiB0byBicmVhayB0aGluZ3MsIHJlc3VsdGluZyBpbgpzdXBwb3J0IGJ1cmRlbiBm
b3IgdXMuCgpIb3cgYWJvdXQgZS5nLiBtYWtpbmcgdGhlIHZycl9jYXBhYmxlIHByb3BlcnR5IG11
dGFibGUsIG9yIGFkZGluZwphbm90aGVyIHByb3BlcnR5IGZvciB0aGlzPwoKCi0tIApFYXJ0aGxp
bmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBodHRwczovL3d3
dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAg
ICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
