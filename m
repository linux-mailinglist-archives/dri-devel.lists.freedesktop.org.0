Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 414E8FABBC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 09:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1A16EC92;
	Wed, 13 Nov 2019 08:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628456EC92
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 08:05:54 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id j7so991611oib.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 00:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kQepP0sqyeeJCKUvYnjxCnKhlxlHnVNsTCCZG4FK3eE=;
 b=g38mk4Zdq7RoezMiXFMMEL76PVGzdbBgNxiOabMIQ4qImf8O3Ux9oC7F+53HzteVqP
 nt4HAS/vIFwC/EUYBpGn2m58Zw3jjEUtHA1+dA0I8DxcbpmnIuMnd0oWtwer2O+CwMzG
 iFE1en+3E70gE6Ik7RORvGX3OfY1ObNDM4La21/mrvCkq5VfnE+89k97Izw9Au9ejVkI
 U7DJN2JDdFqzCZwEgUNkV40nNPa0bvoVM+pa+X3nxysaxGhc9nOHZRxR7TnrL7PTe+80
 wNCS9FrSyJ8IyHlw4Q6gSfU0pYQPCi+Q5X870M9z1kFtYbXa36QBCoCX81k6WHrl0JLZ
 gkTg==
X-Gm-Message-State: APjAAAUmkUxdOaQsnHNfEijwlpuQa33iq/YRW1v/teOAL9W2rulutshk
 RTxDbegInffi3nKAdwrppsSoItFR7KZ/9MtNABvIvg==
X-Google-Smtp-Source: APXvYqxdDaMFTO9hTp7KctZFhfA5468PhhMk5dAnVsx+u8O8lEkcoLKQeV+F29G/ekdXl+DjfV0zDSZl8es2steOBzs=
X-Received: by 2002:aca:b805:: with SMTP id i5mr2050965oif.110.1573632353734; 
 Wed, 13 Nov 2019 00:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20191112204551.541449-1-maxime@cerno.tech>
In-Reply-To: <20191112204551.541449-1-maxime@cerno.tech>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 13 Nov 2019 09:05:42 +0100
Message-ID: <CAKMK7uGML6fiP3YmG4gg1AVJSE06-pvw6NynAF7w41QBdG+3wQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx6345: Fix compilation breakage on systems
 without CONFIG_OF
To: Maxime Ripard <maxime@cerno.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kQepP0sqyeeJCKUvYnjxCnKhlxlHnVNsTCCZG4FK3eE=;
 b=Z9cpWj6Rw8UnSWbI5YTDVmDXe+WJqL78e2CPPvQaesR0ANhjvcpdHcvljUPrmJrDlV
 NwRM8oevF09I56yRrzZlrmZWv7RWmoG/LJ2EYebb4fudTzVySxZvDzmSAt+dPYr1VGD+
 dEMzuUWiFCIDFG3WP/yD8iyWQricDSAgahrq0=
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
Cc: Torsten Duwe <duwe@lst.de>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgODo1NiBBTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vy
bm8udGVjaD4gd3JvdGU6Cj4KPiBUaGUgZHJpdmVyIGFzc3VtZXMgdGhhdCB0aGUgcGxhdGZvcm0g
dXNlcyB0aGUgZGV2aWNlIHRyZWUsIGFuZCB0aHVzIHJlbGllcwo+IG9uIHNvbWUgZmllbGRzIChv
Zl9ub2RlKSBiZWluZyBkZWNsYXJlZCBpbiBzb21lIHN0cnVjdHVyZXMgKGRybV9icmlkZ2UpLgo+
Cj4gVGhpcyBpc24ndCB0cnVlIGZvciBhbGwgcGxhdGZvcm1zLCBzbyBtYWtlIHN1cmUgd2UgY2Fu
IG9ubHkgY29tcGlsZSB0aGUKPiBBTlg2MzQ1IG9uIHBsYXRmb3JtcyB3aGVyZSBEVCBzdXBwb3J0
IGlzIHNlbGVjdGVkLgo+Cj4gQ2M6IFRvcnN0ZW4gRHV3ZSA8ZHV3ZUBsc3QuZGU+Cj4gRml4ZXM6
IDZhYTE5MjY5ODA4OSAoImRybS9icmlkZ2U6IEFkZCBBbmFsb2dpeCBhbng2MzQ1IHN1cHBvcnQi
KQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPgoKQWNr
ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvS2NvbmZpZyB8IDEgKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2FuYWxvZ2l4L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tj
b25maWcKPiBpbmRleCAxNDI1YTk2YTI4YzMuLmUxZmE3ZDgyMDM3MyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcKPiBAQCAtMSw2ICsxLDcgQEAKPiAgIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gIGNvbmZpZyBEUk1fQU5BTE9HSVhf
QU5YNjM0NQo+ICAgICAgICAgdHJpc3RhdGUgIkFuYWxvZ2l4IEFOWDYzNDUgYnJpZGdlIgo+ICsg
ICAgICAgZGVwZW5kcyBvbiBPRgo+ICAgICAgICAgc2VsZWN0IERSTV9BTkFMT0dJWF9EUAo+ICAg
ICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gICAgICAgICBzZWxlY3QgUkVHTUFQX0kyQwo+
IC0tCj4gMi4yMy4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
