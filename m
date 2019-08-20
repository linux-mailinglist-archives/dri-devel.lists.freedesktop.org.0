Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4402D96672
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 18:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2066E42F;
	Tue, 20 Aug 2019 16:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD726E42F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:32:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q12so13045527wrj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 09:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wzFwBxJwNYVFz8c23UR6EVA4QWVFqmII5gU+JmWuczE=;
 b=gT1Lk8FeItZjg3m6ifCmLg1ItF1AKfFCPAAKRsvlek4qzMdQ9/QYva0+5aPTh7OK4/
 PRx6euizqOgmc7KC7rqr8Hn1UaKs2VLVzmeeAFsSmHO6yBNhQC6RaRM0wZJXu94pOIzU
 YZ60oO7cvyAIJjaEGiRVBTjfHMsQ6la4nRkMcKrh+u9bLxEoxh7UpVINweGABEG6RNgW
 wsdCUkyH4hL6iceLFhrmvPx2ERNmq8L1KUOVo9hZcp9GG0MXm5wmsjfWc/qd7cJJ87a6
 IB/NQJ8f7BL6mW0hAUWTvvOxaMpoTq0HIr6peKlAvhgPEPNUx4XJOTKXmd7WoHN7/dLY
 uOzA==
X-Gm-Message-State: APjAAAXdBjM73Fd1XgByA9YeRT6q3QGsUg4Lis2XfRdJTq9wnGMAw5Z4
 xVTaLJbWsBjBlcdr0txDB2teYQ==
X-Google-Smtp-Source: APXvYqxZeEQOGmvTSeY3NAXBX2ijAVwVyFh7cjQfFiojdkB4QWK59zEazcrFVniEAzKjEwyVc8J9Qw==
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr35124310wrx.180.1566318751477; 
 Tue, 20 Aug 2019 09:32:31 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id g12sm20431627wrv.9.2019.08.20.09.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 09:32:30 -0700 (PDT)
Date: Tue, 20 Aug 2019 17:32:28 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] video: backlight: tosa_lcd: drop check because
 i2c_unregister_device() is NULL safe
Message-ID: <20190820163228.xuz7su6psovp6pkp@holly.lan>
References: <20190820153439.7638-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820153439.7638-1-wsa+renesas@sang-engineering.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wzFwBxJwNYVFz8c23UR6EVA4QWVFqmII5gU+JmWuczE=;
 b=UVuz+pt2vpL53mRHNmJ1TU5lEwmqvpAXHYMHYAuJ3MR3nGicW67xSDcxejCOHaChSn
 UxPNWcr4L2TAJk3Xipd3O7/xHpg9t/yJmTmR0/aPF3QIWtv9tg2DqcIQ4EJ3jZm4wsUV
 hFlG7wocFSEg6zjiqAtU5WUmZyezDVH1mXwTQfJwrUzEaePzW4+vK+A9jfOiTJebaG6b
 S+w4UblzXJLp/M4k/NYD40/x7Smfg5Op6MQqThvRO34g37kPVzeRGySFW+FXGMZ5PSQs
 8J19gTKqWWZ3Irun4ynV1p8TuMjnmYBhBDtY/aWQHNSFyJpmyHiQFtj/gueWk1khKcSa
 BmxA==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMDU6MzQ6MzlQTSArMDIwMCwgV29sZnJhbSBTYW5nIHdy
b3RlOgo+IE5vIG5lZWQgdG8gY2hlY2sgdGhlIGFyZ3VtZW50IG9mIGkyY191bnJlZ2lzdGVyX2Rl
dmljZSgpIGJlY2F1c2UgdGhlCj4gZnVuY3Rpb24gaXRzZWxmIGRvZXMgaXQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4K
ClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3Jn
PgoKCj4gLS0tCj4gQnVpbGQgdGVzdGVkIG9ubHksIGJ1aWxkYm90IGlzIGhhcHB5LCB0b28uCj4g
Cj4gUGxlYXNlIGFwcGx5IHRvIHlvdXIgdHJlZS4KPiAKPiAgZHJpdmVycy92aWRlby9iYWNrbGln
aHQvdG9zYV9sY2QuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
dG9zYV9sY2QuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Rvc2FfbGNkLmMKPiBpbmRleCA2
NWNiNzU3ODc3NmYuLjI5YWY4ZTI3YjZlNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC90b3NhX2xjZC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvdG9zYV9s
Y2QuYwo+IEBAIC0yMjIsOCArMjIyLDcgQEAgc3RhdGljIGludCB0b3NhX2xjZF9yZW1vdmUoc3Ry
dWN0IHNwaV9kZXZpY2UgKnNwaSkKPiAgewo+ICAJc3RydWN0IHRvc2FfbGNkX2RhdGEgKmRhdGEg
PSBzcGlfZ2V0X2RydmRhdGEoc3BpKTsKPiAgCj4gLQlpZiAoZGF0YS0+aTJjKQo+IC0JCWkyY191
bnJlZ2lzdGVyX2RldmljZShkYXRhLT5pMmMpOwo+ICsJaTJjX3VucmVnaXN0ZXJfZGV2aWNlKGRh
dGEtPmkyYyk7Cj4gIAo+ICAJdG9zYV9sY2RfdGdfb2ZmKGRhdGEpOwo+ICAKPiAtLSAKPiAyLjIw
LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
