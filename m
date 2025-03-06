Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D67A550A3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0126A10E08D;
	Thu,  6 Mar 2025 16:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v/syNi4R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF42810E316
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:26:03 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6feb229b716so8215507b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741278363; x=1741883163; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3v8JKXAUz/cikqcFkMkfK+7rsNwqE6VvbBGzuyv1Gso=;
 b=v/syNi4Ra/HJzWMvjgu6n0CIZJ6iHMpAQk9jjsxHelTvQ7sqnKAhU91yzkOY9/B5Mi
 +8O3HIfu/WjXVYxEBEkFfTiWWODmYKHiXhErp29nb6RJVS3hGJP0NL5khULJ7O+MxKMl
 zYd2FH0LSzTuG6g4TsBXbpcHlZ+pXYuIb1FdZHyngPawexwXbXnK4MGzLrDFTV6RBSRo
 p9DoGT2MQVzc24CSK8rbz3IcNeKpRRqzH+8aGueLhwHMe/Y0L8QOKhZC9fG9YuQafjax
 XkuL30AXwaHvoZ47u5sb3qQqPdfedHIbXCc31NqrqThSUKuQsMySvaMYjNP9nnEZgY/8
 5zTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278363; x=1741883163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3v8JKXAUz/cikqcFkMkfK+7rsNwqE6VvbBGzuyv1Gso=;
 b=RvvQYp/DtV3VNpwUPcwIaO6w+h4aCA4l1QcucCUGFrxU362LD96WF7S4iIK2dFvzes
 82pNxdRstQZvYkjq4ITyDNogkisCtbzIC4O9Yp2JJXkxOpc2+yzcpRVTNQOEd+Q+cKnc
 X1kD7bhaxCPqlbAtKGuaIRfzKsmGp98OzAr/IFDwbBe2LdWNdedpiB/R4BZqPPJc0aSY
 tEPMNNufLaTrHAXJ1dW5rbM83BzU3GTv+NN91BeIyc3d86ZzvvRdRVVBVRJPT6kBSHXj
 sv0cfxWgvkXkIHV0EwtwzCP6i3Scqp3A8U/e2LkbmmUfixG86nqiEAmGxLyQHA4ufxsV
 8srw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwlPNarQKayhD5pO2dvzaq/H/bRvJ1azk/Y3/GHIWt/Y82Q4EKTpmrEH5bGk4JnpMk4bNOsUZSUTE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdW537Q1RPtXf+5FUwVJNd0CXfrANVYCJRNCYKRn4cKJlHZsI4
 DQdVT8AC/mFSDjnd9ILWYTtslEKh0akmImYIgiUnI0c5VHM2UhTqH5dqzXlc0H0UklPROEoxAgq
 MUwdxANbsrXTR9gEJ0s5MUpdVwJbCfK/wPppFlTPkov6kIbPt4w0=
X-Gm-Gg: ASbGnctEr8f7xEtQamlmd9yNHUcODsAtHjpB0oSS9Q3ZbYMc9ioE+O7rjQGY+lOG6It
 2iw8y5hc5yhALKQMPPnWsiK46/cdAn2xSGGdWH4WiGHMoFtergisZNs5K+GxpTtfYuXz1t4ggU8
 KkLcS3CXhos5pVme/P8b6+HkEvPY3cscV9fPUmLD6qHwGN7vsJYL0mjSLY
X-Google-Smtp-Source: AGHT+IGMRsrRoHu/LOV09AkxuZCKxwMIKO/0o8NEY6i19VTDJF4iNwlslzQz72J6S8S1Vrg0KcM+/xh415MqzOyi6CY=
X-Received: by 2002:a05:690c:610b:b0:6fb:1e5a:fcdd with SMTP id
 00721157ae682-6fda2fd9535mr99878457b3.17.1741278362850; Thu, 06 Mar 2025
 08:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20250304193912.5696-1-wahrenst@gmx.net>
 <20250304193912.5696-3-wahrenst@gmx.net>
 <20250306-delectable-quixotic-polecat-ecd2c3@houat>
