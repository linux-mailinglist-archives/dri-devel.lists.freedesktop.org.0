Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A7F2D7151
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749A96ECAB;
	Fri, 11 Dec 2020 08:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735596EB54
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 21:00:26 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id 81so7076938ioc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=26Vm4s06JnMVOl9zkroZalqQJYVX3pZvEC5YiT4DGro=;
 b=bePoVgoZkT130rTZGLCOVgoYm8XZaqW8Woj+N4R6vowh7e/+3K7mvFceJ7tUDc23I3
 79awfxjusxoStgE5o129NbFBY8mcaIqCfapdan1OnCr+DJ0vhkZraIb68YUkrDAGD9hv
 9rgShmTq9kQb7z6ds9lLLt88SYadgYWjKrr8ZfgAIJIBfaRwSJ1ZzZdQEakgUQR1+Cm4
 JRDf8p8e1joY1358W7XspiYV5GATWZScWxgDyGz4FpBovsSDZqTnJnGIitu+gb8pDbwH
 VMZ2dh00eXlf0+/7Bz1nt4/Fhxa/jt6pEGNXo1TRWWxUNoArgXMZ0J68Jgw3vF4GroRs
 tw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26Vm4s06JnMVOl9zkroZalqQJYVX3pZvEC5YiT4DGro=;
 b=Mj8btQHfUbGq5dLQ/t5GuY8wP6ANAtMNbzxl4+ulk/AXdM4bN6bZBwa/Qw5u3sEHs7
 Xk5H5Gda1R3aD2waux19gd55OAzEuheVQrKNTEhutDzNAqF7u5OeJ4On0wCzVjxrPBJY
 INOutWz06Xn0dXNO/lMUPMpMnslJbgAKZN2ppcE7rGetUto8RB7RcaiTR3gCI12BzIQn
 npcq+LieUlpvQWAteNYlxWkAiGC6KA5HCe21Dk07oAmEVPim7GfnHOvXlixI+MjCluPR
 8VwAUNcL0tOvTLQkhR7p4v45ACzzUQ7xCThJgYVXMX2sGBzqFBwmYeZDNPbpgefJagli
 Ui2Q==
X-Gm-Message-State: AOAM531tOAFP6jd6m6k7rZyebXm4AjTUBQjtsee/nxL0Bm1sUiaTz4SN
 CwqwxS8kqwN25Y3O0O+jr7VH9r5KUbi7iFApMjcmZw==
X-Google-Smtp-Source: ABdhPJxVTTC6jf6Rca6pGj/4VGpBcmnmfKJQSRWgYGp5zzAjBBSxgIgZtYJdOgIiHV6IOPYUdwwP97+bX6EwXIfd6J4=
X-Received: by 2002:a05:6638:ecd:: with SMTP id
 q13mr9100887jas.62.1607634024741; 
 Thu, 10 Dec 2020 13:00:24 -0800 (PST)
MIME-Version: 1.0
References: <20201123104616.1412688-1-robert.foss@linaro.org>
In-Reply-To: <20201123104616.1412688-1-robert.foss@linaro.org>
From: Peter Collingbourne <pcc@google.com>
Date: Thu, 10 Dec 2020 13:00:13 -0800
Message-ID: <CAMn1gO6AQvyJO0s2k1POAVn4JxuOKLoKpj_UvvW3TnLTtv6_bw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: lt9611: Fix handling of 4k panels
To: Robert Foss <robert.foss@linaro.org>
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:08 +0000
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
Cc: Alistair Delva <adelva@google.com>, jernej.skrabec@siol.net,
 Vinod Koul <vinod.koul@linaro.org>, jonas@kwiboo.se, airlied@linux.ie,
 Neil Armstrong <narmstrong@baylibre.com>,
 Anibal Limon <anibal.limon@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks. Confirmed that this fixes display output for me on a 4K monitor.

On Mon, Nov 23, 2020 at 2:46 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> 4k requires two dsi pipes, so don't report MODE_OK when only a
> single pipe is configured. But rather report MODE_PANEL to
> signal that requirements of the panel are not being met.
>
> Reported-by: Peter Collingbourne <pcc@google.com>
> Suggested-by: Peter Collingbourne <pcc@google.com>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Tested-by: John Stultz <john.stultz@linaro.org>

Tested-by: Peter Collingbourne <pcc@google.com>

> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index d734d9402c35..e8eb8deb444b 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -867,8 +867,14 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>                                                      const struct drm_display_mode *mode)
>  {
>         struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
> +       struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>
> -       return lt9611_mode ? MODE_OK : MODE_BAD;
> +       if (!lt9611_mode)
> +               return MODE_BAD;
> +       else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
> +               return MODE_PANEL;
> +       else
> +               return MODE_OK;
>  }
>
>  static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
> --
> 2.27.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
