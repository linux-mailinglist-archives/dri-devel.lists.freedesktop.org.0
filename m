Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6905F2B704A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 21:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEA089BAE;
	Tue, 17 Nov 2020 20:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CB189BAE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 20:40:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s30so32016754lfc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 12:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5O26wK6ZwRs5vg1Qkg4ioltHAshqMgwowNUpC8UIpCI=;
 b=kDoygA1AHcokY8M9AQIkp8xfBXm6+EPG0LfAD1aNHZSw/+ciWKhohQ5+/dhPHIKyFc
 Tkt7+xjxoHvcJ2I5FQTtU0FfLf2vlCTX4kBbd9OFw51Fw0jmBuGWHne6RjyyKxBuMVhA
 KMaTCPGh2WB/kFwaJ7fLjenfJ+9rCyrNIjqCMb2wC3sM65/0aHp8GvPDaW6b4JS1NyIY
 TfHEGFPR7e946MbKcdgUqmDqS+rs86qINmqtK60vjikTRi0ex6QTXIZFDRiLKo1uzY0e
 hE3xytSNoUn76SV7/UfGvRXFmni8esyP8ddpiH5uuqD05qxWPYIxAaDOr2XpbvyPNb6i
 eu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5O26wK6ZwRs5vg1Qkg4ioltHAshqMgwowNUpC8UIpCI=;
 b=AeN4r4I3HoovQnsZIS3hQThuT0EtDigUvYI9eCq//D7pcpSf69Q1DAotZplgbni9xZ
 Wwo773mBzJN9FRrGaqPqnF0bxNPtxCMjtpg+WfSf8JKYen4ouEgwzhC8zEo9b1Jgh7TP
 IAAgnn3LRk51Jsc0ZRtjGpbrIWrwIwM+Rwf0QE1p7NGfPCCjuKYVDjTeBkPO56BcJxDF
 VVf5da1WmXP7BFE3K0VtxJlFhJQBAu5L8HM/iBA1u73047gVgirEAL+T1YzsfrGQCFy/
 I0VsnHN0/bQXbTHbIx4xCgB6kpY8NkkpU/XYJjw7cWPlDkIKpyQDBqpYxGrP92Az1xDA
 br3Q==
X-Gm-Message-State: AOAM530pwwiCJZPyRQqnZMAl4K49cqKD8HDGs0QQh7jprigkR6jhFp8n
 ZLjzy804rL2FfwkpCEkVNvL3YNuv7iBx6FJYELFE2Q==
X-Google-Smtp-Source: ABdhPJy1rf9o0mryoLstKB7uDAsq71sImAeQEGBms3pp2vMP18NF/F1WATntf+diyrbKzkPyXkX/swGk3hzNqzyKpCA=
X-Received: by 2002:ac2:4ac7:: with SMTP id m7mr2260698lfp.572.1605645634325; 
 Tue, 17 Nov 2020 12:40:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605635248.git.agx@sigxcpu.org>
 <905595a5a25c6b8fb7760877fb93d057e98ce717.1605635248.git.agx@sigxcpu.org>
In-Reply-To: <905595a5a25c6b8fb7760877fb93d057e98ce717.1605635248.git.agx@sigxcpu.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Nov 2020 21:40:23 +0100
Message-ID: <CACRpkdY84ppTs1MLUm3qHng622VDSWejaZC5M-fkpnmeOR9xZA@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm/panel: mantix: Support panel from Shenzhen
 Yashi Changhua Intelligent Technology Co
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
cHUub3JnPiB3cm90ZToKCj4gVGhlIHBhbmVsIHVzZXMgdGhlIHNhbWUgZHJpdmVyIElDIGFuZCBo
YXMgdGhlIHNhbWUgcmVzb2x1dGlvbiBidXQgYQo+IHNsaWdodGx5IGRpZmZlcmVudCBkZWZhdWx0
IG1vZGUuIEl0IHNlZW1zIGl0IGNhbiB3b3JrIHdpdGggdGhlIHNhbWUKPiBpbml0IHNlcXVlbmNl
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KClJl
dmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3Vy
cywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
