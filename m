Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C6737DC4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 22:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A0C8926E;
	Thu,  6 Jun 2019 20:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D98289202
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 20:00:37 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id m15so1074026lfh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 13:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LBUHp0AIL6kvz/3M3h3KZw0asu/x3DOUpyN7cjLiU48=;
 b=uWYK/HSBT6yoBoYeDw8PZGw80EW+VdHxwCMyFtIRdmIZ6RsWbVfkAzu+xi49qQ30eI
 YiqWjSIgFOpnfHZI+z8MXFIszTH65oCVfylFhV8TEWPxDUZ3VqzMd5fla6Q5M72dq7KR
 +HlIy4JEaD0gDONNapsG2Fg1AGBzWp6y680FnmleianDU4g+lhh6rGkZdFTfA43GLF6E
 W0MFKhvQozZ8b7gsxiPtHRRRyRO5prOYKNbEo7sIW8Z0fS1oQwDj3Wko7o/A+QKDFza8
 u8QYPhPHTdSrlX7pD9PxDAWb0OcMR8nFqgKA2VWqPKRtBuJ/btosZuK4jpnMAnyKCLKd
 /IsA==
X-Gm-Message-State: APjAAAXz7s4aNvXaE+ovZ5rOHfaiFStDhl9BsAqXxC5iAIALRbhB3MCD
 kzcoCoNt2Z+ZOqbM8Ea3m/ahWkAIPrrOH5bLSjo=
X-Google-Smtp-Source: APXvYqz3Pt/5uYFWtTLV+LTz6jkGRFZHje7gNd6cKMaRPyvVC/M1rkaJjIOO9OoHs9efArOf/nxYG3a+eM+/Kgkk9nY=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr681144lfp.90.1559851235901;
 Thu, 06 Jun 2019 13:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-4-jacopo+renesas@jmondi.org>
 <20190606165352.GK12825@pendragon.ideasonboard.com>
In-Reply-To: <20190606165352.GK12825@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Jun 2019 22:00:23 +0200
Message-ID: <CAMuHMdVJEJ9Sehm5Ug4P+HW0iPYufPuYVD9vQ3qKg=htXFmuLg@mail.gmail.com>
Subject: Re: [PATCH 03/20] dt-bindings: display, renesas,
 du: Update 'vsps' in example
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwgSmFjb3BvLAoKT24gVGh1LCBKdW4gNiwgMjAxOSBhdCA4OjUwIFBNIExhdXJl
bnQgUGluY2hhcnQKPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDQ6MjI6MDNQTSArMDIwMCwgSmFjb3BvIE1vbmRpIHdy
b3RlOgo+ID4gVXBkYXRlIHRoZSAndnNwcycgcHJvcGVydHkgc3RydWN0dXJlIGluIHRoZSBkb2N1
bWVudGF0aW9uIGV4YW1wbGUgdG8KPiA+IHJlZmxlY3Qgd2hhdCdzIGFjdHVhbGx5IGltcGxlbWVu
dGVkIGluIHRoZSBkZXZpY2UgdHJlZSBzb3VyY2VzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEph
Y29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KCj4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dAo+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50
eHQKPiA+IEBAIC05Miw3ICs5Miw3IEBAIEV4YW1wbGU6IFI4QTc3OTUgKFItQ2FyIEgzKSBFUzIu
MCBEVQo+ID4gICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDcyMj4sCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgNzIxPjsKPiA+ICAgICAgICAgICAg
ICAgY2xvY2stbmFtZXMgPSAiZHUuMCIsICJkdS4xIiwgImR1LjIiLCAiZHUuMyI7Cj4gPiAtICAg
ICAgICAgICAgIHZzcHMgPSA8JnZzcGQwIDA+LCA8JnZzcGQxIDA+LCA8JnZzcGQyIDA+LCA8JnZz
cGQwIDE+Owo+ID4gKyAgICAgICAgICAgICB2c3BzID0gPCZ2c3BkMCAwICZ2c3BkMSAwICZ2c3Bk
MiAgJnZzcGQwIDE+Owo+Cj4gVGhlIGZvcm1lciBpcyBzaW1wbGVyIHRvIHJlYWQgdGhhbiB0aGUg
bGF0dGVyIGluIG15IG9waW5pb24uIFNob3VsZG4ndAo+IHdlIHVwZGF0ZSB0aGUgLmR0c2kgZmls
ZXMgaW5zdGVhZCA/CgpZZXMsIGl0IGlzIGVhc2llciB0byByZWFkIChmb3IgaHVtYW5zKS4KCj4g
PiAgICAgICAgICAgICAgIGNtbXMgPSA8JmNtbTAgJmNtbTEgJmNtbTIgJmNtbTM+OwoKUGVyaGFw
cyB3ZSB3YW50IGdyb3VwaW5nIGhlcmUsIHRvbz8KCj4gPgo+ID4gICAgICAgICAgICAgICBwb3J0
cyB7CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cgot
LSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
