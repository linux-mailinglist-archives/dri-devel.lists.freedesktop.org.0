Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240BA2558D8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 12:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FDD6EB94;
	Fri, 28 Aug 2020 10:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954AF6EB94
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 10:47:34 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c19so581881wmd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 03:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=q5chwg9c3d/aMqO/Gljkl1YYnVCZaPKS/jbh0vdYliI=;
 b=bbRe5qU1Xd2kifbrnlmW965djFK5jdV71bOe5aDkvo9RZKPKyStaUPDtkHRgcU1DG3
 F+DK768B1koXTDDvLUMy0g7qcCoIjXqORIXhXYsBwBiSygGu6F5/PeTzhMahMl3ckJ8A
 LWoL7dTx4RjvUVl4JMpAWF5q8EXfOaMRTkeq+uh2x56CkB9GREyrA5X1IBmjNytgIPjd
 bI6BIm2jzKlP+HQO8RuSb3avaeTBZQ8CDTyLsmJuosPvBPGPrlHiWkUdcMs2RrMg4+5H
 JehxGnV7KBwYPOqNaPPGlgYWsJF/JvVyX3HFCAy3oOCJO8VEGZAqXpEO0fQExYB3Lxsp
 DzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=q5chwg9c3d/aMqO/Gljkl1YYnVCZaPKS/jbh0vdYliI=;
 b=MMZUsQC5UXRYleSJFq7nwGpe0W/FXRVVHLiVhoVJXMFsK42KF0+R2TvtiW6AnfUYdS
 M0eMPgNsFW8M1b45G2u7HADatfVorWdvxA7NiyeKI0I6YpmbxT9ocMam3niEZhK4nQtw
 m3P+2IsqNwXAYd2amyi3GyEQYjtwsNUtRJMn7Hr9rQFystjtLQqlrCV8nB7514xm2X9U
 906c4m5VNbQ2dQ9ZgIWa9F666E4UVFlpDXZxx2LAX6F+SfKiDMrWz3p9BGvYh4jkULpr
 wqQ/aGvPpfAyuYB723zlDMPcZzvwzLXJCD3YYhWEh/znz13/5b9NanVCQmtWY3uX9mTt
 D72g==
X-Gm-Message-State: AOAM532I2VunbxL8Hc2w5ZUk5lGMOQcCqz4FQEVjk0GjYtWYcG12RD97
 pL0iucvtiIpqQTeKesfQGqXCDw==
X-Google-Smtp-Source: ABdhPJzeyYB6zjeWHL+CqXUvQwOlzJSMCCiedGYmlaHC+WExDWtUnFGKNyv0NYllTOdiACTKK2fDzw==
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr1070056wmh.144.1598611653262; 
 Fri, 28 Aug 2020 03:47:33 -0700 (PDT)
Received: from dell ([91.110.221.141])
 by smtp.gmail.com with ESMTPSA id y142sm1685347wmd.3.2020.08.28.03.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:47:32 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:47:31 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3 v3] backlight: Add Kinetic KTD253 backlight driver
Message-ID: <20200828104731.GQ1826686@dell>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
 <20200819205150.164403-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819205150.164403-3-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBBdWcgMjAyMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIEtpbmV0aWMg
S1REMjUzIGJhY2tsaWdodCBkcml2ZXIgaXMgY29udHJvbGxlZCB3aXRoIGEKPiBzaW5nbGUgR1BJ
TyBsaW5lLCBidXQgc3RpbGwgc3VwcG9ydHMgYSByYW5nZSBvZiBicmlnaHRuZXNzCj4gc2V0dGlu
Z3MgYnkgc2VuZGluZyBmYXN0IHB1bHNlcyBvbiB0aGUgbGluZS4KPiAKPiBUaGlzIGlzIGJhc2Vk
IG9mZiB0aGUgc291cmNlIGNvZGUgcmVsZWFzZSBmb3IgdGhlIFNhbXN1bmcKPiBHVC1TNzcxMCBt
b2JpbGUgcGhvbmUuCj4gCj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBS
ZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4K
PiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
Cj4gLS0tCj4gQ2hhbmdlTG9nIHYyLT52MzoKPiAtIENvbGxlY3QgRGFuaWVsJ3MgcmV2aWV3IHRh
Zy4KPiBDaGFuZ2VMb2cgdjEtPnYyOgo+IC0gRXhwb3NlIHRoZSAzMiBhY3R1YWwgaGFyZHdhcmUg
bGV2ZWxzIG9mIGJyaWdodG5lc3MgZGlyZWN0bHkKPiAgIGluc3RlYWQgb2YgdXNpbmcgYW4gaW50
ZXJwb2xhdGVkICJicmlnaHRuZXNzIiB0YWJsZS4KPiAtIFVzZSB0aGUgbmV3IGJhY2tsaWdodF9n
ZXRfYnJpZ2h0bmVzcygpIGhlbHBlci4KPiAtIENhbGwgYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMo
KSBpbiBwcm9iZSBpbnN0ZWFkIG9mIGNhbGxpbmcKPiAgIGxvY2FsIGZ1bmN0aW9ucyB0byBzeW5j
IGJyaWdodG5lc3MuCj4gLSBTb3J0IGluY2x1ZGVzIGFscGhhYmV0aWNhbGx5Lgo+IC0gTmFtZSB0
aGUgR1BJTyBsaW5lICJlbmFibGUiIGFuZCBncmFiIHRoYXQgaW4gYWNjb3JkYW5jZQo+ICAgd2l0
aCB0aGUgY2hhbmdlIHRvIHRoZSBEVCBiaW5kaW5ncy4KPiAtLS0KPiAgTUFJTlRBSU5FUlMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsKPiAgZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvS2NvbmZpZyAgICAgICAgICAgIHwgICA4ICsKPiAgZHJpdmVycy92aWRlby9iYWNrbGln
aHQvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
a3RkMjUzLWJhY2tsaWdodC5jIHwgMTk4ICsrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVz
IGNoYW5nZWQsIDIxMyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9rdGQyNTMtYmFja2xpZ2h0LmMKCkFwcGxpZWQsIHRoYW5rcy4KCi0t
IApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVy
IFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29D
cwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
