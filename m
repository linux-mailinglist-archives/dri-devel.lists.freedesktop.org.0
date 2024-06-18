Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A000C90C620
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 12:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE2610E61E;
	Tue, 18 Jun 2024 10:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MEeCS2sK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D56710E61D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 10:15:57 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dfe43dca3bfso5825486276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 03:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718705756; x=1719310556; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XhPNLiHLoa3orzHyeJcCWczzW2ldawXh2vT5fW5oe5g=;
 b=MEeCS2sKQ7jT32C21f+YBj0Wn/LniftfPTBdv9vgDY/fcVnInYEQJeSvWCu+MGOHSI
 Ne0aGxMMJYrEasJodjPP+4SDo3/6fMoVHmiISfa8Z7AonapwL6VMzi0euvgYWFWYrHfP
 CZ5ufhN0oLiwe3qf3x7DJJvR6J3Aa+XF0+fAiC3gGJcPF1NlS/5BdUR5IF+URiphOUeT
 LY0xbx8ntC/9ZwpT9Ir7I3QOx0ld3UCh/sfpxgwjtMAxQFWjNvoFpF2hz6fHdXdV7oFB
 +6nNyxkOb1khHBBOdNYQ0dHIIjmKLjDdLMete/IXh3jStoKGFTBYZQ8sd/SQ1MTObW8R
 ijHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718705756; x=1719310556;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XhPNLiHLoa3orzHyeJcCWczzW2ldawXh2vT5fW5oe5g=;
 b=jyW0vPfNav4PM7xSw9PRyH5mW9Tqb/QW+JOSJzAYWcANYXs2DLfo4zPKwVoQpWFCGJ
 F/6gBRO2CR0p3PzyjAl9+cWy15WsdqpqeP9itOsldafH1HiaxP3kxF7ffyqgU0cfHOul
 uZpGHQAwIBf3pxkuwH1kxzoTUsbo7H6KykgXEq69SJkYBtsfODUq9O29Rk7N+KoTbm+v
 eAHW5g6cUppM+UDnRmePRrYBViBsetnHnb+1d/X5j5LLqMExzMzMvIujzMtibqxQ4FAR
 K3HIBUHRc+Z3oMA2NxpW459SJ7Ps5PrGme/Tt2JRXnS8OtKmNx4Z9GRpF531MoVzn42C
 CoEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvlYiyKZdlGBobHBkQpG4wM/gs5LCcFAXJNHIvuxi+Tf7cGEd7uWYhiO8xeok24YL74VTTQEaf2tfatL9BNCiTnPOoF0gAgbTJow9/tac9
X-Gm-Message-State: AOJu0YzGgAB3t73AFguHdldZqIbVAslzUDG4PwvYfDfNlIBumqWrr5fW
 dhZYWd4QW1qldM+tXxwmTDvUvYXeHaTa83XeOi0WmPrPbraEaPhl/Suxb7VAMvnP/ouRqBR1TSi
 oP0qpSeAtSZyBGSp7ldbcEHOXCvqu+hJBhwrGdw==
X-Google-Smtp-Source: AGHT+IEsv7IfYeMsArzBejH8niE9nZt3hfwkV12Dx+vdDglKTjgIuNRzw5dNj2kD/OX+usllX3TQnPLf/mPK46iUQlw=
X-Received: by 2002:a05:6902:11cc:b0:dff:310b:9b40 with SMTP id
 3f1490d57ef6-dff310b9ea5mr8048320276.45.1718705756426; Tue, 18 Jun 2024
 03:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240618081418.250953-1-j-choudhary@ti.com>
 <20240618081418.250953-2-j-choudhary@ti.com>
 <r5szraxdqfs4v4hnvqgx6tbmc5e5ew5ljyf5xlaobywm55bohy@6kygxenn2tvd>
 <e236648c-e257-42a3-a0a3-a1b88b539459@ti.com>
