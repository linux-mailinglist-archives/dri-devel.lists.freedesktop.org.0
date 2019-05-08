Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F1E1716A
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 08:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B45589C9B;
	Wed,  8 May 2019 06:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5179489C9B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 06:23:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r4so10227345wro.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 23:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ZwBzr8t2c5//Qv+vOM+zb95AmHVIIGSZXeL3Vx6exVA=;
 b=D9nmDnYg6cuyerj8vjJWIH5D78j23AQsLqV5mOYXWTEr21ZmXDWB+khcC63HsveeQa
 ireh84hj9/pL/IxpyKVT1ygaBebn8E+lsUJFwNl0cT4ytnL9d/Cj7/5Vm4TAYQS1Ys4c
 7gM6Uj1lzB/mjWdCpPY4WX6qirzyWQxNtAhCeZSpPswmOJ1IA1ucSL1u1Y/dVJ7QUImQ
 GJ6FzU2OPMs8wD+JWyAskf6WiaROXeTEB8UKb986SAWHqdq1pDHTpD0tpIvyFwzLQvvA
 hbvSZI0VzFngCMKzRpuS3YP/lQEFAG+Zbw0aM6yMWO6YKZgV3Xo7uNZGNvVQgxzfe7EZ
 5SdA==
X-Gm-Message-State: APjAAAWO9yG6CtlNasF0fh361wM14TwGCnB7fAFpOvlaLOVFrQktCkDU
 sCkCFcU3RvUNKsyOww2+gcT/Vw==
X-Google-Smtp-Source: APXvYqyXAkfBLVqlYoyJPdjpjDrpRcXI6/fi/QgJCYsn/IaX8rp3yx2DcxxSO3Hdqj0BOr9Mlvh+HA==
X-Received: by 2002:adf:e390:: with SMTP id e16mr2475754wrm.321.1557296611983; 
 Tue, 07 May 2019 23:23:31 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id b10sm1835950wme.25.2019.05.07.23.23.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 23:23:31 -0700 (PDT)
Date: Wed, 8 May 2019 07:23:28 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Claudiu.Beznea@microchip.com
Subject: Re: [RESEND][PATCH v3 0/6] add LCD support for SAM9X60
Message-ID: <20190508062328.GD7627@dell>
References: <1556195748-11106-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556195748-11106-1-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=ZwBzr8t2c5//Qv+vOM+zb95AmHVIIGSZXeL3Vx6exVA=;
 b=vrBcJWBcO/7Ca/wCszwmavvuoj/LUQTTspcBW80sF2q5NXECfCj1CYpRR0Ymh86esM
 wC5aqb6fneiaVB+DVT2+HxGNfDWa3GtkT1kH9mbTPsOL3+lG/aW69GuQ/pTbcH5g4MUh
 CabAQreSIZguHDS2GWNSs2NwST7dPUFl3eYZiVq5WFVK5lZH8czZyfNtyeMQstVgUxeO
 KpK6T8VKiwhONHMv++TL35cIY3w/Gi1lbyxywlaxz7DiyTOyHS5ZC26Y9IxP3igvil1k
 Km0rcqRB7vfy4uuB7sU+5XYskfOilw+t/cgTJF5i25utVk0ZPQJwOfRsdw75mHPF4RSM
 M+1w==
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
Cc: linux-pwm@vger.kernel.org, alexandre.belloni@bootlin.com,
 bbrezillon@kernel.org, airlied@linux.ie, Nicolas.Ferre@microchip.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ludovic.Desroches@microchip.com, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2NydGMuYyAgfCAgMTgg
KystLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuYyAgICB8
IDEyMCArKysrKysrKysrKysrKysrKysrKysrKy0KPiAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhs
Y2RjL2F0bWVsX2hsY2RjX2RjLmggICAgfCAgIDIgKwo+ICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwt
aGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYyB8ICAgMiArLQo+ICBkcml2ZXJzL3B3bS9wd20tYXRt
ZWwtaGxjZGMuYyAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIDUgZmlsZXMgY2hhbmdlZCwg
MTMyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKTm90IHN1cmUgd2h5IEkgYW0gcmVj
ZWl2aW5nIHRoaXMgc2V0LgoKQ291bGQgeW91IHBsZWFzZSBkcm9wIG1lIGZyb20gZnV0dXJlIHN1
Ym1pc3Npb25zLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVj
aG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
