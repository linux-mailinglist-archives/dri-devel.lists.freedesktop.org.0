Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E0C8C974B
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 00:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A36C10E2BA;
	Sun, 19 May 2024 22:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jcXlyU9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617F610E2BA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 22:28:01 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51f0f6b613dso4753784e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 15:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716157679; x=1716762479; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HXDdcRRTfODpXRQ/anh1Jb88k/SxpaOdAv6cFEMztOs=;
 b=jcXlyU9+HjgTL7vAsS1u0Eez8jjJgCmATB1H8A1xoLFr5lujTI7UrbfhScXoZeyVHH
 u0I9rJrOoPWAJyo0OipwTWIYOF/iKyJUCpZn8z8/MkESW76+fqsG7jdaovk8mNH+9q0y
 i3d79sypkkC0yMJj+KL7D1kPFrWinBA5h0nvYdOtVlZgiw2M2BqjY1es8OtnBBxNTV5C
 rFJNxg9v7L8mtBwonUHNi4QHXBlIMpJbN8Y+tC64fDinrgcdnaAJHyPsmhBt2x3z4GeE
 qRYSGTKMfEimz+rrd+5bELv8TFwTnxudkPUZI0oDHmKIOIu15BjbbUj4YHKjeP5JfSlL
 xJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716157679; x=1716762479;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HXDdcRRTfODpXRQ/anh1Jb88k/SxpaOdAv6cFEMztOs=;
 b=vPUO4ueCQ5z2eD0I9knyil+by9X57UCW1qEBWx0Pnj1hDqy2zY8/aO2wXS+Q/wwAJO
 okz3/iAJZQzVJBH2NaO1IY/4MiI50P1UZXDdXaM1ofbglcZHdx5fYD9R+YuCk7C3SWnN
 NbVRrJYDnfqeuD+TWAA5RlK7omEvCSX/Ecjp5XbR8fIMhYBCt3lYinMcWPsB+Xe6JrQA
 DT3FZS4K5Wu7Flf/VK1wH8Aj/iY6LgoMjE12nxIL8IEV3EgDEY5nAy7g0EMHao/DuUDU
 2gV+ZFOje9bkxSJFfQtjAhWCA8+aowlpw1UEE7A0ufbwarLwrE7YWX09CoIjbs2kNULx
 og+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYSIqxsQDAx4ldj15C3NxbFrynm8q73/EDBnOe9GCtEr8dihlizbZ0IR85erPVgjjqrrJxijJIBuT+g1b1NZVmIcVxW08OvFo8bmwSVNOB
X-Gm-Message-State: AOJu0YyX7790FNdvIl/r1O6qWZsXl+EQK4W7Q2SV95P5GMf6xdIMcPza
 x7cN1yBtWJ6NeVLkcoxioDe4BrR4ZtjarsD7qABATHX6igIXKD7+FZnjNKfT0sM=
X-Google-Smtp-Source: AGHT+IEntu5zdsMbV+cV0OiaWajiTtFHQuKXfMaceEgIpZ35ws2Sx+nESoMa4dAIjfwGFUbrTAkKyw==
X-Received: by 2002:a05:6512:2204:b0:51a:c2ec:72f9 with SMTP id
 2adb3069b0e04-5221016e7b2mr20491321e87.49.1716157679456; 
 Sun, 19 May 2024 15:27:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-523b261ad51sm1465981e87.224.2024.05.19.15.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 15:27:59 -0700 (PDT)
Date: Mon, 20 May 2024 01:27:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/panel: himax-hx83102: Check for errors on the
 NOP in prepare()
Message-ID: <pdq7u4cuptuhnugbn2tqxddg663ngqy5udmngpshh5sqvtavnn@sd3wnjxruflz>
References: <20240517213712.3135166-1-dianders@chromium.org>
 <20240517143643.7.I3fae28745bf2cacd8dac04d7a06daea50e233f46@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517143643.7.I3fae28745bf2cacd8dac04d7a06daea50e233f46@changeid>
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

On Fri, May 17, 2024 at 02:36:42PM -0700, Douglas Anderson wrote:
> The mipi_dsi_dcs_nop() function returns an error but we weren't
> checking it in hx83102_prepare(). Add a check. This is highly unlikely
> to matter in practice. If the NOP failed then likely later MIPI
> commands would fail too.
> 
> Found by code inspection.
> 
> Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as separate driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
