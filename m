Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BECCE17CECA
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 15:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30C36E21E;
	Sat,  7 Mar 2020 14:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02576E21E
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 14:40:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u12so1138936ljo.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2020 06:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NpfQrelGXNdszutFWCRt5fHftEarxUvrO31q2h6YT70=;
 b=lW/lsV/Fn0OWasEJlvrlwdiIKVTdgXhG5dKOM/GMdGV+g/e/RtZlQGiRN7qRbFeKRp
 An25vvyeiACfUYjFYE+oXXanXQKJuwfilPoUKWMhj1zfYWmlGqo4OVEaoWfDSMVgVmEl
 XvuCN0Pk15hW5TvC5bj7cbyMAfrNzvKtccLaDLgNkF5MM+zBxcrrRh5mMdXrrDppQUSt
 89PTrr4+hBlSKvRrqI4Oxy1aqzTs5RsNzX1kBMvoMC1GWviO0n+cRggOqfsGlfk5+yj5
 jnx7DQfWwjmEkf1NE0EpLvZOkkBInURaS9NS9VSUQf/R6PQtge2gW9wFc7kHls7f3ESG
 MkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NpfQrelGXNdszutFWCRt5fHftEarxUvrO31q2h6YT70=;
 b=UerTJZsiKOYYvaiUkJqeFExIXbCOrOitqxzPz2Oif7yhP+89PZWuO4BsW4vE0ZFng0
 fFTtTd5LpRgwWTsXW2XZH77xoUHJLpKjpspt1SiwxFAMFTU73WgqmPtBZ3YW7Bdf3iyF
 UW3ZVArp3M8SbB1AioPc3OxpPi5M5uTdkulqhideNLtPHfBUTesO/NgQsyejTJfL62KL
 XKOkdrBg9aMIhW9rNVoA/4I7GYefz8nlCCCXH9pkRlmohorD5NoMHlerOkBJSBbXhlf/
 0czscGcOZydVTx2K1hsvk9DoyUIShC1ySesKWJVuDFNLFBfLfqmta7ozATQwyUg3QnZ7
 GR/g==
X-Gm-Message-State: ANhLgQ2/TIQMnCQ8ysCgCLuPbLwG8aJjwzLwYjNkqMzQv2lrK4VwZt3p
 BpBIAo1jZa9wlQSDNDuy3VEWJhC4Lj3Ts0S2fINhZw==
X-Google-Smtp-Source: ADFU+vuwQk7GIk7fjeSMQQJHyn3VEctR5mnu5Hc0vPg/kyX6o+yeLAeLSaLVno24gnJp0dq9VSjTdPu5ifXvVes6ehw=
X-Received: by 2002:a05:651c:2049:: with SMTP id
 t9mr5090761ljo.39.1583592022111; 
 Sat, 07 Mar 2020 06:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-9-ville.syrjala@linux.intel.com>
In-Reply-To: <20200302203452.17977-9-ville.syrjala@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 7 Mar 2020 15:40:11 +0100
Message-ID: <CACRpkda-F4wN7dXVK6GrqPqf9EycLo0+=m7Ty5HXFnLmRUFkFQ@mail.gmail.com>
Subject: Re: [PATCH 08/33] drm/panel-sony-acx424akp: Fix dotclocks
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMiwgMjAyMCBhdCA5OjM1IFBNIFZpbGxlIFN5cmphbGEKPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IFRoZSBjdXJyZW50bHkgbGlzdGVkIGRvdGNs
b2NrcyBkaXNhZ3JlZSB3aXRoIHRoZSBjdXJyZW50bHkKPiBsaXN0ZWQgdnJlZnJlc2ggcmF0ZXMu
IENoYW5nZSB0aGUgZG90Y2xvY2tzIHRvIG1hdGNoIHRoZSB2cmVmcmVzaC4KPgo+IFNvbWVvbmUg
dGVsbCBtZSB3aGljaCAoaWYgZWl0aGVyKSBvZiB0aGUgZG90Y2xvY2sgb3IgdnJlcmVzaCBpcwo+
IGNvcnJlY3Q/Cj4KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3Jn
Pgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gU2lnbmVkLW9mZi1ieTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRoZXNlIGFy
ZSBiZXR0ZXIgdGhhbiB3aGF0IGlzIGN1cnJlbnRseSBpbiB0aGUgZHJpdmVyCmF0IGxlYXN0LCB3
ZSBkb24ndCBrbm93IHRoZSByZWFsIGRvdGNsb2Nrcy4gKE5vIGRhdGFzaGVldC4pClJldmlld2Vk
LWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGlu
dXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
