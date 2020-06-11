Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111261F8294
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A3E6E3A8;
	Sat, 13 Jun 2020 10:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C0C6E8CF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 09:56:53 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id u5so2339188pgn.5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=ondMPxf4uc2ph0pt0HgNHkcg5ynpnvHAdpE5eze5hYk=;
 b=QG4OosPTuQ7XSPnl3uAYPgAopJcCv0BggHQxnSP19seCkrDgxFVy4hU0ua0Z3FC9Av
 2Vkn3X+kkzq1YqJzseiIDbwZLazYZyYTreNneCf7QzsK80vw2E6EXCzBUZiC9rlI7NmA
 KpFDfaDoJ2VQAbnj4HygVOT9ewMmqSHONrSvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=ondMPxf4uc2ph0pt0HgNHkcg5ynpnvHAdpE5eze5hYk=;
 b=neQxheK8P9pFTM66WjMIZH17llPjBU8+sUTOiqc9iWveO5os1/sqJJuqCdOA1O0Uf2
 9zgU7yTYgBI/wpLLlMHtiF6oICWWFe9W8qnIwYYkp8kHjwggsVI8Vter5jPR+VINbqh3
 zXf1d3E3ZwIB9584a30L0/mKYmTa20yae5n44nW0Rs92slbWIR3tfPLyN5QwmdmDL1zD
 V+4b8nTMk69TpvoIRrI4wmHTGGKM3e750cKCFFRx335Loit5hI6R5pFBiFtcWRxNLjQy
 WXUbShGtlugrp9j3sNYUOZVocHsJX/DV5xiUwwj75VDz6ib7Xg5Dge6VtaatdJDHZp+V
 nqTg==
X-Gm-Message-State: AOAM530JLuTQ/8IEf3PMOmAUbX+Hx4/7gzD32kT+iOfKvqNMPXUdutv1
 b0VOjR9W8ZG1qD/8SbJwa7Vhjw==
X-Google-Smtp-Source: ABdhPJzhSivEozbKncqU6JHQ+1w1z70+0W7uymFdngeQnJGZhEo6dmuQMhLDSnbesWa3fDCqke3Arw==
X-Received: by 2002:a65:6550:: with SMTP id a16mr6018320pgw.183.1591869413347; 
 Thu, 11 Jun 2020 02:56:53 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id c8sm2154436pjn.16.2020.06.11.02.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 02:56:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
References: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
Subject: Re: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Don't compile GPIO bits if
 not CONFIG_OF_GPIO
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, a.hajda@samsung.com,
 narmstrong@baylibre.com, sam@ravnborg.org
Date: Thu, 11 Jun 2020 02:56:51 -0700
Message-ID: <159186941181.242598.7668810499408351238@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 kernel test robot <lkp@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 spanda@codeaurora.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 bjorn.andersson@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-06-08 10:48:32)
> The kernel test robot noted that if "OF" is defined (which is needed
> to select DRM_TI_SN65DSI86 at all) but not OF_GPIO that we'd get
> compile failures because some of the members that we access in "struct
> gpio_chip" are only defined "#if defined(CONFIG_OF_GPIO)".
> 
> All the GPIO bits in the driver are all nicely separated out.  We'll
> guard them with the same "#if defined" that the header has and add a
> little stub function if OF_GPIO is not defined.
> 
> Fixes: 27ed2b3f22ed ("drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
