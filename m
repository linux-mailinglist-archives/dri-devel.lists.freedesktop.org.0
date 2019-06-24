Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D8C51B5C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 21:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B41089D52;
	Mon, 24 Jun 2019 19:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7907889D52
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 19:25:51 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id e3so82659ioc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 12:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=46YubdxCxrFPh8KrDchM0Ty2p47WTPPMVanoBQz+N5I=;
 b=VQIBqruiEAwdswNCm1zpYpEweif9zDbgQ6n5tfKbHZowdyyup+O2CmdxXVeY5mXsPC
 /Osfm4Jpw8BzDEDJctw2thT7f/I8RC8KmPhBOkLhHhIXySre1b/gjoPNS1s0dbUjeqVf
 dzTtH9lhpG5J/YEd+TYkPbnCXhoNu0sx0elkmt1/sr4B8aOOGAd8fdWzkQnpmXrLYnXq
 NXvDGYh+4Dk0xkN2Fri65e2EG2AIX9b3TViKezqMi+6DQ1Y2F0kmEfkllcgQyIpzSVU/
 6pKPTUGvhNiTTFKiOlRbZo8J8KqVtBHXViQpibNyIkfjKH7aQHdGwueO5k8RI7a2KEME
 EXVQ==
X-Gm-Message-State: APjAAAVmuvBZ/p0Mi1Tgiyn05Szg7IjbwhRzqZxsu6E+Nux0S82N8hqh
 QVKlT/VW4Q1Kk4bjBzSDsvOIDZiaV14=
X-Google-Smtp-Source: APXvYqxc7QJl2S3wP9OjsQmbovQAhYT0iUcb5W0a94FUbKIi8Pn5NF2ZJTlZB4tpfA/Z/MBVLWQ+XQ==
X-Received: by 2002:a02:ac09:: with SMTP id a9mr45906320jao.48.1561404350355; 
 Mon, 24 Jun 2019 12:25:50 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id a2sm11390575iod.57.2019.06.24.12.25.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 12:25:49 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id e5so3423667iok.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 12:25:49 -0700 (PDT)
X-Received: by 2002:a02:aa1d:: with SMTP id r29mr14713662jam.127.1561404342590; 
 Mon, 24 Jun 2019 12:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190621211346.1324-1-ezequiel@collabora.com>
 <20190621211346.1324-2-ezequiel@collabora.com>
In-Reply-To: <20190621211346.1324-2-ezequiel@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jun 2019 12:25:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UO8S_MHPKvpu-Uc1pTAv2NN_hf+U6_HCntRU0hzGQtWw@mail.gmail.com>
Message-ID: <CAD=FV=UO8S_MHPKvpu-Uc1pTAv2NN_hf+U6_HCntRU0hzGQtWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: rockchip: document VOP gamma
 LUT address
To: Ezequiel Garcia <ezequiel@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=46YubdxCxrFPh8KrDchM0Ty2p47WTPPMVanoBQz+N5I=;
 b=WapHHi8N2f4HLGXe8Azqgnk2rXsYnSSwWeXoyTGoqptEniMQ7RI34LHdkfRxx+PTYJ
 6q8PlKhv4L+QPsNZCCEMml8wD0fIpbl5OiXhrEU0oePfqE5PupxtN+Plt9pm45DyQEdT
 xLv0d4d/GDSlQZxVi/VWkz/v0k08TuKOrnfCQ=
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
 Jacopo Mondi <jacopo@jmondi.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIEp1biAyMSwgMjAxOSBhdCAyOjE0IFBNIEV6ZXF1aWVsIEdhcmNpYSA8ZXpl
cXVpZWxAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBBZGQgdGhlIHJlZ2lzdGVyIHNwZWNpZmll
ciBkZXNjcmlwdGlvbiBmb3IgYW4KPiBvcHRpb25hbCBnYW1tYSBMVVQgYWRkcmVzcy4KPgo+IFNp
Z25lZC1vZmYtYnk6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KPiAt
LS0KPiBDaGFuZ2VzIGZyb20gdjE6Cj4gKiBEcm9wIHJlZy1uYW1lcywgc3VnZ2VzdGVkIGJ5IERv
dWcuCj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9j
a2NoaXAtdm9wLnR4dCAgIHwgNiArKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5k
ZXJzQGNocm9taXVtLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
