Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA512AE485
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F43B89C6B;
	Tue, 10 Nov 2020 23:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF9A89C6B;
 Tue, 10 Nov 2020 23:58:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c9so165882wml.5;
 Tue, 10 Nov 2020 15:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sVHw44prgkhLl+wZoJDl9y1Sv84cjPWTxQBG3axW3YI=;
 b=Fgj/gQYKkyen7e5H6J7aIP6pfShNXewwImkCyWp5IXS9p6js8HtD5W/sdec1EctQ00
 5WN5HYbtFQqBafMliHQcbEaJ5G66ajncFFRYTrverGRb9lI763sgcJatSONy2h0alv/o
 DYAZ6dqOdCUYl7iyaxpVFHrV2EVAm6hc4QAplBckBzTV5ZFHYO7maZeikWJCNlB9Y/EY
 6BgucQPZOdHYc7N29acSZMaYUbOR6qMNBNTv7ZJskbiB8AmOmQUDcvORYf4PKv2b4Kmm
 PTDx56GqMRaiwmZnPs5P7/bNw7fKYjDdNq+D1QAXUTIAJkKU+Dhyn5BxtsamN+cgl1jH
 QeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sVHw44prgkhLl+wZoJDl9y1Sv84cjPWTxQBG3axW3YI=;
 b=O/DXzE0+ghGGJSsWqKHnoSFaaGRFET2F30W+wtX7g67mRQcMB/0jYGY4vd/LfhLpKk
 tPUhnWCJhQhjM7DkKSauSYVkyZeNGaNyRpYHPnWvOTJEb6DDtIBCuuCo4npe/SAxE5oM
 GNCSpZvOEvoBiWstH9weX6r+hmx9ljHAR6bI8VXK6mrUi1ihdZ56L1RaigNl0TY5v9zj
 rRT6Q7d1dNB+OEBsr2YF2rirc0C5os6MYEmmE3N3NMvoVhQhfXpSE8KGW8bB7Ln5sJFD
 6kySjYlEFJOfOcSfY3x2UB9PEOrDWW52XaAvxV4uPKrAfB0tM/JWLDR+gHHIgg0C/oRg
 CAnw==
X-Gm-Message-State: AOAM530s+Rj6OOSN+JYfRncZYKibqJT4ogxVVs+BDt2iLkhsgllYIxQK
 06FtAE7eaj7y2X+DTS/Hyp0lmO+G1ey97DDYMs8=
X-Google-Smtp-Source: ABdhPJwGVm8zxKOpbuvLzIOHTQhYo2DrNr+mXrvd1xPnYkBEHOZz9oYFfEfo+lAFTQEnLFs0aW5uGXu88lIbYUyf+QQ=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr639254wmi.70.1605052686774;
 Tue, 10 Nov 2020 15:58:06 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-15-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-15-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 18:57:55 -0500
Message-ID: <CADnq5_M28RPCQR27JXOiugvPPfHh2CnCedVFmBfkMb3kZ8RzzA@mail.gmail.com>
Subject: Re: [PATCH 14/30] drm/radeon/evergreen_dma: Fix doc-rot of function
 parameter 'resv'
To: Lee Jones <lee.jones@linaro.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2RtYS5jOjEx
Mjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncmVzdicgbm90IGRlc2Ny
aWJlZCBpbiAnZXZlcmdyZWVuX2NvcHlfZG1hJwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2
ZXJncmVlbl9kbWEuYzoxMTI6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2Zl
bmNlJyBkZXNjcmlwdGlvbiBpbiAnZXZlcmdyZWVuX2NvcHlfZG1hJwo+Cj4gQ2M6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWci
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1p
dCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6
IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxp
bmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
PgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vZXZlcmdyZWVuX2RtYS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2V2ZXJncmVlbl9kbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2RtYS5j
Cj4gaW5kZXggYTQ2ZWU2YzIwOTlkZC4uNzY3ODU3ZDRhOGM1YyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9kbWEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vZXZlcmdyZWVuX2RtYS5jCj4gQEAgLTk4LDcgKzk4LDcgQEAgdm9pZCBldmVyZ3Jl
ZW5fZG1hX3JpbmdfaWJfZXhlY3V0ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKPiAgICog
QHNyY19vZmZzZXQ6IHNyYyBHUFUgYWRkcmVzcwo+ICAgKiBAZHN0X29mZnNldDogZHN0IEdQVSBh
ZGRyZXNzCj4gICAqIEBudW1fZ3B1X3BhZ2VzOiBudW1iZXIgb2YgR1BVIHBhZ2VzIHRvIHhmZXIK
PiAtICogQGZlbmNlOiByYWRlb24gZmVuY2Ugb2JqZWN0Cj4gKyAqIEByZXN2OiByZXNlcnZhdGlv
biBvYmplY3Qgd2l0aCBlbWJlZGRlZCBmZW5jZQo+ICAgKgo+ICAgKiBDb3B5IEdQVSBwYWdpbmcg
dXNpbmcgdGhlIERNQSBlbmdpbmUgKGV2ZXJncmVlbi1jYXltYW4pLgo+ICAgKiBVc2VkIGJ5IHRo
ZSByYWRlb24gdHRtIGltcGxlbWVudGF0aW9uIHRvIG1vdmUgcGFnZXMgaWYKPiAtLQo+IDIuMjUu
MQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
