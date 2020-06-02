Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA71EB2B7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 02:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C55F6E108;
	Tue,  2 Jun 2020 00:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DF66E108
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 00:31:20 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id v25so650531uau.4
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 17:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nNU+pmC0TYW7Kp7GEPXpDsRZRqCmATpqP5mTGs3ndPU=;
 b=ZXziymZb5S2+F5N+UMMKX4tOz8szaVaLEsU+3voAMWJJg1WUyP3FPYNCmZTb6Iqrrw
 nMLTkqCas2ZLgl9zDq6SubA2CmWOcRKzE2CpkGNQeJ410db6WDxY7XJU91EY1cWAJx7a
 wT6MTRUkw/025lvCIXxtHLgLsjFwDi05q5zBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nNU+pmC0TYW7Kp7GEPXpDsRZRqCmATpqP5mTGs3ndPU=;
 b=dJ9p8SvS0QRZiN7oj022n9RBgIKpIsXh+DYZXJUxa0eb30vB+3vWKLB0s0J3G4PcfM
 ymrHCDDgokM1gbS3GBwp1mwzTtabFcHpHqQQiFJ8HercAsr5UJgr/Ty5XrJZdZDM6kKT
 Qny5gsV/IURYLZEXGX9TmUnwn18EaKCqbkOWn2aITImsSzUpB9EPjGUu4vzlof3nmRV7
 02BHwUefRIdS7IA0XlMuZ/C4IwzFVYQw201cSe9YKWWwewWPhke/Zfpwg7mr+M9e8DpC
 G+xnRrhtm3Fs0gRVfHt2PJROxcwGVkyRztUjFM1WzZHkOx5C1ixvDIYFa+D0dB8psLaO
 oJtg==
X-Gm-Message-State: AOAM530jNjk6ZLI6RylH2TXMp3lebhmt/f2NMNLl+sPUdLEQ2dNTisPa
 zBO5a4TKmppzD7T1GqFXrTOik1rmo7o=
X-Google-Smtp-Source: ABdhPJxMRhPn5amHEWA/fLa6qbKYm6l95eyM03+OPJJ2Aw8Biz6ZPNcSKTzX48TH4ERFMNbwTvGW8g==
X-Received: by 2002:ab0:136b:: with SMTP id h40mr5998551uae.51.1591057879433; 
 Mon, 01 Jun 2020 17:31:19 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id m184sm177792vkg.51.2020.06.01.17.31.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 17:31:18 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id z13so1013938vsn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 17:31:18 -0700 (PDT)
X-Received: by 2002:a05:6102:116e:: with SMTP id
 k14mr629133vsg.198.1591057878240; 
 Mon, 01 Jun 2020 17:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200601083309.712606-1-sam@ravnborg.org>
 <20200601083309.712606-3-sam@ravnborg.org>
In-Reply-To: <20200601083309.712606-3-sam@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Jun 2020 17:31:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSyODjtVtEe6H46U6xNraD2LUUi+xt8cxraaqXom=64g@mail.gmail.com>
Message-ID: <CAD=FV=VSyODjtVtEe6H46U6xNraD2LUUi+xt8cxraaqXom=64g@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] drm: panel-simple: add Seiko 70WVW2T 7" simple
 panel
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBNb24sIEp1biAxLCAyMDIwIGF0IDE6MzMgQU0gU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPiB3cm90ZToKPgo+IFRoZSBTZWlrbyA3MFdWVzJUIGlzIGEgZGlzY29udGludWVk
IHByb2R1Y3QsIGJ1dCBtYXkgYmUgdXNlZCBzb21ld2hlcmUuCj4gVGVzdGVkIG9uIGEgcHJvcHJp
ZXRhcnkgcHJvZHVjdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KPiBDYzogU8O4cmVuIEFuZGVyc2VuIDxzYW5Ac2tvdi5kaz4KPiBDYzogVGhpZXJy
eSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiBDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2lt
cGxlLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4g
aW5kZXggYjA2N2Y2NmNlYTBlLi44NjI0YmI4MDEwOGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNpbXBsZS5jCj4gQEAgLTMxOTQsNiArMzE5NCwzMSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHBhbmVsX2Rlc2Mgc2hlbGx5X3NjYTA3MDEwX2Jmbl9sbm4gPSB7Cj4gICAgICAgICAuYnVz
X2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdCNjY2XzFYMTgsCj4gIH07Cj4KPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHNpaV83MHd2dzJ0X21vZGUgPSB7Cj4gKyAgICAg
ICAuY2xvY2sgPSAzMzAwMCwKPiArICAgICAgIC5oZGlzcGxheSA9IDgwMCwKPiArICAgICAgIC5o
c3luY19zdGFydCA9IDgwMCArIDI1NiwKPiArICAgICAgIC5oc3luY19lbmQgPSA4MDAgKyAyNTYg
KyAwLAo+ICsgICAgICAgLmh0b3RhbCA9IDgwMCArIDI1NiArIDAgKyAwLAo+ICsgICAgICAgLnZk
aXNwbGF5ID0gNDgwLAo+ICsgICAgICAgLnZzeW5jX3N0YXJ0ID0gNDgwICsgMCwKPiArICAgICAg
IC52c3luY19lbmQgPSA0ODAgKyAwICsgMCwKPiArICAgICAgIC52dG90YWwgPSA0ODAgKyAwICsg
MCArIDQ1LAoKSW1wb3J0YW50IHRvIGhhdmUgYSAidnJlZnJlc2giPwoKCj4gKyAgICAgICAuZmxh
Z3MgPSBEUk1fTU9ERV9GTEFHX05WU1lOQyB8IERSTV9NT0RFX0ZMQUdfTkhTWU5DLAo+ICt9Owo+
ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIHNpaV83MHd2dzJ0ID0gewo+ICsg
ICAgICAgLm1vZGVzID0gJnNpaV83MHd2dzJ0X21vZGUsCj4gKyAgICAgICAubnVtX21vZGVzID0g
MSwKCkRvIHdlIHdhbnQgImJwYyA9IDYiPwoKCj4gKyAgICAgICAuc2l6ZSA9IHsKPiArICAgICAg
ICAgICAgICAgLndpZHRoID0gMTUyLAo+ICsgICAgICAgICAgICAgICAuaGVpZ2h0ID0gOTEsCj4g
KyAgICAgICB9LAo+ICsgICAgICAgLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4OF8x
WDI0LAoKU2hvdWxkIHRoaXMgYmUgYSA2NjYgZm9ybWF0PyAgUmFuZG9tIGludGVybmV0LWZvdW5k
IGRhdGEgc2hlZXQgc2F5cwoyNjJLIGNvbG9ycy4uLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
