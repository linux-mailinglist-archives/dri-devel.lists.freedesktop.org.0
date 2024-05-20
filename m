Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A808C9DA8
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5424910E6AA;
	Mon, 20 May 2024 12:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lAGA5er1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F4D10E6AA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:46:18 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1ecd3867556so75488955ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716209178; x=1716813978; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BwMxQZoH/pdYWGNQ/YeZLuMCW+PYBbYOJhWPSoR82r8=;
 b=lAGA5er1Hc0VMTzgdFMikwTGrs78g+y70qO+CUzmQVQWpO5bNw+Gmb5fK6xdpnJX1x
 8OgtgIcTlJIlUjUVxiNoL8ptCUAk6pL+Zj8r0rgn3QK/LRqM0DqK8wYPpLJwKf0kEacA
 Qwomz6Qtgl9pnO8Xg0frB4bPZ+/1LREKXm6uXLqinhLqiauR6RUyYpFFRMZjKZegxogL
 9xO6ayJZp+QHRpNQwENGMtKvXS193XKVFdPtXjaOlqJOV6iKhW9rpy/Pr6AXi0oQTlT6
 RWIBPD3ZO8sjj2JQ/5Z8LWn9iklyBJJ+XM2q2iEiSwyNqhrpmp+6lyE9zaTAI9Ny76hX
 MBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716209178; x=1716813978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwMxQZoH/pdYWGNQ/YeZLuMCW+PYBbYOJhWPSoR82r8=;
 b=DxVO4FpnvLVsC0lhXhD1aGksBog1J76qfR8SxDSQv3oyqmiYBv20n03EJWizIGhtxX
 Nw3gFHvLXQ0wOKLdO+Q5X+r3JJqXv6hK2vQSaY9y4dMZVMrsp7uVAvky0GFXGjgI63Jg
 frWPYoY65hSQcB6rOK0aqUTRqoI9Tc9UHGg3JG29OdHdtE4WJrY3jyJ4aPC9Q5a3Boz2
 pF5u4qkQcT8bWQjkPdoEiSTDpCq+7GcRLUjFqbLs3ecYygwPcOpADXnFf5GQWtpp9C8z
 dBxrVcbKsBRznPYcPbPk+1u5AZKw0bNw1Dy5SRffQVg5JPQkoNItutx3zPXIqW/XQZ1F
 OxHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs2bJvI9HMEoOf/t9YAey0DWevlzwXX/gvTBSM277Xrm0lm9wiCrm7BLZ7abHylcJZfy6JXuITEmmyuL5qqNGSZiin8xgXJ6LLVb3wc8sC
X-Gm-Message-State: AOJu0YyGXILWo0aoLX4YT5JY27JGeA42kEpr+bvQIUV8Odj8FSvxqr41
 P9lVILNZ7n2oP6AH1Db38MWPpE523oKjhWLaBBom9CrfD8Ik2RTb07jA1GD53y5T+uHAemB2pvn
 cnP5bqP5PKMiqHLSmY5haCnC6h1Q=
X-Google-Smtp-Source: AGHT+IFUnnZlAeieYu0zFoMsxuuu/4UuL7b2X7zXorwXsTylOgzNhcytGNxmAggfeSnd7meG6r8sXMoCV6AF4xcfMoE=
X-Received: by 2002:a05:6a20:d70b:b0:1af:d6dc:86b9 with SMTP id
 adf61e73a8af0-1afde1faeb8mr29071654637.53.1716209177746; Mon, 20 May 2024
 05:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240516101006.2388767-1-victor.liu@nxp.com>
 <evnxopqt5be56vxuxqdj4l3mcd5nrrvucio7jhwgg4emraai3t@gherubdynyip>
 <e2d4e8b4-bab4-448f-8b67-21f2902fdcd2@linux.dev>
 <CAA8EJppH1rYQ5pzkGP+V-=cOPBYMWm=ZK2Ei1ttjOiN6GRDP+w@mail.gmail.com>
 <acc508e2-b067-47ef-b3e2-fcac51403fe0@linux.dev>
 <CAA8EJpowLnrnV8ezXYj=oWBFFTa6LqkPFFHc9F49un6AYgZvzw@mail.gmail.com>
In-Reply-To: <CAA8EJpowLnrnV8ezXYj=oWBFFTa6LqkPFFHc9F49un6AYgZvzw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 20 May 2024 07:46:05 -0500
Message-ID: <CAHCN7x+5L+fjkDgR_mJ2BQ1M52oBZyU0nUca1Uvhyh1pFSJChw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Exit interrupt handling when
 necessary
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, Liu Ying <victor.liu@nxp.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, biju.das.jz@bp.renesas.com, 
 u.kleine-koenig@pengutronix.de, jani.nikula@intel.com, bli@bang-olufsen.dk
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

On Mon, May 20, 2024 at 7:00=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 20 May 2024 at 14:48, Sui Jingfeng <sui.jingfeng@linux.dev> wrote=
:
> >
> > Hi,
> >
> >
> > On 5/20/24 19:13, Dmitry Baryshkov wrote:
> > > On Mon, 20 May 2024 at 14:11, Sui Jingfeng <sui.jingfeng@linux.dev> w=
rote:
> > >>
> > >> Hi,
> > >>
> > >> On 5/20/24 06:11, Dmitry Baryshkov wrote:
> > >>> On Thu, May 16, 2024 at 06:10:06PM +0800, Liu Ying wrote:
> > >>>> Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO=
 pins")
