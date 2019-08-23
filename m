Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA779A510
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 03:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB636EBA0;
	Fri, 23 Aug 2019 01:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B668B6EBA0;
 Fri, 23 Aug 2019 01:50:21 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id z17so7383500ljz.0;
 Thu, 22 Aug 2019 18:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+BLAAxLRJnmMhza7IBB6OPUzt6DSgSkXnlT+MSzL8Sc=;
 b=MVZrb7WbzbmyC+3F/BZQmobYtKdUHMZ4GIMmGt9fDdVKIlpJ9+5NGzayYfeD7tCYcU
 9LFctTAYFcjaiIuyZdIhthPHnuEiXGcDx4IZG8UphxoHqebLHtEqnaRAzNcdAt8SPqOM
 K776Ca0vJocOpBHPc2pYt+dwjoX0LJC8caEJ/6QJY6dC2MKqaZ656M/q+WSfLswHkctV
 l7PYaX4rJREhSufohWQ95FOAFHPFKfXlqMXTHK6+D5KOx/BZLt7LQO8Xipdvk1wB8ZQA
 hljqHLPgH0weTvI4PpaOvvDucScI64lwIH4ftkC5s5ahSJlU4RUc+fRf4SPKYfKyg31a
 4k7w==
X-Gm-Message-State: APjAAAV/Ek8Xazjuk0bxPZmoHcpJKE0RdkQ61l4rlEaGMteE8il29btc
 AtWas233zvlBFJwejcGq5f2m5f2pEYKgCkXw/A8=
X-Google-Smtp-Source: APXvYqyMbxlGD12EY6/oSAPSfnZKQ2BY+KwTB1suBuTgNROwuxmQrx149OXR2qeZyOc9bZdJxkLZ9TsWdx3cJIvqOD8=
X-Received: by 2002:a2e:8658:: with SMTP id i24mr1287261ljj.188.1566525019747; 
 Thu, 22 Aug 2019 18:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190822192950.GA4813@intel.com>
In-Reply-To: <20190822192950.GA4813@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 Aug 2019 11:50:06 +1000
Message-ID: <CAPM=9txCREbdeDBOr6LPkTZn69TYfTjwDYE8XQWaxiUGb3PRVw@mail.gmail.com>
Subject: Re: [PULL] drm-intel-next
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+BLAAxLRJnmMhza7IBB6OPUzt6DSgSkXnlT+MSzL8Sc=;
 b=KER6KTgRJiDi1wXAiBX2j7XgCvareY8Uy70trZOsMSTnIxMH4EmJRbUcJ3t+RqVMaf
 PauCRqcWoSIddgMAxpNl8rm0JfJuyREYfxxNsnKXvDzXOxpWtfzqIYoEQyUtygGQPTAO
 jTf+p8N3keCkZEsgcxyhyFKe/hV0ttmOiIERudQQPsooMQ7Iit8Ekd6G4c65NZsI3wHW
 TSAHpeayuekUQB6qxkgDG4ly6NCIqhmGDvWIgp4l0g8QVbj4LsaxMLGgMWQgJKQ9olR9
 RV213eGY4uVlo9ACBYjnWikQ436go3gxr4ovqh/QkalwGEwYteG5YD9kiOqAx3A4d7Z9
 E31Q==
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMyBBdWcgMjAxOSBhdCAwNToyOSwgUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlA
aW50ZWwuY29tPiB3cm90ZToKPgo+IEhpIERhdmUgYW5kIERhbmllbCwKPgo+IEhlcmUgZ29lcyB0
aGUgZmluYWwgcHVsbCByZXF1ZXN0IHRhcmdldGluZyA1LjQuCgpGb3Igc29tZSByZWFzb24gcGF0
Y2h3b3JrIGhhc24ndCBwaWNrZWQgdGhpcyB1cC4gb3IgaWYgaXQgaGFzIEkgY2FuJ3QKc2VlIGl0
LiBOb3Qgc3VyZSB3aGV0aGVyIGl0IHdhcyB0aGUgZWFybGllciBwYXRjaCBjb2RlIGluIGl0IG9y
CnNvbWV0aGluZyBlbHNlIG1hbGZvcm1lZC4KCkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
