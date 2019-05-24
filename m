Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E6D29FAD
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 22:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31C96E0BB;
	Fri, 24 May 2019 20:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3FB6E0BB;
 Fri, 24 May 2019 20:18:17 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 7402C6087F; Fri, 24 May 2019 20:18:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id EECE960388;
 Fri, 24 May 2019 20:18:16 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 24 May 2019 13:18:16 -0700
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 2/2] drm/msm/dpu: Remove _dpu_debugfs_init
In-Reply-To: <20190524173231.5040-2-sean@poorly.run>
References: <20190524173231.5040-1-sean@poorly.run>
 <20190524173231.5040-2-sean@poorly.run>
Message-ID: <8d0b87d94fd3fa4468965753e7c325c1@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558729097;
 bh=nXPciAhWumJxn8iXyonu0dWDccJ+9SfgHSe1wd3MTyY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H7luySoAkb5M6VH3+IXcn1QRi6gvP73vVrKZO+M7cSdSvk6N+md+fGbLnnK80cj5Y
 pLsT1OG3dDkUUsrhiVc3rUXxKp6mZlQ4Pyv+9UIbj6vO+oCF/QjgmRbTcBP+s02tPV
 NPv54za0+026YDGVwjBujDZlKnklUwTHPdwO0blA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558729097;
 bh=nXPciAhWumJxn8iXyonu0dWDccJ+9SfgHSe1wd3MTyY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H7luySoAkb5M6VH3+IXcn1QRi6gvP73vVrKZO+M7cSdSvk6N+md+fGbLnnK80cj5Y
 pLsT1OG3dDkUUsrhiVc3rUXxKp6mZlQ4Pyv+9UIbj6vO+oCF/QjgmRbTcBP+s02tPV
 NPv54za0+026YDGVwjBujDZlKnklUwTHPdwO0blA=
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 freedreno@lists.freedesktop.org, linux-arm-msm-owner@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yNCAxMDozMiwgU2VhbiBQYXVsIHdyb3RlOgo+IEZyb206IFNlYW4gUGF1bCA8
c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEZvbGQgaXQgaW50byBkcHVfZGVidWdmc19pbml0
Lgo+IAo+IENjOiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+Cj4gU2lnbmVkLW9m
Zi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+ClJldmlld2VkLWJ5OiBBYmhp
bmF2IEt1bWFyIDxhYmhpbmF2a0Bjb2RlYXVyb3JhLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jIHwgMTAgKystLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMKPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwo+IGluZGV4IGQ3NzA3MTk2NTQzMS4uMGE4YzMzNGMz
YTlmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwo+IEBAIC0y
MzEsOCArMjMxLDkgQEAgdm9pZCAqZHB1X2RlYnVnZnNfY3JlYXRlX3JlZ3NldDMyKGNvbnN0IGNo
YXIKPiAqbmFtZSwgdW1vZGVfdCBtb2RlLAo+ICAJCQlyZWdzZXQsICZkcHVfZm9wc19yZWdzZXQz
Mik7Cj4gIH0KPiAKPiAtc3RhdGljIGludCBfZHB1X2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHB1X2tt
cyAqZHB1X2ttcywgc3RydWN0IGRybV9taW5vciAKPiAqbWlub3IpCj4gK3N0YXRpYyBpbnQgZHB1
X2ttc19kZWJ1Z2ZzX2luaXQoc3RydWN0IG1zbV9rbXMgKmttcywgc3RydWN0IGRybV9taW5vciAK
PiAqbWlub3IpCj4gIHsKPiArCXN0cnVjdCBkcHVfa21zICpkcHVfa21zID0gdG9fZHB1X2ttcyhr
bXMpOwo+ICAJdm9pZCAqcCA9IGRwdV9od191dGlsX2dldF9sb2dfbWFza19wdHIoKTsKPiAgCXN0
cnVjdCBkZW50cnkgKmVudHJ5Owo+IAo+IEBAIC01NzgsMTMgKzU3OSw2IEBAIHN0YXRpYyBpbnQg
X2RwdV9rbXNfZHJtX29ial9pbml0KHN0cnVjdCBkcHVfa21zIAo+ICpkcHVfa21zKQo+ICAJcmV0
dXJuIHJldDsKPiAgfQo+IAo+IC0jaWZkZWYgQ09ORklHX0RFQlVHX0ZTCj4gLXN0YXRpYyBpbnQg
ZHB1X2ttc19kZWJ1Z2ZzX2luaXQoc3RydWN0IG1zbV9rbXMgKmttcywgc3RydWN0IGRybV9taW5v
ciAKPiAqbWlub3IpCj4gLXsKPiAtCXJldHVybiBfZHB1X2RlYnVnZnNfaW5pdCh0b19kcHVfa21z
KGttcyksIG1pbm9yKTsKPiAtfQo+IC0jZW5kaWYKPiAtCj4gIHN0YXRpYyBsb25nIGRwdV9rbXNf
cm91bmRfcGl4Y2xrKHN0cnVjdCBtc21fa21zICprbXMsIHVuc2lnbmVkIGxvbmcgCj4gcmF0ZSwK
PiAgCQlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gIHsKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
