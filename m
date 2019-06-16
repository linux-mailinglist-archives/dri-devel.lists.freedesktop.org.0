Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB0C47372
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 09:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AC98925C;
	Sun, 16 Jun 2019 07:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEC089237;
 Sun, 16 Jun 2019 07:01:48 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id v6so4282233vsq.4;
 Sun, 16 Jun 2019 00:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7crVfbYhJ6xB5Bt0A3HdB7eKG4FlOwOiRd8j3CnoOFs=;
 b=UHZtSPP0h4HWZKIBziAmJacD2fKfXoG0DXKc+vYSeLNsLlx+kUQ9P2mS0IOkrZqu7e
 kF30bQgRRt1p4DPS5tvBWH5etaHI7MpXA00y4JyoIXCwfJ/4wiEIgPkfprrk3a/8Jc3d
 dN+cNdTfeEGFWnpSBHV8A6MbMJYOOuHO3nbeMj2o8dowY7PBx0bs1C+BsAgU+6XP3rcu
 pppbpR4L+/1iT4g0ZN+tLOIuFKwyEDY7yGLcjpHJGwtq/wqZQ8df6nO4ATonk9oVqpdY
 06rkJyJ2jZHWDLOG79godukIuVEg56ibJuOrkJCZNDo0MJ5bcR12SGIY9jJN/gIToXZ8
 48VA==
X-Gm-Message-State: APjAAAXxkdccXGjZhLq3SwTXDMj4fXTowVpoqTorvqXlSDQ1EEkjs9kr
 4vDhmf16UjANrB/PCXoO/NFW8zh2TDDSE/bGm38=
X-Google-Smtp-Source: APXvYqwVRgrnF6hURtKfjNhnxwnPbQm7HPDLyJ+Na7xAyWyerqYXX/KdZRn+Lz/hyEIMWgBAp+vkYC+G6QbCHdjZez8=
X-Received: by 2002:a67:d082:: with SMTP id s2mr8036407vsi.96.1560668507580;
 Sun, 16 Jun 2019 00:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-14-daniel.vetter@ffwll.ch>
In-Reply-To: <20190614203615.12639-14-daniel.vetter@ffwll.ch>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 16 Jun 2019 09:02:12 +0200
Message-ID: <CAH9NwWccNpPdv-70WcaJHhK0425LCEUAKOj4QkuWuuPXzgJHTA@mail.gmail.com>
Subject: Re: [PATCH 13/59] drm/etnaviv: Drop drm_gem_prime_export/import
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7crVfbYhJ6xB5Bt0A3HdB7eKG4FlOwOiRd8j3CnoOFs=;
 b=rLVu4/JN+LAkP8EK6Qa3AnCsOsIrEa/2Vu2YNGO/SElW7aTDc/Sc3odqRaiKUjIkYv
 SXsaYu5kABVn0p1Q8Yd92RHL/abnymS2atfDUm+7hEgu0E1fDa2y2FbqvOx3oy4fdlIV
 smZEFO1uPT+h8pCgNtKUIjhJ8iQCyK4LsarVTSsobna6Fqdr2ED+CzUeVw2aYj7lzvp4
 uIc0NaHwkmqHGJ4ua+HmcYIeUJTBrjiIAq99c8Xmovnyux2uOWCkaP7vWM3ON2mDCqya
 HyvTOCn4ngQfq1yY84cRfdh/hXNPX5SJj7dXXi2b9VKxAa9JttTnpF//bhDbJTw59YWJ
 HUpA==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnIuLCAxNC4gSnVuaSAyMDE5IHVtIDIyOjM2IFVociBzY2hyaWViIERhbmllbCBWZXR0ZXIK
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ogo+Cj4gVGhleSdyZSB0aGUgZGVmYXVsdC4KPgo+IEFz
aWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0Y2ggdGhlIG90aGVycyBvdmVyIHRvCj4g
ZHJtX2dlbV9vYmplY3RfZnVuY3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gR21laW5lciA8
Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgoKPiBDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hA
cGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IFJ1c3NlbGwgS2luZyA8bGludXgrZXRuYXZpdkBhcm1saW51
eC5vcmcudWs+Cj4gQ2M6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFp
bC5jb20+Cj4gQ2M6IGV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2
L2V0bmF2aXZfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5jCj4g
aW5kZXggZGIzYjAwMDMxZmNmLi40MDBmYmIyNTg4ZjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L2V0bmF2aXZfZHJ2LmMKPiBAQCAtNDY5LDggKzQ2OSw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJt
X2RyaXZlciBldG5hdml2X2RybV9kcml2ZXIgPSB7Cj4gICAgICAgICAuZ2VtX3ZtX29wcyAgICAg
ICAgID0gJnZtX29wcywKPiAgICAgICAgIC5wcmltZV9oYW5kbGVfdG9fZmQgPSBkcm1fZ2VtX3By
aW1lX2hhbmRsZV90b19mZCwKPiAgICAgICAgIC5wcmltZV9mZF90b19oYW5kbGUgPSBkcm1fZ2Vt
X3ByaW1lX2ZkX3RvX2hhbmRsZSwKPiAtICAgICAgIC5nZW1fcHJpbWVfZXhwb3J0ICAgPSBkcm1f
Z2VtX3ByaW1lX2V4cG9ydCwKPiAtICAgICAgIC5nZW1fcHJpbWVfaW1wb3J0ICAgPSBkcm1fZ2Vt
X3ByaW1lX2ltcG9ydCwKPiAgICAgICAgIC5nZW1fcHJpbWVfcGluICAgICAgPSBldG5hdml2X2dl
bV9wcmltZV9waW4sCj4gICAgICAgICAuZ2VtX3ByaW1lX3VucGluICAgID0gZXRuYXZpdl9nZW1f
cHJpbWVfdW5waW4sCj4gICAgICAgICAuZ2VtX3ByaW1lX2dldF9zZ190YWJsZSA9IGV0bmF2aXZf
Z2VtX3ByaW1lX2dldF9zZ190YWJsZSwKPiAtLQo+IDIuMjAuMQo+CgoKLS0gCmdyZWV0cwotLQpD
aHJpc3RpYW4gR21laW5lciwgTVNjCgpodHRwczovL2NocmlzdGlhbi1nbWVpbmVyLmluZm8vcHJp
dmFjeXBvbGljeQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
