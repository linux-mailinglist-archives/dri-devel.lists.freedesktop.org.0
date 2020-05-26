Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 428BE1E20CF
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 13:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAE46E14F;
	Tue, 26 May 2020 11:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246D46E14F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 11:22:30 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w10so24050013ljo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zJxI8q9GaxwusSxiN1TRl1t50DLCSayUphT+bXOuVqA=;
 b=M/bNMMikN5rlMrwQqf4wuwwbofYB2P7B1TVibatvt8DV12qC0t3WfTLDIKYPPVaVAr
 A/f3VdlkZ0uoLoIgysMyIpfF1UG/ANS6qt1mUuG29T5Cl6mAeNoOyvzUKOdJJ8uA7giL
 qD7sfjXYbwg4iSJN5ZIRmUBWa2wlbl+Ugvxjeg5ss11qHAsmn25CwI7z6ncTNoh9NJiX
 0sxAbxzSMgfnDrVk5m4SNa5jHt3jgGyiccSWLvURNhA4j4SyZORWhck4vjMgfFGv2a5b
 rPWOMAmALGAVvuNt8rbuXWXGHACZGW4c1S+jz+mgm5NHSXQm2562P12Dnu85ptTxZS39
 9eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zJxI8q9GaxwusSxiN1TRl1t50DLCSayUphT+bXOuVqA=;
 b=QapyXYUbTs7lhHLSdG0NOWCnJmKjz8T0AubxlEaeQzDkw6jXQ8oODrzWO6IUR5LuPe
 9EF/BdRfO8In7eGoafwQg4hRYexpOha4GsdYadU/PeB1mQqijZsVqm0G9PoYE1uI89my
 RsvWhnfIflkeiE0ZJpm4kVeELMeTvaZRZcGoj71j8lCBISvb1VjcChw0yspScSr8PSJR
 b6JlNo/mgIvMXmRrr/BJCNCR4SkwS+jSWbkca+OR2Jpl+vW+6MNHUBLN9szmHOWOrzje
 xtHjspHNFxx8QIbwBeV6j+1zsb42hSPxutLi5bnyFRA5dNTgYsnK+qu/XEfHK7ZYLJTH
 373A==
X-Gm-Message-State: AOAM530QllgQ26dySGXQ9Qn5nGG3XRGr+wxiDAZu/KvJ/eboKWXYtPN3
 AcTGFt0Bi59bRK14adK2SiD5evP/CPLmOJ72T/c62g==
X-Google-Smtp-Source: ABdhPJzdhwywLZUu1iioOyV4RjM5M1Epk+nZBmMIV652Jit18mFH9boEqTDc5xdPxLb/F7xuG/+hRyaxUu9GK3c0+oc=
X-Received: by 2002:a2e:711c:: with SMTP id m28mr384158ljc.104.1590492148520; 
 Tue, 26 May 2020 04:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200513212451.1919013-1-megous@megous.com>
 <20200513212451.1919013-3-megous@megous.com>
In-Reply-To: <20200513212451.1919013-3-megous@megous.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 May 2020 13:22:17 +0200
Message-ID: <CACRpkdbb0Y32EG=tEx208eUh_CJndvnQGQvAnF_mG29Hd9-2Jg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: panel: Add binding for Xingbangda
 XBD599 panel
To: Ondrej Jirman <megous@megous.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Luca Weiss <luca@z3ntu.xyz>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 11:24 PM Ondrej Jirman <megous@megous.com> wrote:

> From: Icenowy Zheng <icenowy@aosc.io>
>
> Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI LCD panel. It is based on
> Sitronix ST7703 LCD controller.
>
> Add its device tree binding.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
