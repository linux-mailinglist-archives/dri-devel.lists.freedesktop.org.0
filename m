Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E242E318E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 13:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CAE898C0;
	Thu, 24 Oct 2019 11:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8005898A8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 11:55:51 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n7so1679405wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 04:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=fMCWUrlCZri1tyy5DHaQQhL1mQYk6mcOKGtMSm6ofig=;
 b=hsJcyYpRRHvbcLxqIA8DuHiaC7MTpDrJ1O9DMiNg+IhAOPkYVCHOUZpLRFJVNAQveK
 VAEom3INcXSDA4y0bNmVJVlN1Jp66iAsafNujGMVs1PrpT/zyJCydWOfg/0Zvj8hZVRd
 qCkCkloxYMVBm/kdybyRKFZnKJDaDrCsXn3iHWKO4s7/rz/brMI8JfGBbGEQ0Zbk6ZjK
 xpH4VjWACTVgDATspW33Dk7f/en4ilX7p/ibz97t5axRXUQPboeUDfzK8RB28bU+98C/
 9tYg/HgtMH2V3uBb+1U+P5tFAHdGBOohNsacesI1iF1PxNr4cL4oHIhCjKh/lVKCZ8me
 R09A==
X-Gm-Message-State: APjAAAXJlG/hEu9FD0Z1Gw4iS9L6FGbI4Ewq+mdCirVcf6rB7r6d0ODL
 9YcRBXXpX9juYuS95Y3fT2APDA==
X-Google-Smtp-Source: APXvYqylCae/EuzS65l6wbHAFqm4hgukqcyE28cmZMpidJzZ8iwZnHwIAysao+RlmEvihQzMWUsrBg==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr4450754wmb.77.1571918150317; 
 Thu, 24 Oct 2019 04:55:50 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id w9sm18297328wrt.85.2019.10.24.04.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 04:55:49 -0700 (PDT)
Date: Thu, 24 Oct 2019 13:55:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/simple-kms: Standardize arguments for callbacks
Message-ID: <20191024115547.GA11828@phenom.ffwll.local>
References: <20191023101256.20509-1-daniel.vetter@ffwll.ch>
 <CACRpkdYfh=9oextiC1rtQ2UQ72OW_0TqjCe4AmvRtXKVv_ZazQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYfh=9oextiC1rtQ2UQ72OW_0TqjCe4AmvRtXKVv_ZazQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=fMCWUrlCZri1tyy5DHaQQhL1mQYk6mcOKGtMSm6ofig=;
 b=WelQ6YKgfVysp9cjI2lEt7r4WRC7RmeWPYzn2UuB2hVHM8EUEtuOsZRsRT79HFqIIz
 oEvDsyJr+T+iwYLfcClbgLgcJpEQIIySj6JbZZTuy5Wo9XcbWNldORZfBj0pkbIw1nKg
 ar51gMC1BMvFyy7OQ+7yC0Z7BqkJVdn1QevLs=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDU6NDA6MzJQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCAxMjoxMyBQTSBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKPiAKPiA+IFBhc3NpbmcgdGhlIHdyb25nIHR5
cGUgZmVlbHMgaWNreSwgZXZlcnl3aGVyZSBlbHNlIHdlIHVzZSB0aGUgcGlwZSBhcwo+ID4gdGhl
IGZpcnN0IHBhcmFtZXRlci4gU3BvdHRlZCB3aGlsZSBkaXNjdXNzaW5nIHBhdGNoZXMgd2l0aCBU
aG9tYXMKPiA+IFppbW1lcm1hbm4uCj4gPgo+ID4gdjI6IE1ha2UgeGVuIGNvbXBpbGUgY29ycmVj
dGx5Cj4gPgo+ID4gQWNrZWQtQnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPiAodjEpCj4gPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Cj4gPiBDYzogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gPiBDYzogR2Vy
ZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gPiBDYzogRXJpYyBBbmhvbHQgPGVyaWNA
YW5ob2x0Lm5ldD4KPiA+IENjOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPgo+ID4gQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCj4g
PiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+ID4gU2lnbmVk
LW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gCj4gTWFr
ZXMgcGVyZmVjdCBzZW5zZS4KPiBSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPgoKVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rLCBhcHBsaWVkLgotRGFu
aWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
