Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B858316230
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 12:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA6A6E792;
	Tue,  7 May 2019 10:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32486E792
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 10:54:23 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z5so8779178lji.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 03:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GCAhg11SRp6Hew9zFemJx8a1BnYPfIc90dC9LSkimJg=;
 b=dBLSWpo9ic9Yll2ZgCvcBcZzxZdPaarnadmXjJAVVQ6uUyUbGsVdOOBHeJGo/VHs3B
 zFHtPs7S4CoGreZn+wKC2jQdTQ9kNTa4rZLqEWF0UrdBMLUh0bQ60Q5g1MN3ZO5JTQf+
 AMnK1qNC4BbYZx0GAwYore3FvBD4vnmsJKYvyA1HGlXLkovmaMW0ntVIgi6NZjt4Ivq9
 WMzRajaOcThENfZdiBrX/S9wL13og+/OJmAL8lDcZzOEsoqNkitPdCT6jYorCr7pkP78
 NJjTG1RhQ0B0w5f7XVceind6gd0NoA/5pOOxYa7bIRYdwvej0TR9qjHntiCFbZo6Az02
 nruA==
X-Gm-Message-State: APjAAAXP7kg03r5gEdp4DcUA6g3Ij46XwCtf4lEiJVJsk2T2pIkNObEt
 gG37lH43Dd0fQvtYxVvwovHs0g5GOaWOD1t6wyw=
X-Google-Smtp-Source: APXvYqzra4CeE9doUIEh8YRPLjXBNgdVF2kc5zUdswNRrUeYL/COm0wsOIKOaERd5W+viBb0m/EIk30lew/cjlBl89s=
X-Received: by 2002:a2e:97d8:: with SMTP id m24mr16824476ljj.192.1557226462187; 
 Tue, 07 May 2019 03:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557215047.git.agx@sigxcpu.org>
 <5817853945e1c707f641ae22458a0f27aa25949e.1557215047.git.agx@sigxcpu.org>
In-Reply-To: <5817853945e1c707f641ae22458a0f27aa25949e.1557215047.git.agx@sigxcpu.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 May 2019 07:54:27 -0300
Message-ID: <CAOMZO5Dn7yHC-NEBd0egHtXu8R4Zg=GNrvXR-RoHH6t9pqq_rA@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: phy: Add documentation for mixel dphy
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GCAhg11SRp6Hew9zFemJx8a1BnYPfIc90dC9LSkimJg=;
 b=TjALlnw4nsc9u8UJAhsZ1uBY5MpOfYYFHDH9mn1SZIL22WxRUXNdnNDBKfloMxs27a
 zkktcwu/Sx6rAtgYRy+jjbrFEiebWtpPakYRhHYSNwUjqg7hkjBxrywE0qdj+bs5mwqT
 mAGORk3CLwMloH9BP4lzzaQuXR9JlzO+Kj8q69ccRd2MiUz3z35BBRqAAtUo4zi4smZI
 MabzDOCr9zz3P4SlWcmyucv0ihFJpbiG3KUU5uh85AnttvSQVcs4Nu1Ynf9ze8oNrxGs
 bmUy+Q8EEcR0F1vtMfz5/KTQoCKVgobaHPF78FJw1bkxm28K/RTEI8P+B2dIY2YPQEXE
 KveQ==
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Abel Vesa <abel.vesa@nxp.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Thierry Reding <treding@nvidia.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgNywgMjAxOSBhdCA0OjQ3IEFNIEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNw
dS5vcmc+IHdyb3RlOgo+Cj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBNSVhFTCBEUEhZIElQIGFzIGZv
dW5kIG9uIE5YUCdzIGkuTVg4TVEgU29Dcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50
aGVyIDxhZ3hAc2lneGNwdS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
ClJldmlld2VkLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
