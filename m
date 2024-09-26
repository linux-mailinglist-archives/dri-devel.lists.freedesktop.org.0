Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F0F986E7D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6399010E18E;
	Thu, 26 Sep 2024 08:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fw345gBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0A810E18E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:05:35 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e1d2cf4cbf1so686705276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727337934; x=1727942734; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I9FWBets92WpJ5WZa/nOYlxesuTzHoeH8VJdqXlSdzM=;
 b=fw345gBfYtZT3l1jDtR8af1+9Vki0Omdxbu57CVgp2nHrfU4X76FwllNjfvU9BAEpf
 vtMNKWKqlfz+3F91c2o5AqsDaG2TGkZl+1qvy7MLWWZAwfmc552jwWZmlVrKD1iJlEMc
 UJfbJdCFLMF4odgzZNWPpeWuQWVYUMnenlgyMZP58dCfxSdKWXIBJiGfgctRfMJLaFqz
 wROge56gX839gwYFhbWLvs8k9BktQ18A1bFx04HNjiy0/Goht1Z4PgZISy3Y1JCoJR0G
 1yOtiLP4n2iiDW+TzwYhvPXhXPHYhCUJ4jBW44O7DPF8RioM5hmUA174vAigvQsHta86
 6mDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727337934; x=1727942734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I9FWBets92WpJ5WZa/nOYlxesuTzHoeH8VJdqXlSdzM=;
 b=ObRN+LSh+pw8AyeUUh2xSsue3q9tnKwlDyKwjE+E9R7kMoK6rhR3u6bbeOOKszf6zN
 o+tD72T4lUyF070e4PLEfSPY9k/nK/CkCPuLfMrJ1AGuURVNxhvINSyiKxsu3SKlOb9o
 IoBMZNWqKNNo0NstYh/lPh4oLTw4CRXBWfS796ZjpGwN/vKQEP/eYlGGMu4CNi6nI3P1
 wcvqxnUgiM7nGmv8SukxuVqTVdz8KL8ucxhShrLgIb3+SmAQeS5cF2req7QRL06oL/8T
 YJh6f4Yzuh2S5X4TzSVktLyJX109qpl28sjbsqwNC+iLIcq40JE659j3MATU1mL8jvv7
 B3Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7kPyqy6eNnYD7AouLhS5wzo/XVSdITeRZPzcCX5+KK/3FUO0A6s8bC9gFus5GSoZ2SWaEHW99w4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw52KQ+b+G2DpbQZO9Gi/MjtDycDHquKxAMRjQGYDFDRq+oe+D9
 gcfhWiqfMe1TdW3gbFnkmuIxQ5yuawVIpjbQkr1HwYWyBsSh0FH6k6LxADgARvHE5s+0+BpREw0
 rm89KBXZDionTu0yFwsJKE1LVN7xkFVKqG7tkeA==
X-Google-Smtp-Source: AGHT+IHN4aYzJJswa7TWE9GtZ8Qu5DXUmugZlTBtYvnKazEr7hRghRUxCKw7SCIId7wsA7FconFu6Ksp74+l6P9OlYY=
X-Received: by 2002:a05:690c:368e:b0:6dd:cb3e:7069 with SMTP id
 00721157ae682-6e21d863400mr48504937b3.24.1727337934254; Thu, 26 Sep 2024
 01:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240926074755.22176-1-Hermes.Wu@ite.com.tw>
 <20240926074755.22176-3-Hermes.Wu@ite.com.tw>
 <ngr25a4x3s6hd3ztmj7h5y6zp3fxw3ojm4ax5wpk45iqdfkvwe@piznnnlyudmv>
 <3150e8e9ca754411bb0404475d149a8f@ite.com.tw>
In-Reply-To: <3150e8e9ca754411bb0404475d149a8f@ite.com.tw>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Sep 2024 10:05:22 +0200
Message-ID: <CAA8EJppG01kE-USS6XYp5gRwEq-hNAUY0cBLfEcHZQgP8CRTsg@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] drm/bridge: it6505: fix aux operation for edid
 read
To: Hermes.Wu@ite.com.tw
Cc: Kenneth.Hung@ite.com.tw, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, angelogioacchino.delregno@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, 26 Sept 2024 at 10:04, <Hermes.Wu@ite.com.tw> wrote:
>
> >On Thu, Sep 26, 2024 at 03:47:52PM GMT, Hermes Wu wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >>
> >> The EDID read operation can reach the maximum size of the AUX FIFO buffer.
> >
> >And? Commit message should describe why the change is necessary and what is being done. Just providing a statement is not enough.
> >
>
> The original AUX operation treat all reads by using data registers will be limited at 4 bytes.
> AUX operation command CMD_AUX_I2C_EDID_READ using AUX FIFO is capable of reads data by 16 bytes each time.
> It can improve speed of read EDID.

improves, rather than "can improve". Please add this to the commit message.

>
>
> >>
> >> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c
> >> b/drivers/gpu/drm/bridge/ite-it6505.c
> >> index 28a8043229d3..b451d3c2ac1d 100644
> >> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> >> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> >> @@ -1078,8 +1078,11 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
> >>      int i, ret_size, ret = 0, request_size;
> >>
> >>      mutex_lock(&it6505->aux_lock);
> >> -    for (i = 0; i < size; i += 4) {
> >> -            request_size = min((int)size - i, 4);
> >> +    for (i = 0; i < size; ) {
> >> +            if (cmd == CMD_AUX_I2C_EDID_READ)
> >> +                    request_size = min_t(int, (int)size - i, AUX_FIFO_MAX_SIZE);
> >> +            else
> >> +                    request_size = min_t(int, (int)size - i, 4);
> >>              ret_size = it6505_aux_operation(it6505, cmd, address + i,
> >>                                              buffer + i, request_size,
> >>                                              reply);
> >> @@ -1088,6 +1091,7 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
> >>                      goto aux_op_err;
> >>              }
> >>
> >> +            i += request_size;
> >>              ret += ret_size;
> >>      }
> >>
> >> --
> >> 2.34.1
> >>
> >
> >--
> >With best wishes
> >Dmitry
> >
>
> BR,
> Hermes
>


-- 
With best wishes
Dmitry
