Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E1B63173
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F022C8996E;
	Tue,  9 Jul 2019 07:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E51B089DA3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 14:09:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CA772B;
 Mon,  8 Jul 2019 07:09:12 -0700 (PDT)
Received: from [33.8.37.10] (unknown [10.37.8.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08B6B3F59C;
 Mon,  8 Jul 2019 07:09:08 -0700 (PDT)
Subject: Re: [PATCH] drm/exynos: add CONFIG_MMU dependency
To: Arnd Bergmann <arnd@arndb.de>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20190708134707.538501-1-arnd@arndb.de>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <ea185bd7-3ac7-dc38-1c0e-78cb1cffa6a0@arm.com>
Date: Mon, 8 Jul 2019 15:09:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190708134707.538501-1-arnd@arndb.de>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy84LzE5IDI6NDYgUE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gQ29tcGlsZS10ZXN0aW5n
IHRoaXMgZHJpdmVyIG9uIGEgTk9NTVUgY29uZmlndXJhdGlvbiBzaG93cyBhIGxpbmsgZmFpbHVy
ZToKPiAKPiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLm86IEluIGZ1bmN0
aW9uIGBleHlub3NfZHJtX2dlbV9mYXVsdCc6Cj4gZXh5bm9zX2RybV9nZW0uYzooLnRleHQrMHg0
ODQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGB2bWZfaW5zZXJ0X21peGVkJwo+IAo+IEFkZCBh
IENPTkZJR19NTVUgZGVwZW5kZW5jeSB0byBlbnN1cmUgd2Ugb25seSBlbmFibGUgdGhpcyBpbiBj
b25maWd1cmF0aW9ucwo+IHRoYXQgYnVpbGQgY29ycmVjdGx5Lgo+IAo+IE1hbnkgb3RoZXIgZHJt
IGRyaXZlcnMgaGF2ZSB0aGUgc2FtZSBkZXBlbmRlbmN5LiBJdCB3b3VsZCBiZSBuaWNlIHRvCj4g
bWFrZSB0aGlzIHdvcmsgaW4gTU1VLWxlc3MgY29uZmlndXJhdGlvbnMsIGJ1dCBldmlkZW50bHkg
bm9ib2R5IGhhcwo+IGV2ZXIgbmVlZGVkIHRoaXMgc28gZmFyLgo+IAo+IEZpeGVzOiAxNTZiZGFj
OTkwNjEgKCJkcm0vZXh5bm9zOiB0cmlnZ2VyIGJ1aWxkIG9mIGFsbCBtb2R1bGVzIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL0tjb25maWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZyBi
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZwo+IGluZGV4IDYwY2U0YThhZDllMS4uNmY3
ZDNiM2IzNjI4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZwo+IEBAIC0yLDYgKzIsNyBAQAo+
ICBjb25maWcgRFJNX0VYWU5PUwo+ICAJdHJpc3RhdGUgIkRSTSBTdXBwb3J0IGZvciBTYW1zdW5n
IFNvQyBFWFlOT1MgU2VyaWVzIgo+ICAJZGVwZW5kcyBvbiBPRiAmJiBEUk0gJiYgKEFSQ0hfUzND
NjRYWCB8fCBBUkNIX1M1UFYyMTAgfHwgQVJDSF9FWFlOT1MgfHwgQVJDSF9NVUxUSVBMQVRGT1JN
IHx8IENPTVBJTEVfVEVTVCkKPiArCWRlcGVuZHMgb24gTU1VCj4gIAlzZWxlY3QgRFJNX0tNU19I
RUxQRVIKPiAgCXNlbGVjdCBWSURFT01PREVfSEVMUEVSUwo+ICAJc2VsZWN0IFNORF9TT0NfSERN
SV9DT0RFQyBpZiBTTkRfU09DCj4gCgpJIHNlZW4KCkVSUk9SOiAidm1mX2luc2VydF9taXhlZCIg
W2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zZHJtLmtvXSB1bmRlZmluZWQhCgp3aXRoIG9s
ZGVyIGtlcm5lbHMgd2hlbiBkcml2ZXIgd2FzIGJ1aWxkIGFzIGEgbW9kdWxlLCBzbyBGV0lXCgpS
ZXZpZXdlZC1ieTogVmxhZGltaXIgTXVyemluIDx2bGFkaW1pci5tdXJ6aW5AYXJtLmNvbT4KCkNo
ZWVycwpWbGFkaW1pcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
