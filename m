Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D5128BC9
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 22:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99F96E071;
	Thu, 23 May 2019 20:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21686E069;
 Thu, 23 May 2019 20:47:18 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id C930B60DB6; Thu, 23 May 2019 20:47:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E712160C8B;
 Thu, 23 May 2019 20:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E712160C8B
Date: Thu, 23 May 2019 14:47:16 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 2/6] drm/msm/a6xx: Remove duplicate irq disable from
 remove
Message-ID: <20190523204715.GC18360@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org
References: <20190523171653.138678-1-sean@poorly.run>
 <20190523171653.138678-2-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523171653.138678-2-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558644438;
 bh=2EOjThIW8SBz24GgHp3wmH9WnNSCbrrRd8s2VkktnTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CZ3GnIH+YlW8LwT0Rn+pJPwxHMQOjhH235bEz1lWOowKFqTlEkInY01cCaiNhZiPA
 MOaCufl/nnQ3aniz4/37nOMyAHLOqsb7DyH547lAqHHxHmKZVJvKd5po3FDGDdWOKf
 /s4fx97tsyUKz9JSxA2auxrGm45TQ365e72yWlBs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558644438;
 bh=2EOjThIW8SBz24GgHp3wmH9WnNSCbrrRd8s2VkktnTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CZ3GnIH+YlW8LwT0Rn+pJPwxHMQOjhH235bEz1lWOowKFqTlEkInY01cCaiNhZiPA
 MOaCufl/nnQ3aniz4/37nOMyAHLOqsb7DyH547lAqHHxHmKZVJvKd5po3FDGDdWOKf
 /s4fx97tsyUKz9JSxA2auxrGm45TQ365e72yWlBs=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDE6MTY6NDFQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IGE2eHhfZ211
X3N0b3AoKSBhbHJlYWR5IGNhbGxzIHRoaXMgZnVuY3Rpb24gdmlhIHNodXRkb3duIG9yIGZvcmNl
X3N0b3AsCj4gc28gaXQncyBub3QgbmVjZXNzYXJ5IHRvIGNhbGwgaXQgdHdpY2UuIFByZXZpb3Vz
bHkgdGhpcyB3b3VsZCBoYXZlCj4ga25vY2tlZCB0aGUgaXJxIHJlZmNvdW50IG91dCBvZiBzeW5j
LCBidXQgbm93IHdpdGggdGhlIGlycXNfZW5hYmxlZCBmbGFnCj4gaXQncyBqdXN0IGhvdXNla2Vl
cGluZy4KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gTm9uZQo+IAo+IENjOiBKb3JkYW4gQ3JvdXNl
IDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2Vh
bnBhdWxAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VA
Y29kZWF1cm9yYS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhf
Z211LmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMKPiBpbmRleCBhYTg0ZWRiMjVkOTEuLjc0MmM4ZmY5
YTYxYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwo+IEBAIC0xMjM5
LDcgKzEyMzksNiBAQCB2b2lkIGE2eHhfZ211X3JlbW92ZShzdHJ1Y3QgYTZ4eF9ncHUgKmE2eHhf
Z3B1KQo+ICAJCWRldl9wbV9kb21haW5fZGV0YWNoKGdtdS0+Z3hwZCwgZmFsc2UpOwo+ICAJfQo+
ICAKPiAtCWE2eHhfZ211X2lycV9kaXNhYmxlKGdtdSk7Cj4gIAlhNnh4X2dtdV9tZW1vcnlfZnJl
ZShnbXUsIGdtdS0+aGZpKTsKPiAgCj4gIAlpb21tdV9kZXRhY2hfZGV2aWNlKGdtdS0+ZG9tYWlu
LCBnbXUtPmRldik7Cj4gLS0gCj4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xl
IC8gQ2hyb21pdW0gT1MKPiAKCi0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIElu
Yy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBD
b2xsYWJvcmF0aXZlIFByb2plY3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
