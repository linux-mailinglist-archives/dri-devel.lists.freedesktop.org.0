Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E115925A657
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 09:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61846E90D;
	Wed,  2 Sep 2020 07:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A056E90D;
 Wed,  2 Sep 2020 07:21:34 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w2so3341157wmi.1;
 Wed, 02 Sep 2020 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=r7LzkU3H2bEVPdabvDYiZUZVesK7/CEy36kCet7lwYk=;
 b=nswL8jsGgDy1Tbvq80ozYCpk9VR9Pp+8eaR9AYdROzlYNFpIVIu5FLwQUaTIWYSQ9V
 s8ZXpcHHDyaBvjuD4Resd4RkUdhpzUm7ZLQ3obrLE/BiNrwFsu9LHhBedsX6TbKWkSl+
 bGIGb6SC1IU4uLicBWqEvgLB8690sNz9pogFVdOQxC/z0Cz4ila2kOf0kBN1mFvOTHbu
 HnbiNVw/IMA4SgN8PYxsL/dE1CPTopzKrX+kKOpkMiSMtYxnsaIWO78Sowr5VjND1Rvj
 qcHVbU+W4I1YAXydXocthpso/Wux0bvk/X8ZF6CahsTKJMI/o39YjiN6Vwcjrk9PfPFU
 a3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=r7LzkU3H2bEVPdabvDYiZUZVesK7/CEy36kCet7lwYk=;
 b=HSmKeLn4QNRPk4n8/hqFjU+lq4nuBJF+oYnBsSKHTaw9xkTBRRK7YKfMPlYiFAQP5c
 QhNsPeDWyOctDlynH0lYaxfoBwwhpcifS5jY2EJv3ylt3nOq5LjN8eMrOy8IVrghdDeB
 zMWP03p6s+5C2OL4LcSzTkoR6mmJk0O/b0cia/nM+D3XFmrrMBh8A+LGJCF4WyT7q5qo
 aLwptCf8Qb5bjVG3T571ZcUiQFTtr+seqqyckhwNqIxEToqSXKNDJzEDc9gzexx7YKN/
 wlPW7OuHJRnVupr94fSxwxZoQwDneQDiFrrjVEHPkqvYRRVgl7yK5FcQ+xTdhDWpA6zm
 hrDw==
X-Gm-Message-State: AOAM53320iQUuAeyDdpK3B2EP3J0WR+QRSZdLK0raIdjUwUtI6t7iGot
 A1gFC4LCTNOKUvjbQGkPn+7AKY7P6LA=
X-Google-Smtp-Source: ABdhPJw3wXzD8FsQnYiii0CjRfpQuYw7RSlE3+BcpwBZNm6rkIjAFORsQ0KEtXZXIVrCKXKRyKriMw==
X-Received: by 2002:a05:600c:2053:: with SMTP id
 p19mr5325764wmg.50.1599031293225; 
 Wed, 02 Sep 2020 00:21:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 21sm6195725wrc.55.2020.09.02.00.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 00:21:32 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm/amdgpu: Remove superfluous NULL check
To: Daniel Vetter <daniel@ffwll.ch>, Luben Tuikov <luben.tuikov@amd.com>
References: <20200902010645.26943-1-luben.tuikov@amd.com>
 <20200902010645.26943-4-luben.tuikov@amd.com>
 <20200902065905.GG2352366@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9398b45d-2b38-2ac5-1afa-a43c2b7774e2@gmail.com>
Date: Wed, 2 Sep 2020 09:21:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902065905.GG2352366@phenom.ffwll.local>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Alexander Deucher <Alexander.Deucher@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDIuMDkuMjAgdW0gMDg6NTkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgU2Vw
IDAxLCAyMDIwIGF0IDA5OjA2OjQ1UE0gLTA0MDAsIEx1YmVuIFR1aWtvdiB3cm90ZToKPj4gVGhl
IERSTSBkZXZpY2UgaXMgYSBzdGF0aWMgbWVtYmVyIG9mCj4+IHRoZSBhbWRncHUgZGV2aWNlIHN0
cnVjdHVyZSBhbmQgYXMgc3VjaAo+PiBhbHdheXMgZXhpc3RzLCBzbyBsb25nIGFzIHRoZSBQQ0kg
YW5kCj4+IHRodXMgdGhlIGFtZGdwdSBkZXZpY2UgZXhpc3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+Cj4gT24gdGhpcyBwYXRjaCwgYnV0
IG5vdCB0aGUgb3RoZXIgdHdvIGVhcmxpZXIgaW4gdGhpcyBzZXJpZXM6Cj4KPiBBY2tlZC1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPgo+PiAtLS0KPj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAzIC0tLQo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jCj4+IGluZGV4IGM0OTAwNDcxYmViMC4uNmRjYzI1NmI5ZWJjIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMK
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4+IEBA
IC0zNDcxLDkgKzM0NzEsNiBAQCBpbnQgYW1kZ3B1X2RldmljZV9zdXNwZW5kKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIGJvb2wgZmJjb24pCj4+ICAgCXN0cnVjdCBkcm1fY29ubmVjdG9yX2xpc3Rf
aXRlciBpdGVyOwo+PiAgIAlpbnQgcjsKPj4gICAKPj4gLQlpZiAoIWRldikKPj4gLQkJcmV0dXJu
IC1FTk9ERVY7Cj4+IC0KPj4gICAJYWRldiA9IGRybV90b19hZGV2KGRldik7CgpNYXliZSB0aGlz
IGNvdWxkIG5vdyBldmVuIGZpdCBpbnRvIHRoZSBkZWNsYXJhdGlvbiBvZiBhZGV2LgoKQnV0IGVp
dGhlciB3YXkgQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4uCgpDaHJpc3RpYW4uCgo+PiAgIAo+PiAgIAlpZiAoZGV2LT5zd2l0Y2hfcG93ZXJfc3Rh
dGUgPT0gRFJNX1NXSVRDSF9QT1dFUl9PRkYpCj4+IC0tIAo+PiAyLjI4LjAuMzk0LmdlMTk3MTM2
Mzg5Cj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
