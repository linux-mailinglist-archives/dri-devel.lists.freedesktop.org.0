Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C524A363C65
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 09:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C091C89FD7;
	Mon, 19 Apr 2021 07:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0350189FD7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 07:23:21 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x7so32794079wrw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MwIN+TU+KqrTV8oEDf/hF37W/wlPfyPFBOGXtanMm7A=;
 b=mvKP3FYTQyjhiyXdbsSScTdmxz1JdALtfbp3+iAG13OF6eHuyLflOnEhKZqi7NefnI
 Ka/vu+MRQlQLQ1Wf8/dEGDJ25gGU2a9Ch58/yIKB1ny09smf3tC56NSGVJxWDjaddEs4
 Jtv6Lca8f3LeUYHLqp0B13sEJD2noyBhtVawAlQZHkk0XqI2Y3I6InNVrmlEQL9Jvt0h
 UiPhiEP4s2/GdqC8vmMETym4jlcdSAg2pfw+C/ijAxND3z+bkfIJsA4Y6/MYL8RuniMj
 cCEfJuyRjbQ8oJdvPaiAlSczpYRofo47AY6e21JwaRmJnDLkoT2ICuJLVknjcDEf5JyW
 s4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MwIN+TU+KqrTV8oEDf/hF37W/wlPfyPFBOGXtanMm7A=;
 b=IFk5QLWmBQI2sfA0X8fBTNTmN3/YZMpwR5AqybvBi8nQa0qdbw9A3lMh7KXCJn22PA
 4p1BK/1ZilZCzCTYuM8b1kIVrW4LWPEIV6pU01NopcbxIQQEELk7x16GgiZQhIBadV6D
 4zAnNYsFarhFeb0fQGxYATI4GggEFX8oJv4VgYwSR0YE+qf+hbU8qkJBJZp/78AHjPe5
 HAgGJILDm5D2Ni8XWTqnAulYA3M8O3fUYtY7cX9EA+KLolLQPI2YtSDENC61BTZZSsyU
 VWsTe/be1C7tTjBEgjgtq/qAE0teULFvxUNXXoGmmoHpFgQrTYjw7Rv+CqdNK0I/32aP
 7L/Q==
X-Gm-Message-State: AOAM5327x09sBF/LK4LNqf0uFOWNZkM35O4LS6eMABaL56MpEIN4UaHI
 olSwSIn4J86oZTmc6w+WqhxAzA==
X-Google-Smtp-Source: ABdhPJxU4UayMloZjPVsgjxamNBwWhUQHvtZnZx6PsAQFTcukFY8alah33zSIRsDldU+wQ0gpgaz6A==
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr12686252wrg.274.1618816999770; 
 Mon, 19 Apr 2021 00:23:19 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id a22sm20364077wrc.59.2021.04.19.00.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:23:19 -0700 (PDT)
Date: Mon, 19 Apr 2021 08:23:17 +0100
From: Lee Jones <lee.jones@linaro.org>
To: ChiYuan Huang <u0084500@gmail.com>
Subject: Re: [PATCH v6 1/4] mfd: rt4831: Adds support for Richtek RT4831
Message-ID: <20210419072317.GB4869@dell>
References: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
 <CADiBU3-d3_L8RTeYCirnfjJdG=ea6UVenAi8O8GO_LvOaB7OdA@mail.gmail.com>
 <20210419072229.GA4869@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419072229.GA4869@dell>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
 Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxOSBBcHIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBNb24sIDE5IEFwciAy
MDIxLCBDaGlZdWFuIEh1YW5nIHdyb3RlOgo+IAo+ID4gSGksIExpbnV4IG1mZCByZXZpZXdlcnM6
Cj4gPiAgICBJdCdzIGJlZW4gdGhyZWUgd2Vla3Mgbm90IHRvIGdldCBhbnkgcmVzcG9uc2UgZnJv
bSB5b3UuCj4gPiBJcyB0aGVyZSBzb21ldGhpbmcgd3JvbmcgYWJvdXQgdGhpcyBtZmQgcGF0Y2g/
Cj4gPiBJZiB5ZXMsIHBsZWFzZSBmZWVsIGZyZWUgdG8gbGV0IG1lIGtub3cuCj4gCj4gQ291cGxl
IG9mIHRoaW5nczoKPiAKPiBGaXJzdCwgaWYgeW91IHRoaW5rIGEgcGF0Y2ggaGFkIGZhbGxlbiB0
aHJvdWdoIHRoZSBnYXBzLCB3aGljaCBkb2VzCj4gaGFwcGVuIHNvbWV0aW1lcywgaXQgaXMgZ2Vu
ZXJhbGx5IGNvbnNpZGVyZWQgYWNjZXB0YWJsZSB0byBzdWJtaXQgYQo+IFtSRVNFTkRdIH4yIHdl
ZWtzIGFmdGVyIHRoZSBpbml0aWFsIHN1Ym1pc3Npb24uICBGWUk6IFRoaXMgd2FzIHN1Y2ggYQo+
IHBhdGNoLiAgSXQgd2FzIG5vdCBvbiwgb3IgaGFkIGZhbGxlbiBvZmYgb2YgbXkgcmFkYXIgZm9y
IHNvbWUgcmVhc29uLgo+IAo+IFNlY29uZGx5LCB3ZSBhcmUgcmVhbGx5IGxhdGUgaW4gdGhlIHJl
bGVhc2UgY3ljbGUuICAtcmM4IGhhcyBqdXN0IGJlZW4KPiByZWxlYXNlZC4gIFF1aXRlIGEgZmV3
IG1haW50YWluZXJzIHNsb3cgZG93biBhdCB+LXJjNi4gIFBhcnRpY3VsYXJseQo+IGZvciBuZXcg
ZHJpdmVycy4KPiAKPiBObyBuZWVkIHRvIHJlc3VibWl0IHRoaXMgZHJpdmVyIHRoaXMgdGltZS4g
IEl0IGlzIG5vdyBvbiBteSB0by1yZXZpZXcKPiBsaXN0IGFuZCBJIHdpbGwgdGVuZCB0byBpdCBz
aG9ydGx5Lgo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZS4KCkFsc28geW91IGFyZSBtaXNz
aW5nIGEgRFQgcmV2aWV3IG9uIHBhdGNoIDQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNl
bmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBP
cGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sg
fCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
