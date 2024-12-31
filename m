Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27D9FEE0C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 09:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1F910E601;
	Tue, 31 Dec 2024 08:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="h3n/poN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 313D410E601
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=s1zalySEQypPPPD/odHe9VC97tmW/PgMwzf+o6zwguE=; b=h
 3n/poN7X7kDmGhxGp6eo4h2IA1/oGsY2QxtltXGF5MfVvGW3OL5KsQH6X/8ir/+D
 N5QtHv+2pWosI2zftH4SNRh07du/5OcFCs0NmkgqLOLExGJ0ic0/ZDuvPYDwVYPU
 4e1taDvvv8tdSuiSQNeFDzDhdRq/QWRjPAflFPEijk=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-135 (Coremail) ; Tue, 31 Dec 2024 16:43:27 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 31 Dec 2024 16:43:27 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: robh@kernel.org, iommu@lists.linux.dev, heiko@sntech.de, 
 devicetree@vger.kernel.org, joro@8bytes.org, hjc@rock-chips.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, vkoul@kernel.org, 
 detlev.casanova@collabora.com, linux-arm-kernel@lists.infradead.org, 
 "Andy Yan" <andy.yan@rock-chips.com>, 
 linux-rockchip@lists.infradead.org, krzk+dt@kernel.org, cl@rock-chips.com
Subject: Re:Re: [PATCH v2 5/8] dt-bindings: display: vop2: Add rk3576 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf>
References: <20241228122155.646957-1-andyshrk@163.com>
 <20241228122155.646957-6-andyshrk@163.com>
 <ihvrdnntfuvvycnlhysnm43wylotovvnivu4wxcne3bwc6etpj@n2rq6n77lmma>
 <4847f6b1.1c60.19412092a7a.Coremail.andyshrk@163.com>
 <6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf>
