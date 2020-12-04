Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CDC2CF0D2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 16:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA556E17F;
	Fri,  4 Dec 2020 15:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5E16E17F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 15:36:28 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k10so5857672wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0v566WzwVM5IixZEI6M5GdbCg0P5kKkDNz+vnQsiMHc=;
 b=C+Tvsth0hE7h8bxuxdV29xKYFR5ez6kPMqHicRyVXIRw4nqz3q1/pmwpNKjgZ4sP2+
 tbUnNpcXusLp2AAIAeWGJGGqnWZKQiBug9QLuZji1RgeW5vL8vlnHTsUqtyXdH/CfY0+
 goyKQvsADHt2Rnxkg30M4zoMnlkUPGdQ1qr/CUQjEOvojbALWN7YjBXm6+UtAa8RchDt
 8vo2Kfar5+7a+NwSE1ftp90KsC1N7pp3tdUt1Ar0NsP4PcoDL7o9x99Zwd4qschPRUW7
 4kt0HAnNXq2b4kWMxe1FwsyqnZYFJCM06eVZrir037jgQYk/wC3mvGQvcaIf2HdY+oN6
 yhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0v566WzwVM5IixZEI6M5GdbCg0P5kKkDNz+vnQsiMHc=;
 b=L0bQWkOYCZ3Theo+QREEo2h7IAIW/S/6skx2w0QsuOVlT0HFpwz65cdKBkl5oXCYlv
 elwmmuiOeC48sjN6LdIExOA8+LaI1Tuor4G2OR/dzW+rfTc7rEMSPp89Hxf2jRVXRG23
 VUtuQOhqmwcdJbfnPJFrUjrgHYPydr011I/A2Qzn2pov8pfRrB6HBlPW+M7JBKUKh/Dp
 fgNTWnvaGp4ztCnggD4R9gDm/v/ntHDoXV5FkJctI5Z2lVmaWzbZnFJ2ajXrjhOHnZuw
 uFOUd50P24QtjOdb4ep4SWVatzzdOevMU46nphILhc6rQ0V3nU2+FIMrNh2Mj9HoAvXq
 kSrQ==
X-Gm-Message-State: AOAM532hmJ2DfOF0OiXjuRzQ8HEA8RZgGMNDEedFeG4wpbog83BZ9sLT
 itSuOsDXtfWkVHORbckA2n5snGlwOdHA3x84gpyN1Q==
X-Google-Smtp-Source: ABdhPJyfoO7NououpVsC9vMpf0YzY0uMz1QWtkxNdyjTPpV5zF1Cbpy0i6SQAuI4ZXBn37+iygqqNa5/+004xpRcp94=
X-Received: by 2002:a1c:810c:: with SMTP id c12mr4951170wmd.96.1607096187567; 
 Fri, 04 Dec 2020 07:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20201203074624.721559-1-maxime@cerno.tech>
In-Reply-To: <20201203074624.721559-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 4 Dec 2020 15:36:11 +0000
Message-ID: <CAPY8ntAo+nDY=aJy+5TCiJ_xUWZhkDtXtXxu6_9Mj5hvgmHfaQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vc4: hdmi: Don't poll for the infoframes status on
 setup
To: Maxime Ripard <maxime@cerno.tech>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 3 Dec 2020 at 07:46, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The infoframes are sent at a regular interval as a data island packet,
> so we don't need to wait for them to be sent when we're setting them up.
>
> However, we do need to poll when we're enabling since the we can't
> update the packet RAM until it has been sent.
>
> Let's add a boolean flag to tell whether we want to poll or not to
> support both cases.
>
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

That looks like it should do what was intended - thanks.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>
> Changes from v1:
>   - Inverted when to poll
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index a2c5b5e9786a..d3c4a9b5bb6d 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -265,7 +265,8 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
>  }
>
>  static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
> -                               enum hdmi_infoframe_type type)
> +                               enum hdmi_infoframe_type type,
> +                               bool poll)
>  {
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>         u32 packet_id = type - 0x80;
> @@ -273,6 +274,9 @@ static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
>         HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
>                    HDMI_READ(HDMI_RAM_PACKET_CONFIG) & ~BIT(packet_id));
>
> +       if (!poll)
> +               return 0;
> +
>         return wait_for(!(HDMI_READ(HDMI_RAM_PACKET_STATUS) &
>                           BIT(packet_id)), 100);
>  }
> @@ -299,7 +303,7 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
>         if (len < 0)
>                 return;
>
> -       ret = vc4_hdmi_stop_packet(encoder, frame->any.type);
> +       ret = vc4_hdmi_stop_packet(encoder, frame->any.type, true);
>         if (ret) {
>                 DRM_ERROR("Failed to wait for infoframe to go idle: %d\n", ret);
>                 return;
> @@ -1056,7 +1060,7 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
>         int ret;
>
>         vc4_hdmi->audio.streaming = false;
> -       ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO);
> +       ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO, false);
>         if (ret)
>                 dev_err(dev, "Failed to stop audio infoframe: %d\n", ret);
>
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
