Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173DDD2D98
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 17:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8176E378;
	Thu, 10 Oct 2019 15:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E299F6E378
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 15:22:41 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id s22so5207719otr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 08:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PenGaXGBrENWr4HRhl2ZMGFHyym9ywCGyc7wJWTP8Es=;
 b=ZVZGcKmGeDFykfbWSCdLFCLAK92hH9Vd0vGbvsqG37PwfNQDCMqwaGJl8WG/cFKBdZ
 XMJjehjJge1izXoU4577W2OPraySTMxiDYxeo2NlItl2gpnALPsK8s7zkoVjFUrLMbt+
 sfI+syjAQyP6xc0j/WYDEdGGHYYqeFw321UNK7Ey7Og4FCpajRZvkGuCw7CLzM2Qz9ht
 FTnqDdEhRFogMBK5sMJynZ5oX5+KuH9oXw7KTFEPtEeztUCqKfAXiFX0wyPjdVn6mbWw
 9Py49bC0uVUc6+6t7C0CQBm9ZBE4N8ZkBakys1chtJaBHPRxLOhCxcpjA8Ms6jviwJva
 Bs3w==
X-Gm-Message-State: APjAAAWWzbcg1lwdVY6PGRTu2RwTyCwkrdl+JspKCJH6zqTVKY13DSom
 couuNVsyI5KhS/HZq2d+F0369r4VuWzP1omOhWlcGA==
X-Google-Smtp-Source: APXvYqxwi0Gygs5kPGzDnCCyiTgHjRRdKCaJiHfsGaRjDAslpSjYSTlDyMH2eIjfnkx+3+OX6wcHgbuj9WokzULHAWI=
X-Received: by 2002:a9d:6b0a:: with SMTP id g10mr8284705otp.303.1570720960988; 
 Thu, 10 Oct 2019 08:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191010151351.126735-1-sean@poorly.run>
