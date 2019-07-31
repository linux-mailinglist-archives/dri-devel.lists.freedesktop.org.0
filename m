Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6417CAB8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 19:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D47889D7F;
	Wed, 31 Jul 2019 17:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D0889D7F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 17:40:47 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y17so41896497ljk.10
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 10:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q4EnWjuoFwvcg+PQNQKDl7SJ3NRTDjvZysMShIcjoKI=;
 b=GY0TXW4AV0SAieAkFz6a9cnECzex3LblmgBT29WslZUKtMf7WcDaT9hiXptcp5jXnQ
 RozuLqdfWWptL2CRguHQKF2X0A7X8joTeGLbUQkXbfWtoxFJWfIxbU9W3OGn5VNn6eAc
 aH65FjAHFu3t+fIy6of3oc6S8hODO2Xaw4kmyfmhgvSLB2rIU/fqUEE9FpgRphXfigTo
 S4yUYnCzaA8y5v59/j6/ORJVm/lPQRIHAQRmzSIKukuIu6zys97w7Oth6Oq00anqaMN/
 PiTJgnbtV1toIdRjyIR3+zRUVaiIeccqNFcvNzCORosSff+DxYLPiBKYM/dsmQfJFRBB
 gdQA==
X-Gm-Message-State: APjAAAW8uC5wDj28ECndNJrFL1nR7AFmDte9kuY6a2l9gdiepBH9VDLz
 shZlJ/aJjWJbh3nvCMamZd5u7GwZXjz75xBT+aM=
X-Google-Smtp-Source: APXvYqyt0Od36zT0596GjCdSHptbQnUWvWqMyOnVl/5FQep+ssyLLf+KxKKOId+xoiOrQ+OT9NTjMGldgO9EObJPhWk=
X-Received: by 2002:a2e:4e12:: with SMTP id c18mr14933002ljb.211.1564594845880; 
 Wed, 31 Jul 2019 10:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563983037.git.agx@sigxcpu.org>
 <20190731143532.GA1935@bogon.m.sigxcpu.org>
 <CAOMZO5Djoi7EuXapkg+dQ6HR2oZZHrw+vnjc837Gxee-Nh00Hw@mail.gmail.com>
 <13373313.BzCyiC4ED7@jernej-laptop>
In-Reply-To: <13373313.BzCyiC4ED7@jernej-laptop>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 31 Jul 2019 14:40:57 -0300
Message-ID: <CAOMZO5Ak7QFzEM8Qt5XAZBa1CB602fygK+FBDK2iTvxWA4y+oA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: Add NWL MIPI DSI host controller support
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q4EnWjuoFwvcg+PQNQKDl7SJ3NRTDjvZysMShIcjoKI=;
 b=EEGiqtvzdTGgq8ThRpTRzSRRTP6VrSrlPO4IYYXSqpYLJ1pWHT/smy+zbIF9spBxdG
 OPhZlUiy86fYmMqsbJ+fR75XB09QgUuke4Bs8aa9PYGkrTqbahFJVfjl93nk0Q3ff36o
 4CNAKmIBe5E32PDAW7yKpvLxNuV1lPeTQUHA7iJHMdqmLX+3nLVkm0utsFCM5H/+5JXa
 cBmKEid218rblPtIjLKPhBu5EWKqEkzkwF5vunTY0SixI56msLOoXv2XPukyyoSH7Ve0
 1euc7zpXBnh6gBCuZ/uLrqxkrgPUuqlZAXL7Q36Q29fJ3is4HY3M9XrjfIGJL1jp8j8S
 2l7g==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Chris Healy <cphealy@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTo0MCBQTSBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5z
a3JhYmVjQHNpb2wubmV0PiB3cm90ZToKCj4gPiBZZXMsIEkgdW5kZXJzdG9vZCB0aGUgaWRlYSwg
YnV0IHRoaXMgd291bGQgcHJpbnQ6Cj4gPgo+ID4gZW5zYWJsaW5nIG9yIGRpc3NhYmxpbmcgOi0p
Cj4KPiBObywgaXQgd291bGRuJ3QuIFRoYXQgZXh0cmEgInMiIGlzIHBhcnQgb2YgIiVzIiwgZS5n
LiBwYXJ0IG9mIGZvcm1hdCBzcGVjaWZpZXIuCgpPcHMsIHlvdSBhcmUgcmlnaHQuIFNvcnJ5IGFi
b3V0IHRoYXQhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
