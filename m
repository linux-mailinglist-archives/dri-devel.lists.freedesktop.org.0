Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1323B923C3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 18:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1533C10E2E9;
	Mon, 22 Sep 2025 16:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yypMGV0y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F91F10E2E2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 16:33:02 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-4694ac46ae0so30871035e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758558781; x=1759163581; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v1wHAoCkXd5geKh9VVRmxk6qpbp5tT7LVPERA+lkELM=;
 b=yypMGV0yCvyF9GNIXo+ISa4Ijuy+4n6PCxFPOLr/NOM3qWSurA19Dzlg/jLfT5el8u
 YrJ0MAtXQLaaK+vUlFdQTbWo01c+pl82TgbzTiQ6YbUVRZaSzW5sUQhRMR0wk5rMlWvA
 nbjLPBYbeTD2WmjPf/zdTLWwsjE23YxeOqA8F90f8I00qFH/dfuM5HmY8ke/KeMcaKNX
 NOfz0XigE0FMge1Gzuieuu86UQKxEjt8m98v+Ow37ObMX0GcD9m3seVikef5OgUs6FZ2
 sZre84Hiav7xluWIGhNLXsMZm7J4w7X6nsgMhDMOzVHJ8j9AHPc9owVm3+eHfcrJbppP
 mISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758558781; x=1759163581;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1wHAoCkXd5geKh9VVRmxk6qpbp5tT7LVPERA+lkELM=;
 b=Dzz+ZggPJvjvV4AvGkW/kTWXH7Nxgr26Q77dJMlaOKybPZ/XnoUZB5RbU2dDTp6KgT
 VdLJ3fmq12D1Bf+JdsN0XCImt+mcgtk1xD8QW0WVZa87158lTkdMHri40xVR7JKh/1JZ
 I7iPAXqRK267x86Sg1Y2IdzJrPPVapog6eHpKSToW8PsliKpZQOjBSiqFLm/C+pL6m4d
 tPigkIQicxxOKFAPVeu/7o6EPTbusEHaoK+hHm4H1X7OVmCffA6mKMS7q6mqiWYCaSmP
 n/u9YB82EvdbSwAdBmiM7XiA8MwZgdC9e9exBMgDUn6YrnMYua7+6oLU2FFRgYvcTjj/
 BEjg==
X-Gm-Message-State: AOJu0YyleO68femqPR/JnHGv2yFXM+3AQBPZuvBFiDZnsV6jXvgp3UAS
 cj2Hwv0KSEj94oh9f/9K9uaoXonrAtUp2FFF9ic+h2jGYGj/bZyKL9ASFjAqUrUv8JI=
X-Gm-Gg: ASbGncuBWI2UaP96yAKT2anL9KWGy0OxTHylf/kv8fF/fNVzerC2/5tHpiqs9j7FI+g
 Fy5RoyMWoKXEDRxSXhZBeBQQdEs3owHNWEajO+GgWFSrsj0TtCGX1zk4M5mGmLAlg8lPMy8Eu6A
 +pYIVvRtIWVMsclS+KEU7BlzKtI5kXTwxX6m80k3ls2PbK5hZmbT7u2xf9Nhi82Mz5NIk+PqJsc
 dlbfmNYqHKmDPYgCyPOIHy6Nai4X4AVzn1E/HC+vKT4fKlr+IreDA7bgGgf1UjmOH5bQO1Lu++x
 9DWF0sixtk9NQFzYZ1esS4Cb+a+e8Nfql736Rgv6JELbbaqEligW2vDpjrWV1todpDhCv9pK8tn
 1b0Mlp6N+zlPcmJ7PUrEZQehos1/RFlN/
X-Google-Smtp-Source: AGHT+IGnQPkxMftXWyc0+CV4hBsymweO1uIa+g45TRCqmBDBE2a4JgAwlc/K21Y2/aal8sHjc8EnYQ==
X-Received: by 2002:a05:600c:4f42:b0:468:7a5a:725 with SMTP id
 5b1f17b1804b1-4687a5a0801mr128268745e9.1.1758558780393; 
 Mon, 22 Sep 2025 09:33:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:ae58:9ec8:1ac6:e1a6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464eadd7e11sm219510625e9.0.2025.09.22.09.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 09:32:59 -0700 (PDT)
Date: Mon, 22 Sep 2025 18:32:55 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm: Fix refcnt underflow in error path
Message-ID: <aNF6N8u1VIFSTaRM@linaro.org>
References: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
 <20250723190852.18394-2-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723190852.18394-2-robin.clark@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Wed, Jul 23, 2025 at 12:08:49PM -0700, Rob Clark wrote:
