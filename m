Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81097D38B77
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 03:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C91310E124;
	Sat, 17 Jan 2026 02:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="OWKwXoBW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A63A10E124
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 02:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=mX+pKglcUGalsnXrao4pZyIC4YLVUK9HfhdJDPeAPw0=; b=O
 WKwXoBWKRqUPFNSa1evtIxzarIzwBKxN71haE4VjEtyWif7u8nWsG6HSio3xi1TO
 uFDbAa3UmpZo+lKbDeTfjKdHBiIoG7nv0DlvgT1gpBuxAlZRHRb55ammLKVcW5qc
 bSYyEzp2D21FkPrNfxBbUGu7gc4nAL5DzBtyxvUVNM=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-108 (Coremail) ; Sat, 17 Jan 2026 10:09:55 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sat, 17 Jan 2026 10:09:55 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: hjc@rock-chips.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH] drm/rockchip: vop2: Add mode valid callback for crtc
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <6509513.iIbC2pHGDl@diego>
References: <20260116005953.286225-1-andyshrk@163.com>
 <6509513.iIbC2pHGDl@diego>
X-CM-CTRLMSGS: EPOSPXBsdXM9MTc2ODYxNTc5NDQyMF80MDY1OTUwMzdiOGQzZDMzMTQ0Yjk5M
 DNmNTYwYjIzZg==
X-NTES-SC: AL_Qu2dCvqauk8i4ymaZOkfmUgWjuw/WsG1v/Ul1YBSP556jCLpyxkmREZKAWnx882oLiKGsAS2YBV818lzcYV9RqYJwAQrkcPC+qrH09Zm5SyxFA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5e931108.71d.19bc9b75cdf.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bCgvCgD3H5Rz72pp7HZYAA--.3213W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxRMNa2lq73N8bQAA3+
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

