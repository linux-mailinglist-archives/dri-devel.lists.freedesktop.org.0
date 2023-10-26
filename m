Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535A37D8B62
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 00:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CBE10E8C3;
	Thu, 26 Oct 2023 22:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF0610E8C3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 22:04:36 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-66d1ef93284so9117536d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 15:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698357875; x=1698962675;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sSd/vKiWGCqSroqTlgB85YhM0qAevm+SLaYc82xbLpQ=;
 b=NpWWN6Y+WUr/3ddf5laCljJ98vW1PIZCdadeMGksiMzfROsGXu3hJqTTP4ExIJ1/qw
 VUhKXSjKIDNFN5Slb6q4VFWGahME3ACx8mjPu70otiJHYTJHqpB32ohC83NkFJPT20sc
 rU+I+vQ+zE2tdlqV5DnQFtIU7PVoS8G3/ai88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698357875; x=1698962675;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sSd/vKiWGCqSroqTlgB85YhM0qAevm+SLaYc82xbLpQ=;
 b=lTvH6GeAjwytqMDKpRAFctLtwhDl4KsxA8EhlY03h9smKi95l1UZhVg7403DvravH5
 4UV1nofhnOGq4/8LNcqlrsq/Up1N1vhUBOCTbvM/unp9MbwVgywJQM9cEEURFO1vHopM
 RkcOhwwEQR6ydt32Gs8xVUljLLbLcpRjXn00ZdDWHdrDn+2JUJnukTQ65MMUaM516f1W
 gEi9CjZ9UGHGzEVN0ki9oZBsAldQxwEUVy1eVx4VC3LxddJFGCqzDkRvq/oGf0NjEAWJ
 4v6D/hh7B2nfbOhLkCfSQaTxvR/JZEdU6CGahY9SrZIp5BrWzj6s5N67UhYM2kXX/lfE
 F7eQ==
X-Gm-Message-State: AOJu0Yw4M4SiVlNRygLEWE4wtfB8FE/qEyN3hZcIErIyc5VkUmbd3+WQ
 nmwXeuRjZTdphAlp6tzD3wx2NTrmzb+Xt0Zh90g=
X-Google-Smtp-Source: AGHT+IFrcgxsAwEH4O/fyalLqGSX73azIh9B4VYm22cwDQSCtiuVTypJBBJctF6tg+TOQ5tJ7G1uxg==
X-Received: by 2002:a05:6214:5006:b0:66d:48e4:9928 with SMTP id
 jo6-20020a056214500600b0066d48e49928mr1270344qvb.12.1698357874754; 
 Thu, 26 Oct 2023 15:04:34 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 x16-20020ae9e910000000b00767d8e12ce3sm65155qkf.49.2023.10.26.15.04.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 15:04:33 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-419b53acc11so114241cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 15:04:33 -0700 (PDT)
X-Received: by 2002:a05:622a:2692:b0:41e:397b:7c2f with SMTP id
 kd18-20020a05622a269200b0041e397b7c2fmr93428qtb.28.1698357872722; Thu, 26 Oct
 2023 15:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <DU0PR10MB7076C5C33C4F3E9097E372E7ADDDA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DU0PR10MB7076C5C33C4F3E9097E372E7ADDDA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Oct 2023 15:04:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XafnQy0Tg_pSvarNmsFX-mkFq0abYipkAm+28wr+byrw@mail.gmail.com>
Message-ID: <CAD=FV=XafnQy0Tg_pSvarNmsFX-mkFq0abYipkAm+28wr+byrw@mail.gmail.com>
Subject: Re: drm/panel: panel-simple power-off sequencing
To: "Jonas Mark (BT-FS/ENG1-GRB)" <Mark.Jonas@de.bosch.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "Simoes Ricardo \(BT-FS/ENG1.1-Ovr\)" <Ricardo.Simoes@pt.bosch.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 26, 2023 at 7:37=E2=80=AFAM Jonas Mark (BT-FS/ENG1-GRB)
<Mark.Jonas@de.bosch.com> wrote:
>
> Hi,
>
> We have a parallel LCD panel which is driven by panel/panel-simple. The p=
ower-off sequence specified in the datasheet requires that the enable-gpio =
must be deasserted for a number of VSYNC cycles before shutting down all ot=
her control signals. See the diagram below:
>                         __  __  __  __  __
> CLK, VSYNC, DE, HSYNC:  __><__><__><__><__\_____________________
>                         ______
> enable-gpio          :        \_________________________________
>
> So far, in kernel 5.4 we relied on the unprepare delay time for making su=
re that the enable-gpio timing requirements are fulfilled. That is, the
> panel_simple_unprepare() would:
>
> 1. Deassert the enable-gpio
> 2. Switch off the voltage regulator
> 3. Wait display_desc.delay.unprepare milliseconds
>
> Afterwards the IPU was shutdown, and all the control signals stopped.
>
> But with the below commits:
>
>  - 3235b0f20a0a4135e9053f1174d096eff166d0fb
>    "drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare =
/ prepare"
>  - e5e30dfcf3db1534019c40d94ed58fd2869f9359
>    "drm: panel: simple: Defer unprepare delay till next prepare to shorte=
n it"
>
> The enable-gpio is now deasserted in panel_simple_suspend(), which is cal=
led some time after the disablement of control signals are stopped:
>                         __  __  __  __  __
> CLK, VSYNC, DE, HSYNC:  __><__><__><__><__\_____________________
>                         __________________________
> enable-gpio          :                            \_____________
>
> With the latest panel-simple, is there a way which allows us to deassert =
enable-gpio before the control signals stop?

As I understood it, the "unprepare" time was originally intended to
meet minimum power off timings and that's how I always saw it used,
but it doesn't totally surprise me that there was someone relying on
the old behavior. I personally wouldn't object to adding another field
to panel-simple that allowed you to get the delay you needed and then
change your panel details to use that new field instead of the
"unprepare" milliseconds. ...or you could rename the current
"unprepare" delay to something like "min_poweroff" and then
re-introduce an "unprepare" delay that does what you want.

Oh! ...but even this won't _really_ do what you want, right? The
bigger issue here is that panel-simple is using auto-suspend now and
thus the enable line can go off much, much later.

What it kind-of sounds like is that you want the "enable" GPIO to be
controlled by the "enable" and "disable" functions of panel-simple.
Then you could use the "disable" delay, right?

I think I've looked at this exact case before and then realized that
there's a better solution. At least in all cases I looked at the
"enable-gpio" you're talking about was actually better modeled as a
_backlight_ enable GPIO. The "backlight" is turned off before
panel-simple's disable() function is called (see drm_panel_disable().
So if you move the GPIO to the backlight and add a "disable" delay
then you're all set.

Does that work for you? Does it make sense for this GPIO to be modeled
as a backlight GPIO?


-Doug
