Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC0A33FA2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA74889622;
	Tue,  4 Jun 2019 07:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1724C89219;
 Mon,  3 Jun 2019 14:56:45 +0000 (UTC)
Received: by mail-it1-x143.google.com with SMTP id h20so27947041itk.4;
 Mon, 03 Jun 2019 07:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mDJyinIzAZyFYe2sQ1nvpl8lfVCu1z1DXV2UGQiSxUc=;
 b=fIciGz9Hx22g3eAh2VfUwKoi1TKlSCKseg1sJFEq+Se3u2gu/mSuAWXmRodoq8W63s
 ilL83gC0SbIY4deKHs/ZyyQgcJ8aEiR+9w77VLWIGVfhk4Q6ERDv2o7DlSo5uuzI5oO1
 CT70L/y4b5Ppke+8IQGgakgMceGFtmSVW4oy7EM3HmLnmqRfB/Bf0PsvbnRB1MI2iXj9
 F6K7OG3yrOuBkT4XBxrVdGhmaayvfC72DYylry5T/9sU7ra+kHXf8PB2EnmaVyKENDRE
 5Vsqxg7zG+cbzpD69YIcoDYVqLzRWcu0IhRpNurCVewtVAIE0bSWqnHmEMKfLPgOIfox
 Ma/A==
X-Gm-Message-State: APjAAAV+14jA/g81dI5TJhvO+M1uGymfT3J38eBIkvXq/u83BCeTohO5
 tSjlCgdWRb7MsT7Qf0jP/quwvK3VoVnWab5ANSQ=
X-Google-Smtp-Source: APXvYqyRg0Fg1qPHiU3BgdRlHNJ1G1zap/Jd1HuXxZCcEi4n2e10eRL07pYKaaPwzlSx5gUPRgdv2Ze3bkfZQ+Kxw5I=
X-Received: by 2002:a02:7121:: with SMTP id n33mr15499842jac.19.1559573804520; 
 Mon, 03 Jun 2019 07:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <1559340578-11482-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1559340578-11482-1-git-send-email-jcrouse@codeaurora.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 3 Jun 2019 08:56:33 -0600
Message-ID: <CAOCk7Nr9r3Spnvh9_CO2rh8vTAP3hHOXjBO=5oGS4CyS4hhNrQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: Ensure that the zap shader
 region is big enough
To: Jordan Crouse <jcrouse@codeaurora.org>
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mDJyinIzAZyFYe2sQ1nvpl8lfVCu1z1DXV2UGQiSxUc=;
 b=a1wKahOOGnjNUHH39gwKMWenzErmEXnVRogYkXZKiMyndol9pbe5Mjh/SqhbeE/KTP
 fCgpVR7pWXw2wcjjsfLS99pMCnnxY476MDc9Il2x1dX9l50B3vRkW2lFeJ1OqAmw6LQN
 S/+8dbRcWLBv5lKHe8YOb83okaxNB2S0HiDpbxspR7hQmr73oe65MqAo9h+3ZRmzAFkv
 Ha8V57jnONibXaUmNOoSxPSR6J5G1zEPYv9ynfPl6DOh4Ow+GzqKVPJ0XjQXsowSgs8u
 gz1S8r7YdoPya0Moors6iQjh0Jz+FjxN9AILw3UMxRU2vQOKhtx6URpGC79z4m71j9ML
 ZyTg==
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
Cc: Sean Paul <sean@poorly.run>, Kees Cook <keescook@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Mamta Shukla <mamtashukla555@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgNDowOSBQTSBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNv
ZGVhdXJvcmEub3JnPiB3cm90ZToKPgo+IEJlZm9yZSBsb2FkaW5nIHRoZSB6YXAgc2hhZGVyIHdl
IHNob3VsZCBlbnN1cmUgdGhhdCB0aGUgcmVzZXJ2ZWQgbWVtb3J5Cj4gcmVnaW9uIGlzIGJpZyBl
bm91Z2ggdG8gaG9sZCB0aGUgbG9hZGVkIGZpbGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb3JkYW4g
Q3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgoKUmV2aWV3ZWQtYnk6IEplZmZyZXkgSHVn
byA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgoKPiAtLS0KPgo+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMgfCA4ICsrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hZHJlbm9fZ3B1LmMKPiBpbmRleCA2ZjdmNDExLi4zZGI4ZTQ5IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYwo+IEBAIC02Nyw3ICs2Nyw2IEBAIHN0YXRpYyBp
bnQgemFwX3NoYWRlcl9sb2FkX21kdChzdHJ1Y3QgbXNtX2dwdSAqZ3B1LCBjb25zdCBjaGFyICpm
d25hbWUsCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiAgICAgICAgIG1lbV9waHlz
ID0gci5zdGFydDsKPiAtICAgICAgIG1lbV9zaXplID0gcmVzb3VyY2Vfc2l6ZSgmcik7Cj4KPiAg
ICAgICAgIC8qIFJlcXVlc3QgdGhlIE1EVCBmaWxlIGZvciB0aGUgZmlybXdhcmUgKi8KPiAgICAg
ICAgIGZ3ID0gYWRyZW5vX3JlcXVlc3RfZncodG9fYWRyZW5vX2dwdShncHUpLCBmd25hbWUpOwo+
IEBAIC04Myw2ICs4MiwxMyBAQCBzdGF0aWMgaW50IHphcF9zaGFkZXJfbG9hZF9tZHQoc3RydWN0
IG1zbV9ncHUgKmdwdSwgY29uc3QgY2hhciAqZnduYW1lLAo+ICAgICAgICAgICAgICAgICBnb3Rv
IG91dDsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgaWYgKG1lbV9zaXplID4gcmVzb3VyY2Vfc2l6
ZSgmcikpIHsKPiArICAgICAgICAgICAgICAgRFJNX0RFVl9FUlJPUihkZXYsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIm1lbW9yeSByZWdpb24gaXMgdG9vIHNtYWxsIHRvIGxvYWQgdGhlIE1E
VFxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IC1FMkJJRzsKPiArICAgICAgICAgICAgICAg
Z290byBvdXQ7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgLyogQWxsb2NhdGUgbWVtb3J5IGZv
ciB0aGUgZmlybXdhcmUgaW1hZ2UgKi8KPiAgICAgICAgIG1lbV9yZWdpb24gPSBtZW1yZW1hcCht
ZW1fcGh5cywgbWVtX3NpemUsICBNRU1SRU1BUF9XQyk7Cj4gICAgICAgICBpZiAoIW1lbV9yZWdp
b24pIHsKPiAtLQo+IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IEZyZWVkcmVubyBtYWlsaW5nIGxpc3QKPiBGcmVlZHJlbm9AbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9mcmVlZHJlbm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
