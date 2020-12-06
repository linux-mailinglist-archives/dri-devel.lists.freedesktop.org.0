Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1F82D0778
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 22:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E8289CA8;
	Sun,  6 Dec 2020 21:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7837589CA8
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 21:49:41 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 643A4804EF;
 Sun,  6 Dec 2020 22:49:39 +0100 (CET)
Date: Sun, 6 Dec 2020 22:49:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 05/13] sh: Fix set but not used warnings with
 !CONFIG_MMU
Message-ID: <20201206214938.GA1935298@ravnborg.org>
References: <20201206190247.1861316-6-sam@ravnborg.org>
 <202012070518.yJA9Vbbo-lkp@intel.com>
 <20201206214814.GA1884161@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201206214814.GA1884161@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8 a=oPZtxxbveF9zbOjJoJsA:9
 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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

SGkgImtlcm5lbCB0ZXN0IHJvYm90IgpPbiBTdW4sIERlYyAwNiwgMjAyMCBhdCAxMDo0ODoxNFBN
ICswMTAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gY29tbWl0IGFhMWY0MzQ1YjU0ODA1MDJhNGU2
MWFkZGY1YzU5ZDYwNmZkYmNlOGYKPiBBdXRob3I6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KPiBEYXRlOiAgIE1vbiBOb3YgMzAgMjI6MDk6MjkgMjAyMCArMDEwMAo+IAo+ICAgICBz
aDogRml4IHNldCBidXQgbm90IHVzZWQgd2FybmluZ3Mgd2l0aCAhQ09ORklHX01NVQo+ICAgICAK
PiAgICAgQnVpbGRpbmcgZmJkZXYgZHJpdmVycyBmb3Igc2ggd2l0aCBXPTEgcHJvZHVjZXMgdGhl
IGZvbGxvd2luZyB3YXJuaW5nOgo+ICAgICAKPiAgICAgICAgIHRtaW9mYi5jOiBJbiBmdW5jdGlv
biDigJh0bWlvZmJfcmVtb3Zl4oCZOgo+ICAgICAgICAgdG1pb2ZiLmM6ODA1OjIxOiB3YXJuaW5n
OiB2YXJpYWJsZSDigJhwYXLigJkgc2V0IGJ1dCBub3QgdXNlZAo+ICAgICAKPiAgICAgVGhpcyBp
cyB3aXRoIGFsbG1vZGNvbmZpZyBhbmQgQVJDSD1zaAo+ICAgICAKPiAgICAgVGhpcyBib2lsZWQg
ZG93biB0byBpb3VubWFwKCkgZGVmaW5lZCBhcyBlbXB0eSBmb3IgIUNPTkZJR19NTVUuCj4gICAg
IEZpeCB0aGlzIGJ5IGJ5IGFkZGluZyAiKHZvaWQpYWRkcjsiIHRvIHRlbGwgdGhlIGNvbXBpbGVy
IHRoZQo+ICAgICBhcmd1bWVudCB0byBpb3VubWFwKCkgc2hvdWxkIGJlIGNvbnNpZGVyZWQgdXNl
ZC4KPiAgICAgCj4gICAgIHY0Ogo+ICAgICAgIC0gRml4IGJ1aWxkIGVycm9yIG9mIGV0aGVybmV0
IGRyaXZlciAoa2VybmVsIHRlc3Qgcm9ib3QpCj4gICAgICAgICBBZGRlZCBtaXNzaW5nICgpIGFy
b3VuZCBtYWNybyBwYXJhbWV0ZXIKClRoYW5rcyBmb3IgdGhlZSBxdWljayByZXBvcnQgLSBpdCB3
YXMgZWFzeSB0byByZXByb2R1Y2UuCkkgaG9wZSB0aGlzIGlzIGVub3VnaCBmb3IgdGhlIHJvYm90
IHRvIHBpY2sgdXAgdGhlIHVwZGF0ZWQgcGF0Y2guCgoJU2FtCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
