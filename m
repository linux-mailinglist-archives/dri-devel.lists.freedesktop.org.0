Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D17B2C97
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 20:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578506F551;
	Sat, 14 Sep 2019 18:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47B06F551
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2019 18:58:16 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id w67so24460473lff.4
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2019 11:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h9T2Df0KjH101ElzcVxUw1FxV6D3+L4nI+Law0dbRy4=;
 b=tVxvUr9z4N0tipPOGDaVMqOgTZiC6YgAq+2zVvESuweUrfs3BoOOQIV3NIafxDhYQP
 VJnY8E6S+NN7bz547US7F0IfaZTmWA13GsttMaXieVWikHaIhzEfzBnIVchKsHYXAgHI
 mmYF/3SCVEY6ZSv/ZskzP4Bcc5bmBWOjMs/yhO9NnGqWbpSbSijrT/27aoQeXuiehewd
 3NuAtL1+nGxOqZsMH7ZVO/tId4/8oNy6RtRXhq+5rBs9dIML0l+CvBfM8Nhdx5nxdZng
 JqlBNpUr+KvfSHTOW+IUvLiBfpNls/CTqvsIa5pg5Fjl9Xrg9auF5P5rBGYox794IeQr
 eVJw==
X-Gm-Message-State: APjAAAVprpkkvpYJjnSARvaFWqlT/HsCGmL48nZXYhTynXLhh+TPMaYE
 lR8iDnjbspjMV50+zAKS1irvvRu8gM0=
X-Google-Smtp-Source: APXvYqxh+KUzfThTyH2kNwyGyfJdwD8XtfXO6rFU92asBJZ+CLJNP9aeWsR6Z00FR0B8pxc+Kt4mNg==
X-Received: by 2002:a05:6512:210:: with SMTP id
 a16mr33417784lfo.42.1568487494145; 
 Sat, 14 Sep 2019 11:58:14 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id x18sm7022383ljc.51.2019.09.14.11.58.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2019 11:58:12 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id c195so9585504lfg.9
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2019 11:58:12 -0700 (PDT)
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr34936394lfp.61.1568487491890; 
 Sat, 14 Sep 2019 11:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tws0GHMQd0Byunw3XJXq2vqsbbkoR-rqOxfL3f+Rptscw@mail.gmail.com>
In-Reply-To: <CAPM=9tws0GHMQd0Byunw3XJXq2vqsbbkoR-rqOxfL3f+Rptscw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Sep 2019 11:57:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wja+f_PCuibu+NqkTD_YL1AY2x4wgX6EwQ3oxCyMTw_9w@mail.gmail.com>
Message-ID: <CAHk-=wja+f_PCuibu+NqkTD_YL1AY2x4wgX6EwQ3oxCyMTw_9w@mail.gmail.com>
Subject: Re: drm fixes for 5.3-rc9
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=h9T2Df0KjH101ElzcVxUw1FxV6D3+L4nI+Law0dbRy4=;
 b=MOyVrEu6UmGVN4sTwsa/UWQEkUMczcxFBYYr8mVpBJvuuAF63Fm4OBytPLXkB7TXBC
 F4pS1BG12Z1TXOJj44TYpOfOGhZqXDHyM4cwTKft9zb8wq8Rx6seNb516HVcRyIl0Lru
 p3u7T22+Ubj/c8y0owXwgT+aZAvgt9Fr4pLeE=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgODo1NiBBTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gSGV5IExpbnVzLAo+Cj4gRnJvbSB0aGUgbWFpbnRhaW5lciBzdW1t
aXQsIGp1c3Qgc29tZSBsYXN0IG1pbnV0ZSBmaXhlcyBmb3IgZmluYWwsCj4gZGV0YWlscyBpbiB0
aGUgdGFnLgoKU28gYmVjYXVzZSBteSBtYWlsYm94IHdhcyBtb3JlIHVucnVseSB0aGFuIG5vcm1h
bCAoYmVjYXVzZSBvZiBzYW1lCm1haW50YWluZXIgc3VtbWl0IHRyYXZlbCksIEkgYWxtb3N0IG1p
c3NlZCB0aGlzIGVtYWlsIGVudGlyZWx5LgoKV2h5PyBCZWNhdXNlIHlvdSBkb24ndCBoYXZlIHRo
ZSBub3JtYWwgImdpdCBwdWxsIiBhbnl3aGVyZSBpbiB0aGUKZW1haWwsIHNvIGl0IGRvZXNuJ3Qg
dHJpZ2dlciBteSBzZWFyY2ggZm9yIGltcG9ydGFudCBlbWFpbHMuCgpUaGVyZSdzIGEgImdpdCIg
aW4gdGhlIGVtYWlsIGJvZHksIGJ1dCB0aGVyZSdzIG5vdCBhICJwdWxsIiBhbnl3aGVyZS4KQ291
bGQgeW91IGFkZCBlaXRoZXIgYSAicGxlYXNlIHB1bGwiIG9yIHNvbWV0aGluZyB0byB0aGUgZW1h
aWwgYm9keSAtCm9yIHRvIG1ha2UgdGhpbmdzIF9yZWFsbHlfIG9idmlvdXMsIGFkZCB0aGUgIltH
SVQgUFVMTF0iIHByZWZpeCB0byB0aGUKc3ViamVjdCBsaW5lPyBPciBhbnl0aGluZywgcmVhbGx5
LCB0byB3aGF0ZXZlciBzY3JpcHQgb3Igd29ya2Zsb3cgeW91CnVzZSB0byBnZW5lcmF0ZSB0aGVz
ZT8KCiAgICAgICAgICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
