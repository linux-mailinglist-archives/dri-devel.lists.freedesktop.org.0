Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1CF601432
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 19:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77EB10EDC1;
	Mon, 17 Oct 2022 17:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C61B10EDC1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 17:03:19 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r14so16976267edc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8PEAKmr2CI0TXwvfrawXTFbhFFi06yK1UneHj5n8les=;
 b=TjheCZnif4XRsppklB13NvbRAwEhQDor3aQmCcTMiRHVDerbUlmn4+FJC7afQLbx3P
 EeE6Jmy74BawuW6jL/BGvi12phISSECmi4S1nIOLj+mgaPO+M3NANYP/g60nZBkAwMJF
 LqPW/Q4q3HSgJYHlHRFukXg1qWGFzmDcm40IpHGCoScVNcm0bb6lb2l2lAgvHOBYzH2Q
 9Jq5u4ydyrq5QHadjpPLVz+6tYLIHadO4lKlyxKov4dlG4h+EFiJtcpkN664khvoGaXJ
 qrOpsjJil3y0zHCpXXcRCGcWqqV7fI0w4UBpgab1J4mArjuxXACVJkyx/inoExS2AV2A
 w4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8PEAKmr2CI0TXwvfrawXTFbhFFi06yK1UneHj5n8les=;
 b=nANyfMZUcj+rpN5Mr7SMrSBm6q2o0Pjqz78O82E6QllPBa03aPFNM47VBcsZyuQki5
 WOCVK00GjgkY1akRkCj4tT58iGDTD5KP8XSJiZqjhebB0NHWbX2VJTPGAGTTjSO+fzdx
 qGnkJOUj7pW0EuqBUxdqeHiOrpXiAuMWN6N2oym6BqZjfz0r0P7XT1Z4WRSOs4NCbBEM
 zLeWDPOwqWk0CEiGonfJq8MucxEQH/zkJ7TQpy4EQcLgNsOn6McY4IEOl4CFBOcXPY4f
 le6WtopR7F76Su4LP2YEfya/OTaiW1WFY/Tsjk0Z8LnHbobSCQ/GTPxaFDenVm66JVhX
 bSKA==
X-Gm-Message-State: ACrzQf3fpuXRX9KOsnHI/mfR7UD3zJY6+5SmOZUD4Y9faUQ2f1Lb9IwF
 E56LlVK8i3xs3dmpsanCuALGQYBHyJ1kDIuRGZs4dw==
X-Google-Smtp-Source: AMsMyM57JhXHdQs3OS3h9I5iJZRe/WtkIvp0rlIjEeIiu8nhX+R4ZQ7cZUQYnzdJTfwOBs+/RBaGlKmC3tbq+fyyy0s=
X-Received: by 2002:a05:6402:2913:b0:45c:a7d6:c1ef with SMTP id
 ee19-20020a056402291300b0045ca7d6c1efmr11004768edb.276.1666026198097; Mon, 17
 Oct 2022 10:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
 <20221013-rpi-dpi-improvements-v1-6-8a7a96949cb0@cerno.tech>
 <Y0rqQu8Ztowj3/Gi@pendragon.ideasonboard.com>
In-Reply-To: <Y0rqQu8Ztowj3/Gi@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 17 Oct 2022 18:03:03 +0100
Message-ID: <CAPY8ntAiX6WJ86wGUgMvTxhehG8OgoS66AojvWYukADciM5X5w@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/vc4: dpi: Change the default DPI format to being
 18bpp, not 24.
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Chris Morgan <macromorgan@hotmail.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

On Sat, 15 Oct 2022 at 18:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Maxime (and Dave),
>
> Thank you for the patch.
>
> On Thu, Oct 13, 2022 at 11:56:50AM +0200, Maxime Ripard wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > DPI hasn't really been used up until now, so the default has
> > been meaningless.
> > In theory we should be able to pass the desired format for the
> > adjacent bridge chip through, but framework seems to be missing
> > for that.
>
> Doesn't the bridge infrastructure allow that ? Or maybe this commit
> message was written a while ago, before it was possible ?

Infrastructure may do, but it isn't always implemented.
Rightly or wrongly, the driver is currently finding the associated
connector, as commented as [1].

The main chain I'm looking is:
vc4_dpi -> dumb-vga-dac -> vga-connector
Unless I'm missing something, nothing in that chain defines the format
for the output. vga-connector (display-connector driver) tries to ask
the previous bridge for formats via atomic_get_output_bus_fmts and
atomic_get_input_fmts, but dumb-vga-dac (simple-bridge) doesn't
implement them.
So even if we tried following the chain it dies due to , and currently
the connector has no bus_formats defined in display_info, hence we end
up needing a default.
(Why do I get deja vu with panel-dpi and bus-format discussions?!)

Panels are fine as they do generally have a bus_format defined in display_info.

[1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/vc4/vc4_dpi.c#L139

> In any case, it would be nice to use the bus format exposed by the next
> bridge in the chain, but that can be done in a subsequent step. The new
> default seems reasonable.

I'll add having a look at atomic_get_output_bus_fmts and
atomic_get_input_fmts to my list of tasks again.

  Dave

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > As the main device to use DPI is the VGA666 or Adafruit Kippah,
> > both of which use RGB666, change the default to being RGB666 instead
> > of RGB888.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> > index ecbe4cd87036..fdae02760b6d 100644
> > --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> > @@ -150,8 +150,8 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
> >       }
> >       drm_connector_list_iter_end(&conn_iter);
> >
> > -     /* Default to 24bit if no connector or format found. */
> > -     dpi_c |= VC4_SET_FIELD(DPI_FORMAT_24BIT_888_RGB, DPI_FORMAT);
> > +     /* Default to 18bit if no connector or format found. */
> > +     dpi_c |= VC4_SET_FIELD(DPI_FORMAT_18BIT_666_RGB_1, DPI_FORMAT);
> >
> >       if (connector) {
> >               if (connector->display_info.num_bus_formats) {
> >
>
> --
> Regards,
>
> Laurent Pinchart
