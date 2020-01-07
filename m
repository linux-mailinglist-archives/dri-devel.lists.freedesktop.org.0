Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43730132A63
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 16:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397726E0F1;
	Tue,  7 Jan 2020 15:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5B26E0F1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 15:47:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q10so15550301wrm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 07:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=AKH9iM1/iG8zWx2xNV+zLPV8iovcpOyyXJoSIxqdbRk=;
 b=VcnYI9AkDcSpvZxqfakPF0VUIvVs6cdZjxpLiY4QgG7rkRNj1VtVjcVLvPw+ALUCoo
 gzKrXcOFdzaWRY7NS4FOUS6Sk3iQfoxdSNFA/KyV+fKOHLMQUaEIUttgA/eyGEqPGN4E
 ONMSnAN3TjRTrvBXa+e9K9twu69SAs/P43wss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=AKH9iM1/iG8zWx2xNV+zLPV8iovcpOyyXJoSIxqdbRk=;
 b=cnvO0kjUlwAYz0pk+GhAZ4ekHTxMGGuNdUY3/xs6ClX8DQcF0TU78e0BSheli+SZYt
 boewiQzsZKFlpjFW8Y8H4THpAfNajpuWasuK96CCmxKfQTvhLTxaJhANEiCtfIuWTqiD
 hJZ/X74/MniGiiX3jtuVhW62xs8A+RIFMPKQIqC5pPLC0MPJqosAk9HRHgwkGR41N1x3
 CpZiTvDyP0/JbISJXhepzMWRUaQoXRHKy45s9g//9Ajvsa9hRuApKdph4wzinGnHvkAX
 aThn0kFQN/9LX1Tu7bMw+f7T9F0ENlIQyx9KWEWcIAGoaVOtoqg/XOujE8BEv78po32u
 2s0A==
X-Gm-Message-State: APjAAAX7zrgbj6+PLQMfBIja38T11WoB0E0SBDJCiYq+cFpiMoeOIIeC
 GLhxim/awau+LwDvaHJ2g2yOrQ==
X-Google-Smtp-Source: APXvYqzD68uooO7ZcoDZN1tshuC4uGYDnvSgRZJxqX3p24va63g3pm/AWE8wq12cU/IU5J8Nos3Kbw==
X-Received: by 2002:adf:f10a:: with SMTP id
 r10mr109349448wro.202.1578412078158; 
 Tue, 07 Jan 2020 07:47:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id z187sm39236wme.16.2020.01.07.07.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 07:47:57 -0800 (PST)
Date: Tue, 7 Jan 2020 16:47:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: syzbot <syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com>
Subject: Re: INFO: task hung in fb_release
Message-ID: <20200107154755.GB43062@phenom.ffwll.local>
Mail-Followup-To: syzbot
 <syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com>, 
 Rex.Zhu@amd.com, airlied@linux.ie, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, b.zolnierkie@samsung.com,
 christian.koenig@amd.com, david1.zhou@amd.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 sam@ravnborg.org, syzkaller-bugs@googlegroups.com
References: <00000000000082b80f059a56da1f@google.com>
 <0000000000002074ef059a5c86e2@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0000000000002074ef059a5c86e2@google.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: linux-fbdev@vger.kernel.org, sam@ravnborg.org, b.zolnierkie@samsung.com,
 airlied@linux.ie, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, syzkaller-bugs@googlegroups.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, Rex.Zhu@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 23, 2019 at 02:31:01AM -0800, syzbot wrote:
> syzbot has bisected this bug to:
> 
> commit e3933f26b657c341055443103bad331f4537b113
> Author: Rex Zhu <Rex.Zhu@amd.com>
> Date:   Tue Jan 16 10:35:15 2018 +0000
> 
>     drm/amd/pp: Add edit/commit/show OD clock/voltage support in sysfs

Pretty sure you don't even have that driver loaded ... from the config:

# CONFIG_DRM_AMDGPU is not set

:-)

Cheers, Daniel
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12b5a799e00000
> start commit:   c6017471 Merge tag 'xfs-5.5-fixes-2' of git://git.kernel.o..
> git tree:       upstream
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=11b5a799e00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=16b5a799e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7f6119e2e3675a73
> dashboard link: https://syzkaller.appspot.com/bug?extid=d130c4a0890561cfac5b
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169b1925e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b9623ee00000
> 
> Reported-by: syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com
> Fixes: e3933f26b657 ("drm/amd/pp: Add edit/commit/show OD clock/voltage
> support in sysfs")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
