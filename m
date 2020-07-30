Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6F923333C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 15:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E4F6E0D2;
	Thu, 30 Jul 2020 13:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE15F6E0D2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 13:40:51 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id e20so1408872uav.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 06:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WsCdfgJURhLVnCtIFPQA2QU9emiYE5zg7qku4JiqsJo=;
 b=Er/9Putb1+WactFeNmQQN0UbYyHJjnRVzwzjYJ9A/Ji/9r2pa2324Hg0FJctBdKh7X
 QmvpBMCT/aiZOattUbPFEglgDU3BXEJu+Bl/Z8OQ3D+uOw/TBgPMRIxU7tJklxCWZR/G
 fpKWd4vN2ehyFHHEITClErM5nWv94LoHOzlv1cb8FcnKKm6cUixNgWACMoTH3pEFeaJX
 lt9hL6RgarLisjlrEJiOUVL0hYQb1LmcC6HR62zdU5ywI0K2zsAlOek3hp6OAGrymbK6
 Mmq4kr2opLPgh0+0SiY26iaLLM96RbmrCtgRx+wJfharteBxn+a5hlfK0ldi0RaxNc/s
 yvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WsCdfgJURhLVnCtIFPQA2QU9emiYE5zg7qku4JiqsJo=;
 b=H70DNIP42qtuIkWm8MoF/1zGwS6wyzISxDYkqwB45se16UHv55TLyv157BKv941zxx
 NjN/NHdoe/P6fneXqR+ugB/RuG7dGtYU9cpH2xXCGs/srYF6J7pXMufHAh0r5w1rohvR
 htxUdEqfKlL62EcY4wTqX9jSiM8EVdepIawtA1rLc7m3ePN5hwPibNDp+dE91amy1Uws
 0u/+J7Dc6dMmyybCkFuCgIg5bhgioBSMAcKysqRSma8xej/J9zEDpfyBmqtDGKI3me33
 81lFMqsrFCFGLoS9OohIvrNhNyB5b0Ie/HQcpyxvg0bzkLnswkUBPBqPImiXmqJJkUaA
 XrXg==
X-Gm-Message-State: AOAM532uprLMgscr0u8WrxiszbC2SV0yUYhGLUcAPRtZ+kgIvn4jWM/r
 sW2oPrvqxuw6eL7IASmEypryGLiuQkOhY00cWOU=
X-Google-Smtp-Source: ABdhPJxvJSiJ5DrzGXJrjb8f4Cbx6Ac6xmQnHa5scaW23z9pJGpI6UTgbNXb8yiHsrxHZf4lmGPHcwNCHmFxMz5Z/B0=
X-Received: by 2002:ab0:486d:: with SMTP id c42mr2144564uad.64.1596116450932; 
 Thu, 30 Jul 2020 06:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200707113805.30936-1-ppaalanen@gmail.com>
In-Reply-To: <20200707113805.30936-1-ppaalanen@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 30 Jul 2020 14:35:54 +0100
Message-ID: <CACvgo53Skx3=0gMejLxWYL8qdurGrTcZJ9jYsD+8PvyPM0xA7w@mail.gmail.com>
Subject: drm/doc: missing SPDX license identifier (Was: Re: [PATCH v5]
 drm/doc: device hot-unplug for userspace)
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
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
Cc: Ben Skeggs <skeggsb@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGVra2EsCgpUaGFua3MgZm9yIHRoZSBwYXRjaCAtIG1lcmdlZCB0byBkcm0tbWlzYy1uZXh0
LgpXaGlsZSBhcHBseWluZyB0aGUgcGF0Y2ggdGhlIGZvbGxvd2luZyB3YXJuaW5nIHBvcHBlZC11
cC4KCi06Mzc6IFdBUk5JTkc6U1BEWF9MSUNFTlNFX1RBRzogTWlzc2luZyBvciBtYWxmb3JtZWQK
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXIgdGFnIGluIGxpbmUgMQojMzc6IEZJTEU6IERvY3VtZW50
YXRpb24vZ3B1L2RybS11YXBpLnJzdDoxOgorLi4gQ29weXJpZ2h0IDIwMjAgRGlzcGxheUxpbmsg
KFVLKSBMdGQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg4pSCLS0KClVwb24g
Y2xvc2VyIGxvb2ssIGl0IHNlZW1zIHRoYXQgdGhlIERSTSBkb2N1bWVudGF0aW9uIGxhY2tzIGEg
bGljZW5zZS4KQW4gU1BEWCBvbmUgYXQgbGVhc3QgLSBJIGhhdmVuJ3QgZG9uZSBleHRlbnNpdmUg
cmVhZGluZyB0aHJvdWdoIGVhY2gKaW5kaXZpZHVhbCBmaWxlLgpJIGd1ZXNzIHdlIHNob3VsZCBh
ZGQgb25lIC0gYmUgdGhhdCBHUEwtMi4wLCBNSVQgYW5kL29yIG90aGVyd2lzZS4KU2luY2UgSSBo
YXZlbid0IGNvbnRyaWJ1dGVkIHN1Y2ggdGhhdCBtdWNoIG9uIHRoZSBkb2N1bWVudGF0aW9uIHNp
ZGUsCkknbGwgZGVmZXIgdGhlIHN1Z2dlc3Rpb24gdG8gdGhlIG1haW50YWluZXJzLgoKRGFuaWVs
LCBEYXZlLCBjYXJlIHRvIGRvIHRoZSBob25vdXJzPwoKVGw7RFI6IHRoZSBEUk0gZG9jdW1lbnRh
dGlvbiBpcyBtaXNzaW5nIFNQRFggbGljZW5zZSBpZGVudGlmaWVyLgoKVGhhbmtzCkVtaWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
