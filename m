Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A88620B2AA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 15:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0886EC98;
	Fri, 26 Jun 2020 13:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F356EC98
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 13:40:32 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id k6so4202236oij.11
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b4PEYReGfRMVpHayVETQt1LFJugGn393ubvvc6XcT/s=;
 b=KsF2cEagdSyhWK0VSGHz2xxqISuBQIe+nuhdCDNjH3Q637Cwit4yqEpMR1fJJwAUy6
 xV8FePSt2m3j0pvxKXaNW99hiMZdKpQzGx+NVmNCSSfGdVNYtFa4hyF/9OoDvp80PzPX
 LuOjSCur1JLHL8Cj2brA5EDCoaVbLBCvzF93g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b4PEYReGfRMVpHayVETQt1LFJugGn393ubvvc6XcT/s=;
 b=neS6UPigFRrQfIv3+t9ViMog5TVMkkei2iCGk0PBCH8ujJreKh92olSxIiR8D26pBL
 Z3cCIzHhitPU/6UEQtnBzmLbTkn1kuZgTFJotY3tprkiDguyRVzhq6sd9Qz+j2gFmrmS
 JbQbElQjYWsZQl0FYVhOa9GLI4UilptNnUWDNtHwuwltp+bkBQo2EucyQirmjRSd9Zcv
 CCr6sk3+PXmhPrrpDBRalL2j8Tfh8aKVQI/PBd9vDL9UOqbdVl0sx2juAzDcrmtTsE4F
 2wd6fBssJgmXpVOvvYPNjzQX/GNzS9kEVCdjqztUqlkGjaO9XPKQFF5YGlSJLbzasx+E
 gqQg==
X-Gm-Message-State: AOAM532QfKJvwJeUqxibleW8vkcgcaerktVvvYiLp9rEGXoTLZM7oYzq
 1VU+U0psp1V0UkRiUKkndiMCi2Pa6pgf8e4GCOzXIg==
X-Google-Smtp-Source: ABdhPJzAJmYbXGqJLhOjEkH94g3fh+YvbL06WHRznI/0GEGTw1OLo0dbaYVPo7lPkkVKrIKIaYtgi1rxO+33PFGX/Sc=
X-Received: by 2002:aca:bc06:: with SMTP id m6mr2276651oif.101.1593178831961; 
 Fri, 26 Jun 2020 06:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200625102221.GA66817@suse.de>
In-Reply-To: <20200625102221.GA66817@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 26 Jun 2020 15:40:20 +0200
Message-ID: <CAKMK7uECFfCTZc2wihY4ztZ0WiKR6foUEv2ScbJ79bqt6YQELQ@mail.gmail.com>
Subject: Re: Warning triggered in drm_dp_delayed_destroy_work workqueue
To: Luis Henriques <lhenriques@suse.de>, Lyude <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding Lyude, she's been revamping all the lifetime refcouting in the
dp code last few kernel releases. At a glance I don't even have an
idea what's going wrong here ...
-Daniel

On Thu, Jun 25, 2020 at 12:22 PM Luis Henriques <lhenriques@suse.de> wrote:
>
> Hi!
>
> I've been seeing this warning occasionally, not sure if it has been
> reported yet.  It's not a regression as I remember seeing it in, at least,
> 5.7.
>
> Anyway, here it is:
>
> ------------[ cut here ]------------
> sysfs group 'power' not found for kobject 'i2c-7'
> WARNING: CPU: 1 PID: 17996 at fs/sysfs/group.c:279 sysfs_remove_group+0x74/0x80
> Modules linked in: ccm(E) dell_rbtn(E) iwlmvm(E) mei_wdt(E) mac80211(E) libarc4(E) uvcvideo(E) dell_laptop(E) videobuf2_vmalloc(E) intel_rapl_>
>  soundcore(E) intel_soc_dts_iosf(E) rng_core(E) battery(E) acpi_pad(E) sparse_keymap(E) acpi_thermal_rel(E) intel_pch_thermal(E) int3402_therm>
>  sysfillrect(E) intel_lpss(E) sysimgblt(E) fb_sys_fops(E) idma64(E) scsi_mod(E) virt_dma(E) mfd_core(E) drm(E) fan(E) thermal(E) i2c_hid(E) hi>
> CPU: 1 PID: 17996 Comm: kworker/1:1 Tainted: G            E     5.8.0-rc2+ #36
> Hardware name: Dell Inc. Precision 5510/0N8J4R, BIOS 1.14.2 05/25/2020
> Workqueue: events drm_dp_delayed_destroy_work [drm_kms_helper]
> RIP: 0010:sysfs_remove_group+0x74/0x80
> Code: ff 5b 48 89 ef 5d 41 5c e9 79 bc ff ff 48 89 ef e8 01 b8 ff ff eb cc 49 8b 14 24 48 8b 33 48 c7 c7 90 ac 8b 93 e8 de b1 d4 ff <0f> 0b 5b>
> RSP: 0000:ffffb12d40c13c38 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: ffffffff936e6a60 RCX: 0000000000000027
> RDX: 0000000000000027 RSI: 0000000000000086 RDI: ffff8e37de097b68
> RBP: 0000000000000000 R08: ffff8e37de097b60 R09: ffffffff93fb4624
> R10: 0000000000000904 R11: 000000000001002c R12: ffff8e37d3081c18
> R13: ffff8e375f1450a8 R14: 0000000000000000 R15: ffff8e375f145410
> FS:  0000000000000000(0000) GS:ffff8e37de080000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 00000004ab20a001 CR4: 00000000003606e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  device_del+0x97/0x3f0
>  cdev_device_del+0x15/0x30
>  put_i2c_dev+0x7b/0x90 [i2c_dev]
>  i2cdev_detach_adapter+0x33/0x60 [i2c_dev]
>  notifier_call_chain+0x47/0x70
>  blocking_notifier_call_chain+0x3d/0x60
>  device_del+0x8f/0x3f0
>  device_unregister+0x16/0x60
>  i2c_del_adapter+0x247/0x300
>  drm_dp_port_set_pdt+0x90/0x2c0 [drm_kms_helper]
>  drm_dp_delayed_destroy_work+0x2be/0x340 [drm_kms_helper]
>  process_one_work+0x1ae/0x370
>  worker_thread+0x50/0x3a0
>  ? process_one_work+0x370/0x370
>  kthread+0x11b/0x140
>  ? kthread_associate_blkcg+0x90/0x90
>  ret_from_fork+0x22/0x30
> ---[ end trace 16486ad3c2627482 ]---
> ------------[ cut here ]------------
>
> Cheers,
> --
> Luis



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