> If we hit an error path in GEM obj creation before msm_gem_new_handle()
> updates obj->resv to point to the gpuvm resv object, then obj->resv
> still points to &obj->_resv.  In this case we don't want to decrement
> the refcount of the object being freed (since the refcnt is already
> zero).  This fixes the following splat:
> 
>    ------------[ cut here ]------------
>    refcount_t: underflow; use-after-free.
>    WARNING: CPU: 9 PID: 7013 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x148
>    Modules linked in: uinput snd_seq_dummy snd_hrtimer aes_ce_ccm snd_soc_wsa884x regmap_sdw q6prm_clocks q6apm_lpass_da>
>     qcom_pil_info i2c_hid drm_kms_helper qcom_common qcom_q6v5 phy_snps_eusb2 qcom_geni_serial drm qcom_sysmon pinctrl_s>
>    CPU: 9 UID: 1000 PID: 7013 Comm: deqp-vk Not tainted 6.16.0-rc4-debug+ #25 PREEMPT(voluntary)
>    Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN53WW 08/02/2024
>    pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>    pc : refcount_warn_saturate+0xf4/0x148
>    lr : refcount_warn_saturate+0xf4/0x148
>    sp : ffff8000a2073920
>    x29: ffff8000a2073920 x28: 0000000000000010 x27: 0000000000000010
>    x26: 0000000000000042 x25: ffff000810e09800 x24: 0000000000000010
>    x23: ffff8000a2073b94 x22: ffff000ddb22de00 x21: ffff000ddb22dc00
>    x20: ffff000ddb22ddf8 x19: ffff0008024934e0 x18: 000000000000000a
>    x17: 0000000000000000 x16: ffff9f8c67d77340 x15: 0000000000000000
>    x14: 00000000ffffffff x13: 2e656572662d7265 x12: 7466612d65737520
>    x11: 3b776f6c66726564 x10: 00000000ffff7fff x9 : ffff9f8c67506c70
>    x8 : ffff9f8c69fa26f0 x7 : 00000000000bffe8 x6 : c0000000ffff7fff
>    x5 : ffff000f53e14548 x4 : ffff6082ea2b2000 x3 : ffff0008b86ab080
>    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008b86ab080
>    Call trace:
>     refcount_warn_saturate+0xf4/0x148 (P)
>     msm_gem_free_object+0x248/0x260 [msm]
>     drm_gem_object_free+0x24/0x40 [drm]
>     msm_gem_new+0x1c4/0x1e0 [msm]
>     msm_gem_new_handle+0x3c/0x1a0 [msm]
>     msm_ioctl_gem_new+0x38/0x70 [msm]
>     drm_ioctl_kernel+0xc8/0x138 [drm]
>     drm_ioctl+0x2c8/0x618 [drm]
>     __arm64_sys_ioctl+0xac/0x108
>     invoke_syscall.constprop.0+0x64/0xe8
>     el0_svc_common.constprop.0+0x40/0xe8
>     do_el0_svc+0x24/0x38
>     el0_svc+0x54/0x1d8
>     el0t_64_sync_handler+0x10c/0x138
>     el0t_64_sync+0x19c/0x1a0
>    irq event stamp: 3698694
>    hardirqs last  enabled at (3698693): [<ffff9f8c675021dc>] __up_console_sem+0x74/0x90
>    hardirqs last disabled at (3698694): [<ffff9f8c68ce8164>] el1_dbg+0x24/0x90
>    softirqs last  enabled at (3697578): [<ffff9f8c6744ec5c>] handle_softirqs+0x454/0x4b0
>    softirqs last disabled at (3697567): [<ffff9f8c67360244>] __do_softirq+0x1c/0x28
>    ---[ end trace 0000000000000000 ]---
> 
> Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 33d3354c6102..958bac4e2768 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1114,10 +1114,12 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
>  		put_pages(obj);
>  	}
>  
> -	if (msm_obj->flags & MSM_BO_NO_SHARE) {
> +	if (obj->resv != &obj->_resv) {
>  		struct drm_gem_object *r_obj =
>  			container_of(obj->resv, struct drm_gem_object, _resv);
>  
> +		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> +
>  		/* Drop reference we hold to shared resv obj: */
>  		drm_gem_object_put(r_obj);
>  	}

This patch seems to break something for direct IRIS/video playback using
dmabuf. I use a simple GStreamer test pipeline for testing IRIS on X1E
(on GNOME, in case that matters):

 $ gst-launch-1.0 filesrc location=bbb_sunflower_2160p_60fps_normal.mp4 \
   ! qtdemux name=d d.video_0 ! h264parse ! v4l2h264dec \
   ! capture-io-mode=dmabuf ! waylandsink

The video plays fine, but if I try to exit (CTRL+C) the display hangs
for a few seconds and then the console is spammed with pretty much
exactly the messages that you tried to fix here. If I revert this patch,
everything is fine again. It feels like your patch does exactly the
opposite for this use case. :-)

It seems to run into the WARN_ON you added.

Any ideas?

linux-next should have IRIS support for the Slim 7x if you want to try
this for yourself. Or alternatively, there is a backport for 6.17-rc7 in
the Linaro arm64-laptops tree: https://gitlab.com/Linaro/arm64-laptops/linux

You can find the test video here:
https://download.blender.org/demo/movies/BBB/

Thanks,
Stephan

