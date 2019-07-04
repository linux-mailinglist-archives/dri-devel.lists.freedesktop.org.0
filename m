Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A50A5F98D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 16:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DE36E348;
	Thu,  4 Jul 2019 14:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161156E348
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 14:01:41 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id j21so1175058uap.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 07:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O04x2ulKFR4lH0qCc3IvLEAKxw3XBaeHh0xnlMVU8/E=;
 b=CJ0aXe8au3Ffee8vlhzcPFl/iPc+IEb1Ajc0xXHRiml8GfV2shpyPwgEF3RtC+TeHF
 AmIhMm5zefW6cJidlDl7qyAJa0Ll5PWSIKJhs+6MS0Am0Nw0IY6bRpwE6iuR/6oK6eEk
 ttn+ymJ/aEOM5xhXi2Pu2DpLYo+Y6EbXE9NuVXSLlRIe8LkqMdq9+2YCSP/8NVUOhwei
 SzGit0+v5gifWAeaRdISdvfyM8JpbyABcr17BS94O4PjYzJtbKExrXflSsnXg5RD1Fpi
 mfUqDjHiEmErOspCkD0PkE144ScJKaZCurInHFCqoC/mF4xpQ0hloSyn4SeviqgtZWkF
 SE7A==
X-Gm-Message-State: APjAAAVDyeWu7rPEv06j3FESzn8UApg6vzCG4YLNahTUJsIsEj0tSptQ
 XzdnNu4K3SuS9Ny3e+Y8oJyh0qCOY6n65hfFzK8p1w==
X-Google-Smtp-Source: APXvYqwQIBLf59afCJDgEhHp4QzjjXOuS1sjVesW9pTDcRKk+fRQSmiSs4t3/d0NQhEJwn0v8y9e+5e9/NR2ZZq1B3o=
X-Received: by 2002:a9f:3770:: with SMTP id a45mr13694891uae.64.1562248899590; 
 Thu, 04 Jul 2019 07:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190625203644.4423-1-daniel.vetter@ffwll.ch>
 <20190704083912.GL15868@phenom.ffwll.local>
In-Reply-To: <20190704083912.GL15868@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 4 Jul 2019 15:01:47 +0100
Message-ID: <CACvgo52M=xAYqE6N2zYDT1Rmnjogp8PA5Ahf3YCHU5032k22Kg@mail.gmail.com>
Subject: Re: [PATCH] drm/doc: Document kapi doc expectations
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=O04x2ulKFR4lH0qCc3IvLEAKxw3XBaeHh0xnlMVU8/E=;
 b=ArSwC2MgkJhgv/b0M6Oz0yk/r+XI/T6hSoQ0DzuPKF51riuBAEq4q3cymKaZCgepxq
 ogOkg0mkSZcXLkjhMcC0VC4jKiqGqFHfQPiC0nlPRbVZU/nkQn1RQQZ6lwIaKbhmMoHy
 tim7c+zevS38SSqqoBEB1tffrAMX8wSNhXKX3ISCG6J376k3kOADs7NgviYgnZg4/2cA
 YTWU0BL5Ehs9NR1+VAU7t9vGG/Ozx3Rjxp5cO5s05fcWpz8240SBxUi2ywR4A00n9+oH
 B4xDuYkAiTmX/VRGsotm3vLYcM+i0Anj74Zb7rBBAqs2K+7cv2itJ6BBcZ+Jc5WttHVE
 Rlyg==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA0IEp1bCAyMDE5IGF0IDA5OjM5LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6MzY6NDRQTSArMDIwMCwg
RGFuaWVsIFZldHRlciB3cm90ZToKPiA+IFdlJ3ZlIGhhZCB0aGlzIGFscmVhZHkgZm9yIGFueXRo
aW5nIG5ldy4gV2l0aCBteSBkcm1fcHJpbWUuYyBjbGVhbnVwIEkKPiA+IGFsc28gdGhpbmsgZG9j
dW1lbnRhdGlvbnMgZm9yIGV2ZXJ5dGhpbmcgYWxyZWFkeSBleGlzdGluZyBpcyBjb21wbGV0ZSwK
PiA+IGFuZCB3ZSBjYW4gYmFrZSB0aGlzIGluIGFzIGEgcmVxdWlyZW1lbnRzIHN1YnN5c3RlbSB3
aWRlLgo+ID4KPiA+IEFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+Cj4gPiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgo+ID4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+
Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+
Cj4KPiBGcm9tIGlyYzoKPgo+IEFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJk
QGJvb3RsaW4uY29tPgo+CkZ3aXc6CkFja2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtv
dkBjb2xsYWJvcmEuY29tPgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
