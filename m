Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D636AD6ACE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 22:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEA589312;
	Mon, 14 Oct 2019 20:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3316E59D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 20:30:14 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E064080575;
 Mon, 14 Oct 2019 22:30:08 +0200 (CEST)
Date: Mon, 14 Oct 2019 22:30:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 05/15] drm/fbconv: Add DRM <-> fbdev pixel-format
 conversion
Message-ID: <20191014203007.GA4373@ravnborg.org>
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014140416.28517-6-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=GqVph10vmseYxzeGbd0A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, airlied@linux.ie,
 gregkh@linuxfoundation.org, michel@daenzer.net, corbet@lwn.net,
 malat@debian.org, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKT24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDQ6MDQ6MDZQTSArMDIwMCwgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gRFJNIHVzZXMgRk9VUkNDIGNvbnN0YW50cyB0byBkZXNj
cmliZSBwaXhlbCBmb3JtYXRzLCBmYmRldiB1c2VzIGEKPiBwZXItY29tcG9uZW50IGJpdGZpZWxk
IHN0cnVjdHVyZS4gVGhlIGZ1bmN0aW9ucyBpbiB0aGlzIHBhdGNoIGNvbnZlcnQKPiBiZXR3ZWVu
IHRoZSB0d28uCj4gCgpBIGZldyBuaXRzIGJlbG93LgoKCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmJjb252X2hlbHBlci5jIHwgNDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgaW5jbHVkZS9kcm0vZHJtX2ZiY29udl9oZWxwZXIuaCAgICAgfCAgMjMgKysKPiAgMiBmaWxl
cyBjaGFuZ2VkLCA0NTggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVk
ZS9kcm0vZHJtX2ZiY29udl9oZWxwZXIuaAo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiY29udl9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJjb252X2hlbHBl
ci5jCj4gaW5kZXggMGNiNDZkMmM5OGMzLi5hZjQ1MzU4YTE1NmEgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9mYmNvbnZfaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiY29udl9oZWxwZXIuYwo+IEBAIC0xICsxLDQzNiBAQAo+ICAvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+ICsKPiArI2luY2x1ZGUgPGFzbS9ieXRlb3Jk
ZXIuaD4KPiArCj4gKyNpbmNsdWRlIDxsaW51eC9mYi5oPgoKPGFzbS8qPiBhZnRlciA8bGludXgv
Kj4KU28gd2UgaW4gdGhpcyB3YXkgcGljayB0aGUgbW9yZSBnZW5lcmFsIGluY2x1ZGUgZmlsZSBm
aXJzdC4KCj4gKwo+ICtzdHJ1Y3QgZm9ybWF0X21hcCB7Cj4gKwlib29sICgqaXNfZm9ybWF0KShj
b25zdCBzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8gKmZiX3Zhcik7Cj4gKwl1aW50MzJfdCBmb3Jt
YXQ7Cj4gK307CldlIGFyZSBpbiB0aGUga2VybmVsIC0gd2hlcmUgSSB0aGluayB1MzIgaXMgcHJl
ZmVycmVkIG92ZXIgdGhlIGxvbmdlcgp1aW50MzJfdC4KSWYgSSBncmVwIGluIGRybS8qIHRoZW4g
dGhleSBzZWVtcyBiZSBiZSBlcXVhbGx5IHBvcHVsYXIsIHNvIGZlZWwgZnJlZQp0byBpZ25vcmUg
dGhpcyBjb21tZW50LgoKCj4gK3N0YXRpYyB2b2lkIHNldF9mYl9iaXRmaWVsZChzdHJ1Y3QgZmJf
Yml0ZmllbGQgKmJpdHMsIF9fdTMyIG9mZnNldCwKPiArCQkJICAgIF9fdTMyIGxlbmd0aCkKClRo
aXMgaXMgbm90IHVhcGkgLSBzbyB1MzIgaXMgcHJlZmVycmVkLgoKQm90aCBjb21tZW50cyBhcHBs
eSB0byB0aGUgd2hvbGUgZmlsZS4KCkkgZGlkIG5vdCBzZWUgdGhhdCB0aGlzIHdhcyB3aXJlZCBp
bnRvIHRoZSBrZXJuZWwtZG9jIGluIERvY3VtZW50YXRpb24vCmJ1dCBtYXliZSBJIGp1c3QgbWlz
c2VkIGl0LgoKV2l0aCBteSBjb21tZW50cyBjb25zaWRlcmVkIHlvdSBjYW4gYWRkOgpBY2tlZC1i
eTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKQWxsIGNvZGUgbG9va3Mgc2FuZSwg
YnV0IGFzIEkgaGF2ZSBub3QgZ3Jhc3BlZCB0aGUgYmlnZ2VyIHBpY3R1cmUKdGhpcyBjYW4gaGFy
ZGx5IGJlIGEgcmV2aWV3LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
