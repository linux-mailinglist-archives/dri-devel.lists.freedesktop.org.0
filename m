Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41BB54DE49
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 11:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191381130A5;
	Thu, 16 Jun 2022 09:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
 by gabe.freedesktop.org (Postfix) with ESMTP id 33E431130A5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=NvABm
 oW9BVpA9zlWemjuNdsmUdx21GxXSH5qKQJqKzU=; b=Tq+Xjb5BBH05+oT+0pAeg
 4Tmxt6/vMciiPyeWkaDxtwyKmC89KM8M8vjFziEyH0JTRbHZdtzGyqSEKSsTOe4m
 eV73gtyepBdy7qx6v6202+2I6T2PeziWsLzq1S3Vjz61Qz3sEbBwO844VJSbxRQc
 LhctMwgsfQLTcH1pxn1zaA=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Thu, 16 Jun 2022 17:39:24 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Thu, 16 Jun 2022 17:39:24 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: Conor.Dooley@microchip.com
Subject: Re:Re: [Linaro-mm-sig] Re: [PATCH] drivers: tty: serial: Add
 missing of_node_put() in serial-tegra.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <1f70f001-7bab-9146-b52c-2f75265137d9@microchip.com>
References: <20220615104833.3963552-1-windhl@126.com>
 <Yqm6LvDGqaRMaUHa@kroah.com>
 <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
 <CAKMK7uG+TeATXctJaXBgSRxpinDdtOhGa+o2CMPaPtO1QyHtJA@mail.gmail.com>
 <YqrtP2jS0Gg4pBRe@kroah.com>
 <5911192c.6793.1816bb6a391.Coremail.windhl@126.com>
 <1f70f001-7bab-9146-b52c-2f75265137d9@microchip.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <5bf0d156.721e.1816be1bcc3.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowAC3vydN+qpiTk43AA--.11795W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBgiF2JVj4-zRwACsU
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Cc: linux-serial@vger.kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBdCAyMDIyLTA2LTE2IDE3OjIwOjI0LCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90
ZToKPk9uIDE2LzA2LzIwMjIgMDk6NTIsIExpYW5nIEhlIHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUKPj4gCj4+IEF0IDIwMjItMDYtMTYgMTY6NDM6NDMsICJHcmVn
IEtIIiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Pj4gT24gV2VkLCBKdW4g
MTUsIDIwMjIgYXQgMTA6MzA6NDdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+PiBP
biBXZWQsIDE1IEp1biAyMDIyIGF0IDIyOjIzLCBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5j
b20+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiBXZWQsIDE1IEp1biAyMDIyIGF0IDIwOjUzLCBHcmVn
IEtIIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gT24g
V2VkLCBKdW4gMTUsIDIwMjIgYXQgMDY6NDg6MzNQTSArMDgwMCwgaGVsaWFuZyB3cm90ZToKPj4+
Pj4+PiBJbiB0ZWdyYV91YXJ0X2luaXQoKSwgb2ZfZmluZF9tYXRjaGluZ19ub2RlKCkgd2lsbCBy
ZXR1cm4gYSBub2RlCj4+Pj4+Pj4gcG9pbnRlciB3aXRoIHJlZmNvdW50IGluY3JlbWVudGVkLiBX
ZSBzaG91bGQgdXNlIG9mX25vZGVfcHV0KCkKPj4+Pj4+PiB3aGVuIGl0IGlzIG5vdCB1c2VkIGFu
eW1vcmUuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBoZWxpYW5nIDx3aW5kaGxAMTI2
LmNvbT4KPj4+Pj4+Cj4+Pj4+PiBXZSBuZWVkIGEgcmVhbCBuYW1lIHBsZWFzZSwgb25lIHlvdSBz
aWduIGRvY3VtZW50cyB3aXRoLgo+Pj4+Pgo+Pj4+PiBIb3cgZG8gd2UgZW5mb3JjZSB0aGF0PyBX
aGF0IGlmIFdvbmcsIEFkZWxlIG9yIEJleW9uY2Ugc3VibWl0IGEgcGF0Y2g/Cj4+Pj4+Cj4+Pj4+
IFdoYXQgaGFwcGVucyBpZiB0aGF0IHBhdGNoIGdldHMgcmVwb3N0ZWQsIHdpdGggUy1vLWI6IEhl
IExpYW5nCj4+Pj4+IDx3aW5kaGxAMTI2LmNvbT4gb3IgSGVsIElhbmcsIEhlbGkgQW5nPyBEbyB5
b3Uga25vdyBhbnkgb2YgdGhvc2UgYXJlCj4+Pj4+IHJlYWwgbmFtZXM/IFdoYXQgaGFwcGVucyBp
ZiB0aGV5IHBvc3QgYSByZWFsIG5hbWUgaW4KPj4+Pj4gTWFuZGFyaW4vVGhhaS9DeXJpbGxpYywg
Y2FuIHlvdSB2YWxpZGF0ZSBpdD8KPj4+Pj4KPj4+Pj4gUmVhbGx5IHdlIHJlcXVpcmUgeW91IGhh
dmUgYW4gaWRlbnRpdHkgYXR0YWNoZWQgdG8gYW4gZW1haWwuIElmIHRoZXJlCj4+Pj4+IGlzIGEg
cHJvYmxlbSBpbiB0aGUgZnV0dXJlLCB3ZSdkIHByZWZlciB0aGUgZW1haWwgY29udGludWVzIHRv
IHdvcmsgc28KPj4+Pj4gdGhhdCB5b3UgYXJlIGNvbnRhY3RhYmxlLiBJZiB5b3UgYXJlIHN1Ym1p
dHRpbmcgYSBzbWFsbCBhbW91bnQgb2YKPj4+Pj4gY2hhbmdlcyBpdCdzIHByb2JhYmx5IG5ldmVy
IGdvaW5nIHRvIG1hdHRlci4gSWYgeW91IGFyZSBzdWJtaXR0aW5nCj4+Pj4+IGxhcmdlciBib2Rp
ZXMgb2Ygd29yayBvZiBjb3Vyc2UgaXQgd291bGQgYmUgZ29vZCB0byBoYXZlIGEgY29tcGFueSBv
cgo+Pj4+PiBsYXJnZXIgb3JnIGF0dGFjaGVkIHRvIHRyYWNrIHRoaW5ncyBkb3duIGxlZ2FsbHkg
bGF0ZXIsIGJ1dCBhZ2FpbiB0aGF0Cj4+Pj4+IGlzbid0IGFsd2F5cyBwb3NzaWJsZS4KPj4+Pj4K
Pj4+Pj4gSSBkb24ndCB0aGluayBhbGllbmF0aW5nIHRoZSBudW1lcm91cyBkZXZlbG9wZXJzIHdo
byBubyBsb25nZXIgdXNlCj4+Pj4+IHRoZWlyIGxlZ2FsIG5hbWVzIGFyZSBpZGVudGlmaWVkIGJ5
IG9uZSBuYW1lLCBidXQgaGF2ZW4ndCBjaGFuZ2VkCj4+Pj4+IHRoZWlyIGxlZ2FsIG9uZSB5ZXQg
cGVvcGxlIHdobyBnZXQgbWFycmllZCBhbmQgY2hhbmdlIHRoZWlyIGxlZ2FsIG5hbWUKPj4+Pj4g
YnV0IGRvbid0IGNoYW5nZSB0aGVpciBjb250cmlidXRpb24gbmFtZSBhbmQgSSBjb3VsZCBydW4g
dGhpcyBzZW50ZW5jZQo+Pj4+PiBvbiBmb3JldmVyLgo+Pj4+Cj4+Pj4gWWVhaCBsaWtlIGFic29s
dXRlIGJlc3QgY2FzZSB0cnlpbmcgdG8gImVuZm9yY2UiIHRoaXMganVzdCByZXN1bHRzIGluCj4+
Pj4gZW5jb3VyYWdpbmcgcGVvcGxlIHRvIGNvbWUgdXAgd2l0aCBlbnRpcmVseSBmYWtlIGJ1dCBF
bmdsaXNoIGxvb2tpbmcKPj4+PiBuYW1lcyBmb3IgdGhlbXNlbHZlcy4gV2hpY2ggLi4uIGp1c3Qg
bm8uCj4+Pgo+Pj4gQWdyZWUsIGFnYWluLCBJJ2QgcHJlZmVyIHRvIHRha2UgcmVhbCBuYW1lcyBp
biBuYXRpdmUgbGFuZ3VhZ2VzLCBvdXIKPj4+IHRvb2xzIGNhbiBoYW5kbGUgdGhhdCBqdXN0IGZp
bmUuICBObyBuZWVkIHRvIG1ha2UgdXAgYW55dGhpbmcuCj4KPlNpbmNlIHRoaXMgaXMgdGhlIG9u
bHkgbWFpbCBmcm9tIHRoaXMgY2hhaW4gaW4gbXkgaW5ib3ggYW5kIEkgYXNrZWQgdGhlCj5zYW1l
IHF1ZXN0aW9uIGFzIEdyZWcgb24gb3RoZXIgcGF0Y2hlczoKPkkgdGhpbmsgaXQgaXMgcHJldHR5
IHJlYXNvbmFibGUgdG8gL2Fzay8gaWYgc29tZXRoaW5nIGlzIG5vdCBhIHJlYWwgbmFtZQo+d2hl
biB5b3Ugc2VlIHNvbWV0aGluZyBsaWtlICJoZWxpYW5nIDx3aW5kaGxAMTI2LmNvbT4iIHdoZXJl
IHRoZXJlJ3MgYQo+Y2xlYXIgZGlmZmVyZW5jZS4gQW5kICJJdCBpcyBteSByZWFsIG5hbWUiIGlz
IGEgcGVyZmVjdGx5IHJlYXNvbmFibGUKPnJlc3BvbnNlIC9zaHJ1Zy4KPlRydXN0IGJ1dCB2ZXJp
ZnkgcmlnaHQ/IEl0J3Mgbm90IGxpa2UgSSdtIGdvbm5hIGFyZ3VlIHRoZSB0b3NzIHdpdGgKPnNv
bWVvbmUgaWYgdGhleSBzYXkgaXQgaXMgdGhlaXIgcmVhbCBuYW1lLi4uCj4KPlRoYW5rcywKPkNv
bmNodWJoYXIgOykKPgo+Pj4KPj4+IHRoYW5rcywKPj4+Cj4+PiBncmVnIGstaAo+PiAKPj4gaGks
IEdyZWcgSy1ILAo+PiAKPj4gSSBoYXZlIHJlc2VudCBhIG5ldyBwYXRjaCBmb3IgbXkgY29tbWl0
IG9mIHRlZ3JhX3VhcnRfaW5pdCgpIGJ1ZyB3aXRoIG15IHJlYWwgbmFtZSBmb3IgU29iLgo+PiAK
Pj4gU28gdGhlcmUgaXMgYW55b3RoZXIgdGhpbmcgSSBzaG91bGQgZG8/Cj4KCgpTb3JyeSwgQ29u
b3IgYW5kIEdyZXAgSy1ILgoKSSBkaWQgbm90IGV4cGxhaW4gY2xlYXJseSBhbmQgSSByZXNwZWN0
IGFsbCB5b3VyIHN1Z2dlc3Rpb25zLgoKSSBoYXZlIHJlc2VudCB3aXRoICdMaWFuZyBIZScgYXMg
bXkgcmVhbCBuYW1lIGZvciBhbGwgcGF0Y2hlcyB3aGljaCBJIHNlbnQgd2l0aCBoZWxpYW5nIHll
c3RlcmRheS4KQW5kIEkgdXNlICdbUEFUQ0ggdjJdJyBmb3IgdGhlcmUgcmVzZW50IHBhdGNoZXMu
CgpTb3JyeSBhZ2Fpbi4=