CkhlbGxvIEhlaWtv77yMCgrlnKggMjAyNi0wMS0xNyAwMDo0OToyM++8jCJIZWlrbyBTdMO8Ym5l
ciIgPGhlaWtvQHNudGVjaC5kZT4g5YaZ6YGT77yaCj5IaSBBbmR5LAo+Cj5BbSBGcmVpdGFnLCAx
Ni4gSmFudWFyIDIwMjYsIDAxOjU5OjQ5IE1pdHRlbGV1cm9ww6Rpc2NoZSBOb3JtYWx6ZWl0IHNj
aHJpZWIgQW5keSBZYW46Cj4+IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNv
bT4KPgo+d2hlbiByZXNlbmRpbmcgYW4gdW5tb2RpZmllZCBwYXRjaCwgcGxlYXNlIG1hcmsgdGhl
IHN1YmplY3QgYXMKPltQQVRDSCBSRVNFTkRdIC4uLi4KPgoKClNvcnJ5LCBJIGZvcmdvdCB0aGF0
IHRoaXMgcGF0Y2ggaGFkIGFscmVhZHkgYmVlbiBzZW50IG91dCBvbmNlIGJlZm9yZQoKPj4gRmls
dGVyIHRoZSBtb2RlIHRoYXQgY2FuJ3Qgb3V0cHV0IGJ5IHRoZSBjcnRjLgo+Cj5JbiBjb21taXQg
OGUxNDBjYjYwMjcwICgiZHJtL3JvY2tjaGlwOiB2b3A6IGxpbWl0IG1heGltdW0gcmVzb2x1dGlv
biB0bwo+aGFyZHdhcmUgY2FwYWJpbGl0aWVzIikgd2hpY2ggaW50cm9kdWNlZCB0aGUgc2ltaWxh
ciBjaGVjayBvbiBWT1AoMSksIHdlCj5oYWQgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiwgaW4gdGhh
dCB0aGUgVk9QMSBoYXJkd2FyZSBkb2VzIG5vdCBoYXZlCj5hbiBvdXRwdXQgaGVpZ2h0IGxpbWl0
LiBJcyB0aGUgc2FtZSB0cnVlIGZvciBWT1AyID8KPgo+QmVjYXVzZSB0aGVuIEknZCBsaWtlIHRv
IGV4dGVuZCB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIHRvIHNvbWV0aGluZyBsaWtlOgo+PT09PT09
PSA4PCA9PT09PT09Cj5UaGUgZGlmZmVyZW50IFZPUCB2YXJpYW50cyBzdXBwb3J0IGRpZmZlcmVu
dCBtYXhpbXVtIHJlc29sdXRpb25zLiBSZWplY3QKPnJlc29sdXRpb25zIHRoYXQgYXJlIG5vdCBz
dXBwb3J0ZWQgYnkgYSBzcGVjaWZpYyB2YXJpYW50Lgo+Cj5Pbmx5IHRoZSBvdXRwdXQgd2lkdGgg
aXMgY2hlY2tlZCBiZWNhdXNlIHRoZSBoYXJkd2FyZSBpdHNlbGYgZG9lcyBub3QKPmhhdmUgYSBo
YXJkIG91dHB1dCBoZWlnaHQgbGltaXQuCj49PT09PT09IDg8ID09PT09PT0KPgo+QmVjYXVzZSB3
aGVuIHNvbWVvbmUgc2VlcyB0aGUgY29kZSBsYXRlciB0aGV5IG1pZ2h0IGFzayB3aHkgdGhlIGhl
aWdodAo+aXMgbm90IGNoZWNrZWQsIHNvIGhhdmluZyB0aGF0IGluIHRoZSBjb21taXQgZGVzY3Jp
cHRpb24gYWxsb3dzIHVzIGFsbCB0bwo+cmVtZW1iZXIgd2h5IHRoZSBjaGVjayBpcyB0aGlzIHNw
ZWNpZmljIHdheSA6LSkKCkRvbmUgaW4gVjIKCgo+Cj5UaGFua3MKPkhlaWtvCj4KPj4gU2lnbmVk
LW9mZi1ieTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiAtLS0KPj4gIGRy
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIHwgMTIgKysrKysrKysr
KysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+PiAKPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPj4gaW5kZXggNDk4ZGYwY2U0
NjgwLi43NGZiYTI5YmZmZjMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fdm9wMi5jCj4+IEBAIC0xNDM5LDYgKzE0MzksMTcgQEAgc3RhdGljIHZvaWQg
dm9wMl9jcnRjX2Rpc2FibGVfdmJsYW5rKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPj4gIAl2b3Ay
X2NydGNfZGlzYWJsZV9pcnEodnAsIFZQX0lOVF9GU19GSUVMRCk7Cj4+ICB9Cj4+ICAKPj4gK3N0
YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyB2b3AyX2NydGNfbW9kZV92YWxpZChzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsCj4+ICsJCQkJCQkgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1v
ZGUpCj4+ICt7Cj4+ICsJc3RydWN0IHZvcDJfdmlkZW9fcG9ydCAqdnAgPSB0b192b3AyX3ZpZGVv
X3BvcnQoY3J0Yyk7Cj4+ICsKPj4gKwlpZiAobW9kZS0+aGRpc3BsYXkgPiB2cC0+ZGF0YS0+bWF4
X291dHB1dC53aWR0aCkKPj4gKwkJcmV0dXJuIE1PREVfQkFEX0hWQUxVRTsKPj4gKwo+PiArCXJl
dHVybiBNT0RFX09LOwo+PiArfQo+PiArCj4+ICBzdGF0aWMgYm9vbCB2b3AyX2NydGNfbW9kZV9m
aXh1cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4+ICAJCQkJIGNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICptb2RlLAo+PiAgCQkJCSBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqX21v
ZGUpCj4+IEBAIC0xODg0LDYgKzE4OTUsNyBAQCBzdGF0aWMgdm9pZCB2b3AyX2NydGNfYXRvbWlj
X2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPj4gIAo+PiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fY3J0Y19oZWxwZXJfZnVuY3Mgdm9wMl9jcnRjX2hlbHBlcl9mdW5jcyA9IHsKPj4gIAku
bW9kZV9maXh1cCA9IHZvcDJfY3J0Y19tb2RlX2ZpeHVwLAo+PiArCS5tb2RlX3ZhbGlkID0gdm9w
Ml9jcnRjX21vZGVfdmFsaWQsCj4+ICAJLmF0b21pY19jaGVjayA9IHZvcDJfY3J0Y19hdG9taWNf
Y2hlY2ssCj4+ICAJLmF0b21pY19iZWdpbiA9IHZvcDJfY3J0Y19hdG9taWNfYmVnaW4sCj4+ICAJ
LmF0b21pY19mbHVzaCA9IHZvcDJfY3J0Y19hdG9taWNfZmx1c2gsCj4+IAo+Cj4KPgo+Cg==
