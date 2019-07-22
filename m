Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BBD70AC7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697F089F19;
	Mon, 22 Jul 2019 20:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E6289F19
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:36:26 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:52686 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hpf2m-007X5o-La; Mon, 22 Jul 2019 16:36:24 -0400
Subject: Re: [PATCH v2 6/9] drm/tinydrm/Kconfig: drivers: Select
 BACKLIGHT_CLASS_DEVICE
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190722104312.16184-1-noralf@tronnes.org>
 <20190722104312.16184-7-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <62caf6da-00db-f3eb-f563-5d0276eea61e@lechnology.com>
Date: Mon, 22 Jul 2019 15:36:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722104312.16184-7-noralf@tronnes.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CkGiiLbPnq8J7TMXEocF5Rt8GYU7X50fU3RiVIYEuj8=; b=cOPPI2zfTzt2SRvSB/PQa8b3Bs
 CLejjM6pvgrADaaVM8EphewPCqGYjKYE5vE9/7l+C4xQo219nPXl2MKKPR/4u5cW4qx0NIfgaSymg
 1SxJ1vrCNqQ9zKLemlYMojnJ86mcRlIFdMw5SDJ4QCP+JdWC3t3lJaHjavnw/Gl3ONChPPQwR92/F
 81ay606wKDVKcldnSQSMupcRqiDHPnka84yrnPe42q8hJn07brq7W21r3s8RFd0Cx0i4/ImOJ4NIT
 XWHijiEYWlnk/utxQLMwsU/QuY+DdgZJ4372/fr+LIaicjOWz5Z/QLKGLo3D17WxI0ENscO5AQ6PK
 1WoIeCZQ==;
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
Cc: sam@ravnborg.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yMi8xOSA1OjQzIEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gVGhlIG1pcGlfZGJp
IGhlbHBlciBpcyBtaXNzaW5nIGEgZGVwZW5kZW5jeSBvbiBEUk1fS01TX0hFTFBFUiBhbmQgcHV0
dGluZwo+IHRoYXQgaW4gcmV2ZWFsZWQgdGhpcyBwcm9ibGVtOgo+IAo+IGRyaXZlcnMvdmlkZW8v
ZmJkZXYvS2NvbmZpZzoxMjplcnJvcjogcmVjdXJzaXZlIGRlcGVuZGVuY3kgZGV0ZWN0ZWQhCj4g
ZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnOjEyOiBzeW1ib2wgRkIgaXMgc2VsZWN0ZWQgYnkg
RFJNX0tNU19GQl9IRUxQRVIKPiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZzo3NTogICAgIHN5bWJv
bCBEUk1fS01TX0ZCX0hFTFBFUiBkZXBlbmRzIG9uIERSTV9LTVNfSEVMUEVSCj4gZHJpdmVycy9n
cHUvZHJtL0tjb25maWc6Njk6ICAgICBzeW1ib2wgRFJNX0tNU19IRUxQRVIgaXMgc2VsZWN0ZWQg
YnkgVElOWURSTV9NSVBJX0RCSQo+IGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25maWc6MTE6
ICAgICBzeW1ib2wgVElOWURSTV9NSVBJX0RCSSBpcyBzZWxlY3RlZCBieSBUSU5ZRFJNX0hYODM1
N0QKPiBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9LY29uZmlnOjE1OiAgICAgc3ltYm9sIFRJTllE
Uk1fSFg4MzU3RCBkZXBlbmRzIG9uIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UKPiBkcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9LY29uZmlnOjE0NDogICAgc3ltYm9sIEJBQ0tMSUdIVF9DTEFTU19ERVZJ
Q0UgaXMgc2VsZWN0ZWQgYnkgRkJfQkFDS0xJR0hUCj4gZHJpdmVycy92aWRlby9mYmRldi9LY29u
ZmlnOjE4NzogICAgICAgIHN5bWJvbCBGQl9CQUNLTElHSFQgZGVwZW5kcyBvbiBGQgo+IAo+IEEg
c3ltYm9sIHRoYXQgc2VsZWN0cyBEUk1fS01TX0hFTFBFUiBjYW4gbm90IGRlcGVuZCBvbgo+IEJB
Q0tMSUdIVF9DTEFTU19ERVZJQ0UuIFRoZSByZWFzb24gZm9yIHRoaXMgaXMgdGhhdCBEUk1fS01T
X0ZCX0hFTFBFUgo+IHNlbGVjdHMgRkIgaW5zdGVhZCBvZiBkZXBlbmRpbmcgb24gaXQuCj4gCj4g
VGhlIHRpbnlkcm0gZHJpdmVycyBoYXZlIHNvbWVob3cgZ290dGVuIGF3YXkgd2l0aCBkZXBlbmRp
bmcgb24KPiBCQUNLTElHSFRfQ0xBU1NfREVWSUNFIGJlY2F1c2UgRFJNX1RJTllEUk0gc2VsZWN0
cyBEUk1fS01TX0hFTFBFUiBhbmQgdGhlCj4gZHJpdmVycyBkZXBlbmQgb24gdGhhdCBzeW1ib2wu
Cj4gCj4gQW4gYXVkaXQgc2hvd3MgdGhhdCBhbGwgRFJNIGRyaXZlcnMgdGhhdCBzZWxlY3QgRFJN
X0tNU19IRUxQRVIgYW5kIHVzZQo+IEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UsIHNlbGVjdHMgaXQ6
Cj4gICAgRFJNX1RJTENEQywgRFJNX0dNQTUwMCwgRFJNX1NITU9CSUxFLCBEUk1fTk9VVkVBVSwg
RFJNX0ZTTF9EQ1UsCj4gICAgRFJNX0k5MTUsIERSTV9SQURFT04sIERSTV9BTURHUFUsIERSTV9Q
QVJBREVfUFM4NjIyCj4gCj4gRG9jdW1lbnRhdGlvbi9rYnVpbGQva2NvbmZpZy1sYW5ndWFnZS50
eHQgaGFzIGEgbm90ZSByZWdhcmRpbmcgc2VsZWN0Ogo+IDEuICdzZWxlY3Qgc2hvdWxkIGJlIHVz
ZWQgd2l0aCBjYXJlIHNpbmNlIGl0IGRvZXNuJ3QgdmlzaXQgZGVwZW5kZW5jaWVzLicKPiAgICAg
VGhpcyBpcyBub3QgYSBwcm9ibGVtIHNpbmNlIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UgZG9lc24n
dCBoYXZlIGFueQo+ICAgICBkZXBlbmRlbmNpZXMuCj4gMi4gJ0luIGdlbmVyYWwgdXNlIHNlbGVj
dCBvbmx5IGZvciBub24tdmlzaWJsZSBzeW1ib2xzJwo+ICAgICBCQUNLTElHSFRfQ0xBU1NfREVW
SUNFIGlzIHVzZXIgdmlzaWJsZS4KPiAKPiBUaGUgcmVhbCBzb2x1dGlvbiB0byB0aGlzIHdvdWxk
IGJlIHRvIGhhdmUgRFJNX0tNU19GQl9IRUxQRVIgZGVwZW5kIG9uIHRoZQo+IHVzZXIgdmlzaWJs
ZSBzeW1ib2wgRkIuIFRoYXQgaXMgYSBjYW4gb2Ygd29ybXMgSSdtIG5vdCB3aWxsaW5nIHRvIHRh
Y2tsZS4KPiBJIGZlYXIgdGhhdCBzdWNoIGEgY2hhbmdlIHdpbGwgcmVzdWx0IGluIG1lIGhhbmRs
aW5nIGRpZmZpY3VsdCBmYWxsb3V0cwo+IGZvciB0aGUgbmV4dCB3ZWVrcy4gU28gSSdtIGZvbGxv
d2luZyBEUk0gc3VpdGUgaGVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMg
PG5vcmFsZkB0cm9ubmVzLm9yZz4KPiAtLS0KClJldmlld2VkLWJ5OiBEYXZpZCBMZWNobmVyIDxk
YXZpZEBsZWNobm9sb2d5LmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
