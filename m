Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F34919FE3E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877D66E48C;
	Mon,  6 Apr 2020 19:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4136C6E48C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:43:43 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n10so806890iom.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=abwTcU3NPLB9ZnkU0lkxt+NZ4BdMbKcPpC7Ll2Lyoj8=;
 b=QuGm95H/LilnuJBVmVnYx0H7LMduoXK1eUUubT4UBJaC+N68X41iFuZPPIL/qJvwQd
 h4G6ju6hnHbddVb0RuUkYDuVMdezs+invBSiSoOMIbxIChuZqsWIDUpiUxqJKs4gQoOg
 n7E5NwCaO8If0SlL+U/0bhgS4HOPazzvYzPyAxK1IGqwWBD7H0R31WaE853O5cgKoNT+
 cFRrmKFGfNzVeEXky8pX8Bz1mBOdRP15EAtc7GFWOj1VGJI47Po6klHBFnRsMb5szO9X
 k2uJkx9KxgbF9hLJOhotAOxW3WVprGYUxZa8ddaEJlkIfFRkKYjaz36CCeoBBvfULPOx
 tobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=abwTcU3NPLB9ZnkU0lkxt+NZ4BdMbKcPpC7Ll2Lyoj8=;
 b=FYHrNYpnqh69SCqSbFT+gqmmNhq0x5EZkJPr8oNd8w8kMgRQiJvY+GFp9MxutWnN41
 qbQyCrIhRj5tKJIA9PX1Alv+cjoa1xvyY5bBLXqziItY2es4724r3/aXu88xpz6W3AWv
 +HJW853YS2Gf9EGnl/CqPtlcu/09KI6xWXvCbH5BTFsLQ2T9EAzMZrTZ/yXOZOCC/m86
 WI5ug/+z0dPQV8CjYU7zwgr0+Ipap6+9tlG3KfUGgTEi+NAEPb2jkC4brjLHWLHupDXn
 ze4zRra/hNA5ZESSWzz4xTXwgwUK7ZQFiA3mWQHrY3HAQ/don7r7L0R1gmv67AXXajoW
 /CgQ==
X-Gm-Message-State: AGi0PuYlH1m6eMHa5oW3hWNHpBZvTjwa0fPqcWXUEKg+UvGd1Q/3P2K6
 3vlHgqWwRROVyAfm7wFPpvnKB8/mN+O8Pb0j6SA19Q==
X-Google-Smtp-Source: APiQypLhF2Lp08EtG9n48GKhPoxcqCViZNaBO24fDJpPAR6rwFCZHEUpxBMLCAa2E8pd6+kNcQ8CAuSRjo8ByUOfK6Y=
X-Received: by 2002:a6b:b3c3:: with SMTP id c186mr5093685iof.85.1586202222502; 
 Mon, 06 Apr 2020 12:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200403200757.886443-1-lyude@redhat.com>
 <20200403200757.886443-5-lyude@redhat.com>
In-Reply-To: <20200403200757.886443-5-lyude@redhat.com>
From: Sean Paul <sean@poorly.run>
Date: Mon, 6 Apr 2020 15:43:06 -0400
Message-ID: <CAMavQK+UYf8-Esah7kLcMbQtZ_J5h_bHqEroAPkO67fB=ArHyg@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/dp_mst: Print errors on ACT timeouts
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 4:08 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Although it's not unexpected for drm_dp_check_act_status() to fail due
> to DPCD read failures (as the hub may have just been unplugged
> suddenly), timeouts are a bit more worrying as they either mean we need
> a longer timeout value, or we aren't setting up payload allocations
> properly. So, let's start printing errors on timeouts.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Sean Paul <sean@poorly.run>

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index f313407374ed..3d0d373f6f91 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4494,6 +4494,10 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
>                                         DP_PAYLOAD_TABLE_UPDATE_STATUS,
>                                         &status);
>                 if (ret < 0) {
> +                       /*
> +                        * Failure here isn't unexpected - the hub may have
> +                        * just been unplugged
> +                        */
>                         DRM_DEBUG_KMS("failed to read payload table status %d\n",
>                                       ret);
>                         return ret;
> @@ -4505,8 +4509,8 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
>         } while (jiffies < timeout);
>
>         if (!(status & DP_PAYLOAD_ACT_HANDLED)) {
> -               DRM_DEBUG_KMS("failed to get ACT bit %d after %dms\n",
> -                             status, timeout_ms);
> +               DRM_ERROR("Failed to get ACT after %dms, last status: %02x\n",
> +                         timeout_ms, status);
>                 return -EINVAL;
>         }
>         return 0;
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
