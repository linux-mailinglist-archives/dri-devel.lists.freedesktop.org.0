Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356D39F3B6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 22:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392DE89C21;
	Tue, 27 Aug 2019 20:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C691C894DD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 20:03:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q12so55756wrj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 13:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=impKCbyAxRs9NFOM+DFGNElYKCV9PdyDQbIxJjFevFA=;
 b=Kn/xPgBzPq/Xa1qQVmi/wLR0MNLcIBPpIVggNcd7AeeKR0IgsRVFO/46WG5lq4IMUB
 +4KcWSdtkEZJppzbUudF4doQcFKB+AaR+3YbyilgvopmpVPr3JS3yfUwTBtV8+1pkaPI
 ZjADt2quxCCVJVvielpp+mOj/Rp2k7MP55yUsTNcYqzaVrGsXNie+St5Fkg8deMLmRF2
 MZSPr7kk5wUxVeMQM2X+EUsPhBZ/mBWGWAzvo3sRetEblkEjgXYP5cksXMDH+gNtsyiR
 /uiOoP4q90B6LTOs8NbQZrJl3zIQ7Br/HgTqrL+MA4XjOiW5BjMIgPnwC8xcF2caykYl
 xu0g==
X-Gm-Message-State: APjAAAU6zMVYqFpW9m+Q9oeG68Ew4Zr3hdY6MsxERCub/SshJTHJrEb9
 lN1LD6OJEbqFxnIlZCWSBse0kz0dLhRBWS/4zjkd9g==
X-Google-Smtp-Source: APXvYqxMf0gPlGKALYf0yBr5/No4pDEoW1Setdjt5CEUhoFxnZ5cKpvdpBGJpJuLwsoD4zMtMpNRmmlLntSwgxu9mXs=
X-Received: by 2002:adf:ba0c:: with SMTP id o12mr3100629wrg.284.1566936202247; 
 Tue, 27 Aug 2019 13:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190627151740.2277-1-matt.redfearn@thinci.com>
 <CALAqxLUsf4HJBcAcd+qzycFC3d8XbKk9HyQ7FfCrH8Ewc3mzvw@mail.gmail.com>
In-Reply-To: <CALAqxLUsf4HJBcAcd+qzycFC3d8XbKk9HyQ7FfCrH8Ewc3mzvw@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 27 Aug 2019 13:03:09 -0700
Message-ID: <CALAqxLVtzQSgVL0B0M2RNB_U-TvNs7+C=k6VUk0VJywdgJbNFQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: adv7511: Attach to DSI host at probe time
To: Matt Redfearn <matt.redfearn@thinci.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=impKCbyAxRs9NFOM+DFGNElYKCV9PdyDQbIxJjFevFA=;
 b=IZ8u9uAFL6eeaolWlF3r1zEFQK00yXEBdd2GZo74Q8JnQOyj8Qqn+gA+mWHII+DL54
 DcMjlaZ7nMoJaGTc2+D57TVEaEVpGGrtxnVmy3Kk6wH1p8tJvet9iZ2CFGYZCCOX4bN7
 MpYeAvGyphsEom5+u/KfDh/WVySnq75jNo0QYLhFZupyfSAl4OsN06t2DHhz1XdsuCzk
 do/W5UtNiiG8d4RWw3OkZogNM0hFfbr03H8ijXSVsGSoDyBy4QxCDi5kvZZq5gfqlGsr
 8bVp089gsGXHf11zwHf/2AHuLcNJl2gxEPv/gtiCHiUDoAeXFc2LrH6q/2/oiMDRxhkR
 fbsA==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Redfearn <matthew.redfearn@thinci.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMzoyNyBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4gd3JvdGU6Cj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgODoxOCBBTSBNYXR0
