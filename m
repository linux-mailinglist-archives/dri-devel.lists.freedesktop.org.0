Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA95187E0
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 11:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60301893C9;
	Thu,  9 May 2019 09:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCF1893C9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 09:40:55 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id l25so1422547eda.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2019 02:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=BR38oErsk/dItdL6M1miiC1d9zOSYcNZ5BB74I3SsXQ=;
 b=j32cvpjUANtaJt0E+bRQq6bsbrxrfQfBSplhajo6GXu+W2KQrNCIKrE+N6/IHIZe3S
 PWho/y2m59isSr4NLF0AgzsfN1fgzyTyKlsdb0DgQnX/nnmGFpKbjiaBHlCu7pd1Cv8+
 nFO+0xWGuMQg5GuLyDp24DKf6+Tjjf2qLdf1I+KMwmdN6cHomA/JWcWGB0Fq0EhE01zw
 beZIqcD9r6XPZ8f9WK9pRGIfZheS8kxy337P2A19JarKgTV/la2FCLNqHvfJyA/cboIc
 X5E4B5p96nAXfRhoIf1nGD7VYYue4qV6plFQVIXo1PInkJoLEX30S+bhJHFnZniOlE11
 +jgw==
X-Gm-Message-State: APjAAAXCQv7QrHm2VfW+CzgEjAVIL6TeXawz2euzHrRpUttj9tbnXq+O
 bquH5bkUZKwf9hbjlIfW+DyqEw==
X-Google-Smtp-Source: APXvYqxvhdNkMtIcEJFRFW+xzenzKYavdm+Apq58TH04oI36m3kxejCB8iIaeOog2aTzGHy/vJogyA==
X-Received: by 2002:a50:a5ed:: with SMTP id b42mr2708006edc.178.1557394853775; 
 Thu, 09 May 2019 02:40:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id u11sm249030ejr.48.2019.05.09.02.40.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 02:40:52 -0700 (PDT)
Date: Thu, 9 May 2019 11:40:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm: Some ocd in drm_file.c
Message-ID: <20190509094050.GE17751@phenom.ffwll.local>
References: <20190502072727.32159-1-daniel.vetter@ffwll.ch>
 <20190502135603.20413-1-daniel.vetter@ffwll.ch>
 <155680604075.9023.3644212041279778396@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155680604075.9023.3644212041279778396@skylake-alporthouse-com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BR38oErsk/dItdL6M1miiC1d9zOSYcNZ5BB74I3SsXQ=;
 b=aoRPRny9Pdu0LLi5MTzD9ssmsaAswGNJs9pnwUxwvUf7xXTvZJKD3drRfnHlFk/8mW
 gqvHCNMKoSfgtPSqIlGaWTRuQpcYd7zh8XnZSCH2ERZRHPraX6GO/52syyDWpifNxOyE
 DV5U95Jau67tWK+8UHVyDI4GUr6/qBH+ZuRs4=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMDM6MDc6MjBQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOS0wNS0wMiAxNDo1NjowMykKPiA+IE1v
dmUgdGhlIG9wZW4gaGVscGVyIGFyb3VuZCB0byBhdm9pZCB0aGUgZm9yd2FyZCBkZWNsLCBhbmQg
Z2l2ZQo+ID4gZHJtX3NldHVwIGEgZHJtX2xlZ2FjeV8gcHJlZml4IHNpbmNlIGl0J3MgYWxsIGxl
Z2FjeSBzdHVmZiBpbiB0aGVyZS4KPiA+IAo+ID4gdjI6IE1vdmUgZHJtX2xlZ2FjeV9zZXR1cCBp
bnRvIGRybV9sZWdhY3lfbWlzYy5jIChDaHJpcykuIFRoZQo+ID4gY291bnRlcnBhcnQgaW4gdGhl
IGZvcm0gb2YgZHJtX2xlZ2FjeV9kZXZfcmVpbml0IGlzIHRoZXJlIGFscmVhZHkgdG9vLAo+ID4g
cGx1cyBpdCBmaXRzIHBlcmZlY3RseSBpbnRvIERhdmUncyB3b3JrIG9mIG1ha2luZyBEUklWRVJf
TEVHQUNZIGNvZGUKPiA+IGNvbXBpbGUtdGltZSBvcHRpb25hbC4KPiA+IAo+ID4gQ2M6IENocmlz
IFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBSZXZpZXdlZC1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpGaW5hbGx5IGdvdHRlbiBhcm91bmQg
dG8gYXNrIGZvciB0aGUgYmFja21lcmdlIHNvIEkgY2FuIGFwcGx5IHRoaXMuIFRoYW5rcwphIGxv
dCBmb3IgeW91ciByZXZpZXcuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
