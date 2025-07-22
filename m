Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2192B0D229
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 08:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCA410E131;
	Tue, 22 Jul 2025 06:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="jLm3ReU3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id A44A710E131
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 06:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=Od2N/35x0n354N5QbOs1x7Zwbn1xkujRTkM0QU+Krc4=; b=j
 Lm3ReU3BJJa092GingCNVpiE8NPy8AFOpwXf9oyRdkpHwZ4kPJeWedm/vN9X79CS
 u92+uU4vb+6usS+PEElSMslBVDDtSk+lg3D8OjakzMRt5ogj71Lcl55XAmt13xpV
 Q2kvPEymIbedrkQ1cpEhHPHmjiwrp1LKpZddxZ1O0g=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-106 (Coremail) ; Tue, 22 Jul 2025 14:55:06 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 22 Jul 2025 14:55:06 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: "Algea Cao" <algea.cao@rock-chips.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH 1/5] drm/rockchip: vop2: Add high color depth support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <c5624dad-93cb-4cc3-88ad-808dcc43274d@collabora.com>
References: <20250721-rk3588-10bpc-v1-0-e95a4abcf482@collabora.com>
 <20250721-rk3588-10bpc-v1-1-e95a4abcf482@collabora.com>
 <3ceb2c70.2145.1982ff28b9c.Coremail.andyshrk@163.com>
 <c5624dad-93cb-4cc3-88ad-808dcc43274d@collabora.com>
X-NTES-SC: AL_Qu2eAf2duEsr4CKQZekfmUkTh+o2Xca5uf0j3YBWOZh+jCDp+QI/WUd7PHfV+c6FAj2WqyCvXhFv2v9ITLdpdJIwnenVIiESySmfHn87IETmow==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4966b602.5395.19830ea1e2f.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aigvCgD3lz_KNX9oftoDAA--.34909W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgCSXmh-NBYeHAABso
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

