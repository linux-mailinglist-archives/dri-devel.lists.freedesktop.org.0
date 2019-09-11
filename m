Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C15B0797
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4621F6EB7A;
	Thu, 12 Sep 2019 04:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E556D6E0D9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 18:45:28 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DCF433A;
 Wed, 11 Sep 2019 20:45:26 +0200 (CEST)
Subject: Re: [PATCH v4 4/9] drm: rcar-du: Claim CMM support for Gen3 SoCs
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com, geert@linux-m68k.org, horms@verge.net.au,
 uli+renesas@fpond.eu, VenkataRajesh.Kalakodima@in.bosch.com
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-5-jacopo+renesas@jmondi.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <5c158192-48aa-6b1f-a6d3-13cbdad110d7@ideasonboard.com>
Date: Wed, 11 Sep 2019 19:45:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906135436.10622-5-jacopo+renesas@jmondi.org>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568227527;
 bh=sjCW7JSo4kvqe4WkZUZxf5nFAWDwc6hbCCHe0yH1A/8=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NZI+1q0gf4BwoHG44RQSapiX3XpQ3hyCQ+2BGe5I1MBU3DRO+HDHHSWvXkZbHOtBi
 LVrqHgLM4ZxCEbmtZ5UvDnW47HCUCldKr2PK1CgOpRH845RvsYUzgP+CD7Uaqprdvx
 rDae32UC5PpPSTnnxB6+yHwO7/pUT+sirJUMWm0g=
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: muroya@ksk.co.jp, airlied@linux.ie, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gMDYvMDkvMjAxOSAxNDo1NCwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+IEFk
ZCBDTU0gdG8gdGhlIGxpc3Qgb2Ygc3VwcG9ydGVkIGZlYXR1cmVzIGZvciBHZW4zIFNvQ3MgdGhh
dCBwcm92aWRlIGl0Ogo+IC0gUjhBNzc5NQo+IC0gUjhBNzc5Ngo+IC0gUjhBNzc5NjUKPiAtIFI4
QTc3OTl4Cj4gCj4gTGVhdmUgUjhBNzc5NzAgb3V0IGFzIFYzTSBhbmQgVjNIIGFyZSB0aGUgb25s
eSBHZW4zIFNvQ3MgdGhhdCBkbyBub3QKPiBzdXBwb3J0IENNTS4KPiAKPiBSZXZpZXdlZC1ieTog
VWxyaWNoIEhlY2h0IDx1bGkrcmVuZXNhc0BmcG9uZC5ldT4KPiBSZXZpZXdlZC1ieTogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKTEdUTS4KClJl
dmlld2VkLWJ5OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29u
Ym9hcmQuY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2Fz
QGptb25kaS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2
LmMgfCAxMiArKysrKysrKy0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9k
cnYuaCB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVf
ZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jCj4gaW5kZXggNmRm
MzdjMmE5Njc4Li4wMTg0ODBhOGYzNWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvcmNhcl9kdV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfZHJ2LmMKPiBAQCAtMjc2LDcgKzI3Niw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmNhcl9k
dV9kZXZpY2VfaW5mbyByY2FyX2R1X3I4YTc3OTVfaW5mbyA9IHsKPiAgCS5mZWF0dXJlcyA9IFJD
QVJfRFVfRkVBVFVSRV9DUlRDX0lSUV9DTE9DSwo+ICAJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfVlNQ
MV9TT1VSQ0UKPiAgCQkgIHwgUkNBUl9EVV9GRUFUVVJFX0lOVEVSTEFDRUQKPiAtCQkgIHwgUkNB
Ul9EVV9GRUFUVVJFX1RWTV9TWU5DLAo+ICsJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfVFZNX1NZTkMK
PiArCQkgIHwgUkNBUl9EVV9GRUFUVVJFX0NNTSwKPiAgCS5jaGFubmVsc19tYXNrID0gQklUKDMp
IHwgQklUKDIpIHwgQklUKDEpIHwgQklUKDApLAo+ICAJLnJvdXRlcyA9IHsKPiAgCQkvKgo+IEBA
IC0zMDksNyArMzEwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByY2FyX2R1X2RldmljZV9pbmZv
IHJjYXJfZHVfcjhhNzc5Nl9pbmZvID0gewo+ICAJLmZlYXR1cmVzID0gUkNBUl9EVV9GRUFUVVJF
X0NSVENfSVJRX0NMT0NLCj4gIAkJICB8IFJDQVJfRFVfRkVBVFVSRV9WU1AxX1NPVVJDRQo+ICAJ
CSAgfCBSQ0FSX0RVX0ZFQVRVUkVfSU5URVJMQUNFRAo+IC0JCSAgfCBSQ0FSX0RVX0ZFQVRVUkVf
VFZNX1NZTkMsCj4gKwkJICB8IFJDQVJfRFVfRkVBVFVSRV9UVk1fU1lOQwo+ICsJCSAgfCBSQ0FS
X0RVX0ZFQVRVUkVfQ01NLAo+ICAJLmNoYW5uZWxzX21hc2sgPSBCSVQoMikgfCBCSVQoMSkgfCBC
SVQoMCksCj4gIAkucm91dGVzID0gewo+ICAJCS8qCj4gQEAgLTMzOCw3ICszNDAsOCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHJjYXJfZHVfZGV2aWNlX2luZm8gcmNhcl9kdV9yOGE3Nzk2NV9pbmZv
ID0gewo+ICAJLmZlYXR1cmVzID0gUkNBUl9EVV9GRUFUVVJFX0NSVENfSVJRX0NMT0NLCj4gIAkJ
ICB8IFJDQVJfRFVfRkVBVFVSRV9WU1AxX1NPVVJDRQo+ICAJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVf
SU5URVJMQUNFRAo+IC0JCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfVFZNX1NZTkMsCj4gKwkJICB8IFJD
QVJfRFVfRkVBVFVSRV9UVk1fU1lOQwo+ICsJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfQ01NLAo+ICAJ
LmNoYW5uZWxzX21hc2sgPSBCSVQoMykgfCBCSVQoMSkgfCBCSVQoMCksCj4gIAkucm91dGVzID0g
ewo+ICAJCS8qCj4gQEAgLTM4Niw3ICszODksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJjYXJf
ZHVfZGV2aWNlX2luZm8gcmNhcl9kdV9yOGE3Nzk3MF9pbmZvID0gewo+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IHJjYXJfZHVfZGV2aWNlX2luZm8gcmNhcl9kdV9yOGE3Nzk5eF9pbmZvID0gewo+ICAJ
LmdlbiA9IDMsCj4gIAkuZmVhdHVyZXMgPSBSQ0FSX0RVX0ZFQVRVUkVfQ1JUQ19JUlFfQ0xPQ0sK
PiAtCQkgIHwgUkNBUl9EVV9GRUFUVVJFX1ZTUDFfU09VUkNFLAo+ICsJCSAgfCBSQ0FSX0RVX0ZF
QVRVUkVfVlNQMV9TT1VSQ0UKPiArCQkgIHwgUkNBUl9EVV9GRUFUVVJFX0NNTSwKPiAgCS5jaGFu
bmVsc19tYXNrID0gQklUKDEpIHwgQklUKDApLAo+ICAJLnJvdXRlcyA9IHsKPiAgCQkvKgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5oIGIvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuaAo+IGluZGV4IDEzMjdjZDBkZjkwYS4uYTAw
ZGNjYzQ0N2FhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVf
ZHJ2LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5oCj4gQEAg
LTI4LDYgKzI4LDcgQEAgc3RydWN0IHJjYXJfZHVfZW5jb2RlcjsKPiAgI2RlZmluZSBSQ0FSX0RV
X0ZFQVRVUkVfVlNQMV9TT1VSQ0UJQklUKDEpCS8qIEhhcyBpbnB1dHMgZnJvbSBWU1AxICovCj4g
ICNkZWZpbmUgUkNBUl9EVV9GRUFUVVJFX0lOVEVSTEFDRUQJQklUKDIpCS8qIEhXIHN1cHBvcnRz
IGludGVybGFjZWQgKi8KPiAgI2RlZmluZSBSQ0FSX0RVX0ZFQVRVUkVfVFZNX1NZTkMJQklUKDMp
CS8qIEhhcyBUViBzd2l0Y2gvc3luYyBtb2RlcyAqLwo+ICsjZGVmaW5lIFJDQVJfRFVfRkVBVFVS
RV9DTU0JCUJJVCg0KQkvKiBIYXMgQ01NICovCj4gIAo+ICAjZGVmaW5lIFJDQVJfRFVfUVVJUktf
QUxJR05fMTI4QglCSVQoMCkJLyogQWxpZ24gcGl0Y2hlcyB0byAxMjggYnl0ZXMgKi8KPiAgCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
