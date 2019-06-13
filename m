Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4AC455F5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8DF898A4;
	Fri, 14 Jun 2019 07:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664BA89823
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:48:59 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id w196so114922oie.7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6/SmungTaA370D2rCIWKfA5Y/5qfTgxWJaSToiIIFTs=;
 b=a2q2Hoclx5jUaFZPmilDN3EP0/EjsB1k+nD8qx36ehx6x/qteVxgCDROc07gML8sGq
 s/vzWL13akthKuziYtRDeIp9pWEXBMctsofZXjhkabHeKefNF85I4OH8ofx8o/W837D7
 lexrG4zRxs9g+hwr4S+UZ6FTyQ43GSNWO/W9u4VYjhRTcxl4rWw8Ql9cUiivKfPMTrlE
 Xh5T++wQKpsHreJnoiA13Yss3VOsIxOcNToyik6t4qU3ISzOXTSKCJ9ON0UdGwSQ00ix
 YklCDiFV5ZdH3g9GDwVRcAQaMB4cqQwHLE/OW//lkCS2T1ABUg0e4yPoRpsv3/EvN7N2
 PM7A==
X-Gm-Message-State: APjAAAW+085l+GZxXpV7STQzZueCVanEwmRh8PXjKXwBLCEcrpC6BlRH
 Rk6CURtHJx+Ru7WcieY73NXb6COcdpnjH5J+nyNdavM5
X-Google-Smtp-Source: APXvYqxVwq9fDpBIX3ypKULsUYpM51aYkGywdCYiuJQfyPJsSrgxmsUtb3Bj1WdjPqVDOy0jTC5r1I0p5zxDH45Y7Lk=
X-Received: by 2002:aca:75c2:: with SMTP id q185mr4035516oic.103.1560451738412; 
 Thu, 13 Jun 2019 11:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
 <E1hbQkh-0007yl-DV@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1hbQkh-0007yl-DV@rmk-PC.armlinux.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Thu, 13 Jun 2019 14:48:47 -0400
Message-ID: <CAGngYiVO=YBnp3ePUJofmPQ_Eo_0tvuetoqyBqVs00aA7qh-7Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] drm/i2c: tda998x: introduce
 tda998x_audio_settings
To: Russell King <rmk+kernel@armlinux.org.uk>
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6/SmungTaA370D2rCIWKfA5Y/5qfTgxWJaSToiIIFTs=;
 b=XlJ4eZMAnA+ffzdsQnYYkHH93RUjhbRUcHcs7b48U7xsP3W3NNntyorUs67RwpUsYA
 JiD4xZwHGzxW1pwKjvu/caDXoswo+YZnNdXCjQ7rO4fmaKA0n+l0x6XB/Gnp1w0w9llg
 YFUQyz3Lw3dQLuR5A+4Kpwa8Xzg6AIjWTco36Vt+zMot4vi1ak/WVBPR59IVTRp4MEtI
 OcsMzOn/H8S/RzIPqWm/wzPXLSp7cYSW/h732PEFsbaHcqGmo0B/6Nk45YbrlvcCEZN0
 HZs33AZ205VdlwJCYfzK5YoueG+POnzp9Whzpq8QvCbxddKirFGClFVgTKpt0Zypw2T5
 8w4Q==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tml0OiBjaGVja3BhdGNoLnBsIGFwcGVhcnMgdW5oYXBweSB3aXRoIHRoaXMgcGF0Y2g6CgpXQVJO
SU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMjIyOiBGSUxFOiBkcml2ZXJzL2dwdS9kcm0v
aTJjL3RkYTk5OHhfZHJ2LmM6MTAxMToKKyBhdWRpby5wYXJhbXMuY29uZmlnID0gcHJpdi0+YXVk
aW9fcG9ydFtpXS5jb25maWc7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMjMw
OiBGSUxFOiBkcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmM6MTAxNzoKKyBhdWRpby5w
YXJhbXMuY29uZmlnID0gcHJpdi0+YXVkaW9fcG9ydFtpXS5jb25maWc7Cgp0b3RhbDogMCBlcnJv
cnMsIDIgd2FybmluZ3MsIDE3OCBsaW5lcyBjaGVja2VkCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
