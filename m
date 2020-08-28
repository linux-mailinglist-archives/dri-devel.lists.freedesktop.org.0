Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BE02558D1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 12:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E512E6E49C;
	Fri, 28 Aug 2020 10:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461586E49C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 10:47:01 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id o21so493119wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XFv2zJtQ6cpr9KnjOo127uI+KnnsWZkOUj7ODN+RnUg=;
 b=tRswwJZFvnK6kR8NS1TeDYMHLxlrQVxK8CFHRz0wAIdRQtBjJwBd27tcETuYekq0j4
 JzIqHCIYEOcQ9YmVRAXyVDhqqO41MpaMVwrKJk4Z6bc8vLSylyxOmdE4iaHcgrzurXW2
 A3xflxPkWU8LS2dkkX/PH9YfICArRFTobiX2fs9Ox34nLv1Coi7GTYuRSpcyLnrwGmOk
 a/Cd0EAYDQ7sXE25xmcPHJ09OfwfUriwmWNfRK7JtrEx69oP034uQtAHssrcFlKaPEJ1
 qCFaEAbJUvs+V1uD5s9gsrIYFS7IzZlBCtVVJh8/Bk57D5YqziPUtUDW3ijPxNZtuuPi
 ZgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XFv2zJtQ6cpr9KnjOo127uI+KnnsWZkOUj7ODN+RnUg=;
 b=MsFxjIqQ+aFPZoli0u8FdsQ9B5GIJemWhzLkdp0TffOu8eI9w7PVntCuv4u78ydAk6
 9+iP370A3YAuH9pBoqp4HHR3HL7uVNH9ZeZUSnrCFl5OUa7djUILtHMXrlgJ1Yhf16Fx
 DCZbnzwKO+cPS5RszkYT31CPlZ1jXVSWh8Gu5ffwZCFIgKUuVRgT1QkatAKFeLo9kLdK
 4F6x+rl0A8HzVgXnRTCEimXgwYxJjWQTypA1jaI696gUhbh5Ke0cmB5x7EEvCLsYDdV9
 6MlATankBrgAF4DnQGhd1gifY+jPsRTZajMrVdqj9vbsPTb28k02wONSsy5zrMKaiAuX
 qWuA==
X-Gm-Message-State: AOAM5312z6GldRnrRPEtqDy9I3mIhmTtoeKiOHgZoqlklhu3xyryuozB
 jETdpxXhdi5CruDrOv/9injYsg==
X-Google-Smtp-Source: ABdhPJyGYIZPQow3V9t5Rn9M66KvHmQXz60hxgZUGEWHyfJSX/z+MXP+DLNHm8Ytx6wFCXKbensuYA==
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr1063532wmh.31.1598611619922; 
 Fri, 28 Aug 2020 03:46:59 -0700 (PDT)
Received: from dell ([91.110.221.141])
 by smtp.gmail.com with ESMTPSA id q8sm1319986wrx.79.2020.08.28.03.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:46:59 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:46:57 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3 v3] dt-bindings: backlight: Add Kinetic KTD253 bindings
Message-ID: <20200828104657.GP1826686@dell>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
 <20200819205150.164403-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819205150.164403-2-linus.walleij@linaro.org>
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBBdWcgMjAyMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhpcyBhZGRzIGRl
dmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgS2luZXRpYyBLVEQyNTMKPiB3aGl0ZSBMRUQgYmFj
a2xpZ2h0IGRyaXZlci4KPiAKPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAtLS0KPiBDaGFuZ2VMb2cgdjItPnYz
Ogo+IC0gRHJvcCB0aGUgcG9pbnRsZXNzIGNhcmdvLWN1bHRlZCAiZGVmYXVsdC1vbiIgcHJvcGVy
dHkgdGhhdAo+ICAgd2Ugd2VyZSBub3QgdXNpbmcKPiAtIENvcnJlY3QgdGhlIGJyaWdodG5lc3Mg
aW4gdGhlIGV4YW1wbGUgdG8gc29tZXRoaW5nIGxlZ2FsICgxMykKPiBDaGFuZ2VMb2cgdjEtPnYy
Ogo+IC0gQ3JlYXRlIGNvbW1vbi55YW1sIGZvciBiYWNrbGlnaHQgYXMgc3VnZ2VzdGVkIGJ5IFNh
bSBhbmQKPiAgIHVzZSB0aGF0Lgo+IC0gUmVuYW1lIHRoZSBHUElPIGxpbmUgImVuYWJsZS1ncGlv
cyIKPiAtLS0KPiAgLi4uL2xlZHMvYmFja2xpZ2h0L2tpbmV0aWMsa3RkMjUzLnlhbWwgICAgICAg
IHwgNDYgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2xlZHMvYmFja2xpZ2h0L2tpbmV0aWMsa3RkMjUzLnlhbWwKCkFwcGxpZWQsIHRoYW5rcy4K
Ci0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxv
cGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0g
U29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