CkhlbGxvIENyaXN0aWFuLAoK5ZyoIDIwMjUtMDctMjIgMTQ6MTY6MjbvvIwiQ3Jpc3RpYW4gQ2lv
Y2FsdGVhIiA8Y3Jpc3RpYW4uY2lvY2FsdGVhQGNvbGxhYm9yYS5jb20+IOWGmemBk++8mgo+SGkg
QW5keSwKPgo+T24gNy8yMi8yNSA1OjI0IEFNLCBBbmR5IFlhbiB3cm90ZToKPj4gCj4+IEhlbGxv
IENyaXN0aWFu77yMCj4+IAo+PiBBdCAyMDI1LTA3LTIyIDAxOjM5OjA0LCAiQ3Jpc3RpYW4gQ2lv
Y2FsdGVhIiA8Y3Jpc3RpYW4uY2lvY2FsdGVhQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Pj4gVGFr
ZSB0aGUgYml0cyBwZXIgY29sb3IgY2hhbm5lbCBpbnRvIGNvbnNpZGVyYXRpb24gd2hlbiBjb21w
dXRpbmcgRENMSwo+Pj4gcmF0ZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDcmlzdGlhbiBDaW9j
YWx0ZWEgPGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJvcmEuY29tPgo+Pj4gLS0tCj4+PiBkcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyB8IDMgKysrCj4+PiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIGIvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPj4+IGluZGV4IDE4NmY2NDUyYTdkMzU5ZjA3OTY2
MmJjNTgwODUwOTI5NjMyZWE4ZmUuLmE3MTRiY2JiMDJkZTE2MjY3ZTdmZWJiYWViMWViMjcwYzcw
YWFlZjIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBf
ZHJtX3ZvcDIuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV92b3AyLmMKPj4+IEBAIC0xNzMxLDYgKzE3MzEsOSBAQCBzdGF0aWMgdm9pZCB2b3AyX2NydGNf
YXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4+PiAJCWNsb2NrICo9IDI7Cj4+
PiAJfQo+Pj4KPj4+ICsJaWYgKHZjc3RhdGUtPm91dHB1dF9icGMgPiA4KQo+Pj4gKwkJY2xvY2sg
PSBESVZfUk9VTkRfQ0xPU0VTVChjbG9jayAqIHZjc3RhdGUtPm91dHB1dF9icGMsIDgpOwo+PiAK
Pj4gCj4+IFRoaXMgc2VlbXMgbm90IHJpZ2h0LCAgcmVnYXJkbGVzcyBvZiB0aGUgdmFsdWUgb2Yg
YnBjLCB0aGUgZGNsayBvZiBWT1AgbXVzdCBiZQo+PiBjb25zaXN0ZW50IHdpdGggbW9kZS0+Y3J0
Y19jbG9jay4KPj4gSWYgdGhlIGRjbGsgb2YgVk9QIGlzIGluY3JlYXNlZCBpbiBhY2NvcmRhbmNl
IHdpdGggdGhlIEJQQyByYXRpbyBoZXJlLCB0aGVuIHRoZSByZWZyZXNoIHJhdGUgb2YgVk9QIHdp
bGwgYWxzbyBpbmNyZWFzZSBwcm9wb3J0aW9uYWxseS4KPj4gVGhpcyB3b3VsZCBiZSBpbmNvbnNp
c3RlbnQgd2l0aCB0aGUgdGltaW5nIGRlc2NyaWJlZCBpbiB0aGUgbW9kZS4KPj4gRm9yIGEgaGln
aHQgY29sb3IgZGVwdGgsICB0aGUgZnJlcXVlbmN5IG5lZWRzIHRvIGJlIGluY3JlYXNlZCBmb3Ig
dGhlIEhETUkgUEhZJ3MgY2xvY2suCj4KPlRoZSBIRE1JIFBIWSdzIGNsb2NrIGlzIGFjdHVhbGx5
IGNvbXB1dGVkIGF0IEhETUkgY29ubmVjdG9yIGZyYW1ld29yayBsZXZlbAo+WzFdLCB0YWtpbmcg
aW50byBhY2NvdW50IHRoZSBjdXJyZW50IGJwYyB2YWx1ZSwgd2hpY2ggaXMgZGV0ZXJtaW5lZCBh
cyBwYXJ0Cj5vZiBoZG1pX2NvbXB1dGVfY29uZmlnKCkgWzJdLgo+Cj5UaGF0IG1lYW5zIGNvbm5f
c3RhdGUtPmhkbWkudG1kc19jaGFyX3JhdGUgaW4KPmR3X2hkbWlfcXBfcm9ja2NoaXBfZW5jb2Rl
cl9hdG9taWNfY2hlY2soKSBkb2VzIGFscmVhZHkgaW5jbHVkZSB0aGUgYnBjCj5yZWxhdGVkIGFk
anVzdG1lbnQsIGFuZCB3ZSBwYXNzIHRoYXQgZGlyZWN0bHkgdG8gdGhlIFBIWSB2aWEKPnBoeV9j
b25maWd1cmUoKS4gIE5vdGUgdGhlcmUncyBzdGlsbCB0aGUgbmVlZCB0byBoYW5kbGUgYnBjIHNl
cGFyYXRlbHkgdmlhCj5waHlfY29uZmlndXJlX29wdHMgaW4gb3JkZXIgdG8gc2V0dXAgQ01OX1JF
RygwMDg2KSBbM10uCj4KPlNpbmNlIFZPUDIgc3dpdGNoZXMgdG8gUEhZIFBMTCBhcyBEQ0xLIHNv
dXJjZSBmb3IgbW9kZXMgdXAgdG8gNEtANjBIeiwgaXQKPm5lZWRzIHRvIHRha2UgY29sb3IgZGVw
dGggaW50byBhY2NvdW50LCB0byBrZWVwIHRoZW0gaW4gc3luYy4gIEFzIGEgbWF0dGVyCj5vZiBm
YWN0LCB0aGUgY2xvY2sgYWRqdXN0bWVudCBpbiBWT1AyIGlzIG1haW5seSBuZWNlc3NhcnkgZm9y
IGxlZ2FjeQo+cmVhc29ucywgc2luY2UgSERQVFggUEhZIGFsbG93ZWQgY2hhbmdpbmcgVE1EUyBj
aGFyIHJhdGUgdmlhIHRoZSBDb21tb24KPkNsb2NrIEZyYW1ld29yayBBUEkuICBXZSBsYW5kZWQg
YSBwcm9wZXIgc29sdXRpb24gZm9yIHRoYXQgdmlhIHRoZSBIRE1JIFBIWQo+QVBJLCBoZW5jZSB0
aGUgcGxhbiB3b3VsZCBiZSB0byBtYWtlIENDRiBBUEkgcmVhZG9ubHkgYWZ0ZXIgdGhlIHN3aXRj
aCB0bwo+UEhZIEFQSSBpcyBjb21wbGV0ZWQsIHdoaWNoIG1lYW5zIFZPUDIgc2hvdWxkbid0IGRl
YWwgYW55bW9yZSB3aXRoIGNsb2NrCj5jYWxjdWxhdGlvbnMgd2hlbiB1c2luZyB0aGUgUEhZIFBM
TCBhcyBEQ0xLIHNvdXJjZS4KCldoYXQgSSB3YW50IHRvIGVtcGhhc2l6ZSBpcyB0aGF0IG9uIHRo
ZSB2b3AvY3J0YyBzaWRlLCB3aGF0IHdlIHNob3VsZCBiZSBjb25jZXJuZWQgYWJvdXQgaXMgbW9k
ZSAtPiBjbG9jaywgCm5vdCB0aGUgSERNSSBQSFkgY2xvY2suIFRoZSBIRE1JIFBIWSBjbG9jayBp
cyBzb21ldGhpbmcgdGhhdCB0aGUgSERNSSBicmlkZ2Ugb3IgdGhlIEhETUkgUEhZIGRyaXZlciBu
ZWVkcyB0byBwYXkgYXR0ZW50aW9uIHRvLgoKVGhpcyBwYXRjaCB3b3JrcyBqdXN0IGJlY2F1c2Ug
Y3VycmVudGx5LCBvbiBSSzM1NzYgYW5kIFJLMzU4OCwgdGhlIEhETUkgUEhZIFBMTCBjYW4gYmUg
dXNlZCBhcyB0aGUgZGNsayBzb3VyY2UgZm9yIHRoZSB2b3AuCkFmdGVyIGNvcnJlY3RseSBzZXR0
aW5nIENNTl9SRUcwMDg2LCBpdCBjYW4gcHJlY2lzZWx5IGFkanVzdCB0aGUgSERNSSBIUFkgUExM
IGNsb2NrIGFkanVzdGVkIGFjY29yZGluZyB0byB0aGUgYnBjIGZ1cnRoZXIgdG8KdGhlIGZyZXF1
ZW5jeSBvZiBtb2RlLT5jbG9jaywgYW5kIHRoZW4gdXNlIGl0IGFzIHRoZSBkY2xrIGZvciB0aGUg
dm9wLgpIb3dldmVyLCB3ZSBhbHNvIG5lZWQgdG8gYmUgYXdhcmUgb2YgdGhlIGZvbGxvd2luZyBz
aXR1YXRpb25zOgoKMSkgV2hlbiB3ZSBhcmUgdXNpbmcgSERNSSwgd2UgY2FuIHN0aWxsIGNob29z
ZSB0aGUgc3lzdGVtIFBMTCBpbnN0ZWFkIG9mIHRoZSBIRE1JIFBIWSBQTEwgYXMKICAgIHRoZSBj
bG9jayBzb3VyY2UgZm9yIGRjbGsuIEluIHRoaXMgY2FzZSwgdGhpcyBwYXRjaCB3aWxsIGNhdXNl
IGluY29ycmVjdCBtb2RlLT5jbG9jay4KMikgIFdoZW4gd2UgYXJlIHVzaW5nIEhETUkgYWJvdmUg
dGhlIDRLNjAgbW9kZSg0SzEyMCksIHdlIGNhbiBvbmx5IHVzZSB0aGUgc3lzdGVtIFBMTCBpbnN0
ZWFkCiAgICAgb2YgdGhlIEhETUlQSFkgUExMIGFzIHRoZSBjbG9jayBzb3VyY2UgZm9yIHRoZSB2
b3AgZGNsaywgIHRoaXMgcGF0Y2ggd2lsbCBjYXVzZSBpbmNvcnJlY3QgbW9kZS0+Y2xvY2suCjMp
IEZvciBSSzM1NzYgYW5kIFJLMzU4OCwgIGludGVyZmFjZXMgc3VjaCBhcyBEUCwgZURQLCBhbmQg
RFNJIGFsc28gc3VwcG9ydCAxMC1iaXQgbW9kZS4gCiAgICBIb3dldmVyLCBpbiBtb3N0IGNhc2Vz
LCB0aGV5IHdpbGwgY2hvb3NlIHRoZSBzeXN0ZW0gUExMIGFzIHRoZSB2b3AgZGNsayBjbG9jayBz
b3VyY2UsdGhpcyBwYXRjaCB3aWxsIGNhdXNlIGluY29ycmVjdCBtb2RlLT5jbG9jay4KNCkgVGhl
cmUgYXJlIGFsc28gb3RoZXIgcGxhdGZvcm1zLCBzdWNoIGFzIFJLMzU2OCwgZXZlbiBmb3IgSERN
SSAsIGl0IHN0aWxsIHVzZXMgdGhlIHN5c3RlbSBQTEwgYXMgdGhlIGRjbGsgY2xvY2sgc291cmNl
IGZvciB2b3AuCiAgICAgdGhpcyBwYXRjaCB3aWxsIGNhdXNlIGluY29ycmVjdCBtb2RlLT5jbG9j
ay4KCgo+Cj5SZWdhcmRsZXNzLCBJIHNob3VsZCBwcm9iYWJseSBtb3ZlIHRoaXMgY2xvY2sgYWRq
dXN0bWVudCB0byB0aGUgY29uZGl0aW9uYWwKPmJsb2NrIGhhbmRsaW5nIERDTEsgc291cmNlIHN3
aXRjaC4KPgo+WzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9o
ZG1pX3N0YXRlX2hlbHBlci5jP2g9djYuMTYtcmM3I241MjUKPlsyXSBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9k
cml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1faGRtaV9zdGF0ZV9oZWxwZXIuYz9oPXY2LjE2LXJj
NyNuNjA4Cj5bM10gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9waHkvcm9ja2NoaXAvcGh5LXJvY2tj
aGlwLXNhbXN1bmctaGRwdHguYz9oPXY2LjE2LXJjNyNuMTAzNAo=
