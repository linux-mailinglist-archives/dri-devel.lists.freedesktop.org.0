Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF88069B
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 16:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439D76E4D0;
	Sat,  3 Aug 2019 14:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BE76E4D0
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 14:17:47 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 56B8820024;
 Sat,  3 Aug 2019 16:17:43 +0200 (CEST)
Date: Sat, 3 Aug 2019 16:17:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: John Stultz <john.stultz@linaro.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>
Subject: Re: [PATCH v3 00/26] drm: Kirin driver cleanups to prep for Kirin960
 support
Message-ID: <20190803141742.GA21935@ravnborg.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8 a=7gkXJVJtAAAA:8 a=BTeA3XvPAAAA:8
 a=mm5y-ppz5zUS1jQs-MMA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=tafbbOV3vt1XuEhzTjGK:22
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
Cc: Rongrong Zou <zourongrong@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obi4KCk9uIFRodSwgQXVnIDAxLCAyMDE5IGF0IDAzOjQ0OjEzQU0gKzAwMDAsIEpvaG4g
U3R1bHR6IHdyb3RlOgo+IEkgd2FzIHJlbWluZGVkIEkgaGFkIHNlbnQgdGhpcyBvdXQgYSBmZXcg
bW9udGhzIGFnbywgYnV0IGZvcmdvdAo+IGFsbCBhYm91dCBpdCEgQXBvbG9naWVzISBBbnl3YXks
IEkgd2FudGVkIHRvIHJlc3VibWl0IHRoaXMgcGF0Y2gKPiBzZXQgc28gSSBkaWRuJ3QgaGF2ZSB0
byBjb250aW51ZSBjYXJyeWluZyBpdCBmb3JldmVyIHRvIGtlZXAgdGhlCj4gSGlLZXk5NjAgYm9h
cmQgcnVubmluZy4KPiAKPiBUaGlzIHBhdGNoc2V0IGNvbnRhaW5zIG9uZSBmaXggKGluIHRoZSBm
cm9udCwgc28gaXRzIGVhc2llciB0bwo+IGV2ZW50dWFsbHkgYmFja3BvcnQpLCBhbmQgYSBzZXJp
ZXMgb2YgY2hhbmdlcyBmcm9tIFlpUGluZyB0bwo+IHJlZmFjdG9yIHRoZSBraXJpbiBkcm0gZHJp
dmVyIHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgb24gYm90aAo+IGtpcmluNjIwIGJhc2VkIGRldmlj
ZXMgKGxpa2UgdGhlIG9yaWdpbmFsIEhpS2V5IGJvYXJkKSBhcyB3ZWxsCj4gYXMga2lyaW45NjAg
YmFzZWQgZGV2aWNlcyAobGlrZSB0aGUgSGlLZXk5NjAgYm9hcmQpLgo+IAo+IFRoZSBmdWxsIGtp
cmluOTYwIGRybSBzdXBwb3J0IGlzIHN0aWxsIGJlaW5nIHJlZmFjdG9yZWQsIGJ1dCBhcwo+IHRo
aXMgYmFzZSBraXJpbiByZXdvcmsgd2FzIGdldHRpbmcgdG8gYmUgc3Vic3RhbnRpYWwsIEkgd2Fu
dGVkCj4gdG8gc2VuZCBvdXQgdGhlIGZpcnN0IGNodW5rIGZvciBzb21lIGluaXRpYWwgcmV2aWV3
LCBzbyB0aGF0IHRoZQo+IHJldmlldyBidXJkZW4gd2Fzbid0IG92ZXJ3aGVsbWluZy4KPiAKPiBU
aGUgZnVsbCBIaUtleTk2MCBwYXRjaCBzdGFjayBjYW4gYmUgZm91bmQgaGVyZToKPiAgIGh0dHBz
Oi8vZ2l0LmxpbmFyby5vcmcvcGVvcGxlL2pvaG4uc3R1bHR6L2FuZHJvaWQtZGV2LmdpdC9sb2cv
P2g9ZGV2L2hpa2V5OTYwLW1haW5saW5lLVdJUAo+IAo+IAo+IEZlZWRiYWNrIHdvdWxkIGJlIGdy
ZWF0bHkgYXBwcmVjaWF0ZWQhCj4gCj4gdGhhbmtzCj4gLWpvaG4KPiAKPiBDYzogUm9uZ3Jvbmcg
Wm91IDx6b3Vyb25ncm9uZ0BnbWFpbC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBkcmkt
ZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+Cj4gQ2M6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KCkkgYW0gbWlzc2luZzogWGlubGlhbmcgTGl1IDx6LmxpdXhp
bmxpYW5nQGhpc2lsaWNvbi5jb20+CmluIHlvdXIgbGlzdCBvZiByZWNpcGllbnRzLgoKWGlubGlh
bmcgaXMgbGlzdGVkIGF0IG9uZSBvZiB0aGUgbWFpbnRhaW5lcnMgb2YKaGlzaWxpY29uLwoKCVNh
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
