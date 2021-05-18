Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F535387728
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B43E6E870;
	Tue, 18 May 2021 11:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD006E870;
 Tue, 18 May 2021 11:10:08 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id 20so3095854uaf.12;
 Tue, 18 May 2021 04:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mwu5JNJHqBy2J4pl0vbVezQTh0b981uCtZz9YlSG8b8=;
 b=vWgOmCD1cvMJZIIA3gcuyktC6Z2qjElSlS1a85vG39qKZU2NZ2oXGrwJ+PMr48nqps
 ot3Pt8QwRz3Uysmihnz21c5BGvVwar/aORC/m4EeG5BvmOKHvzAanq30hTOiYOVZtPox
 ckt6ojiXwGwSP7ljOhYF6o2ogf76m2UuWvsYZIPaGnnFuUYI0ja7arQFXOSC07zK4jAE
 drUNFkWBUuHMvgPWm3+aZQVKW5vP4GSPvRXRbypeMjO9ooQZkP147deL7M+KEXKGdE0g
 C/1fE9CBp+k3S1d7/F8lb5+bDp1nYesbzkiw52YaMTy5F2TSM8ZwBD8wcC9TTixk5/dw
 GK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mwu5JNJHqBy2J4pl0vbVezQTh0b981uCtZz9YlSG8b8=;
 b=qaBAy7MjD0Z4SYZEfTwt49BDdYh+LdymDGmEM2ZIwTlMyzg3S6Bgyauz4RSaWUyQHc
 ZPL78aTEpi6KJeA9VpaxbpE9CL21DRuQ6QXTsF8nENNpYeTgdh8BHdZSaYws9ubYQxpN
 6lA7dI4R7ntb7xZ74N0GTnOs3ieMDoutqU6T8Gbhx2kuCNlE3Amlob4J9E8RZ/jl/JiM
 LAfEpWlXFNKilYyHLM3LZ1BVKbxIcLPQAj79RYVVvWMdLF8ur32YUeEZL3bQ4tWKHkuX
 DEPp4BjAm5nREop7vcflCQA7dJdWT9+SFdhSmoqvXmmCqFQ7NJgVJCdLBmB8jLPLQyKk
 6Hdg==
X-Gm-Message-State: AOAM533391gH+lndc1qz8F9rotlMLKJbS+uWvehLA+gUKEyPk6P227kJ
 XNyoWxBM79gyd+6RQOeBvvjwrVDiP4Hi1uL8D/0=
X-Google-Smtp-Source: ABdhPJx8f7Xxd6YrHmjlVSCW9LNRDeWY4Cm9dE5A8s601Zx5cTaMMTk2zheoDWHRX5m9q3pHijdirQVz0u9zkSallUI=
X-Received: by 2002:ab0:3811:: with SMTP id x17mr5597871uav.69.1621336207823; 
 Tue, 18 May 2021 04:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210516171432.1734268-1-emil.l.velikov@gmail.com>
 <YKKmsbvTZBwCUiRu@intel.com>
In-Reply-To: <YKKmsbvTZBwCUiRu@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 18 May 2021 12:09:56 +0100
Message-ID: <CACvgo53H7GAjN_aFsCBOw+xtVbjcbR1q-U3vdgjT1KUPKoMkkg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: only disable default vga device
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

On Mon, 17 May 2021 at 18:24, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Sun, May 16, 2021 at 06:14:32PM +0100, Emil Velikov wrote:
> > From: Vivek Das Mohapatra <vivek@collabora.com>
> >
> > This patch is to do with seamless handover, eg when the sequence is
> > bootloader =E2=86=92 plymouth =E2=86=92 desktop.
> >
> > It switches the vga arbiter from the "other" GPU to the default one
> > (intel in this case), so the driver can issue some io().
>
> I don't understand what this commit message is trying to say.
>
Bunch of context is lost due to the patch age, so I'm not 100% sure of
the actual hardware setup where this occurs.
Does the following make sense?

Currently on dual GPU systems, we do not get seamless handover as the
output flickers during the transition bootloader -> plymouth ->
desktop.
This happens as a result of switching (via the VGA arbiter) from the
"other" GPU back to the default i915 one and issuing io() commands.

-Emil
