Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3D817D52
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 17:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213AA8941E;
	Wed,  8 May 2019 15:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94F18935A;
 Wed,  8 May 2019 15:29:33 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 90A7660ACE; Wed,  8 May 2019 15:29:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CFD8C60128;
 Wed,  8 May 2019 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CFD8C60128
Date: Wed, 8 May 2019 09:29:30 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: No zap shader is not an error
Message-ID: <20190508152929.GB24137@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sharat Masetty <smasetty@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20190508130726.27557-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508130726.27557-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557329373;
 bh=7s2pzhCNZ9x0/hSSdDjvRYrf+MYMnUeTbIypuArEr8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T0ZJTlKTD7V34mxz7FhDYPOAP+XlTr/gqTHttgwzn83YaZXZfmF78XmQ/LNvECPpO
 7j2qG208hoyoF3r8fEmIU/pMthtOIvB2OgRRXyKgRWhkgdrQ3QbT76x4r3g1nLW/U1
 p5t6aZzi79ej8P4GqCpAq09qkbxJdHxY/HSW/JlQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557329372;
 bh=7s2pzhCNZ9x0/hSSdDjvRYrf+MYMnUeTbIypuArEr8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VPH/1rlvg4lvwko2hcz0Z5CHc5Tq8VyoRiS6YLTcBbPf6OZhzxY3nA8Q1viWRruel
 39jPtQFwHKiARq4RD6p/d/GmSqt94R3w+YEgiVDQoB7hxJkhr2DUHByITBXxOhG4/v
 4ey+jUCqwB5yq/IrI5iEGD1cJRJ7hdJEX0iCg1Ww=
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDY6MDY6NTJBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBEZXBlbmRp
bmcgb24gcGxhdGZvcm0gZmlybXdhcmUsIGEgemFwIHNoYWRlciBtYXkgbm90IGJlIHJlcXVpcmVk
IHRvIHRha2UKPiB0aGUgR1BVIG91dCBvZiBzZWN1cmUgbW9kZSBvbiBib290LCBpbiB3aGljaCBj
YXNlIHdlIGNhbiBqdXN0IHdyaXRlCj4gUkJCTV9TRUNWSURfVFJVU1RfQ05UTCBkaXJlY3RseS4g
IFdoaWNoIHdlICptb3N0bHkqIGhhbmRsZWQsIGJ1dCBtaXNzZWQKPiBjbGVhcmluZyAncmV0JyBy
ZXN1bHRpbmcgdGhhdCBod19pbml0KCkgcmV0dXJuZWQgYW4gZXJyb3Igb24gdGhlc2UKPiBkZXZp
Y2VzLgo+IAo+IEZpeGVzOiBhYmNjYjlmZTMyNjcgZHJtL21zbS9hNnh4OiBBZGQgemFwIHNoYWRl
ciBsb2FkCj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3Jn
PgoKV29vLCBJJ20gZ2xhZCB3ZSBmaW5hbGx5IGdvdCBhIGNoYW5jZSB0byB2ZXJpZnkgdGhpcyBv
biBib3RoIHR5cGVzIG9mIHN5c3RlbXMuCgpBY2tlZC1ieTogSm9yZGFuIENyb3VzZSA8amNyb3Vz
ZUBjb2RlYXVyb3JhLm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2
eHhfZ3B1LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCj4gaW5kZXggZWMyNDUwOGI5ZDY4Li5lNzRk
Y2U0NzQyNTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9n
cHUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMKPiBAQCAt
NTI3LDYgKzUyNyw3IEBAIHN0YXRpYyBpbnQgYTZ4eF9od19pbml0KHN0cnVjdCBtc21fZ3B1ICpn
cHUpCj4gIAkJZGV2X3dhcm5fb25jZShncHUtPmRldi0+ZGV2LAo+ICAJCQkiWmFwIHNoYWRlciBu
b3QgZW5hYmxlZCAtIHVzaW5nIFNFQ1ZJRF9UUlVTVF9DTlRMIGluc3RlYWRcbiIpOwo+ICAJCWdw
dV93cml0ZShncHUsIFJFR19BNlhYX1JCQk1fU0VDVklEX1RSVVNUX0NOVEwsIDB4MCk7Cj4gKwkJ
cmV0ID0gMDsKPiAgCX0KPiAgCj4gIG91dDoKPiAtLSAKPiAyLjIwLjEKPiAKCi0tIApUaGUgUXVh
bGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEg
Rm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
