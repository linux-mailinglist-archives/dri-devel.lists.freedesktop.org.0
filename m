Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC21146E2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 19:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A356F8DE;
	Thu,  5 Dec 2019 18:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F60D6F8DE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 18:29:33 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8F92380697;
 Thu,  5 Dec 2019 19:29:29 +0100 (CET)
Date: Thu, 5 Dec 2019 19:29:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm: Rename drm_bridge->dev to drm
Message-ID: <20191205182927.GA27091@ravnborg.org>
References: <20191205163028.19941-1-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205163028.19941-1-mihail.atanassov@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=oBCgqzsU5Q40nlY60G0A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWloYWlsLgoKT24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMDQ6MzA6NDVQTSArMDAwMCwgTWlo
YWlsIEF0YW5hc3NvdiB3cm90ZToKPiBUaGUgJ2RldicgbmFtZSBjYXVzZXMgc29tZSBjb25mdXNp
b24gd2l0aCAnc3RydWN0IGRldmljZScgWzFdWzJdLCBzbyB1c2UKPiAnZHJtJyBpbnN0ZWFkIHNp
bmNlIHRoaXMgc2VlbXMgdG8gYmUgdGhlIHByZXZhbGVudCBuYW1lIGZvciAnc3RydWN0Cj4gZHJt
X2RldmljZScgbWVtYmVycy4KVGhhbmtzIGZvciBkb2luZyB0aGlzIC0gaXQgaGVscHMgcmVhZGFi
aWxpdHkuCgpjaGVja3BhdGNoIGNvbXBsYWluZWQ6CgotOjEwNzogQ0hFQ0s6UEFSRU5USEVTSVNf
QUxJR05NRU5UOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMKIzEwNzog
RklMRTogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ueHAtcHRuMzQ2MC5jOjI1MToKKwlyZXQgPSBk
cm1fY29ubmVjdG9yX2luaXQoYnJpZGdlLT5kcm0sICZwdG5fYnJpZGdlLT5jb25uZWN0b3IsCiAJ
CQkmcHRuMzQ2MF9jb25uZWN0b3JfZnVuY3MsIERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTKTsKCi06
MTMzOiBDSEVDSzpQQVJFTlRIRVNJU19BTElHTk1FTlQ6IEFsaWdubWVudCBzaG91bGQgbWF0Y2gg
b3BlbiBwYXJlbnRoZXNpcwojMTMzOiBGSUxFOiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhcmFk
ZS1wczg2MjIuYzo0OTE6CisJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGJyaWRnZS0+ZHJtLCAm
cHM4NjIyLT5jb25uZWN0b3IsCiAJCQkmcHM4NjIyX2Nvbm5lY3Rvcl9mdW5jcywgRFJNX01PREVf
Q09OTkVDVE9SX0xWRFMpOwoKQnV0IHRoaXMgc2VlbXMgdW5yZWxhdGVkIHRvIHlvdXIgY2hhbmdl
cyAtIHNvIHNob3VsZCBiZSBpZ25vcmVkLgoKCkJyb3dzZWQgdGhlIHBhdGNoIGFuZCB0aHJvdyBp
dCBhZnRlciBteSBidWlsZCBjaGVjayBzY3JpcHQuCkFsbCBsb29rZWQgZ29vZC4KCkFja2VkLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgoJU2FtCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
