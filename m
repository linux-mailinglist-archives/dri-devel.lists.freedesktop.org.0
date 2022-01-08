Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C4489344
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A5912A8D9;
	Mon, 10 Jan 2022 08:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CEF10E11E
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jan 2022 19:17:02 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id c71so24438981edf.6
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jan 2022 11:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qJSjSoKR1W7zHmlcJB8zNue+/2QyIA7RKov7WU51HTg=;
 b=YI6AGiE3/nz4ybnAvvfOetuTRKxfSLHP/kyLc2Q0HmYx0aBun1CbmVfG70zsSqIzn1
 q9qec6onvx0jF4WOUZNHCPlWobd3gKeEWD9l3pzCrZRPIksAeraaOSCRrdhJkXi5R5TZ
 qul7C6i3MGyoS0LiPSPaL9HQ+B5WwSobObE7+5P7Rc+3yaogfSzynjer68epOMLs71W2
 Jp+xHsWoYhQVMYJnIq68xiHSnPKX6bQQRXqe+0Y9KvytWjuK8IxCuTWkNXdhXaSKodac
 xRPN3yVpsP6SDa3V+BbpvInybAR21gWJq79JHgC94F/hPJFZZVSoaG4PWUpd5/PewoN5
 AnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qJSjSoKR1W7zHmlcJB8zNue+/2QyIA7RKov7WU51HTg=;
 b=H8mz7e5GVY3hcR8YCj4km50brdkgb7Fr5tC3XaBVZdcIsP5O5aVdIo8bTbP2ZSJr+H
 1eTUZuCbuIRFSJAxBeVX3TObFKtGpnlOQqWIsfm+og13SsKE7pkrl12mOyJQkGMoR/eh
 F3gtsGSQ3K8nN/K76CXaYB5mr89u9juN7txqx/035sDmS4UA/4rk7q5OD2I1LFvQQAxr
 tOaSWkn4bUXfZdNIaoWCl5/qZTCXtPK0j3FkCmOrnDRFR/cCze7JTlV9xftN34FNxMbI
 4AvzwnuKW3x1PsjNmbGYZbp9L9cy1grkfrGG1BltkyP296pOgC1B9CEKPwIKVP3EQx+a
 /uUA==
X-Gm-Message-State: AOAM533Le+1YskbR8s/23+Dlw+v0SFEtiEomGQMpKZbHGZUt3PxANhFD
 omNjylbWuzM9SF9ikmdY3Us=
X-Google-Smtp-Source: ABdhPJyIEVyo6xzOMSuNp69dyV/qliIZAYc2Zel3ofHRvuckGEZjOflvzuw/hKTutXkhNV6cf7+25g==
X-Received: by 2002:a17:906:c108:: with SMTP id
 do8mr51397977ejc.251.1641669421319; 
 Sat, 08 Jan 2022 11:17:01 -0800 (PST)
Received: from tom-desktop (net-93-71-218-227.cust.vodafonedsl.it.
 [93.71.218.227])
 by smtp.gmail.com with ESMTPSA id u9sm729172ejh.193.2022.01.08.11.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 11:17:00 -0800 (PST)
Date: Sat, 8 Jan 2022 20:16:58 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] drm/i2c/tda998x: Switch to atomic operations
Message-ID: <20220108191658.GC2633@tom-desktop>
References: <20211231013930.139754-1-festevam@gmail.com>
 <YdLifIoB8eClztlG@pendragon.ideasonboard.com>
 <CAOMZO5DVzvPXs2-0Vzsunh=OZ0qhyMhSKyPTKQ+mGXfF8G8Rtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5DVzvPXs2-0Vzsunh=OZ0qhyMhSKyPTKQ+mGXfF8G8Rtw@mail.gmail.com>
