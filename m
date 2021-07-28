Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21FE3D9242
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 17:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CAF6E255;
	Wed, 28 Jul 2021 15:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B906E255
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 15:41:38 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id t2so1654502vsa.11
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1QoJwY8noglSuUCCXb09kPbOF1oWuAKrTzQuDfXNLUU=;
 b=qnrdSr5cr2oFDAIi9MKUDeBCcH69lMT1IIErkbIcMKZHQkt3foUG2gA3PAfnXza/IR
 4ZBRV50IECTC2jxXZh4d2xT7OrVUprsQsVa4GGi+CUd9MF6J1Gs0fzPDS2roaD2KoP8b
 lhWOk04KLbA8/0Oe33oMe4n6/q5xe5bKD2hI9GItDhRKCD7g7afFfZyJJlY0lujKUt+w
 sgkRz66cjc9SeExAW43t0Gh2AyyvaCEE7QYS9n2MeyGIrIMkWdVA8Qwmn4PiBz5nsi+g
 /pMlnrRqQNTNT5VGl+dnx3luuXurvGUHHNrn6vi0CqyLlWYRUTYe0jFWHbfpY4l1jeVn
 0huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1QoJwY8noglSuUCCXb09kPbOF1oWuAKrTzQuDfXNLUU=;
 b=pMyl/iFcEfBraXAeT5Vku13UlbAg+gAUkkbpTmStiNHGb+ZfA5IFqBq3zS0mrV8ClU
 r/Yvp8U0dgJMpfOsB93VAtzwGQ1hsuJz7FLE1G6FRV3a4p4ZMAwrXm0ChpzToiv+QgSr
 zlIXDfxH72KRAHM+tc4DObK941b24LrLF+J8k1/+tAEW8PBXLscUBkEcQAM+9/0mS0gw
 ADGG3qb82tpzj+f+1PGKhbE6XAw1XPvqsNgxV70NdiB8LY1vk+uUKO4ahdtz1nnTRGvG
 Qr1nDWjgGAsjY6xUnXPZenixtf7Pha7rKlkRpY7D13p1iYavryC8sDCvlQyHkkwV4TAq
 P30g==
X-Gm-Message-State: AOAM53052p94QUEp6b2QdyqPbN2iDMVOLRtF+se+DTPKdA9YYpHb4DVa
 It/joTgfEZ/xIuN9M6yK4V5VgxrTVw+znslIUHM=
X-Google-Smtp-Source: ABdhPJxBT1vlrAD/nksa89YIVoxqfVf8n09UebLhNHRp7O7niEHO4G/Fay9CO+2He8YW4MS4ev0ft3CYonbie3lmces=
X-Received: by 2002:a67:c789:: with SMTP id t9mr438538vsk.60.1627486897528;
 Wed, 28 Jul 2021 08:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-2-sean@poorly.run>
In-Reply-To: <20210721175526.22020-2-sean@poorly.run>
From: jim.cromie@gmail.com
Date: Wed, 28 Jul 2021 11:41:11 -0400
Message-ID: <CAJfuBxyLTuix86xNvL_M-2oVz=1ehyZ4YB1FPPG0P4tH2P9Xog@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 01/14] drm/mipi_dbi: Convert pr_debug calls to
 DRM_DEBUG_DRIVER
To: Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 1:55 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Use the drm logging helpers to output these messages to ensure they'll
> be included by the drm tracefs instance.
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-2-sean@poorly.run #v5
>
> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 10b4e59384ae..2f661d7ff774 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -763,9 +763,7 @@ static int mipi_dbi_spi1e_transfer(struct mipi_dbi *dbi, int dc,
>         int i, ret;
>         u8 *dst;
>
> -       if (drm_debug_enabled(DRM_UT_DRIVER))
> -               pr_debug("[drm:%s] dc=%d, max_chunk=%zu, transfers:\n",
> -                        __func__, dc, max_chunk);
> +       DRM_DEBUG_DRIVER("dc=%d, max_chunk=%zu, transfers:\n", dc, max_chunk);
>
>         tr.speed_hz = mipi_dbi_spi_cmd_max_speed(spi, len);
>         spi_message_init_with_transfers(&m, &tr, 1);
> @@ -887,9 +885,7 @@ static int mipi_dbi_spi1_transfer(struct mipi_dbi *dbi, int dc,
>         max_chunk = dbi->tx_buf9_len;
>         dst16 = dbi->tx_buf9;
>
> -       if (drm_debug_enabled(DRM_UT_DRIVER))
> -               pr_debug("[drm:%s] dc=%d, max_chunk=%zu, transfers:\n",
> -                        __func__, dc, max_chunk);
> +       DRM_DEBUG_DRIVER("dc=%d, max_chunk=%zu, transfers:\n", dc, max_chunk);
>

This makes sense generically.

I note you have dropped the "[drm:__func__]" prefix.

dyndbg can provide that if user wants (+pf), so dropping from msg-body
is brevity.

but this means that dyndbg cannot select on it using
   echo "format ^[drm:funcname] +p" > control

thats ok, since "function funcname" would work,
but theres an element of moving target.

obviously, w/o dyndbg, all this is different, putting more balls in the air.
