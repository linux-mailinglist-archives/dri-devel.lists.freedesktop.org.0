Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC34D9FDDA9
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 07:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B2E89D8E;
	Sun, 29 Dec 2024 06:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="KGM8x0T+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A26D89D8E
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=MdgozdjrCxolx9SB5vbH0N/QD7pGNbLmzkrFN04lyWM=; b=K
 GM8x0T+FK+DPvKGKldZIZ21Dv+Gj4BQtgmLUVjAFji+N8MKyt4WtV7GbA1ngFLRr
 vsRAjfPj8EUFXIftarmPgD/440Y7lHmGtIWW01fTHxaE0GK6hl0lGtNzayP9ptK6
 nl90VM7FWrcf5svriPwLQPAmzgQQNkuqARrBENfE8w=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-135 (Coremail) ; Sun, 29 Dec 2024 14:48:36 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sun, 29 Dec 2024 14:48:36 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: krzk+dt@kernel.org, joro@8bytes.org, cl@rock-chips.com, robh@kernel.org, 
 hjc@rock-chips.com, vkoul@kernel.org, devicetree@vger.kernel.org, 
 detlev.casanova@collabora.com, cristian.ciocaltea@collabora.com, 
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v2 0/8] Add display subsystem dt node on rk3576
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <4950097.GXAFRqVoOG@diego>
References: <20241228122155.646957-1-andyshrk@163.com>
 <4950097.GXAFRqVoOG@diego>
X-NTES-SC: AL_Qu2YB/ieu0Eq4CafY+lS3TJ694VEL57u+a5GusA2ecAsnATi4iQeZGRsL2rN79iDOb9IyTpUTG/GyHU6hCyg
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6ff7470.1060.194112c804a.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hygvCgDnb6zE8HBnsv1KAA--.47223W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqB-EXmdw4CsLugADsD
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

