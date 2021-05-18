Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B5C3879C1
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3BB6EB6E;
	Tue, 18 May 2021 13:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A566EB6E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 13:21:09 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id 69so5068505plc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 06:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eij78DTYm6LdNyJPrTT7rIc4tl9S27pR1VqAL0ye5eg=;
 b=i3pMD4EzmEx0IQ02hRhTPfWzHAZxoHQCiYfbjxNP823FZ/30gTRWPWGpibKir53wDG
 5Y8bC28z0VPmH9l0Btv2arydjw0pIGMo6+1IJ1Jiu9VG0xn4MHgOefKpmwc1OnJxP/A7
 nC950+rJqjW66it6AZo2SWrI8rlHWNQF9ujtGqENUM3Kg9WUrBr1eYHb1b2JU3tuXgd0
 PtcEWdMj6op4rGBFmIBnCwwmk6WqEPdCaXz+UVjy+mZvqlMTClxYQO2stfqHIVMNlCgl
 qvBYy6QqFo3qj0+0xb/NcyU6YM8XUgzAucXH2GP4hbq56Cm+Zj2/HeHnk/V4WWYJTFjc
 w2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eij78DTYm6LdNyJPrTT7rIc4tl9S27pR1VqAL0ye5eg=;
 b=BcSqFPt8Lq7Ujszqp71JOickEoCcLA7szd74lj1LSm6VYoybIryan3J3kcmbOpqfQc
 2337N9UfREa7oPuG48LR1Nd1rcqulElBuQryVttFeOgCgWal28DvnztVe81VD+zWPxGO
 /g0jMNMpbNV8TGrOzPuYbE16zzZlEBCuF9GS/UHMXHgDdZCIu6thgM2k3C65jBUbL6k3
 iMAt1suST4dereSkDaHiM4OCS/+xPXJXGZc0pQbMJrRaYGg7ceq4MGyHjh6zFEIObiw4
 hgFNLzO8e4QFyUXuohUrSTXBt5SPkM5lSYYQuKzpiHlP24EBx9kT0Lx96fSQqliTryyj
 r03Q==
X-Gm-Message-State: AOAM532QeKSWrrhDnwIOFkJlMf7j6H7nG8EOUowTPrbD7h28Fy8zWgPL
 ieEL3D8DQ/0vjaN8d5b4x1m+yYWVGCOGzuFF0xm6zg==
X-Google-Smtp-Source: ABdhPJyEB0vA70S0lI3WHu3HCNasA37Y5tjILdnUF6+2WrHYIGLEwPF3u5iNV46DS4+EpEvgiHCl+6xIZzDLKE+vwLQ=
X-Received: by 2002:a17:90a:7e8f:: with SMTP id
 j15mr5529715pjl.19.1621344068626; 
 Tue, 18 May 2021 06:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <YKOGogHasIyvF8nj@mwanda>
In-Reply-To: <YKOGogHasIyvF8nj@mwanda>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 18 May 2021 15:20:57 +0200
Message-ID: <CAG3jFytpOb8KeNCjCJ7gq20LQK3UGA9PgGne+cR2kZdADS-Oxg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix a ternary type promotion bug
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dan,

Thanks for submitting this.

On Tue, 18 May 2021 at 11:20, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The ti_sn_aux_transfer() function returns ssize_t (signed long).  It's
> supposed to return negative error codes or the number of bytes
> transferred.  The "ret" variable is int and the "len" variable is
> unsigned int.
>
> The problem is that with a ternary like this, the negative int is first
> type promoted to unsigned int to match "len" at this point it is a high
> positive value.  Then when it is type promoted to ssize_t (s64) it
> remains a high positive value instead of sign extending and becoming a
> negative again.
>
> Fix this by removing the ternary.
>
> Fixes: b137406d9679 ("drm/bridge: ti-sn65dsi86: If refclk, DP AUX can happen w/out pre-enable")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index bb0a0e1c6341..45a2969afb2b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1042,7 +1042,9 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>         pm_runtime_mark_last_busy(pdata->dev);
>         pm_runtime_put_autosuspend(pdata->dev);
>
> -       return ret ? ret : len;
> +       if (ret)
> +               return ret;
> +       return len;
>  }
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applying to drm-misc-fixes.
