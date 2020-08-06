Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BE823D7C6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 10:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB436E891;
	Thu,  6 Aug 2020 08:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D1AB6E891
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 08:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 5E6B82A6042;
 Thu,  6 Aug 2020 10:01:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id DhDowBCZmrQB; Thu,  6 Aug 2020 10:01:58 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 0636C2A6016;
 Thu,  6 Aug 2020 10:01:52 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1k3aqW-000Okw-HL; Thu, 06 Aug 2020 10:01:52 +0200
Subject: Re: [2/2] drm/ttm: make TT creation purely optional v3
To: christian.koenig@amd.com
References: <20200629151925.2096-2-christian.koenig@amd.com>
 <a1ba1387-1270-32e3-960f-f98495d92c11@daenzer.net>
 <03df2698-293b-2dff-923a-f8c731f55dec@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <b818b065-50cd-9e8a-3cff-01dd124a04c4@daenzer.net>
Date: Thu, 6 Aug 2020 10:01:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <03df2698-293b-2dff-923a-f8c731f55dec@gmail.com>
Content-Language: en-CA
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOC0wNiA5OjEzIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMDUu
MDguMjAgdW0gMTg6MTYgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPj4gT24gMjAyMC0wNi0yOSA1
OjE5IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBXZSBvbmx5IG5lZWQgdGhlIHBh
Z2UgYXJyYXkgd2hlbiB0aGUgQk8gaXMgYWJvdXQgdG8gYmUgYWNjZXNzZWQuCj4+Pgo+Pj4gU28g
bm90IG9ubHkgcG9wdWxhdGUsIGJ1dCBhbHNvIGNyZWF0ZSBpdCBvbiBkZW1hbmQuCj4+Pgo+Pj4g
djI6IG1vdmUgTlVMTCBjaGVjayBpbnRvIHR0bV90dF9jcmVhdGUoKQo+Pj4gdjM6IGZpeCB0aGUg
b2NjdXJyZW5jZSBpbiB0dG1fYm9fa21hcF90dG0gYXMgd2VsbAo+PiBUaGlzIGJyb2tlIGFtZGdw
dSB1c2VycHRyIGZ1bmN0aW9uYWxpdHkgZm9yIG1lLCBpbiBwYXJ0aWN1bGFyIGFsbAo+PiBHTF9B
TURfcGlubmVkX21lbW9yeSBwaWdsaXQgdGVzdHMsIGUuZy4KPj4KPj4gLi4uL3BpZ2xpdC9iaW4v
YW1kX3Bpbm5lZF9tZW1vcnkgZGVjcmVtZW50LW9mZnNldCAtYXV0byAtZmJvCj4+IE9mZnNldCBp
cyBkZWNyZW1lbnRlZCwgbm8gd2FpdC4KPj4gTWVzYTogVXNlciBlcnJvcjogR0xfSU5WQUxJRF9P
UEVSQVRJT04gaW4gZ2xCdWZmZXJEYXRhCj4+IFsuLi5dCj4+IFVuZXhwZWN0ZWQgR0wgZXJyb3I6
IEdMX0lOVkFMSURfT1BFUkFUSU9OIDB4NTAyCj4+IChFcnJvciBhdCB0ZXN0cy9zcGVjL2FtZF9w
aW5uZWRfbWVtb3J5L3Rlc3QuYzoyMTQpCj4+IFBJR0xJVDogeyJyZXN1bHQiOiAiZmFpbCIgfQo+
IAo+IEJ1dCBubyBjcmFzaGVzPyBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgYSBOVUxMIHBvaW50ZXIg
ZGVyZWYgaWYgd2UgaGF2ZQo+IG1pc3NlZCBjYWxsIHBhdGguCgpObyBjcmFzaGVzLiBTaW5jZSBh
IEdMIGVycm9yIGlzIHJhaXNlZCwgbXkgZ3Vlc3Mgd291bGQgYmUgdGhhdCBhbiBpb2N0bAp3aGlj
aCB3YXMgcHJldmlvdXNseSBzdWNjZWVkaW5nIGlzIG5vdyByZXR1cm5pbmcgYW4gZXJyb3IuCgoK
LS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAg
ICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAg
ICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