In-Reply-To: <20250306-delectable-quixotic-polecat-ecd2c3@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Mar 2025 17:25:50 +0100
X-Gm-Features: AQ5f1Jp8n9gmsLnAfNriD3ocfnEesGqbUAsa-BIm3T7TejCg6svP9KJiKanhKY4
Message-ID: <CAA8EJprK2Dm_MuLkbF0cywPsbLKZVwvfnJpzy=56tGMrJ_ac4w@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio
 driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Turner <david.turner@raspberrypi.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 kernel-list@raspberrypi.com, linux-sound@vger.kernel.org
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

On Thu, 6 Mar 2025 at 14:39, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Tue, Mar 04, 2025 at 08:39:12PM +0100, Stefan Wahren wrote:
> > From: David Turner <david.turner@raspberrypi.com>
> >
> > Add ALSA jack detection to the vc4-hdmi audio driver so userspace knows
> > when to add/remove HDMI audio devices.
> >
> > Signed-off-by: David Turner <david.turner@raspberrypi.com>
> > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 18 ++++++++++++++++++
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> >  2 files changed, 25 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index e4b027616d04..f46a135568b2 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -51,6 +51,7 @@
> >  #include <linux/reset.h>
> >  #include <sound/dmaengine_pcm.h>
> >  #include <sound/hdmi-codec.h>
> > +#include <sound/jack.h>
> >  #include <sound/pcm_drm_eld.h>
> >  #include <sound/pcm_params.h>
> >  #include <sound/soc.h>
> > @@ -2203,6 +2204,22 @@ static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs = {
> >       .shutdown = vc4_hdmi_audio_shutdown,
> >  };
> >
> > +static int vc4_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +     struct vc4_hdmi *vc4_hdmi = snd_soc_card_get_drvdata(rtd->card);
> > +     struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
> > +     int ret;
> > +
> > +     ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
> > +                                 &vc4_hdmi->hdmi_jack);
> > +     if (ret) {
> > +             dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     return snd_soc_component_set_jack(component, &vc4_hdmi->hdmi_jack, NULL);
> > +}
> > +
> >  static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
> >  {
> >       const struct vc4_hdmi_register *mai_data =
> > @@ -2316,6 +2333,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
> >       dai_link->cpus->dai_name = dev_name(dev);
> >       dai_link->codecs->name = dev_name(&vc4_hdmi->connector.hdmi_audio.codec_pdev->dev);
> >       dai_link->platforms->name = dev_name(dev);
> > +     dai_link->init = vc4_hdmi_codec_init;
> >
> >       card->dai_link = dai_link;
> >       card->num_links = 1;
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > index e3d989ca302b..a31157c99bee 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > @@ -4,6 +4,7 @@
> >  #include <drm/drm_connector.h>
> >  #include <media/cec.h>
> >  #include <sound/dmaengine_pcm.h>
> > +#include <sound/hdmi-codec.h>
> >  #include <sound/soc.h>
> >
> >  #include "vc4_drv.h"
> > @@ -211,6 +212,12 @@ struct vc4_hdmi {
> >        * KMS hooks. Protected by @mutex.
> >        */
> >       enum hdmi_colorspace output_format;
> > +
> > +     /**
> > +      * @hdmi_jack: Represents the connection state of the HDMI plug, for
> > +      * ALSA jack detection.
> > +      */
> > +     struct snd_soc_jack hdmi_jack;
> >  };
>
> It looks fairly generic to me. Is there any reason you didn't put it in
> the HDMI audio helpers?

I had a similar question in my mind, but after checking I also could
not find a good place for it. I had an idea of pushing this kind of
code to hdmi-codec.c / hdmi_probe(), but then I understood that it
might not work.
The codec can be registered independently from the platform sound card
device, the codec doesn't have a knowledge of the platform's data or
topology. We might not be able to specify the name (even through codec
platform data) if there are more than one HDMI connector / codec in
play.
So, I think that a sound card driver is a proper place for that (so it
belongs to the vc4 driver).



-- 
With best wishes
Dmitry
