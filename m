Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C209E28BEC
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 22:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D53C6E077;
	Thu, 23 May 2019 20:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8F56E075;
 Thu, 23 May 2019 20:53:06 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 7489360C8B; Thu, 23 May 2019 20:53:06 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C57D6030E;
 Thu, 23 May 2019 20:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6C57D6030E
Date: Thu, 23 May 2019 14:53:03 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 6/6] drm/msm/a6xx: Rename a6xx_gmu_probe to
 a6xx_gmu_init
Message-ID: <20190523205303.GG18360@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org
References: <20190523171653.138678-1-sean@poorly.run>
 <20190523171653.138678-6-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523171653.138678-6-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558644786;
 bh=9qZl9OmGjA14Kf6qbl/XVL++RbwClhXEXkUPbXo5f48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RKLNQMhWrK+r23vbNlByhIYBYFO7vgpRapIPeuwuC/dG9b3QYUeviUJXiFr9ZInU+
 ShEhJWn3fDD12IFKgWn3Itp9SdfOpatjwOcEsjwMmsOyMY4DqWi74N5lKWWul4J2UF
 jY9OrlabbB8RpbR+LuA+u9Hy0Y3mDEabw3VHU6IQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558644786;
 bh=9qZl9OmGjA14Kf6qbl/XVL++RbwClhXEXkUPbXo5f48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RKLNQMhWrK+r23vbNlByhIYBYFO7vgpRapIPeuwuC/dG9b3QYUeviUJXiFr9ZInU+
 ShEhJWn3fDD12IFKgWn3Itp9SdfOpatjwOcEsjwMmsOyMY4DqWi74N5lKWWul4J2UF
 jY9OrlabbB8RpbR+LuA+u9Hy0Y3mDEabw3VHU6IQ=
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

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDE6MTY6NDVQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IFRoaXMgcmVu
YW1lIG1ha2VzIGl0IG1vcmUgY2xlYXIgdGhhdCBldmVyeXRoaW5nIGluaXRpYWxpemVkIGluIHRo
ZSBfaW5pdAo+IGZ1bmN0aW9uIG11c3QgYmUgY2xlYW5lZCB1cCBpbiBhNnh4X2dtdV9yZW1vdmUu
IFRoaXMgd2lsbCBob3BlZnVsbHkKPiBkaXNzdWFkZSBwZW9wbGUgZnJvbSB1c2luZyBkZXZpY2Ug
bWFuYWdlZCByZXNvdXJjZXMgKGZvciByZWFzb25zIGxhaWQKPiBvdXQgaW4gdGhlIHByZXZpb3Vz
IHBhdGNoKS4KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gTm9uZQo+IAo+IENjOiBKb3JkYW4gQ3Jv
dXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8
c2VhbnBhdWxAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91
c2VAY29kZWF1cm9yYS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2
eHhfZ211LmMgfCAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMg
fCAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmggfCAyICstCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwo+IGluZGV4IGUyYjgzOWI1ZDNiZC4uNWFi
NjlkY2Q1NDc5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhf
Z211LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCj4gQEAg
LTEyNTksNyArMTI1OSw3IEBAIHZvaWQgYTZ4eF9nbXVfcmVtb3ZlKHN0cnVjdCBhNnh4X2dwdSAq
YTZ4eF9ncHUpCj4gIAlnbXUtPmluaXRpYWxpemVkID0gZmFsc2U7Cj4gIH0KPiAgCj4gLWludCBh
Nnh4X2dtdV9wcm9iZShzdHJ1Y3QgYTZ4eF9ncHUgKmE2eHhfZ3B1LCBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5vZGUpCj4gK2ludCBhNnh4X2dtdV9pbml0KHN0cnVjdCBhNnh4X2dwdSAqYTZ4eF9ncHUs
IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKPiAgewo+ICAJc3RydWN0IGE2eHhfZ211ICpnbXUg
PSAmYTZ4eF9ncHUtPmdtdTsKPiAgCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSBvZl9m
aW5kX2RldmljZV9ieV9ub2RlKG5vZGUpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2FkcmVuby9hNnh4X2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9n
cHUuYwo+IGluZGV4IGU3NGRjZTQ3NDI1MC4uMWY5ZjRiMGE5NjU2IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCj4gQEAgLTg1NCw3ICs4NTQsNyBAQCBzdHJ1Y3QgbXNt
X2dwdSAqYTZ4eF9ncHVfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ICAJLyogRklYTUU6
IEhvdyBkbyB3ZSBncmFjZWZ1bGx5IGhhbmRsZSB0aGlzPyAqLwo+ICAJQlVHX09OKCFub2RlKTsK
PiAgCj4gLQlyZXQgPSBhNnh4X2dtdV9wcm9iZShhNnh4X2dwdSwgbm9kZSk7Cj4gKwlyZXQgPSBh
Nnh4X2dtdV9pbml0KGE2eHhfZ3B1LCBub2RlKTsKPiAgCWlmIChyZXQpIHsKPiAgCQlhNnh4X2Rl
c3Ryb3koJihhNnh4X2dwdS0+YmFzZS5iYXNlKSk7Cj4gIAkJcmV0dXJuIEVSUl9QVFIocmV0KTsK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmgKPiBpbmRleCBiNDYyNzllYjE4YzUu
LjY0Mzk5NTU0ZjJkZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9h
Nnh4X2dwdS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuaAo+
IEBAIC01Myw3ICs1Myw3IEBAIGJvb2wgYTZ4eF9nbXVfaXNpZGxlKHN0cnVjdCBhNnh4X2dtdSAq
Z211KTsKPiAgaW50IGE2eHhfZ211X3NldF9vb2Ioc3RydWN0IGE2eHhfZ211ICpnbXUsIGVudW0g
YTZ4eF9nbXVfb29iX3N0YXRlIHN0YXRlKTsKPiAgdm9pZCBhNnh4X2dtdV9jbGVhcl9vb2Ioc3Ry
dWN0IGE2eHhfZ211ICpnbXUsIGVudW0gYTZ4eF9nbXVfb29iX3N0YXRlIHN0YXRlKTsKPiAgCj4g
LWludCBhNnh4X2dtdV9wcm9iZShzdHJ1Y3QgYTZ4eF9ncHUgKmE2eHhfZ3B1LCBzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5vZGUpOwo+ICtpbnQgYTZ4eF9nbXVfaW5pdChzdHJ1Y3QgYTZ4eF9ncHUgKmE2
eHhfZ3B1LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpOwo+ICB2b2lkIGE2eHhfZ211X3JlbW92
ZShzdHJ1Y3QgYTZ4eF9ncHUgKmE2eHhfZ3B1KTsKPiAgCj4gIHZvaWQgYTZ4eF9nbXVfc2V0X2Zy
ZXEoc3RydWN0IG1zbV9ncHUgKmdwdSwgdW5zaWduZWQgbG9uZyBmcmVxKTsKPiAtLSAKPiBTZWFu
IFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwo+IAoKLS0gClRo
ZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiBDb2RlIEF1
cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
