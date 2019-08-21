Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF1098242
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 20:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223BE6E34D;
	Wed, 21 Aug 2019 18:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33176E34D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 18:04:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0E3542001E;
 Wed, 21 Aug 2019 20:04:13 +0200 (CEST)
Date: Wed, 21 Aug 2019 20:04:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v5 00/25] drm: Kirin driver cleanups to prep for Kirin960
 support
Message-ID: <20190821180412.GA8385@ravnborg.org>
References: <20190820230626.23253-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820230626.23253-1-john.stultz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8
 a=ElhbO7FAOvbcUTcbKsIA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
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
Cc: David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obi4KCk9uIFR1ZSwgQXVnIDIwLCAyMDE5IGF0IDExOjA2OjAxUE0gKzAwMDAsIEpvaG4g
U3R1bHR6IHdyb3RlOgo+IFNlbmRpbmcgdGhpcyBvdXQgYWdhaW4gKGFwb2xvZ2llcyEpLCB0byBh
ZGRyZXNzIGEgZmV3IGlzc3VlcyBTYW0KPiBmb3VuZC4KPiAKPiBUaGlzIHBhdGNoc2V0IGNvbnRh
aW5zIG9uZSBmaXggKGluIHRoZSBmcm9udCwgc28gaXRzIGVhc2llciB0bwo+IGV2ZW50dWFsbHkg
YmFja3BvcnQpLCBhbmQgYSBzZXJpZXMgb2YgY2hhbmdlcyBmcm9tIFlpUGluZyB0bwo+IHJlZmFj
dG9yIHRoZSBraXJpbiBkcm0gZHJpdmVyIHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgb24gYm90aAo+
IGtpcmluNjIwIGJhc2VkIGRldmljZXMgKGxpa2UgdGhlIG9yaWdpbmFsIEhpS2V5IGJvYXJkKSBh
cyB3ZWxsCj4gYXMga2lyaW45NjAgYmFzZWQgZGV2aWNlcyAobGlrZSB0aGUgSGlLZXk5NjAgYm9h
cmQpLgo+IAo+IFRoZSBmdWxsIGtpcmluOTYwIGRybSBzdXBwb3J0IGlzIHN0aWxsIGJlaW5nIHJl
ZmFjdG9yZWQsIGJ1dCBhcwo+IHRoaXMgYmFzZSBraXJpbiByZXdvcmsgd2FzIGdldHRpbmcgdG8g
YmUgc3Vic3RhbnRpYWwsIEkgd2FudGVkCj4gdG8gc2VuZCBvdXQgdGhlIGZpcnN0IGNodW5rLCBz
byB0aGF0IHRoZSByZXZpZXcgYnVyZGVuIHdhc24ndAo+IG92ZXJ3aGVsbWluZy4KPiAKPiBUaGUg
ZnVsbCBIaUtleTk2MCBwYXRjaCBzdGFjayBjYW4gYmUgZm91bmQgaGVyZToKPiAgIGh0dHBzOi8v
Z2l0LmxpbmFyby5vcmcvcGVvcGxlL2pvaG4uc3R1bHR6L2FuZHJvaWQtZGV2LmdpdC9sb2cvP2g9
ZGV2L2hpa2V5OTYwLW1haW5saW5lLVdJUAoKQXBwbGllZCBmcm9tIHRoZSBtYWlscyAtIGFzIHRo
aXMgaXMgd2hhdCBteSB0b29saW5nIGV4cGVjdC4KUHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgoJ
U2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
