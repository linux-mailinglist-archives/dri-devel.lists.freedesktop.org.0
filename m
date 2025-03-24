Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94B8A6E0B3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 18:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9212610E1C1;
	Mon, 24 Mar 2025 17:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="g3olFC4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7186910E1C1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 17:17:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54298ec925bso6755151e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 10:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742836639; x=1743441439;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FyxjEAPrVF48YiUEzfdDkCEOg/lxIrDdeyM/aokkYS8=;
 b=g3olFC4Kh2TO7ZAaQmhmXS5x808xD+xyzVYUtabMdET87DK4RmGcbvRt6MwR1kBiNW
 ttALzPtBisUFqIJd9DcHOlCQhpQ4SI+o57ckLTm2c+/nEU0Jp6MQlx221sU08I5/v1jd
 oABANlQKCWgoxxkJCv5fR2a11uCVoZGr9bVbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742836639; x=1743441439;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FyxjEAPrVF48YiUEzfdDkCEOg/lxIrDdeyM/aokkYS8=;
 b=aQH/CRCWaY3lxoAGNwtbHHPbwswD4E8zwwMsFSoq1IfYu5e8V+Xg6obad+6xfQ7Jjs
 i8M9a/PglbW3eLuDnF2fCvCb5Um8ygu0TM4D7MhgxPmYdr0tPmoF/xxrv1FosLwk6I9Y
 dOxr682QU7rdFRnAQ5N/fHaPm2KJZMkcTWA5Df3+TRT2hpMAEALlHbA00iMppCZG1ZLd
 6y36qVaKdb/FVqZXR0Hxnh6clzJcrISaWvMzXXoRW2g1GgAj8MwHEEqxQCEDR7XIS5tE
 bEugtekHLdyKhDZq6VCouxaEiiFrjsNXap9XX4c6H3msO9o8sYN049I2G55t3JCuW8Y9
 R5JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsOtQGKtEO3EuYb9gVxLtfUH87pQASblphdGPUfwOE13yzkQ/e9qUf8XCsmKBKLYaNLVqVCVo2Ak4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3RS16yjwILuyEsfha4jAnmJTXTlZ0iEHO0o9x0YZ8vHHvsfp+
 gdm9PQG8ov1ckAti1Z3xsHsn2YFtczV8LbKSX3ZqNYbQuni6MHKxh6czuA4HyEhNXcMCt5jzcaK
 fPRe4
X-Gm-Gg: ASbGncvDqDW0fVdLGubrGS1Gv6CBF5IWId4H3/aMUMfAflghGkfTTvsrz81rSNwv15k
 BDgjtqMN1kR0yfkRZCAGmwK3eax//FzEl1urqRv9siP/MDvb3rMPY7ItlsBSbHEnwr1BovjlJP+
 HRQWibAN9bo/qxheUYSvfH4Op3rZE3BI7/JHu+CaY+EL8DCo9PHpxEl0UKEl7OEeI6nzwFYUuOV
 F0qzHT/kopLaMPyVL4zxRO/FKQmSoiklBH80575tNfkPIMIEoECS12U3DuzoR4qEqCOZ2XuQPPU
 oL2xKaPQrY5kc62A/yxGnie5uJ9rMeGKG99dGFNXghhYtonsQexlS7k9kKS+JJTHfe+2Q50ga4k
 qO4NfNoq5
X-Google-Smtp-Source: AGHT+IGCb/jeyDaAYVvB1F3Pa0pzj+fjYiYWB8JHrInSAAuK7sifOgRPs+h/VRp+UPCOifzujmonPg==
X-Received: by 2002:a05:6512:3b86:b0:545:652:109 with SMTP id
 2adb3069b0e04-54ad650d625mr4736532e87.51.1742836638863; 
 Mon, 24 Mar 2025 10:17:18 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad64688f9sm1192781e87.15.2025.03.24.10.17.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 10:17:18 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5497590ffbbso5278538e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 10:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXyhjPE287aZ9zuDNQtj5yZN0PFyeBZelbWcdm/2sFhhw0T34PMbuCUpQHlZ1LLtqN0FHxaRuVknfg=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3e1f:b0:545:519:2d9e with SMTP id
 2adb3069b0e04-54ad650d4b4mr4523674e87.47.1742836636811; Mon, 24 Mar 2025
 10:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
 <20250318204133.GC22890@pendragon.ideasonboard.com> <Z9ne78KhxfKYgnh_@ninjato>
 <20250324164025.GK5113@pendragon.ideasonboard.com>
In-Reply-To: <20250324164025.GK5113@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Mar 2025 10:17:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Umc0aAvDrQhoZoaaOHjn8B2u0BTtgqeS3oEcH+mtAgwA@mail.gmail.com>
X-Gm-Features: AQ5f1Jq2UlyKfisdyLjGNfMlfBrnWMqyIxTMqQHM0u2AMCUh84s80jlGo60a35s
Message-ID: <CAD=FV=Umc0aAvDrQhoZoaaOHjn8B2u0BTtgqeS3oEcH+mtAgwA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
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

Hi,

On Mon, Mar 24, 2025 at 9:40=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Mar 18, 2025 at 10:00:31PM +0100, Wolfram Sang wrote:
> > Hi Laurent,
> >
> > > > Read out and check the ID registers, so we can bail out if I2C
> > > > communication does not work or if the device is unknown.
> > >
> > > What's the advantage of that, what are you trying to guard against ?
> >
> > That a random chip at address 0x2c will be used.
>
> Is that really a problem ? That would only occur with a broken DT, is it
> worth guarding against a development-time issue with a runtime check
> that will increase boot time for every user ?

FWIW, this can also happen simply due to broken / damaged hardware. If
a board gets stressed and causes a pin to become disconnected or if a
regulator ages and stops providing power then we can also end up in
this state. Getting a nice obvious error at probe when the device
isn't responding at all can make problems like this much easier to
debug. It's not uncommon for i2c devices to probe to make sure the
device is really there at bootup. Checking for the full 8-byte ID is
probably a bit overkill, but at the same time if we're going to probe
something the ID is not a terrible thing to probe and reading 8 bytes
won't really take much longer than reading 1.

-Doug
