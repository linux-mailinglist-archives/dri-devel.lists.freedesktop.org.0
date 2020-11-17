Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C842B7040
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 21:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0E189B9A;
	Tue, 17 Nov 2020 20:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA6589B9A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 20:39:38 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id f11so32015129lfs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 12:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TW4fOYeIg/u1zGPE0iEC2QQGsw2Uq7uzL4wMscSA2zk=;
 b=T5exhl46sT7EUaNZjoY5MMETY+QO3+bwfOtvS0a3Hp4vgrq4rwlfc5TRbeNNOGwEx7
 ec6q91FR+mP57JAWKDUSTxGUp06+33YD4O4i8rlXwgWYcOoWVIky0NBIvkWTrxIvNap3
 waJQ8iEG0FrgWTDtBV1rk9Ys8gTtJIU/oqHKswqJ0bViixHg4vyhoSPTT4JDaN+Dyuus
 Ni8acRhtrUcv68l6oSvoTvMuYdQKvL5aCTnO/nOFRk5H0V4ISOR6htWuq34/Ji+9zvRP
 nytQN6G8ewc0T3avod8tKilMvx5xEtJBN8TgGfzWPN0DVSvIscw/nbwxlDUkae5v6mJc
 aotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TW4fOYeIg/u1zGPE0iEC2QQGsw2Uq7uzL4wMscSA2zk=;
 b=er6/D1qOBt0wqRoDPzI4y+pX5EWYi3GwXZXS7myUBxX0nVccPFf3KXG8au38lUsOFD
 BGyFJr0NfJiNXChgVcv7vVPShQmMzO2cYjitmuI9HiaauY4rcqxSKP9HP/Q+MW2uYUHI
 ZFA5FyigPLS3UrhcBhuqYaCgKmYKj4HGhfpdkatlA7yqls9ru0oYOfFjfqVOPmxG93VH
 ujlM+L+V5ENMfhmvVTEXEhKZbUZ4e//Co3CY8z4C6svURtatQ2frmmzwLX7OwvezSmF+
 lWB1sZiBhZbAAC3GLZKCEmrx/tGkWtE7oWhx90GIjG9P71flc2UPvF0+lerK6HP5I3qn
 HCvw==
X-Gm-Message-State: AOAM531639YAedKDFF71dDc/S5aRk08tFeK2/++QJEIjJCQDfe2hcoHh
 WsDxCkSbFK22wb4NqNEANgMTefAne0FAJkvRVE3+LA==
X-Google-Smtp-Source: ABdhPJwYT09wCqu7ROVdSFo8fIUdRO7ngevgHInPjXkOSe8hUIn1JpiOhcoYMkkFEb2MJtlIp1ObjNrWlbJN8LLfq0Y=
X-Received: by 2002:a19:e08:: with SMTP id 8mr2225929lfo.441.1605645576700;
 Tue, 17 Nov 2020 12:39:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605635248.git.agx@sigxcpu.org>
 <567ba3729289c2cf907bda2578e97752e20e143b.1605635248.git.agx@sigxcpu.org>
In-Reply-To: <567ba3729289c2cf907bda2578e97752e20e143b.1605635248.git.agx@sigxcpu.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Nov 2020 21:39:25 +0100
Message-ID: <CACRpkda3c_=ygcixJppOR5cuTm1yMUdHt-fa18i3v-gQNtDXvQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] drm/panel: mantix: Allow to specify default mode
 for different panels
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
cHUub3JnPiB3cm90ZToKCj4gVGhpcyBjYW4gYmUgdXNlZCB0byB1c2UgZGlmZmVyZW50IG1vZGVz
IGZvciBkaWZmZXJudCBwYW5lbHMgdmlhIE9GCj4gZGV2aWNlIG1hdGNoLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KClJldmlld2VkLWJ5OiBMaW51
cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVp
agpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
