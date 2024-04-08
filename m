Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219D89CD40
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 23:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4F4112886;
	Mon,  8 Apr 2024 21:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TIwcCP2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1798A112984
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 21:12:40 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dd10ebcd702so5098595276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 14:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712610760; x=1713215560; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QBrxiDN+ULxbnCCnTUMH5YTkPO5nOoeHOIDnN4HClJ4=;
 b=TIwcCP2oW1DyHDx3SDzjXgedS+atNqOl6iqMhGFpPvmKGM+2d8IVbP7NcaFeqbXzLt
 3IL6vn8kkAp9dEb2aXuBjyrgLqk1SrsE0qMZVTA95Ca5sSrUvgbqJ0sm52oZsV1Ewg8S
 VOrwN4MxsQoPN9WJtDhc+1x20ANNNGk8RI1vxUm3WaViFn+lGAga0/s68vZh4eiRhKHa
 cXcQMK2RsxLWCMEDSXL1Y+O0qSz4rGZp+emn3qu8XBzPL/HG3Y2CLlfxdfDZS20AcR3T
 2YiPgCMX/5Akif2Q4bzkOVdNVDC9WM7fhf9tfSxsvwo9NcSueBxt5bpz0RYDDRybW3UC
 Osww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712610760; x=1713215560;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QBrxiDN+ULxbnCCnTUMH5YTkPO5nOoeHOIDnN4HClJ4=;
 b=ecGQf5f57dZZ2rQ7VaVFt1fgpkVRVfUEkPN/piJuovEmCaLgWkq8UywgCSAUzUF0gx
 Sdx7ud+Nl/GN5C5aSVyMdOJ/rMBXlwzeIUA4nJiij2LlOfQ136K0r+Idcp1QAfzjNMTX
 2S3tF0MRzifW04TzcqNXeBvI3DEfnQSUj5NAOztJQSXi/PfBEYZkCtmNTVp/EoNtuujH
 iaL6VG0e3jnmwu2wRz6GWTukYb6PRQg125pms/rcsi6Ocy82Ne6pCLd3KDlE3d1eSwj/
 1qybV9Pdn87kwXbTEfEKPkffHZ6LOyhxoBCU2v19eYKhm6iB3UJOsKMmgO72CD7xE0w8
 hpcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOnKVe56SubigdvB59GDXrXc640MCvUui0W7Lz6nnoQgQo7kgfWqwkSiMBp6OmsRx4Vo68ozvdgmr8ZsIrQnPoxulLs8dpXRxkaIHueTxo
X-Gm-Message-State: AOJu0Yzpt/+3q9Jps295/sgDi1Wum7DVlMIL2WmGfEIwjmiqsnu58Yvd
 oWOTeD7wZnnN4Ash+6PTKGz3JQrcvXsLsfJN73ujqJZdcDmO5C4ImCS3kNqegwBn5RUeN7eiyxt
 eC+Im/CkGrBO3/Wfu+ds5U2UtPsrSFo1agvMmpw==
X-Google-Smtp-Source: AGHT+IGUtPs2bxn4LCc/SfMEak15ny1LfMS1EZP8voj+mW2yhz5Ps8Wmq7WrbyBNgcMmoOcdV4akQje6j/9yMTON+Vw=
X-Received: by 2002:a5b:c03:0:b0:dd1:2f58:6a2e with SMTP id
 f3-20020a5b0c03000000b00dd12f586a2emr8065386ybq.9.1712610760058; Mon, 08 Apr
 2024 14:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
 <ale6wbwzkfagcg2q6glb4vsxu3pthhkk3tquv2ixlatbdryqvh@xscsq2h6emho>
 <01cb1c0d-a801-37f9-2f55-2bbd8d3a68b9@quicinc.com>
In-Reply-To: <01cb1c0d-a801-37f9-2f55-2bbd8d3a68b9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 00:12:28 +0300
Message-ID: <CAA8EJprzH0LiWNx9Udt6og3G063odY6ccvaAgsNS1r3zG8TmdA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_bjorande@quicinc.com, johan@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, 8 Apr 2024 at 22:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/7/2024 11:48 AM, Bjorn Andersson wrote:
> > On Fri, Apr 05, 2024 at 08:15:47PM -0700, Abhinav Kumar wrote:
> >> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > [..]
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index d80f89581760..bfb6dfff27e8 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1665,7 +1665,7 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> >>              return;
> >>
> >>      if (!dp_display->link_ready && status == connector_status_connected)
> >> -            dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> >> +            dp_hpd_plug_handle(dp, 0);
> >
> > If I read the code correctly, and we get an external connect event
> > inbetween a previous disconnect and the related disable call, this
> > should result in a PLUG_INT being injected into the queue still.
> >
> > Will that not cause the same problem?
> >
> > Regards,
> > Bjorn
> >
>
> Yes, your observation is correct and I had asked the same question to
> kuogee before taking over this change and posting.

Should it then have the Co-developed-by trailers?

> We will have to handle that case separately. I don't have a good
> solution yet for it without requiring further rework or we drop the
> below snippet.
>
>          if (state == ST_DISCONNECT_PENDING) {
>                  /* wait until ST_DISCONNECTED */
>                  dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
>                  mutex_unlock(&dp->event_mutex);
>                  return 0;
>          }
>
> I will need sometime to address that use-case as I need to see if we can
> handle that better and then drop the the DISCONNECT_PENDING state to
> address this fully. But it needs more testing.
>
> But, we will need this patch anyway because without this we will not be
> able to fix even the most regular and commonly seen case of basic
> connect/disconnect receiving complementary events.

Hmm, no. We need to drop the HPD state machine, not to patch it. Once
the driver has proper detect() callback, there will be no
complementary events. That is a proper way to fix the code, not these
kinds of band-aids patches.

> >>      else if (dp_display->link_ready && status == connector_status_disconnected)
> >> -            dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> >> +            dp_hpd_unplug_handle(dp, 0);
> >>   }
> >> --
> >> 2.43.2
> >>



-- 
With best wishes
Dmitry
