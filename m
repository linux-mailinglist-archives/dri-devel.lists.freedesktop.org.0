Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC7E1ADAC8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 12:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC316EB83;
	Fri, 17 Apr 2020 10:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC4D6EB84
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 10:13:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k11so2411411wrp.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 03:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Si8xNa2PRt0kIhccFd8IRCrcCliJZGdfrQl0M6nEdTs=;
 b=utdWXHRDGLukUPDocwW6Cm48BY6bvFz80fFjJC3jpN5iRv2FnVhpn5i7lNKcBhS8sJ
 xHiQQO2Jbegs0tzYojnLQ5M1vDah1L2xgfi1BzmqHjJKC0wTjgKJPL4ZiXUtHDEeWApp
 G5pEAeVkba955wVhuY3VoZCj8teWpA60tuCqiu7FfOrsGWO49JAro14aLJNAoX+NQSD1
 ncHthxk6aHwtjwlI2DB0JBVkqCBjdu3aXRQMKmFTfMcYQNw3MmhfDE8LHt2N8SOyCPsw
 CAPXYAV9p4XxXipAbMvRb+N7NHpA6NGbsoM95P6IjYP1DspabfxVh/PdyVMd4UDDKbs7
 uOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Si8xNa2PRt0kIhccFd8IRCrcCliJZGdfrQl0M6nEdTs=;
 b=rzCQmD8zpPeWwmBRy/5M5lZoGP8L59AtXLUvolY2RNXGusb/oEw1FcFKAhVP5VhKW6
 cWjR3d/Rlwxc9TKlzUUK+g0eUhHKOZbd+g71C24kFIIN/36zCaKC2oBFSA+Ax3LDrQM5
 Xe+onBecnRf9bnAXkCbRQqBrMWHr66uQXnM1SeyWAGEIKreZDfvquruiW+3DiSUcw1Yj
 0FRVSaTN8mfiy92xGfBYu2kv4ukRGf1LRnpSbDlGvq0yKvhpOrjAO6MjRf8Z23u9GBGO
 6kP0A4S2WN/nAHP+Gwovb02DHOMGnhgWopQqU7qJtzyGc6Pd1xmAp+DLpJ6qt7cygnIN
 JkhQ==
X-Gm-Message-State: AGi0PuYJM+qVZkj06SGDAGLNdHMRIo2YPkOqF9Umuova1tQB5c915PYx
 u+YvHP3ynw9IcYgn7xZHhpVUsQ==
X-Google-Smtp-Source: APiQypJJoXQEbutIxLdmsu/x/STiUGWe4/3crlmEFrGGKFCFPbSIFAprP4Y9woxirt4trOT8/ToViw==
X-Received: by 2002:a05:6000:8f:: with SMTP id
 m15mr3108271wrx.19.1587118424935; 
 Fri, 17 Apr 2020 03:13:44 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id o18sm4886743wrp.23.2020.04.17.03.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 03:13:44 -0700 (PDT)
Date: Fri, 17 Apr 2020 11:14:46 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 1/1] video: backlight: tosa_lcd: convert to use
 i2c_new_client_device()
Message-ID: <20200417101446.GB3737@dell>
References: <20200326210959.13111-1-wsa+renesas@sang-engineering.com>
 <20200326210959.13111-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326210959.13111-2-wsa+renesas@sang-engineering.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNiBNYXIgMjAyMCwgV29sZnJhbSBTYW5nIHdyb3RlOgoKPiBNb3ZlIGF3YXkgZnJv
bSB0aGUgZGVwcmVjYXRlZCBBUEkgYW5kIHJldHVybiB0aGUgc2hpbnkgbmV3IEVSUlBUUiB3aGVy
ZQo+IHVzZWZ1bC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2Fz
QHNhbmctZW5naW5lZXJpbmcuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC90
b3NhX2xjZC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
CkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVy
IHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
