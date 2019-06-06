Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B748037616
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 16:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114068972B;
	Thu,  6 Jun 2019 14:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 750F38972B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7E9B72A6045;
 Thu,  6 Jun 2019 16:09:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 0V_y7rtytYPL; Thu,  6 Jun 2019 16:09:50 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id EB0752A6042;
 Thu,  6 Jun 2019 16:09:49 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hYt4x-000291-0t; Thu, 06 Jun 2019 16:09:19 +0200
Subject: Re: [PATCH 1/2] update drm.h
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
To: zhoucm1 <zhoucm1@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
References: <20190522090800.15908-1-david1.zhou@amd.com>
 <17e558ac-bda8-0541-b102-2fd730ce4753@amd.com>
 <f95b85cd-80ee-576a-248a-409f512e8d38@amd.com>
 <96dea97c-dfa8-1e89-1b83-9a425b93e36e@daenzer.net>
 <ce5f40ff-7685-35e5-ef33-e5e7fac63818@amd.com>
 <13d6026e-2ca5-83bf-3f1c-1d9fbbe199a8@daenzer.net>
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
Message-ID: <799dce05-4785-f77b-6647-1c8ed78e9af1@daenzer.net>
Date: Thu, 6 Jun 2019 16:09:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <13d6026e-2ca5-83bf-3f1c-1d9fbbe199a8@daenzer.net>
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

T24gMjAxOS0wNi0wNiAxMjozMSBwLm0uLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPiBPbiAyMDE5
LTA2LTA2IDEyOjI2IHAubS4sIHpob3VjbTEgd3JvdGU6Cj4+IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9tZXNhL2RybSwgV2hlcmUgdGhlIG1lcmdlIHJlcXVlc3QgYnV0dG9uPwo+IAo+
IElmIHlvdSBwdXNoIHRvIGEgYnJhbmNoIGluIHlvdXIgcGVyc29uYWwgcmVwb3NpdG9yeSwgdGhl
IG91dHB1dCBvZiBnaXQKPiBwdXNoIGNvbnRhaW5zIGFuIFVSTCBmb3IgY3JlYXRpbmcgYSBtZXJn
ZSByZXF1ZXN0LgoKRGFuaWVsIFZldHRlciBwb2ludGVkIG91dCBvbiBJUkMgdGhhdCBjdXJyZW50
bHkgbWVyZ2UgcmVxdWVzdHMgYXJlbid0CmVuYWJsZWQgeWV0IGZvciBsaWJkcm0sIHdoaWNoIHBy
b2JhYmx5IGV4cGxhaW5zIHdoeSB5b3UgY291bGRuJ3QgZmluZCBhCndheSB0byBjcmVhdGUgb25l
LiBTb3JyeSwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGlzLgoKTWVhbndoaWxlLCBjYW4geW91IGp1c3Qg
cHVzaCB0byBhIGJyYW5jaCBpbiB5b3VyIHBlcnNvbmFsIHJlcG8sIGFuZCBtYWtlCnN1cmUgdGhl
IENJIHBpcGVsaW5lIHBhc3Nlcz8KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2Fy
ZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9w
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