X-Mailman-Approved-At: Mon, 10 Jan 2022 08:27:29 +0000
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
Cc: Marek Vasut <marex@denx.de>, Peter Robinson <pbrobinson@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 03, 2022 at 09:35:14AM -0300, Fabio Estevam wrote:
> Hi Laurent,
> 
> On Mon, Jan 3, 2022 at 8:48 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> 
> > With the comment from 2/2 taken into account,
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks for the review. I addressed your feedback and sent v2.
> 
> I noticed a problem when removing/inserting the HDMI cable.
> 
> If I boot the board with the HDMI cable connected, then after
> removal/insertion of the HDMI cable, the following
> kernel warning is observed:
> 
> # [   23.201080] ------------[ cut here ]------------
> [   23.207275] WARNING: CPU: 0 PID: 56 at
> drivers/gpu/drm/drm_atomic_helper.c:1514
> drm_atomic_helper_wait_for_vblanks.part.0+0x27c/0x294
> [   23.221469] [CRTC:35:crtc-0] vblank wait timed out
> [   23.226448] Modules linked in:
> [   23.230255] CPU: 0 PID: 56 Comm: kworker/0:3 Not tainted
> 5.15.12-00003-g27f29fb60028 #94
> [   23.238508] Hardware name: Freescale i.MX6 SoloX (Device Tree)
> [   23.244457] Workqueue: events output_poll_execute
> [   23.249377] [<c01118f8>] (unwind_backtrace) from [<c010bde0>]
> (show_stack+0x10/0x14)
> [   23.257316] [<c010bde0>] (show_stack) from [<c0e8d38c>]
> (dump_stack_lvl+0x58/0x70)
> [   23.265059] [<c0e8d38c>] (dump_stack_lvl) from [<c0125e2c>]
> (__warn+0xd8/0x114)
> [   23.272533] [<c0125e2c>] (__warn) from [<c0e87f94>]
> (warn_slowpath_fmt+0x90/0xc4)
> [   23.280166] [<c0e87f94>] (warn_slowpath_fmt) from [<c0707c98>]
> (drm_atomic_helper_wait_for_vblanks.part.0+0x27c/0x294)
> [   23.291054] [<c0707c98>]
> (drm_atomic_helper_wait_for_vblanks.part.0) from [<c07092cc>]
> (drm_atomic_helper_commit_tail_rpm+0x5c/0x6c)
> [   23.303150] [<c07092cc>] (drm_atomic_helper_commit_tail_rpm) from
> [<c0709e44>] (commit_tail+0x9c/0x190)
> [   23.312717] [<c0709e44>] (commit_tail) from [<c070a098>]
> (drm_atomic_helper_commit+0x158/0x18c)
> [   23.321588] [<c070a098>] (drm_atomic_helper_commit) from
> [<c073f4e4>] (drm_client_modeset_commit_atomic+0x238/0x284)
> [   23.332314] [<c073f4e4>] (drm_client_modeset_commit_atomic) from
> [<c073f600>] (drm_client_modeset_commit_locked+0x60/0x1cc)
> [   23.343615] [<c073f600>] (drm_client_modeset_commit_locked) from
> [<c073f790>] (drm_client_modeset_commit+0x24/0x40)
> [   23.354218] [<c073f790>] (drm_client_modeset_commit) from
> [<c071050c>] (__drm_fb_helper_restore_fbdev_mode_unlocked+0x9c/0xc8)
> [   23.365803] [<c071050c>]
> (__drm_fb_helper_restore_fbdev_mode_unlocked) from [<c07105a0>]
> (drm_fb_helper_set_par+0x38/0x68)
> [   23.377015] [<c07105a0>] (drm_fb_helper_set_par) from [<c0710674>]
> (drm_fb_helper_hotplug_event.part.0+0xa4/0xc0)
> [   23.387443] [<c0710674>] (drm_fb_helper_hotplug_event.part.0) from
> [<c073ea80>] (drm_client_dev_hotplug+0x6c/0xb4)
> [   23.397959] [<c073ea80>] (drm_client_dev_hotplug) from [<c06fc5e0>]
> (output_poll_execute+0x200/0x21c)
> [   23.407346] [<c06fc5e0>] (output_poll_execute) from [<c0147f54>]
> (process_one_work+0x298/0x7cc)
> [   23.416224] [<c0147f54>] (process_one_work) from [<c01484b8>]
> (worker_thread+0x30/0x50c)
> [   23.424479] [<c01484b8>] (worker_thread) from [<c015138c>]
> (kthread+0x154/0x17c)
> [   23.432039] [<c015138c>] (kthread) from [<c010011c>]
> (ret_from_fork+0x14/0x38)
> [   23.439413] Exception stack(0xc42a1fb0 to 0xc42a1ff8)
> [   23.444588] 1fa0:                                     00000000
> 00000000 00000000 00000000
> [   23.452888] 1fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [   23.461182] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [   23.468734] irq event stamp: 43775
> [   23.472305] hardirqs last  enabled at (43783): [<c0197408>]
> __up_console_sem+0x50/0x60
> [   23.480785] hardirqs last disabled at (43792): [<c01973f4>]
> __up_console_sem+0x3c/0x60
> [   23.489224] softirqs last  enabled at (43774): [<c010150c>]
> __do_softirq+0x2ec/0x5a4
> [   23.497163] softirqs last disabled at (43747): [<c012efdc>]
> irq_exit+0x18c/0x210
> [   23.505106] ---[ end trace 86572327287ca501 ]---
> 
> I haven't managed to fix this yet, but if you have any suggestions,
> please let me know.
> 
> Thanks,
> 
> Fabio Estevam

Hi Fabio,
If you need some test let me know. Whitch filesystem are you using?
In the next days I will investigate on this issue.
Let me know.

Thanks,
Tommaso
