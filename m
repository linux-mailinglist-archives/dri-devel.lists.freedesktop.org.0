Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35172EFA01
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAABC6E8DE;
	Fri,  8 Jan 2021 21:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0D66E8DE;
 Fri,  8 Jan 2021 21:12:51 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id n42so11006809ota.12;
 Fri, 08 Jan 2021 13:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JJ7FtiwBdYxXEh8WTGbXJJZhJ5AF6r7OSPZfRoUJmbA=;
 b=LV850xJ1SGbsWlLhv8SIykiIbw9fs5VaMD9pKjRweE8Eti1DFJv2/pk8tcISWTigx8
 MPAV5GXtXuwPzojP3r96HnS2qqufjcMoO+vhcC2T8rP6IFqhacZKP0ieAzAxsT3VALtG
 KrPnaNQAk9Qifjv0mXajdpUq7t8eywv+W6CxHg2wfk3IKD/67Fwm82YSrlcJe1DS7dZ6
 EZU8HZbJ91JNYwsecSSDy/Lfj6TsP/amSBMKbrmXPV1USYh1051n9tc5yvW9ee7Mn73j
 ohrKl34VSC9m4ehA9cI+Ai8ZFoKtA+TKOBNaPA7bp890zfyPVOdjLpi3UWGm0tNb8A8a
 +ZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JJ7FtiwBdYxXEh8WTGbXJJZhJ5AF6r7OSPZfRoUJmbA=;
 b=GmLVzF2xhbGzcGy5rZ1NDWMcvLq4Pet7nJhPFqjtaDaHaIzIt4WuuroLq2mJ0e1N+j
 bw/5MBJ9qphJ3ITokxIuO8u7ctdzFiTdOyocP1u/0u+ti5nCtBohGq097vQxBFrdjkEu
 JNovHw9se/6dSNYKqrLvFV8tAK3tjUyTR1W3HNLd7h8ZnpTBR+UB9FEblzik6nhyBgxf
 BdU5G+NBASLKzqQzsIpo+mEna0+nUHT36Ipda0gdqBRIeCPQ/Z5jTOWkhvPe8KeIo9sk
 UKWFQuK0PqIuwXocVSYoqisqAaEBo0mjpZjmIeo3sA+zPG25iSZa0aCgDQJzqPixRtBR
 Y78A==
X-Gm-Message-State: AOAM530qexPDggDmr8WXK/jd4wgbpWyj3XeJICky0sPKbf0Wes5UHIWt
 uDQfAnmiuwaxPHLHhxg1Msm2db5yBIg8uBKIry8=
X-Google-Smtp-Source: ABdhPJzrBa4Bvb1LKElVzhupUsk6Q/8zoZrXDIzXdCWtWEIJ1Yta2gOeFScrPIl0sOQKAISGtTXXGlnj+i16KlyBjds=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr4077667ote.132.1610140370752; 
 Fri, 08 Jan 2021 13:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-25-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-25-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:12:39 -0500
Message-ID: <CADnq5_NMmop3fFb3vy1QS_wEjNCmwkzjn+aTMd0S45GkKpiCpw@mail.gmail.com>
Subject: Re: [PATCH 24/40] drm/amd/display/dc/dce/dce_stream_encoder: Remove
 unused variable 'regval'
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Eric Bernstein <eric.bernstein@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 George Shen <george.shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
Y2UvZGNlX3N0cmVhbV9lbmNvZGVyLmM6IEluIGZ1bmN0aW9uIOKAmGRjZTExMF91cGRhdGVfZ2Vu
ZXJpY19pbmZvX3BhY2tldOKAmToKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kY2UvZGNlX3N0cmVhbV9lbmNvZGVyLmM6NzA6MTE6IHdhcm5pbmc6IHZhcmlhYmxl
IOKAmHJlZ3ZhbOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxl
XQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IEdlb3JnZSBTaGVuIDxnZW9yZ2Uu
c2hlbkBhbWQuY29tPgo+IENjOiBFcmljIEJlcm5zdGVpbiA8ZXJpYy5iZXJuc3RlaW5AYW1kLmNv
bT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2VuY29kZXIuYyB8IDMgKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9zdHJlYW1fZW5j
b2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2Vu
Y29kZXIuYwo+IGluZGV4IGFkYTU3Zjc0NWZkNzYuLjI2NWVhZWYzMGE1MTkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2VuY29kZXIu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX3N0cmVhbV9l
bmNvZGVyLmMKPiBAQCAtNjcsNyArNjcsNiBAQCBzdGF0aWMgdm9pZCBkY2UxMTBfdXBkYXRlX2dl
bmVyaWNfaW5mb19wYWNrZXQoCj4gICAgICAgICB1aW50MzJfdCBwYWNrZXRfaW5kZXgsCj4gICAg
ICAgICBjb25zdCBzdHJ1Y3QgZGNfaW5mb19wYWNrZXQgKmluZm9fcGFja2V0KQo+ICB7Cj4gLSAg
ICAgICB1aW50MzJfdCByZWd2YWw7Cj4gICAgICAgICAvKiBUT0RPRlBHQSBGaWd1cmUgb3V0IGEg
cHJvcGVyIG51bWJlciBmb3IgbWF4X3JldHJpZXMgcG9sbGluZyBmb3IgbG9jawo+ICAgICAgICAg
ICogdXNlIDUwIGZvciBub3cuCj4gICAgICAgICAgKi8KPiBAQCAtOTksNyArOTgsNyBAQCBzdGF0
aWMgdm9pZCBkY2UxMTBfdXBkYXRlX2dlbmVyaWNfaW5mb19wYWNrZXQoCj4gICAgICAgICB9Cj4g
ICAgICAgICAvKiBjaG9vc2Ugd2hpY2ggZ2VuZXJpYyBwYWNrZXQgdG8gdXNlICovCj4gICAgICAg
ICB7Cj4gLSAgICAgICAgICAgICAgIHJlZ3ZhbCA9IFJFR19SRUFEKEFGTVRfVkJJX1BBQ0tFVF9D
T05UUk9MKTsKPiArICAgICAgICAgICAgICAgUkVHX1JFQUQoQUZNVF9WQklfUEFDS0VUX0NPTlRS
T0wpOwo+ICAgICAgICAgICAgICAgICBSRUdfVVBEQVRFKEFGTVRfVkJJX1BBQ0tFVF9DT05UUk9M
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQUZNVF9HRU5FUklDX0lOREVYLCBw
YWNrZXRfaW5kZXgpOwo+ICAgICAgICAgfQo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
