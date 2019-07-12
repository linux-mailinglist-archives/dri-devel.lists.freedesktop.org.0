Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFFA6693B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 10:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482666E31C;
	Fri, 12 Jul 2019 08:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 50CEC6E31A;
 Fri, 12 Jul 2019 08:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 27FD02AA133;
 Fri, 12 Jul 2019 10:33:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 0H_7w0gXdm28; Fri, 12 Jul 2019 10:33:22 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 31CA52A6042;
 Fri, 12 Jul 2019 10:33:21 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hlqzZ-0005Hb-DV; Fri, 12 Jul 2019 10:33:21 +0200
Subject: Re: [PATCH 1/2] dma-buf: Expand reservation_list to fill allocation
To: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190712080314.21018-1-chris@chris-wilson.co.uk>
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
Message-ID: <f816350c-dc8c-2b00-3105-33abea78e70e@daenzer.net>
Date: Fri, 12 Jul 2019 10:33:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712080314.21018-1-chris@chris-wilson.co.uk>
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
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0xMiAxMDowMyBhLm0uLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gU2luY2Uga21h
bGxvYygpIHdpbGwgcm91bmQgdXAgdGhlIGFsbG9jYXRpb24gdG8gdGhlIG5leHQgc2xhYiBzaXpl
IG9yCj4gcGFnZSwgaXQgd2lsbCBub3JtYWxseSByZXR1cm4gYSBwb2ludGVyIHRvIGEgbWVtb3J5
IGJsb2NrIGJpZ2dlciB0aGFuIHdlCj4gYXNrZWQgZm9yLiBXZSBjYW4gcXVlcnkgZm9yIHRoZSBh
Y3R1YWwgc2l6ZSBvZiB0aGUgYWxsb2NhdGVkIGJsb2NrIHVzaW5nCj4ga3NpemUoKSBhbmQgZXhw
YW5kIG91ciB2YXJpYWJsZSBzaXplIHJlc2VydmF0aW9uX2xpc3QgdG8gdGFrZSBhZHZhbnRhZ2UK
PiBvZiB0aGF0IGV4dHJhIHNwYWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWwuZGFlbnplckBh
bWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYyB8IDYgKysrKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jIGIvZHJpdmVycy9kbWEt
YnVmL3Jlc2VydmF0aW9uLmMKPiBpbmRleCBhNmFjMmIzYTAxODUuLjgwZWNjMTI4M2QxNSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYwo+ICsrKyBiL2RyaXZlcnMv
ZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jCj4gQEAgLTE1Myw3ICsxNTMsOSBAQCBpbnQgcmVzZXJ2YXRp
b25fb2JqZWN0X3Jlc2VydmVfc2hhcmVkKHN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKm9iaiwK
PiAgCQkJUkNVX0lOSVRfUE9JTlRFUihuZXctPnNoYXJlZFtqKytdLCBmZW5jZSk7Cj4gIAl9Cj4g
IAluZXctPnNoYXJlZF9jb3VudCA9IGo7Cj4gLQluZXctPnNoYXJlZF9tYXggPSBtYXg7Cj4gKwlu
ZXctPnNoYXJlZF9tYXggPQo+ICsJCShrc2l6ZShuZXcpIC0gb2Zmc2V0b2YodHlwZW9mKCpuZXcp
LCBzaGFyZWQpKSAvCj4gKwkJc2l6ZW9mKCpuZXctPnNoYXJlZCk7Cj4gIAo+ICAJcHJlZW1wdF9k
aXNhYmxlKCk7Cj4gIAl3cml0ZV9zZXFjb3VudF9iZWdpbigmb2JqLT5zZXEpOwo+IEBAIC0xNjks
NyArMTcxLDcgQEAgaW50IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZChzdHJ1Y3Qg
cmVzZXJ2YXRpb25fb2JqZWN0ICpvYmosCj4gIAkJcmV0dXJuIDA7Cj4gIAo+ICAJLyogRHJvcCB0
aGUgcmVmZXJlbmNlcyB0byB0aGUgc2lnbmFsZWQgZmVuY2VzICovCj4gLQlmb3IgKGkgPSBrOyBp
IDwgbmV3LT5zaGFyZWRfbWF4OyArK2kpIHsKPiArCWZvciAoaSA9IGs7IGkgPCBtYXg7ICsraSkg
ewo+ICAJCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOwo+ICAKPiAgCQlmZW5jZSA9IHJjdV9kZXJl
ZmVyZW5jZV9wcm90ZWN0ZWQobmV3LT5zaGFyZWRbaV0sCj4gCgpOaWNlLCBUSUwgYWJvdXQga3Np
emUoKSwgd29uZGVyIHdoZXJlIGVsc2UgdGhhdCBjb3VsZCBiZSB1c2VkLgoKUmV2aWV3ZWQtYnk6
IE1pY2hlbCBEw6RuemVyIDxtaWNoZWwuZGFlbnplckBhbWQuY29tPgoKClAuUy4gQWNjb3JkaW5n
IHRvIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgLCB0aGlzIHNlcmllcyBzaG91bGQgYmUgc2Vu
dAp0byBtb3JlIHJlY2lwaWVudHMgZm9yIHJldmlldy4KCi0tIApFYXJ0aGxpbmcgTWljaGVsIETD
pG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBodHRwczovL3d3dy5hbWQuY29tCkxp
YnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFu
ZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
