Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD619A7A291
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 14:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B21A10E041;
	Thu,  3 Apr 2025 12:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mOT7XP53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA24510E041
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 12:13:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so455317f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 05:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743682433; x=1744287233; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iU6vhdM1OwZrAPd+i9V1VxGRpqECj+EW6TIAG2RUe28=;
 b=mOT7XP535+VvfTXe674J9bwplvYE3cyO7fY4d3lJTdxxSd1UiNq5DC41RUvKh8XA9C
 QTS6T90Qtv7eYmWvv9JyESe5aw1B4maxXquG6L+7vi1UTRs9cnxiELRbbbYlCLOqv6O1
 nOUYBriir7aT8Dn5OqZa73g8Dktpu8FlwxOI0rTNd0hFpL0wcV8RjZ+G72HMjtRD3ebd
 3aenD+lYYitr1Q7tbu4+gA0ALqO2KQ2lyOPgpoJjPB/uim9Vagqgkhr8WzBe7Wjq2cEI
 q73VVQZre9/gACuUGKiAZF9CigwS86cAK1KUyUHxBM1sjty2YpPWa7d6HkBUxCelwd19
 XSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743682433; x=1744287233;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iU6vhdM1OwZrAPd+i9V1VxGRpqECj+EW6TIAG2RUe28=;
 b=Cx0gssibF0IvcjHhUERMXO9MLk4CBsraDoEemfLTNSR6AnkYgh76VdcwLBtGNFNhzl
 cv+vK/TwmQFRZQvW8dEy2iPcaLLrbc973e1xijsBHHsF5QDXhAWd9z8vODWIrvJNY3Wy
 oRiXIm5+er/vaIsdjobVSU0ZtIG7O36MzoUNrhX/kiSwoFe8S9mHJN8Iu8iL+cWYFTIO
 JN9zKhizRN1tjyH3RARzN7R+WbpyXcXou6t+dbKsClAzelEZaqjDtw2PB6E6KW1SQoh9
 vNFZ9KEBSUdzqxHaTziJ+GYyJ4lKKZjw1zgbupZYGwAkOrA2TAU1t3l/HdSdaWOb/zoj
 Kepg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkhhgPCWIw8wuW5mhPH7DtfyXxqMh1F7ZxKz+M8+hTCrtLhqMZYW5SMweNOfeue0qHn7Cvk0eQpSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkuO56js5nxhhK/Ah+fwfb6PkIF7cFd53bQ+bU4vZotox8PHsp
 NqC1UGLwVeMnyuSMx0eV2GNJeV+Lrjd4BRtJOWP/Le2w654Rra/uZ17/cV59D7s=
X-Gm-Gg: ASbGncuqC0ZamyDOkXKIfX5Sq5VBR9wNT/bP9fBpdcD9/ChPLLOsU3+fkuMz8fQ6p00
 WkH5P7mNQ/IDtMJ712Tj888bojQIfUyxWRZuWYir8WmHIFrgJUc9mYT+CvEoRArzPFhLZTy5ohj
 pCi0aEN000yU8TQ8wa3USj8soaJF4uplhV2xdSO5v6N8ovWOGKYMpcJoQ0M3vKq38cl8GCtF97d
 ScVFijQmnj1o5FKuKVMAdMjWPYre6VXhQSu/HmBD84f9pP9Tudgjai/yEEGEeFEVjYs72D4G0Uc
 0ZTVkAVtJESwgNyn7VuAPc8q8fM6BSfWLfaiOtLMyKWG+rlqYA==
X-Google-Smtp-Source: AGHT+IGLHzdFOx5S+wASF4XaTudHsSa7tKhdihI+harwoyguW1Z/pMadFg3DBe4cRW/G7uF6fS9A7w==
X-Received: by 2002:a5d:64c3:0:b0:390:e8d4:6517 with SMTP id
 ffacd0b85a97d-39c120dd02bmr16086596f8f.21.1743682433218; 
 Thu, 03 Apr 2025 05:13:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c30096cc1sm1641886f8f.5.2025.04.03.05.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 05:13:52 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:13:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/vc4: release firmware on error paths in vc4_hvs_bind()
Message-ID: <87fea3e7-7abf-4849-a616-26d1df715408@stanley.mountain>
References: <8305d098-bd28-45e6-acda-29e629dfccc9@stanley.mountain>
 <CAPY8ntCtAdWg1yN+DgxRe3np4Nu3aDUrrdqe4Q9WeqJMtbrrAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntCtAdWg1yN+DgxRe3np4Nu3aDUrrdqe4Q9WeqJMtbrrAg@mail.gmail.com>
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

On Wed, Apr 02, 2025 at 11:34:58AM +0000, Dave Stevenson wrote:
> Hi Dan
> 
> On Wed, 2 Apr 2025 at 12:00, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Call rpi_firmware_put() on these two error paths before returning.
> 
> Ack that there is an issue here, but it seems easier to me to move the block
> 
>         max_rate = rpi_firmware_clk_get_max_rate(firmware,
>                              RPI_FIRMWARE_CORE_CLK_ID);
>         rpi_firmware_put(firmware);
>         if (max_rate >= 550000000)
>             hvs->vc5_hdmi_enable_hdmi_20 = true;
> 
>         if (max_rate >= 600000000)
>             hvs->vc5_hdmi_enable_4096by2160 = true;
> 
>         hvs->max_core_rate = max_rate;
> 
> to before we make the devm_clk_get calls. It has no dependencies on
> having retrieved the clocks, and hopefully means we don't get the same
> type of leaks creeping back in in future.
> 

Yeah.  That's a good cleanup.  I will resend.

regards,
dan carpenter

> Thanks
>   Dave
> 
> > Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hvs.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> > index 4811d794001f..41e9d0aff757 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> > @@ -1678,6 +1678,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
> >                 hvs->core_clk = devm_clk_get(&pdev->dev,
> >                                              (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
> >                 if (IS_ERR(hvs->core_clk)) {
> > +                       rpi_firmware_put(firmware);
> >                         dev_err(&pdev->dev, "Couldn't get core clock\n");
> >                         return PTR_ERR(hvs->core_clk);
> >                 }
> > @@ -1685,6 +1686,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
> >                 hvs->disp_clk = devm_clk_get(&pdev->dev,
> >                                              (vc4->gen >= VC4_GEN_6_C) ? "disp" : NULL);
> >                 if (IS_ERR(hvs->disp_clk)) {
> > +                       rpi_firmware_put(firmware);
> >                         dev_err(&pdev->dev, "Couldn't get disp clock\n");
> >                         return PTR_ERR(hvs->disp_clk);
> >                 }
> > --
> > 2.47.2
> >