X-NTES-SC: AL_Qu2YB/qYu04r4SWdZ+lS3TJ694VEL57u+a5GusA2ecAsnATi4iQeZGRsL2rN79jcbZ1KWCmHGnHtpvfuggY/
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <61d9f4f4.8013.1941be25dc6.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hygvCgCnbxuvrnNnZ+BMAA--.5340W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQzGXmdzq1wkagACsS
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIEtyenlzenRvZiwKCkF0IDIwMjQtMTItMzEgMTY6MjM6MzksICJLcnp5c3p0b2YgS296bG93
c2tpIiA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPk9uIFN1biwgRGVjIDI5LCAyMDI0IGF0IDA2
OjQ5OjM4UE0gKzA4MDAsIEFuZHkgWWFuIHdyb3RlOgo+PiAKPj4gCj4+IEhpIEtyenlzenRvZiwK
Pj4gCj4+IEF0IDIwMjQtMTItMjkgMTg6MTM6MzksICJLcnp5c3p0b2YgS296bG93c2tpIiA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPj4gPk9uIFNhdCwgRGVjIDI4LCAyMDI0IGF0IDA4OjIxOjQ4
UE0gKzA4MDAsIEFuZHkgWWFuIHdyb3RlOgo+PiA+PiBGcm9tOiBBbmR5IFlhbiA8YW5keS55YW5A
cm9jay1jaGlwcy5jb20+Cj4+ID4+IAo+PiA+PiBBZGQgdm9wIGZvdW5kIG9uIHJrMzU3NiwgdGhl
IG1haW4gZGlmZmVyZW5jZSBiZXR3ZWVuIHJrMzU3NiBhbmQgdGhlCj4+ID4+IHByZXZpb3VzIHZv
cCBpcyB0aGF0IGVhY2ggVlAgaGFzIGl0cyBvd24gaW50ZXJydXB0IGxpbmUuCj4+ID4+IAo+PiA+
PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+ID4+
IAo+PiA+PiAtLS0KPj4gPj4gCj4+ID4+IENoYW5nZXMgaW4gdjI6Cj4+ID4+IC0gZGVzY3JpYmUg
Y29uc3RyYWludCBTT0MgYnkgU09DLCBhcyBpbnRlcnJ1cHRzIG9mIHJrMzU3NiBpcyB2ZXJ5Cj4+
ID4+ICAgZGlmZmVyZW50IGZyb20gb3RoZXJzCj4+ID4+IC0gRHJvcCBLcnp5c3p0b2YncyBSZXZp
ZXdlZC1ieSwgYXMgdGhpcyB2ZXJzaW9uIGNoYW5nZWQgYSBsb3QuCj4+ID4+IAo+PiA+PiBDaGFu
Z2VzIGluIHYxOgo+PiA+PiAtIG9yZGVyZWQgYnkgc29jIG5hbWUKPj4gPj4gLSBBZGQgZGVzY3Jp
cHRpb24gZm9yIG5ld2x5IGFkZGVkIGludGVycnVwdAo+PiA+PiAKPj4gPj4gIC4uLi9kaXNwbGF5
L3JvY2tjaGlwL3JvY2tjaGlwLXZvcDIueWFtbCAgICAgICB8IDcwICsrKysrKysrKysrKysrKy0t
LS0KPj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMo
LSkKPj4gPj4gCj4+ID4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3AyLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3AyLnlhbWwK
Pj4gPj4gaW5kZXggMjUzMTcyNmFmMzA2Li5mMjhjZWE0YTZkODIgMTAwNjQ0Cj4+ID4+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tj
aGlwLXZvcDIueWFtbAo+PiA+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3AyLnlhbWwKPj4gPj4gQEAgLTIwLDYgKzIw
LDcgQEAgcHJvcGVydGllczoKPj4gPj4gICAgICBlbnVtOgo+PiA+PiAgICAgICAgLSByb2NrY2hp
cCxyazM1NjYtdm9wCj4+ID4+ICAgICAgICAtIHJvY2tjaGlwLHJrMzU2OC12b3AKPj4gPj4gKyAg
ICAgIC0gcm9ja2NoaXAscmszNTc2LXZvcAo+PiA+PiAgICAgICAgLSByb2NrY2hpcCxyazM1ODgt
dm9wCj4+ID4+ICAKPj4gPj4gICAgcmVnOgo+PiA+PiBAQCAtMzcsMTAgKzM4LDIyIEBAIHByb3Bl
cnRpZXM6Cj4+ID4+ICAgICAgICAtIGNvbnN0OiBnYW1tYS1sdXQKPj4gPj4gIAo+PiA+PiAgICBp
bnRlcnJ1cHRzOgo+PiA+PiAtICAgIG1heEl0ZW1zOiAxCj4+ID4+IC0gICAgZGVzY3JpcHRpb246
Cj4+ID4+IC0gICAgICBUaGUgVk9QIGludGVycnVwdCBpcyBzaGFyZWQgYnkgc2V2ZXJhbCBpbnRl
cnJ1cHQgc291cmNlcywgc3VjaCBhcwo+PiA+PiAtICAgICAgZnJhbWUgc3RhcnQgKFZTWU5DKSwg
bGluZSBmbGFnIGFuZCBvdGhlciBzdGF0dXMgaW50ZXJydXB0cy4KPj4gPj4gKyAgICBtaW5JdGVt
czogMQo+PiA+PiArICAgIG1heEl0ZW1zOiA0Cj4+ID4+ICsgICAgaXRlbXM6Cj4+ID4+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOgo+PiA+Cj4+ID5UaGF0J3MgY29udHJhZGljdG9yeS4gbWluL21heCBz
YXkgMS00LCBidXQgaGVyZSB5b3UgbGlzdCB0d28gaW50ZXJydXB0cy4KPj4gCj4+IFRoZXJlIGFy
ZSA0IGludGVycnVwdHMgb24gcmszNTc2LCBhbmQgdGhlIG90aGVyIFNPQyBvbmx5IGhhdmUgb25l
Lgo+Cj5CdXQgeW91IGxpc3RlZCB0d28gaW50ZXJydXB0cywgc28gd2hlcmUgZG9lcyB0aGUgInR3
byIgY29tZSBmcm9tPwo+Cj4+IEkgYW0gc29ycnkgdGhhdCBJIGFtIG5vdCBmYW1pbGlhciB3aXRo
IHRoaXMgc2NoZW1hIGxhbmd1YWdlOyBJIGhhdmUgcmVhZCBtYW55Cj4+IG90aGVyIFlBTUwgYmlu
ZGluZ3MgdGhlc2UgZGF5cyBhbmQgdHJ5IHRvIHdyaXRlIGl0IGNvcnJlY3RseS4KPj4gCj4+IE1h
eWJlIEkgc2hvdWxkIG5vdCBsaXN0IHRoZSBpbnRlcnJ1cHRzLW5hbWVzIGhlcmUodGhlbiBsaXN0
IHRoZSBpbnRlcnJ1cHQtbmFtZSBieSBzb2MgYXQgYWxsT2Y6ICBwYXJ0KSwKPj4gIGxpa2UgdGhl
IGNsb2NrcyBoYW5kbGVzIGluIHNhbXN1bmcsdXNiMy1kcmQtcGh5LnlhbWwgID8KPgo+eHh4LW5h
bWVzIGFyZSBzdXBwb3NlZCB0byBiZSBmdWxseSBzeW5jZWQgd2l0aCB4eHgsIHNvIHNvbWV0aGlu
ZyBuZWVkcwo+dG8gYmUgZml4ZWQgaGVyZS4gWW91IGNhbiBvZiBjb3Vyc2UgcmVtb3ZlIGludGVy
cnVwdC1uYW1lcyAqY29tcGxldGVseSoKPihidXQgbm90IHBhcnRpYWxseSwgYmVjYXVzZSBhbGwg
cHJvcGVydGllcyBtdXN0IGJlIGRlZmluZWQgaW4gdG9wLWxldmVsKS4KClRoYW5rcyBmb3IgeW91
ciBleHBsYW5hdGlvbu+8jCBJIHdpbGwgc2VuZCBhIG5ldyB2ZXJzaW9uIGxhdGVyLgoKPgo+QmVz
dCByZWdhcmRzLAo+S3J6eXN6dG9mCj4KPgo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPkxpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdAo+TGludXgtcm9j
a2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwo+aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yb2NrY2hpcAo=
