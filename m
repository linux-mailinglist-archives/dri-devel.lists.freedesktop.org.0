Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C20FA7121C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A77410E399;
	Wed, 26 Mar 2025 08:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="RgXrxQ0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id B82C310E399
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=ww0BkFy4aWA0YRYiXhyPOQOR4G2Nus3Dw378EDkmqd8=; b=R
 gXrxQ0Kh0sHRTtUVhdTIMLk5EjQc46fR/N7c+l6i772hwD+5qoYZE7LNfGQ2pidY
 b98Z+JZlBaiVh3OCRe+PsPAfu6Mc0EQrEFI6Li1AHFZ1+KxBdpBPKVDWW39ePtlr
 gzBNQPg8JML3FAbw0Xqqd56fPeHXyrd6YbUMlWI+Ck=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-115 (Coremail) ; Wed, 26 Mar 2025 16:10:40 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 26 Mar 2025 16:10:40 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v2 2/6] dt-bindings: display: rockchip,inno-hdmi:
 Document GRF for RK3036 HDMI
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250326-poetic-happy-peacock-a79d29@krzk-bin>
References: <20250325132944.171111-1-andyshrk@163.com>
 <20250325132944.171111-3-andyshrk@163.com>
 <20250326-poetic-happy-peacock-a79d29@krzk-bin>
X-NTES-SC: AL_Qu2fAPWcuU4v5iabY+kfmkcVgOw9UcO5v/Qk3oZXOJF8jDzp/xADZW1jPVTtweeEIS+ujTi3dDVRxcBmeZlRU6UgfbysO0M0gOJZSe6spqRDuA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <617e3d7f.77d1.195d180e680.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cygvCgD3v8uAtuNnBmmNAA--.58577W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqB4cXmfjtY8XaAABs0
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

CkhpCgpBdCAyMDI1LTAzLTI2IDE1OjU5OjI1LCAiS3J6eXN6dG9mIEtvemxvd3NraSIgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cj5PbiBUdWUsIE1hciAyNSwgMjAyNSBhdCAwOToyOTozNlBNICsw
ODAwLCBBbmR5IFlhbiB3cm90ZToKPj4gRnJvbTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hp
cHMuY29tPgo+PiAKPj4gSERNSSBvbiBSSzMwMzYgdXNlIEdSRiBjb250cm9sIHRoZSBIU1lOQy9W
U1lOQyBwb2xhcml0eSwgYnV0IHRoaXMgcGFydAo+PiBpcyBtaXNzaW5nIHdoZW4gaXQgZmlyc3Qg
bGFuZGluZyB1cHN0cmVhbS4KPj4gCj4+IERvY3VtZW50IHRoYXQgaXQgaXMgbWFuZGF0b3J5IGZv
ciBSSzMwMzYgSERNSS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkBy
b2NrLWNoaXBzLmNvbT4KPj4gLS0tCj4+IAo+PiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPgo+V2hl
cmUgd2FzIHYxPyBJIGNhbm5vdCBmaW5kIGl0LgoKU29ycnksIEkgZm9yZ290IHRvIG1lbnRpb24g
aXQgOiAiIHRoaXMgcGF0Y2ggaXMgZmlyc3QgaW5jbHVkZWQgaW4gdGhpcyBzZXJpZXMiCgoKPgo+
YjQgZGlmZiAnMjAyNTAzMjUxMzI5NDQuMTcxMTExLTMtYW5keXNocmtAMTYzLmNvbScKPkNoZWNr
aW5nIGZvciBvbGRlciByZXZpc2lvbnMKPkdyYWJiaW5nIHNlYXJjaCByZXN1bHRzIGZyb20gbG9y
ZS5rZXJuZWwub3JnCj5Ob3RoaW5nIG1hdGNoaW5nIHRoYXQgcXVlcnkuCj4tLS0KPkFuYWx5emlu
ZyA3IG1lc3NhZ2VzIGluIHRoZSB0aHJlYWQKPkNvdWxkIG5vdCBmaW5kIGxvd2VyIHNlcmllcyB0
byBjb21wYXJlIGFnYWluc3QuCj4KPkJlc3QgcmVnYXJkcywKPktyenlzenRvZgo+Cj4KPl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj5MaW51eC1yb2NrY2hp
cCBtYWlsaW5nIGxpc3QKPkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcm9ja2NoaXAK
