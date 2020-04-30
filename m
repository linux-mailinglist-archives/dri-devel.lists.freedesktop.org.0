Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 634B31BFFB8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 17:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FD26E919;
	Thu, 30 Apr 2020 15:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382B06E919
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 15:09:10 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id t199so5497763oif.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 08:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5zQi7r9M2LfUopK89C3EkicnA25N+tRTfqcQYXwGa4Q=;
 b=GnYrsaN6NEU0QrNKTsi1gIN/yJe1TNR5CQCeXl9rdFJBLOEmWeZUNENU3rOJ3FSWsu
 qT8FH1y2B/G4LzYSg5SbCtR7kirzz51BW/b7P9XMFnKufdGhmqHT7mXstdf34kryWalf
 HfWcFuC1VUhCy/FePn/HmAx9/c3r7M9xMRFAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5zQi7r9M2LfUopK89C3EkicnA25N+tRTfqcQYXwGa4Q=;
 b=GUIRsTkK+ejSN4Aqbh4o3hXq3oysVoKWLBuC5Y2zS/IDtjTh4ayOvtpjeTNgZTLCA5
 J6DT4PzBvqhnlBuH5loS71U5zMNlWEMPYkQl4/aKbLmBqQEwnzplyAvMCt1WjN87RnZL
 Jt1tlNRD6v2PjfRoZzCTCVMkqKS8VFQHC14kcSitjQ5h4jkEJ2SjPIAEAXAYhaf12jmN
 k1mtow9yvArlf7EahSGsfEalvMbqE5+BCF4X5Ogh2/EJ3axqV5mGW8kcADSi0gBja0ii
 JLXgD9wy5zXtNWz6pGUf8BjLPrbmpqNgUvJPRJuxwECyQdJr0NZoJIm+FKCW+UH9E0Mb
 Wsog==
X-Gm-Message-State: AGi0PuakAzNCV2KskORggNXU8fDZRwnSds9jamvH9WQ813sxFUi0IG0V
 8RHzLrpad+EIgTaLGWteZWxs/fr3idGMYE8l37wpBw==
X-Google-Smtp-Source: APiQypK116kyr5jlTbWU6tuCGp85AedUXlIu2BotcPBsyOWDWrXsYR7fZz/xZgi6gNwZzZIxNbnanEsgIscjJj+VMQg=
X-Received: by 2002:aca:52d5:: with SMTP id g204mr2123371oib.14.1588259349392; 
 Thu, 30 Apr 2020 08:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200430145439.31257-1-manu@FreeBSD.org>
In-Reply-To: <20200430145439.31257-1-manu@FreeBSD.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 30 Apr 2020 17:08:58 +0200
Message-ID: <CAKMK7uHqFhd69Y7TM64ZHyi9-O0ka3h9dWG8mmiMQV5ZVBWWcA@mail.gmail.com>
Subject: Re: [RESEND 1/2] drm/client: Dual licence the header in GPL-2 and MIT
To: Emmanuel Vadot <manu@freebsd.org>
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMzAsIDIwMjAgYXQgNDo1NCBQTSBFbW1hbnVlbCBWYWRvdCA8bWFudUBmcmVl
YnNkLm9yZz4gd3JvdGU6Cj4KPiBTb3VyY2UgZmlsZSB3YXMgZHVhbCBsaWNlbmNlZCBidXQgdGhl
IGhlYWRlciB3YXMgb21pdHRlZCwgZml4IHRoYXQuCj4gQ29udHJpYnV0b3JzIGZvciB0aGlzIGZp
bGUgYXJlOgo+IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gTWF0dCBS
b3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4KPiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJk
QGtlcm5lbC5vcmc+Cj4gTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4KPiBBY2tlZC1ieTogTm9yYWxm
IFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gQWNrZWQtYnk6IE1hdHQgUm9wZXIgPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+Cj4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogRW1tYW51ZWwgVmFkb3QgPG1hbnVA
RnJlZUJTRC5vcmc+CgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4KPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5oIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fY2xpZW50LmggYi9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmgKPiBpbmRl
eCA3NDAyZjg1MmQzYzQuLmViMjU5YzI1NDdhZiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9k
cm1fY2xpZW50LmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmgKPiBAQCAtMSw0ICsx
LDQgQEAKPiAtLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiArLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgb3IgTUlUICovCj4KPiAgI2lmbmRlZiBfRFJN
X0NMSUVOVF9IXwo+ICAjZGVmaW5lIF9EUk1fQ0xJRU5UX0hfCj4gLS0KPiAyLjI1LjEKPgoKCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEg
KDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
