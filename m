Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 882DC35F7BB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C996E93F;
	Wed, 14 Apr 2021 15:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AA96E93F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 15:37:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k26so3898911wrc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 08:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1hAkF6uQknso9XK+xsWSjedRJvb6wjAXtp/pbQAjABE=;
 b=EvX3F8wO1sVldTauDFFkVpHnThxjQp+z/IkvzXEQlX1pe40orPGvmbYEKeev2z+7Xc
 6BG2jtNbebgSQjRufagQS4F2IrG4IJOUSDJ5Se5ym7MyK8nRTwgtBUJB3euNfAbtL8Mi
 3Vpw5zjhTaxCpI4+hshvjuHlM2LBqWLcRsY7WsaZl4y4yy1DNZuKHCP9e+iwqpYX76LG
 7okaxva6gHCE/vCv4OhQRnY+Vhz2c648Ss1qAi4NJ7HL8nYiLjA3llfQK8dhwRJjl63M
 YeDsb98l5Tz883pquuOdsW1dsCDdZWP4v5s4aR3m5fH3n7E2ZiIGqMQA2xjPF/pJ4Syu
 ErJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1hAkF6uQknso9XK+xsWSjedRJvb6wjAXtp/pbQAjABE=;
 b=R5wpKAA63rjeiARbqo07GrzfsAa5DKGzIMDbvQEjn9sQY6LO200P7KpJ3X9Z9y8qIM
 jPnmcCXPvqaPSwphnJ9O47AaDXYFJkuZ1OlDj4Kfy7vLpQ6vIbloGnhlvgZigrZAMhnU
 P99waSvLUkH351t+gYc46Dr612hwjp/oNk3Bzqkj1Pez2ZJO4ZlxRWNJxvqITQXRyAsR
 IieFIAyb1FVll0Tt4y8HZ2fQhZlB0Lr2l9djkEMDr4OcOT4CV4bMIwh66myNPYiE5Cop
 kz8hSHdP+1DH1sY09QIW03G9kBdBGkmN/crl9Cv/sv/aubqrqjkDqmaVncKQ+3nYx//W
 8tOg==
X-Gm-Message-State: AOAM532AEFbim20spkcS0Zyj8edAguCB718ySi6UcgvV7+/i5hvzEiLq
 avxuznuOb60LdVCvUpSMdlh33A==
X-Google-Smtp-Source: ABdhPJzIeSQmioyjZMS7P6mdUfGqW8tzHZ3e0kdnEp/GlBwX30sKpco/2AkaSWNywQiFZUQ3AITpmA==
X-Received: by 2002:adf:ec47:: with SMTP id w7mr13876075wrn.178.1618414642498; 
 Wed, 14 Apr 2021 08:37:22 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:49d:95f:49d5:fff7?
 ([2a01:e0a:90c:e290:49d:95f:49d5:fff7])
 by smtp.gmail.com with ESMTPSA id g3sm15176270wrp.46.2021.04.14.08.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 08:37:21 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] drm: bridge: add it66121 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
 <20210412154648.3719153-3-narmstrong@baylibre.com>
 <CAG3jFysFb+y6ymXsBQatuwtPEYRTBnWTku0EpmNyR2gR5a=Y2w@mail.gmail.com>
 <3266977b-9d19-c81d-6fd7-b6fa0714b1ef@baylibre.com>
 <CAG3jFysp+3__TfEyvKSf47q3nYsdRSbkb9LxX2pcJr356yAgKw@mail.gmail.com>
 <911c73a8-47e8-0bae-2bdd-9eb217b25094@baylibre.com>
 <YHak0zr0o0thq/fu@pendragon.ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9f7e7ca9-5c34-91cc-07ab-1a65caf92eac@baylibre.com>
