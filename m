Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E511FAF9F8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 12:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1B96E219;
	Wed, 11 Sep 2019 10:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6911F6E219
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 10:08:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l3so1089839wru.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 03:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VDs4QBH4rsd9WApRFewbfBpAla/8JjMokOT6RslkOmM=;
 b=ev8gzV4GgkODXi8vcrhFH4jWQrPCTyuQ1K4Y6AxSOrwN5NjijASGTd3SLKyweMoVja
 HRefGpkdFHkLtXd6/FNNzwmWNHqjtvAWLjVTK8EcMbEG2eOVQL0WHO2iP1LibibUBXxu
 v31XsDOOazYEXXUfLbQJRYXlik/3Ev/6+08zIjfLLsqOWOKUgOjQsPXq9XoPzdndJ4q9
 r9IsDcqYJYOaEma3lGa+n93AOws8KCQ02YdL6RErW/6i427Y4sQLH17YWWTj74BEga28
 3PyY4iUq4ekneoBc53WuODrJs5JV+BnHSnuqVmNE+neVMd6L1MSqoKRxl4IReVFtCtf3
 Gn7w==
X-Gm-Message-State: APjAAAW1fj7ikdJa2vAyBNae5nE3Fw5mIO2mf8yCAhDav1d6xHaDbw4U
 NCsJFTINuCMMKOgIECXmCLkoWw==
X-Google-Smtp-Source: APXvYqwwO7ms6cDK74/Pkx8Q/GbwMaXoYLDIpo3xME5YnvIM2YoARQAWfaF+MWOS/r+pfR+2cwba4A==
X-Received: by 2002:adf:8444:: with SMTP id 62mr23305991wrf.202.1568196533899; 
 Wed, 11 Sep 2019 03:08:53 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z189sm3551152wmc.25.2019.09.11.03.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 03:08:53 -0700 (PDT)
Date: Wed, 11 Sep 2019 11:08:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
Message-ID: <20190911100851.f4rnldghtmly26oo@holly.lan>
References: <20190910212909.18095-1-andreas@kemnade.info>
 <20190910212909.18095-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910212909.18095-2-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VDs4QBH4rsd9WApRFewbfBpAla/8JjMokOT6RslkOmM=;
 b=NHM6VwFJgk9JP6K9tIa+qvaxn5+Ogzc7cDz8+F43SM8S6lFWNT0g/1L9XZBSVwaola
 kZatLw3ohMiWvKK1iMWcap3jFwco0hBhy93RhTuCBarNbZP5Zi66A2/LNsXnwDrKyuPO
 cWfXRoIHoq9VEqG/3oP4hGClbNkeNBPXy3Q7YepKlI2br1az4hA5lc1Qjt5yrgzKTsEo
 CA3paIui1sOrvQKRKI8XBt4tGDOfdrw/DWSsAFggd6V/zfcMbx7N1jRIcp/dU2unHVdM
 aDQ0BivD+hvha25GecLASN4k9C8wMNJdyuwmnls6pmJu2H5brulQUp5+CdOPOYcnBFE+
 2lBw==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMTE6Mjk6MDhQTSArMDIwMCwgQW5kcmVhcyBLZW1uYWRl
IHdyb3RlOgo+IGFkZCBlbmFibGUtZ3Bpb3MgdG8gZGVzY3JpYmUgSFdFTiBwaW4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFkZS5pbmZvPgoKQWNrZWQt
Ynk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cgo+IC0tLQo+
IGNoYW5nZXMgaW4gdjI6IGFkZCBleGFtcGxlCj4gIC4uLi9iaW5kaW5ncy9sZWRzL2JhY2tsaWdo
dC9sbTM2MzBhLWJhY2tsaWdodC55YW1sICAgICAgICAgICB8IDUgKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBh
LWJhY2tsaWdodC55YW1sCj4gaW5kZXggZGMxMjlkOWEzMjllLi4xZmE4M2ZlZmZlMTYgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0
L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbAo+IEBAIC0yOSw2
ICsyOSwxMCBAQCBwcm9wZXJ0aWVzOgo+ICAgICcjc2l6ZS1jZWxscyc6Cj4gICAgICBjb25zdDog
MAo+ICAKPiArICBlbmFibGUtZ3Bpb3M6Cj4gKyAgICBkZXNjcmlwdGlvbjogR1BJTyB0byB1c2Ug
dG8gZW5hYmxlL2Rpc2FibGUgdGhlIGJhY2tsaWdodCAoSFdFTiBwaW4pLgo+ICsgICAgbWF4SXRl
bXM6IDEKPiArCj4gIHJlcXVpcmVkOgo+ICAgIC0gY29tcGF0aWJsZQo+ICAgIC0gcmVnCj4gQEAg
LTkyLDYgKzk2LDcgQEAgZXhhbXBsZXM6Cj4gICAgICBpMmMgewo+ICAgICAgICAgICNhZGRyZXNz
LWNlbGxzID0gPDE+Owo+ICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ICsgICAgICAgIGVu
YWJsZS1ncGlvcyA9IDwmZ3BpbzIgNSBHUElPX0FDVElWRV9ISUdIPjsKPiAgCj4gICAgICAgICAg
bGVkLWNvbnRyb2xsZXJAMzggewo+ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aSxs
bTM2MzBhIjsKPiAtLSAKPiAyLjIwLjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
