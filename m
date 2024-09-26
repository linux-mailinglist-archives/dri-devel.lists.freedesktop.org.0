Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688C8987365
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 14:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1E010E044;
	Thu, 26 Sep 2024 12:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tEHm3DaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769D410E044
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 12:17:24 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6e22cb0b19aso8379057b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 05:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727353043; x=1727957843; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oPezUo7IHtau4M8aP14bhxHN2HJlm7hObFAj6Hq/cNU=;
 b=tEHm3DaYJwppmJfbRVkYjAvKjlmCiCaAgqT60iRLd0fyBadzrT0HhbMVV9C8vtUtho
 QLELq6SM+g/az92Osv3Tv3JKo2FmfH8eh+a82ifnNDWEbizrLA6PmFb+gbGe7lPIqJLw
 DlJfnP0FJET1oQTvyRP2I7N6kwdC16U7y8IXQRINqTqYGepRVU2ps7SWmbrAq2SLb7LR
 dqG2WesMZKoBNtOLZVsSvKY0SoxYq7ZvsY3hXUebdIDPVXAMsxV3fRnPYEvwJ2KCl0BI
 2M3AJ/4ZP0Ph6dFP3GPwuNoiJfgH/0ok48MypYscgfm32ozkh49nEcEx5X2LjEB6eq7C
 /R2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727353043; x=1727957843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oPezUo7IHtau4M8aP14bhxHN2HJlm7hObFAj6Hq/cNU=;
 b=QXCTuVj5OAXNEe5sWhIuhtdUx+w5UkRE85HjJCi/bEWI6C4mBScUeF7bylDHhn+vii
 gPZ4TAGKP9QjY06nX1uX/+E7YF8DzyTHo7H93yOC4eHCtbqbjBRh0UXxsUM8O9yL9Iya
 P81opKezSd+qfr89nUd3rumdxsk2ndT0eIxI2zix9A6UZK9c3Fj6DZ32YG/f5DR3HSwd
 l4Fse1zXbDYmZj16dF9wCoI/cVHmG57rh65DX2eu8jhFa7Th2kOwbRBUMxmTHEQIvZri
 9S/TyxmsE+IQgJrp1E7niIoitDJ4uJ6wwPh+7f/CmxTbQ5VHZPHwA/++8RJ6KzG+mZzP
 lKAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH1XOdH7EfcJFbLCnjmm/7UWbue2d/IQL/0kUiJq2RLr8QJohYBmmcgtxt7OsFoN4ogS7b9w/tIvg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLH6Ef3nOwBNfwhlld0a5vEehtCbl0qvw2TVNCXzyfqHWdAwa6
 YAnGNa5LDBJjRjDlw1mNuUBT/311851nIbQp0Sr3Sqep+bjISbmswIyJuU99Rk2JNMMDy/PAcAw
 dKZKQQTDd5UbLNv5dTCse4oX2fJx5iJGrszdLYA==
X-Google-Smtp-Source: AGHT+IERFZTphSck/X7sBSRVdUIASeIlELvO6WJqk5lXaPQza+9zNfYdoiFEcn/lLJ7tRwG/6daz91b90kSXoMscyIk=
X-Received: by 2002:a05:690c:ecf:b0:6e2:1626:fc4a with SMTP id
 00721157ae682-6e21d6c605fmr51978797b3.9.1727353043318; Thu, 26 Sep 2024
 05:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240926074755.22176-1-Hermes.Wu@ite.com.tw>
 <20240926074755.22176-4-Hermes.Wu@ite.com.tw>
 <acpumgqlyjyt5ql2imnhrv32apdjzluahnx77xpqu2lzltko4q@j6fhqrb7sxai>
 <2b3d3295278c47b8a79c9ff9b10cc7de@ite.com.tw>
In-Reply-To: <2b3d3295278c47b8a79c9ff9b10cc7de@ite.com.tw>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Sep 2024 14:17:13 +0200
Message-ID: <CAA8EJppErpCagvTQ4TTnBvUbAFci=BvMEmoeOxT1YmPdOPwu-w@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] drm/bridge: it6505: add aux operation for HDCP
 ksv list read
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

On Thu, 26 Sept 2024 at 11:46, <Hermes.Wu@ite.com.tw> wrote:
>
> >On Thu, Sep 26, 2024 at 03:47:53PM GMT, Hermes Wu wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >>
> >> Add aux operaction command which supports read DPCD KSV FIFO with aux
> >> fifo.
> >
> >Nit: AUX, FIFO. Please be consistent in your commit messages.
> >
> >>
> >>
> >> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> >
> >Why is this considered to be a fix? From the commit message it sounds like a new feature.
>
> It will be a necessary change for HDCP reads KSV FIFO.

First of all, it should be a part of the commit message, because the
patch itself doesn't fix an issue.
Judging by the amount and the intrusivity of the patches, I'd say that
all KSV / HDCP-related patches constitute a new development, rather
than a bugfix.

>
>
> >
> >LGTM otherwise
> >
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 12 ++++++++----
> >>  1 file changed, 8 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c
> >> b/drivers/gpu/drm/bridge/ite-it6505.c
> >> index b451d3c2ac1d..0583abdca75f 100644
> >> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> >> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> >> @@ -324,6 +324,9 @@ enum aux_cmd_type {
> >>      CMD_AUX_NATIVE_READ = 0x0,
> >>      CMD_AUX_NATIVE_WRITE = 0x5,
> >>      CMD_AUX_I2C_EDID_READ = 0xB,
> >> +
> >> +    /* KSV list read using AUX native read with FIFO */
> >> +    CMD_AUX_GET_KSV_LIST = 0x10,
> >>  };
> >>
> >>  enum aux_cmd_reply {
> >> @@ -965,7 +968,8 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
> >>      it6505_set_bits(it6505, REG_AUX_CTRL, AUX_USER_MODE, AUX_USER_MODE);
> >>
> >>  aux_op_start:
> >> -    if (cmd == CMD_AUX_I2C_EDID_READ) {
> >> +    /* HW AUX FIFO supports only EDID and DCPD KSV FIFO aread */
> >> +    if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
> >>              /* AUX EDID FIFO has max length of AUX_FIFO_MAX_SIZE bytes. */
> >>              size = min_t(size_t, size, AUX_FIFO_MAX_SIZE);
> >>              /* Enable AUX FIFO read back and clear FIFO */ @@ -1030,7 +1034,7
> >> @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
> >>              goto aux_op_start;
> >>      }
> >>
> >> -    if (cmd == CMD_AUX_I2C_EDID_READ) {
> >> +    if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
> >>              for (i = 0; i < size; i++) {
> >>                      ret = it6505_read(it6505, REG_AUX_DATA_FIFO);
> >>                      if (ret < 0)
> >> @@ -1055,7 +1059,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
> >>      ret = i;
> >>
> >>  aux_op_err:
> >> -    if (cmd == CMD_AUX_I2C_EDID_READ) {
> >> +    if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
> >>              /* clear AUX FIFO */
> >>              it6505_set_bits(it6505, REG_AUX_CTRL,
> >>                              AUX_EN_FIFO_READ | CLR_EDID_FIFO, @@ -1079,7 +1083,7 @@ static
> >> ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
> >>
> >>      mutex_lock(&it6505->aux_lock);
> >>      for (i = 0; i < size; ) {
> >> -            if (cmd == CMD_AUX_I2C_EDID_READ)
> >> +            if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST)
> >>                      request_size = min_t(int, (int)size - i, AUX_FIFO_MAX_SIZE);
> >>              else
> >>                      request_size = min_t(int, (int)size - i, 4);
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
