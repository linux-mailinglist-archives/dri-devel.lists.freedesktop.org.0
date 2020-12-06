Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBB42D0776
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 22:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB1D89D6C;
	Sun,  6 Dec 2020 21:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A905F89D6C
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 21:48:19 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0BE65804EF;
 Sun,  6 Dec 2020 22:48:15 +0100 (CET)
Date: Sun, 6 Dec 2020 22:48:14 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 05/13] sh: Fix set but not used warnings with
 !CONFIG_MMU
Message-ID: <20201206214814.GA1884161@ravnborg.org>
References: <20201206190247.1861316-6-sam@ravnborg.org>
 <202012070518.yJA9Vbbo-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202012070518.yJA9Vbbo-lkp@intel.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8
 a=hAG5_4vcAAAA:8 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=JfrnYn6hAAAA:8
 a=Z4Rwk6OoAAAA:8 a=kDhuXSaoqpb3RoiJoOIA:9 a=QEXdDO2ut3YA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=cvBusfyB2V15izCimMoJ:22
 a=8Bh8Pg2EFav9IBZ9i9Tn:22 a=AjGcO6oz07-iQ99wixmX:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=HkZW87K1Qel5hWWM3VKY:22
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 kbuild-all@lists.01.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Peter Jones <pjones@redhat.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y29tbWl0IGFhMWY0MzQ1YjU0ODA1MDJhNGU2MWFkZGY1YzU5ZDYwNmZkYmNlOGYKQXV0aG9yOiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkRhdGU6ICAgTW9uIE5vdiAzMCAyMjowOToy
OSAyMDIwICswMTAwCgogICAgc2g6IEZpeCBzZXQgYnV0IG5vdCB1c2VkIHdhcm5pbmdzIHdpdGgg
IUNPTkZJR19NTVUKICAgIAogICAgQnVpbGRpbmcgZmJkZXYgZHJpdmVycyBmb3Igc2ggd2l0aCBX
PTEgcHJvZHVjZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgogICAgCiAgICAgICAgdG1pb2ZiLmM6
IEluIGZ1bmN0aW9uIOKAmHRtaW9mYl9yZW1vdmXigJk6CiAgICAgICAgdG1pb2ZiLmM6ODA1OjIx
OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhwYXLigJkgc2V0IGJ1dCBub3QgdXNlZAogICAgCiAgICBU
aGlzIGlzIHdpdGggYWxsbW9kY29uZmlnIGFuZCBBUkNIPXNoCiAgICAKICAgIFRoaXMgYm9pbGVk
IGRvd24gdG8gaW91bm1hcCgpIGRlZmluZWQgYXMgZW1wdHkgZm9yICFDT05GSUdfTU1VLgogICAg
Rml4IHRoaXMgYnkgYnkgYWRkaW5nICIodm9pZClhZGRyOyIgdG8gdGVsbCB0aGUgY29tcGlsZXIg
dGhlCiAgICBhcmd1bWVudCB0byBpb3VubWFwKCkgc2hvdWxkIGJlIGNvbnNpZGVyZWQgdXNlZC4K
ICAgIAogICAgdjQ6CiAgICAgIC0gRml4IGJ1aWxkIGVycm9yIG9mIGV0aGVybmV0IGRyaXZlciAo
a2VybmVsIHRlc3Qgcm9ib3QpCiAgICAgICAgQWRkZWQgbWlzc2luZyAoKSBhcm91bmQgbWFjcm8g
cGFyYW1ldGVyCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KICAgIENjOiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KICAgIENj
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KICAgIENjOiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgogICAgQ2M6IFJpY2ggRmVsa2VyIDxkYWxpYXNAbGli
Yy5vcmc+CiAgICBDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KICAgIENjOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgogICAgQ2M6IE1pa2UgUmFw
b3BvcnQgPHJwcHRAa2VybmVsLm9yZz4KICAgIENjOiBLdW5pbm9yaSBNb3JpbW90byA8a3VuaW5v
cmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+CiAgICBDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVy
ekBpbmZyYWRlYWQub3JnPgogICAgQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
ICAgIENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgoKZGlmZiAt
LWdpdCBhL2FyY2gvc2gvaW5jbHVkZS9hc20vaW8uaCBiL2FyY2gvc2gvaW5jbHVkZS9hc20vaW8u
aAppbmRleCA2ZDVjNjQ2M2JjMDcuLjQ1MDgyYmNiZDlhYSAxMDA2NDQKLS0tIGEvYXJjaC9zaC9p
bmNsdWRlL2FzbS9pby5oCisrKyBiL2FyY2gvc2gvaW5jbHVkZS9hc20vaW8uaApAQCAtMjcxLDcg
KzI3MSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2lvbWVtICppb3JlbWFwX3Byb3QocGh5c19h
ZGRyX3Qgb2Zmc2V0LCB1bnNpZ25lZCBsb25nIHNpemUsCiAjZW5kaWYgLyogQ09ORklHX0hBVkVf
SU9SRU1BUF9QUk9UICovCiAKICNlbHNlIC8qIENPTkZJR19NTVUgKi8KLSNkZWZpbmUgaW91bm1h
cChhZGRyKQkJZG8geyB9IHdoaWxlICgwKQorI2RlZmluZSBpb3VubWFwKGFkZHIpCQlkbyB7ICh2
b2lkKShhZGRyKTsgfSB3aGlsZSAoMCkKICNkZWZpbmUgaW9yZW1hcChvZmZzZXQsIHNpemUpCSgo
dm9pZCBfX2lvbWVtICopKHVuc2lnbmVkIGxvbmcpKG9mZnNldCkpCiAjZW5kaWYgLyogQ09ORklH
X01NVSAqLwogCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
