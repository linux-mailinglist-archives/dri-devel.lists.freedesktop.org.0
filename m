Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3378CFD50
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6525310EBE3;
	Mon, 27 May 2024 09:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Lvc+f8+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB83110EBE3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:43:22 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2e95afec7e6so23836961fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716803000; x=1717407800; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0N7iqS/jW6psWnJVJQjJRax8oZv8fa2R262LhPDLB+4=;
 b=Lvc+f8+5OFOs7ADPYNI57n8Qy0t6LSyIIhwHSlWnwDdT5neBAY4GWcLtxuGSu0HF/I
 vbkOFMOZFmL+YfgJ9wjIcKz0Cu110QFbAGL5yE1QRcw/E6FvXd0Yct7mDuK3bhX2dy0r
 DXBp7xLLp7edl6hRXj+yULkOneK8ZM1yjPU5pa8mrTJEHOuDf0W8GXgOCmaIOm41A904
 NEWLPIKtIr2oE8Rv7VQGk6JgOeXNT0dTTDZRfa4n1jKcgNlXYBWYs2+o0WcUdKXHVuGj
 tmhNNjm/2Ut3Z1Sea1QMZiildrCnMqMAic/7PAchJQroRGozYKdSnGnGloD40AXTrkk1
 rJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716803000; x=1717407800;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0N7iqS/jW6psWnJVJQjJRax8oZv8fa2R262LhPDLB+4=;
 b=BVzJo1qQwDgbGEvSpVLm/inmbhmIXxAT92/x9oVHHXqe4A+kW1tykNHI5BHplufkA3
 xFmICdTaiMO5voxftd739iPfTIAqbVPYtC0fPH+x1uIUPvvwj78GDlO//fcrGnmCapyF
 9vX3THo+JrSg6dQPp7uvS/5yQw4yAmp2hv1IMmS0V87tIMNp3QO/vjfYpI5lmyWMZBsd
 dTweQpuZiNJzSIMeGpPwu9IPFk7AW2A4JoDEdQMhu7axGISCS17HotbCu5mlaTBHu8LX
 IwghWe7KeBaS/eUSnmc0MozaSiftI6xSbnRRpeXO/n4GTXsj1ud2l2Zz8zS5whvd9KJ0
 UC6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXSm9N7XlaVAFpfUk9eGIy7AXfBKtrWAvrKMGdY+zsvSzUheGvBO+Xmd26J+JjsRhJVqAdzEVlqaF6XxejPvbyUvRPnc79aH97/ms00tS8
X-Gm-Message-State: AOJu0YwKiJfJeNAHD7EinDuwOJ5rKWMKzsHc4DX0xnRdl0JnqTFBnYG/
 HMP3475EM1+kUMu3f1LaHkiggK7obd6f4eyFkyYaGYXRiNoqoI40j3kwfqYM2lM=
X-Google-Smtp-Source: AGHT+IEiQ8C9Lceia0g8JujCBp7raFBHsn1Pi+Zhb5Y4D5nikSTHmLnkevBZXNf8N4rIWwJyGf6zsw==
X-Received: by 2002:a05:6512:3145:b0:520:ed4e:2206 with SMTP id
 2adb3069b0e04-527ef9d9483mr3265363e87.17.1716803000505; 
 Mon, 27 May 2024 02:43:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529a7fb982esm230632e87.265.2024.05.27.02.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 02:43:20 -0700 (PDT)
Date: Mon, 27 May 2024 12:43:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v14 17/28] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <a65wtf2hy7ufimkcgo5k2c34ygvtv7erwh567ngsnuaha7qiny@nl6lx67qsjuw>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-17-51950db4fedb@kernel.org>
 <4n55dbl2h275z5ubebigri4xjtjsvt44w62n656srdgndcav2j@rrq5haucqx5u>
 <20240527-adamant-just-spaniel-ebed4e@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527-adamant-just-spaniel-ebed4e@houat>
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

On Mon, May 27, 2024 at 11:02:13AM +0200, Maxime Ripard wrote:
> Hi,
> 
> Thanks again for that thorough review :)
> 
> On Thu, May 23, 2024 at 01:22:56PM GMT, Dmitry Baryshkov wrote:
> > On Tue, May 21, 2024 at 12:13:50PM +0200, Maxime Ripard wrote:
> > > The i915 driver has a property to force the RGB range of an HDMI output.
> > > The vc4 driver then implemented the same property with the same
> > > semantics. KWin has support for it, and a PR for mutter is also there to
> > > support it.
> > > 
> > > Both drivers implementing the same property with the same semantics,
> > > plus the userspace having support for it, is proof enough that it's
> > > pretty much a de-facto standard now and we can provide helpers for it.
> > > 
> > > Let's plumb it into the newly created HDMI connector.
> > > 
> > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  Documentation/gpu/kms-properties.csv            |  1 -
> > >  drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 +-
> > >  drivers/gpu/drm/drm_atomic.c                    |  2 +
> > >  drivers/gpu/drm/drm_atomic_uapi.c               |  4 ++
> > >  drivers/gpu/drm/drm_connector.c                 | 88 +++++++++++++++++++++++++
> > >  include/drm/drm_connector.h                     | 36 ++++++++++
> > >  6 files changed, 133 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
> > > index 0f9590834829..caef14c532d4 100644
> > > --- a/Documentation/gpu/kms-properties.csv
> > > +++ b/Documentation/gpu/kms-properties.csv
> > > @@ -15,11 +15,10 @@ Owner Module/Drivers,Group,Property Name,Type,Property Values,Object attached,De
> > >  ,,“saturation”,RANGE,"Min=0, Max=100",Connector,TBD
> > >  ,,“hue”,RANGE,"Min=0, Max=100",Connector,TBD
> > >  ,Virtual GPU,“suggested X”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an X offset for a connector
> > >  ,,“suggested Y”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an Y offset for a connector
> > >  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Connector,TDB
> > > -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limited 16:235"" }",Connector,"When this property is set to Limited 16:235 and CTM is set, the hardware will be programmed with the result of the multiplication of CTM by the limited range matrix to ensure the pixels normally in the range 0..1.0 are remapped to the range 16/255..235/255."
> > 
> > Should it still be defined as a generic property?
> 
> I'm not sure what you mean here, sorry. It's being documented as a
> connector property now, so it's very much still listed as a generic
> property?

I didn't perform my duty well enough and I didn't check the file for
other instances of the property. Now I indeed see a generic "Broadcast
RGB" property, but to me it looks like having a different set of values:

,,"""Broadcast RGB""",ENUM,"{ “off”, “auto”, “on” }",Connector,TBD

-- 
With best wishes
Dmitry
