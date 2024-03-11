Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D157878441
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 16:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5EA112B3A;
	Mon, 11 Mar 2024 15:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OVAISV5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5C6112B39
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 15:55:48 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dbed0710c74so2529497276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710172547; x=1710777347; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IqC9Cou3SqyEXPU8Ag0leL7h0m2p/RlcBNsi4UjO6rU=;
 b=OVAISV5v6UbPJr9ThD3agw7fNEVC/+NjWAosqXK0wLOmtbYhepPYs865mOLx6ordOH
 /GBUxy2QIt7eSQz4xIV+cBK/IqWrrU0Xus36obTH9j6cKXFLafa0FoChPgZGX1XUmvWf
 jpBTDfV5KB0n70cvTdo4wHFgapOaP92ICphqFFeHlsQw0btObpWTHZKodnZuFHYckKf6
 zIrbwlydH2Pw4bnRRjOu+49r78apu0qzEMLcm81Ec/pdAKgz2LfBzTjulWNGibvgbz7k
 A+rNUqEvneHtujEQbWUY+sUlO4TOGwjU2bSHPJwEMKQVMCu0FXoogv5PAixYQa9Ab41P
 Y5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710172547; x=1710777347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IqC9Cou3SqyEXPU8Ag0leL7h0m2p/RlcBNsi4UjO6rU=;
 b=JKtrwnFP+36yDNDekIxUHBp43USJPohC+bb1wWVpv9U+aHjlxvxfxYqN69ydygqduV
 vjDT479kGoVNYWS2ivq7J6Kq3MGwC3HjVD6ysfFz+qKIjbv1vlN7rb6/HMCG5pDZX+2P
 GhuI3jBsCV0zlk+NK5bMO+SlTG50fnKKlK7sTJZ5aL/HDupaTUc+LFdkYdHLOOhR+5jJ
 8lHJZ68BstqyA4By9iTsSIo3tjIwnR30vs+aoPjWaqMWaMCCTbkESomtkvbJ43a1E6bn
 K7HHOEq1JoRni6y5evMSPNgnjcBnMo5gsV0qN0Gx/l6+Ol4cGh9Y0WPtt4vKAIn0Y9Li
 ZScg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtu2v5aDrzscCMP5354x0sc62pSbbBWiEUaJQ5BaMuaje1eiV+3BYJeaD+HUi6iqzUTLKHQA2e3S48skdIcn5UJseetlFxlEUWo/rgy31E
X-Gm-Message-State: AOJu0YzKo0DK7pyHat2snPe6bv8NFGHPDNChLDJXiJzUS849poJIiirW
 9oAsFSZSjFg3cZa/lETq3DZByy3OQZibiofQT74pwFAKxEMhmdVSib91d+JULHXFOqOeXfN+ak9
 mGe/q1DOsbhyT3c4ttoxGzix6vM34LKBjcrD8AQ==
X-Google-Smtp-Source: AGHT+IGNX134IbCCsLQRWXyywz13RFYP9bvVZBJlu71sgGeu+KHfyUSOWNSXf/TCnAknceGuIOz3jGsPdLcOJglC0KA=
X-Received: by 2002:a25:9388:0:b0:dbf:ec4:311f with SMTP id
 a8-20020a259388000000b00dbf0ec4311fmr4334667ybm.58.1710172547331; Mon, 11 Mar
 2024 08:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
 <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org>
 <20240311-divergent-friendly-python-2c7d5d@houat>
In-Reply-To: <20240311-divergent-friendly-python-2c7d5d@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 17:55:36 +0200
Message-ID: <CAA8EJpo-+qypK4gLrQGcCYi-AVtVzuCjh4HgJ6kRNsMTtNKKMA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/5] drm/msm/hdmi: make use of the
 drm_connector_hdmi framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Mon, 11 Mar 2024 at 17:46, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Sat, Mar 09, 2024 at 12:31:32PM +0200, Dmitry Baryshkov wrote:
> > Setup the HDMI connector on the MSM HDMI outputs. Make use of
> > atomic_check hook and of the provided Infoframe infrastructure.
> >
> > Note: for now only AVI Infoframes are enabled. Audio Infoframes are
> > currenly handled separately. This will be fixed for the final version.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I had a look at the driver, and it looks like mode_set and mode_valid
> could use the connector_state tmds_char_rate instead of pixclock and
> drm_connector_hdmi_compute_mode_clock respectively instead of
> calculating it by themselves.

Ack, I'll take a look.b

>
> We can probably remove hdmi->pixclock entirely if we manage to pass the
> connector state to msm_hdmi_power_on.

I'd like to defer this for a moment, I have a pending series moving
MSM HDMI PHY drivers to generic PHY subsystem. However that patchset
reworks the way the PHY is setup, so it doesn't make sense to rework
msm_hdmi_power_on().

>
> And that's unrelated to this series, but we can also remove
> hdmi->hdmi_mode for drm_display_info.is_hdmi.

Yes, that's the plan, once I rework the audio infoframe handling.

-- 
With best wishes
Dmitry
