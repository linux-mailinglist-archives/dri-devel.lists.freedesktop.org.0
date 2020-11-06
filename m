Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2C32A9097
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 08:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86196E10F;
	Fri,  6 Nov 2020 07:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4FF6E10F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 07:43:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 33so257898wrl.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 23:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=WJgh+HBEsu1L1fjOdFQAJ5Y/gWjpi18ppr+5ULtL5qQ=;
 b=wRDfZ8rBweH6dZ5gW8C9cmrOxkAd2nBXFXxmFIdONmPF89lhHUhKrhTu3ada4fz+q/
 fckGDjsSMIJoJssQ7RTW3mhwSDrviDIeCMKuBCu2IwbDD/KW/3xs6ghyECza8Jmv4tIM
 lm/FLIn76J4Ie742EwKk51fWMP5gmc6tU8FR+rN9Es6s+5Cet/6i3G+YtRi7B9t7l0BZ
 uIJwoSascDCM1zFXXc6T10nWceHAH04y8C5h7HJvVt+DPKyGvdRsDxjMSdUy3lSiZvXz
 c098BK105g5fxqaJXxP9jGlpXOv1mOxif4FBMmTaHwyYaosQ+AXYjZqnKRk/RE4FJ+OZ
 xxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WJgh+HBEsu1L1fjOdFQAJ5Y/gWjpi18ppr+5ULtL5qQ=;
 b=aUbaYaIwTvD9BmPyFzHHcX7z9ODojs1Gk2Ypmg0kRFmRWlAqh2vpTInbWeLn9MNAnL
 EUSgjzfXxinaRVP3VpkmbTVDitWGD/BFcOhk9POokMlblvLbOAKOo7U+vSXjFptg1VhH
 2cHmcPRP+KybwA+1tenxHUbzV/bL4YO+oaPm3CxvNkSSXKWimj0eOasKYMINtWnwldDp
 ayioM8aMsX41qCvYiogKBeAL8OYhRMHrnfBRL4KUaMQS1QF0ZL1dDJdBEKdHMH5PKN3w
 kuGWhmWtHJsdAmHqzUlwj2lcEBjJ3P1CoAFSygiuCPdn5ylxx5VAoP7uHEy274JP6llj
 FHtg==
X-Gm-Message-State: AOAM533arbOJ1y+HKFGgYQ6aZY4e+DVc0HqBeNE9UKQWqRYDTPRjoHNl
 pscxCHJWRXM92g6WQ24ZhrJ3Nw==
X-Google-Smtp-Source: ABdhPJyXDJSa31dfpTNuFZUt+9VFZTh4F6QW6PeZfl2cF/azUnMMw+f3Q1NUdj1PDZSSXIJ4Am3fqw==
X-Received: by 2002:adf:e486:: with SMTP id i6mr1090487wrm.397.1604648605819; 
 Thu, 05 Nov 2020 23:43:25 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id u195sm975234wmu.18.2020.11.05.23.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 23:43:25 -0800 (PST)
Date: Fri, 6 Nov 2020 07:43:23 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 16/19] gpu: drm: panel: panel-ilitek-ili9322: Demote
 non-conformant kernel-doc header
Message-ID: <20201106074323.GV4488@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-17-lee.jones@linaro.org>
 <20201105211742.GD216923@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105211742.GD216923@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwNSBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUuCj4gCj4g
