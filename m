Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA63919FE07
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5ADF6E450;
	Mon,  6 Apr 2020 19:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8DD6E488
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:24:23 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id n13so651878ilm.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 12:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vePX0/zywlzH/S3pB4C4OQDkDkegT3qQSMEsAoWIPuc=;
 b=ZAmz+GjJjLF4PlS9vtEeLKUZ1oOZ13Gyd7sGQCR5YO9Hc0UXp6aoZdrwCaL9kCEUnA
 cOvFtLY21jz6X4TTAvJ5i9zxcVKrq50xT3z+ZQH4nzBwBxuZsds9EgHd5Jh/B4GnHjMI
 gb4Fivc2nyAbAg0PuA+5EVBZoevMCno9B1edFLNPe5qBw5+Zi3hO9jqV4K0v9SGkXunN
 chfufTf/QYAhCf+Y2BWfwWvSkKM9hoTFoIYLwlIjWS0yUhbyqgsb89Dj1pBu8zDqhieV
 se9OX4bwhCB+5XB2qXblllxcrLk2knEyumL4GBZ3rHZqp4WePONPYj457rD7l5BS4YAK
 FCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vePX0/zywlzH/S3pB4C4OQDkDkegT3qQSMEsAoWIPuc=;
 b=nC5Ohbh6QZHqDo8sN5zlfauUZbEZ/FB0N3+WPPYLf4JQiMDOPb0nfEzHaVLKadsLdG
 5GZQ369FxKd2HUkVJFqzSWSEVxHEUVCg5960wJb2AXhq8R6WtB+8oJbb4kN4x/C4N3Ql
 5x17JbOLsPozU34lrQKyInStTF3YIcXpxBsSX2p3fs97K1Gop5KUMh4kt4WMUkUG5mJH
 rwMOwrXLWlYUP691fkhDBNSt8ju0svXcreGuqbpbhiGo6VgqfaaZrAG5BG8rQNkiKJ11
 Q7Wtr7vLrJZD4g7bCTPBb5Dx/kC8ttgDYXncmFN00JP7XaJGJzuL5ozp6kxlUjU2GCiA
 dW9Q==
X-Gm-Message-State: AGi0PuZRBekY8lO+zA8bJI/PjtypKYBtC33gs9MXTKHhK0ZNY9oHdRUD
 KdRQE/zKh8nxpTPUkku2z3y+z7r5/y/31mWummeTpA==
X-Google-Smtp-Source: APiQypL2MG5b6ggF1ip4yCdvbuL8ZGEpWTi12pOkrrcYep7bseoSKkbcrp87/m+HbZrf5Mac2unzD5FFDmdmURhBvkM=
X-Received: by 2002:a92:3b56:: with SMTP id i83mr960355ila.75.1586201062614;
 Mon, 06 Apr 2020 12:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200403200757.886443-1-lyude@redhat.com>
 <20200403200757.886443-3-lyude@redhat.com>
In-Reply-To: <20200403200757.886443-3-lyude@redhat.com>
From: Sean Paul <sean@poorly.run>
Date: Mon, 6 Apr 2020 15:23:46 -0400
Message-ID: <CAMavQKL6G9QsUE7ZzGXNpjjEVdZGQZkbN3oke-M=Lz=pHOn70A@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/dp_mst: Reformat drm_dp_check_act_status() a bit
To: Lyude Paul <lyude@redhat.com>
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
Cc: Todd Previte <tprevite@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 4:08 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Just add a bit more line wrapping, get rid of some extraneous
> whitespace, remove an unneeded goto label, and move around some variable
> declarations. No functional changes here.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> [this isn't a fix, but it's needed for the fix that comes after this]
> Fixes: ad7f8a1f9ced ("drm/helper: add Displayport multi-stream helper (v0.6)")
> Cc: Sean Paul <sean@poorly.run>
> Cc: <stable@vger.kernel.org> # v3.17+
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 2b9ce965f044..7aaf184a2e5f 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4473,33 +4473,31 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
>   */
>  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
>  {
> +       int count = 0, ret;
>         u8 status;
> -       int ret;
> -       int count = 0;
>
>         do {
> -               ret = drm_dp_dpcd_readb(mgr->aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
> -
> +               ret = drm_dp_dpcd_readb(mgr->aux,
> +                                       DP_PAYLOAD_TABLE_UPDATE_STATUS,
> +                                       &status);
>                 if (ret < 0) {
> -                       DRM_DEBUG_KMS("failed to read payload table status %d\n", ret);
> -                       goto fail;
> +                       DRM_DEBUG_KMS("failed to read payload table status %d\n",
> +                                     ret);
> +                       return ret;
>                 }
>
>                 if (status & DP_PAYLOAD_ACT_HANDLED)
>                         break;
>                 count++;
>                 udelay(100);
> -
>         } while (count < 30);
>
>         if (!(status & DP_PAYLOAD_ACT_HANDLED)) {
> -               DRM_DEBUG_KMS("failed to get ACT bit %d after %d retries\n", status, count);
> -               ret = -EINVAL;
> -               goto fail;
> +               DRM_DEBUG_KMS("failed to get ACT bit %d after %d retries\n",

Should we print status in base16 here?

Otherwise:

Reviewed-by: Sean Paul <sean@poorly.run>

> +                             status, count);
> +               return -EINVAL;
>         }
>         return 0;
> -fail:
> -       return ret;
>  }
>  EXPORT_SYMBOL(drm_dp_check_act_status);
>
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