In-Reply-To: <20191010151351.126735-1-sean@poorly.run>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Oct 2019 17:22:29 +0200
Message-ID: <CAKMK7uF2HsM5WrC5j_WNXWDjkXTyK5tP2DuoRt78FeaL5791QA@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/msm: dpu: Add modeset lock checks where
 applicable"
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PenGaXGBrENWr4HRhl2ZMGFHyym9ywCGyc7wJWTP8Es=;
 b=Ihehkphoadi3HQFuRPEVdSQBReqPm7/Gh+3uPF13qJdc3RayvK0KsK2yAOWJXFJVtO
 5F3UVbMUgp0wahT+XDbIUClseAVeciWIPjDOxH8ybNvyGlNXnNQxDT8b9di8kLxPcUtt
 Fgk4ORb/+HSQpRwQyRPIsQ+U+a3Bzr/vzonqE=
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
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgNToxMyBQTSBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4gd3JvdGU6Cj4KPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPgo+
IFRoaXMgcmV2ZXJ0cyBjb21taXQgMWRmZGIwZTEwN2RiZTZlYmZmM2Y2YmJiZTRhYWQwYjVhYTg3
YmJhNC4KPgo+IEFzIERhbmllbCBtZW50aW9ucyBpbiBoaXMgZW1haWwgWzFdLCBub24tYmxvY2tp
bmcgY29tbWl0cyBkb24ndCBob2xkIHRoZQo+IG1vZGVzZXQgbG9ja3MsIHNvIHdlIGNhbiBzYWZl
bHkgYWNjZXNzIHN0YXRlIGFzIGxvbmcgYXMgdGhlc2UgZnVuY3Rpb25zCj4gYXJlIGluIHRoZSBj
b21taXQgcGF0aC4gSSdtIG5vdCBlbnRpcmVseSBzdXJlIGlmIHRoZXNlIGhhdmUgYWx3YXlzIGJl
ZW4KPiBpc29sYXRlZCB0byB0aGUgY29tbWl0IHBhdGgsIGJ1dCB0aGV5IHNlZW0gdG8gYmUgbm93
Lgo+Cj4gWzFdLSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2
ZWwvMjAxOS1PY3RvYmVyLzIzOTQ0MS5odG1sCj4KPiBGaXhlczogMWRmZGIwZTEwN2RiICgiZHJt
L21zbTogZHB1OiBBZGQgbW9kZXNldCBsb2NrIGNoZWNrcyB3aGVyZSBhcHBsaWNhYmxlIikKPiBD
YzogSmV5a3VtYXIgU2Fua2FyYW4gPGpzYW5rYUBjb2RlYXVyb3JhLm9yZz4KPiBDYzogUm9iIENs
YXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IFN1Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxA
Y2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
Y3J0Yy5jIHwgMiAtLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMg
IHwgMSAtCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYwo+IGluZGV4IGRiNmM5Y2NmM2JlMjYuLmM2NDVk
ZDIwMTM2OGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMK
PiBAQCAtMjgyLDggKzI4Miw2IEBAIGVudW0gZHB1X2ludGZfbW9kZSBkcHVfY3J0Y19nZXRfaW50
Zl9tb2RlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIElO
VEZfTU9ERV9OT05FOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBXQVJOX09OKCFkcm1fbW9kZXNl
dF9pc19sb2NrZWQoJmNydGMtPm11dGV4KSk7CgpUaGlzIG9uZSBpcyB3b3JzZSAuLi4gaXQncyB1
c2VkIGluIHR3byBwbGFjZXM6Ci0gZGVidWdmcywgd2hlcmUgeW91IGFjdHVhbGx5IHdhbnQgdG8g
bWFrZSBzdXJlIHlvdSdyZSBob2xkaW5nIHRoaXMgbG9jawotIGF0b21pY19jaGVjaywgd2hlcmUg
dGhpcyBpcyBicm9rZW4gc2luY2UgeW91J3JlIHN1cHBvc2VkIHRvIGxvb2sgYXQKdGhlIGZyZWUt
c3RhbmRpbmcgc3RhdGVzIG9ubHksIGV4Y2VwdCBpZiB5b3UgcmVhbGx5IGtub3cgd2hhdCB5b3Un
cmUKZG9pbmcuIEdpdmVuIHRoYXQgdGhlcmUncyBubyBjb21tZW50IGhlcmUsIEkgc3VzcGVjdCB0
aGF0J3Mgbm90IHRoZQpjYXNlLiBOb3RlIHRoYXQgZm9yIGF0b21pY19jaGVjayB5b3UncmUgZ3Vh
cmFudGVlZCB0byBob2xkIHRoZSBtb2Rlc2V0CmxvY2suCgpJJ2QgcHV0IGEgRklYTUUgaGVyZSwg
YnV0IGxlYXZlIHRoZSBXQVJOX09OIHVudGlsIHRoaXMgaXMgZml4ZWQgcHJvcGVybHkuCj4gLQo+
ICAgICAgICAgLyogVE9ETzogUmV0dXJucyB0aGUgZmlyc3QgSU5URl9NT0RFLCBjb3VsZCB0aGVy
ZSBiZSBtdWx0aXBsZSB2YWx1ZXM/ICovCj4gICAgICAgICBkcm1fZm9yX2VhY2hfZW5jb2Rlcl9t
YXNrKGVuY29kZXIsIGNydGMtPmRldiwgY3J0Yy0+c3RhdGUtPmVuY29kZXJfbWFzaykKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIGRwdV9lbmNvZGVyX2dldF9pbnRmX21vZGUoZW5jb2Rlcik7Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwo+IGluZGV4IGUzOTNhNDIzZDdk
N2EuLjBlNjhlMjBkMTljODcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2ttcy5jCj4gQEAgLTMwNSw3ICszMDUsNiBAQCB2b2lkIGRwdV9rbXNfZW5jb2Rlcl9lbmFibGUo
c3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+ICAgICAgICAgaWYgKGZ1bmNzICYmIGZ1bmNz
LT5jb21taXQpCj4gICAgICAgICAgICAgICAgIGZ1bmNzLT5jb21taXQoZW5jb2Rlcik7Cj4KPiAt
ICAgICAgIFdBUk5fT04oIWRybV9tb2Rlc2V0X2lzX2xvY2tlZCgmZGV2LT5tb2RlX2NvbmZpZy5j
b25uZWN0aW9uX211dGV4KSk7CgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KCmJ1dCBvbmx5IGZvciB0aGlzIGh1bmsgaGVyZS4KLURhbmllbAoKPiAg
ICAgICAgIGRybV9mb3JfZWFjaF9jcnRjKGNydGMsIGRldikgewo+ICAgICAgICAgICAgICAgICBp
ZiAoIShjcnRjLT5zdGF0ZS0+ZW5jb2Rlcl9tYXNrICYgZHJtX2VuY29kZXJfbWFzayhlbmNvZGVy
KSkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gLS0KPiBTZWFuIFBhdWws
IFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwo+CgoKLS0gCkRhbmllbCBW
ZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1
IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
