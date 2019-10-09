Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC069D132F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 17:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C31F89803;
	Wed,  9 Oct 2019 15:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD8A89803;
 Wed,  9 Oct 2019 15:44:12 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 3F9DE602F2; Wed,  9 Oct 2019 15:44:11 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C2188602F2;
 Wed,  9 Oct 2019 15:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C2188602F2
Date: Wed, 9 Oct 2019 09:44:06 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] drm/msm: make a5xx_show and a5xx_gpu_state_put static
Message-ID: <20191009154406.GB13386@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Ben Dooks <ben.dooks@codethink.co.uk>,
 linux-kernel@lists.codethink.co.uk, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20191009114607.701-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009114607.701-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1570635852;
 bh=H77E6QRpj902y5ZjTMISRgJie95q1ZRTaFiWuLsQ4nA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=atcYYeORRrXNix+K29y+j6BTlu+GbjSjfv9zINWQV1L43uuqLuobRXyJkBTaTaLpJ
 noK0WLvsJHdNJhwZS4zPPb4IKJISFupDxraAeVxuMddLRE+Rf6AVlOtQNn8VqiSFxl
 yqBg/sa0qEZdEj8C283qh8cwIRAsMhAFgBqJ/PaE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1570635849;
 bh=H77E6QRpj902y5ZjTMISRgJie95q1ZRTaFiWuLsQ4nA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f7nmvh3GhgeBppz79Sb9yZbcgBGkjcIxha0vZ8VqEMhZW1wM8O3vRZT4AlScCRBI2
 E2w1vLzUwLXr88DnlmYfyH1UMEE/e1Nrt13okQADr0lpZPJF20xGYiMjC7mYkrj4Q0
 ySQ3lj4rhkVKlHNvBIkGbjjlA0d8ULpIFR7xlUeg=
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
Cc: linux-kernel@lists.codethink.co.uk, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMTI6NDY6MDdQTSArMDEwMCwgQmVuIERvb2tzIHdyb3Rl
Ogo+IFRoZSBhNXh4X3Nob3cgYW5kIGE1eHhfZ3B1X3N0YXRlX3B1dCBvYmplY3RzIGFyZSBub3Qg
ZXhwb3J0ZWQKPiBvdXRzaWRlIG9mIHRoZSBmaWxlLCBzbyBtYWtlIHRoZW0gc3RhdGljIHRvIGF2
b2lkIHRoZSBmb2xsb3dpbmcKPiB3YXJuaW5ncyBmcm9tIHNwYXJzZToKPiAKPiBkcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jOjEyOTI6NTogd2FybmluZzogc3ltYm9sICdhNXh4
X2dwdV9zdGF0ZV9wdXQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/Cj4g
ZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYzoxMzAyOjY6IHdhcm5pbmc6IHN5
bWJvbCAnYTV4eF9zaG93JyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwoK
UmV2aWV3ZWQtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+Cgo+IFNp
Z25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KPiAtLS0K
PiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+IENjOiBTZWFuIFBhdWwgPHNl
YW5AcG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGxpbnV4LWFybS1tc21Admdl
ci5rZXJuZWwub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
ZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL2FkcmVuby9hNXh4X2dwdS5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1
eHhfZ3B1LmMKPiBpbmRleCBlOWM1NWQxZDZjMDQuLjdmZGM5ZTJiY2FhYyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYwo+IEBAIC0xMjg5LDcgKzEyODksNyBAQCBzdGF0
aWMgdm9pZCBhNXh4X2dwdV9zdGF0ZV9kZXN0cm95KHN0cnVjdCBrcmVmICprcmVmKQo+ICAJa2Zy
ZWUoYTV4eF9zdGF0ZSk7Cj4gIH0KPiAgCj4gLWludCBhNXh4X2dwdV9zdGF0ZV9wdXQoc3RydWN0
IG1zbV9ncHVfc3RhdGUgKnN0YXRlKQo+ICtzdGF0aWMgaW50IGE1eHhfZ3B1X3N0YXRlX3B1dChz
dHJ1Y3QgbXNtX2dwdV9zdGF0ZSAqc3RhdGUpCj4gIHsKPiAgCWlmIChJU19FUlJfT1JfTlVMTChz
dGF0ZSkpCj4gIAkJcmV0dXJuIDE7Cj4gQEAgLTEyOTksOCArMTI5OSw4IEBAIGludCBhNXh4X2dw
dV9zdGF0ZV9wdXQoc3RydWN0IG1zbV9ncHVfc3RhdGUgKnN0YXRlKQo+ICAKPiAgCj4gICNpZiBk
ZWZpbmVkKENPTkZJR19ERUJVR19GUykgfHwgZGVmaW5lZChDT05GSUdfREVWX0NPUkVEVU1QKQo+
IC12b2lkIGE1eHhfc2hvdyhzdHJ1Y3QgbXNtX2dwdSAqZ3B1LCBzdHJ1Y3QgbXNtX2dwdV9zdGF0
ZSAqc3RhdGUsCj4gLQkJc3RydWN0IGRybV9wcmludGVyICpwKQo+ICtzdGF0aWMgdm9pZCBhNXh4
X3Nob3coc3RydWN0IG1zbV9ncHUgKmdwdSwgc3RydWN0IG1zbV9ncHVfc3RhdGUgKnN0YXRlLAo+
ICsJCSAgICAgIHN0cnVjdCBkcm1fcHJpbnRlciAqcCkKPiAgewo+ICAJaW50IGksIGo7Cj4gIAl1
MzIgcG9zID0gMDsKPiAtLSAKPiAyLjIzLjAKPiAKCi0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlv
biBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXgg
Rm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