Date: Wed, 14 Apr 2021 17:37:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHak0zr0o0thq/fu@pendragon.ideasonboard.com>
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
Cc: Phong LE <ple@baylibre.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, paul@crapouillou.net,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDQvMjAyMSAxMDoxNiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBOZWlsLAo+
IAo+IE9uIFdlZCwgQXByIDE0LCAyMDIxIGF0IDEwOjA4OjQ2QU0gKzAyMDAsIE5laWwgQXJtc3Ry
b25nIHdyb3RlOgo+PiBPbiAxNC8wNC8yMDIxIDEwOjA2LCBSb2JlcnQgRm9zcyB3cm90ZToKPj4+
IE9uIFdlZCwgMTQgQXByIDIwMjEgYXQgMDg6MTMsIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25n
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4+Pj4gTGUgMTMvMDQvMjAyMSDDoCAyMjoyMSwgUm9iZXJ0
IEZvc3MgYSDDqWNyaXQgOgo+Pj4+PiBIZXkgTmVpbCAmIFBob25nLAo+Pj4+Pgo+Pj4+PiBUaGFu
a3MgZm9yIHN1Ym1pdHRpbmcgdGhpcyBzZXJpZXMhCj4+Pj4+Cj4+Pj4+PiArCj4+Pj4+PiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIGl0NjYxMjFfYnJpZGdlX2Z1bmNzID0g
ewo+Pj4+Pj4gKyAgICAgICAuYXR0YWNoID0gaXQ2NjEyMV9icmlkZ2VfYXR0YWNoLAo+Pj4+Pj4g
KyAgICAgICAuZW5hYmxlID0gaXQ2NjEyMV9icmlkZ2VfZW5hYmxlLAo+Pj4+Pj4gKyAgICAgICAu
ZGlzYWJsZSA9IGl0NjYxMjFfYnJpZGdlX2Rpc2FibGUsCj4+Pj4+PiArICAgICAgIC5tb2RlX3Nl
dCA9IGl0NjYxMjFfYnJpZGdlX21vZGVfc2V0LAo+Pj4+Pj4gKyAgICAgICAubW9kZV92YWxpZCA9
IGl0NjYxMjFfYnJpZGdlX21vZGVfdmFsaWQsCj4+Pj4+PiArICAgICAgIC5kZXRlY3QgPSBpdDY2
MTIxX2JyaWRnZV9kZXRlY3QsCj4+Pj4+PiArICAgICAgIC5nZXRfZWRpZCA9IGl0NjYxMjFfYnJp
ZGdlX2dldF9lZGlkLAo+Pj4+Pj4gKyAgICAgICAuYXRvbWljX2dldF9vdXRwdXRfYnVzX2ZtdHMg
PSBpdDY2MTIxX2JyaWRnZV9hdG9taWNfZ2V0X291dHB1dF9idXNfZm10cywKPj4+Pj4+ICsgICAg
ICAgLmF0b21pY19nZXRfaW5wdXRfYnVzX2ZtdHMgPSBpdDY2MTIxX2JyaWRnZV9hdG9taWNfZ2V0
X2lucHV0X2J1c19mbXRzLAo+Pj4+Pj4gK307Cj4+Pj4+Cj4+Pj4+IEkgd291bGQgbGlrZSB0byBz
ZWUgYW4gaW1wbGVtZW50YXRpb24gb2YgSFBELCBzaW5jZSBpdCBpcyBzdXBwb3J0ZWQgYnkKPj4+
Pj4gdGhlIGhhcmR3YXJlWzFdIChhbmQgcmVxdWlyZWQgYnkgdGhlIGRvY3VtZW50YXRpb24pLiBJ
UlEgc3RhdHVzIGJpdCAwCj4+Pj4+IHNlZW1zIHRvIGJlIHRoZSByZXNwb25zaWJsZSBmb3Igbm90
aWZ5aW5nIHVzIGFib3V0IGhvdCBwbHVnIGRldGVjdGlvbgo+Pj4+PiBldmVudHMuCj4+Pj4KPj4+
PiBJdCdzIGltcGxlbWVudGVkIGluIHRoZSBJUlEgaGFuZGxlciB3aXRoIHRoZSBJVDY2MTIxX0lO
VF9TVEFUVVMxX0hQRF9TVEFUVVMgZXZlbnQuCj4+Pgo+Pj4gSSBkaWRuJ3QgZXZlbiBnZXQgdGhh
dCBmYXIgOikKPj4+Cj4+PiBFaXRoZXIgd2F5LCB0aGUgSFBEIHN1cHBvcnQgc2hvdWxkIGJlIGV4
cG9zZWQgaW4gZHJtX2JyaWRnZV9mdW5jcwo+Pj4gKC5ocGRfZW5hYmxlLCAuaHBkX2Rpc2FibGUg
KGFuZCBwb3NzaWJseSAuaHBkX25vdGlmeSkpIGFuZAo+Pj4gZHJtX2JyaWRnZS5vcHMgKERSTV9C
UklER0VfT1BfSFBEKS4KPj4KPj4gSW5kZWVkIEkgZm9yZ290IHRoZXNlIGNhbGxzIGluIHRoZSBO
T19DT05ORUNUT1IgaW1wbGVtZW50YXRpb24uLi4KPiAKPiBGb3IgbmV3IGJyaWRnZXMsIHlvdSBz
aG91bGQgbm8gaW1wbGVtZW50IGNvbm5lY3RvciBjcmVhdGlvbiwgb25seSB0aGUKPiBEUk1fQlJJ
REdFX0FUVEFDSF9OT19DT05ORUNUT1IgY2FzZSBzaG91bGQgYmUgc3VwcG9ydGVkLgo+IAoKUmln
aHQsIHRpbWUgdG8gbWFrZSBhIGNsZWFuIGJyaWRnZS1vbmx5IGltcGxlbWVudGF0aW9uIHRoZW4g
IQoKVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrcywKCk5laWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
