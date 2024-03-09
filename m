Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79248771B7
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 15:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16CE11211D;
	Sat,  9 Mar 2024 14:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dHxYVhVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893CB11211D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 14:54:01 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-6e4de6fb7f9so1476952a34.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 06:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709996040; x=1710600840; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eA04sqjyv1s/Dz3T5kRYEcPdCWodFVKdwAB148+mkYo=;
 b=dHxYVhVzW3j6AbxDEzKpf/cCIrDLfSewa9AFtDJ7CbsbgOgWcdKQkZO0nHLMqdappu
 DD2cbSSMY0IoEbN7TknUyNhwpbXV8N6PH6rDn4U9cf+9M/yCqHzFYJyJ5OyeyXyqBiZ/
 fESAqvoCe/jA6b8DOZSFKOeYr5Xm1zDJNshvlKIHi1PzmBTYc7gcq+ZFEQqWRlSpfgo9
 gvjc/a59WgKhCF86aVTR7v6Mg4fw6L9IjwB7I8+teE4fU83wSpKlRXlHPx79m3vYEjIk
 0ij7fdY/Wr8PpMy7yuKD0FrPju69vrlAUKPmD5oXsRhUmQKTwttj4d7AsXCkKGK4srev
 Oegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709996040; x=1710600840;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eA04sqjyv1s/Dz3T5kRYEcPdCWodFVKdwAB148+mkYo=;
 b=oJ8C9MTnVYhlJ6We6Of8EXkY7tBrjd/en12P2pxAbkT60Q2vD7niCkzkOvd/Z/yNgc
 2PblOWqP4pJ99QuPEltT2+nsfr86Ync77wyWztqkSlb/hibeoz+OXX+CwT9iWuMDkql2
 rafmmVbt8MwAO/aXpfsJpDY1NxQAS1JD0ZU5wi7R0JsJfayKz6zYFZSdNx0+ZchlMTfY
 4E7WX3MGrgMoKZsc2ZE30SBiuwVhtgZ2LcinafzsGEfcDKj89wXFsCVWRWdUneF48cno
 wQCO7uuAlZELWVwZI4EeBuZgKArE7Bj1ay+PGRCdhZXFtfUqP7mnQZGtmz6Elkd6cCNs
 90Hw==
X-Gm-Message-State: AOJu0Yzpk0JUq01hDizXYBXUufxeeZ/qT4drDtWulvVcF+wKm3jZ43FW
 D1uXWBt/8P5eQLaHwhNvS4T51hKWOt0qQXQf3NWSa9hRm+1naCVp39y5V/vVAC7bHiZi7j6A56W
 mI9JpztSOY/vuaWhY3UlgLesJ6Mv9db4ilzcTgg==
X-Google-Smtp-Source: AGHT+IGh+XRVvBrKiaVYq3PacuzxQQy/9lP1FD2uNT0gS6x67HG5T1oQcujWS6KkWYVspsQstMOvbHfqwxCdAZfKq98=
X-Received: by 2002:a05:6808:4483:b0:3c2:1596:d5e7 with SMTP id
 eq3-20020a056808448300b003c21596d5e7mr3213978oib.46.1709996040196; Sat, 09
 Mar 2024 06:54:00 -0800 (PST)
MIME-Version: 1.0
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
 <20240309-bridge-hdmi-connector-v2-3-1380bea3ee70@linaro.org>
In-Reply-To: <20240309-bridge-hdmi-connector-v2-3-1380bea3ee70@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Mar 2024 16:53:48 +0200
Message-ID: <CAA8EJpoBO--ZrOjJqWwmcKV+tEvyJ-H9jGxkhK0rAZ3Tw2gVMQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/5] drm/bridge-connector: implement glue code for
 HDMI connector
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
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

On Sat, 9 Mar 2024 at 12:31, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> In order to let bridge chains implement HDMI connector infrastructure,
> add necessary glue code to the drm_bridge_connector. In case there is a
> bridge that sets DRM_BRIDGE_OP_HDMI, drm_bridge_connector will register
> itself as a HDMI connector and provide proxy drm_connector_hdmi_funcs
> implementation.
>
> Note, to simplify implementation, there can be only one bridge in a
> chain that sets DRM_BRIDGE_OP_HDMI. Setting more than one is considered
> an error. This limitation can be lifted later, if the need arises.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 118 ++++++++++++++++++++++++++++++++-
>  include/drm/drm_bridge.h               |  82 +++++++++++++++++++++++
>  2 files changed, 197 insertions(+), 3 deletions(-)
>
>

[skipped]

> @@ -705,6 +753,16 @@ enum drm_bridge_ops {
>          * this flag shall implement the &drm_bridge_funcs->get_modes callback.
>          */
>         DRM_BRIDGE_OP_MODES = BIT(3),
> +       /**
> +        * @DRM_BRIDGE_OP_HDMI: The bridge provides HDMI connector operations,
> +        * including infoframes support. Bridges that set this flag must
> +        * implement the &drm_bridge_funcs->write_infoframe callback.
> +        *
> +        * Note: currently there can be at most one bridge in a chain that sets
> +        * this bit. This is to simplify corresponding glue code in connector
> +        * drivers.
> +        */
> +       DRM_BRIDGE_OP_HDMI = BIT(4),

Note for myself: before v3, handle this bit in drm_debugfs.c / bridges_show.

>  };


-- 
With best wishes
Dmitry
