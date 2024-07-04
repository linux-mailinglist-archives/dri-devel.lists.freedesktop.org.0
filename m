Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F31926D5A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 04:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6835D10E3F7;
	Thu,  4 Jul 2024 02:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="QC3qH4qR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id EDA4E10E552
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 02:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=Td/F533Mk5xYIXV8PPTJiZGwS7kwRRkuOurA8LkiIIQ=; b=Q
 C3qH4qRfyDRr/pRai+58UGLjbqsfqMQBsQW/dYwYsQyaqvmkUKGJcKHvyETP2IVJ
 cO8v6mT2B8Rwodq9eNQxphNRdBKmFHJl7MCcQHrbVzmVGQ5HXBG+0a7OkcrmkWRO
 jfFyAMoN6bJ+fCMXln+bXwV9qt7NYjk6/bl7Jlkyi0=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-123 (Coremail) ; Thu, 4 Jul 2024 10:10:01 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 4 Jul 2024 10:10:01 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dragan Simic" <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH] drm/rockchip: cdn-dp: Remove redundant workarounds for
 firmware loading
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <9b7a9e9b88ad8c7489ee1b4c70b8751eeb5cf6f9.1720049413.git.dsimic@manjaro.org>
References: <9b7a9e9b88ad8c7489ee1b4c70b8751eeb5cf6f9.1720049413.git.dsimic@manjaro.org>
X-NTES-SC: AL_Qu2ZAvyetkgr5ySRZukZnEobh+Y5UcK2s/ki2YFXN5k0kSTM2CsGV3pJPWHq0MiGMx+BtR2MXSdi8+RXe4lDeY10t/MHRpeSlZQUe2JNW7bN
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <109c6f19.2559.1907b817a99.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3n199BIZmSuEaAA--.39835W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxQSXmXAmQJPUAACsI
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

