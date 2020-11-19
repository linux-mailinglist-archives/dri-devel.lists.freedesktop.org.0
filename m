Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DADEF2B8D82
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7BF6E509;
	Thu, 19 Nov 2020 08:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA95B6E509
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 08:35:30 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v20so5333396ljk.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 00:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CUAPPILQ+HlU7cec+WyW0vmuUkycQGR+EKCfVOKR5DA=;
 b=xxlskXAtX870lOpywdkalnsMzFjOX7jemtarV+C0XroXPqfrChwDn/g05wGLVXiLwx
 DZv2npwrVk2RKdH45J7ZWqU2vAt1m10srMqDqYyRxB61d26qoaxXSMRTETG9DXJ2hAcJ
 N4kLWQX9cJNH3RH5lR3umlSF1OOyI0UJPv1RHKjx7zCyrRKjspUv/27o0lxRWuMcYYrI
 O+IiOqTP0Or30LBmpNOxt2QBo25FdQEYfEWRO4sFrMf/TPM8AMtiIRXUj9ZgCTQClZG6
 /2ulQQHD9n1kuB837CEi2PVIGJ89reg37c1AlK0zowtZLpiS7sfPwzHj9ot7ktmbWrJH
 bCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CUAPPILQ+HlU7cec+WyW0vmuUkycQGR+EKCfVOKR5DA=;
 b=m2BQ9jxmdb3oHPG5xbZVKO/M59+KNCW09gUOKSbmltbmKuI/p8dlXVO1sgAQW+U9BH
 zkhTEuzRwIQheDLaYhIVpFS7ojB8+oZqy0R9Kg0bMUSedXEouYH4qhF8T8mQPGCXt4cI
 ECrMkNR1CrIlifvl/wh/GZYWbrYR/zCHo6hBfc+NvBxhlR2v/PqafgDNtggS/I7iO8WK
 reLPnVbSwTqWQnIVs6yyg9oSQxZQ6rgGPuAPj5G3pTGNOGu+aXYIMgWhIXXzYk2HU04i
 N/l8NTPxMAgo75SXzaW5VtwP+I6AXRE6ag++Z8tpmQ0NSQwGFD0eHEWwC2c2aKFmmVQD
 oV4w==
X-Gm-Message-State: AOAM532vsnCykNEF5JkQMmnZSAIpiLqV4FHRHWPUSdIoNWP1aQLVrGj8
 rQbDC2tbgmvl4JCo45DQJfHrUVLTjXp3KAS6nN+PYA==
X-Google-Smtp-Source: ABdhPJzb1eF+H7SQdr5ic1GZqIMIfLsKmdGEtadZ2F1hyOuZbWr/cgjdxlUVeSHl72yR9JRuHYa3dyZlsxsodk0gZic=
X-Received: by 2002:a2e:998e:: with SMTP id w14mr5942998lji.100.1605774929224; 
 Thu, 19 Nov 2020 00:35:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605688147.git.agx@sigxcpu.org>
In-Reply-To: <cover.1605688147.git.agx@sigxcpu.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 Nov 2020 09:35:17 +0100
Message-ID: <CACRpkda97nJ+nJX4CuZHQnDVh1mhykc_vb6xFh7BcAWQoNjz7Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] drm/panel: mantix and st7703 fixes and additions
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, allen <allen.chen@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTgsIDIwMjAgYXQgOToyOSBBTSBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hj
cHUub3JnPiB3cm90ZToKCj4gVGhpcyBhZGRzIG5ldyBwYW5lbCB0eXBlIHRvIHRoZSBtYW50aXgg
ZHJpdmVyIGFzIGZvdW5kIG9uIHRoZSBMaWJyZW0gNSBhbmQKPiBmaXhlcyBhIGdsaXRjaCBpbiB0
aGUgaW5pdCBzZXF1ZW5jZSAoYWZmZWN0aW5nIGJvdGggcGFuZWxzKS4gVGhlIGZpeCBpcyBhdCB0
aGUKPiBzdGFydCBvZiB0aGUgc2VyaWVzIHRvIG1ha2UgYmFja3BvcnRpbmcgc2ltcGxlci4KPiBJ
dCBhbHNvIGFkZHMgYSBwYXRjaCB0byBtYWtlIHN0NzcwMyB1c2UgZGV2X2Vycl9wcm9iZSgpLgo+
Cj4gY2hhbmdlcyBmcm9tIHYxCj4gLSBhcyBwZXIgcmV2aWV3IGNvbW1lbnRzIGJ5IExpbnVzIFdh
bGxlaWoKPiAgIC0gZml4IGFscGhhYmV0aWNhbCBvcmRlcmluZyBpbiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKPiAgICAgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvZHJpLWRldmVsL0NBQ1Jwa2Rhb19UTWNwUnNkSz03SzVmTktKc2UwQnF3azU4
aVd1MHhzWGRETmRjZmZWQUBtYWlsLmdtYWlsLmNvbS8KPiAgIC0gYWRkIHJldmlld2VkIGJ5IHRv
IGFsbCBleGNlcHQgNS82LCB0aGFua3MKClRoZSB3aG9sZSB2MiBsb29rcyBmaW5lIHRvIG1lLCBJ
J2QgZ2l2ZSB0aGUgZGV2aWNldHJlZQptYWludGFpbmVycyBzb21lIHNsYWNrIHRvIHJldmlldyB0
aGUgRFQgcGF0Y2hlcyB0aGVuIEkgY2FuCmFwcGx5IHRoZSB3aG9sZSBzZXJpZXMgdW5sZXNzIHlv
dSBoYXZlIGNvbW1pdCBhY2Nlc3MgeW91cnNlbGYsCmp1c3QgdGVsbCBtZS4KCkZvciBhbGwgdjIg
cGF0Y2hlczoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJv
Lm9yZz4KCklmIHlvdSBoYXZlIHRpbWUsIHBsZWFzZSByZXZpZXcgbXkgczZlNjNtMCBzZXJpZXMu
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIwMTExNzE3NTYyMS44NzAwODUt
MS1saW51cy53YWxsZWlqQGxpbmFyby5vcmcvCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1k
ZXZlbC8yMDIwMTExNzE3NTYyMS44NzAwODUtMi1saW51cy53YWxsZWlqQGxpbmFyby5vcmcvCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIwMTExNzE3NTYyMS44NzAwODUtMy1s
aW51cy53YWxsZWlqQGxpbmFyby5vcmcvCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