CgpIaSBIZWlrbywKCkF0IDIwMjQtMTItMjkgMDI6MzY6MzYsICJIZWlrbyBTdMO8Ym5lciIgPGhl
aWtvQHNudGVjaC5kZT4gd3JvdGU6Cj5IaSBBbmR5LAo+Cj5BbSBTYW1zdGFnLCAyOC4gRGV6ZW1i
ZXIgMjAyNCwgMTM6MjE6NDMgQ0VUIHNjaHJpZWIgQW5keSBZYW46Cj4+IEZyb206IEFuZHkgWWFu
IDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gCj4+IAo+PiBBcyB0aGUgVk9QWzBdIGFuZCBI
RE1JWzFdIGRyaXZlciBoYXZlIGFscmVhZHkgYmVlbiBzdWJtaXR0ZWQgZm9yIHJldmlldy4KPj4g
VGhpcyBzZXJpZXMgc2VuZCBhbGwgZGlzcGxheSByZWxhdGVkIGRldmljZSB0cmVlIHBhcnQgdG9n
ZXRoZXIuCj4+IFswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yb2NrY2hpcC8yMDI0
MTIxOTA3MzkzMS4zOTk3Nzg4LTEtYW5keXNocmtAMTYzLmNvbS9ULyN0Cj4+IFsxXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yb2NrY2hpcC8yMDI0MTIyNTEwMzc0MS4zNjQ1OTctMS1h
bmR5c2hya0AxNjMuY29tL1QvI3QKPgo+bm90IHRvIGNvbmZ1c2UgeW91IHRvbyBtdWNoLCBJIG1h
aW5seSBtZWFudCB0aGF0IHdlIHdlcmUgbWlzc2luZyB0aGUKPiJhcm02NDogZHRzOiByb2NrY2hp
cDoiIHBhdGNoZXMgZnJvbSB0aGlzIHNlcmllcy4KClNvcnJ5LCBJIG1pc3VuZGVyc3Rvb2QgaXQg
aW4gVjIgLiBCZWZvcmUgZ28gdG8gdGhlIG5leHQgc3RlcCwgSSB3b3VsZCBsaWtlIHRvIGNvbmZp
cm0gaXQgYWdhaW46CkRvZXMgdGhhdCBtZWFuIEkgc2hvdWxkOgoxLiAgdGhlIGR0cyBwYXRjaGVz
KDYvOCwgNy84IDgvOCkgc2hvdWxkIGJlIHNlbnQgYXMgYSBzZXBhcmF0ZSBzZXJpZXMuCjIuIFBB
VENIIDUvOCBzaG91bGQgc3RpbGwgZ28gd2l0aCB0aGUgcmszNTc2IHZvcCBkcml2ZXJbMF0KMy4g
UEFUQ0ggMy84IHNob3VsZCBzdGlsbCBnbyB3aXRoIHRoZSByazM1NzYgaGRtaSBkaXJ2ZXJbMV0K
NC4gUEFUQ0ggMS84LCAyLzggNC84ICBzaG91bGQgc3RpbGwgYmUgc2VudCBzZXBhcmF0ZSAgPwoK
IAo+Cj5UaGUgZHQtYmluZGluZyBwYXRjaGVzIGFyZSAoYWxyZWFkeSkgcGFydCBvZiB0aGUgZHJp
dmVyIGNoYW5nZXMgYW5kCj5zaG91bGQgc3RheSBwYXJ0IG9mIHRob3NlIHNlcmllcywgdG8gcHJl
dmVudCBjb25mdXNpb24gb2Ygd2hhdCBwYXJ0IGdvZXMKPndoZXJlIDotKSAuCj4KPgo+SGVpa28K
Pgo+Cj4+IENoYW5nZXMgaW4gdjI6Cj4+IC0gV3JhcCBjb21taXQgbWVzc2FnZSBhY2NvcmRpbmcg
dG8gTGludXggY29kaW5nIHN0eWxlCj4+IC0gTWFrZSAicm9ja2NoaXAscmszNTg4LWhkcHR4LXBo
eSIgY29uc3QgZm9yICJyb2NrY2hpcCxyazM1NzYtaGRwdHgtcGh5Igo+PiAtIE1ha2UgZGVjbGFy
ZSBwaHkvcm9wbGwvbGNwbGwgcmVzZXQgbGluZSBhcmUgbm90IGV4aXQgb24gcmszNTc2Cj4+IC0g
ZGVzY3JpYmUgY29uc3RyYWludCBTT0MgYnkgU09DIGZvciB2b3AyIGJpbmRpbmcsIGFzIGludGVy
cnVwdHMgb2YgcmszNTc2Cj4+ICAgaXMgdmVyeSBkaWZmZXJlbnQgZnJvbSBvdGhlcnMKPj4gLSBE
cm9wIEtyenlzenRvZidzIFJldmlld2VkLWJ5IGZvciB2b3BwMiBiaW5kaW5ncywgYXMgdGhpcyB2
ZXJzaW9uIGNoYW5nZWQgYSBsb3QuCj4+IAo+PiBDaGFuZ2VzIGluIHYxOgo+PiAtIG9yZGVyZWQg
Ynkgc29jIG5hbWUKPj4gLSBBZGQgZGVzY3JpcHRpb24gZm9yIG5ld2x5IGFkZGVkIGludGVycnVw
dAo+PiAKPj4gQW5keSBZYW4gKDgpOgo+PiAgIGR0LWJpbmRpbmdzOiBzb2M6IHJvY2tjaGlwOiBh
ZGQgcmszNTc2IGhkcHR4cGh5IGdyZiBzeXNjb24KPj4gICBkdC1iaW5kaW5nczogcGh5OiBBZGQg
cmszNTc2IGhkcHR4IHBoeQo+PiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByb2NrY2hpcDogQWRk
IHJrMzU3NiBoZG1pIGNvbnRyb2xsZXIKPj4gICBkdC1iaW5kaW5nczogaW9tbXU6IHJvY2tjaGlw
OiBBZGQgUm9ja2NoaXAgUkszNTc2Cj4+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHZvcDI6IEFk
ZCByazM1NzYgc3VwcG9ydAo+PiAgIGFybTY0OiBkdHM6IHJvY2tjaGlwOiBBZGQgdm9wIGZvciBy
azM1NzYKPj4gICBhcm02NDogZHRzOiByb2NrY2hpcDogQWRkIGhkbWkgZm9yIHJrMzU3Ngo+PiAg
IGFybTY0OiBkdHM6IHJvY2tjaGlwOiBFbmFibGUgaGRtaSBkaXNwbGF5IG9uIHNpZ2U1Cj4+IAo+
PiAgLi4uL3JvY2tjaGlwL3JvY2tjaGlwLHJrMzU4OC1kdy1oZG1pLXFwLnlhbWwgIHwgICAxICsK
Pj4gIC4uLi9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcDIueWFtbCAgICAgICB8ICA3MCAr
KysrKysrKy0tCj4+ICAuLi4vYmluZGluZ3MvaW9tbXUvcm9ja2NoaXAsaW9tbXUueWFtbCAgICAg
ICAgfCAgIDEgKwo+PiAgLi4uL3BoeS9yb2NrY2hpcCxyazM1ODgtaGRwdHgtcGh5LnlhbWwgICAg
ICAgIHwgIDYyICsrKysrKy0tLQo+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3JvY2tj
aGlwL2dyZi55YW1sIHwgICAxICsKPj4gIC4uLi9ib290L2R0cy9yb2NrY2hpcC9yazM1NzYtYXJt
c29tLXNpZ2U1LmR0cyB8ICA0NyArKysrKysrCj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tj
aGlwL3JrMzU3Ni5kdHNpICAgICAgfCAxMjYgKysrKysrKysrKysrKysrKysrCj4+ICA3IGZpbGVz
IGNoYW5nZWQsIDI3NiBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKPj4gCj4+IAo+Cj4K
Pgo+Cg==
