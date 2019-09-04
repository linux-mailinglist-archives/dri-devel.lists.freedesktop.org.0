Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E287A92DA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 22:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB1B89BFB;
	Wed,  4 Sep 2019 20:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56BF89BFB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 20:13:50 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id l20so35327ljj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 13:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ud0c3+VnNjZyr2RptFooqxhzh0UG3Qg2GpWXzSbedHQ=;
 b=LTxhWbZPqiR/5iQH1YwdEJczh+mTGznyod13Kxo1sj2WlxAVaGzai8aOKlSTLraJJN
 upBCO2cJz2RC3PZoH1xDMPHxw5s7a88O9t6+k0/d62TLsfZ2+wxNb+wCBrHbwl2peEE+
 YcDYSZXR230HAEQnxSHSH/MZxgexX0IAmBhMJYvf/2S3JAqdXMRzlPmTlReJS03bLO1u
 rm0IRUiyEezAuRApqdX4dwX/kskjd9vXJbhjFgtDKD3iE1+24dGFct0A8jCSRSLwiBMf
 Ji59+b7arju6rSyMOCKshnutcYzt3O5YzzGmk1yom5q1NCyrYOJlxD3hTVJS4ME5eIH0
 3QDA==
X-Gm-Message-State: APjAAAV+ngEVdvYvwrPFiM3yrvM8pFVjDrk6kGJu0Qvarm4wlrk9AFLY
 5/fW4iVrDLwZNTG+TttU7eVyv+93A4WLA4E77Ri1yQ==
X-Google-Smtp-Source: APXvYqyNxKTrxj4S0+5qnBUiRcoXjoVOzivC0xXgFW52GJunMDI5gVv8XlB25y8JsHXVCi+agcrp4Ywz75tnILXzuiU=
X-Received: by 2002:a2e:a408:: with SMTP id p8mr4032277ljn.54.1567628029379;
 Wed, 04 Sep 2019 13:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190904132804.29680-1-laurent.pinchart@ideasonboard.com>
 <20190904132804.29680-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20190904132804.29680-2-laurent.pinchart@ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Sep 2019 22:13:37 +0200
Message-ID: <CACRpkdYW30=hBYjZzbWA=0VhV+3tHvbEsOPFcpPDbhYZHRGbvw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/panel: Add and fill drm_panel type field
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ud0c3+VnNjZyr2RptFooqxhzh0UG3Qg2GpWXzSbedHQ=;
 b=xbsAOheJxzIWQ2/Q1gC986ZX7kYl11xPZQBwt0oaHm+Oi/fH+es3+RGAb8RlN7Bu8K
 CmA8Wck0q3kjEXoIFEq/HysKUzf9JRvB2uqAw4whX8of9eI2jWGoVjIqraWCBtEXr3yg
 ed6/vF81IpGkSzFIhos7Ps1+Ov5o2Vp1VwLV1I1/LLMD8Z6XtbhSuaFiZk93CbkTPmdw
 mb1Pcbyz2lFa1Elorc0ydYuA4eiPDjvvzagXiHFWPp0S+UO+BOHfjf/oavk4WR811qyY
 dZ3I4vWIamwIrbBuQFuG0zPKmUlHDyD9UannMemFqPBP0qUV/bMExEM/7KAdlo665mKi
 nFHQ==
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
Cc: Purism Kernel Team <kernel@puri.sm>, Stefan Mavrodiev <stefan@olimex.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAzOjI4IFBNIExhdXJlbnQgUGluY2hhcnQKPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cgo+IEFkZCBhIHR5cGUgZmllbGQgdG8g
dGhlIGRybV9wYW5lbCBzdHJ1Y3R1cmUgdG8gcmVwb3J0IHRoZSBwYW5lbCB0eXBlLAo+IHVzaW5n
IERSTV9NT0RFX0NPTk5FQ1RPUl8qIG1hY3JvcyAodGhlIHZhbHVlcyB0aGF0IG1ha2Ugc2Vuc2Ug
YXJlIExWRFMsCj4gZURQLCBEU0kgYW5kIERQSSkuIFRoaXMgd2lsbCBiZSB1c2VkIHRvIGluaXRp
YWxpc2UgdGhlIGNvcnJlc3BvbmRpbmcKPiBjb25uZWN0b3IgdHlwZS4KPgo+IFVwZGF0ZSBhbGwg
cGFuZWwgZHJpdmVycyBhY2NvcmRpbmdseS4gVGhlIHBhbmVsLXNpbXBsZSBkcml2ZXIgb25seQo+
IHNwZWNpZmllcyB0aGUgdHlwZSBmb3IgdGhlIGtub3duIHRvIGJlIExWRFMgcGFuZWxzLCB3aGls
ZSBhbGwgb3RoZXIKPiBwYW5lbHMgYXJlIGxlZnQgYXMgdW5rbm93biBhbmQgd2lsbCBiZSBjb252
ZXJ0ZWQgb24gYSBjYXNlLWJ5LWNhc2UKPiBiYXNpcyBhcyB0aGV5IGFsbCBuZWVkIHRvIGJlIGNh
cmVmdWxseSByZXZpZXdlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBSZXZpZXdlZC1ieTogQm9yaXMgQnJl
emlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHNp
bmNlIHYyOgoKQ2hlY2tlZCB0aGUgcGFuZWxzIEkndmUgd29ya2VkIG9uIGFuZCB0aGV5IGFsbCBz
ZWVtIGNvcnJlY3QKc286ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
