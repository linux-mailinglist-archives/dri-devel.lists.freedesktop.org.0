Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341B89B6AFE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 18:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9E210E7DB;
	Wed, 30 Oct 2024 17:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DcsACOAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFD510E3E9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 17:28:24 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-71e625b00bcso36771b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 10:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730309304; x=1730914104; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MnkN8ptr3KGmpx2Uv+pp+uUkuHBCH11BckHc8GqWeDg=;
 b=DcsACOABO7w6sepCThEkWovmlQsGkJ8zGqdADyFCieVQSltIInO7JgOlf1VF1DKhlQ
 RPw0IfcFtwodGHkJ4GUi81ekfKCFXrqwHiF7i2HFJkp5sGZqh/RNPSgrHWCc7xtI1JKn
 p/hE0gmCBnP0CFkRbZXRjvC5rDzXaGkc+34x22Luv0GJMTZwnWCJNltoHvbbN9QHKO+7
 5o8QO1QkJbM07P76O0xNpCpuJt8fEgrkuizSyKhWkiwo9BQ8f9CCVoSxI+vUffZJAZxU
 mVxj2zUq1xRWWiCVwooTnDrgLqZjW37ex8BnrZ1sGqO9QOx57KMTf9UPZOpmrAwiWPtp
 bFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730309304; x=1730914104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MnkN8ptr3KGmpx2Uv+pp+uUkuHBCH11BckHc8GqWeDg=;
 b=bb6cs+Aw/W2U25jtakH/du7UbxuKDPooOzEId+EmOOCT0C3xM2yM0RFbVSX5ra6Qct
 kamJaraxe++04oksIVa/jzA27c98GfB+ycO/vN6MBfzYWn2ERb2py9MRiAH/PNWlrUtV
 e9TauF0lrxzcVVU3rPh/MKRQ1cisPnVNwjJJR2BRCtXgZhzecQFGHk1l4mXRqcxCHbrm
 r1+TXIiVqfL1nJYoGLtEcWGdTkYdlmjT055HKjG35sB8gHVwGqweJv2wwh084oQcwLFZ
 8i+AXGs0AvVJa5JUElMXekKWCtKxOkdsDB3hC1Ugi3YZI6UjdCBzqjDMMavX2ejFlSF8
 +dpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVzdK6gKybamzmuP+K0jNCPp7/0gQ7SwZGtGqNWw3uj6dLQsN7zDvGfvOznmqR4+rok3176BZ4xlE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz45UlbKqOW2VaThmGgROdxeCaiEqGOVrHrminBhZ07UbTa2IEd
 Pe5aVqyETKZczBPCaXqv6JFK2Ph0EqTHNvbg+ilDaK41EVDa5vHhoyEYRjae8QQe0XH3VazIgG/
 ZJvXAgAHxKslgIrHs97o2BMsI+3A=
X-Google-Smtp-Source: AGHT+IHW4Ei/MHebO474qYJ4FnNy3KOOcESKnX+HK1imXciZaQOAIYn479DmypH3MHAeRnnMNdgGnRLoV9bhVu1WXCI=
X-Received: by 2002:a05:6a00:3c96:b0:71d:f4ef:6b3a with SMTP id
 d2e1a72fcca58-720b9db22bfmr624360b3a.21.1730309303938; Wed, 30 Oct 2024
 10:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com>
 <20241025080544.136280-1-mailinglist1@johanneskirchmair.de>
 <6d039ecf-0e48-415a-afd8-6bfce60081ae@kontron.de>
In-Reply-To: <6d039ecf-0e48-415a-afd8-6bfce60081ae@kontron.de>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 30 Oct 2024 12:28:12 -0500
Message-ID: <CAHCN7xKevGWipBSch6gKVeJRT9Zb8QTchhxg3c=96XhnAvnjZw@mail.gmail.com>
Subject: Re: imx8mp: HDMI display blank/black problems
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: mailinglist1@johanneskirchmair.de, johannes.kirchmair@skidata.com, 
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 alexander.stein@ew.tq-group.com, andrzej.hajda@intel.com, 
 catalin.marinas@arm.com, conor+dt@kernel.org, daniel@ffwll.ch, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 festevam@gmail.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 kernel@pengutronix.de, kishon@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
 linux-imx@nxp.com, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, marex@denx.de, mripard@kernel.org, 
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, rfoss@kernel.org, 
 robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, 
 tzimmermann@suse.de, ulf.hansson@linaro.org, victor.liu@nxp.com, 
 vkoul@kernel.org, will@kernel.org, Saravana Kannan <saravanak@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 30, 2024 at 4:01=E2=80=AFAM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Johannes,
>
> On 25.10.24 10:05 AM, mailinglist1@johanneskirchmair.de wrote:
> > [Sie erhalten nicht h=C3=A4ufig E-Mails von mailinglist1@johanneskirchm=
air.de. Weitere Informationen, warum dies wichtig ist, finden Sie unter htt=
ps://aka.ms/LearnAboutSenderIdentification ]
> >
> > Hey,
> > We had some problems with the hdmi on the imx8mp and wanted to leave, w=
hat we found out about it, somewhere for others to find it.
> >
> > The problem was that our hdmi display sometimes stayed blank after hot =
plugging and sometimes at startup. On older kernel versions 6.6 we did not =
have the problem with the not mainlined hdmi patches.
> > We tracked the commit down that introduced the problem for us. It was t=
he following =E2=80=9Cdriver core: Enable fw_devlink=3Drpm by default=E2=80=
=9D  https://lore.kernel.org/lkml/20231113220948.80089-1-saravanak@google.c=
om/
> > So we switched back to FW_DEVLINK_FLAGS_ON via kernel parameter. Don=E2=
=80=99t really understand what the problem with RPM is.
> >
> > So, this information is just for reference. Maybe someone has an idea w=
hat is going on here. And how to fix the problem in a more proper way.
>
> Thanks for investigating and sharing your results!
>
> I'm seeing the same symptoms and previously found out that this is
> related to LCDIF underrun errors. See [1] for more information.
>
> Adam has also started this thread: [2].
>
> Anyway, knowing that this is related to fw_devlink=3Drpm is really
> helpful. I just tried with fw_devlink=3Don and wasn't able to see any
> issues anymore. So this confirms your findings.

I was off in the weeds thinking there was something wrong in timing
and/or a race condition around the PLL or something.  This is good
news.
Please forgive my ignorance, what does fw_devlink do?  Is there
something we can do in the driver itself to force its behavior?

adam
>
> I hope that some of the driver framework and runtime PM experts can help
> to find out what is actually wrong and how the correct fix might look lik=
e.
>
> I'm also CC-ing Saravana who authored the change from fw_devlink=3Don to
> fw_devlink=3Drpm to see if they have anything to add.
>
> Thanks
> Frieder
>
> [1]
> https://patchwork.kernel.org/project/linux-phy/cover/20240904233100.11461=
1-1-aford173@gmail.com/#26014057
> [2]
> https://lore.kernel.org/imx/8cfd3052-c85a-4235-b9b8-6d2929e9e455@kontron.=
de/T/
