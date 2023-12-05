Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A65E80447A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 03:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600E510E455;
	Tue,  5 Dec 2023 02:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1918710E0EA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 02:09:21 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40bd5eaa66cso38025905e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 18:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701742159; x=1702346959; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6tkfVMMH7EG+IsazOhKeHF/dbcjSeopax9dLA1+9Bmo=;
 b=exklISQYMu3gM2PEiUK0a9YnGmIqA9jHtg5dxdzuhicpM/lJ146xYFoSeHtI5L08dT
 iLTxTu67lf3SEDkDG6dSVviMxxUhonWtKFXmxY4CjdQMnvHoCvLth4/r2er80faWLgq5
 6+ztQwpWDqQRWYkLhwOmFlacjtbaUaBBlFHC3B9G3nbeu2v6/x7gZwOnJDtc+tY8cJg7
 gVKpaqpFPDt9znxSFBdKwaaVNI90I4yf4b1r55lxwZMQKXdvBjslrTnDaNck9vVNAypB
 G6hgeEpuxmpSGOm+OKZzecNiZjUuv0EWlw6EMlx1CH4qRJeXYrD0V0+uwTgXsHRpNAgh
 irnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701742159; x=1702346959;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6tkfVMMH7EG+IsazOhKeHF/dbcjSeopax9dLA1+9Bmo=;
 b=ioS3iRo0qOKMZzajg9QCf5J+tSNlNdnZL1WuaAC8El9ot2IvYjISeurcaOo5uM5ABe
 SxuJYblcHPeSH0WnPq0efzqqtjQlurJmCfXlZpgR0GpTYgrbKjbmTlKDoSIi2U3Jt8DB
 Tk4QapyhlWPanXCwB6w4H1uLE1b/rzZsk5NrmKGnXNZUB6ZOXPj9gRcsLcIcgYvWP41V
 neZNgvqoST5c2+Fi8OireU1G3NiXIoq+leVn9Y5/WRaZ0I6DdgZ853iWnS3fuo/hakuM
 8CiS2N1dK6Sky7LEvTi8l5WxVNHR2NFEsrUbd26kQ0UNBvLv53RWWAzkzzsqTCX9WoUM
 +IkA==
X-Gm-Message-State: AOJu0YwdDxl8HwBem2l/qCRtHP3R0zs1Ha+Kv1LkdGi11yYyLHK3bUPa
 au+0lss5Xe0adFTLK26S2/zoOWO/ZAK6g1A4eJlSS469
X-Google-Smtp-Source: AGHT+IGgKoxBH3I4Cw1WiROjwXhE9e3w5e2ku79827stY9tKghjtBsUtw7dHw/UOQ1MDeSMHdRf7nkxeXKB0qycpvN8=
X-Received: by 2002:a05:600c:4fc6:b0:40b:4aa9:91a9 with SMTP id
 o6-20020a05600c4fc600b0040b4aa991a9mr40853wmq.8.1701742159154; Mon, 04 Dec
 2023 18:09:19 -0800 (PST)
MIME-Version: 1.0
References: <bug-218221-2300@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218221-2300@https.bugzilla.kernel.org/>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 5 Dec 2023 12:09:07 +1000
Message-ID: <CAPM=9tyrXDnOGezBwUexh7OEhz_bUiwdH2VEssQ-a=_6a597EQ@mail.gmail.com>
Subject: Re: [Bug 218221] New: Nouveau GSP fail on command cli:0xc1d0000
To: bugzilla-daemon@kernel.org
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Can't remember my bz, but all those errors are fine, I've sent patches
to clean them up so we don't report them in dmesg anymore.

On Tue, 5 Dec 2023 at 01:12, <bugzilla-daemon@kernel.org> wrote:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=218221
>
>             Bug ID: 218221
>            Summary: Nouveau GSP fail on command cli:0xc1d0000
>            Product: Drivers
>            Version: 2.5
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P3
>          Component: Video(DRI - non Intel)
>           Assignee: drivers_video-dri@kernel-bugs.osdl.org
>           Reporter: mmarc471@gmail.com
>         Regression: No
>
> Running Linux 6.7.0-rc3 on Gentoo Linux
>
> I'm using a 3070(laptop) with the command line argument
> nouveau.config=NvGspRm=1
>
> I have confirmed that the Gsp firmware in present in my system, and I'm running
> mesa 23.3.0
>
> This should allow the nouveau kernel driver to call the GSP firmware for tasks
> such as reclocking.
>
> As my system is a laptop my main GPU is an integrated radeon gpu so starting
> Xorg doesn't require nouveau to work.
>
> Once X11 is started I can try to launch vulkan applications which causes the
> following errors to appear in the kernel log.
>
> > dmesg
> [   17.007772] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 res:0x0
> resp:0x0
> [   17.010650] nouveau 0000:01:00.0: gsp:msg fn:4108 len:0x38/0x18 res:0x0
> resp:0x0
> [   17.010945] nouveau 0000:01:00.0: gsp:msg fn:4108 len:0x40/0x20 res:0x0
> resp:0x0
> [15217.991692] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15217.992913] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15217.994155] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15217.995408] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15217.996738] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15217.997859] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15217.999154] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.000392] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.001799] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.003055] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.004271] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.005615] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.007023] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.008281] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.009543] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.010843] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.012054] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.013295] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.014570] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.015841] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.017084] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.018206] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.019532] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.020804] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.022064] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.023324] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.024644] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.025870] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.027143] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.028388] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.029801] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
> [15218.031055] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl
> cmd:0x00731341 failed: 0x0000ffff
>
> Running ZINK also inform me that DRI3 is not available.
>
> > MESA_LOADER_DRIVER_OVERRIDE=zink glxgears
> WARNING: NVK is not a conformant Vulkan implementation, testing use only.
> ac_compute_device_uuid's output is based on invalid pci bus info.
> DRI3 not available
> failed to load driver: zink
> Error: couldn't get an RGB, Double-buffered visual
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You are watching the assignee of the bug.
