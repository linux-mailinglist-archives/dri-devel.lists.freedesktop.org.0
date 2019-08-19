Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1DC951D7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4376E488;
	Mon, 19 Aug 2019 23:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADFC6E488
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:48:46 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id o70so2143205pfg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QgmxRXiV4eVbA2D+CIIcdEV2MHKTvfb/XetIC7rubus=;
 b=uZvqJlKb/BizFik/RZ3XeOGbLwS68uv7CH7Cub1MeWvWGdWHS2yZyM17ZrA6fUHoRV
 EpEe8ERQAZxXobFx5VcJD9wZwVtmOTs4SpmD8S0AZ0f8qZBWV/AbzDOJ3hyaVhnlJDxh
 z+3yGQD3L0kchSQFiEwX/FimXq/RUN/S87HLqs3/ploew8tfWtnA1uXsJnxrtwaoFNhL
 NFT0U1/CEP2vYZuGDflhI2oOIIAh0rqsoXFagRdt4fi/FUMcLFKIFAw55ETcso9Awzm3
 wQPkdi6/Jcrrg+sMkGCtv4xT99y2jmPNhdpa8BtuYfyKsFW2k9jgx9oPlyHFiAVfPZu6
 o/Og==
X-Gm-Message-State: APjAAAWRzgFwwb1kuVsi8gFBc0oM0so8hzHX4tREqlI+ASmMEAxTpFuq
 /IRlBWVh/MBa7J3itOqMJ8HEsg==
X-Google-Smtp-Source: APXvYqxLZYDPjHITYPuLGErUtE7snQdksVmHOzJvYGqjfz2RdpRb8Kwiw0Y+5f6dwxBeKzZAVreQ+g==
X-Received: by 2002:a63:4042:: with SMTP id n63mr11517121pga.75.1566258526047; 
 Mon, 19 Aug 2019 16:48:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 185sm18769681pfa.170.2019.08.19.16.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 16:48:45 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] dt-bindings for lima support on HiKey
Date: Mon, 19 Aug 2019 23:48:37 +0000
Message-Id: <20190819234840.37786-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=QgmxRXiV4eVbA2D+CIIcdEV2MHKTvfb/XetIC7rubus=;
 b=mZZAymUSnMr0p4jzxwKi8QzK07aaNJ7XYQnKIsiXYe2ou1W56SjSX9PXE3QSg8XWEZ
 1Nq6cFiogPtQO1sjxpWu0t2NrU9YhCfYBgcvaUYc5z4OxBp9nNy0j2OfHAE+76P7Bpdg
 2ZFJhPS3sKV8HL3thf/YKLozN89C3JtCWJirNe/HbE4F9X6esAaGLZuyHzcI8dusq1Ke
 caMLXlvCnFU2nKkn+BfyKXo9HL4J5Nk49OxzIjK7sMFeu5cAVBOdOqc+lpYZp928f132
 OjK8W0EUYh69iB9g9ETekJ8y/EkRSPHhc0kOnY4r7xWGzXZv+NZWm3EA3lhAW8vuy5rI
 Ayng==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh+dt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGV0ZXIgc2VudCBhIHBhdGNoc2V0IG91dCBiYWNrIGluIEFwcmlsIHRvIGVuYWJsZSBMaW1hIHN1
cHBvcnQKb24gSGlLZXksIGJ1dCB0aGVyZSdzIG5vdCBiZWVuIG11Y2ggYWN0aW9uIG9uIGl0IHNp
bmNlIHNpbmNlLgoKSSd2ZSBiZWVuIGNhcnJ5aW5nIHRoZSBwYXRjaHNldCBpbiBteSB0cmVlLCBh
bmQgZmlndXJlZCBJJ2Qgc2VuZApvdXQganVzdCB0aGVzZSB0aHJlZSBkdC1iaW5kaW5ncyBjaGFu
Z2VzIGp1c3Qgc28gaG9wZWZ1bGx5IHRoZXkKY2FuIGdvIGluIGFuZCB0aGUgZGVwZW5kZW50IGRy
aXZlciBjaGFuZ2VzIGNhbiBiZSBtb3JlIGVhc2lseQpwdXNoZWQgbGF0ZXIgb24uCgp0aGFua3MK
LWpvaG4KCkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3Jn
PgpDYzogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4KQ2M6IFBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CkNjOiBQZXRlciBHcmlmZmluIDxwZXRlci5ncmlm
ZmluQGxpbmFyby5vcmc+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwoKClBldGVyIEdyaWZmaW4gKDMpOgogIGR0LWJpbmRp
bmdzOiBncHU6IG1hbGktdXRnYXJkOiBhZGQgaGlzaWxpY29uLGhpNjIyMC1tYWxpIGNvbXBhdGli
bGUKICBkdC1iaW5kaW5nczogcmVzZXQ6IGhpc2lsaWNvbjogVXBkYXRlIGNvbXBhdGlibGUgZG9j
dW1lbnRhdGlvbgogIGR0LWJpbmRpbmdzOiByZXNldDogaGlzaWxpY29uOiBBZGQgYW8gcmVzZXQg
Y29udHJvbGxlcgoKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1h
bGktdXRnYXJkLnR4dCAgfCA1ICsrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9o
aXNpbGljb24saGk2MjIwLXJlc2V0LnR4dCAgIHwgMSArCiBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jl
c2V0L2hpc2ksaGk2MjIwLXJlc2V0cy5oICAgICAgICAgICAgIHwgNyArKysrKysrCiAzIGZpbGVz
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
