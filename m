Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D87C8DE02
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 21:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772B26E81F;
	Wed, 14 Aug 2019 19:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B985E6E81F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 19:45:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id F3C8C20024;
 Wed, 14 Aug 2019 21:45:09 +0200 (CEST)
Date: Wed, 14 Aug 2019 21:45:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: John Stultz <john.stultz@linaro.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>
Subject: Re: [RESEND][PATCH v3 00/26] drm: Kirin driver cleanups to prep for
 Kirin960 support
Message-ID: <20190814194508.GA26866@ravnborg.org>
References: <20190814184702.54275-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814184702.54275-1-john.stultz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=pfM-4riQqBG9FQvt634A:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, Xinliang Liu <z.liuxinliang@hisilicon.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWGlubGlhbmcsIFJvbmdyb25nLCBYaW53ZWksIENoZW4KCk9uIFdlZCwgQXVnIDE0LCAyMDE5
IGF0IDA2OjQ2OjM2UE0gKzAwMDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+IEp1c3Qgd2FudGVkIHRv
IHJlc2VuZCB0aGlzIHBhdGNoIHNldCBzbyBJIGRpZG4ndCBoYXZlIHRvCj4gY29udGludWUgY2Fy
cnlpbmcgaXQgZm9yZXZlciB0byBrZWVwIHRoZSBIaUtleTk2MCBib2FyZCBydW5uaW5nLgo+IAo+
IFRoaXMgcGF0Y2hzZXQgY29udGFpbnMgb25lIGZpeCAoaW4gdGhlIGZyb250LCBzbyBpdHMgZWFz
aWVyIHRvCj4gZXZlbnR1YWxseSBiYWNrcG9ydCksIGFuZCBhIHNlcmllcyBvZiBjaGFuZ2VzIGZy
b20gWWlQaW5nIHRvCj4gcmVmYWN0b3IgdGhlIGtpcmluIGRybSBkcml2ZXIgc28gdGhhdCBpdCBj
YW4gYmUgdXNlZCBvbiBib3RoCj4ga2lyaW42MjAgYmFzZWQgZGV2aWNlcyAobGlrZSB0aGUgb3Jp
Z2luYWwgSGlLZXkgYm9hcmQpIGFzIHdlbGwKPiBhcyBraXJpbjk2MCBiYXNlZCBkZXZpY2VzIChs
aWtlIHRoZSBIaUtleTk2MCBib2FyZCkuCj4gCj4gVGhlIGZ1bGwga2lyaW45NjAgZHJtIHN1cHBv
cnQgaXMgc3RpbGwgYmVpbmcgcmVmYWN0b3JlZCwgYnV0IGFzCj4gdGhpcyBiYXNlIGtpcmluIHJl
d29yayB3YXMgZ2V0dGluZyB0byBiZSBzdWJzdGFudGlhbCwgSSB3YW50ZWQKPiB0byBzZW5kIG91
dCB0aGUgZmlyc3QgY2h1bmssIHNvIHRoYXQgdGhlIHJldmlldyBidXJkZW4gd2Fzbid0Cj4gb3Zl
cndoZWxtaW5nLgoKQXMgTWFpbnRhaW5lcnMgY2FuIHdlIHBsZWFzZSBnZXQgc29tZSBmZWVkYmFj
ayBmcm9tIG9uZSBvZiB5b3UuCkp1c3QgYW4gIk9LIHRvIGNvbW1pdCIgd291bGQgZG8gaXQuCkJ1
dCBwcmVmZXJhYmx5IGFuIGFjayBvciBhIHJldmlldyBvbiB0aGUgaW5kaXZpZHVhbCBwYXRjaGVz
LgoKSWYgdGhlIHJlYWxpdHkgaXMgdGhhdCBKb2huIGlzIHRoZSBNYWludGFpbmVyIHRvZGF5LAp0
aGVuIHdlIHNob3VsZCB1cGRhdGUgTUFJTlRBSU5FUlMgdG8gcmVmbGVjdCB0aGlzLgoKVGhhbmtz
IQoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
