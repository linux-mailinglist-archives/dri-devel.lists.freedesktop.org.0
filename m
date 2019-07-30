Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E773979E6D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 04:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681536E2B4;
	Tue, 30 Jul 2019 02:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF926E2B4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 02:00:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126208166005.22.openmobile.ne.jp
 [126.208.166.5])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57C35CC;
 Tue, 30 Jul 2019 04:00:03 +0200 (CEST)
Date: Tue, 30 Jul 2019 04:59:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH] drm/bridge: tc358764: Fix build error
Message-ID: <20190730015954.GA4852@pendragon.ideasonboard.com>
References: <20190729090520.25968-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729090520.25968-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564452005;
 bh=M4bJxfcsKMIIHE5Z4bopQDCvjHsPpiVRe3VEDLR/A2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RMXsPAzDQPTmgpHu4jx+FY099DDEXG2uaehfrjfh5gy4UKrd7wpVpxgIKXC2XqRL8
 1C7G4QKutM7taDTw7dRQFr51P5ZG0z6ZsQ9e3fATdBFAa3JwyvpJKK/s5vikoXDp4j
 Txn+dSWgNYET20yh2IxK7bpqahJHJdRGsTK8iZrI=
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWXVlLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBNb24sIEp1bCAyOSwgMjAxOSBh
dCAwNTowNToyMFBNICswODAwLCBZdWVIYWliaW5nIHdyb3RlOgo+IElmIENPTkZJR19EUk1fVE9T
SElCQV9UQzM1ODc2ND15IGJ1dCBDT05GSUdfRFJNX0tNU19IRUxQRVI9bSwKPiBidWlsZGluZyBm
YWlsczoKPiAKPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY0Lm86KC5yb2RhdGErMHgy
MjgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3Jf
cmVzZXQnCj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5vOigucm9kYXRhKzB4MjQw
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVj
dG9yX21vZGVzJwo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQubzooLnJvZGF0YSsw
eDI2OCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rv
cl9kdXBsaWNhdGVfc3RhdGUnCj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5vOigu
cm9kYXRhKzB4MjcwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZHJtX2F0b21pY19oZWxwZXJf
Y29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUnCj4gCj4gTGlrZSBUQzM1ODc2Nywgc2VsZWN0IERSTV9L
TVNfSEVMUEVSIHRvIGZpeCB0aGlzLCBhbmQKPiBjaGFuZ2UgdG8gc2VsZWN0IERSTV9QQU5FTCB0
byBhdm9pZCByZWN1cnNpdmUgZGVwZW5kZW5jeS4KPiAKPiBSZXBvcnRlZC1ieTogSHVsayBSb2Jv
dCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gRml4ZXM6IGYzOGI3Y2NhNmQwZSAoImRybS9icmlkZ2U6
IHRjMzU4NzY0OiBBZGQgRFNJIHRvIExWRFMgYnJpZGdlIGRyaXZlciIpCj4gU2lnbmVkLW9mZi1i
eTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmln
Cj4gaW5kZXggYTZlZWM5MC4uMzIzZjcyZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPiBA
QCAtMTE2LDkgKzExNiwxMCBAQCBjb25maWcgRFJNX1RISU5FX1RIQzYzTFZEMTAyNAo+ICAKPiAg
Y29uZmlnIERSTV9UT1NISUJBX1RDMzU4NzY0Cj4gIAl0cmlzdGF0ZSAiVEMzNTg3NjQgRFNJL0xW
RFMgYnJpZGdlIgo+IC0JZGVwZW5kcyBvbiBEUk0gJiYgRFJNX1BBTkVMCj4gIAlkZXBlbmRzIG9u
IE9GCj4gIAlzZWxlY3QgRFJNX01JUElfRFNJCj4gKwlzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAr
CXNlbGVjdCBEUk1fUEFORUwKPiAgCWhlbHAKPiAgCSAgVG9zaGliYSBUQzM1ODc2NCBEU0kvTFZE
UyBicmlkZ2UgZHJpdmVyLgo+ICAKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
