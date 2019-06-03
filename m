Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0969E333AB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 17:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CB28928F;
	Mon,  3 Jun 2019 15:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A348928F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:36:43 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id i2so15469943otr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 08:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ysk87hK/RndHDoFsMlKY9s0HoBw2vJNWH9Bdud9a6w4=;
 b=AFDeh6tnWAvCMz3OwZkY76RC70gWMTkI4zs1ms7Vjiecco3i5I60Y3Uel50k+RY/qV
 fM9PwWoUSPkB4lvFXr/0I02Qo8HAnxZBAbswAy7UJVCW1OQU/Ea+oQhjxiyCPZl47BcA
 o8oHf/B3wqBcJ1oqz29YCBIQ8TC1NvzbnQYUnn9y1T1OpNc2Fcoe1OMzQ3jAI7gm+fFI
 8wu5ZCn2l86crZ1ooHn71+0C82LMNYs/kp9VUqNoamk3HhD02vShKTCG0BqnoPVtZLUV
 mO2vSYMopWyN4TZLm618oDwM9I+8ocQtbwcjgoAgSJQcK3tF3yvaria4WqgaWvgyezAf
 xUEw==
X-Gm-Message-State: APjAAAVoyXG+85XHFnA1UqcUoXIGJ3MZ2QpDhnERI3xUp95okqiGXzY8
 6Ykd0GAf114s1VuI8WW+mK9DoUCTZn84cKiQR4idOg==
X-Google-Smtp-Source: APXvYqz4BRPWmmmpZSzl05SYzwwCun8nLt4YQkgo2iRficS4kkIeKWNc+yWJo0clnqo9vFk274yXNp4AVBdmVGKPy/g=
X-Received: by 2002:a05:6830:4b:: with SMTP id
 d11mr1573630otp.106.1559576170901; 
 Mon, 03 Jun 2019 08:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190529220944.14464-1-alexander.deucher@amd.com>
In-Reply-To: <20190529220944.14464-1-alexander.deucher@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 3 Jun 2019 17:35:59 +0200
Message-ID: <CAKMK7uFFB7ME=d1U-SpCUEtVbysAuW2H--=4EeKKJYofeggLoA@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.3
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ysk87hK/RndHDoFsMlKY9s0HoBw2vJNWH9Bdud9a6w4=;
 b=SZdUpjNaeYBWAG46pAfejGJJOC5lmvQ5FIGJNPiVbarBY+qmuPzMqk8KqnxWg6eqIE
 X5pymTAv05FeSAlqY+n1Y8DvIYxIZlW57gtLT7D0ORmB+jRp2utCFO8I4dGgVEsaz82v
 kvCuaTl0R4wXKNn673mSjEZXYZH25kdX10HJ0=
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMTI6MDkgQU0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hl
ckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgRGF2ZSwgRGFuaWVsLAo+Cj4gTmV3IHN0dWZmIGZv
ciA1LjM6Cj4gLSBBZGQgbmV3IHRoZXJtYWwgc2Vuc29ycyBmb3IgdmVnYSBhc2ljcwo+IC0gVmFy
aW91cyBSQVMgZml4ZXMKPiAtIEFkZCBzeXNmcyBpbnRlcmZhY2UgZm9yIG1lbW9yeSBpbnRlcmZh
Y2UgdXRpbGl6YXRpb24KPiAtIFVzZSBITU0gcmF0aGVyIHRoYW4gbW11IG5vdGlmaWVyIGZvciB1
c2VyIHBhZ2VzCj4gLSBFeHBvc2UgeGdtaSB0b3BvbG9neSB2aWEga2ZkCj4gLSBTUi1JT1YgZml4
ZXMKPiAtIEZpeGVzIGZvciBtYW51YWwgZHJpdmVyIHJlbG9hZAo+IC0gQWRkIHVuaXF1ZSBpZGVu
dGlmaWVyIGZvciB2ZWdhIGFzaWNzCj4gLSBDbGVhbiB1cCB1c2VyIGZlbmNlIGhhbmRsaW5nIHdp
dGggVVZEL1ZDRS9WQ04gYmxvY2tzCj4gLSBDb252ZXJ0IERDIHRvIHVzZSBjb3JlIGJwYyBhdHRy
aWJ1dGUgcmF0aGVyIHRoYW4gYSBjdXN0b20gb25lCj4gLSBBZGQgR1dTIHN1cHBvcnQgZm9yIEtG
RAo+IC0gVmVnYSBwb3dlcnBsYXkgaW1wcm92ZW1lbnRzCj4gLSBBZGQgQ1JDIHN1cHBvcnQgZm9y
IERDRSAxMgo+IC0gU1ItSU9WIHN1cHBvcnQgZm9yIG5ldyBzZWN1cml0eSBwb2xpY3kKPiAtIFZh
cmlvdXMgY2xlYW51cHMKCj4gQ2h1bm1pbmcgWmhvdSAoMSk6Cj4gICAgICAgZHJtL2FtZGdwdTog
YWRkIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FIHRvIGFtZGdwdQoKVGhpcyB1bmNvbmRpdGlvbmFs
bHkgZW5hYmxlcyB0aW1lbGluZSBzeW5jb2JqIHN1cHBvcnQsIFdoaWNoIEkgdGhvdWdodAp3ZSd2
ZSBkZWNpZGVkIHRvIGhvbGQgYmFjayBiZWhpbmQgc29tZSBtb2R1bGVfcGFyYW1fbmFtZWRfdW5z
YWZlIG9yCmV4cGVyaW1lbnRhbCBLY29uZmlnLCBhdCBsZWFzdCB1bnRpbCBLSFIgcmF0aWZpZXMg
dGhlIGV4dGVuc2lvbnMgYW5kCmV2ZXJ5b25lIGNhbiBwdWJsaXNoIHRoZSBtZXNhIHBhdGNoZXMu
IFRoaXMgaXMga2luZGEgdWFwaSB3aXRob3V0CnVzZXJzcGFjZSBhcy1pcyAuLi4gYWxzbyBub3Qg
b24geW91ciBzdW1tYXJ5LCBvciBJJ20gYmxpbmQuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4
IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
