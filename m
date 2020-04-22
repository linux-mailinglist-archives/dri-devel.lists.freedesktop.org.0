Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6A41B55CF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39F56E356;
	Thu, 23 Apr 2020 07:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FBE6E3C1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 10:24:13 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 145so819925pfw.13
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 03:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=xkeWLnteJjG54BboMmCRycKnKz+ymn9qqeCn2SIVyPQ=;
 b=SU01xAPQmFHWruDWFN1SqvstGsdj+QtEI2l+t4wN7c4jgMkL/L/wsL03ySzyuQIxdq
 T0Ioo5gzkx8Vod0lKiA65OS5kWldrL8Q6G5FI9UlLcTmBDqbVhu478J6FU4I8FNL9FGY
 /9DU9UBHZRgdxvLgcfDf2MTd1FBckvpItjbac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=xkeWLnteJjG54BboMmCRycKnKz+ymn9qqeCn2SIVyPQ=;
 b=qxoCgLG2obpnN/fGiO0u1ehRJEAz9FR4D8GHfawZC62mZD3xeB7AhIdsX0pxu7Odrs
 O7Jr0RAIQ3d2cL9Jp0nWCD6C/tH1l1TjagOqg0eZfGDHiwdrIoXiCB1wtkyd8COGF4Lq
 Cx2/sXYQwzg6Ku2aVWyTui31wirDBmB2qUvm0AW4SqB2gYA8dUBoPVExQNrpEAmMiyU0
 309FceDoqvFLs1GUoXlcdakFyP+7lS3KDUnHEeREfXw4tn0DI5tCvhcKsBJOD6sepEsn
 NKDLHfuTGsCWhzuOJs5QS0eO+pqsVtB3Zu+ePs47KnxiHUf2gZ+eAHLFgSYzqfNzWtH2
 P6jA==
X-Gm-Message-State: AGi0PubhTud2mLWoFj2mXsKZqIjugeshc7Cxa1fcuIXfPyzlyiSBaXQF
 jdXnV2dBlanTjBrcq4GBWGeN4w==
X-Google-Smtp-Source: APiQypLBY8yUOpSkusa0a8k0gnufQC44Y4aGlSsuT2v9ocxchD8HZri/OWeKDQvYCLZNlWUEX5ugEA==
X-Received: by 2002:a62:ed10:: with SMTP id u16mr26724966pfh.16.1587551052739; 
 Wed, 22 Apr 2020 03:24:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id a2sm5066746pja.44.2020.04.22.03.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 03:24:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200420220458.v2.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
References: <20200421050622.8113-1-dianders@chromium.org>
 <20200420220458.v2.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
Subject: Re: [PATCH v2 2/6] dt-bindings: display: Add hpd-gpios to
 panel-common bindings
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Laurent.pinchart@ideasonboard.com,
 a.hajda@samsung.com, airlied@linux.ie, bgolaszewski@baylibre.com,
 daniel@ffwll.ch, linus.walleij@linaro.org, narmstrong@baylibre.com,
 robh+dt@kernel.org, spanda@codeaurora.org
Date: Wed, 22 Apr 2020 03:24:11 -0700
Message-ID: <158755105124.159702.6095634958147138337@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-04-20 22:06:18)
> In the cases where there is no connector in a system there's no great
> place to put "hpd-gpios".  As per discussion [1] the best place to put
> it is in the panel.  Add this to the device tree bindings.
> 
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
