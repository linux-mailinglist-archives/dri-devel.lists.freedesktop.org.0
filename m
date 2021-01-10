Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4765E2F0DD6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFBC89D77;
	Mon, 11 Jan 2021 08:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EA589B12
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 20:09:12 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id cw27so16699050edb.5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 12:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kUyUrQs3xayATQiBWATvxgCd0SP5l5aLWIuYGmxV8Jg=;
 b=mDR2LUmfkn2nNOs0YdM2bPqrC9RQ3FZoumw6mJ+AGC0Xvi+kKiCZ+JDVdSm3P+x8W2
 sEbqxl1gLTMpJ1cL4y1AOcquOlDcANECEWWxxI7TaKsFv/SSF9N5hiaBkdEup9y3YGov
 gy21SN97OlMRzxibSNmKt+arB6gSE+g/ajtGbVOrVzw9yvlgf+21fJm0hfEOVd6WilMU
 vVxZQs3EJ1mOktZvvVB3xzaEf396p1FDP+EdqG35WhZ/Q/FFVUHVW5O9kX+exI1tbyFe
 yHtPpfw2rbNsJNse5w3qoHZdijULR4KxfOIJzVGbw/yfvPoI3molydO9gYqwGHDP7L86
 v43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kUyUrQs3xayATQiBWATvxgCd0SP5l5aLWIuYGmxV8Jg=;
 b=VtMvZW3wGB6l1zZsxftmAVDdrmh6srCdHO89ZRsBBzzk1vwBOBFdvzY/SOP1JrIAFn
 OVfQtfZVshy0zHykLyCWgI5JcferyNeRaKXxzHSXQNsDYl487Wab7dY5SjvJcXy2V2Iy
 2dsoEHB+wDBJQqnuMsHJ/tPq6XYQ2aAwHSoCOnqYvg/feItT5UP+RFqK1oEkoSjj3lpx
 HyoSH2mLzGZ0LNrZdDML2aFByABuYsjCIcMes++GYHpQRdeXjQZAnEKeAn7IH3Ul09QX
 +0PoNB6npBX28moQFGmJK4gB4NbGjAtu94k4zM2+Pz1XeH7kBXPbEaurjdq+8/vp3Axb
 2G9g==
X-Gm-Message-State: AOAM5301mUVs/brcWEBj+eAelvqg/4A0R0kXcjoMrWB78YvPwB5gwei9
 D+B9RjgAMnTaF4ajL6tcc+8=
X-Google-Smtp-Source: ABdhPJwBV78e3ELX9S6MpKm1ZyGlpFi7ZJ+UjlJDv/dZs/CrDycgWvTGrDXLNdNiVWCW6jDV/xw7MA==
X-Received: by 2002:a05:6402:22e1:: with SMTP id
 dn1mr12351863edb.347.1610309350980; 
 Sun, 10 Jan 2021 12:09:10 -0800 (PST)
Received: from localhost (ip1f10d3e8.dynamic.kabel-deutschland.de.
 [31.16.211.232])
 by smtp.gmail.com with ESMTPSA id dh19sm6773536edb.78.2021.01.10.12.09.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Jan 2021 12:09:10 -0800 (PST)
Date: Sun, 10 Jan 2021 21:06:06 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
Message-ID: <20210110200606.GD7264@ripley>
References: <1608381853-18582-1-git-send-email-oliver.graute@gmail.com>
 <20210108214313.GA7979@ripley>
 <CAOMZO5AXgeGYt4+4NMBRL1Hm-9M4X2DngdEBsJEAHq8+MRhQgQ@mail.gmail.com>
 <20210110153532.GA7264@ripley>
 <CAOMZO5C_hDWeVrCh7k+3OiA0jhQfawhGWE6hxnnFn=wA+dkTGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5C_hDWeVrCh7k+3OiA0jhQfawhGWE6hxnnFn=wA+dkTGQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 11 Jan 2021 08:20:05 +0000
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
Cc: David Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/01/21, Fabio Estevam wrote:
> Hi Oliver,
> 
> On Sun, Jan 10, 2021 at 12:35 PM Oliver Graute <oliver.graute@gmail.com> wrote:
> 
> > the first two errors are gone. But I still get this:
> >
> > [   42.387107] mxsfb 21c8000.lcdif: Cannot connect bridge: -517
> >
> > The panel is still off perhaps I miss something else.
> 
> Some suggestions:
> 
> - Take a look at arch/arm/boot/dts/imx6ul-14x14-evk.dtsi as a
> reference as it has display functional
> - Use imx_v6_v7_defconfig to make sure all the required drivers are selected

ok I checked imx6ul-14x14-evk.dtsi and use imx_v6_v7_defconfig

> - If it still does not work, share the dts and schematics

here the schematics and my dts. The board is using a LVDS connector for
the display.

https://www.variscite.de/wp-content/uploads/2017/12/VAR-6ULCustomboard-Schematics.pdf
https://lore.kernel.org/linux-arm-kernel/1610144511-19018-3-git-send-email-oliver.graute@gmail.com/

Thx for your help,

Best Regards,

Oliver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
