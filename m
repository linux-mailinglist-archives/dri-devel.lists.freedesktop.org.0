Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDE761FC1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 15:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1796389C98;
	Mon,  8 Jul 2019 13:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160C889C98
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 13:47:24 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MsqIi-1idXVd2xaq-00tCtF; Mon, 08 Jul 2019 15:47:09 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] drm/exynos: add CONFIG_MMU dependency
Date: Mon,  8 Jul 2019 15:46:51 +0200
Message-Id: <20190708134707.538501-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Axu85VajvoAR0wMxnciqB+GEFg6pSh3s41QC4py5g9oaTINzJOU
 UZTGHhbajCJ3JGbZmqfhTRCufcbapkbWIlxE2O6YC/PYBuj6T1Xc+KMLQ61WIPq+oD2194n
 CwfP9Yz4bxTS7rQpc1m0RFG+9Hhz5UTlg9Rdj5gGR44o4kixJuGca+25o7R7dEIlRK13gXG
 gCAopP2RQqbNVKGh6VcHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wnjssiFpvxA=:HTMu8pLHDd0+KCxZo8b6Wn
 e+rAuNkumRK+K4Z/GKOoxrneL/xy7278A61Y67M6KOB+P062stKVyfD7Az5cOJZHGOFBOaOEk
 Uvyx4CtA4I/aveHXSdF7iTh61rnO0iFDNbMOm1+8KjkHwoghph0jdfvwy2VbPDC0ZP/4BhJGA
 fqZMHC9n9KfwFup9F1gyw9Wnv3c87zWbYYIKPtGWh9Yb6CazHKg4hSuJJ2cjWlIqLP/ohRJQE
 4nsMQNB6aafVD8ZgDE5e5skHAfYuj41tTYzyB14BZiXY1dZ3uszoiZnQKx8Avsfc4UYNVdtvD
 A2SnOlW/1H+JnT/+zKLp+0PA0JoXKynorPVVTakM203L+fDzngNUGXsV6+rblk2MIpley2aeO
 1iz9R/V9ISTWRasK1Z0fxpvOTpA7U6W3SZJYeGmTXx2QGlQvOhs8K+mrO9fUKKpfYS8SfIi3U
 vf5SmG44kUojDZ0Czvkz0kZ4nLl+o3WBTcolcI7ypGwocJYaXZvhFCZ8rcdz0yAR/POTH9Fjb
 I4ZyYvwDJZ/y0geIgeJo0BQDd2wuaQbHrrXwggxYJn4+BV4EeBmL4q2vHh7aWq88lAMNkdyWG
 Q4RB1/9Uxzh9dyJ6IdJHuumfnzjIpMplgs9EGUtvr70w91XN7wzNyJadQYJ9Mdcn7pUowbLO2
 tNEy0886CoGThl7fHLYWDGAXaKdwRsGZIivVKOprgWBasmaF+dPV8/YMPRzTamDudypA4e6S8
 Z2OwKIM/3VIqy4OOo2Gjb837APKoRwQAd4CMBA==
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
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tcGlsZS10ZXN0aW5nIHRoaXMgZHJpdmVyIG9uIGEgTk9NTVUgY29uZmlndXJhdGlvbiBzaG93
cyBhIGxpbmsgZmFpbHVyZToKCmRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0u
bzogSW4gZnVuY3Rpb24gYGV4eW5vc19kcm1fZ2VtX2ZhdWx0JzoKZXh5bm9zX2RybV9nZW0uYzoo
LnRleHQrMHg0ODQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGB2bWZfaW5zZXJ0X21peGVkJwoK
QWRkIGEgQ09ORklHX01NVSBkZXBlbmRlbmN5IHRvIGVuc3VyZSB3ZSBvbmx5IGVuYWJsZSB0aGlz
IGluIGNvbmZpZ3VyYXRpb25zCnRoYXQgYnVpbGQgY29ycmVjdGx5LgoKTWFueSBvdGhlciBkcm0g
ZHJpdmVycyBoYXZlIHRoZSBzYW1lIGRlcGVuZGVuY3kuIEl0IHdvdWxkIGJlIG5pY2UgdG8KbWFr
ZSB0aGlzIHdvcmsgaW4gTU1VLWxlc3MgY29uZmlndXJhdGlvbnMsIGJ1dCBldmlkZW50bHkgbm9i
b2R5IGhhcwpldmVyIG5lZWRlZCB0aGlzIHNvIGZhci4KCkZpeGVzOiAxNTZiZGFjOTkwNjEgKCJk
cm0vZXh5bm9zOiB0cmlnZ2VyIGJ1aWxkIG9mIGFsbCBtb2R1bGVzIikKU2lnbmVkLW9mZi1ieTog
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvS2NvbmZpZwppbmRleCA2MGNlNGE4YWQ5ZTEuLjZmN2QzYjNiMzYyOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvS2NvbmZpZwpAQCAtMiw2ICsyLDcgQEAKIGNvbmZpZyBEUk1fRVhZTk9TCiAJdHJpc3RhdGUg
IkRSTSBTdXBwb3J0IGZvciBTYW1zdW5nIFNvQyBFWFlOT1MgU2VyaWVzIgogCWRlcGVuZHMgb24g
T0YgJiYgRFJNICYmIChBUkNIX1MzQzY0WFggfHwgQVJDSF9TNVBWMjEwIHx8IEFSQ0hfRVhZTk9T
IHx8IEFSQ0hfTVVMVElQTEFURk9STSB8fCBDT01QSUxFX1RFU1QpCisJZGVwZW5kcyBvbiBNTVUK
IAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKIAlzZWxlY3QgVklERU9NT0RFX0hFTFBFUlMKIAlzZWxl
Y3QgU05EX1NPQ19IRE1JX0NPREVDIGlmIFNORF9TT0MKLS0gCjIuMjAuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