T24gVGh1LCBOb3YgMDUsIDIwMjAgYXQgMDI6NDU6MTRQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4g
PiAKPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzMjIuYzoxNzc6
IHdhcm5pbmc6IEVudW0gdmFsdWUgJ0lMSTkzMjJfSU5QVVRfU1JHQl9USFJPVUdIJyBub3QgZGVz
Y3JpYmVkIGluIGVudW0gJ2lsaTkzMjJfaW5wdXQnCj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWlsaXRlay1pbGk5MzIyLmM6MTc3OiB3YXJuaW5nOiBFbnVtIHZhbHVlICdJTEk5MzIy
X0lOUFVUX1NSR0JfQUxJR05FRCcgbm90IGRlc2NyaWJlZCBpbiBlbnVtICdpbGk5MzIyX2lucHV0
Jwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxpOTMyMi5jOjE3Nzog
d2FybmluZzogRW51bSB2YWx1ZSAnSUxJOTMyMl9JTlBVVF9TUkdCX0RVTU1ZXzMyMFgyNDAnIG5v
dCBkZXNjcmliZWQgaW4gZW51bSAnaWxpOTMyMl9pbnB1dCcKPiA+ICBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzMjIuYzoxNzc6IHdhcm5pbmc6IEVudW0gdmFsdWUgJ0lM
STkzMjJfSU5QVVRfU1JHQl9EVU1NWV8zNjBYMjQwJyBub3QgZGVzY3JpYmVkIGluIGVudW0gJ2ls
aTkzMjJfaW5wdXQnCj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5
MzIyLmM6MTc3OiB3YXJuaW5nOiBFbnVtIHZhbHVlICdJTEk5MzIyX0lOUFVUX0RJU0FCTEVEXzEn
IG5vdCBkZXNjcmliZWQgaW4gZW51bSAnaWxpOTMyMl9pbnB1dCcKPiA+ICBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzMjIuYzoxNzc6IHdhcm5pbmc6IEVudW0gdmFsdWUg
J0lMSTkzMjJfSU5QVVRfUFJHQl9USFJPVUdIJyBub3QgZGVzY3JpYmVkIGluIGVudW0gJ2lsaTkz
MjJfaW5wdXQnCj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5MzIy
LmM6MTc3OiB3YXJuaW5nOiBFbnVtIHZhbHVlICdJTEk5MzIyX0lOUFVUX1BSR0JfQUxJR05FRCcg
bm90IGRlc2NyaWJlZCBpbiBlbnVtICdpbGk5MzIyX2lucHV0Jwo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxpOTMyMi5jOjE3Nzogd2FybmluZzogRW51bSB2YWx1ZSAn
SUxJOTMyMl9JTlBVVF9ZVVZfNjQwWDMyMF9ZQ0JDUicgbm90IGRlc2NyaWJlZCBpbiBlbnVtICdp
bGk5MzIyX2lucHV0Jwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxp
OTMyMi5jOjE3Nzogd2FybmluZzogRW51bSB2YWx1ZSAnSUxJOTMyMl9JTlBVVF9ZVVZfNzIwWDM2
MF9ZQ0JDUicgbm90IGRlc2NyaWJlZCBpbiBlbnVtICdpbGk5MzIyX2lucHV0Jwo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxpOTMyMi5jOjE3Nzogd2FybmluZzogRW51
bSB2YWx1ZSAnSUxJOTMyMl9JTlBVVF9ESVNBQkxFRF8yJyBub3QgZGVzY3JpYmVkIGluIGVudW0g
J2lsaTkzMjJfaW5wdXQnCj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1p
bGk5MzIyLmM6MTc3OiB3YXJuaW5nOiBFbnVtIHZhbHVlICdJTEk5MzIyX0lOUFVUX0lUVV9SX0JU
NjU2XzcyMFgzNjBfWUNCQ1InIG5vdCBkZXNjcmliZWQgaW4gZW51bSAnaWxpOTMyMl9pbnB1dCcK
PiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzMjIuYzoxNzc6IHdh
cm5pbmc6IEVudW0gdmFsdWUgJ0lMSTkzMjJfSU5QVVRfSVRVX1JfQlQ2NTZfNjQwWDMyMF9ZQ0JD
Uicgbm90IGRlc2NyaWJlZCBpbiBlbnVtICdpbGk5MzIyX2lucHV0Jwo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxpOTMyMi5jOjE3Nzogd2FybmluZzogRW51bSB2YWx1
ZSAnSUxJOTMyMl9JTlBVVF9VTktOT1dOJyBub3QgZGVzY3JpYmVkIGluIGVudW0gJ2lsaTkzMjJf
aW5wdXQnCj4gPiAKPiA+IENjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwu
Y29tPgo+ID4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgo+ID4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBTaWduZWQtb2Zm
LWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IAo+IEFwcGxpZWQgdG8gZHJt
LW1pc2MtbmV4dC4KClRoYW5rcyBmb3IgYWxsIHRoZXNlIFNhbS4KCkFueSBpZGVhIHdoYXQgaGFw
cGVucyB0byB0aGUgb3RoZXIgcGF0Y2hlcz8KCkRvIHRoZXkgZ28gaW4gdmlhIGEgZGlmZmVyZW50
IE1haW50YWluZXI/CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwg
TGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
