Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FCD30F6BC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 16:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECA46EE04;
	Thu,  4 Feb 2021 15:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B106E9CC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 12:28:41 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id u11so1659590plg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 04:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rwJuigtXZN4H8LH97KvEX01KgdYdPsaGxRjAB9+CZ0M=;
 b=M4lnzGnLIjoB1QblxKZYrcWYHjCnlO9Z7EYFDR4Tf2CFAfzm5GCBN2XnvmtVjgbHiD
 MseYcE57KxwQaLzEBywDZGyUAmV/BeSnxb8FKJVzqemnzpkva4RKGHfKzmdUSi0bilja
 DsGLJh6BkSwNUoyjP8CJUuOJMlhZ4RybBLHGA+RGNWi+DhGAfftGgU+4Xj2VSGHiZ0px
 ChRLpy3M1abwbjEbbbQYDVu7ah31n/YzW2uGaFwpoa6LmZ0HIPrD+NpB58ym+PVGUNkG
 dBsxFFiHl4JMhCgqFzeQ4PZvhUz3+BsPg03vf7+OBK7Aodyt/8pqpkbqEXUsQWTMc5Ay
 t8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rwJuigtXZN4H8LH97KvEX01KgdYdPsaGxRjAB9+CZ0M=;
 b=WHJk9//gxGPerTwWIsGCADieuM/xqUMGsCDj+/GQZ1oOS38N9RWdd/eizplOlbDSOW
 tvHiMSh0iadPrvfDAgDIxtz1cRBHBiTWasf1UCY5bMu1hbl4ZwugdRIU2LziMyC3z1X9
 J6epk6g8PaqvYMVaT1MSxKMLo+YsbVr9QX0Haper4E39Amy1RQhgCubrrDcnnAj1x/9V
 ZA0+CqIbvpTJD7Yl8sQ10UFgveM5oAlZlkk7gQmW4b/9US5OlLbM61T3Nfs9AKz7BWuf
 uYNWTVjiFrb6qmX8kM0vYJQKPxAISuK2yh6sde3cL4V+eLtG/0YflBPJVi9zR4nK73zw
 cfXQ==
X-Gm-Message-State: AOAM530R4gzYyJ37noED5568+6w6RUgY4cemV6sNj3po4hhZgu7KPmfX
 u+x1qnfOQB6rDp976IdVW86Z1k3sDdgnTvViqkbGCA==
X-Google-Smtp-Source: ABdhPJyfBP7u1ZXbobDvu7HK4oR+5/fraMGa2jIKVYVtLc/FPEFhdNdXoTwpgFhddT6Hj6tnFHkEKhbtjNOtDsg/HF0=
X-Received: by 2002:a17:90a:4ecb:: with SMTP id
 v11mr8453346pjl.75.1612441720976; 
 Thu, 04 Feb 2021 04:28:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611802321.git.xji@analogixsemi.com>
 <23b62a447364a9047f0b1b144557e8d95f6ad7f7.1611802321.git.xji@analogixsemi.com>
In-Reply-To: <23b62a447364a9047f0b1b144557e8d95f6ad7f7.1611802321.git.xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 4 Feb 2021 13:28:30 +0100
Message-ID: <CAG3jFyuAixFQ0L_2zw_8Ze3cF11PFMm-sN6ZQR7=opEjWV1nNw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm/bridge: anx7625: fix not correct return value
To: Xin Ji <xji@analogixsemi.com>
X-Mailman-Approved-At: Thu, 04 Feb 2021 15:50:48 +0000
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin,

On Thu, 28 Jan 2021 at 04:12, Xin Ji <xji@analogixsemi.com> wrote:
>
> At some time, the original code may return non zero value, force return 0
> if operation finished

Missing "." at end of line.

Other than that, this patch looks fine. Feel free to add my r-b.
Reviewed-by: Robert Foss <robert.foss@linaro.org>

>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 65cc059..04536cc 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -189,10 +189,10 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
>                                AP_AUX_CTRL_STATUS);
>         if (val < 0 || (val & 0x0F)) {
>                 DRM_DEV_ERROR(dev, "aux status %02x\n", val);
> -               val = -EIO;
> +               return -EIO;
>         }
>
> -       return val;
> +       return 0;
>  }
>
>  static int anx7625_video_mute_control(struct anx7625_data *ctx,
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