IFJlZGZlYXJuIDxtYXR0LnJlZGZlYXJuQHRoaW5jaS5jb20+IHdyb3RlOgo+ID4KPiA+IEluIGNv
bnRyYXN0IHRvIGFsbCBvZiB0aGUgRFNJIHBhbmVsIGRyaXZlcnMgaW4gZHJpdmVycy9ncHUvZHJt
L3BhbmVsCj4gPiB3aGljaCBhdHRhY2ggdG8gdGhlIERTSSBob3N0IHZpYSBtaXBpX2RzaV9hdHRh
Y2goKSBhdCBwcm9iZSB0aW1lLCB0aGUKPiA+IEFEVjc1MzMgYnJpZGdlIGRldmljZSBkb2VzIG5v
dC4gSW5zdGVhZCBpdCBkZWZlcnMgdGhpcyB0byB0aGUgcG9pbnQgdGhhdAo+ID4gdGhlIHVwc3Ry
ZWFtIGRldmljZSBjb25uZWN0cyB0byBpdHMgYnJpZGdlIHZpYSBkcm1fYnJpZGdlX2F0dGFjaCgp
Lgo+ID4gVGhlIGdlbmVyaWMgU3lub3BzeXMgTUlQSSBEU0kgaG9zdCBkcml2ZXIgZG9lcyBub3Qg
cmVnaXN0ZXIgaXQncyBvd24KPiA+IGRybV9icmlkZ2UgdW50aWwgdGhlIE1JUEkgRFNJIGhhcyBh
dHRhY2hlZC4gQnV0IGl0IGRvZXMgbm90IGNhbGwKPiA+IGRybV9icmlkZ2VfYXR0YWNoKCkgb24g
dGhlIGRvd25zdHJlYW0gZGV2aWNlIHVudGlsIHRoZSB1cHN0cmVhbSBkZXZpY2UKPiA+IGhhcyBh
dHRhY2hlZC4gVGhpcyBsZWFkcyB0byBhIGNoaWNrZW4gYW5kIHRoZSBlZ2cgZmFpbHVyZSBhbmQg
dGhlIERSTQo+ID4gcGlwZWxpbmUgZG9lcyBub3QgY29tcGxldGUuCj4gPiBTaW5jZSBhbGwgb3Ro
ZXIgbWlwaV9kc2lfZGV2aWNlIGRyaXZlcnMgY2FsbCBtaXBpX2RzaV9hdHRhY2goKSBpbgo+ID4g
cHJvYmUoKSwgbWFrZSB0aGUgYWR2NzUzMyBtaXBpX2RzaV9kZXZpY2UgZG8gdGhlIHNhbWUuIFRo
aXMgZW5zdXJlcyB0aGF0Cj4gPiB0aGUgU3lub3BzeXMgTUlQSSBEU0kgaG9zdCByZWdpc3RlcnMg
aXQncyBicmlkZ2Ugc3VjaCB0aGF0IGl0IGlzCj4gPiBhdmFpbGFibGUgZm9yIHRoZSB1cHN0cmVh
bSBkZXZpY2UgdG8gY29ubmVjdCB0by4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJlZGZl
YXJuIDxtYXR0LnJlZGZlYXJuQHRoaW5jaS5jb20+Cj4gPgo+ID4gLS0tCj4KPiBBcyBhIGhlYWRz
IHVwLCBJIGp1c3QgZGlkIHNvbWUgdGVzdGluZyBvbiBkcm0tbWlzYy1uZXh0IGFuZCB0aGlzIHBh
dGNoCj4gc2VlbXMgdG8gYmUgYnJlYWtpbmcgdGhlIEhpS2V5IGJvYXJkLiAgT24gYm9vdHVwLCBJ
J20gc2VlaW5nOgo+IFsgICAgNC4yMDk2MTVdIGFkdjc1MTEgMi0wMDM5OiAyLTAwMzkgc3VwcGx5
IGF2ZGQgbm90IGZvdW5kLCB1c2luZwo+IGR1bW15IHJlZ3VsYXRvcgo+IFsgICAgNC4yMTcwNzVd
IGFkdjc1MTEgMi0wMDM5OiAyLTAwMzkgc3VwcGx5IGR2ZGQgbm90IGZvdW5kLCB1c2luZwo+IGR1
bW15IHJlZ3VsYXRvcgo+IFsgICAgNC4yMjQ0NTNdIGFkdjc1MTEgMi0wMDM5OiAyLTAwMzkgc3Vw
cGx5IHB2ZGQgbm90IGZvdW5kLCB1c2luZwo+IGR1bW15IHJlZ3VsYXRvcgo+IFsgICAgNC4yMzE4
MDRdIGFkdjc1MTEgMi0wMDM5OiAyLTAwMzkgc3VwcGx5IGEydmRkIG5vdCBmb3VuZCwgdXNpbmcK
PiBkdW1teSByZWd1bGF0b3IKPiBbICAgIDQuMjM5MjQyXSBhZHY3NTExIDItMDAzOTogMi0wMDM5
IHN1cHBseSB2M3AzIG5vdCBmb3VuZCwgdXNpbmcKPiBkdW1teSByZWd1bGF0b3IKPiBbICAgIDQu
MjQ2NjE1XSBhZHY3NTExIDItMDAzOTogMi0wMDM5IHN1cHBseSB2MXAyIG5vdCBmb3VuZCwgdXNp
bmcKPiBkdW1teSByZWd1bGF0b3IKPiBbICAgIDQuMjcyOTcwXSBhZHY3NTExIDItMDAzOTogZmFp
bGVkIHRvIGZpbmQgZHNpIGhvc3QKPgo+IG92ZXIgYW5kIG92ZXIuICBUaGUgZHVtbXkgcmVndWxh
dG9yIG1lc3NhZ2VzIGFyZSBub3JtYWwsIGJ1dCB1c3VhbGx5Cj4gWyAgICA0LjQ0NDMxNV0ga2ly
aW4tZHJtIGY0MTAwMDAwLmFkZTogYm91bmQgZjQxMDc4MDAuZHNpIChvcHMgZHNpX29wcykKPgo+
IFN0YXJ0cyB1cCByaWdodCBhZnRlcndhcmQuCgpIZXkgTWF0dCwgQW5kcnplaiwKICBJIGp1c3Qg
d2FudGVkIHRvIGZvbGxvdyB1cCBvbiB0aGlzIGFzIHRoaXMgcGF0Y2ggaXMgYnJlYWtpbmcgYQpj
b3VwbGUgb2YgYm9hcmRzLiBBbnkgc2Vuc2Ugb2Ygd2hhdCBtaWdodCBiZSBtaXNzaW5nLCBvciBp
cyB0aGlzCnNvbWV0aGluZyB3ZSBzaG91bGQgcmV2ZXJ0PwoKSSdtIGhhcHB5IHRvIHRlc3QgYW55
IHBhdGNoIGlkZWFzIHlvdSBoYXZlLgoKdGhhbmtzCi1qb2huCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