CkhpIERyYWdhbu+8jAoKQXQgMjAyNC0wNy0wNCAwNzozMjowMiwgIkRyYWdhbiBTaW1pYyIgPGRz
aW1pY0BtYW5qYXJvLm9yZz4gd3JvdGU6Cj5BZnRlciB0aGUgYWRkaXRpb25hbCBmaXJtd2FyZS1y
ZWxhdGVkIG1vZHVsZSBpbmZvcm1hdGlvbiB3YXMgaW50cm9kdWNlZCBieQo+dGhlIGNvbW1pdCBj
MDY3N2U0MWE0N2YgKCJkcm0vcm9ja2NoaXA6IGNkbi1kcC1jb3JlOiBhZGQgTU9EVUxFX0ZJUk1X
QVJFCj5tYWNybyIpLCB0aGVyZSdzIG5vIGxvbmdlciBuZWVkIGZvciB0aGUgZmlybXdhcmUtbG9h
ZGluZyB3b3JrYXJvdW5kcyB3aG9zZQo+c29sZSBwdXJwb3NlIHdhcyB0byBwcmV2ZW50IHRoZSBt
aXNzaW5nIGZpcm13YXJlIGJsb2IgaW4gYW4gaW5pdGlhbCByYW1kaXNrCj5mcm9tIGNhdXNpbmcg
ZHJpdmVyIGluaXRpYWxpemF0aW9uIHRvIGZhaWwuICBUaHVzLCBkZWxldGUgdGhlIHdvcmthcm91
bmRzLAo+d2hpY2ggcmVtb3ZlcyBhIHNpemFibGUgY2h1bmsgb2YgcmVkdW5kYW50IGNvZGUuCgpX
aGF0IHdvdWxkIGhhcHBlbiBpZiB0aGVyZSB3YXMgbm8gcmFtZGlzaz8gQW5kIHRoZSBmaXJtd2Fy
ZSBpcyBpbiByb290ZnMg77yfCgpGb3IgZXhhbXBsZe+8miBBIGJ1aWxkcm9vdCBiYXNlZCB0aW55
IGVtYmVkZGVkIHN5c3RlbeOAggoKCj4KPlZhcmlvdXMgdXRpbGl0aWVzIHVzZWQgYnkgTGludXgg
ZGlzdHJpYnV0aW9ucyB0byBnZW5lcmF0ZSBpbml0aWFsIHJhbWRpc2tzCj5uZWVkIHRvIG9iZXkg
dGhlIGZpcm13YXJlLXJlbGF0ZWQgbW9kdWxlIGluZm9ybWF0aW9uLCBzbyB3ZSBjYW4gcmVseSBv
biB0aGUKPmZpcm13YXJlIGJsb2IgYmVpbmcgcHJlc2VudCBpbiB0aGUgZ2VuZXJhdGVkIGluaXRp
YWwgcmFtZGlza3MuCj4KPlNpZ25lZC1vZmYtYnk6IERyYWdhbiBTaW1pYyA8ZHNpbWljQG1hbmph
cm8ub3JnPgo+LS0tCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMgfCA1
MyArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspLCA0MyBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9jZG4tZHAtY29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1j
b3JlLmMKPmluZGV4IGJkN2FhODkxYjgzOS4uZTFhN2M2YTExNzJiIDEwMDY0NAo+LS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9jZG4tZHAtY29yZS5jCj5AQCAtNDQsOSArNDQsOSBAQCBzdGF0aWMgaW5saW5l
IHN0cnVjdCBjZG5fZHBfZGV2aWNlICplbmNvZGVyX3RvX2RwKHN0cnVjdCBkcm1fZW5jb2RlciAq
ZW5jb2RlcikKPiAjZGVmaW5lIERQVFhfSFBEX0RFTAkJKDIgPDwgMTIpCj4gI2RlZmluZSBEUFRY
X0hQRF9TRUxfTUFTSwkoMyA8PCAyOCkKPiAKPi0jZGVmaW5lIENETl9GV19USU1FT1VUX01TCSg2
NCAqIDEwMDApCj4gI2RlZmluZSBDRE5fRFBDRF9USU1FT1VUX01TCTUwMDAKPiAjZGVmaW5lIENE
Tl9EUF9GSVJNV0FSRQkJInJvY2tjaGlwL2RwdHguYmluIgo+Kwo+IE1PRFVMRV9GSVJNV0FSRShD
RE5fRFBfRklSTVdBUkUpOwo+IAo+IHN0cnVjdCBjZG5fZHBfZGF0YSB7Cj5AQCAtOTA5LDYxICs5
MDksMjggQEAgc3RhdGljIGludCBjZG5fZHBfYXVkaW9fY29kZWNfaW5pdChzdHJ1Y3QgY2RuX2Rw
X2RldmljZSAqZHAsCj4gCXJldHVybiBQVFJfRVJSX09SX1pFUk8oZHAtPmF1ZGlvX3BkZXYpOwo+
IH0KPiAKPi1zdGF0aWMgaW50IGNkbl9kcF9yZXF1ZXN0X2Zpcm13YXJlKHN0cnVjdCBjZG5fZHBf
ZGV2aWNlICpkcCkKPi17Cj4tCWludCByZXQ7Cj4tCXVuc2lnbmVkIGxvbmcgdGltZW91dCA9IGpp
ZmZpZXMgKyBtc2Vjc190b19qaWZmaWVzKENETl9GV19USU1FT1VUX01TKTsKPi0JdW5zaWduZWQg
bG9uZyBzbGVlcCA9IDEwMDA7Cj4tCj4tCVdBUk5fT04oIW11dGV4X2lzX2xvY2tlZCgmZHAtPmxv
Y2spKTsKPi0KPi0JaWYgKGRwLT5md19sb2FkZWQpCj4tCQlyZXR1cm4gMDsKPi0KPi0JLyogRHJv
cCB0aGUgbG9jayBiZWZvcmUgZ2V0dGluZyB0aGUgZmlybXdhcmUgdG8gYXZvaWQgYmxvY2tpbmcg
Ym9vdCAqLwo+LQltdXRleF91bmxvY2soJmRwLT5sb2NrKTsKPi0KPi0Jd2hpbGUgKHRpbWVfYmVm
b3JlKGppZmZpZXMsIHRpbWVvdXQpKSB7Cj4tCQlyZXQgPSByZXF1ZXN0X2Zpcm13YXJlKCZkcC0+
ZncsIENETl9EUF9GSVJNV0FSRSwgZHAtPmRldik7Cj4tCQlpZiAocmV0ID09IC1FTk9FTlQpIHsK
Pi0JCQltc2xlZXAoc2xlZXApOwo+LQkJCXNsZWVwICo9IDI7Cj4tCQkJY29udGludWU7Cj4tCQl9
IGVsc2UgaWYgKHJldCkgewo+LQkJCURSTV9ERVZfRVJST1IoZHAtPmRldiwKPi0JCQkJICAgICAg
ImZhaWxlZCB0byByZXF1ZXN0IGZpcm13YXJlOiAlZFxuIiwgcmV0KTsKPi0JCQlnb3RvIG91dDsK
Pi0JCX0KPi0KPi0JCWRwLT5md19sb2FkZWQgPSB0cnVlOwo+LQkJcmV0ID0gMDsKPi0JCWdvdG8g
b3V0Owo+LQl9Cj4tCj4tCURSTV9ERVZfRVJST1IoZHAtPmRldiwgIlRpbWVkIG91dCB0cnlpbmcg
dG8gbG9hZCBmaXJtd2FyZVxuIik7Cj4tCXJldCA9IC1FVElNRURPVVQ7Cj4tb3V0Ogo+LQltdXRl
eF9sb2NrKCZkcC0+bG9jayk7Cj4tCXJldHVybiByZXQ7Cj4tfQo+LQo+IHN0YXRpYyB2b2lkIGNk
bl9kcF9wZF9ldmVudF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiB7Cj4gCXN0cnVj
dCBjZG5fZHBfZGV2aWNlICpkcCA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgY2RuX2RwX2Rl
dmljZSwKPiAJCQkJCQlldmVudF93b3JrKTsKPiAJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvciA9ICZkcC0+Y29ubmVjdG9yOwo+IAllbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIG9sZF9z
dGF0dXM7Cj4tCj4gCWludCByZXQ7Cj4gCj4gCW11dGV4X2xvY2soJmRwLT5sb2NrKTsKPiAKPiAJ
aWYgKGRwLT5zdXNwZW5kZWQpCj4gCQlnb3RvIG91dDsKPiAKPi0JcmV0ID0gY2RuX2RwX3JlcXVl
c3RfZmlybXdhcmUoZHApOwo+LQlpZiAocmV0KQo+LQkJZ290byBvdXQ7Cj4rCWlmICghZHAtPmZ3
X2xvYWRlZCkgewo+KwkJcmV0ID0gcmVxdWVzdF9maXJtd2FyZSgmZHAtPmZ3LCBDRE5fRFBfRklS
TVdBUkUsIGRwLT5kZXYpOwo+KwkJaWYgKHJldCkgewo+KwkJCURSTV9ERVZfRVJST1IoZHAtPmRl
diwgIkxvYWRpbmcgZmlybXdhcmUgZmFpbGVkOiAlZFxuIiwgcmV0KTsKPisJCQlnb3RvIG91dDsK
PisJCX0KPisKPisJCWRwLT5md19sb2FkZWQgPSB0cnVlOwo+Kwl9Cj4gCj4gCWRwLT5jb25uZWN0
ZWQgPSB0cnVlOwo+IAo=
