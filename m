Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704B22CA75
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 17:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8838989E;
	Tue, 28 May 2019 15:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CF78989E;
 Tue, 28 May 2019 15:41:28 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id ACA6E6087F; Tue, 28 May 2019 15:41:28 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7CE906087A;
 Tue, 28 May 2019 15:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7CE906087A
Date: Tue, 28 May 2019 09:41:25 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Use provided drm_minor to
 initialize debugfs
Message-ID: <20190528154125.GA23227@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>
References: <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
 <20190528151339.207978-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528151339.207978-1-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559058088;
 bh=6HfiQeqnIuH0mz4SbHGJrntnCojsBluvrz9KzZyS59A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AQHxcvMWfjfk9JWloUmXd9pz+97ZhQD7YsqdtQLNh3HivqJs0CGxtAqCzb69tuXx7
 qn9Mpp6bC4CKyLMr69yseCuyLuJqyQEiCf6DSPxEUIoXUKOzu7J7+gYuFtAmIcTWe4
 nUvV5Hi2UCkdhinL+/+wEwP6gmceSx6pSK7NB8CY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559058088;
 bh=6HfiQeqnIuH0mz4SbHGJrntnCojsBluvrz9KzZyS59A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AQHxcvMWfjfk9JWloUmXd9pz+97ZhQD7YsqdtQLNh3HivqJs0CGxtAqCzb69tuXx7
 qn9Mpp6bC4CKyLMr69yseCuyLuJqyQEiCf6DSPxEUIoXUKOzu7J7+gYuFtAmIcTWe4
 nUvV5Hi2UCkdhinL+/+wEwP6gmceSx6pSK7NB8CY=
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
Cc: Rob Clark <robdclark@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMTE6MTM6MzlBTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEluc3RlYWQg
b2YgcmVhY2hpbmcgaW50byBkZXYtPnByaW1hcnkgZm9yIGRlYnVnZnNfcm9vdCwgdXNlIHRoZSBt
aW5vcgo+IHBhc3NlZCBpbnRvIGRlYnVnZnNfaW5pdC4KPiAKPiBUaGlzIGF2b2lkcyBjcmVhdGlu
ZyBhIGRlYnVnIGRpcmVjdG9yeSB1bmRlciAvc3lzL2tlcm5lbC9kZWJ1Zy9kZWJ1Zwo+IGFuZCBp
bnN0ZWFkIHVzZXMgL3N5cy9rZXJuZWwvZGVidWcvZHJpLzxub2RlPi8KPiAKPiBTaW5jZSB3ZSdy
ZSBub3cgcHV0dGluZyBldmVyeXRoaW5nIHVuZGVyICovZHJpLzxub2RlPiwgdGhlcmUncyBubwo+
IG5lZWQgdG8gY3JlYXRlIGEgZHVwbGljYXRlICJkZWJ1ZyIgZGlyZWN0b3J5LiBKdXN0IHB1dCBl
dmVyeXRoaW5nIGluCj4gdGhlIHJvb3QuCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFJlbW92ZSB0
aGUgdW5uZWNlc3NhcnkgImRlYnVnIiBkaXJlY3RvcnkgKFN0ZXBoZW4pCj4gCj4gTGluayB0byB2
MTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNTI0
MTczMjMxLjUwNDAtMS1zZWFuQHBvb3JseS5ydW4KPiAKPiBDYzogUm9iIENsYXJrIDxyb2JkY2xh
cmtAY2hyb21pdW0ub3JnPgo+IFJlcG9ydGVkLWJ5OiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJv
bWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEFiaGluYXYgS3VtYXIgPGFiaGluYXZrQGNvZGVhdXJv
cmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgfCAxMCAr
KystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9r
bXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwo+IGluZGV4IDg4
NWJmODhhZmEzZWMuLmFkMDk0NzA0NjEwZjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2ttcy5jCj4gQEAgLTIzMSwxOCArMjMxLDE0IEBAIHZvaWQgKmRwdV9kZWJ1Z2Zz
X2NyZWF0ZV9yZWdzZXQzMihjb25zdCBjaGFyICpuYW1lLCB1bW9kZV90IG1vZGUsCj4gIAkJCXJl
Z3NldCwgJmRwdV9mb3BzX3JlZ3NldDMyKTsKPiAgfQo+ICAKPiAtc3RhdGljIGludCBfZHB1X2Rl
YnVnZnNfaW5pdChzdHJ1Y3QgZHB1X2ttcyAqZHB1X2ttcykKPiArc3RhdGljIGludCBfZHB1X2Rl
YnVnZnNfaW5pdChzdHJ1Y3QgZHB1X2ttcyAqZHB1X2ttcywgc3RydWN0IGRybV9taW5vciAqbWlu
b3IpCj4gIHsKPiAgCXZvaWQgKnAgPSBkcHVfaHdfdXRpbF9nZXRfbG9nX21hc2tfcHRyKCk7Cj4g
LQlzdHJ1Y3QgZGVudHJ5ICplbnRyeTsKPiArCXN0cnVjdCBkZW50cnkgKmVudHJ5ID0gbWlub3It
PmRlYnVnZnNfcm9vdDsKPiAgCj4gIAlpZiAoIXApCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAo+
IC0JZW50cnkgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoImRlYnVnIiwgZHB1X2ttcy0+ZGV2LT5wcmlt
YXJ5LT5kZWJ1Z2ZzX3Jvb3QpOwo+IC0JaWYgKElTX0VSUl9PUl9OVUxMKGVudHJ5KSkKPiAtCQly
ZXR1cm4gLUVOT0RFVjsKPiAtCj4gIAkvKiBhbGxvdyByb290IHRvIGJlIE5VTEwgKi8KCk1pbm9y
IG5pdCwgdGhpcyBjb21tZW50IHNlZW1zIHRvIGJlIG1pc3BsYWNlZCBldmVuIG1vcmUgbm93IHRo
YW4gaXQgd2FzIGJlZm9yZS4KCj4gIAlkZWJ1Z2ZzX2NyZWF0ZV94MzIoRFBVX0RFQlVHRlNfSFdN
QVNLTkFNRSwgMDYwMCwgZW50cnksIHApOwo+ICAKPiBAQCAtNTgxLDcgKzU3Nyw3IEBAIHN0YXRp
YyBpbnQgX2RwdV9rbXNfZHJtX29ial9pbml0KHN0cnVjdCBkcHVfa21zICpkcHVfa21zKQo+ICAj
aWZkZWYgQ09ORklHX0RFQlVHX0ZTCj4gIHN0YXRpYyBpbnQgZHB1X2ttc19kZWJ1Z2ZzX2luaXQo
c3RydWN0IG1zbV9rbXMgKmttcywgc3RydWN0IGRybV9taW5vciAqbWlub3IpCj4gIHsKPiAtCXJl
dHVybiBfZHB1X2RlYnVnZnNfaW5pdCh0b19kcHVfa21zKGttcykpOwo+ICsJcmV0dXJuIF9kcHVf
ZGVidWdmc19pbml0KHRvX2RwdV9rbXMoa21zKSwgbWlub3IpOwo+ICB9Cj4gICNlbmRpZgo+ICAK
PiAtLSAKPiBTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBP
UwogCi0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIg
b2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFBy
b2plY3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
