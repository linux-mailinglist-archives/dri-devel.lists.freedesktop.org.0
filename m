Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765DB8C9747
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 00:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26079892A1;
	Sun, 19 May 2024 22:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jZLw2pQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6DD10E2BA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 22:27:33 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-51f72a29f13so3030438e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 15:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716157652; x=1716762452; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lnECSMTEYDy4nTJ8XR7yUOLISX1UUcDq0pG+XpyQGjk=;
 b=jZLw2pQKs1gSjEXQZ3P7j/B+tM5PsGT4JP7PhDNej8pkcjaVk5CIittIW6l++Bk91a
 uHsXfZ5V4lqtghGkIFcDBSrPF2cdH51FCQgGby4os69Iuj/lxSDDZ+G/WgvsnbUNZrdN
 E77ULdr2AvCb0LQBQqOneVTFm+yVZOo8hxkDPekfBu6o01/eJRi/Bd1wXYuHMoEIg7w2
 R0tEp+f5vqFgLGQcQndrXOXSyCfLPcvvE5dx/aa9L1JtZql9kuwT5VsniDoU0ldf9xLJ
 ASICrWmAOwWsz4Js96KA0bjLLoSxqHc5JtiDzYkcKpFbsPZf78m4SAR1WU4CIGBA8h5g
 /zAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716157652; x=1716762452;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lnECSMTEYDy4nTJ8XR7yUOLISX1UUcDq0pG+XpyQGjk=;
 b=oFQhtNMzZvkUs3JLZdpT93aqQLB/eT6PzfKGw5uNUO0tS93+EgX3me7ytJ96+/fi4H
 OKy30ynNpSLU8woqvH31PvKh0TxMp5hIprVxcKUkqUZ5HMDTGh17h/+H68oa9KobRKHJ
 1gS+JUNK8Qwyye8z1Mmyt9hr+29wNjbBKL3zZwqgW/gGmE+FYAa7PCFHWw9hA0JxAzDr
 EwrGnYAcX9MQjBWMl1QYYnK9zjBUvy1PMe+b9qtt0bj+kun5iFdLrB6xPw2DWSRQ40/D
 KgeSK6jI/PAHm4F7JKp/5LRv0wVAONDd/dhW0wBE8Oqro/8ZyO69NK8+rZtpf/2KA2jj
 SmAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJBJJxi2VBSsf9a2XUczJmhOooqJLtL/IJO5QOLmvygHTasOwNLKIo8Skv1XyzGB/DhVB7dWhRNZ21+oh/UEfz6U7zyCoxVoNehBybOI6R
X-Gm-Message-State: AOJu0Yx42CVEVE8+c0OnkvFs5UxlNzHLiGfdEyY3Vf6OJjwQos/GTixA
 KaRQPSynu05RGW2p5IZQKtiV031M5Lw3MfmO4mUQghSl9+lRZjFI9R2I5ton6hk=
X-Google-Smtp-Source: AGHT+IFmJLVVml45EX56fiuVIfMfFL3aYxh/CATwE+BPez8baOgA97I7iabAgns9wfYAn1MCF3l4Kg==
X-Received: by 2002:ac2:4d06:0:b0:51d:1239:21e8 with SMTP id
 2adb3069b0e04-5221017e0a8mr17480872e87.37.1716157651912; 
 Sun, 19 May 2024 15:27:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d3a78sm4056943e87.177.2024.05.19.15.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 15:27:31 -0700 (PDT)
Date: Mon, 20 May 2024 01:27:30 +0300
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
Subject: Re: [PATCH 5/8] drm/panel: ilitek-ili9882t: Check for errors on the
 NOP in prepare()
Message-ID: <exnkjttsewv4i2feh52h2q57ynxei2ny5cv2oxoqzjojvrlxoo@p2grdrhxmqzu>
References: <20240517213712.3135166-1-dianders@chromium.org>
 <20240517143643.5.I323476ba9fa8cc7a5adee4c1ec95202785cc5686@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517143643.5.I323476ba9fa8cc7a5adee4c1ec95202785cc5686@changeid>
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

On Fri, May 17, 2024 at 02:36:40PM -0700, Douglas Anderson wrote:
> The mipi_dsi_dcs_nop() function returns an error but we weren't
> checking it in ili9882t_prepare(). Add a check. This is highly
> unlikely to matter in practice. If the NOP failed then likely later
> MIPI commands would fail too.
> 
> Found by code inspection.
> 
> Fixes: e2450d32e5fb ("drm/panel: ili9882t: Break out as separate driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