In-Reply-To: <e236648c-e257-42a3-a0a3-a1b88b539459@ti.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 18 Jun 2024 13:15:45 +0300
Message-ID: <CAA8EJprX0ePM1Xvmo9DahSFAnADRPBuwVo95A423xeffgpr49w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: ti-sn65dsi86: Add atomic_check hook
 for the bridge
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, mripard@kernel.org, 
 linux-kernel@vger.kernel.org, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 daniel@ffwll.ch, spanda@codeaurora.org, a-bhatia1@ti.com, 
 dri-devel@lists.freedesktop.org
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

On Tue, 18 Jun 2024 at 12:56, Jayesh Choudhary <j-choudhary@ti.com> wrote:
>
> Hello Dmitry,
>
> Thanks for the review.
>
> On 18/06/24 14:29, Dmitry Baryshkov wrote:
> > On Tue, Jun 18, 2024 at 01:44:17PM GMT, Jayesh Choudhary wrote:
> >> Add the atomic_check hook to ensure that the parameters are within the
> >> valid range.
> >> As of now, dsi clock freqency is being calculated in bridge_enable but
> >> this needs to be checked in atomic_check which is called before
> >> bridge_enable so move this calculation to atomic_check and write the
> >> register value in bridge_enable as it is.
> >>
> >> For now, add mode clock check for the max resolution supported by the
> >> bridge as mentioned in the SN65DSI86 datasheet[0] and dsi clock range
> >> check for SN_DSIA_CLK_FREQ_REG.
> >> According to the datasheet[0], the minimum value for that reg is 0x08
> >> and the maximum value is 0x96. So add check for that.
> >>
> >> [0]: <https://www.ti.com/lit/gpn/sn65dsi86>
> >>
> >> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> >> ---
> >>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 65 +++++++++++++++++++--------
> >>   1 file changed, 46 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >> index 84698a0b27a8..d13b42d7c512 100644
> >> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >> @@ -113,6 +113,20 @@
> >>
>
> [...]
>
> >>
> >> +static int ti_sn_bridge_atomic_check(struct drm_bridge *bridge,
> >> +                                 struct drm_bridge_state *bridge_state,
> >> +                                 struct drm_crtc_state *crtc_state,
> >> +                                 struct drm_connector_state *conn_state)
> >> +{
> >> +    struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >> +    struct drm_display_mode *mode = &crtc_state->mode;
> >> +    unsigned int bit_rate_mhz, clk_freq_mhz;
> >> +
> >> +    /* Pixel clock check */
> >> +    if (mode->clock > SN65DSI86_MAX_PIXEL_CLOCK_KHZ)
> >> +            return -EINVAL;
> >> +
> >> +    bit_rate_mhz = (mode->clock / 1000) *
> >> +                    mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> >> +    clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
> >> +
> >> +    /* for each increment in dsi_clk_range, frequency increases by 5MHz */
> >> +    pdata->dsi_clk_range = (MIN_DSI_CLK_FREQ_MHZ / 5) +
> >> +            (((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
> >
> > atomic_check might be called several times, it might be called to test
> > the state. As such, it should not modify anything outside of the
> > state variables.
> >
>
> If not in atomic_check, then where should I move this calculation and check?
> mode_valid with returning MODE_BAD in case of failure?

I didn't write that it's the wrong place for math. I wrote that you
should not be modifying global structure.

So you have to subclass drm_bridge_state for the driver and store the
value there. Or just add a helper function and call it from
atomic_check(), mode_valid() and set_dsi_rate(). It really looks like
a simpler solution here.

Note, there is a significant difference between mode_valid() and
atomic_check(). The former function is used for filtering the modes,
while the latter one is used for actually checking that the parameters
passed from the client are correct.

>
> I had to move it from bridge_enable based on the comments on v1:
> https://patchwork.kernel.org/project/dri-devel/patch/20240408073623.186489-1-j-choudhary@ti.com/#25801801
>
> Warm Regards,
> Jayesh
>
> [...]



-- 
With best wishes
Dmitry
