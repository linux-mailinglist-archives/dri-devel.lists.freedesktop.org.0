Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5850A7BA7C4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB6510E472;
	Thu,  5 Oct 2023 17:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C472F10E472
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 17:18:57 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2bfed7c4e6dso14056981fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 10:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696526336; x=1697131136;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K4qtwUC5OWXLWsxsdHc8Vyp8jChtnD5xWpTwtPZAf1Y=;
 b=J5DgrZ5gyEJZFPTQE8L8q74hZqXPOG193aS4SbcM5CBhhXf9GKaXp0DS18i4Vorar7
 QpsWqPvDzG+yJW6fhhoS8gxoOu7day+j4h61EAdSvD750VzL/wVsp1fXSKiczpLERI3O
 M3/8HEIKrvYI/DIYFPFhD8eOWWkbEZNugZ1Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696526336; x=1697131136;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K4qtwUC5OWXLWsxsdHc8Vyp8jChtnD5xWpTwtPZAf1Y=;
 b=IX8BC5b00l7mV83Vn9Ohoc9OcSszcQWMo3efh5VZHBE0IMrKvqixDT0cTCZp+MtWt1
 la8pXAgJqYI+usnxoShNvt2sdyIXxoUA7/RNWcNRSgoeh+xVXR04WHfPfF0uexJUsn5Z
 koUA3Kfkw0Dd/VhbG2HnPCKlzKdi2QCRqosdRh0SCvnmIaG9IPVuEcj9ZUmC6ZMG51fv
 vgxOxMXuANr1+FRzKjDyzX6r6qWZ4HURcw5ZIhk3FVUkXDZuqmmVq11NTS8DUjBO4aQx
 rtBSRRRgzRkm8lx7LWm0TLKs00QZwj83zAbqAdYYlf3e1qZuNXwt2cZUNHvlaCG3osKj
 qogQ==
X-Gm-Message-State: AOJu0Yxa+t2MkTEf/RKcJTrRouApCOtgCbeh8tvbBlvZNshI0h7gHeMV
 QsP22PhmNJ9A7tKvHYoPS5oD2kwuiLEdEnGI21XQkg==
X-Google-Smtp-Source: AGHT+IGz3dfXxzyBA3mj6bpkuScOj2CsByPZVzGVOuypWZVASQXSq77oLaNIiQZy12jlFuvTXd6MBb+9Nrb2xXw8Z0k=
X-Received: by 2002:a05:6512:2030:b0:503:258f:fd15 with SMTP id
 s16-20020a056512203000b00503258ffd15mr4793359lfs.20.1696526335763; Thu, 05
 Oct 2023 10:18:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Oct 2023 12:18:55 -0500
MIME-Version: 1.0
In-Reply-To: <CAD=FV=U2dza-rxV=YtcfJwUY-gZw5FrCyn0NahOxvXJW2J2-vg@mail.gmail.com>
References: <20231002235407.769399-1-swboyd@chromium.org>
 <CAD=FV=U2dza-rxV=YtcfJwUY-gZw5FrCyn0NahOxvXJW2J2-vg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 5 Oct 2023 12:18:55 -0500
Message-ID: <CAE-0n51LJDgop-Nh+Aq1CTiu7xJZOqOsdSvHMmXzshkRKM3dgg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Associate DSI device lifetime
 with auxiliary device
To: Doug Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2023-10-02 17:31:41)
> Hi,
>
> On Mon, Oct 2, 2023 at 4:54=E2=80=AFPM Stephen Boyd <swboyd@chromium.org>=
 wrote:
> >
> > The kernel produces a warning splat and the DSI device fails to registe=
r
> > in this driver if the i2c driver probes, populates child auxiliary
> > devices, and then somewhere in ti_sn_bridge_probe() a function call
> > returns -EPROBE_DEFER. When the auxiliary driver probe defers, the dsi
> > device created by devm_mipi_dsi_device_register_full() is left
> > registered because the devm managed device used to manage the lifetime
> > of the DSI device is the parent i2c device, not the auxiliary device
> > that is being probed.
> >
> > Associate the DSI device created and managed by this driver to the
> > lifetime of the auxiliary device, not the i2c device, so that the DSI
> > device is removed when the auxiliary driver unbinds. Similarly change
> > the device pointer used for dev_err_probe() so the deferred probe error=
s
> > are associated with the auxiliary device instead of the parent i2c
> > device so we can narrow down future problems faster.
> >
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DS=
I device at probe")
>
> Even before that commit I think it was using the main "dev" instead of
> the auxiliary device's "dev" for some "devm" stuff. I guess the
> difference is that it wouldn't mess with probe deferral? Searching
> back, I think the first instance of a case that was using "devm_" with
> the wrong device was commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86:
> Wrap panel with panel-bridge")? Would it make sense to use that as a
> Fixes, you think?

The problem for me is that the dsi device is registered twice. That
happens because probe for the auxiliary device happens twice. I was
cautious about the fixes tag here because it didn't look like probe
deferral was happening before commit c3b75d4734cb.

>
> In any case, this looks reasonable to me:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll give it a week and then apply to "-fixes" if everything is quiet.

Thanks!
