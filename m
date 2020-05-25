Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EDE1E118D
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 17:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E422F89FD3;
	Mon, 25 May 2020 15:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447DD89FD3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 15:21:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j16so4950900wrb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=azenEtGzcFDvZVRZ1z9lGmaMUm23kGAbEjYMZFlfpBc=;
 b=jIaJACZ7B3nGcdgUsu+D9re3ExF3vT3f345V3A83+o4MPjLNNAd9e1R1gz94XdKouy
 SCObHvqoRyXhmj01+ComdlUTP+gT7pyvQwtl3L60vx6XglFTdIUTVTgmZzAiWaKWXKD0
 FzmsuDzgNclgzjakVgnhxbsigkCr7/2L2sZ5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=azenEtGzcFDvZVRZ1z9lGmaMUm23kGAbEjYMZFlfpBc=;
 b=te1nXurqE3N4tYzxPTUcuqM9jbWCiAhhdlBxwP/Aer7YMGVjWrRrqFYc2HaoSnpw5E
 TXNP0I7KVG3kQ+S2qYBIDpvONlj9uTB1Z+I/k7B8Vs8HLPzTz28IDIWT0yGNm6DdD22J
 g31K/iLCHkoB6092eCKXGc4rNiBuTyMtwJYuX3kvU08CEDmEQ0btfBxhxm17CEIGWz18
 qZtcoTObfyb9jhK1qAnm5yfFloSodU3mwsX7m438/cOnctCmmIybpPaHR0zdv5JuruRv
 QcoKz8aDzHYriEzaGDfjDvg/i4JAmROKgqjglt4Ztx8IaCiErKTb3J3kzeqC3QnxCDGL
 fmJQ==
X-Gm-Message-State: AOAM5329xELrrzIG4cbnL5ydSJmrbSuSUlFsdKPsUIB51B4nfi8UnOSh
 C8y1BjreN0CCsWNzqlPOLuT2OA==
X-Google-Smtp-Source: ABdhPJx5zoht7hK4geWs1ZqZUjBaC/X8di6ZPRSwMgfgJc93UJvi29jkS1pDX4jA5I7ro10F+5t+/Q==
X-Received: by 2002:adf:8023:: with SMTP id 32mr16757892wrk.247.1590420081952; 
 Mon, 25 May 2020 08:21:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 10sm18584358wmw.26.2020.05.25.08.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 08:21:21 -0700 (PDT)
Date: Mon, 25 May 2020 17:21:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: [PATCH] drm/vkms: Don't warn hrtimer_forward_now failure.
Message-ID: <20200525152119.GL206103@phenom.ffwll.local>
References: <20200525143849.4964-1-penguin-kernel@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525143849.4964-1-penguin-kernel@I-love.SAKURA.ne.jp>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 25, 2020 at 11:38:49PM +0900, Tetsuo Handa wrote:
> Commit 3a0709928b172a41 ("drm/vkms: Add vblank events simulated by
> hrtimers") introduced ret_overrun variable. And that variable was an
> unused-but-set-variable until commit 09ef09b4ab95dc40 ("drm/vkms:
> WARN when hrtimer_forward_now fails") added WARN_ON(ret_overrun != 1).
> 
> Now, syzbot is hitting this WARN_ON() using a simple reproducer that
> does open("/dev/dri/card1") followed by ioctl(DRM_IOCTL_WAIT_VBLANK),
> and a debug printk() patch says that syzbot is getting
> 
>    output->vblank_hrtimer.base->get_time()=93531904774 (which is uptime)
>    output->period_ns=0
>    ret_overrun=216994
> 
> . I can't understand what "verify the hrtimer_forward_now return" in
> that commit wants to say. hrtimer_forward_now() must return, and the
> return value of hrtimer_forward_now() is not a boolean. Why comparing
> with 1 ? Anyway, this failure is not something that worth crashing the
> system. Let's remove the ret_overrun variable and WARN_ON() test.

Uh we're not crashing the system, it's a warning backtrace.

And we've spent a few months hunting the races here, so just removing that
check isn't really a good idea. The correct thing to do is figure out why
we're hitting this. It could be that we're having a missing check
somewhere, or missing initialization, and that's what syzbot is hitting.
Removing this check here just papers over the bug.

If the vkms driver is loaded, and there's nothing else going on, then what
I expect to happen is that this virtual hw is entirely off. And in that
case, the vblank ioctl should be rejected outright. So there's definitely
something fishy going on to begin with.

If otoh the virtual hw is somehow on (maybe fbcon gets loaded, no idea),
then the vblank wait shouldn't just blow up like this.
-Daniel

> 
> Link: https://syzkaller.appspot.com/bug?id=0ba17d70d062b2595e1f061231474800f076c7cb
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Reported-by: syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
> Fixes: 09ef09b4ab95dc40 ("drm/vkms: WARN when hrtimer_forward_now fails")
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index ac85e17428f8..cc1811ce6092 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -13,12 +13,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  						  vblank_hrtimer);
>  	struct drm_crtc *crtc = &output->crtc;
>  	struct vkms_crtc_state *state;
> -	u64 ret_overrun;
>  	bool ret;
>  
> -	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
> -					  output->period_ns);
> -	WARN_ON(ret_overrun != 1);
> +	hrtimer_forward_now(&output->vblank_hrtimer, output->period_ns);
>  
>  	spin_lock(&output->lock);
>  	ret = drm_crtc_handle_vblank(crtc);
> -- 
> 2.18.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