[  107.430721] ------------[ cut here ]------------
[  107.435513] WARNING: CPU: 3 PID: 2040 at drivers/gpu/drm/msm/msm_gem.c:1127 msm_gem_free_object+0x1f8/0x264 [msm]
[  107.630472] CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Not tainted 6.17.0-rc7 #1 PREEMPT 
[  107.630482] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[  107.630488] pc : msm_gem_free_object+0x1f8/0x264 [msm]
[  107.676630] lr : msm_gem_free_object+0x138/0x264 [msm]
[  107.676666] sp : ffff800092a1bb30
[  107.676668] x29: ffff800092a1bb80 x28: ffff800092a1bce8 x27: ffffbc702dbdbe08
[  107.676676] x26: 0000000000000008 x25: 0000000000000009 x24: 00000000000000a6
[  107.676682] x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087e69f200
[  107.676689] x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 0000000000000000
[  107.676695] x17: 0000000000000000 x16: ffffbc704bd46b80 x15: 0000ffffd0959540
[  107.676701] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[  107.676706] x11: ffffbc702e6cdb48 x10: 0000000000000000 x9 : 000000000000003f
[  107.676712] x8 : ffff800092a1ba90 x7 : 0000000000000000 x6 : 0000000000000020
[  107.676718] x5 : ffffbc704bd46c40 x4 : fffffdffe102cf60 x3 : 0000000000400032
[  107.676724] x2 : 0000000000020000 x1 : ffff00087e6978e8 x0 : ffff00087e6977e8
[  107.676731] Call trace:
[  107.676733]  msm_gem_free_object+0x1f8/0x264 [msm] (P)
[  107.676771]  drm_gem_object_free+0x1c/0x30 [drm]
[  107.676816]  drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
[  107.676852]  drm_gem_object_release_handle+0x5c/0xcc [drm]
[  107.676886]  drm_gem_handle_delete+0x68/0xbc [drm]
[  107.788743]  drm_gem_close_ioctl+0x34/0x40 [drm]
[  107.793553]  drm_ioctl_kernel+0xc0/0x130 [drm]
[  107.798178]  drm_ioctl+0x360/0x4e0 [drm]
[  107.802277]  __arm64_sys_ioctl+0xac/0x104
[  107.806436]  invoke_syscall+0x48/0x104
[  107.810334]  el0_svc_common.constprop.0+0x40/0xe0
[  107.815209]  do_el0_svc+0x1c/0x28
[  107.818662]  el0_svc+0x34/0xec
[  107.821838]  el0t_64_sync_handler+0xa0/0xe4
[  107.826173]  el0t_64_sync+0x198/0x19c
[  107.829971] ---[ end trace 0000000000000000 ]---
[  107.834789] ------------[ cut here ]------------
[  107.839587] refcount_t: underflow; use-after-free.
[  107.844553] WARNING: CPU: 3 PID: 2040 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x144
[  108.052928] CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Tainted: G        W           6.17.0-rc7 #1 PREEMPT 
[  108.063491] Tainted: [W]=WARN
[  108.075627] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[  108.082808] pc : refcount_warn_saturate+0xf4/0x144
[  108.087756] lr : refcount_warn_saturate+0xf4/0x144
[  108.092704] sp : ffff800092a1bb20
[  108.096141] x29: ffff800092a1bb20 x28: ffff800092a1bce8 x27: ffffbc702dbdbe08
[  108.103491] x26: 0000000000000008 x25: 0000000000000009 x24: 00000000000000a6
[  108.110852] x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087e69f200
[  108.118222] x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 0000000000000006
[  108.125572] x17: 0000000000000000 x16: ffffbc704ba1eda0 x15: ffff800092a1b6ef
[  108.132925] x14: 000000000000003a x13: 000000000000003a x12: 0000000000000000
[  108.140280] x11: 00000000000000c0 x10: d2c95932de8ceaa3 x9 : 128386994077d608
[  108.147631] x8 : ffff000840c0c588 x7 : 0000000002ac3ea0 x6 : 0000000000000002
[  108.154990] x5 : 0000000435572e2f x4 : 0000000000000002 x3 : 0000000000000010
[  108.162339] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000840c0b480
[  108.169697] Call trace:
[  108.172243]  refcount_warn_saturate+0xf4/0x144 (P)
[  108.177199]  msm_gem_free_object+0x25c/0x264 [msm]
[  108.182167]  drm_gem_object_free+0x1c/0x30 [drm]
[  108.186943]  drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
[  108.193237]  drm_gem_object_release_handle+0x5c/0xcc [drm]
[  108.198906]  drm_gem_handle_delete+0x68/0xbc [drm]
[  108.203867]  drm_gem_close_ioctl+0x34/0x40 [drm]
[  108.208651]  drm_ioctl_kernel+0xc0/0x130 [drm]
[  108.213248]  drm_ioctl+0x360/0x4e0 [drm]
[  108.217319]  __arm64_sys_ioctl+0xac/0x104
[  108.221464]  invoke_syscall+0x48/0x104
[  108.225343]  el0_svc_common.constprop.0+0x40/0xe0
[  108.230207]  do_el0_svc+0x1c/0x28
[  108.233650]  el0_svc+0x34/0xec
[  108.236817]  el0t_64_sync_handler+0xa0/0xe4
[  108.241143]  el0t_64_sync+0x198/0x19c
[  108.244931] ---[ end trace 0000000000000000 ]---

