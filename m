Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DC8347E39
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 17:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37156EC96;
	Wed, 24 Mar 2021 16:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0240.hostedemail.com
 [216.40.44.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3FB6EC96
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 16:52:15 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id D6710100E7B48;
 Wed, 24 Mar 2021 16:52:14 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:152:355:379:421:599:800:960:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1801:2198:2199:2393:2553:2559:2562:2689:2731:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:4362:4605:5007:6742:7652:7903:10004:10400:10848:11026:11232:11233:11473:11657:11658:11783:11914:12043:12296:12297:12438:12740:12895:13019:13069:13311:13357:13894:14181:14659:14721:21080:21433:21451:21627:21660:21990:30054:30060:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: mask89_440a42d2777c
X-Filterd-Recvd-Size: 3126
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Wed, 24 Mar 2021 16:52:12 +0000 (UTC)
Message-ID: <810d36184b9fa2880d3ba7738a8f182e27f5107b.camel@perches.com>
Subject: Re: [PATCH] [v2] drm/imx: imx-ldb: fix out of bounds array access
 warning
From: Joe Perches <joe@perches.com>
To: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 24 Mar 2021 09:52:11 -0700
In-Reply-To: <CAK8P3a0JyoAtTYTi+M_mJ3_KtUJ6NeJB=FNWhzezqcXMac++mQ@mail.gmail.com>
References: <20210324121832.3714570-1-arnd@kernel.org>
 <e1310273dcc577f3a772380ada7b6cc1906d680b.camel@perches.com>
 <CAK8P3a0JyoAtTYTi+M_mJ3_KtUJ6NeJB=FNWhzezqcXMac++mQ@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liu Ying <victor.liu@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTAzLTI0IGF0IDE3OjQyICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+
IE9uIFdlZCwgTWFyIDI0LCAyMDIxIGF0IDM6MjAgUE0gSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVz
LmNvbT4gd3JvdGU6CltdCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lt
eC1sZGIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jCj4gPiBbXQo+ID4gPiBAQCAt
MTk3LDYgKzE5NywxMiBAQCBzdGF0aWMgdm9pZCBpbXhfbGRiX2VuY29kZXJfZW5hYmxlKHN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiA+ID4gwqDCoMKgwqDCoMKgaW50IGR1YWwgPSBsZGIt
PmxkYl9jdHJsICYgTERCX1NQTElUX01PREVfRU47Cj4gPiA+IMKgwqDCoMKgwqDCoGludCBtdXgg
PSBkcm1fb2ZfZW5jb2Rlcl9hY3RpdmVfcG9ydF9pZChpbXhfbGRiX2NoLT5jaGlsZCwgZW5jb2Rl
cik7Cj4gPiA+IAo+ID4gPiArICAgICBpZiAobXV4IDwgMCB8fCBtdXggPj0gQVJSQVlfU0laRShs
ZGItPmNsa19zZWwpKSB7Cj4gPiA+ICsgICAgICAgICAgICAgZGV2X3dhcm4obGRiLT5kZXYsICIl
czogaW52YWxpZCBtdXggJWRcbiIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgX19mdW5j
X18sIEVSUl9QVFIobXV4KSk7Cj4gPiAKPiA+IFRoaXMgZG9lcyBub3QgY29tcGlsZSB3aXRob3V0
IHdhcm5pbmdzLgo+ID4gCj4gPiBkcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYzogSW4gZnVu
Y3Rpb24g4oCYaW14X2xkYl9lbmNvZGVyX2VuYWJsZeKAmToKPiA+IGRyaXZlcnMvZ3B1L2RybS9p
bXgvaW14LWxkYi5jOjIwMToyMjogd2FybmluZzogZm9ybWF0IOKAmCVk4oCZIGV4cGVjdHMgYXJn
dW1lbnQgb2YgdHlwZSDigJhpbnTigJksIGJ1dCBhcmd1bWVudCA0IGhhcyB0eXBlIOKAmHZvaWQg
KuKAmSBbLVdmb3JtYXQ9XQo+ID4gwqDCoDIwMSB8ICAgZGV2X3dhcm4obGRiLT5kZXYsICIlczog
aW52YWxpZCBtdXggJWRcbiIsCj4gPiDCoMKgwqDCoMKgwqB8ICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+IAo+ID4gSWYgeW91IHdhbnQgdG8gdXNlIEVSUl9Q
VFIsIHRoZSAlZCBzaG91bGQgYmUgJXBlIGFzIEVSUl9QVFIKPiA+IGlzIGNvbnZlcnRpbmcgYW4g
aW50IGEgdm9pZCAqIHRvIGRlY29kZSB0aGUgZXJyb3IgdHlwZSBhbmQKPiA+IGVtaXQgaXQgYXMg
YSBzdHJpbmcuCj4gCj4gU29ycnkgYWJvdXQgdGhhdC4KPiAKPiBJIGRlY2lkZWQgYWdhaW5zdCB1
c2luZyBFUlJfUFRSKCkgaW4gb3JkZXIgdG8gYWxzbyBjaGVjayBmb3IKPiBwb3NpdGl2ZSBhcnJh
eSBvdmVyZmxvdywgYnV0IHRoZSB2ZXJzaW9uIEkgdGVzdGVkIHdhcyBkaWZmZXJlbnQgZnJvbQo+
IHRoZSB2ZXJzaW9uIEkgc2VudC4KPiAKPiB2MyBjb21pbmcuCgpUaGFua3MuICBObyB3b3JyaWVz
LgoKVXAgdG8geW91LCB2c3ByaW50ZiB3b3VsZCBlbWl0IHRoZSBwb3NpdGl2ZSBtdXggYXMgYSBm
dW5reSBoYXNoZWQKaGV4IHZhbHVlIGJ5IGRlZmF1bHQgaWYgeW91IHVzZSBFUlJfUFRSIHdpdGgg
bXV4ID4gQVJSQVlfU0laRSBzbwpwZXJoYXBzICVkIHdpdGhvdXQgdGhlIEVSUl9QVFIgdXNlIG1h
a2VzIHRoZSBtb3N0IHNlbnNlLgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
