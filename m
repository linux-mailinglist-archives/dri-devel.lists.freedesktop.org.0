Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4EA3481D6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 20:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37126EA6F;
	Wed, 24 Mar 2021 19:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0201.hostedemail.com
 [216.40.44.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61876EA6F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 19:24:15 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id BB3571801AC84;
 Wed, 24 Mar 2021 19:24:14 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:152:355:379:421:599:800:960:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1605:1711:1730:1747:1777:1792:1801:2198:2199:2393:2553:2559:2562:2689:2731:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:4605:5007:6119:6120:6691:6742:7652:7903:10004:10400:10848:11026:11232:11233:11473:11657:11658:11783:11914:12043:12048:12296:12297:12438:12740:12895:13894:14181:14659:14721:21080:21433:21451:21627:21740:21990:30012:30054:30060:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: fish34_600c2bf2777d
X-Filterd-Recvd-Size: 4692
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Wed, 24 Mar 2021 19:24:11 +0000 (UTC)
Message-ID: <d184069de43135a9c9e5f031447faf98ab3f437d.camel@perches.com>
Subject: Re: [RFC patch] vsprintf: Allow %pe to print non PTR_ERR %pe uses
 as decimal
From: Joe Perches <joe@perches.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Arnd Bergmann
 <arnd@kernel.org>,  Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 24 Mar 2021 12:24:10 -0700
In-Reply-To: <9feab1e8-4dee-6b79-03f7-7b9f0cb24f6e@rasmusvillemoes.dk>
References: <20210324121832.3714570-1-arnd@kernel.org>
 <e1310273dcc577f3a772380ada7b6cc1906d680b.camel@perches.com>
 <CAK8P3a0JyoAtTYTi+M_mJ3_KtUJ6NeJB=FNWhzezqcXMac++mQ@mail.gmail.com>
 <810d36184b9fa2880d3ba7738a8f182e27f5107b.camel@perches.com>
 <3252fd83141aa9e0e6001acee1dd98e87c676b9a.camel@perches.com>
 <9feab1e8-4dee-6b79-03f7-7b9f0cb24f6e@rasmusvillemoes.dk>
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

T24gV2VkLCAyMDIxLTAzLTI0IGF0IDE4OjMzICswMTAwLCBSYXNtdXMgVmlsbGVtb2VzIHdyb3Rl
Ogo+IE9uIDI0LzAzLzIwMjEgMTguMjAsIEpvZSBQZXJjaGVzIHdyb3RlOgo+ID4gT24gV2VkLCAy
MDIxLTAzLTI0IGF0IDA5OjUyIC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiA+ID4gT24gV2Vk
LCAyMDIxLTAzLTI0IGF0IDE3OjQyICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gPiA+
IE9uIFdlZCwgTWFyIDI0LCAyMDIxIGF0IDM6MjAgUE0gSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVz
LmNvbT4gd3JvdGU6Cj4gPiA+IFtdCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaW14L2lteC1sZGIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jCj4gPiA+
ID4gPiBbXQo+ID4gPiA+ID4gPiBAQCAtMTk3LDYgKzE5NywxMiBAQCBzdGF0aWMgdm9pZCBpbXhf
bGRiX2VuY29kZXJfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiA+ID4gPiA+
ID4gwqDCoMKgwqDCoMKgaW50IGR1YWwgPSBsZGItPmxkYl9jdHJsICYgTERCX1NQTElUX01PREVf
RU47Cj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoGludCBtdXggPSBkcm1fb2ZfZW5jb2Rlcl9hY3Rp
dmVfcG9ydF9pZChpbXhfbGRiX2NoLT5jaGlsZCwgZW5jb2Rlcik7Cj4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiArICAgICBpZiAobXV4IDwgMCB8fCBtdXggPj0gQVJSQVlfU0laRShsZGItPmNsa19z
ZWwpKSB7Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgZGV2X3dhcm4obGRiLT5kZXYsICIlczog
aW52YWxpZCBtdXggJWRcbiIsCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgX19m
dW5jX18sIEVSUl9QVFIobXV4KSk7Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoaXMgZG9lcyBub3Qg
Y29tcGlsZSB3aXRob3V0IHdhcm5pbmdzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBkcml2ZXJzL2dw
dS9kcm0vaW14L2lteC1sZGIuYzogSW4gZnVuY3Rpb24g4oCYaW14X2xkYl9lbmNvZGVyX2VuYWJs
ZeKAmToKPiA+ID4gPiA+IGRyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jOjIwMToyMjogd2Fy
bmluZzogZm9ybWF0IOKAmCVk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhpbnTigJks
IGJ1dCBhcmd1bWVudCA0IGhhcyB0eXBlIOKAmHZvaWQgKuKAmSBbLVdmb3JtYXQ9XQo+ID4gPiA+
ID4gwqDCoDIwMSB8ICAgZGV2X3dhcm4obGRiLT5kZXYsICIlczogaW52YWxpZCBtdXggJWRcbiIs
Cj4gPiA+ID4gPiDCoMKgwqDCoMKgwqB8ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSWYgeW91IHdhbnQgdG8gdXNlIEVSUl9Q
VFIsIHRoZSAlZCBzaG91bGQgYmUgJXBlIGFzIEVSUl9QVFIKPiA+ID4gPiA+IGlzIGNvbnZlcnRp
bmcgYW4gaW50IGEgdm9pZCAqIHRvIGRlY29kZSB0aGUgZXJyb3IgdHlwZSBhbmQKPiA+ID4gPiA+
IGVtaXQgaXQgYXMgYSBzdHJpbmcuCj4gPiA+ID4gCj4gPiA+ID4gU29ycnkgYWJvdXQgdGhhdC4K
PiA+ID4gPiAKPiA+ID4gPiBJIGRlY2lkZWQgYWdhaW5zdCB1c2luZyBFUlJfUFRSKCkgaW4gb3Jk
ZXIgdG8gYWxzbyBjaGVjayBmb3IKPiA+ID4gPiBwb3NpdGl2ZSBhcnJheSBvdmVyZmxvdywgYnV0
IHRoZSB2ZXJzaW9uIEkgdGVzdGVkIHdhcyBkaWZmZXJlbnQgZnJvbQo+ID4gPiA+IHRoZSB2ZXJz
aW9uIEkgc2VudC4KPiA+ID4gPiAKPiA+ID4gPiB2MyBjb21pbmcuCj4gPiA+IAo+ID4gPiBUaGFu
a3MuICBObyB3b3JyaWVzLgo+ID4gPiAKPiA+ID4gVXAgdG8geW91LCB2c3ByaW50ZiB3b3VsZCBl
bWl0IHRoZSBwb3NpdGl2ZSBtdXggYXMgYSBmdW5reSBoYXNoZWQKPiA+ID4gaGV4IHZhbHVlIGJ5
IGRlZmF1bHQgaWYgeW91IHVzZSBFUlJfUFRSIHdpdGggbXV4ID4gQVJSQVlfU0laRSBzbwo+ID4g
PiBwZXJoYXBzICVkIHdpdGhvdXQgdGhlIEVSUl9QVFIgdXNlIG1ha2VzIHRoZSBtb3N0IHNlbnNl
Lgo+ID4gPiAKPiAKPiA+IAo+ID4gTWF5YmUgaXQncyBiZXR0ZXIgdG8gb3V0cHV0IG5vbiBQVFJf
RVJSICVwZSB1c2VzIGFzIGRlY2ltYWwgc28gdGhpcwo+ID4gc29ydCBvZiBjb2RlIHdvdWxkIHdv
cmsuCj4gCj4gTm8sIGJlY2F1c2UgdGhhdCB3b3VsZCBsZWFrIHRoZSBwb2ludGVyIHZhbHVlIHdo
ZW4gc29tZWJvZHkgaGFzCj4gYWNjaWRlbnRhbGx5IHBhc3NlZCBhIHJlYWwga2VybmVsIHBvaW50
ZXIgdG8gJXBlLgoKSSB0aGluayBpdCdzIG5vdCByZWFsbHkgYW4gaXNzdWUuCgpfQWxsXyBjb2Rl
IHRoYXQgdXNlcyAlcDxmb28+IGV4dGVuc2lvbnMgbmVlZCBpbnNwZWN0aW9uIGFueXdheS4KCkl0
J3MgYWxyZWFkeSBwb3NzaWJsZSB0byBpbnRlbnRpb25hbGx5ICdsZWFrJyB0aGUgcHRyIHZhbHVl
CmJ5IHVzaW5nICVwZSwgLXB0ciBzbyBJIHRoaW5rIHRoYXQncyBub3QgcmVhbGx5IGFuIGlzc3Vl
LgoKPiAKPiBJZiB0aGUgY29kZSB3YW50cyBhIGN1dGUgLUVGT08gc3RyaW5nIGV4cGxhaW5pbmcg
d2hhdCdzIHdyb25nLCB3aGF0Cj4gYWJvdXQgIiVwZSIsIEVSUl9QVFIobXV4IDwgMCA6IG11eCA6
IC1FUkFOR0UpPyBPciB0d28gc2VwYXJhdGUgZXJyb3IKPiBtZXNzYWdlcwo+IAo+IGlmIChtdXgg
PCAwKQo+IMKgwqAuLi4KPiBlbHNlIGlmIChtdXggPj0gQVJSQVlfU0laRSgpKQo+IMKgwqAuLi4K
Ck11bHRpcGxlIHRlc3RzLCBtb3JlIHVubmVjZXNzYXJ5IGNvZGUsIG11bHRpcGxlIGZvcm1hdCBz
dHJpbmdzLCBldGMuLi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