> > >>>> fails to consider the case where adv7511->i2c_main->irq is zero, i=
.e.,
> > >>>> no interrupt requested at all.
> > >>>>
> > >>>> Without interrupt, adv7511_wait_for_edid() could return -EIO somet=
imes,
> > >>>> because it polls adv7511->edid_read flag by calling adv7511_irq_pr=
ocess()
> > >>>> a few times, but adv7511_irq_process() happens to refuse to handle
> > >>>> interrupt by returning -ENODATA.  Hence, EDID retrieval fails rand=
omly.

Sorry about that.  I did some testing and didn't see any regressions,
but if it was random, it's likely I just was lucky to not see it.

> > >>>>
> > >>>> Fix the issue by checking adv7511->i2c_main->irq before exiting in=
terrupt
> > >>>> handling from adv7511_irq_process().
> > >>>>
> > >>>> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO=
 pins")
> > >>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > >>>> ---
> > >>>>    drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
> > >>>>    1 file changed, 2 insertions(+), 1 deletion(-)
> > >>>>
> > >>>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/driver=
s/gpu/drm/bridge/adv7511/adv7511_drv.c
> > >>>> index 6089b0bb9321..2074fa3c1b7b 100644
> > >>>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > >>>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > >>>> @@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 =
*adv7511, bool process_hpd)
> > >>>>               return ret;
> > >>>>
> > >>>>       /* If there is no IRQ to handle, exit indicating no IRQ data=
 */
> > >>>> -    if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> > >>>> +    if (adv7511->i2c_main->irq &&
> > >>>> +        !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> > >>>>           !(irq1 & ADV7511_INT1_DDC_ERROR))
> > >>>>               return -ENODATA;
> > >>>
> > >>> I think it might be better to handle -ENODATA in adv7511_wait_for_e=
did()
> > >>> instead. WDYT?
> > >>>
> > >>
> > >> I think this is may deserve another patch.
> > >
> > > My point is that the IRQ handler is fine to remove -ENODATA here,
> >
> > [...]
> >
> > > there is no pending IRQ that can be handled.
> >
> > But there may has other things need to do in the adv7511_irq_process()
> > function.
>
> But the function returns anyway. So, we know that the condition is broken=
.

When I originally submitted the patch, I only added the shared IRQ
flag without any IRQ condition checks, IRQ because I didn't want to
break anything. The feedback I got was to check to see if the IRQ was
intended by the device.  My focus was the adv7511_drv.c file because
that appears to be what the registered IRQ hander was, but after
looking through adv7511_cec, I see that adv7511_cec_irq_process checks
adv_cec_tx_raw_status and returns if there is nothing to do.

Would it make sense to move the if statement  did the following things:

-  Make adv7511_cec_irq_process return an int and modify it to return
0 in normal operation or return -ENODATA where there is nothing to do.
It already has the checks in place to determine if there is work to
do, so the impact here should be minimal.

- Move the check I added on whether or not there is an interrupt  to
the very end of adv7511_irq_process just before the return 0.

- Instead of blindly returning 0, modify the if statement to read the
state of the return code of adv7511_cec_irq_process and the IRQ flags
it already checks.  If ADV7511_INT0_HPD, ADV7511_INT0_EDID_READY and
ADV7511_INT1_DDC_ERROR are all not true and adv7511_cec_irq_process
returned early, return ENODATA, but if any of the interrupts was
present and adv7511_cec_irq_process did work, it would return 0.

I think that would cover the situation where adv7511_cec_irq_process
would get called, and also prevent a false return of the IRQ being
handled when this part didn't handle anything.

It would look something like:

cec_irq =3D adv7511_cec_irq_process(adv7511, irq1);

/* If there is no IRQ to handle, exit indicating no IRQ data */)
if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
   !(irq1 & ADV7511_INT1_DDC_ERROR) &&
  cec_irq =3D=3D  -ENODATA)
        return -ENODATA;
else
        return 0


OR...


Another alternative to all this is to modify the check that I added to
verify all the following flags which are currently checked in
adv7511_cec_irq_process :

ADV7511_INT1_CEC_TX_READY
ADV7511_INT1_CEC_TX_ARBIT_LOST
ADV7511_INT1_CEC_TX_RETRY_TIMEOUT
ADV7511_INT1_CEC_RX_READY1
ADV7511_INT1_CEC_RX_READY2
ADV7511_INT1_CEC_RX_READY3

It would look something like:

/* If there is no IRQ to handle, exit indicating no IRQ data */
if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
   !(irq1 & ADV7511_INT1_DDC_ERROR) &&
   !(irq1 & ADV7511_INT1_CEC_TX_READY) &&
  !(irq1 & ADV7511_INT1_CEC_TX_ARBIT_LOST) &&
  !(irq1 & ADV7511_INT1_CEC_TX_RETRY_TIMEOUT) &&
  !(irq1 & ADV7511_INT1_CEC_RX_READY1) &&
  !(irq1 & ADV7511_INT1_CEC_RX_READY2) &&
  !(irq1 & ADV7511_INT1_CEC_RX_READY3))
return -ENODATA;


Please let me know what is preferred or if there is a third possible soluti=
on.

I can write up a patch with a fixes tag later today when I get back to
my build machine.

adam
>
> >
> > > So instead of continuing
> > > the execution when we know that IRQ bits are not set,
> >
> > Even when IRQ bits are not set, it just means that there is no HPD
> > and no EDID ready-to-read signal. HDMI CEC interrupts still need
> > to process.
>
> Yes. Let's get the CEC fixed. Then maybe we won't need this commit at all=
.
>
> >
> >
> > > it's better to
> > > ignore -ENODATA in the calling code and go on with msleep().
> > >
> >
> > So, It's confusing to ignore the -ENODATA here.
>
> [BTW: you had quotation levels wrong in two places, I've fixed them]
>
> --
> With best wishes
> Dmitry
