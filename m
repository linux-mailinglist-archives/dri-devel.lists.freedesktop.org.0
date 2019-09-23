Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1F9BB63A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 16:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EC76E88F;
	Mon, 23 Sep 2019 14:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C846E88F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 14:08:39 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id e205so5241058ywc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 07:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eLbXfyJzh+CNXjjxIUFpnYYGETQ4UqgCIVHyFOjnoV8=;
 b=dOdK3WvMuaECSTyvQLscvXr3EOlfWTZqeY499VyDaniwoSecsSsgQaPv6Qym5mrzQ7
 JKMF8Zx4Ah7s/c+X38L9D54ttNjkx99CcZAE3jxzVscJzCzRsMhopk2qqn0FwOnlMwrb
 U6kwXoFrMYMmjt18rkWjZetiui+HnrCGkL3kS1MtPzZtHD1YnrHMhUi4qZ21VyOZhfht
 dD6pTJdERySFGLaMcMzDpcycvYXKPd9ClcHaSBj49nJU17t04hX74aoShdmjzTSeKsYT
 eXw5Um6hv7luOhSZ39bA16FggeFppK3aS0NCfYIzus3khuayGaDI0yBKABU+/Jp7kA4c
 uAHw==
X-Gm-Message-State: APjAAAXUghWXhGDPp/M1RChOgR5AgYaQDhUUe+3LUlLJ+FrAE4vLdJ6p
 ssf1ymw052yK/39mEYrKc94/CA==
X-Google-Smtp-Source: APXvYqxnruDu0JvpWl1+7CxiyW2Ywlf37HwFjpHtml3Gro0m6A/4M7sAOHzqTO+ahIFUoPilpwn/8Q==
X-Received: by 2002:a81:4bc2:: with SMTP id
 y185mr22221130ywa.491.1569247718773; 
 Mon, 23 Sep 2019 07:08:38 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id e130sm2591425ywh.50.2019.09.23.07.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 07:08:38 -0700 (PDT)
Date: Mon, 23 Sep 2019 10:08:37 -0400
From: Sean Paul <sean@poorly.run>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/2] Documentation/gpu: Fix no structured comments
 warning for drm_gem_ttm_helper.h
Message-ID: <20190923140837.GA218215@art_vandelay>
References: <20190920193558.89815-1-sean@poorly.run>
 <20190920193558.89815-2-sean@poorly.run>
 <20190923065946.rlchr5hubkogutw4@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923065946.rlchr5hubkogutw4@sirius.home.kraxel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eLbXfyJzh+CNXjjxIUFpnYYGETQ4UqgCIVHyFOjnoV8=;
 b=Zbo5KJNatZHi8F0+zI8CGJr1tW/mUoHn4vEK5PVb0piMTlMc2nVpV1KBO4w2F+uTro
 KPiA3LiAGbSAfKu+menMBQ0NorPe69vNZHAt107ogBQ+g0gu/8sSSamPe+sJG/5U1UfQ
 0OkjH0sPMsruEswKxOb8L1Ewidk4urm4FRPUusPYYCu+POfx5WByescbXRN+Jm3Qswi1
 CwryXI6Y067HkWaPJBWKt0lrkmTffcMFuY4VZGGRcs94kCAbtVDaTYOnBQ4sD35VmPWg
 ZAiALGdUjGSUqHOkxo69pyRd1h4NqcUz7ImREZOp99LkHN3nRpMv6NAJFqduPcRCslMu
 9O4A==
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDg6NTk6NDZBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBPbiBGcmksIFNlcCAyMCwgMjAxOSBhdCAwMzozNTo1MlBNIC0wNDAwLCBTZWFuIFBh
dWwgd3JvdGU6Cj4gPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiA+
IAo+ID4gRml4ZXMKPiA+IGluY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oOjE6IHdhcm5p
bmc6IG5vIHN0cnVjdHVyZWQgY29tbWVudHMgZm91bmQKPiAKPiBSZXZpZXdlZC1ieTogR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gCgpUaGFua3MsIHB1c2hlZCB0byBkcm0tbWlz
Yy1uZXh0CgpTZWFuCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8g
Q2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
