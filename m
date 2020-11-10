Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675792AE46A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E129D89D53;
	Tue, 10 Nov 2020 23:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1399289D52;
 Tue, 10 Nov 2020 23:52:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c16so176503wmd.2;
 Tue, 10 Nov 2020 15:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+5DnaoUF0p5jGghI91j7sY8mMsHYnXiRGnd6iIqVaCI=;
 b=BfO13MKXIQHCpL8tnKxxIwv+Q7ALe4KlLDC4/v3XD6yZgEgSrXris1Gqyd49dvnjvo
 xjGn5jmV6yyHGM+hhqcXzRVIrThhv6lCsUhHXALI4MnUGZ7fWKCPM3qZ5qhDbmn0ixyn
 Xj2gFmceiwJ0/sGZj0+5Vf/4KHoaboA5JZD6A5utOM9v7/JjFEVANMJjo723uO9R3rCl
 0843C2ZN8Py0VIkGHA4c/qMbKqV7hEyVvk6O4hdqARDw4rxxDms9iPCNTSGEXBJEhT7Z
 qolN5bUbvEyQjcTSso9WO5wwV5Gl0REaZoYJ1ltAx9P+dyLOWD2ClWjwrfU3AryYhGcY
 jMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+5DnaoUF0p5jGghI91j7sY8mMsHYnXiRGnd6iIqVaCI=;
 b=Ox3i2GkgkDpEFFnT334tGCCaPluhkPJOYvSVFFUYcWb7NfitzU2fnLdxm6kvsfLdGz
 u8pThDGJh868Fzabo0eDGqeSj+fKCmNeNaRxZQxFxCXpJ3OtQAiU6qAistgvJTkHC2iL
 JFIyip2Mti5A1xayfyn93CNhRr0cONCib1DOO2fVaWPooSOGFezss0l01dtiPvp3/J+M
 dRv1N1+gM5e8Ku99VM9EksCD0dBxtQCkwO4MP1WZGWvSgsAisFfwZpb/t8E5uy72A0Nu
 JbbEme5vbtV1Oi9jXt5a1lNo9kLWyS0Hk669zveIHXeIpjjBTIRtZwEirpp0DUWon8+Y
 k/TQ==
X-Gm-Message-State: AOAM532g3Lj3wbzivMeCwpFA0HWM1nJi2SXQZjkJfUHl+lmkR7jbWdnN
 CdRlgFK7sRv4P/VR5H8qWnYzE2/drnpVPz/Doys=
X-Google-Smtp-Source: ABdhPJyH7zLqqCWsjHjLSvt2XDyB2UJe1W2H+wypyxoMhN3QyfBm6hwmu+EpFhdllNTCpSZYDJFDNrYghMhR/8RTXzk=
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr587600wmd.73.1605052347807; 
 Tue, 10 Nov 2020 15:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-14-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-14-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 18:52:13 -0500
Message-ID: <CADnq5_MJQgyf_Xu+Qi-=6a9-V1x7YiVY0R+jWM7x_GvXxAdVhw@mail.gmail.com>
Subject: Re: [PATCH 13/30] drm/radeon/radeon_mn: Supply description for
 'cur_seq' even if it is unused
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX21uLmM6NTE6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2N1cl9zZXEnIG5vdCBkZXNjcmli
ZWQgaW4gJ3JhZGVvbl9tbl9pbnZhbGlkYXRlJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQgd2l0
aCBtaW5vciBmaXh1cC4gIFRoYW5rcyEKCkFsZXgKCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9tbi5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX21uLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9tbi5jCj4gaW5kZXggOTdiOWI2ZGQ2ZGQzYi4u
M2M0YzQyMTNhN2I1NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9tbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW4uYwo+IEBAIC00
MSw2ICs0MSw3IEBACj4gICAqCj4gICAqIEBtbjogb3VyIG5vdGlmaWVyCj4gICAqIEByYW5nZTog
dGhlIFZNQSB1bmRlciBpbnZhbGlkYXRpb24KPiArICogQGN1cl9zZXE6IHVudXNlZAo+ICAgKgo+
ICAgKiBXZSBibG9jayBmb3IgYWxsIEJPcyBiZXR3ZWVuIHN0YXJ0IGFuZCBlbmQgdG8gYmUgaWRs
ZSBhbmQKPiAgICogdW5tYXAgdGhlbSBieSBtb3ZlIHRoZW0gaW50byBzeXN0ZW0gZG9tYWluIGFn
YWluLgo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
