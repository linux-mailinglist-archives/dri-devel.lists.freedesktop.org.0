Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB464AEE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 18:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5001E898CC;
	Wed, 10 Jul 2019 16:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC946E0FC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 16:46:27 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w13so2841299eds.4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 09:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=uI+5nY7XDdUozZn2ePMYhLurWiDfFbelgLstEGLSrzU=;
 b=Mlklo8TxqcNPVvacYAfnJ/h5FlzOKRkQ++uhyXsgbJ+vuYLXsyD8kC5v8vKcJ3worL
 ZbI5XB0CT8y6ugWk+2iHirX1mM0quKXjcl20RquET0Suv3dX9Asi8d2tABHoLjrfntAO
 EbLoWnKK9PwpWDFag8R/g8ivylA0KvBhRepPmY7TD8RD7tS7IDyS3/L9Si7tsBYRo8x/
 FynQRpNPGd+ynm1lhqY0J1UjpakQenxUc4QHTTLwUzcm2rkWDk08Gs/lKlzDHIaJqYyh
 WCXrdl6dOyoaA2wZL/PSmidt0hKTaeWgU5Yso6youZSWA+xQf8XcOZjRP32K4u19IhCl
 5QmQ==
X-Gm-Message-State: APjAAAXXhL+4ZC6hEko6pzzUuHDvIQP1SFEHSf4iBqK9rZp0WXKxITd9
 ClpKOTJc7SH6JwhlRyx2c6p0nLf8Hfs=
X-Google-Smtp-Source: APXvYqx35KoS1Wn0RwEDuvd3T+zLAeKQdcZhzZWd4E0Y4NS5zUOWLNZfHnNlW68SKf8txrnyIHEBQA==
X-Received: by 2002:a50:b155:: with SMTP id l21mr31948432edd.186.1562777185813; 
 Wed, 10 Jul 2019 09:46:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x11sm625141eju.26.2019.07.10.09.46.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 09:46:25 -0700 (PDT)
Date: Wed, 10 Jul 2019 18:46:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH 0/2] drm/vkms: Use alpha value for blending
Message-ID: <20190710164622.GA15868@phenom.ffwll.local>
Mail-Followup-To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>, Simon Ser <contact@emersion.fr>,
 Oleg Vasilev <oleg.vasilev@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1562695974.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1562695974.git.rodrigosiqueiramelo@gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=uI+5nY7XDdUozZn2ePMYhLurWiDfFbelgLstEGLSrzU=;
 b=cAyGu57gbAQyE13Us/MLHPU4v7/XxDe2mavAEkjAhv5wVIt7cwMgbvQbCmNOq4Uhds
 jENjmnGzOLQq7AwZHeVRaB2yanqQRHyGxNQvXFYMvRFpGVslUyB61RxDdPlMC4TSlQIR
 OKq0ihnd6b82L5buDsdq9D49nYXqBveHF62Cs=
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, David Airlie <airlied@linux.ie>,
 Simon Ser <contact@emersion.fr>, Oleg Vasilev <oleg.vasilev@intel.com>,
 linux-kernel@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMTA6NTI6MDJQTSAtMDMwMCwgUm9kcmlnbyBTaXF1ZWly
YSB3cm90ZToKPiBUaGUgZmlyc3QgcGF0Y2ggb2YgdGhpcyBzZXJpZXMgcmV3b3JrcyBwYXJ0IG9m
IHRoZSBibGVuZCBmdW5jdGlvbiB0bwo+IGltcHJvdmUgdGhlIHJlYWRhYmlsaXR5IGFuZCBhbHNv
IGZvciBwcmVwYXJpbmcgaXQgZm9yIHVzaW5nIGFscGhhIHZhbHVlLgo+IFRoZSBzZWNvbmQgcGF0
Y2ggdXBkYXRlcyB0aGUgYmxlbmQgZnVuY3Rpb24gZm9yIGFwcGx5aW5nIGFscGhhIHZhbHVlIGZv
cgo+IGEgZnVsbHkgdHJhbnNwYXJlbnQgYmxlbmQuIEFmdGVyIGFwcGx5aW5nIHRoaXMgcGF0Y2hz
ZXQsCj4gcGlwZS1hLWN1cnNvci1hbHBoYS10cmFuc3BhcmVudCBpbiBrbXNfY3Vyc29yX2NyYyBz
dGFydCB0byBwYXNzLgoKTG9va2luZyBhdCB0aGUgc2VyaWVzIEkgd29uZGVyIHdoZXRoZXIgd2Ug
c2hvdWxkIGdvIHJpZ2h0IGFoZWFkIHRvCnJld29ya2luZyB0aGUgZW50aXJlIGNvbXBvc2VyIHBp
cGVsaW5lIHRvIGZ1dHVyZSBwcm9vZiBpdCBmb3IgbXVsdGlwbGUKcGxhbmVzIGFuZCBvdGhlciBw
aXhlbCBtb2Rlcy4gT3Igd2hldGhlciBlbmFibGluZyBhbHBoYSBibGVuZGluZyB3aXRoIHdoYXQK
d2UgaGF2ZSBub3cgaXMgYSBiZXR0ZXIgaWRlYSwgYnV0IHRoYXQgbWVhbnMgbW9yZSBjb21wbGlj
YXRlZCByZWZhY3RvcmluZwpsYXRlciBvbiAuLi4KCj4gVGhpcyBwYXRjaHNldCBkZXBlbmRzIG9u
Ogo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjE3MzgvCgpPayBJ
IGd1ZXNzIEkgbmVlZCB0byBsb29rIGF0IHRoaXMgb25lIGhlcmUgZmlyc3QuCi1EYW5pZWwKCj4g
Cj4gUm9kcmlnbyBTaXF1ZWlyYSAoMik6Cj4gICBkcm0vdmttczogUmV3b3JrIGJsZW5kIGZ1bmN0
aW9uCj4gICBkcm0vdmttczogVXNlIGFscGhhIGNoYW5uZWwgZm9yIGJsZW5kaW5nIGN1cnNvciB3
aXRoIHByaW1hcnkKPiAKPiAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jIHwg
NTQgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5z
ZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4yMS4wCgoKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
