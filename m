Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B78973E10E5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 11:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981FB6E43F;
	Thu,  5 Aug 2021 09:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DE36E43F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 09:10:46 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g13so9677457lfj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 02:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GJwSqkoynJ2MGVTaxaCF6tjvxxMA2tETgRViwoLL+uA=;
 b=BdFbpdP8kIg3G9AXQcWSIAeuhscjDoUZNHs6tTtydjVKNUqX6XH/PSRXgAvDDkibyH
 5y1QnI6iyG41rUI4BShiWsjCdK9reMem48YfsrqtBHdjkZ/XH+7NfJ+Fp2W+rvSiXgIj
 KDzQQqJGe57bSr7SJNVLID1dJ7Ja1FgI6yo4Qu25gQia7UNjomXH2lFAS5NmjX7WzsWP
 7yol4EFp/gL0Qs9PjkuGiH0wi/O1hWWB9WpeJuEpUYm4b83BPy5lLxvlRxVq3VWu52AX
 EJs2V9pNjHHKlGmtbjwr7Ripm4xap7zc2hd36d6NtjMcalc9jcX66PggfAmfrUt4wDpy
 6L3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GJwSqkoynJ2MGVTaxaCF6tjvxxMA2tETgRViwoLL+uA=;
 b=eS3fSI6/4CWKbfVy22hAPw6+B00YWExUTxLke9alamVIJATRiJjC2nrgJ0MDKsSfmj
 /n6smKFKQCfvDb5uZYqo0fM7Lr8Nrs53r89z7A9KL0opZuIpFXbR+SBEGug4vtuAykLL
 W/V3DejwDOJiFc4OATT1I/Xdi2p47K7B4F5CY+U1AAkwCW39o4M1wmXQoQSZn3zME3eV
 fyaR+sU7C+4PlHjLUPUyztarhYp/mrcA30xLnCHpbRhBWWfcL4B94FtiH8IopRgODDFx
 0Ahn+I3Wemr1/il5AfRMhUTCrsd940aAFNlkRgcqRjabyLS+Lkov1GA4Ag+V1WD4fxmZ
 eBiQ==
X-Gm-Message-State: AOAM532ilBGyJv3f05awQQLhl1/O8T8HuTo4ipSar4+7A29IKjb+QkDZ
 V62aCYTu3ksycIXS0HA0i3JPtiVw1pWwwS14vx/dtA==
X-Google-Smtp-Source: ABdhPJzZpUm8mUiTLlF2l2RaGugFmMpQMMqoQ5ipZx5ajfXnBZ534P16n8WUxjIaWbrbZLOd9+eZHKDTwonxKjv8meI=
X-Received: by 2002:ac2:4d0f:: with SMTP id r15mr2833139lfi.649.1628154644990; 
 Thu, 05 Aug 2021 02:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
 <1627098243-2742-4-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1627098243-2742-4-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Aug 2021 11:10:33 +0200
Message-ID: <CACRpkdYzrpHgDCW2UXNnFk-NpC_yM5xeSe_jBDJMGa6==5SHXw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel: Add ilitek ili9341 panel driver
To: dillon min <dillon.minfei@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kbuild-all@lists.01.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 5:44 AM <dillon.minfei@gmail.com> wrote:

> From: Dillon Min <dillon.minfei@gmail.com>
>
> This driver combines tiny/ili9341.c mipi_dbi_interface driver
> with mipi_dpi_interface driver, can support ili9341 with serial
> mode and parallel rgb interface mode by different dts bindings.
>
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> v4:
> - fix m68k-allmodconfig build error which reported by lkp, thanks.
> - add Copyright 2018 David Lechner <david@lechnology.com>.

Patch applied to drm-misc-next

Thanks for working on this driver!

Yours,
Linus Walleij
