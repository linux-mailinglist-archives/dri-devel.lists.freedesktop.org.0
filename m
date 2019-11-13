Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9245EFABB2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 09:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2DC6EC8F;
	Wed, 13 Nov 2019 08:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448D46EC8F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 08:05:21 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id 22so973743oip.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 00:05:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JslTrYXN6Ewdf+o6St9+Bkuya/XH+kh75GwvMmEbx8Q=;
 b=DL2MBXoZOQPA/KshLScSETB2wcylOXjEUT76YYMij+nJF+R/+Q0dJcedUjjYNz6iRf
 oK4t81be4pDTxb5mLhYInH6AJwqIizmqFtMCtCRuWN5+XFiVE4EMteAYLJMHZfr33209
 IJGPPDQ4TX+2NDi7LWFYjVsaVspW8DUkIaNA/PLU33zizVTaWkV+uEJwzgjIe1Tn38UB
 tcsdY/M6lUCqlG2jtXo+T3wptzut0GYVLxUiPpQamqaNIfmhMFwDYdYcaiiRzGbLQlHR
 WMUcrFp6JMuZagd15+3D20hPVDbxjzPzJpcd9U5//oGzvE8eqt9Gl4zdMyJMkZYbeBKs
 6Odg==
X-Gm-Message-State: APjAAAUt2bWH5cVylkFxYHWQ2zrdVlTMDIbmQigjqZVnGVvF99hh63P9
 V5oUf8J2DTbf9BKBkbEUXsKnqneFLKhpo7upOMFhug==
X-Google-Smtp-Source: APXvYqyK2sIGqZ4txSEqR+k0kuCZvu3rfV1ujBoMHLyXsmRoDzQyu4AunaSeyE9NqgVBXWEUe2fV4386QmD+Vy8J4xE=
X-Received: by 2002:aca:b805:: with SMTP id i5mr2048306oif.110.1573632320518; 
 Wed, 13 Nov 2019 00:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20191113013114.3013-1-james.qian.wang@arm.com>
In-Reply-To: <20191113013114.3013-1-james.qian.wang@arm.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 13 Nov 2019 09:05:08 +0100
Message-ID: <CAKMK7uHPcrCdkF7AJ06NzRR+hiR3O4seCCtRUf-wO1Y0NF2g2g@mail.gmail.com>
Subject: Re: [PATCH] drm/komeda: Fix komeda driver build error
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JslTrYXN6Ewdf+o6St9+Bkuya/XH+kh75GwvMmEbx8Q=;
 b=GQfp6xnVk0n/cJ7bWh6QAh/hrul+TgbrnOke2VK971tmcYMTRG/ZhTQ49Pvfyk016A
 ylabNCbx3K0BvCVI/uHqCGweUuuiX+WBQtSS4cVaKjYrYpwaJ9dCytbYtg80KlqetT7W
 PMIPUhFLjc5UP5p2bL31jKbAzu2cztamyCsB0=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMjozMiBBTSBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKQo8amFtZXMucWlhbi53YW5nQGFybS5jb20+IHdyb3RlOgo+Cj4gRml4IHRo
ZSBidWlsZCBlcnJvcnMgbGVhZCBieQo+Cj4gJ2NvbW1pdCA0MDM5ZjAyOTNiYmQgKCJkcm0va29t
ZWRhOiBBZGQgb3B0aW9uIHRvIHByaW50IFdBUk4tIGFuZCBJTkZPLWxldmVsIElSUSBldmVudHMi
KScKPgo+IFNpZ25lZC1vZmYtYnk6IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hp
bmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKUGxlYXNlIGFsc28gcmUtZW5hYmxlIHRoZSBrb21k
ZSBkcml2ZXIgKGluY2x1ZGluZyBhbGwgb3B0aW9ucykgaW4gYWxsCnRoZSBkZWZjb25maWdzIGlu
IGRybS1yZXJlcmUuIEFuZCBtYXliZSB0eXBlIHNvbWUgc2NyaXB0cyB0byBjb21waWxlCnRlc3Qg
YmVmb3JlIHB1c2hpbmcgOi0pCi1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAo+IGluZGV4IDE1ZjUyZTMwNGMwOC4uZDQw
NmE0ZDgzMzUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2Rldi5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmgKPiBAQCAtNTEsMTIgKzUxLDEyIEBACj4KPiAgI2RlZmluZSBLT01FREFf
V0FSTl9FVkVOVFMgICAgIEtPTUVEQV9FUlJfQ1NDRQo+Cj4gLSNkZWZpbmUgS09NRURBX0lORk9f
RVZFTlRTICh7MCBcCj4gKyNkZWZpbmUgS09NRURBX0lORk9fRVZFTlRTICgwIFwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCBLT01FREFfRVZFTlRfVlNZTkMgXAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IEtPTUVEQV9FVkVOVF9GTElQIFwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCBLT01FREFfRVZFTlRfRU9XIFwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCBLT01FREFfRVZFTlRfTU9ERSBcCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
IH0pCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICkKPgo+ICAvKiBtYWxpZHAgZGV2aWNl
IGlkICovCj4gIGVudW0gewo+IC0tCj4gMi4yMC4xCj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
