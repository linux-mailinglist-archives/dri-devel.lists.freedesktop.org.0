Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4F429F9C
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 22:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165DA6E0A2;
	Fri, 24 May 2019 20:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F146E0A2;
 Fri, 24 May 2019 20:16:06 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id B321960C5F; Fri, 24 May 2019 20:16:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id 0A3B06087F;
 Fri, 24 May 2019 20:16:06 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 24 May 2019 13:16:06 -0700
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 1/2] drm/msm/dpu: Use provided drm_minor to initialize
 debugfs
In-Reply-To: <20190524173231.5040-1-sean@poorly.run>
References: <20190524173231.5040-1-sean@poorly.run>
Message-ID: <b9e1d9e8e5e76b39c51701c77e00b1c4@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558728966;
 bh=7lAqkzss2aGJ5ffn2bYK8f++vTLf/SLZklfVXvX23tk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g8ZYW2MUJvgg61MOc9jTAxDeA3OBqkLqq5YTCisvEqFJEJXNoa/Xs7iEG0BNqXOqt
 SeX+liPk36qjxkpC1EiVpHrD2sq9wx/vVEHVjpRO9OqqHOSr9M5xM7bHxFTbwner6w
 YA5cj60YcBH8BoJkE/PfVpBHeRaLim+JHfMH/ovw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558728966;
 bh=7lAqkzss2aGJ5ffn2bYK8f++vTLf/SLZklfVXvX23tk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g8ZYW2MUJvgg61MOc9jTAxDeA3OBqkLqq5YTCisvEqFJEJXNoa/Xs7iEG0BNqXOqt
 SeX+liPk36qjxkpC1EiVpHrD2sq9wx/vVEHVjpRO9OqqHOSr9M5xM7bHxFTbwner6w
 YA5cj60YcBH8BoJkE/PfVpBHeRaLim+JHfMH/ovw=
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
c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEluc3RlYWQgb2YgcmVhY2hpbmcgaW50byBkZXYt
PnByaW1hcnkgZm9yIGRlYnVnZnNfcm9vdCwgdXNlIHRoZSBtaW5vcgo+IHBhc3NlZCBpbnRvIGRl
YnVnZnNfaW5pdC4KPiAKPiBUaGlzIGF2b2lkcyBjcmVhdGluZyB0aGUgZGVidWcgZGlyZWN0b3J5
IHVuZGVyIC9zeXMva2VybmVsL2RlYnVnLyBhbmQKPiBpbnN0ZWFkIGNyZWF0ZXMgdGhlIGRpcmVj
dG9yeSB1bmRlciB0aGUgY29ycmVjdCBub2RlIGluCj4gL3N5cy9rZXJuZWwvZGVidWcvZHJpLzxu
b2RlPi8KPiAKPiBSZXBvcnRlZC1ieTogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3Jn
Pgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgpSZXZp
ZXdlZC1ieTogQWJoaW5hdiBLdW1hciA8YWJoaW5hdmtAY29kZWF1cm9yYS5vcmc+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyB8IDYgKysrLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwo+IGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCj4gaW5kZXggODg1YmY4OGFmYTNlLi5k
NzcwNzE5NjU0MzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5j
Cj4gQEAgLTIzMSw3ICsyMzEsNyBAQCB2b2lkICpkcHVfZGVidWdmc19jcmVhdGVfcmVnc2V0MzIo
Y29uc3QgY2hhcgo+ICpuYW1lLCB1bW9kZV90IG1vZGUsCj4gIAkJCXJlZ3NldCwgJmRwdV9mb3Bz
X3JlZ3NldDMyKTsKPiAgfQo+IAo+IC1zdGF0aWMgaW50IF9kcHVfZGVidWdmc19pbml0KHN0cnVj
dCBkcHVfa21zICpkcHVfa21zKQo+ICtzdGF0aWMgaW50IF9kcHVfZGVidWdmc19pbml0KHN0cnVj
dCBkcHVfa21zICpkcHVfa21zLCBzdHJ1Y3QgZHJtX21pbm9yIAo+ICptaW5vcikKPiAgewo+ICAJ
dm9pZCAqcCA9IGRwdV9od191dGlsX2dldF9sb2dfbWFza19wdHIoKTsKPiAgCXN0cnVjdCBkZW50
cnkgKmVudHJ5Owo+IEBAIC0yMzksNyArMjM5LDcgQEAgc3RhdGljIGludCBfZHB1X2RlYnVnZnNf
aW5pdChzdHJ1Y3QgZHB1X2ttcyAKPiAqZHB1X2ttcykKPiAgCWlmICghcCkKPiAgCQlyZXR1cm4g
LUVJTlZBTDsKPiAKPiAtCWVudHJ5ID0gZGVidWdmc19jcmVhdGVfZGlyKCJkZWJ1ZyIsIAo+IGRw
dV9rbXMtPmRldi0+cHJpbWFyeS0+ZGVidWdmc19yb290KTsKPiArCWVudHJ5ID0gZGVidWdmc19j
cmVhdGVfZGlyKCJkZWJ1ZyIsIG1pbm9yLT5kZWJ1Z2ZzX3Jvb3QpOwo+ICAJaWYgKElTX0VSUl9P
Ul9OVUxMKGVudHJ5KSkKPiAgCQlyZXR1cm4gLUVOT0RFVjsKPiAKPiBAQCAtNTgxLDcgKzU4MSw3
IEBAIHN0YXRpYyBpbnQgX2RwdV9rbXNfZHJtX29ial9pbml0KHN0cnVjdCBkcHVfa21zIAo+ICpk
cHVfa21zKQo+ICAjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCj4gIHN0YXRpYyBpbnQgZHB1X2ttc19k
ZWJ1Z2ZzX2luaXQoc3RydWN0IG1zbV9rbXMgKmttcywgc3RydWN0IGRybV9taW5vciAKPiAqbWlu
b3IpCj4gIHsKPiAtCXJldHVybiBfZHB1X2RlYnVnZnNfaW5pdCh0b19kcHVfa21zKGttcykpOwo+
ICsJcmV0dXJuIF9kcHVfZGVidWdmc19pbml0KHRvX2RwdV9rbXMoa21zKSwgbWlub3IpOwo+ICB9
Cj4gICNlbmRpZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
