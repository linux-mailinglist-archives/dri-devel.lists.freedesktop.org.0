Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6815B10A212
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 17:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F4C6E430;
	Tue, 26 Nov 2019 16:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5492E6E316;
 Tue, 26 Nov 2019 16:28:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g206so3895415wme.1;
 Tue, 26 Nov 2019 08:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lpf541/6ikEv3JJ2ul3APwZIfgPQ6unMan8v4La6FD4=;
 b=JGZQq/NlEdGx/Qd7NQmSHdf6RLlAXhp265J8bSzETlBisACqFXaEDSBTbXPBFLzQRG
 3jJ7A8YyCEGbOXypbbP5pIYZNyuOWAvCq0623lZw+/4js/qslCce5ix04+JIWtkli2QX
 uYWGJ/LiZk/BrRcg6poCkebAZKQTAW5dhBDM43O3LlgwCpeVhAK4jF/7DXD6Ckwcp71N
 Vk/CwxnCM7z5GlPCBjP8Nwu6oBt+ci7fVEzE8HJH9ub3/kqve+/dnmKr4gVICV0Es6HA
 wPf6heWICsnzwOBNCxZKZ5IbsirPmlOqvUA1xmmANRDG9Gr5U4MD/ihxAWNXvF7vkslZ
 HJmA==
X-Gm-Message-State: APjAAAVTq8O4CHoSdEhK/6FKyyDS99Fei6JoGO97lKDCTmuF1fL0wZyA
 sG6IqNfkIKRoCsFkNOfNlWOTA+E7/ZV80mMIMzM=
X-Google-Smtp-Source: APXvYqwgv1uiWhI8ounqnl7xziQvTMjaQD4iWYsok936xxtQ3YUO0jFuO7HLV9vH7BCmji9L/qv8lpPQJxxXiA+Z+H8=
X-Received: by 2002:a7b:c1d3:: with SMTP id a19mr5326942wmj.127.1574785687879; 
 Tue, 26 Nov 2019 08:28:07 -0800 (PST)
MIME-Version: 1.0
References: <20191126003514.133692-1-jbi.octave@gmail.com>
In-Reply-To: <20191126003514.133692-1-jbi.octave@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Nov 2019 11:27:55 -0500
Message-ID: <CADnq5_Mvx8yNG=PUYB6s+Dwqevbx4a0gC-K7iqmNtM-shrDOLw@mail.gmail.com>
Subject: Re: [PATCH] drm: radeon: replace 0 with NULL
To: Jules Irenge <jbi.octave@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lpf541/6ikEv3JJ2ul3APwZIfgPQ6unMan8v4La6FD4=;
 b=JieTCFWq0nixSvgtCiL59CJeZu3LC4DI3ozvC6SCMq8yOfpTyvmgTzQNJB+0KAwH82
 FZbWZ0MSaOx8Xwf/PcFSyviWSsAoeAD1S9lbb0qYtC+z0LsSqUobyrgpQBvsYKUKNeJH
 54d3rcSJAhK5M6xcDfm2qQeTrxTEbQ6aZXBu/JVFc6plWpWQ9ActI88B5VDmDI88O2g8
 vzq1ICpaahQOIJ9rTg0v9zl+daqycOPMvOjmbodK1inIBUcGVJyniMp0ftf5N9SVLPji
 eGpys0U4dyYb/gOJCFwIecl920Kn7XlKRr9hhe0yIdtQG6FInOpysmI5/FNkDA31yEYG
 h6+w==
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFR1ZSwgTm92IDI2LCAyMDE5IGF0IDM6MTUgQU0g
SnVsZXMgSXJlbmdlIDxqYmkub2N0YXZlQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBSZXBsYWNlIDAg
d2l0aCBOVUxMIHRvIGZpeCBzcGFyc2UgdG9vbCAgd2FybmluZwo+ICB3YXJuaW5nOiBVc2luZyBw
bGFpbiBpbnRlZ2VyIGFzIE5VTEwgcG9pbnRlcgo+Cj4gU2lnbmVkLW9mZi1ieTogSnVsZXMgSXJl
bmdlIDxqYmkub2N0YXZlQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fYXVkaW8uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fYXVkaW8uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F1ZGlvLmMKPiBp
bmRleCBiOWFlYTU3NzZkM2QuLjIyNjljZmNlZDc4OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fYXVkaW8uYwo+IEBAIC0yODgsNyArMjg4LDcgQEAgc3RhdGljIHZvaWQgcmFkZW9u
X2F1ZGlvX2ludGVyZmFjZV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQo+ICAgICAg
ICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgcmRldi0+YXVkaW8uZnVuY3MgPSAmcjYwMF9m
dW5jczsKPiAgICAgICAgICAgICAgICAgcmRldi0+YXVkaW8uaGRtaV9mdW5jcyA9ICZyNjAwX2hk
bWlfZnVuY3M7Cj4gLSAgICAgICAgICAgICAgIHJkZXYtPmF1ZGlvLmRwX2Z1bmNzID0gMDsKPiAr
ICAgICAgICAgICAgICAgcmRldi0+YXVkaW8uZHBfZnVuY3MgPSBOVUxMOwo+ICAgICAgICAgfQo+
ICB9Cj4KPiAtLQo+IDIuMjMuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
