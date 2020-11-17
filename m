Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1642B7028
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 21:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258EE6E0A0;
	Tue, 17 Nov 2020 20:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBCB6E067
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 20:35:30 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u18so31946864lfd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 12:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CUqG2S3O5iVKKIdkeqzaWrGNBNP8isqkl4rsycIm70U=;
 b=oWhwGjqYt6rOLIpCStPQBXV8QWtZnwUn/hQGu52cU3RUIPT5wxF/peJnuiQHp87yzn
 q1KV/E/rxa6f2f3yZOqY0DAEe+DMtfwyiGPz8ajXUwPF5KpNzzEjLuUcOOsMpfFBnRlk
 cJROJM55gDbZHFVVLUmOc0MjHJKTec80sVQOWzihCtp9FIDskjS0Eo/TIrpzJpNhlgaS
 XnSUsK2555TuXhrzI5tYV6En9AkpSonFJSuGXk1n8kJJXUOVYR4pAFn5oQqEbSAqCWqW
 E1ER1hg6dzTIv1qln8i5nHRQYA05BHveho1X0IOLmu735CVMH6OzBxtn/zeHBY4JwQkX
 9nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CUqG2S3O5iVKKIdkeqzaWrGNBNP8isqkl4rsycIm70U=;
 b=KqinydQnkHw4of7dwBwdXMxONhR/crDqMjV4TfwmJ5Ru7I5Bq1lGrWFpE/IXl6DOHK
 8QrjMvBod/zkKqvtsaMEb1wuNMfooWFZisG5yal5gz8WZYmQxPQoNyOrcDoCGJSBnUQn
 S3rGxZn4jF/vIgzci0f410hwGTs+5Sm3La+fO5xX3gHfIJJY8n7CbAK0GgRvPZ2sZxL1
 fdgGOUcEbrAHLIzz9CUPKH2qYH/nlRJ0+QiFRLz4bp4gSUq/lOyyra3KxWECEHE0C8JC
 NZVpTuy6G5BXPrwDeEjycM2A2C+k8CvvJ5R9wUoToX7GhJKLauOhtvtBO06P7lCFconU
 jAyQ==
X-Gm-Message-State: AOAM531RK6ehd0X15emawSMtvmgt5k5TI54TO7tjY3O+XW3IormxEvJb
 qyyq93Py1iuPuNZ9JfvIlkLBHUkVR7TrHhprCQhKjw==
X-Google-Smtp-Source: ABdhPJwCDvm4/w79+gK5F8PMQmv1tpX3mMErfW/IFt4EzZL/b27lJfAggTSLrQyOPxfCwI6a1O+grGFL5Rq39GYdYr8=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr2565896lfc.260.1605645328269; 
 Tue, 17 Nov 2020 12:35:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605635248.git.agx@sigxcpu.org>
 <85b58da3eb68b81c1bdf7fc2f4a38b1f9ad8c90a.1605635248.git.agx@sigxcpu.org>
In-Reply-To: <85b58da3eb68b81c1bdf7fc2f4a38b1f9ad8c90a.1605635248.git.agx@sigxcpu.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Nov 2020 21:35:17 +0100
Message-ID: <CACRpkdZ982o2pNbg0Zcfma80HmemRWyLBmsgeqpQTUdknD1=UQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] drm/panel: st7703: Use dev_err_probe
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

T24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgNjo0OSBQTSBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hj
cHUub3JnPiB3cm90ZToKCj4gTGVzcyBjb2RlIGFuZCBlYXNpZXIgcHJvYmUgZGVmZXJyYWwgZGVi
dWdnaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9y
Zz4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
