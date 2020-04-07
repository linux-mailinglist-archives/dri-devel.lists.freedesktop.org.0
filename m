Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F31E1A12E1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 19:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782E96E134;
	Tue,  7 Apr 2020 17:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05056E134
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 17:43:48 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id b12so4252054ion.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 10:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nLa8vWF/VHkJLQ5tzbAupKSkO7Nd/GQhK2vTdnyt2y4=;
 b=cxUdlynHEL2HXCInGiFUbupNgINSW8CZIPliUdfXDuBkfl9kG0+4OYer70mLLKEHr0
 vqQXDHUHcRzSrzCluxfuT9/dha0FCNMZutjG/L4rpPtKF53DKgPRtuHjHhhlsYp2A9gT
 lGg1I8AXOKRD6BuuaD4mpCepf4X4ssrueLB0LWmeGOHvxvHLLo+Cfsfl3GVCxSIMtBJ2
 vc5nAAxFKSV7U4jZTZAKxx/JMFycQS+Gnb1ol6efME71kjoDqbMOLNfF7aljFlioXb0Y
 U+N1gahyzWtPx1NpLQ5wYOVx7k38jtDr/tR8LS9s7LbG34dJt1bEeYpOElRiwhKXMWlX
 ac9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nLa8vWF/VHkJLQ5tzbAupKSkO7Nd/GQhK2vTdnyt2y4=;
 b=RgRSJn8ZB2+YmuQJKEsTpwQia4YIE3UIvJsCDvBfOWu2JI7zHTFd/p3LLeysvknUFM
 B/p7Hhr7pUClJN3UJOz5W/nDoQ3LCpgov9hybgfSedrGzhGyQKmk+Kx32hxNEP152jCr
 kqP6C2Mzx4pjENCtP/kHxH7KAi9BuE4vBvlOfa/U2z97IeCbq1qscFP+Dc8ILcCN/zfd
 DvfQFfotdDeuUx2NUZuOnG1tLylciJo+u1OhiYxIwH/QrIwYZOfEXvbwzR2ghANwTZup
 kOQ3t1X12vvR1j855f0HuM7lLx7erFq47lubFoGmcrnffZisA8ftZ3XlcRNd7CC+CSeT
 Z4xg==
X-Gm-Message-State: AGi0PuaedaPhfQyNhUXvzXZaZfDUgpzEAP5Aa7lr7ZP9xDLIr2qJ9tdp
 CvwoAiHt0qT4zklop9ywND8Arzz9LZeOgR7/LFMjgA==
X-Google-Smtp-Source: APiQypKdMl63j0jsbL/tOJdgN63pxjl9MivX+3Gy3v3cZnXqbMogOdk7L4fQdx+qIQ6fu9+1tIzzkvkw/t6Se/9Qp7k=
X-Received: by 2002:a6b:b3c3:: with SMTP id c186mr3156512iof.85.1586281428368; 
 Tue, 07 Apr 2020 10:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200406221253.1307209-1-lyude@redhat.com>
 <20200406221253.1307209-5-lyude@redhat.com>
In-Reply-To: <20200406221253.1307209-5-lyude@redhat.com>
From: Sean Paul <sean@poorly.run>
Date: Tue, 7 Apr 2020 13:43:11 -0400
Message-ID: <CAMavQKJ5TaTbbS2iqkcQhwCbfiXoDvG5+V1qEa509GaqjBwM2g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/dp_mst: Print errors on ACT timeouts
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

On Mon, Apr 6, 2020 at 6:13 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Although it's not unexpected for drm_dp_check_act_status() to fail due
> to DPCD read failures (as the hub may have just been unplugged
> suddenly), timeouts are a bit more worrying as they either mean we need
> a longer timeout value, or we aren't setting up payload allocations
> properly. So, let's start printing errors on timeouts.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Sean Paul <sean@poorly.run>

Patches 1,2,4 are still

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index ce61964baa7c..0cbeb0f5c834 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4499,10 +4499,14 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
>                                  status & DP_PAYLOAD_ACT_HANDLED || status < 0,
>                                  100, timeout_ms * USEC_PER_MSEC);
>         if (ret < 0 && status >= 0) {
> -               DRM_DEBUG_KMS("Failed to get ACT bit %d after %dms\n",
> -                             status, timeout_ms);
> +               DRM_ERROR("Failed to get ACT after %dms, last status: %02x\n",
> +                         timeout_ms, status);
>                 return -EINVAL;
>         } else if (status < 0) {
> +               /*
> +                * Failure here isn't unexpected - the hub may have
> +                * just been unplugged
> +                */
>                 DRM_DEBUG_KMS("Failed to read payload table status: %d\n",
>                               status);
>                 return status;
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
