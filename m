Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B9EA2870
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 22:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DB06E1AA;
	Thu, 29 Aug 2019 20:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A106E1AA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 20:52:11 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD3A423403;
 Thu, 29 Aug 2019 20:52:10 +0000 (UTC)
Date: Thu, 29 Aug 2019 16:52:09 -0400
From: Sasha Levin <sashal@kernel.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm: mst: Fix query_payload ack reply struct
Message-ID: <20190829205209.GL5281@sasha-vm>
References: <20190829165223.129662-1-sean@poorly.run>
 <9927a099fc5f0140ea92e34f017186d9ffe0bb13.camel@redhat.com>
 <20190829184415.GI218215@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829184415.GI218215@art_vandelay>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567111931;
 bh=sjMx+nTBCxsyH5xXtuyd5h39rKjstIxPvOykcRzy4Ts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=omttYrtPCJZQBmsJMn9t27qVGaX5LtDYdvJY1QqQ5A5LMlWlSZeeo9pzNB+Gct86w
 g56vkjHMqhFK5AX3OB+2XLU8PTNFeNnohM6nBXa2Gof4enoa9Q6fF23YGpMk6GQKr9
 i3tDkmS8p3IU4wxDTErMkxIeXJUvP/twVuWqIx6k=
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
Cc: Todd Previte <tprevite@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 stable@vger.kernel.org, Dave Airlie <airlied@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDI6NDQ6MTVQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDE6MDY6NThQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3
cm90ZToKPj4gSXMgaXQgd29ydGggYWN0dWFsbHkgQ0Npbmcgc3RhYmxlIG9uIHRoaXM/IFRoaXMg
cGF0Y2ggaXMgY2VydGFpbmx5IGNvcnJlY3QgYnV0Cj4+IEkgZG9uJ3QgdGhpbmsgd2UgdXNlIHRo
aXMgc3RydWN0IGZvciBhbnl0aGluZyBxdWl0ZSB5ZXQuCj4+Cj4+IE90aGVyd2lzZTogUmV2aWV3
ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4KPlRoYW5rcyBmb3IgdGhlIHJl
dmlldyEgSSd2ZSBzdHJpcHBlZCB0aGUgY2Mgc3RhYmxlIHRhZyBhbmQgcHVzaGVkIHRvCj5kcm0t
bWlzYy1uZXh0LiBXZSdsbCBoYXZlIHRvIGtlZXAgYW4gZXllIG91dCBmb3IgU2FzaGEncyBzdGFi
bGUgQUkgYm90LCBJJ20KPmd1ZXNzaW5nIGl0J2xsIHRyeSB0byBiYWNrcG9ydCB0aGlzIHRvIHN0
YWJsZSByZWdhcmRsZXNzLgoKS25vd2luZyB0aGUgYm90LCBpdCBwcm9iYWJseSB3aWxsIDopCgpJ
J2xsIGFkZCBhIG5vdGUgZm9yIG15c2VsZi4uLgoKLS0KVGhhbmtzLApTYXNoYQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
