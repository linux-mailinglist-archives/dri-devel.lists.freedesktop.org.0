Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A5F348447
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 23:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715476EA97;
	Wed, 24 Mar 2021 22:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7048D6EA95
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 22:00:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p19so101821wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3StMOwc0jJRs3gCodn1X+cgKnhL/pkdpaA+0ab7e1tM=;
 b=SOF65gx4e2PFWffP9jHgPOyi9O2EFiDlVH+BiWAWi2DtafM+8kEcjw4w0wPjv315yE
 eExNg6thcBR691XfqwMxcXpm7EsZiMA0SacoU1msAhvpCUUazu5z7IocvCBDNIbZQto1
 E9GWCOSwczpuSVlMIY/LPCnqZzt0jMcdvweJBinHp8tCeU7MXyc77b7MnjKLdahuito6
 zM3szUGXjq6UN+QZZhQwPjqnVdaJliMxXUFRijLzI3PWK3KAlEn86Qjr8W3BMFokPrMj
 fGfp38/GJlHlqnKKPA3d2Y7oK9RxjKHMMChSihJbnVSV7Ncw4ZZ4kJW7cTR9OMMKW1dR
 pnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3StMOwc0jJRs3gCodn1X+cgKnhL/pkdpaA+0ab7e1tM=;
 b=eyn48tIiWT5iTKaZc1VfCk08+jMYmHpsGghgYfmcUk+lHEN6CZkJFcbTCU71kETt0C
 xTdYXU2tusNczFzXqfwGsh/FCEEHs5I0hkH7eU+L8BA9lrVY19BBHV6ArOvXh+bRlvd9
 8Y7aqIn5ES4+HakGgWRrJgt9PtrEGiKhat/88e+QLlTBKt14o5sPGBvzdB+tKJVOnteh
 f1g6o1+oqhcF8JZyHJTlvSQxuFLbvPPOBomEGtHEtYbPclkRpyrWTFcfPr+kmzSve4qP
 yHcoUP4d4mT2SK3C5om7LeEx3/Kk2TsNjUILnnDoVYsdV5LI/qTGodifoLsVMoY7kMt/
 oNPw==
X-Gm-Message-State: AOAM530mvmVVGZWvBVDPMwMevfLyjWRvlY5Hrmwmz7Rpv2ei/TxarAsK
 MFvQ5/IpB5U1fVmuD4d3+xw=
X-Google-Smtp-Source: ABdhPJwUmmIf8dqawk0il4BbMj532OMCkepT+IGFZqNoY5CGbH60hAceO/Q49Khdn5D0063YoEC9IQ==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr5021146wmi.153.1616623215161; 
 Wed, 24 Mar 2021 15:00:15 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id v18sm4965760wru.85.2021.03.24.15.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 15:00:14 -0700 (PDT)
Date: Wed, 24 Mar 2021 19:00:08 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH] drm/vkms: fix misuse of WARN_ON
Message-ID: <20210324220008.nqwwwfugyfngbn3x@smtp.gmail.com>
References: <20210320132840.1315853-1-dvyukov@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210320132840.1315853-1-dvyukov@google.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 syzbot+4fc21a003c8332eb0bdd@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/20, Dmitry Vyukov wrote:
> vkms_vblank_simulate() uses WARN_ON for timing-dependent condition
> (timer overrun). This is a mis-use of WARN_ON, WARN_ON must be used
> to denote kernel bugs. Use pr_warn() instead.
> 
> Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
> Reported-by: syzbot+4fc21a003c8332eb0bdd@syzkaller.appspotmail.com
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Change-Id: I7f01c288092bc7e472ec63af198f93ce3d8c49f7
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 0443b7deeaef6..758d8a98d96b3 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -18,7 +18,8 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  
>  	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
>  					  output->period_ns);
> -	WARN_ON(ret_overrun != 1);
> +	if (ret_overrun != 1)
> +		pr_warn("%s: vblank timer overrun\n", __func__);

Hi Dmitry,

Thanks for your patch.

Looks good to me.
The Change-Id tag just seems a little noisy to me, but can be
fixed while applying.

Acked-by: Melissa Wen <melissa.srw@gmail.com>

>  
>  	spin_lock(&output->lock);
>  	ret = drm_crtc_handle_vblank(crtc);
> 
> base-commit: e94c55b8e0a0bbe9a026250cf31e2fa45957d776
> -- 
> 2.31.0.291.g576ba9dcdaf-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
