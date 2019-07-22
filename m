Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A5770654
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 19:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DF189CE3;
	Mon, 22 Jul 2019 17:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1493 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jul 2019 17:02:10 UTC
Received: from gateway36.websitewelcome.com (gateway36.websitewelcome.com
 [192.185.193.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDF489CE3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 17:02:10 +0000 (UTC)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id 1D64D40195AC1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 10:37:28 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id pawdhFDfG2qH7pawdhIwSB; Mon, 22 Jul 2019 11:13:47 -0500
X-Authority-Reason: nr=8
Received: from cablelink-187-160-61-189.pcs.intercable.net
 ([187.160.61.189]:42688 helo=[192.168.0.2])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hpawc-001Asa-Vt; Mon, 22 Jul 2019 11:13:47 -0500
Subject: Re: [PATCH] drm/amdkfd/kfd_mqd_manager_v10: Fix missing break in
 switch statement
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "Cox, Philip" <Philip.Cox@amd.com>,
 Oded Gabbay <oded.gabbay@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20190721225920.GA18099@embeddedor>
 <c735a1cc-a545-50fb-44e7-c0ad93ee8ee7@amd.com>
 <BN6PR12MB18098741A081711936563597F7C40@BN6PR12MB1809.namprd12.prod.outlook.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <b1feb7e5-bd52-ef1b-b72e-b98b2c954b89@embeddedor.com>
Date: Mon, 22 Jul 2019 11:13:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BN6PR12MB18098741A081711936563597F7C40@BN6PR12MB1809.namprd12.prod.outlook.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.160.61.189
X-Source-L: No
X-Exim-ID: 1hpawc-001Asa-Vt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-187-160-61-189.pcs.intercable.net ([192.168.0.2])
 [187.160.61.189]:42688
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 10
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA3LzIyLzE5IDEwOjU4IEFNLCBEZXVjaGVyLCBBbGV4YW5kZXIgd3JvdGU6Cj4gV2UgbmVl
ZCB0byBhZGQgYSAvKmZhbGwgdGhyb3VnaCAqLyBjb21tZW50IHRoZW4uCj4gCgpJdCBtaWdodCBi
ZSBiZXR0ZXIgdG8gcmVtb3ZlIHRoZSBjYWxsIHRvIHByX2RlYnVnKCkgaW4gS0ZEX01RRF9UWVBF
X0NQOgoKCWNhc2UgS0ZEX01RRF9UWVBFX0NQOgogICAgICAgCWNhc2UgS0ZEX01RRF9UWVBFX0NP
TVBVVEU6CgkJcHJfZGVidWcoIiVzQCVpXG4iLCBfX2Z1bmNfXywgX19MSU5FX18pOwoJCW1xZC0+
YWxsb2NhdGVfbXFkID0gYWxsb2NhdGVfbXFkOwoKVGhhbmtzCi0tCkd1c3Rhdm8KCgo+IEFsZXgK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEZyb206IExpdSwgU2hhb3l1biA8
U2hhb3l1bi5MaXVAYW1kLmNvbT4KPiBTZW50OiBNb25kYXksIEp1bHkgMjIsIDIwMTkgMTE6MTQg
QU0KPiBUbzogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT47IENv
eCwgUGhpbGlwIDxQaGlsaXAuQ294QGFtZC5jb20+OyBPZGVkIEdhYmJheSA8b2RlZC5nYWJiYXlA
Z21haWwuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29t
PjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFpob3UsIERh
dmlkKENodW5NaW5nKSA8RGF2aWQxLlpob3VAYW1kLmNvbT47IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT47IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsg
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGtmZC9rZmRfbXFkX21h
bmFnZXJfdjEwOiBGaXggbWlzc2luZyBicmVhayBpbiBzd2l0Y2ggc3RhdGVtZW50Cj4gCj4gVGhp
cyBvbmUgcHJvcGVybHkgaW4gcHVycG9zZSAsIFRoZSBtcWQgaW5pdCBmb3IgQ1AgYW5kICBDT01Q
VVRFIHdpbGwKPiBoYXZlIHRoZSBzYW1lICByb3V0aW5lIC4KPiAKPiBSZWdhcmQKPiAKPiBzc2hh
b3l1bi5saXUKPiAKPiBPbiAyMDE5LTA3LTIxIDY6NTkgcC5tLiwgR3VzdGF2byBBLiBSLiBTaWx2
YSB3cm90ZToKPj4gQWRkIG1pc3NpbmcgYnJlYWsgc3RhdGVtZW50IGluIG9yZGVyIHRvIHByZXZl
bnQgdGhlIGNvZGUgZnJvbSBmYWxsaW5nCj4+IHRocm91Z2ggdG8gY2FzZSBLRkRfTVFEX1RZUEVf
Q09NUFVURS4KPj4KPj4gVGhpcyBidWcgd2FzIGZvdW5kIHRoYW5rcyB0byB0aGUgb25nb2luZyBl
ZmZvcnRzIHRvIGVuYWJsZQo+PiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLgo+Pgo+PiBGaXhlczog
MTQzMjhhYTU4Y2U1ICgiZHJtL2FtZGtmZDogQWRkIG5hdmkxMCBzdXBwb3J0IHRvIGFtZGtmZC4g
KHYzKSIpCj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+IFNpZ25lZC1vZmYtYnk6IEd1
c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Cj4+IC0tLQo+PiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAuYyB8IDEgKwo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jCj4+IGluZGV4IDRmOGE2ZmZjNTc3
NS4uMWQ4YjEzYWQ0NmY5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jCj4+IEBAIC00MzAsNiArNDMwLDcgQEAgc3RydWN0IG1x
ZF9tYW5hZ2VyICptcWRfbWFuYWdlcl9pbml0X3YxMChlbnVtIEtGRF9NUURfVFlQRSB0eXBlLAo+
PiAgICAgICAgc3dpdGNoICh0eXBlKSB7Cj4+ICAgICAgICBjYXNlIEtGRF9NUURfVFlQRV9DUDoK
Pj4gICAgICAgICAgICAgICAgcHJfZGVidWcoIiVzQCVpXG4iLCBfX2Z1bmNfXywgX19MSU5FX18p
Owo+PiArICAgICAgICAgICAgIGJyZWFrOwo+PiAgICAgICAgY2FzZSBLRkRfTVFEX1RZUEVfQ09N
UFVURToKPj4gICAgICAgICAgICAgICAgcHJfZGVidWcoIiVzQCVpXG4iLCBfX2Z1bmNfXywgX19M
SU5FX18pOwo+PiAgICAgICAgICAgICAgICBtcWQtPmFsbG9jYXRlX21xZCA9IGFsbG9jYXRlX21x
ZDsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
