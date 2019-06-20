Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E814D1AC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 17:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A917E6E594;
	Thu, 20 Jun 2019 15:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D926E598
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 15:08:43 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so3541788qtk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 08:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fC+AUCK+WSPbvG8SqAt4iXG+fc3X5400bAZamnP2CmM=;
 b=joaN2+Hqr2KBZjgDj0wBg9XhlIRjWRMt+1SrzvjzrePwbCIrBniiexctoSj3pwrPUn
 eScwGsd5Qw1aXFUP/pGMkeUOned0S7Yi6VCqZyTFyOZ54FBe3XF3c0O6KcY73952SUFH
 RMPJhZsm+APNcBHo3Vclq+el9Fa1+fQtu6uMBlYkG4pZDDRXPOp+txqDeA2/sKkCUXRL
 8eAagFjVDcgzBCgw+UIwCEVrHrFfxGlprEFYQSrKrvgyR5dVGXABt65s53wvBtC4CEJa
 Qu3pCmrBDkUqiOqfynfl5O0uY6iTpic3NKxGPCEdLeDetEeDfL95FpW1vK4v+94hgCUD
 przw==
X-Gm-Message-State: APjAAAVsXkPOphI0QMZaQS1IoV+HmvwHuNVgRJ7jD6rrxz3pZQUByRBn
 +sZME0UFIxYOr2Ci1VRAopZmkrSPwpweiv4LNWLl6w==
X-Google-Smtp-Source: APXvYqx1SgSIauAU9BUtYl2eYhn/nNJPnoTUftqyFSTIhhjNiV15NRe1MTrlzvJExez7Fu8UGyttrD5eajdbPkRTrDE=
X-Received: by 2002:a0c:b163:: with SMTP id r32mr40332192qvc.169.1561043322872; 
 Thu, 20 Jun 2019 08:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-30-daniel.vetter@ffwll.ch>
In-Reply-To: <20190614203615.12639-30-daniel.vetter@ffwll.ch>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 20 Jun 2019 17:08:32 +0200
Message-ID: <CA+M3ks6mNyDi6NRwNxakGtwGvn-c6nQh0Z12x2zc55yex8U0XQ@mail.gmail.com>
Subject: Re: [PATCH 29/59] drm/sti: Drop drm_gem_prime_export/import
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fC+AUCK+WSPbvG8SqAt4iXG+fc3X5400bAZamnP2CmM=;
 b=zT00gC4gu21dWr+mWY7T8/ahMCDDonsDawrE1DgbfKXbq0S9hItGyR4Hkwe6iG/7VS
 JQcVXki2mcR3tpTnapjz5U43D626G6Y4kA9CB1mV+WaMOH9fDSAs7YSirMt251sqQqwU
 p37+1alFrOSJuDMHmiQPgR06VaFBGOfB1XMsenkw8BjoWGz5m+RACfkPygCaXYqh6y+R
 9qOZFGJhT3sctU6r/iJY81CfreqvHUve4tvoN3ih/D6V8JmxqHh92LQg9WBqGWfUd740
 Tf6Rf0f5QudYwAc+23EowKuNOQVDajr/aX0MnG5tVotuhz8ki9Eq8U3DL/U5GUVBvmUk
 s7Mw==
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgdmVuLiAxNCBqdWluIDIwMTkgw6AgMjI6MzYsIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+IGEgw6ljcml0IDoKPgo+IFRoZXkncmUgdGhlIGRlZmF1bHQuCj4KPiBBc2lk
ZTogV291bGQgYmUgcmVhbGx5IG5pY2UgdG8gc3dpdGNoIHRoZSBvdGhlcnMgb3ZlciB0bwo+IGRy
bV9nZW1fb2JqZWN0X2Z1bmNzLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5n
YWlnbmFyZEBsaW5hcm8ub3JnPgo+IENjOiBWaW5jZW50IEFicmlvdSA8dmluY2VudC5hYnJpb3VA
c3QuY29tPgoKVGhhbmtzLApSZXZpZXdlZC1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWlu
LmdhaWduYXJkQGxpbmFyby5vcmc+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9k
cnYuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3Rp
L3N0aV9kcnYuYwo+IGluZGV4IGQ5ZjYzYzlmMjg3Yi4uZmFlYTRkY2IyMWIxIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3N0aS9zdGlfZHJ2LmMKPiBAQCAtMTUyLDggKzE1Miw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Ry
aXZlciBzdGlfZHJpdmVyID0gewo+Cj4gICAgICAgICAucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJt
X2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCj4gICAgICAgICAucHJpbWVfZmRfdG9faGFuZGxlID0g
ZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCj4gLSAgICAgICAuZ2VtX3ByaW1lX2V4cG9ydCA9
IGRybV9nZW1fcHJpbWVfZXhwb3J0LAo+IC0gICAgICAgLmdlbV9wcmltZV9pbXBvcnQgPSBkcm1f
Z2VtX3ByaW1lX2ltcG9ydCwKPiAgICAgICAgIC5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlID0gZHJt
X2dlbV9jbWFfcHJpbWVfZ2V0X3NnX3RhYmxlLAo+ICAgICAgICAgLmdlbV9wcmltZV9pbXBvcnRf
c2dfdGFibGUgPSBkcm1fZ2VtX2NtYV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCj4gICAgICAgICAu
Z2VtX3ByaW1lX3ZtYXAgPSBkcm1fZ2VtX2NtYV9wcmltZV92bWFwLAo+IC0tCj4gMi4yMC4xCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
